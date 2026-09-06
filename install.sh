#!/data/data/com.termux/files/usr/bin/bash
set -e

REPO_URL="https://krishn-145.github.io/krishn-repo"
SOURCE_FILE="$PREFIX/etc/apt/sources.list.d/krishn.list"

B='\033[1;34m'; C='\033[1;36m'; G='\033[1;32m'; R='\033[1;31m'
W='\033[1;37m'; X='\033[0m'

clear
printf "${B}"
cat <<'BANNER'
╔════════════════════════════════════════════╗
║                                            ║
║        ██╗  ██╗██████╗ ██╗               ║
║        ██║ ██╔╝██╔══██╗██║               ║
║        █████╔╝ ██████╔╝██║               ║
║        ██╔═██╗ ██╔══██╗██║               ║
║        ██║  ██╗██║  ██║██║               ║
║        ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝               ║
║                                            ║
║              K R I S H N                  ║
║        TERMUX PACKAGE REPOSITORY           ║
║                                            ║
╚════════════════════════════════════════════╝
BANNER
printf "${X}\n"

printf "${C}[•]${W} Connecting Repository...${X}\n"
mkdir -p "$PREFIX/etc/apt/sources.list.d"
printf 'deb [trusted=yes] %s stable main\n' "$REPO_URL" > "$SOURCE_FILE"
printf "${G}[✓]${W} Repository connected${X}\n"

printf "${C}[•]${W} Updating Package Database...${X}\n"
if pkg update -y >/dev/null 2>&1; then
  printf "${G}[✓]${W} Package database updated${X}\n"
else
  printf "${R}[✗]${W} Package database update failed${X}\n"
  exit 1
fi

printf "\n${G}"
cat <<'DONE'
╔════════════════════════════════════════════╗
║                                            ║
║        K R I S H N  R E A D Y             ║
║                                            ║
╚════════════════════════════════════════════╝
DONE
printf "${X}\n"

printf "${C}Install a tool with:${X}\n\n"
printf "${G}  pkg install <tool-name>${X}\n\n"
printf "${C}GitHub:${W} krishn-145${X}\n"
printf "${C}Telegram:${W} @krishn18${X}\n"
