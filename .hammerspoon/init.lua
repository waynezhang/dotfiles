-- utilities

function resizeAndMove(dx, dy, dw, dh)
  return function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.w * dx
    f.y = max.h * dy
    f.w = max.w * dw
    f.h = max.h * dh
    win:setFrame(f)
  end
end

function resize(dw, dh)
  return function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.w = f.w * dw
    f.h = f.h * dh
    win:setFrame(f)
  end
end

function move(dx, dy)
  return function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = f.x + f.w * dx
    f.y = f.y + f.h * dy
    win:setFrame(f)
  end
end

-- disable animation
hs.window.animationDuration = 0

-- align
hs.hotkey.bind({ "ctrl", "cmd" }, "left", resizeAndMove(0, 0, 0.5, 1))
hs.hotkey.bind({ "ctrl", "cmd" }, "right", resizeAndMove(0.5, 0, 0.5, 1))
hs.hotkey.bind({ "ctrl", "cmd" }, "up", resizeAndMove(0, 0, 1, 0.5))
hs.hotkey.bind({ "ctrl", "cmd" }, "down", resizeAndMove(0, 0.5, 1, 0.5))

-- resize
hs.hotkey.bind({ "ctrl", "alt" }, "left", resize(0.9, 1))
hs.hotkey.bind({ "ctrl", "alt" }, "right", resize(1.1, 1))
hs.hotkey.bind({ "ctrl", "alt" }, "up", resize(1, 0.9))
hs.hotkey.bind({ "ctrl", "alt" }, "down", resize(1, 1.1))

-- move
hs.hotkey.bind({ "shift", "alt" }, "left", move(-0.1, 0))
hs.hotkey.bind({ "shift", "alt" }, "right", move(0.1, 0))
hs.hotkey.bind({ "shift", "alt" }, "up", move(0, -0.1))
hs.hotkey.bind({ "shift", "alt" }, "down", move(0, 0.1))

-- window counterpart
hs.hotkey.bind({"alt"}, "Tab", function()
  local app = hs.application.frontmostApplication()
  local windows = app:allWindows()

  local nextWin = nil

  if app:bundleID() == "com.apple.finder" then
    nextWin = windows[#windows - 1]
  else
    nextWin = windows[#windows]
  end

  if nextWin:isMinimized() == true then
    nextWin:unminimize()
  else
    nextWin:focus()
  end
end)

-- Wi-Fi in Starbucks is tooooo unstable
hs.hotkey.bind({"cmd", "ctrl"}, "-", function()
  hs.wifi.setPower(false)
  hs.wifi.setPower(true)
end)


-- Input Method Switch
hs.hotkey.bind({"cmd"}, "kana", function()
  hs.keycodes.currentSourceID("com.apple.inputmethod.SCIM.ITABC")
end)

-- Spotify
function showCurrentSpotifyTrack()
  local track = hs.spotify.getCurrentTrack()
  local artist = hs.spotify.getCurrentArtist()
  local album = hs.spotify.getCurrentAlbum()
  hs.notify.show(track, artist, album)
end
hs.hotkey.bind({"cmd", "alt"}, "right", function()
  hs.spotify.next()
  showCurrentSpotifyTrack()
end)
hs.hotkey.bind({"cmd", "alt"}, "left", function()
  hs.spotify.previous()
  showCurrentSpotifyTrack()
end)

hs.hotkey.bind({"cmd", "alt"}, "space", function()
  hs.spotify.playpause()
end)


-- Wi-Fi SSID
local wifiMenu = hs.menubar.new()
wifiMenu:setTitle(hs.wifi.currentNetwork())
hs.wifi.watcher.new(function()
  local wifiName = hs.wifi.currentNetwork()
  if wifiName then
    wifiMenu:setTitle(wifiName)
  else
    wifiMenu:setTitle("Wifi OFF")
  end
end):start()
