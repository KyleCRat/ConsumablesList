ADDON_NAME, CL = ...


-------------------------------------------------------------------------------
--- Slash Commands
-------------------------------------------------------------------------------

CL.cmds = {}
CL.cmds.toggle_lock = {
    triggers = { 'lock', 'l' },
    name = "Lock",
    description = "Lock or Unlock the Frame.",
    func = function() CL:ToggleLock() end,
}

CL.cmds.toggle_names = {
    triggers = { 'full', 'f' },
    name = "Full Names",
    description = "Toggle between full item names and nicknames.",
    func = function() CL:ToggleFullNames() end,
}

CL.cmds.toggle_debug = {
    triggers = { 'debug', 'd', 'verbose', 'v' },
    name = "Debug Messages",
    description = "Show debug messages",
    func = function() CL:ToggleDebug() end,
}


-------------------------------------------------------------------------------
--- Slash Command Handling
-------------------------------------------------------------------------------

local triggers = {}
local max_cmd_len = 0

function CL:Help()
    CL:Print("Available Commands:")

    for trigger, cmd in pairs(triggers) do
        local trigger_len = #trigger
        local len_diff = max_cmd_len - trigger_len

        print("  /cl " .. trigger .. string.rep(" ", len_diff) .. " - " .. cmd.description)
    end
end

for _, cmd in pairs(CL.cmds) do
    for _, trigger in ipairs(cmd.triggers) do
         if max_cmd_len < #trigger then max_cmd_len = #trigger end

        triggers[trigger] = cmd
    end
end

SLASH_CONSUMABLELIST1 = "/cl"

SlashCmdList["CONSUMABLELIST"] = function(msg)
    msg = msg:lower():trim()

    CL:VPrint("/cl " .. (msg ~= "" and msg or "(no msg)") .. " received")

    if triggers[msg] then
        triggers[msg].func()
    else
        CL:Help()
    end
end
