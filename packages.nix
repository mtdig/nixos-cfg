{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    clang
    curl
    fastfetch
    ghostty
    git
    go
    google-chrome
    home-manager
    jq
    neovim
    ninja
    rustup
    vscode
    wget
    xq
  ];
}
