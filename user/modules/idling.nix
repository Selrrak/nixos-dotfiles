{ pkgs, ... }:

{
  services.hypridle = {
    enable = true;

    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "hyprlock";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = [
        {
          timeout = 300; # 5 minutes
          on-timeout = "pidof hyprlock || hyprlock";
        }

        {
          timeout = 600; # 10 minutes total
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
