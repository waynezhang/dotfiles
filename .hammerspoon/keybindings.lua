-- Switch \ and ¥ (snippet from https://qiita.com/tanakahisateru/items/d8a67ad89c07baf8c0da)

local VK_JIS_YEN = 0x5d

function flagsMatches(flags, modifiers)
    local set = {}
    for _, k in ipairs(modifiers) do set[string.lower(k)] = true end
    for _, k in ipairs({'fn', 'cmd', 'ctrl', 'alt', 'shift'}) do
        if set[k] ~= flags[k] then return false end
    end
    return true
end

remapper = hs.eventtap.new({
    hs.eventtap.event.types.keyDown,
    hs.eventtap.event.types.keyUp
}, function(event)
    local c = event:getKeyCode()
    local f = event:getFlags()
    if c == VK_JIS_YEN then
        if flagsMatches(f, {'alt'}) then
            event:setFlags({})
        elseif flagsMatches(f, {}) then
            event:setFlags({alt=true})
        end
    end
end)
remapper:start()

-- Map Ctrl-N/P to Up/Down

local function keyStroke(key, mods)
  mods = mods or {}
  return function()
    hs.eventtap.keyStroke(mods, key, 1000)
  end
end

local function disableAll(keySet)
  for k, v in pairs(keySet) do v:disable() end
end

local function enableAll(keySet)
  for k, v in pairs(keySet) do v:enable() end
end

local function hasValue (tab, val)
  for index, value in ipairs(tab) do
    if value == val then
      return true
    end
  end
  return false
end

local vimBinding = {
  hs.hotkey.new({'ctrl'}, 'N', keyStroke('down')),
  hs.hotkey.new({'ctrl'}, 'P', keyStroke('up'))
}

local whiteListApps = {
  "LINE", "OmniFocus", "WeChat"
}

local function handleVimKeyEvent(name, event, app)
  if event == hs.application.watcher.activated then
    if hasValue(whiteListApps, name) then
      enableAll(vimBinding)
    else
      disableAll(vimBinding)
    end
  end
end
hs.application.watcher.new(handleVimKeyEvent):start()

-- Map
local alacrittyHotkey = hs.hotkey.new({'ctrl', 'cmd'}, 'E', function()
  local filePath = "~/.config/alacritty/alacritty.yml"
  local opacity, succeed, _, _ = hs.execute("cat " .. filePath .. " | grep 'background_opacity:' | cut -d ' '  -f2")
  if succeed == false then
    return
  end
  if tonumber(opacity) == 1 then
    opacity = 0.8
  else
    opacity = 1
  end

  hs.execute("cat " .. filePath .. " | sed 's/background_opacity: .*/background_opacity: " .. opacity .. "/g' | tee " .. filePath)
end)
local function handleAlacrittyEvent(name, event, app)
  if event == hs.application.watcher.activated then
    if name == "Alacritty" then
      alacrittyHotkey:enable()
    else
      alacrittyHotkey:disable()
    end
  end
end
hs.application.watcher.new(handleAlacrittyEvent):start()
