{ config, pkgs, lib, ... }:

{
  imports = [
    ./starship.nix
    ./nixvim.nix
  ];

  home.username = "jeroen";
  home.homeDirectory = "/home/jeroen";
  home.stateVersion = "25.11";

  nixpkgs.config.allowUnfree = true;

  programs.bash = {
    enable = true;
    initExtra = ''
      fastfetch
      if ! command -v rustc &>/dev/null; then
        echo -e "\e[1;31m⚠ Rust is not installed! Run: rustup toolchain install stable\e[0m"
      fi
      shopt -s histappend
      bind '"\e[A": history-search-backward'
      bind '"\e[B": history-search-forward'
      PROMPT_COMMAND="history -a; history -n; ''${PROMPT_COMMAND}"
      export PATH="/home/jeroen/local/bin:$PATH";
    '';
    shellAliases = {
      hconf = "nvim /home/jeroen/.config/home-manager/home.nix";
      gconf = "sudo nvim /etc/nixos/configuration.nix";
      gpac = "sudo nvim /etc/nixos/packages.nix";
      hswitch = "home-manager switch --flake /etc/nixos#\${USER}";
      gswitch = "sudo nixos-rebuild switch --flake /etc/nixos#\$(hostname)";
      sudo = "sudo ";
      vi = "nvim ";
      gnpch = "get-nix-pkg-commit-hash ";
      flake = "sudo nvim /etc/nixos/flake.nix";
      flup = "sudo nix flake update --flake /etc/nixos";
      nxs = "nix search nixpkgs ";
      flist = "nix-store -q --references /run/current-system/sw | sed 's/\\/nix\\/store\\/[a-z0-9]*-//' | sort";

    };
  };

#  programs.starship = {
#    enable = true;
#    enableBashIntegration = true;
#    settings = {
#      add_newline = true;
#  
#      format = lib.concatStrings [
#        "$directory"
#        "$git_branch"
#        "$git_status"
#        "$rust"
#        "$c"
#        "$golang"
#        "$python"
#        "$lua"
#        "$java"
#        "$maven"
#        "$docker_context"
#        "$nix_shell"
#        "$line_break"
#        "$character"
#      ];
#
#  
#      directory = {
#        truncation_length = 3;
#        truncate_to_repo = true;
#      };
#  
#      git_branch = {
#        symbol = " ";
#        format = "[$symbol$branch]($style) ";
#      };
#      git_status = {
#        format = "([$all_status$ahead_behind]($style) )";
#        ahead = "⇡\${count}";
#        behind = "⇣\${count}";
#        diverged = "⇕⇡\${ahead_count}⇣\${behind_count}";
#        staged = "+\${count}";
#        modified = "!\${count}";
#        untracked = "?\${count}";
#        deleted = "✘\${count}";
#      };
#  
#  
#      nix_shell = {
#        symbol = " ";
#        format = "[$symbol$state]($style) ";
#      };
#  
#      character = {
#        success_symbol = "[❯](bold green)";
#        error_symbol = "[❯](bold red)";
#      };
#    };
#  };

  programs.git = {
    enable = true;
    settings.user.name = "jeroen";
    settings.user.email = "jeroen.vanrenterghem@student.hogent.be";
    settings = {
      init.defaultBranch = "main";
      core.ignorecase = "false";
      rebase.autoStash = "true";
      pull.rebase = "true";
      # windows only
      # core.autocrlf = "true";
      push.default = "simple";
    };
  };

  home.file.".config/ghostty/config".text = ''
    shell-integration = bash 
    font-family = JetBrainsMono Nerd Font
    theme = Dracula
    mouse-hide-while-typing = true
    scrollback-limit = 100000000
    gtk-single-instance = false

    
    keybind = ctrl+n=new_window
    
    keybind = ctrl+h=goto_split:left
    keybind = ctrl+j=goto_split:bottom
    keybind = ctrl+k=goto_split:top
    keybind = ctrl+l=goto_split:right
    
    keybind = ctrl+a>h=new_split:left
    keybind = ctrl+a>j=new_split:down
    keybind = ctrl+a>k=new_split:up
    keybind = ctrl+a>l=new_split:right
    keybind = ctrl+a>f=toggle_split_zoom
    
    keybind = ctrl+a>n=next_tab
    keybind = ctrl+a>p=previous_tab
    
    keybind = super+r=reload_config
    
    window-save-state = always
    background-opacity = 0.95

  '';


}
