require "window"
require "spotify"
require "remap"

-- disable animation
hs.window.animationDuration = 0

-- Wi-Fi in Starbucks is tooooo unstable
hs.hotkey.bind({ "cmd", "ctrl" }, "-", function()
  hs.wifi.setPower(false)
  hs.wifi.setPower(true)
end)

-- Input Method Switch
hs.hotkey.bind({ "cmd" }, "kana", function()
  hs.keycodes.currentSourceID("com.googlecode.rimeime.inputmethod.Squirrel.Rime")
end)
