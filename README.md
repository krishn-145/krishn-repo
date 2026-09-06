# 🔵 KRISHN Termux APT Repository

A simple GitHub-hosted APT repository for distributing custom Termux `.deb` packages.

## ✨ Features

- GitHub Pages hosted APT repository
- Automatic repository generation with GitHub Actions
- Add multiple `.deb` tools through the `debs/` folder
- One-command repository setup for users
- Colorful KRISHN installer banner
- Quiet package installation output
- Supports package installation by name

## 📁 Repository layout

```text
krishn-repo/
├── .github/
│   └── workflows/
│       └── pages.yml
├── debs/
│   └── krishn.deb
├── scripts/
│   └── add-tool.sh
├── install.sh
├── index.html
└── README.md
```

## 🚀 Publish a tool

Put a valid Termux `.deb` package inside:

```text
debs/
```

For example:

```text
debs/krishn.deb
debs/digai.deb
debs/venom.deb
```

Commit and push:

```bash
git add .
git commit -m "Add packages"
git push
```

GitHub Actions will build the APT metadata and publish the repository through GitHub Pages.

## 📲 User installation

After GitHub Pages is enabled:

```bash
curl -fsSL https://krishn-145.github.io/krishn-repo/install.sh | bash
```

Then users can install packages by name:

```bash
pkg install krishn
```

For additional packages:

```bash
pkg install digai
pkg install venom
```

The package names must match the actual `Package:` field inside each `.deb`.

## 🌐 Links

- GitHub: https://github.com/krishn-145
- Repository: https://github.com/krishn-145/krishn-repo
- Telegram: https://t.me/krishn18

## ⚠️ Important

Only distribute software that you own or are authorized to distribute. Do not upload private keys, passwords, GitHub tokens, or other secrets.

For production distribution, use a properly signed APT repository rather than relying on `[trusted=yes]`.

## 👤 Author

**HARI / KRISHN**

Telegram: **@krishn18**
