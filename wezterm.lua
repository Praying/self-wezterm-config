local wezterm = require('wezterm')
local mux = wezterm.mux

wezterm.on('gui-startup', function(cmd)
   local tab, pane, window = mux.spawn_window(cmd or {})
   window:gui_window():toggle_fullscreen()
end)

local Config = require('config')

require('utils.backdrops'):set_files():random()

require('events.right-status').setup()
require('events.tab-title').setup()
require('events.new-tab-button').setup()

return Config:init()
   :append(require('config.appearance'))
   :append(require('config.bindings'))
   :append(require('config.domains'))
   :append(require('config.fonts'))
   :append(require('config.general'))
   :append(require('config.launch')).options
