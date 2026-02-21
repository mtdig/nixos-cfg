{ config, pkgs, ... }:

let
  rustToolchain = pkgs.rust-bin.stable.latest.default.override {
    targets = [
      "x86_64-unknown-linux-gnu"
      "aarch64-unknown-linux-gnu"
      "riscv32imc-unknown-none-elf"  # ESP32-C3
      "riscv32imac-unknown-none-elf" # ESP32-C6
    ];
  };
in {
  environment.systemPackages = with pkgs; [
    rustToolchain
    gcc
    pkgsCross.aarch64-multiplatform.stdenv.cc
    espflash
    espup
  ];
}
