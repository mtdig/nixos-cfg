{ lib, stdenv, fetchurl, makeWrapper, autoPatchelfHook, ... }:

stdenv.mkDerivation rec {
  pname = "visual-paradigm";
  version = "17.3";

  src = fetchurl {
    url = "https://www.visual-paradigm.com/downloads/vp17.3/Visual_Paradigm_Linux64_InstallFree.tar.gz";
    sha256 = lib.fakeHash;  
  };

  nativeBuildInputs = [ autoPatchelfHook makeWrapper ];

  # add libs that the binary needs, e.g.:
  # buildInputs = [ xorg.libX11 ... ];

  installPhase = ''
    mkdir -p $out
    cp -r . $out/

    makeWrapper $out/Visual_Paradigm $out/bin/visual-paradigm
  '';
}
