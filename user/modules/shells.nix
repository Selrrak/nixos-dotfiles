{ ... }:
let
  scriptDir = ../scripts;
  scripts = builtins.attrNames (builtins.readDir scriptDir);
in
{
  programs.bash = {
    enable = true;

    shellAliases = {
      f = "nvim .";
      gti = "git";
      config = "cd ~/nixos-dotfiles/";
      freeze = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#nixos";
      hypr = "uwsm start hyprland-uwsm.desktop";
    };


    initExtra = ''
      PS1='\n\[\033[1;32m\][\u@\h:\w]\$\[\033[0m\] '
      export PATH="$HOME/.local/bin:$PATH"
      nitch
    '';
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.file = builtins.listToAttrs (
    map (script: {
      name = ".local/bin/${script}";
      value = {
        source = "${scriptDir}/${script}";
        executable = true;
      };
    }) scripts
  );
}

