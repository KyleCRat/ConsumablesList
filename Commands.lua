local ADDON_NAME, CL = ...


-------------------------------------------------------------------------------
--- Slash Commands
-------------------------------------------------------------------------------

CL.cmds = {}
CL.cmds.toggle_names = {
    triggers = { 'full', 'f' },
    name = "Full Names",
    description = "Toggle between full item names and nicknames.",
    func = function() CL:ToggleFullNames() end,
}

CL.cmds.toggle_debug = {
    triggers = { 'debug', 'd' },
    name = "Debug Messages",
    description = "Show debug messages",
    func = function() CL:ToggleDebug() end,
}

CL.cmds.open_options = {
    triggers = { 'options', 'o' },
    name = "Options",
    description = "Open the options panel.",
    func = function() CL:OpenOptions() end,
}


-------------------------------------------------------------------------------
--- Slash Command Handling
-------------------------------------------------------------------------------

function CL:Help()
    CL:Print("Available Commands:")

    for _, cmd in pairs(CL.cmds) do
        print(string.format("  %s %-10s - %s",
                            SLASH_CONSUMABLESLIST1,
                            table.concat(cmd.triggers, ", "),
                            cmd.description))
    end
end

SLASH_CONSUMABLESLIST1 = "/cl"

SlashCmdList[strupper(ADDON_NAME)] = function(msg)
    msg = msg:lower():trim()

    CL:VPrint(string.format("%s %s received",
                            SLASH_CONSUMABLESLIST1,
                            msg ~= "" and msg or "(no msg)"))

    for _, cmd in pairs(CL.cmds) do
        for _, trigger in ipairs(cmd.triggers) do
            if msg == trigger then
                cmd.func()
                return
            end
        end
    end

    CL:Help()
end
