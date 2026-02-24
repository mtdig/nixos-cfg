# NixOS config

## Introduction

Keeping both system wide config and my user config together.  Not ideal, but it's the Belgian compromise for a single-user system.

## First-Time Installation

### Prerequisites

You need `git` available. On a fresh NixOS install:
```bash
nix-shell -p git
```

### Setup Steps

1. **Backup and remove existing configuration:**
   ```bash
   sudo mv /etc/nixos /etc/nixos.backup
   ```

2. **Clone this repository:**
   ```bash
   sudo git clone https://github.com/mtdig/nixos-cfg.git /etc/nixos
   ```

3. **Take ownership of the config directory:**
   ```bash
   sudo chown -R $USER:$(id -gn) /etc/nixos
   ```

4. **Run the installation script:**
   ```bash
   cd /etc/nixos
   ./first-install.sh
   ```

5. **Log out and back in** for all changes to take effect.

## Config

- [x] reproducible automated builds, every time
- [x] reproducible settings (git, vim, ..)
- [x] pinned virtualbox (flakes, not channels)
- [x] add starship (not happy with theme yet)
- [x] add neovim config -> switch to nixvim (lazyvim issues)
- [x] can't remove hardware-configuration.nix from git, needs to be tracked (regenerate and overwrite with `nixos-generate-config --force`)
- [x] vscode minimal config
- [x] add bambu studio as appimage, issue [nixpkgs#440951](https://github.com/nixos/nixpkgs/issues/440951)
- [x] add esp32 IDF framework and toolchains for c and rust

