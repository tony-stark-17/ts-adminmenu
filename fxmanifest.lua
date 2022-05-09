fx_version 'cerulean'

game 'gta5'
author 'Tony'
description 'TS Admin Menu'
lua54 'yes'


shared_scripts {
	'config.lua',
	'@ox_lib/init.lua'
}
files({
	"ui/*",
})

ui_page("ui/index.html")

client_scripts {
	'@menuv/menuv.lua',
	'client/noclip.lua',
	'client/client.lua',
	'client/spectate.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/admin_list.lua',
	'server/server.lua',
	'server/spectate_serv.lua'
}
