-- utility

local log = hs.logger.new('window','debug')

local function resizeAndMove(dx, dy, dw, dh)
  return function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:fullFrame()

    f.x = max.x + max.w * dx
    f.y = max.y + max.h * dy
    f.w = max.w * dw
    f.h = max.h * dh
    win:setFrame(f)
  end
end

local function resize(dw, dh)
  return function()
    local win = hs.window.focusedWindow()
    local f = win:frame()

    f.w = f.w * dw
    f.h = f.h * dh
    win:setFrame(f)
  end
end

local function move(dx, dy)
  return function()
    local win = hs.window.focusedWindow()
    local f = win:frame()

    f.x = f.x + f.w * dx
    f.y = f.y + f.h * dy
    win:setFrame(f)
  end
end

-- align
--
hs.hotkey.bind({ "ctrl", "cmd" }, "left", resizeAndMove(0, 0, 0.5, 1))
hs.hotkey.bind({ "ctrl", "cmd" }, "right", resizeAndMove(0.5, 0, 0.5, 1))
hs.hotkey.bind({ "ctrl", "cmd" }, "up", resizeAndMove(0, 0, 1, 0.5))
hs.hotkey.bind({ "ctrl", "cmd" }, "up", resizeAndMove(0, 0, 1, 0.5))
hs.hotkey.bind({ "ctrl", "shift", "cmd" }, "up", resizeAndMove(0.1, 0.05, 0.8, 0.9))

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
hs.hotkey.bind({"alt"}, "tab", function()
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
