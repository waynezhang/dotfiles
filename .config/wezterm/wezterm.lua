local wezterm = require 'wezterm';

return {
  font = wezterm.font("Essential PragmataPro"),
  font_size = 12,
  line_height = 1.1,
  freetype_load_target = "Normal",
  window_background_opacity = 0.8,
  enable_tab_bar = false,
  colors = { -- snazzy with black background
    foreground = "#ebece6",
    background = "#000000",
    cursor_bg = "#97979B",
    cursor_border = "#e4e4e4",
    cursor_fg = "#f6f6f6",
    selection_bg = "#81aec6",
    selection_fg = "#000000",
    ansi = {"#000000","#fc4346","#50fb7c","#f0fb8c","#49baff","#fc4cb4","#8be9fe","#ededec"},
    brights = {"#555555","#fc4346","#50fb7c","#f0fb8c","#49baff","#fc4cb4","#8be9fe","#ededec"},
  },
}
