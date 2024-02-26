ESX = exports['es_extended']:getSharedObject()

local isSendNotify = false

RegisterCommand(Config.Command, function(source, args, rawCommand)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not xPlayer then
        return
    end

    local job = xPlayer.job.name
    
    if not job then
        return
    end

    if not Config.Jobs[job] then
        TriggerClientEvent('esx:showNotification', source, Config.Language[Config.Local]['error_job'], 'error')
        return
    end

    local jobConfig = Config.Jobs[job]

    local message = table.concat(args, " ")
    if message == "" then
        TriggerClientEvent('esx:showNotification', source, Config.Language[Config.Local]['msg_error'], 'error')
        return
    end

    if string.len(message) > 100 then

        TriggerClientEvent('esx:showNotification', source, Config.Language[Config.Local]['long_text'], 'error')
        return
    end

    if not IsSendNotify then
        TriggerClientEvent('GMD_JobNotify:sendMessage', -1, job, jobConfig.showNUIName, message, jobConfig.notifyColor)
        Wait(50)
        IsSendNotify = true
        Wait(Config.MaxNotifyDuration)
        IsSendNotify = false
    else
        TriggerClientEvent('esx:showNotification', source, Config.Language[Config.Local]['wait_msg'], 'error')
    end
end, false)