fx_version 'adamant'
game 'gta5'
name 'GMD_Entry'
description 'version: 1.0'
ui_page "nui/nui.html"
author 'GMD_Scripts'

lua54 'yes'

files {
	'nui/nui.html',
	'nui/script/*.js',
	'nui/style/*.css',
	'nui/media/fonts/*.ttf',
	'nui/media/fonts/*.otf',
	'nui/media/*.mp3',
}

server_script {
	'@oxmysql/lib/MySQL.lua',
	'server/main_sv.lua'
  }

-- Client Scripts
client_scripts {
	'client/main_cl.lua'
}

shared_scripts {
	'config.lua'
}