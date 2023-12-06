--- Perfect backslash(\) for Mac JIS keybord users

-- The problem:
--   On Mac, Japanese IME setting to replace Yen-backslash is ignored by
--   IntelliJ, jEdit or such as because JVM uses another keymap traditionally.

-- Solution:
--   Use Hammerspoon (http://www.hammerspoon.org/) instead of Japanese IME
--   setting. Paste below to your ~/.hammerspoon/init.lua file.

-- @author Hisateru Tanaka (tanakahisateru@gmail.com)

local VK_ESC = 0x35

-- Secret key codes not included in hs.keycodes.map
local VK_JIS_YEN = 0x5d
local VK_JIS_UNDERSCORE = 0x5e

--local log = hs.logger.new('keyhook','debug')

function flagsMatches(flags, modifiers)
    local set = {}
    for _, k in ipairs(modifiers) do set[string.lower(k)] = true end
    for _, k in ipairs({'fn', 'cmd', 'ctrl', 'alt', 'shift'}) do
        if set[k] ~= flags[k] then return false end
    end
    return true
end

-- NEVER define as local variable!
jisKeyboardFilter = hs.eventtap.new({
    hs.eventtap.event.types.keyDown,
    hs.eventtap.event.types.keyUp
}, function(event)
    local c = event:getKeyCode()
    local f = event:getFlags()
    -- log.d(...)
    if c == VK_JIS_YEN then
        -- To input \ even if JVM, toggle Option key status when Yen key.
        if flagsMatches(f, {'alt'}) then
            event:setFlags({})
        elseif flagsMatches(f, {}) then
            event:setFlags({alt=true})
        end
        -- Hint: Never replace key code to backslash itself because JIS
        -- keyboard does'nt have phisical backslash and assignes it to close
        -- bracket (]) key.
    elseif c == VK_JIS_UNDERSCORE then
        -- Also map single undetscore (_) key to backslash (\).
        if flagsMatches(f, {}) then
            event:setKeyCode(VK_JIS_YEN)
            event:setFlags({alt=true})
        end
    end
end)
jisKeyboardFilter:start()
