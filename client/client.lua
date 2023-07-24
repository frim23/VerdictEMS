NDCore = exports["ND_Core"]:GetCoreObject()
local character = NDCore.Functions.GetSelectedCharacter()

RegisterNetEvent("VerdictEMS:healme")
RegisterNetEvent('VerdictEMS:healsuccess')
RegisterNetEvent("VerdictEMS:reviveme")
RegisterNetEvent('VerdictEMS:revivesuccess')

AddEventHandler("VerdictEMS:healme",function()
    SetEntityHealth(PlayerPedId(), 200)
end)
AddEventHandler("VerdictEMS:reviveme",function()
    SetEntityHealth(PlayerPedId(), 110)
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
		if job == "LSPD" then
			TriggerServerEvent('VerdictEMS:revive', targetId)
		else
			TriggerEvent('chat:addMessage', {
			  color = { 44, 87, 242},
			  multiline = true,
			  args = {"VerdictEMS", "You are not a medical personnel"}
		  })
		end
	else
		print("No character selected")
	end
end)
RegisterCommand('heal', function(_, args)
	if character then
		local targetId = args[1]
		local job = character.job
		if job == "LSPD" then
			TriggerServerEvent('VerdictEMS:heal', targetId)
		else
			TriggerEvent('chat:addMessage', {
			  color = { 44, 87, 242},
			  multiline = true,
			  args = {"VerdictEMS", "You are not a medical personnel"}
		  })
		end
	else
		print("No character selected")
	end
end)