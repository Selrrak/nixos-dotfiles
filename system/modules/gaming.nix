{ ... }:
{
  programs.steam = {
    enable = true;

    remotePlay.openFirewall = true;
    gamescopeSession.enable = true;
    localNetworkGameTransfers.openFirewall = true;
  };
}


