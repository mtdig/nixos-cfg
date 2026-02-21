{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # dev
    clang
    go
    ninja
    rustup
    zig
    gnumake
    cmake
    just

    # cli tools
    fastfetch
    curl
    git
    wget
    jq
    xq
    uv
    ruff

    # productivity
    wl-clipboard
    neovim
    google-chrome
    ghostty
    vscode
    home-manager
    duckdb
    thunderbird

    # perf
    gdb
    stress-ng
    btop
    htop
    glances

    # network
    tcpdump

    # cloud
    kubectl
    helm
    ansible
    awscli2
    terraform
    ibmcloud-cli

  ];
}
