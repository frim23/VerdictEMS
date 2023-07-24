RegisterNetEvent('VerdictEMS:heal', function(targetId)
    local playerId = source
    local targetId = targetId
    if GetPlayerName(targetId) == nil then
        TriggerClientEvent('VerdictEMS:offline', playerId)
    else
        TriggerClientEvent('VerdictEMS:healme', targetId)
        TriggerClientEvent('VerdictEMS:healsuccess', playerId)
    end
end)
RegisterNetEvent('VerdictEMS:revive', function(targetId)
    local playerId = source
    local targetId = targetId
    if GetPlayerName(targetId) == nil then
        TriggerClientEvent('VerdictEMS:offline', playerId)
    else
        TriggerClientEvent('VerdictEMS:reviveme', targetId)
        TriggerClientEvent('VerdictEMS:revivesuccess', playerId)
    end
end)