#!/data/data/com.termux/files/usr/bin/bash
set -e
REPO_URL="https://krishn-145.github.io/krishn-repo"
SOURCE_FILE="$PREFIX/etc/apt/sources.list.d/krishn.list"
B='\033[1;34m'; C='\033[1;36m'; G='\033[1;32m'; R='\033[1;31m'; W='\033[1;37m'; Y='\033[1;33m'; X='\033[0m'
clear
printf "${B}"
cat <<'BANNER'
╔════════════════════════════════════════════╗
║              K R I S H N                  ║
║        TERMUX PACKAGE REPOSITORY           ║
╚════════════════════════════════════════════╝
BANNER
printf "${X}\n"
printf "${C}[•]${W} Connecting Repository...${X}\n"
mkdir -p "$PREFIX/etc/apt/sources.list.d"
printf 'deb [trusted=yes] %s stable main\n' "$REPO_URL" > "$SOURCE_FILE"
printf "${G}[✓]${W} Repository connected${X}\n"
printf "${C}[•]${W} Updating Package Database...${X}\n"
if ! apt update -y >/dev/null 2>&1; then
  printf "${R}[✗]${W} Package database update failed.${X}\n"
  rm -f "$SOURCE_FILE"
  exit 1
fi
printf "${G}[✓]${W} Package database updated${X}\n"
printf "${C}[•]${W} Installing KRISHN, DIGAI and VENOM...${X}\n"
if pkg install -y krishn digai venom >/dev/null 2>&1; then
  printf "${G}[✓]${W} All selected tools installed${X}\n"
else
  printf "${Y}[!]${W} Repository connected, but automatic tool installation failed.${X}\n"
  printf "${W}Try: pkg install krishn digai venom${X}\n"
  exit 1
fi
printf "\n${G}KRISHN repository is ready.${X}\n"
printf "${C}Commands:${X} krishn | digai | venom\n"
printf "${C}GitHub:${X} https://github.com/Krishn-145\n"
printf "${C}Telegram:${X} @krishn18\n"
