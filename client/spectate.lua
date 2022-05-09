local RED = "<span style='color: red;'>"
local GREEN = "<span style='color: lightgreen;'>"
local ESX = exports['es_extended']:getSharedObject()
Panel = {
	visible = false,
	selectedPlayer = false,
	lastCoords = false,

	init = function(self)
		RegisterNUICallback("spectate", function(...)
			self:spectate(...)
		end)

		RegisterNUICallback("kick", function(...)
			self:kick(...)
		end)

		RegisterNUICallback("close", function(...)
			self:close(...)
		end)

		RegisterNUICallback("update", function()
			self:update(false)
		end)

		RegisterNUICallback("spectateoff", function()
			self:spectateoff()
		end)
	end,

	open = function(self, players)
		self.visible = true
		self:update(players)
		SetNuiFocus(true, true)
		SendNUIMessage({
			visible = true,
		})
	end,

	close = function(self)
		self.visible = false
		SetNuiFocus(false, false)
		SendNUIMessage({
			visible = false,
		})
	end,

	update = function(self, players)
		if not players or type(players) == "boolean" then
			ESX.TriggerServerCallback("requestServerPlayers", function(players)
				if not players then
					return self:close()
				end

				SendNUIMessage({
					players = players,
				})
			end)
			return
		end

		SendNUIMessage({
			players = players,
		})
	end,

	spectate = function(self, data, cb)
		if self.selectedPlayer then
			return
		end

		local localPed = PlayerPedId()
		self.lastCoords = GetEntityCoords(localPed)

		local serverId = tonumber(data.player.serverId)
		self.selectedPlayer = serverId

		ESX.TriggerServerCallback("requestPlayerCoords", function(coords)
			if not coords then
				self.selectedPlayer = false
				return
			end

			RequestCollisionAtCoord(coords)
			SetEntityVisible(localPed, false)
			SetEntityCoords(localPed, coords + vector3(0, 0, 10))
			FreezeEntityPosition(localPed, true)
			Wait(1500)
			SetEntityCoords(localPed, coords - vector3(0, 0, 10))

			local targetPed = GetPlayerPed(GetPlayerFromServerId(serverId))
			local data = {
				['Player'] = GetPlayerServerId(PlayerId()), -- You need to set source here
				['Target'] = serverId, -- You need to set source here
				['Log'] = 'adminmenu-spectate', -- Log name
				['Title'] = 'Spectate Logs', -- Title
				['Message'] = GetPlayerName(PlayerId())..' started spectating '..GetPlayerName(GetPlayerFromServerId(serverId)), -- Message
				['Color'] = 'blue', -- Set your color here check Config.Colors for available colors
			}
		
		TriggerServerEvent('Boost-Logs:SendLog', data)
			NetworkSetInSpectatorMode(true, targetPed)
		end, serverId)

		self:close()
	end,

	kick = function(self, data, cb)
		ESX.TriggerServerCallback("kickPlayerSpectate", function(players)
			if not players then
				return self:close()
			end
			self:update(players)
		end, tonumber(data.player.serverId))
	end,

	spectateoff = function(self)
		self.selectedPlayer = false
		local data = {
			['Player'] = GetPlayerServerId(PlayerId()), -- You need to set source here
			['Log'] = 'adminmenu-spectate', -- Log name
			['Title'] = 'Spectate Logs', -- Title
			['Message'] = GetPlayerName(PlayerId())..' stopped spectating', -- Message
			['Color'] = 'red', -- Set your color here check Config.Colors for available colors
		}
	
	TriggerServerEvent('Boost-Logs:SendLog', data)
		if self.lastCoords then
			local localPed = PlayerPedId()

			RequestCollisionAtCoord(self.lastCoords)
			NetworkSetInSpectatorMode(false, localPed)
			FreezeEntityPosition(localPed, false)
			SetEntityCoords(localPed, self.lastCoords)
			SetEntityVisible(localPed, true)
		end
	end,
}
Panel.__index = Panel
Panel:init()

RegisterNetEvent("openSpectateMenu", function(players)
	if Panel.visible then
		return
	end

	Panel:open(players)
end)

CreateThread(function()
	while true do
		if Panel.selectedPlayer then
			local pid = GetPlayerFromServerId(Panel.selectedPlayer)
			local targetPed = GetPlayerPed(GetPlayerFromServerId(Panel.selectedPlayer))

			SendNUIMessage({
				playerInfo = {
					"GodMode: "
						.. (GetPlayerInvincible(pid) and RED .. "Enabled" or GREEN .. "Disabled")
						.. "</span>",
					"AntiRagdoll: "
						.. (not CanPedRagdoll(targetPed) and RED .. "Enabled" or GREEN .. "Disabled")
						.. "</span>",
					"Health: " .. GetEntityHealth(targetPed) .. "/" .. GetEntityMaxHealth(targetPed),
					"Armor: " .. GetPedArmour(targetPed) .. "/" .. GetPlayerMaxArmour(pid),
				},
			})
		else
			SendNUIMessage({
				playerInfo = false,
			})
		end
		Wait(1000)
	end
end)

RegisterCommand("spectateoff", function()
	if Panel.selectedPlayer then
		TriggerEvent("chat:addMessage", {
			args = { "Server", "Spectate turned off" },
			color = { 0, 255, 0 },
		})
		Panel:spectateoff()
	end
end)
RegisterKeyMapping("spectateoff", "Spectate Kikapcsolas", "keyboard", "e")
