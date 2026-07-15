{ config, pkgs, ... }:

{
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu;
      swtpm.enable = true;
      runAsRoot = true;
      vhostUserPackages = [
        pkgs.virtiofsd
      ];
    };
  };

  programs.virt-manager.enable = true;

  users.users.selrak.extraGroups = [
    "render"
    "libvirtd"
    "kvm"
  ];
  systemd.services.libvirtd = {
    environment = {
      EGL_PLATFORM = "surfaceless";
      __EGL_VENDOR_LIBRARY_DIRS = "/run/opengl-driver/share/glvnd/egl_vendor.d";
      LIBGL_DRIVERS_PATH = "/run/opengl-driver/lib/dri";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    };
  };
  environment.systemPackages = with pkgs; [
    virglrenderer
    virt-viewer
    libguestfs
    swtpm
    mesa
    libglvnd
  ];
}
