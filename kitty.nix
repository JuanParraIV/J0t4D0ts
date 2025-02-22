{ lib, ... }:
{
  home.activation.copyKitty = lib.hm.dag.entryAfter ["writeBoundary"] ''
    echo "Copying Kitty configuration..."
    rm -rf "$HOME/.config/kitty"

    # Check if the .config directory exists, if not, create it
    if [ ! -d "$HOME/.config/kitty" ]; then
      mkdir -p "$HOME/.config/kitty"
    fi

    cp -r ${toString ./kitty} "$HOME/.config/kitty"
    chmod -R u+w "$HOME/.config/kitty"
  '';
}

