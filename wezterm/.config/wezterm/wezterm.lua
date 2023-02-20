--local colors = require("lua/rose-pine").colors()
--local window_frame = require("lua/rose-pine").window_frame()
local wezterm = require("wezterm")

--local function scheme_for_appearance(appearance)
--if appearance:find("Dark") then
--return "Catppuccin Frappe"
--else
--return "Catppuccin Latte"
--end
--end

return {
    font = wezterm.font("Hack Nerd Font"),
    font_size = 15,
    color_scheme = "nord", --scheme_for_appearance(wezterm.gui.get_appearance()),
    window_decorations = "RESIZE",
    --colors = colors,
    --window_frame = window_frame, -- needed only if using fancy tab bar
    hide_tab_bar_if_only_one_tab = true,
    adjust_window_size_when_changing_font_size = false,
}
