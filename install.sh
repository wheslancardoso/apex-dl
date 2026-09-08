#!/usr/bin/env bash
# ==============================================================================
# 🎬 APEX-DL • Universal Stream & Media Cockpit Installer
# https://github.com/wheslancardoso/apex-dl
# ==============================================================================

set -e

# Catppuccin Mocha Colors
MAUVE='\033[38;2;203;166;247m'
BLUE='\033[38;2;137;180;250m'
GREEN='\033[38;2;166;227;161m'
PEACH='\033[38;2;250;179;135m'
YELLOW='\033[38;2;249;226;175m'
RED='\033[38;2;243;139;168m'
BOLD='\033[1m'
NC='\033[0m'

echo -e "\n${MAUVE}${BOLD}╭───────────────────────────────────────────────────────────────╮${NC}"
echo -e "${MAUVE}${BOLD}│   🎬 APEX-DL • Universal Media & Streaming Suite Installer    │${NC}"
echo -e "${MAUVE}${BOLD}╰───────────────────────────────────────────────────────────────╯${NC}\n"

INSTALL_DIR="$HOME/.local/share/apex-dl"
BIN_DIR="$HOME/.local/bin"
mkdir -p "$BIN_DIR"

# 1. Determina se estamos dentro do repositório clonado ou executando via curl
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" 2>/dev/null && pwd || echo "")"
if [ -f "$SCRIPT_DIR/bin/apex" ]; then
    echo -e "${BLUE}📦 Instalando a partir do repositório local...${NC}"
    mkdir -p "$INSTALL_DIR"
    cp -r "$SCRIPT_DIR/bin" "$INSTALL_DIR/"
    cp -r "$SCRIPT_DIR/lib" "$INSTALL_DIR/"
else
    echo -e "${BLUE}🌐 Clonando repositório oficial do GitHub...${NC}"
    rm -rf "$INSTALL_DIR"
    git clone --depth=1 https://github.com/wheslancardoso/apex-dl.git "$INSTALL_DIR"
fi

# 2. Instala dependências do Extrator Headless Node.js
if [ -d "$INSTALL_DIR/lib/stream-extractor" ]; then
    echo -e "${PEACH}⚙️  Configurando motor de streaming (Node.js & Puppeteer)...${NC}"
    (cd "$INSTALL_DIR/lib/stream-extractor" && npm install --omit=dev --silent >/dev/null 2>&1 || true)
fi

# 3. Cria atalhos em ~/.local/bin
chmod +x "$INSTALL_DIR/bin/apex"
chmod +x "$INSTALL_DIR/lib/stream-extractor/pomfy-extractor.js" 2>/dev/null || true

ln -sfn "$INSTALL_DIR/bin/apex" "$BIN_DIR/apex"
ln -sfn "$INSTALL_DIR/bin/apex" "$BIN_DIR/dl"

echo -e "${GREEN}✔ Binários vinculados com sucesso:${NC}"
echo -e "   • ${BOLD}$BIN_DIR/apex${NC}"
echo -e "   • ${BOLD}$BIN_DIR/dl${NC} (atalho rápido)"

# 4. Verificação de dependências do sistema
echo -e "\n${PEACH}🔍 Verificando motores do sistema...${NC}"
MISSING=()
for cmd in yt-dlp aria2c ffmpeg fzf jq chafa node spotdl gallery-dl imv; do
    if command -v "$cmd" >/dev/null 2>&1; then
        echo -e "  ${GREEN}✔${NC} $cmd"
    else
        echo -e "  ${YELLOW}⚠️  $cmd (não encontrado)${NC}"
        MISSING+=("$cmd")
    fi
done

if [ ${#MISSING[@]} -gt 0 ]; then
    echo -e "\n${YELLOW}Algumas dependências opcionais/recomendadas não foram encontradas:${NC} ${MISSING[*]}"
    if command -v pacman >/dev/null 2>&1; then
        echo -e "${BLUE}No Arch Linux / CachyOS / Manjaro, você pode instalar com:${NC}"
        echo -e "  ${BOLD}sudo pacman -S yt-dlp aria2 ffmpeg fzf jq chafa nodejs npm imv${NC}"
        echo -e "  ${BOLD}yay -S spotdl gallery-dl${NC}"
    fi
fi

# 5. Verifica se ~/.local/bin está no PATH
if [[ ":$PATH:" != *":$BIN_DIR:"* ]]; then
    echo -e "\n${YELLOW}⚠️  Aviso:${NC} $BIN_DIR não está no seu PATH atual."
    echo -e "Adicione a seguinte linha ao seu ~/.zshrc ou ~/.bashrc:"
    echo -e "  ${BOLD}export PATH=\"\$HOME/.local/bin:\$PATH\"${NC}"
fi

echo -e "\n${GREEN}${BOLD}🎉 APEX-DL instalado com sucesso!${NC}"
echo -e "Para começar, digite: ${BOLD}${MAUVE}dl${NC} ou ${BOLD}${MAUVE}apex${NC}\n"
