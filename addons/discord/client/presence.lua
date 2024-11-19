local _GetConvar <const> = GetConvar

---@class DiscordPresence
---@field private appId string: The Discord application ID
---@field private asset string: The asset to display
---@field private assetText string: The text of the asset
---@field private buttonLabel string: The label of the button
---@field private buttonLink string: The link of the button
---@field private updateInterval number: The update interval in ms
DiscordPresence = {
    private = {
        appId = _GetConvar("naara:discordAppId", ""),
        asset = _GetConvar("naara:presenceAsset", ""),
        assetText = _GetConvar("naara:presenceAssetText", ""),
        buttonLabel = _GetConvar("naara:presenceButtonLabel", ""),
        buttonLink = _GetConvar("naara:presenceButtonLink", ""),
        updateInterval = GetConvarInt("naara:presenceUpdateInterval", 5000)
    }
}

---Create a new instance of DiscordPresence
---@return DiscordPresence
function DiscordPresence.new()
    local instance = {
        private = {
            appId = DiscordPresence.private.appId,
            asset = DiscordPresence.private.asset, 
            assetText = DiscordPresence.private.assetText,
            buttonLabel = DiscordPresence.private.buttonLabel,
            buttonLink = DiscordPresence.private.buttonLink,
            updateInterval = DiscordPresence.private.updateInterval
        },
        init = DiscordPresence.init,
        update = DiscordPresence.update,
        setAssetText = DiscordPresence.setAssetText,
        setButtonLabel = DiscordPresence.setButtonLabel, 
        setButtonLink = DiscordPresence.setButtonLink
    }
    instance:init()
    return instance
end

---Initialize the Discord presence
function DiscordPresence:init()
    CreateThread(function()
        while true do
            self:update()
            Wait(self.private.updateInterval)
        end
    end)
end

---Update the Discord presence
function DiscordPresence:update()
    SetDiscordAppId(self.private.appId)
    SetDiscordRichPresenceAsset(self.private.asset)
    SetDiscordRichPresenceAssetText(self.private.assetText)

    if SetDiscordRichPresenceAction then
        SetDiscordRichPresenceAction(0, self.private.buttonLabel, self.private.buttonLink)
    end
end

---Set a new text for the asset
---@param text string: The new text
function DiscordPresence:setAssetText(text)
    self.private.assetText = text
end

---Set a new label for the button
---@param label string: The new label
function DiscordPresence:setButtonLabel(label)
    self.private.buttonLabel = label
end

---Set a new link for the button
---@param link string: The new link
function DiscordPresence:setButtonLink(link)
    self.private.buttonLink = link
end

DiscordPresence.new()