{ pkgs, ... }:
{
  vim = {
    utility = {
      # ccc.enable = true; # @TODO 2025-04-03: Check if ccc vs. otter conflict has been fixed
      diffview-nvim.enable = true;
      icon-picker.enable = true;
      images.image-nvim.enable = true;
      motion = {
        hop.enable = true;
        leap.enable = true;
        precognition.enable = true;
      };
      multicursors.enable = true;
      surround.enable = true;
      yanky-nvim.enable = true;
      vim-wakatime.enable = true;
    };
    extraPackages = [ pkgs.ueberzug ]; # For image-nvim
  };
}
