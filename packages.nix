{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # dev
    gcc
    clang
    go
    ninja
    rustup
    zig
    gnumake
    cmake
    just
    jdk21
    maven

    # cli tools
    bat
    fastfetch
    curl
    git
    wget
    jq
    xq
    uv
    ruff
    glow
    gitui
    fzf

    # productivity
    wl-clipboard
    neovim
    google-chrome
    ghostty
    vscode
    home-manager
    duckdb
    thunderbird
    jetbrains.idea
    vlc
    gimp
    discord


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

    # exoticness
    (pkgs.callPackage ./pkgs/visual-paradigm.nix {})
    (pkgs.callPackage ./pkgs/packet-tracer.nix {})



  ];
}
