{ pkgs, ... }:

{
  services.getty.autologinUser = "selrak";

  users.users.selrak = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "video"
      "render"
      "i2c"
    ];

    packages = with pkgs; [
      tree
    ];
  };
}

