local _GetConvar <const> = GetConvar

local serverName <const> = _GetConvar("naara:serverName", "Unknown")
local serverIcon <const> = _GetConvar("naara:serverIcon", "Unknown")
local serverBanner <const> = _GetConvar("naara:serverBanner", "Unknown")
local discordLink <const> = _GetConvar("naara:discordLink", "Unknown")

local cards <const> = {
    homeCard = ([==[{
        "$schema": "http://adaptivecards.io/schemas/adaptive-card.json",
        "type": "AdaptiveCard",
        "version": "1.4",
        "body": [
            {
                "type": "TextBlock",
                "text": "Bienvenue sur %s",
                "weight": "bolder",
                "size": "extralarge"
            },
            {
                "type": "TextBlock",
                "text": "Veuillez choisir une option ci-dessous pour continuer la connexion à %s, si vous n'avez pas de compte, vous pouvez vous inscrire en cliquant sur le bouton 'Page d'inscription'. Si vous avez déjà un compte, vous pouvez vous connecter en cliquant sur le bouton 'Page de connexion' et si vous souhaitez plus d'informations sur le serveur, vous pouvez cliquer sur le bouton 'Informations'.",
                "weight": "default",
                "size": "medium",
                "wrap": true,
                "isSubtle": true
            }
        ],
        "actions": [
            {
                "type": "Action.Submit",
                "title": "Page de connexion",
                "data": {
                    "action": "submitLoginButton"
                }
            },
            {
                "type": "Action.Submit",
                "title": "Page d'inscription",
                "data": {
                    "action": "submitRegistrationButton"
                }
            },
            {
                "type": "Action.Submit",
                "title": "Informations",
                "data": {
                    "action": "submitInfoButton"
                }
            }
        ]
    }]==]):format(serverName, serverName),

}

_ENV.cards = cards