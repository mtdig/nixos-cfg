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
    xxd


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
    wp-cli



    # productivity
    wl-clipboard
    google-chrome
    ghostty
    home-manager
    duckdb
    thunderbird
    jetbrains.idea
    vlc
    gimp
    discord
    mysql-workbench
    dbeaver-bin
    slack
    scenebuilder
    rpi-imager
    obs-studio
    kicad



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

    # virtualisation
    virt-viewer
    spice-gtk
    virtio-win

    # win
    remmina
    freerdp
    powershell

    # exoticness
    (pkgs.callPackage ./pkgs/visual-paradigm.nix {})
    (pkgs.callPackage ./pkgs/packet-tracer.nix {})

    # 3d printing
    (pkgs.callPackage ./pkgs/bambu-studio-appimage.nix {})
    openscad-unstable

    # user
    nerd-fonts.jetbrains-mono



  ];
}
