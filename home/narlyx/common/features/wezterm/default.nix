{
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    extraConfig = ''
      local wezterm = require 'wezterm'
      local config = wezterm.config_builder()

      config.color_scheme = 'catppuccin-mocha'
      config.window_background_opacity = 0.9
      config.hide_tab_bar_if_only_one_tab = true

      config.font = wezterm.font 'JetBrains Mono'
      config.font_size = 11

      return config
    '';
  };
}
