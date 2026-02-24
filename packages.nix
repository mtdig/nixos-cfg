{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # dev
    clang
    cmake
    file
    gcc
    gnumake
    go
    jdk21
    just
    maven
    ninja
    rustup
    xxd
    zig

    # cli tools
    bat
    curl
    fastfetch
    fzf
    git
    git-cliff
    gitui
    glow
    jq
    navi
    ncdu
    ripgrep
    ruff
    starship
    tree
    unzip
    uv
    wget
    wp-cli
    xq
    zip

    # productivity
    dbeaver-bin
    discord
    duckdb
    ghostty
    gimp
    google-chrome
    home-manager
    jetbrains.idea
    kicad
    mysql-workbench
    obs-studio
    rpi-imager
    scenebuilder
    slack
    thunderbird
    vlc
    wl-clipboard

    # perf
    btop
    gdb
    glances
    htop
    stress-ng

    # hw / sys
    lsof
    pciutils
    procps
    rsync
    usbutils
    util-linux

    # network
    dig
    inetutils
    iproute2
    nettools
    nmap
    tcpdump

    # cloud
    ansible
    awscli2
    helm
    ibmcloud-cli
    kubectl
    terraform

    # virtualisation
    spice-gtk
    virt-viewer
    virtio-win

    # win
    freerdp
    powershell
    remmina

    # exoticness
    (pkgs.callPackage ./pkgs/visual-paradigm.nix { })
    (pkgs.callPackage ./pkgs/packet-tracer.nix { })

    # 3d printing
    (pkgs.callPackage ./pkgs/bambu-studio-appimage.nix { })
    openscad-unstable

    # user
    nerd-fonts.jetbrains-mono

  ];
}
