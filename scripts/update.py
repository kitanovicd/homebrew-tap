#!/usr/bin/env python3
"""Update the formula from an existing public Blindspot release."""

import json
import re
import sys
from pathlib import Path
from urllib.request import Request, urlopen


def download(url):
    request = Request(url, headers={"User-Agent": "blindspot-homebrew"})
    with urlopen(request, timeout=30) as response:
        return response.read().decode("utf-8")


def main():
    if len(sys.argv) != 2 or not re.fullmatch(r"v[0-9]+\.[0-9]+\.[0-9]+", sys.argv[1]):
        raise ValueError("usage: python3 scripts/update.py v0.1.0")
    version = sys.argv[1]
    release = json.loads(download(
        f"https://api.github.com/repos/kitanovicd/blindspot/releases/tags/{version}"
    ))
    if release["draft"] or release["prerelease"] or release["tag_name"] != version:
        raise ValueError("expected a published stable release")
    assets = {asset["name"]: asset for asset in release["assets"]}
    base_url = f"https://github.com/kitanovicd/blindspot/releases/download/{version}/"
    checksums = {}
    for line in download(base_url + "checksums.txt").splitlines():
        checksum, filename = line.split()
        if not re.fullmatch(r"[0-9a-f]{64}", checksum) or filename in checksums:
            raise ValueError("invalid or duplicate release checksum")
        checksums[filename] = checksum

    path = Path(__file__).resolve().parents[1] / "Formula" / "blindspot.rb"
    text, count = re.subn(r'  version "[^"]+"', f'  version "{version[1:]}"', path.read_text())
    if count != 1:
        raise ValueError("expected one formula version")
    for platform in ("darwin_arm64", "darwin_amd64", "linux_amd64"):
        filename = f"blindspot_{platform}.tar.gz"
        checksum = checksums[filename]
        if assets[filename].get("digest") != "sha256:" + checksum:
            raise ValueError(f"release checksum differs from GitHub asset digest: {filename}")
        pattern = (
            r'url "https://github\.com/kitanovicd/blindspot/releases/download/[^"\n]+/'
            + re.escape(filename) + r'"\n( +)sha256 "[0-9a-f]{64}"'
        )
        text, count = re.subn(
            pattern,
            lambda match: f'url "{base_url}{filename}"\n{match[1]}sha256 "{checksum}"',
            text,
        )
        if count != 1:
            raise ValueError(f"expected one formula entry for {platform}")
    path.write_text(text)
    print(f"Updated Blindspot to {version}; review and commit Formula/blindspot.rb.")


if __name__ == "__main__":
    try:
        main()
    except Exception as error:
        sys.exit(f"Error: {error}")
