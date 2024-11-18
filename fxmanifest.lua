-- Naara Gamemode

fx_version 'cerulean'
game 'gta5'
lua54 'yes'
use_experimental_fxv2_oal 'yes'

author 'Atoshi'
description 'Naara PvP'
version '1.0.0'

shared_scripts {
    'shared/utils/logger.lua',
}

server_scripts {
    'server/onResourceStart.lua',
    'server/playerConnecting.lua',
}
