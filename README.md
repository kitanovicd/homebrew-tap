# Homebrew tap

Install [Blindspot](https://github.com/kitanovicd/blindspot), a mutation coverage tool for Foundry:

```sh
brew install kitanovicd/tap/blindspot
```

Requires [Foundry](https://getfoundry.sh/) (`forge` on your PATH). Supports macOS Apple Silicon/Intel and Linux x86-64. Homebrew verifies and installs the published binary, so Go is not required.

Open the menu:

```sh
blindspot
```

Choose to run mutation tests, free up disk space, or browse saved reports. Guided runs ask for your project and setup commands, and whether to keep replay files. Gambit is installed automatically when needed. For an already prepared project, use `blindspot run --limit 5 --open`.

Runs, reports, settings, and new managed tools are stored in `~/.blindspot/`. The report browser and cleanup command only use that folder; they do not scan personal or project directories.

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

The updater only accepts stable version tags and checks every platform checksum against GitHub's asset digest. It removes old bottle metadata when the version changes.

Review, commit, and push the formula change, then run **Publish bottles** in GitHub Actions with the same version, or use:

```sh
gh workflow run bottles.yml -f version=v0.1.0
```

The workflow packages the verified binary on macOS Apple Silicon, macOS Intel, and Linux x86-64. It publishes Homebrew bottles and commits their checksums to the formula. Bottles let users install without a local build step. Verify the published package with `brew update`, `brew upgrade blindspot`, and `blindspot version`.
