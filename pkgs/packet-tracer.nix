{ lib, stdenv, makeWrapper, autoPatchelfHook, dpkg, ... }:

stdenv.mkDerivation rec {
  pname = "packet-tracer";
  version = "9.0";

  src = /nix/store/qn5nnffdk87ls94889jpdi4m2ih74bx5-CiscoPacketTracer_900_Ubuntu_64bit.deb;

  nativeBuildInputs = [ autoPatchelfHook makeWrapper dpkg ];

  autoPatchelfIgnoreMissingDeps = [ "*" ];

  unpackPhase = ''
    dpkg-deb -x $src $out
  '';

  installPhase = ''
    makeWrapper $out/opt/pt/PacketTracer $out/bin/packet-tracer
  '';
}
