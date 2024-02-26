ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent('GMD_JobNotify:sendMessage')
AddEventHandler('GMD_JobNotify:sendMessage', function(job, jobname, msg, color)
    SetNuiFocus(false, false)
    SendNUIMessage({
        enable = true,
        type = 'MSGNotify',
        jobName = jobname,
        Job = job,
        message = msg,
        nuiColor = color,
        timer = Config.MaxNotifyDuration
    })
end)

CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/'..Config.Command, 'Job Notification Command', {
        { name="Description", help="You Massage here max. 100 characters" }
    })
end)