local ESX = exports['es_extended']:getSharedObject()
function getPlayerList()
	local players = {}
	local plyList = ESX.GetExtendedPlayers()
	--TriggerClientEvent('table', -1, plyList)
	for k,v in pairs(plyList) do
		local job = v.job.name
		local jobText = v.job.label .. " - " .. v.job.grade_label

		table.insert(players, {
			serverId = v.playerId,
			name = v.name .. " (" .. GetPlayerName(v.playerId) .. ")",
			group = v.group,
			jobText = jobText,
		})
	end
	--[[for _, serverId in pairs(GetPlayers()) do
		local xPlayer = ESX.GetPlayerFromId(serverId)

		local job = xPlayer.getJob()
		local jobText = job.label .. " - " .. job.grade_label

		table.insert(players, {
			serverId = serverId,
			name = xPlayer.getName() .. " (" .. GetPlayerName(serverId) .. ")",
			group = xPlayer.getGroup(),
			jobText = jobText,
		})
	end]]--

	return players
end

ESX.RegisterServerCallback("requestServerPlayers", function(source, cb)
	local xSource = ESX.GetPlayerFromId(source)
	if not CheckAllowed(xSource.source, 'OnlinePlyOptions_Spectate', 'OnlinePlyOptions') then
		return cb(false)
	end

	cb(getPlayerList())
end)

ESX.RegisterServerCallback("requestPlayerCoords", function(source, cb, serverId)
	local targetPed = GetPlayerPed(serverId)
	if targetPed <= 0 then
		return cb(false)
	end

	cb(GetEntityCoords(targetPed))
end)

ESX.RegisterServerCallback("kickPlayerSpectate", function(source, cb, target)
	local xSource = ESX.GetPlayerFromId(source)
	local yPlayer = ESX.GetPlayerFromId(target)
	if not CheckAllowed(xSource.source, 'OnlinePlyOptions_Spectate', 'OnlinePlyOptions') then
		return
	end
	local data = {
		['Player'] = xSource.source, -- You need to set source here
		['Target'] = yPlayer.source, -- You need to set source here
		['Log'] = 'adminmenu-kickp', -- Log name
		['Title'] = 'Kick Logs', -- Title
		['Message'] = xSource.getName()..' kicked '..yPlayer.getName(), -- Message
		['Color'] = 'blue', -- Set your color here check Config.Colors for available colors
	}

	TriggerEvent('Boost-Logs:SendLog', data)
	DropPlayer(target, "Spectate menu ~ Admin: " .. GetPlayerName(source))
	cb(getPlayerList())
end)
--[[
RegisterCommand("spectate", function(player, args, cmd)
	local xPlayer = ESX.GetPlayerFromId(player)
	if not CheckAllowed(xPlayer.source, 'OnlinePlyOptions_Spectate', 'OnlinePlyOptions') then
		return
	end

	TriggerClientEvent("openSpectateMenu", player, getPlayerList())
end)]]--

RegisterNetEvent('fl_spectate:server:openSpectateMenu', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	if not CheckAllowed(xPlayer.source, 'OnlinePlyOptions_Spectate', 'OnlinePlyOptions') then
		return
	end
	TriggerClientEvent("openSpectateMenu", xPlayer.source, getPlayerList())
end)
