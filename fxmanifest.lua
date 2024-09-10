fx_version 'cerulean'
game 'gta5' 


author 'Tony'
description 'TS Admin Menu'
version '2.0'
lua54 'yes'

shared_scripts{
	'@ox_lib/init.lua'
}
client_script {
	'client/*.lua'
}

server_script {
	'@oxmysql/lib/MySQL.lua',
	'server/admin_list.json',
	'server/*.lua'
}