Config = {}

Config.Local = 'de'
Config.MaxNotifyDuration = 10000 -- in ms

Config.Command = 'jobnotify' -- here you jobnotifycommand

Config.Jobs ={
    ['mechanic'] = {
        showNUIName = "BENNYS CUSTOM",
        notifyColor = "rgba(255, 165, 0, 0.8)",
    },
    ['police'] = {
        showNUIName = "LSPD",
        notifyColor = "rgba(0, 11, 255, 0.8)"
    },
    ['ambulance'] = {
        showNUIName = "LSMD",
        notifyColor = "rgba(255, 0, 0, 0.8)"
    }
}

Config.Language = {

    ['de'] = {
        ['error_job'] = 'Du gehörst keinem der spezifizierten Jobs an.',
        ['msg_error'] = 'Nachricht ist leer.',
        ['long_text'] = 'Nachricht ist zu lang. Maximal 100 Zeichen erlaubt.',
        ['wait_msg'] = 'Warte noch etwas, es wurde gerade erst eine Rundnachricht geschrieben!'
    }
}