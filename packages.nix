{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # dev
    file
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
    git-cliff
    starship
    tree
    ncdu
    navi
    ripgrep
    unzip
    zip


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
    mysql-workbench
    dbeaver-bin


    # perf
    gdb
    stress-ng
    btop
    htop
    glances

    # hw / sys
    usbutils
    pciutils
    rsync
    lsof
    util-linux
    procps


    # network
    tcpdump
    inetutils
    dig
    nmap
    nettools
    iproute2


    # cloud
    kubectl
    helm
    ansible
    awscli2
    terraform
    ibmcloud-cli

    # win
    remmina
    freerdp
    powershell

    # exoticness
    (pkgs.callPackage ./pkgs/visual-paradigm.nix {})
    (pkgs.callPackage ./pkgs/packet-tracer.nix {})



  ];
}
