# Homebrew tap

Install [Blindspot](https://github.com/kitanovicd/blindspot), a mutation coverage tool for Foundry:

```sh
brew install kitanovicd/tap/blindspot
blindspot setup
```

Requires [Foundry](https://getfoundry.sh/) (`forge` on your PATH). Supports macOS Apple Silicon/Intel and Linux x86-64. Homebrew verifies and installs the published binary, so Go is not required.

From a Foundry project:

```sh
blindspot run --limit 5 --open
```

To update:

```sh
brew update
brew upgrade blindspot
```

To uninstall:

```sh
brew uninstall blindspot
```

Saved project reports and the Gambit cache are kept. See the [usage guide](https://github.com/kitanovicd/blindspot/blob/main/docs/usage.md) for more options.

## Maintaining the formula

After publishing a Blindspot release, update its version and checksums from the release metadata:

```sh
python3 scripts/update.py v0.1.0
```

Review and push the formula change, then verify it with `brew update`, `brew upgrade blindspot`, and `blindspot version`. The updater only accepts stable version tags and checks every platform checksum against GitHub's asset digest.
