{ pkgs, ... }:

let
  obsStudioNoLto =
    pkgs.obs-studio.overrideAttrs (oldAttrs: {
      cmakeFlags =
        (oldAttrs.cmakeFlags or [ ]) ++ [ "-DENABLE_LTO=OFF" ];

      preConfigure =
        (oldAttrs.preConfigure or "") + ''
          export NIX_CFLAGS_COMPILE="''${NIX_CFLAGS_COMPILE} -fno-lto"
          export NIX_LDFLAGS="''${NIX_LDFLAGS} -fno-lto"
        '';
    });
in
{
  home.packages = [
    obsStudioNoLto
  ];
}
