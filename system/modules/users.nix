{ pkgs, ... }:

{
  services.getty.autologinUser = "selrak";

  users.users.selrak = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "video"
      "render"
    ];

    packages = with pkgs; [
      tree
    ];
  };
}

