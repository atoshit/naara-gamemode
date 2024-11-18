AddEventHandler("onResourceStart", function(resourceName)
    if resourceName ~= "naara-gamemode" then 
        print("^1Please do not rename the resource and leave it as 'naara-gamemode'^7")
        print("^1Please do not rename the resource and leave it as 'naara-gamemode'^7")
        print("^1Please do not rename the resource and leave it as 'naara-gamemode'^7")
        print("^1Please do not rename the resource and leave it as 'naara-gamemode'^7")
        print("^1Please do not rename the resource and leave it as 'naara-gamemode'^7")
        Wait(5000)
        return os.exit()
    end

    print("^2Naara Gamemode has been started^7")

    if GetConvar("naara:webhook:gamemodeStart", "") ~= "" then
        discordLog(GetConvar("naara:webhook:gamemodeStart", ""), {
            title = "Gamemode Started",
            message = 
                'Server Name ```' .. GetConvar("naara:serverName", "Unknown") ..'```\n'..
                'Debug Level ```' .. GetConvar("naara:debugLevel", "Unknown") ..'```\n'..
                'Resource Name ```' .. resourceName ..'```\n'..
                'Resources Count ```' .. GetNumResources() ..'```\n'..
                'Ped(s) Count ```' .. #GetAllPeds() ..'```\n'..
                'Vehicle(s) Count ```' .. #GetAllVehicles() ..'```\n'..
                'Object(s) Count ```' .. #GetAllObjects() ..'```\n'..
                'Memory Usage ```' .. math.floor(collectgarbage("count")) ..' KB | '.. math.floor(collectgarbage("count") / 1024) ..' MB```\n',
            color = 16753920,
            footer = "made by Atoshi",
            image = GetConvar("naara:serverIcon", "")
        })
    end
end)