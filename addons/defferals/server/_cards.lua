local _GetConvar <const> = GetConvar

local serverName <const> = _GetConvar("naara:serverName", "Unknown")
local serverIcon <const> = _GetConvar("naara:serverIcon", "Unknown")
local serverBanner <const> = _GetConvar("naara:serverBanner", "Unknown")
local discordLink <const> = _GetConvar("naara:discordLink", "Unknown")
local siteLink <const> = _GetConvar("naara:siteLink", "Unknown")
local tebexLink <const> = _GetConvar("naara:tebexLink", "Unknown")

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

    infoCard = ([==[{
        "$schema": "http://adaptivecards.io/schemas/adaptive-card.json",
        "type": "AdaptiveCard",
        "version": "1.4",
        "body": [
            {
                "type": "TextBlock",
                "text": "Page d'informations",
                "weight": "bolder",
                "size": "extralarge"
            },
            {
                "type": "TextBlock",
                "text": "Vous êtes actuellement sur la page d'informations de %s, ici, vous pouvez retrouver les informations suivantes : Lien de notre boutique, notre discord, notre site et des informations supplémentaires sur les activités de %s.",
                "weight": "default",
                "size": "medium",
                "wrap": true,
                "isSubtle": true
            },
            {
                "type": "TextBlock",
                "text": "Notre équipe",
                "weight": "default",
                "size": "large"
            },
            {
                "type": "ColumnSet",
                "spacing": "medium",
                "columns": [
                    {
                        "type": "Column",
                        "items": [
                            {
                                "type": "Image",
                                "url": "https://avatars.githubusercontent.com/u/95099733?v=4",
                                "size": "large"
                            }
                        ]
                    },
                    {
                        "type": "Column",
                        "width": 4,
                        "items": [
                            {
                                "type": "TextBlock",
                                "text": "Atoshi"
                            },
                            {
                                "type": "TextBlock",
                                "text": "Fondateur & Développeur",
                                "isSubtle": true
                            }
                        ]
                    }
                ]
            },

            {
                "type": "ColumnSet",
                "spacing": "medium",
                "columns": [
                    {
                        "type": "Column",
                        "items": [
                            {
                                "type": "Image",
                                "url": "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/c10a26e2-8af9-43b4-b871-1c7dbe15b650/dgbcuxx-480a1713-2033-4bfd-847e-8f1f2691ee16.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2MxMGEyNmUyLThhZjktNDNiNC1iODcxLTFjN2RiZTE1YjY1MFwvZGdiY3V4eC00ODBhMTcxMy0yMDMzLTRiZmQtODQ3ZS04ZjFmMjY5MWVlMTYuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.P3ZBo0y1lF-K3B3O5l7SredxozJ1A60m4ErAXwp-Fb8",
                                "size": "large"
                            }
                        ]
                    },
                    {
                        "type": "Column",
                        "width": 4,
                        "items": [
                            {
                                "type": "TextBlock",
                                "text": "Zekroy"
                            },
                            {
                                "type": "TextBlock",
                                "text": "Fondateur",
                                "isSubtle": true
                            }
                        ]
                    }
                ]
            },
            {
                "type": "TextBlock",
                "text": "Activités",
                "weight": "default",
                "size": "large"
            },
            {
                "type": "TextBlock",
                "text": "・ Monde complet dédié au PVP \n ・ Système de matchmaking avec système de rangs (Bronze, Silver, Gold, Diamond, Master, Challenger) \n ・ Battle Royale \n ・ PVP 2v2/4v4/6V6/8v8/10v10 \n ・ Tournois des meilleurs joueurs du serveur avec du cashprize \n ・ Convoie vs Convoie (25vs25)\n ・ Et pleins d'autres choses encore !",
                "weight": "default",
                "size": "default",
                "isSubtle": true,
                "wrap": true
            },
            {
                "type": "TextBlock",
                "text": "Informations supplémentaires",
                "weight": "default",
                "size": "large"
            },
            {
                "type": "TextBlock",
                "text": "%s est un serveur de PvP. Il est donc impératif de respecter les règles établies. En cas de non-respect, des sanctions pourront être appliquées, allant d'un simple avertissement à un bannissement définitif. De plus, si vous oubliez votre mot de passe, vous risquez de perdre l'accès à votre compte. Nous vous conseillons donc de le noter ou de le mémoriser soigneusement. En cas de bannissement ou de perte de compte, aucun remboursement pour les achats effectués en boutique ne pourra être accordé.",
                "weight": "default",
                "size": "default",
                "wrap": true,
                "isSubtle": true
            }
        ],
        "actions": [
            {
                "type": "Action.OpenUrl",
                "title": "Notre boutique",
                "url": "%s"
            },
            {
                "type": "Action.OpenUrl",
                "title": "Notre discord",
                "url": "%s"
            },
            {
                "type": "Action.OpenUrl",
                "title": "Notre site",
                "url": "%s"
            },
            {
                "type": "Action.Submit",
                "title": "Retour à la page d'accueil",
                "data": {
                    "action": "submitReturnButton"
                }
            }
        ]
    }]==]):format(serverName, serverName, serverName, tebexLink, discordLink, siteLink),
}

_ENV.cards = cards