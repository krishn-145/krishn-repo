#!/data/data/com.termux/files/usr/bin/bash
set -e

REPO_DIR="${HOME}/krishn-repo"
DEBS="${REPO_DIR}/debs"

B='\033[1;34m'; C='\033[1;36m'; G='\033[1;32m'; R='\033[1;31m'; X='\033[0m'

clear
echo -e "${B}╔══════════════════════════════════════╗"
echo -e "║          K R I S H N                 ║"
echo -e "║          TOOL PUBLISHER              ║"
echo -e "╚══════════════════════════════════════╝${X}"
echo

mkdir -p "$DEBS"

if [ ! -d "$REPO_DIR/.git" ]; then
  echo -e "${R}[✗] ${REPO_DIR} is not a Git repository.${X}"
  echo "Clone your GitHub repository first:"
  echo "git clone git@github.com:krishn-145/krishn-repo.git ~/krishn-repo"
  exit 1
fi

echo -e "${C}[•]${X} Available packages:"
find "$DEBS" -maxdepth 1 -type f -name '*.deb' -printf '  • %f\n' 2>/dev/null || true
echo

read -rp "Enter .deb path: " FILE
FILE="${FILE/#\~/$HOME}"

if [ ! -f "$FILE" ]; then
  echo -e "${R}[✗] File not found.${X}"
  exit 1
fi

case "$FILE" in
  *.deb) ;;
  *) echo -e "${R}[✗] File must end in .deb${X}"; exit 1 ;;
esac

cp "$FILE" "$DEBS/"
echo -e "${G}[✓]${X} Package copied: $(basename "$FILE")"

cd "$REPO_DIR"
git add debs/
git commit -m "Add $(basename "$FILE")" || true
git push origin main

echo
echo -e "${G}[✓] Package uploaded.${X}"
echo "GitHub Actions will build the APT metadata automatically."
