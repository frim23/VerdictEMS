local department = "LSFD"

NDCore = exports["ND_Core"]:GetCoreObject()
local character = NDCore.Functions.GetSelectedCharacter()

RegisterNetEvent("VerdictEMS:healme")
RegisterNetEvent('VerdictEMS:healsuccess')
RegisterNetEvent("VerdictEMS:reviveme")
RegisterNetEvent('VerdictEMS:revivesuccess')
RegisterNetEvent('VerdictEMS:offline')

AddEventHandler("VerdictEMS:offline",function()
		SetEntityHealth(PlayerPedId(), 200)
	  TriggerEvent('chat:addMessage', {
		  color = { 196, 35, 46},
		  multiline = true,
		  args = {"Error", "Player with this ID doesn't exist"}
	  })
end)
AddEventHandler("VerdictEMS:healme",function()
		SetEntityHealth(PlayerPedId(), 200)
	  TriggerEvent('chat:addMessage', {
		  color = { 44, 87, 242},
		  multiline = true,
		  args = {"VerdictEMS", "You got cured by an EMT"}
	  })
end)
AddEventHandler("VerdictEMS:reviveme",function()
		if GetEntityHealth(PlayerPedId()) < 110 then
    	SetEntityHealth(PlayerPedId(), 110)
    	TriggerEvent('chat:addMessage', {
			  color = { 44, 87, 242},
			  multiline = true,
			  args = {"VerdictEMS", "You got revived by an EMT"}
		  })
    else
    end
end)

AddEventHandler('VerdictEMS:revivesuccess', function()
  TriggerEvent('chat:addMessage', {
	  color = { 44, 87, 242},
	  multiline = true,
	  args = {"VerdictEMS", "You successfuly revived a patient!"}
  })
end)
AddEventHandler('VerdictEMS:healsuccess', function()
  TriggerEvent('chat:addMessage', {
	  color = { 44, 87, 242},
	  multiline = true,
	  args = {"VerdictEMS", "You successfuly cured a patient!"}
  })
end)

RegisterCommand('revive', function(_, args)
	if character then
		local targetId = args[1]
		local job = character.job
		if targetId == nil then
			TriggerEvent('chat:addMessage', {
			  color = { 196, 35, 46},
			  multiline = true,
			  args = {"Error", "You need to enter a valid Player ID"}
		  })
		else
			if job == department then
				TriggerServerEvent('VerdictEMS:revive', targetId)
			else
				TriggerEvent('chat:addMessage', {
				  color = { 44, 87, 242},
				  multiline = true,
				  args = {"VerdictEMS", "You are not a medical personnel"}
			  })
			end
		end
	else
		print("No character selected")
	end
end)
RegisterCommand('heal', function(_, args)
	if character then
		local targetId = args[1]
		local job = character.job
		if targetId == nil then
			TriggerEvent('chat:addMessage', {
			  color = { 196, 35, 46},
			  multiline = true,
			  args = {"Error", "You need to enter a valid Player ID"}
		  })
		else
			if job == department then
				TriggerServerEvent('VerdictEMS:heal', targetId)
			else
				TriggerEvent('chat:addMessage', {
				  color = { 44, 87, 242},
				  multiline = true,
				  args = {"VerdictEMS", "You are not a medical personnel"}
			  })
			end
		end
	else
		print("No character selected")
	end
end)

TriggerEvent('chat:addSuggestion', '/revive', 'Revive an injured player (Available to SAFR/EMT only)', {
    { name="Player ID", help="Player's server ID" }
})
TriggerEvent('chat:addSuggestion', '/heal', 'Cure a patient (Available to SAFR/EMT only)', {
    { name="Player ID", help="Player's server ID" }
})
