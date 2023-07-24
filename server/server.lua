RegisterNetEvent('VerdictEMS:heal', function(targetId)
    local playerId = source
    local targetId = targetId
    TriggerClientEvent('VerdictEMS:healme', targetId)
    TriggerClientEvent('VerdictEMS:healsuccess', playerId)
end)
RegisterNetEvent('VerdictEMS:revive', function(targetId)
    local playerId = source
    local targetId = targetId
    TriggerClientEvent('VerdictEMS:reviveme', targetId)
    TriggerClientEvent('VerdictEMS:revivesuccess', playerId)
end)