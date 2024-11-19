local _GetConvar <const> = GetConvar
local _GetConvarInt <const> = GetConvarInt

AddEventHandler("onResourceStart", function(resourceName)
    if resourceName ~= "naara-gamemode" then 
        print("^1Please do not rename the resource and leave it as 'naara-gamemode'^7")
        Wait(5000)
        return os.exit()
    end

    print("^2Naara Gamemode has been started^7")

    if _GetConvar("naara:webhook:gamemodeStart", "") ~= "" then
        discordLog(_GetConvar("naara:webhook:gamemodeStart", ""), {
            title = "Gamemode Started",
            message = 
                'Server Name ```' .. _GetConvar("naara:serverName", "Unknown") ..'```\n'..
                'Server Game Build ```' .. _GetConvarInt("sv_enforceGameBuild", "Unknown") ..'```\n'..
                'Debug Level ```' .. _GetConvarInt("naara:debugLevel", "Unknown") ..'```\n'..
                'Slot(s) Count ```' .. _GetConvarInt("sv_maxclients", "Unknown") ..'```\n'..
                'Resource Name ```' .. resourceName ..'```\n'..
                'Resource(s) Count ```' .. GetNumResources() ..'```\n'..
                'Ped(s) Count ```' .. #GetAllPeds() ..'```\n'..
                'Vehicle(s) Count ```' .. #GetAllVehicles() ..'```\n'..
                'Object(s) Count ```' .. #GetAllObjects() ..'```\n'..
                'Memory Usage ```' .. math.floor(collectgarbage("count")) ..' KB | '.. math.floor(collectgarbage("count") / 1024) ..' MB```\n',
            color = 16753920,
            footer = "made by Atoshi",
            image = _GetConvar("naara:serverIcon", "")
        })
    end
end)