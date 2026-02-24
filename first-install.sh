#!/usr/bin/env bash
#
# NixOS Configuration First-Time Installation Script
# Clones the configuration repo and applies the NixOS + Home Manager setup
#

set -euo pipefail

# Configuration
REPO_URL="https://github.com/mtdig/nixos-cfg.git"
NIXOS_DIR="/etc/nixos"
HOME_MANAGER_DIR="${HOME}/.config/home-manager"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RESET='\033[0m'

log_info() {
    echo -e "${GREEN}[INFO]${RESET} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${RESET} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${RESET} $1" >&2
}

die() {
    log_error "$1"
    exit 1
}

# Check if running as root (we need sudo, not direct root)
check_prerequisites() {
    if [[ $EUID -eq 0 ]]; then
        die "Do not run this script as root. Run as a normal user with sudo privileges."
    fi

    if ! command -v git &> /dev/null; then
        die "git is not installed. Run: nix-shell -p git"
    fi

    if ! command -v nixos-rebuild &> /dev/null; then
        die "nixos-rebuild not found. Are you running this on NixOS?"
    fi

    if ! sudo -v &> /dev/null; then
        die "Cannot obtain sudo privileges."
    fi
}

# Backup existing configuration
backup_existing() {
    if [[ -d "${NIXOS_DIR}" ]] && [[ "$(ls -A ${NIXOS_DIR})" ]]; then
        local backup_dir="${NIXOS_DIR}.backup.$(date +%Y%m%d_%H%M%S)"
        log_warn "Existing configuration found. Backing up to ${backup_dir}"
        sudo cp -r "${NIXOS_DIR}" "${backup_dir}"
    fi
}

# Clone the repository
clone_repo() {
    log_info "Cleaning up existing .nix files..."
    sudo rm -f "${NIXOS_DIR}"/*.nix

    if [[ -d "${NIXOS_DIR}/.git" ]]; then
        log_info "Git repo already exists, pulling latest changes..."
        cd "${NIXOS_DIR}"
        sudo git pull --ff-only || die "Failed to pull latest changes"
    else
        log_info "Cloning configuration repository..."
        # Remove everything except hardware-configuration.nix if it's a fresh install
        sudo rm -rf "${NIXOS_DIR}"
        sudo git clone "${REPO_URL}" "${NIXOS_DIR}" || die "Failed to clone repository"
    fi
}

# Setup home-manager symlink
setup_home_manager() {
    log_info "Setting up Home Manager configuration..."
    mkdir -p "${HOME_MANAGER_DIR}"

    if [[ -L "${HOME_MANAGER_DIR}/home.nix" ]]; then
        log_warn "Removing existing home.nix symlink"
        rm -f "${HOME_MANAGER_DIR}/home.nix"
    elif [[ -f "${HOME_MANAGER_DIR}/home.nix" ]]; then
        log_warn "Backing up existing home.nix"
        mv "${HOME_MANAGER_DIR}/home.nix" "${HOME_MANAGER_DIR}/home.nix.backup"
    fi

    ln -s "${NIXOS_DIR}/home.nix" "${HOME_MANAGER_DIR}/home.nix"
}

# Apply NixOS configuration
apply_nixos() {
    local hostname
    hostname=$(hostname)
    log_info "Applying NixOS configuration for host: ${hostname}"
    sudo nixos-rebuild switch --flake "${NIXOS_DIR}#${hostname}" || die "NixOS rebuild failed"
}

# Fix ownership and apply home-manager
finalize() {
    log_info "Setting ownership of ${NIXOS_DIR} to ${USER}..."
    sudo chown -R "${USER}:$(id -gn)" "${NIXOS_DIR}"

    log_info "Applying Home Manager configuration for user: ${USER}"
    home-manager switch --flake "${NIXOS_DIR}#${USER}" || die "Home Manager switch failed"
}

main() {
    echo ""
    echo "=========================================="
    echo "  NixOS Configuration Installation Script"
    echo "=========================================="
    echo ""

    log_info "Starting installation..."

    check_prerequisites
    backup_existing
    clone_repo
    setup_home_manager
    apply_nixos
    finalize

    echo ""
    log_info "Installation complete! You may need to log out and back in for all changes to take effect."
}

main "$@"
