{
  description = "Gentleman: Single config for all systems in one go";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";  # Asegurate de que coincida con tu sistema
      pkgs = import nixpkgs { inherit system; };
    in {
      homeConfigurations = {
        "gentleman" =
          home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            modules = [
              ./nushell.nix  
              ./ghostty.nix  
              ./wezterm.nix  
              ./kitty.nix 
              ./zellij.nix   
              ./fish.nix
              ./starship.nix 
              ./nvim.nix     
              {
                # Datos personales
                home.username = "jotamario";
                home.homeDirectory = "/home/jotamario/";
                home.stateVersion = "24.11";

                home.packages = with pkgs; [
                  # ─── Terminals y utilidades ───
                  zellij
                  fish
                  nushell

                  # ─── Herramientas de desarrollo ───
                  volta
                  carapace
                  zoxide
                  atuin
                  jq
                  bash
                  starship
                  fzf
                  neovim
                  nodejs
                  lazygit
                  bun

                  # ─── Compiladores y utilidades de sistema ───
                  gcc
                  fd
                  ripgrep
                  coreutils
                  bat
                  lazygit

                  # ─── Nerd Fonts ───
                  nerd-fonts.iosevka-term
                ];

              }
            ];
          };
      };
    };
}
