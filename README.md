# KRISHN Termux APT Repository

Upload the contents of this folder to the **main** branch of `Krishn-145/krishn-repo`.

## Packages

- `krishn` — local KRISHN utility
- `digai` — launcher package for the DIGAI project
- `venom` — launcher package for the VENOM project

## One-command setup

```bash
curl -fsSL https://krishn-145.github.io/krishn-repo/install.sh | bash
```

The installer adds the repository and attempts to install all three packages.

## Individual install

```bash
pkg install krishn
pkg install digai
pkg install venom
```

> Remove the stray `a` if copied accidentally; the actual commands are the three `pkg install` lines above.

DIGAI and VENOM wrappers fetch their upstream runtime from the GitHub repositories on first launch. Internet access is required.

VENOM is intended only for APKs you are authorized to protect or test.
