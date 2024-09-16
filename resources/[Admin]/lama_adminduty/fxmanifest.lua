fx_version 'cerulean'
games {'gta5'}
lua54 'yes'

author 'SirLamaGott & FiveDox'
description 'Lama - Admin Duty'
version '0.1.0'

server_script 'server/main.lua'
client_script 'client/main.lua'

shared_scripts {
	'@es_extended/locale.lua',
	'locales/*.lua',
	'config.lua',
} 