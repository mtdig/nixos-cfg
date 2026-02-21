{ lib, stdenv, makeWrapper, autoPatchelfHook, dpkg, ... }:

stdenv.mkDerivation rec {
  pname = "packet-tracer";
  version = "9.0";

  src = /home/jeroen/Downloads/CiscoPacketTracer_900_Ubuntu_64bit.deb;

  nativeBuildInputs = [ autoPatchelfHook makeWrapper dpkg ];

  autoPatchelfIgnoreMissingDeps = [ "*" ];

  unpackPhase = ''
    dpkg-deb -x $src $out
  '';

  installPhase = ''
    makeWrapper $out/opt/pt/PacketTracer $out/bin/packet-tracer
  '';
}
