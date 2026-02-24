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

### What the Script Does

The `first-install.sh` script performs the following steps:

1. **Validates prerequisites** — Checks that you're running as a normal user with sudo privileges on NixOS, and that `/etc/nixos` is a git repository
2. **Regenerates hardware configuration** — Runs `nixos-generate-config` to create a fresh `hardware-configuration.nix` matching your current hardware
3. **Sets up Home Manager** — Creates the `~/.config/home-manager/` directory and symlinks `home.nix` into it
4. **Applies NixOS configuration** — Runs `nixos-rebuild switch` with the flake for your hostname
5. **Applies Home Manager configuration** — Runs `home-manager switch` with the flake for your user

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

