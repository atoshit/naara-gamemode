local _GetConvar <const> = GetConvar

AddEventHandler("onResourceStart", function(resourceName)
    if resourceName ~= "naara-gamemode" then 
        print("^1Please do not rename the resource and leave it as 'naara-gamemode'^7")
        Wait(5000)
        return os.exit()
    end

    _print("^2Naara Gamemode has been started^7")

    if _GetConvar("naara:webhook:gamemodeStart", "") ~= "" then
        discordLog(_GetConvar("naara:webhook:gamemodeStart", ""), {
            title = "Gamemode Started",
            message = 
                'Server Name ```' .. _GetConvar("naara:serverName", "Unknown") ..'```\n'..
                'Debug Level ```' .. _GetConvar("naara:debugLevel", "Unknown") ..'```\n'..
                'Resource Name ```' .. resourceName ..'```\n'..
                'Resources Count ```' .. GetNumResources() ..'```\n'..
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