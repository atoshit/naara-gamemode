local discordAppId <const> = GetConvar("naara:discordAppId", "")
local presenceAsset <const> = GetConvar("naara:presenceAsset", "")
local presenceAssetText <const> = GetConvar("naara:presenceAssetText", "")
local presenceButtonLabel <const> = GetConvar("naara:presenceButtonLabel", "")
local presenceButtonLink <const> = GetConvar("naara:presenceButtonLink", "")
local presenceUpdateInterval <const> = GetConvarInt("naara:presenceUpdateInterval", 5000)

CreateThread(function()
    while true do 
        SetDiscordAppId(discordAppId)
        SetDiscordRichPresenceAsset(presenceAsset)
        SetDiscordRichPresenceAssetText(presenceAssetText)

        if SetDiscordRichPresenceAction then
            SetDiscordRichPresenceAction(0, presenceButtonLabel, presenceButtonLink)
        end 

        Wait(presenceUpdateInterval)
    end
end)