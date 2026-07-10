{ pkgs, ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      obs-studio = prev.obs-studio.overrideAttrs (oldAttrs: {
        # Wyłączenie LTO przez CMake
        cmakeFlags = (oldAttrs.cmakeFlags or [ ]) ++ [ "-DENABLE_LTO=OFF" ];

        # Wyłączenie LTO w flagach kompilatora
        preConfigure = (oldAttrs.preConfigure or "") + ''
          export NIX_CFLAGS_COMPILE="''${NIX_CFLAGS_COMPILE} -fno-lto"
          export NIX_LDFLAGS="''${NIX_LDFLAGS} -fno-lto"
        '';
      });
    })
  ];
}
