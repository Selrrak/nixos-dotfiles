{pkgs, ...}:

{

home.packages = with pkgs; [
  everforest-cursors
];

gtk = {
  enable = true;

  theme = {
    name = "everforest-dark";
    package = pkgs.gnome-themes-extra;
  };

  iconTheme = {
    name = "Papirus-Dark";
    package = pkgs.papirus-icon-theme;
  };
};

}
