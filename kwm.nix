# ~/nixos-dotfiles/kwm.nix
{ lib
, stdenv
, fetchFromGitHub
, pkg-config
, zig
, wayland
, wayland-protocols
, wayland-scanner
, libxkbcommon
, pixman
, fcft
}:

stdenv.mkDerivation rec {
  pname = "kwm";
  version = "0.3.0";

  src = fetchFromGitHub {
    owner = "kewuaa";
    repo = "kwm";
    rev = "v${version}";
    hash = "sha256-hX76wTHPTgg5RAHILfd3CjRKPlgAwGSK3lG82IFoUUs";
};

deps = zig.fetchDeps {
  inherit src pname version;
  fetchAll = true;
  hash = "sha256-Lz/Wcy40rxN81n/mBj4YJVbyGOolHzSFZMs93T1h0oQ";
};

postConfigure = ''
  cp -rLT ${deps} "$ZIG_GLOBAL_CACHE_DIR/p"
  chmod -R u+w "$ZIG_GLOBAL_CACHE_DIR/p"
'';

nativeBuildInputs = [
  pkg-config
  zig
  zig.hook
];

buildInputs = [
  wayland
  wayland-protocols
  wayland-scanner
  libxkbcommon
  pixman
  fcft
];

meta = with lib; {
  description = "Kewuaa window manager inspired by dwm for River compositor";
  homepage = "https://github.com/kewuaa/kwm";
  license = licenses.gpl3Only;
  platforms = platforms.linux;
  };
}
