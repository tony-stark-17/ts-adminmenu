local ESX = exports['es_extended']:getSharedObject()

local TSGetNearbyEntities = function(entities, coords, modelFilter, maxDistance, isPed)
	local nearbyEntities = {}
	coords = type(coords) == 'number' and GetEntityCoords(GetPlayerPed(coords)) or vector3(coords.x, coords.y, coords.z)
	for _, entity in pairs(entities) do
		if not isPed or (isPed and not IsPedAPlayer(entity)) then
			if not modelFilter or modelFilter[GetEntityModel(entity)] then
				local entityCoords = GetEntityCoords(entity)
				if not maxDistance or #(coords - entityCoords) <= maxDistance then
					nearbyEntities[#nearbyEntities+1] = {entity=entity, coords=entityCoords}
				end
			end
		end
	end

	return nearbyEntities
end

local TSGetPlayers = function()
    local players = ESX.GetPlayers()
    local plylist = {}
    for i=1, #players, 1 do
  	local plytable = {source = players[i], name = GetPlayerName(players[i])}
        table.insert(plylist,plytable)
    end
    table.sort(plylist, function(a, b) return a.name:upper() < b.name:upper() end)
    return plylist
end


local TSGetVehiclesInArea = function(coords, maxDistance, modelFilter)
	return TSGetNearbyEntities(GetAllVehicles(), coords, modelFilter, maxDistance)
end
local TSSpawnVehicle = function(model, coords, heading, cb)
	if type(model) == 'string' then model = GetHashKey(model) end
	CreateThread(function()
		local entity = Citizen.InvokeNative(`CREATE_AUTOMOBILE`, model, coords.x, coords.y, coords.z, heading)
		while not DoesEntityExist(entity) do Wait(50) end
		cb(entity)
	end)
end


local IsPlayerAllowed = function(id,obj)
    
    local hasPermission = false
    if IsPrincipalAceAllowed(id,'TSAdmin.admin') then
    	if IsPrincipalAceAllowed(id,obj) or IsPrincipalAceAllowed(id,'TSAdmin.FullAccess') then
        	hasPermission = true
    	end
    end
    return hasPermission
end

lib.callback.register('ts-adminmenu:getAuthorization', function(source, obj)
    local xPlayer = ESX.GetPlayerFromId(source)
    local group = xPlayer?.getGroup()
    local allowed = false
    if IsPlayerAllowed(source,obj) or xPlayer and (group == 'admin' or group == 'superadmin') then
        allowed = true
    end
    return allowed
end)

RegisterCommand('tsadminlist', function(source, args, raw)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        print(IsPlayerAceAllowed(src,'TSAdmin.admin'))
        local group = xPlayer.getGroup()
        if group == 'admin' or group == 'superadmin' then
            TriggerClientEvent('table', src, PlyList)
        end
    end
end)

CheckAllowed = function(source, type)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local group = xPlayer.getGroup()
    local tonyaction = type
    local identifier = xPlayer.getIdentifier()
    local allowed = false
    if group == 'admin' or group == 'superadmin' then
        allowed = true
    else
        if IsPlayerAllowed(identifier,tonyaction) then
            allowed = true
        end
    end
    return allowed
end

RegisterNetEvent('ts-adminmenu:server:PlayerJoined', function()
    local src = source
    local xPlayer  = ESX.GetPlayerFromId(src)
    local Players = ESX.GetExtendedPlayers()
    for k, v in pairs(Players) do
        if CheckAllowed(v.source, 'TSAdmin.MiscSettings.JoinQNotif') then
            TriggerClientEvent('ts-adminmenu:client:JoinQ', v.source,
                '~o~' .. GetPlayerName(src) .. '~s~ Joined The Server')
        end
    end
    TriggerClientEvent('ts-adminmenu:client:PlayerJoined', -1,xPlayer)
end)


RegisterNetEvent('ts-adminmenu:server:removeCar', function(plate)
    local src = source
    local plate = plate
    local allowed = CheckAllowed(src, 'TSAdmin.PlayerOptions.DeleteCar')
    if allowed then
        MySQL.query('DELETE FROM owned_vehicles WHERE plate = @plate', {
            ['@plate'] = plate
        }, function()
            TriggerClientEvent('esx:showNotification', src, "You recieved a car with Plate: " .. vehProps.plate)
        end)
    end
end)

RegisterNetEvent('ts-adminmenu:server:giveCar', function(ply, props)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(tonumber(ply))
    local vehProps = props
    local allowed = CheckAllowed(xPlayer.source, 'TSAdmin.PlayerOptions.GiveCar')
    if allowed then
        MySQL.query('INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (@owner, @plate, @vehicle)', {
            ['@owner'] = yPlayer.identifier,
            ['@plate'] = vehProps.plate,
            ['@vehicle'] = json.encode(vehProps)
        }, function()
            TriggerClientEvent('esx:showNotification', yPlayer.source,
                "You recieved a car with Plate: " .. vehProps.plate)
        end)
    end
end)

RegisterNetEvent('ts-adminmenu:server:SetPed', function(plyId, ped)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(plyId)
    local ped2 = ped
    local allowed = CheckAllowed(xPlayer.source, 'TSAdmin.PlayerOptions.ChangePed')
    if yPlayer and allowed then
        TriggerClientEvent('ts-adminmenu:client:SetPed', yPlayer.source, ped2)
    end
end)

RegisterNetEvent('ts-adminmenu:server:ShowInventory', function(ply)
    local src = source
    local Ply = ply
    local allowed = CheckAllowed(src, 'TSAdmin.OnlinePlyOptions.OpenInventory')
    if allowed then
        local inv = exports.ox_inventory:Inventory(tonumber(Ply))
        TriggerClientEvent('ox_inventory:viewInventory', src, inv)
    end

end)

RegisterNetEvent('ts-adminmenu:server:playerDied', function(data)
    local info = data
    local ply = info.player_id
    local ply2 = info.player_2_id
    local reason = info.death_reason
    local xPlayer = ESX.GetPlayerFromId(ply)
    local Players = ESX.GetExtendedPlayers()
    local yPlayer
    if ply2 then
        yPlayer = ESX.GetPlayerFromId(ply2)
    end
    local msg

    if ply2 then
        msg = '~o~' .. xPlayer.getName() .. '~s~ was killed by ~y~' .. yPlayer.getName() .. '~s~ Death Cause: ' ..
                  reason
    else
        msg = '~o~' .. xPlayer.getName() .. '~s~ died Reason: ' .. reason
    end
    for k, v in pairs(Players) do
        if CheckAllowed(v.playerId, 'TSAdmin.MiscSettings.Kill') then
            TriggerClientEvent('ts-adminmenu:client:killnotif', v.playerId, msg)
        end
    end

end)

AddEventHandler('playerDropped', function(reason)
    local src = source
    local reason = reason
    local Players = ESX.GetExtendedPlayers()
    for k, v in pairs(Players) do
        if CheckAllowed(v.source, 'TSAdmin.MiscSettings.JoinQNotif') then
            TriggerClientEvent('ts-adminmenu:client:JoinQ', v.playerId,
                '~o~' .. GetPlayerName(src) .. '~s~ Left The Server Reason: ~y~' .. reason .. '~s~')
        end
    end
end)


RegisterNetEvent('ts-adminmenu:server:HealPlayer', function(pid)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(pid)
    local allowed = CheckAllowed(xPlayer.source, 'TSAdmin.OnlinePlyOptions.Heal')
    if allowed then
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Target'] = yPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-heal', -- Log name
            ['Title'] = 'Heal Logs', -- Title
            ['Message'] = yPlayer.getName() .. ' was healed by ' .. xPlayer.getName(), -- Message
            ['Color'] = 'blue' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
        yPlayer.triggerEvent('esx_basicneeds:healPlayer')
    else
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Target'] = yPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-heal-err', -- Log name
            ['Title'] = 'Heal Logs - ERR', -- Title
            ['Message'] = "Unauthorized player triggered event: ts-adminmenu:server:HealPlayer, Triggered By: " ..
                xPlayer.getName(), -- Message
            ['Color'] = 'red' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
    end
end)

lib.callback.register('ts-adminmenu:server:GetJobs', function(source)
    local jobs = ESX.GetJobs()
    return jobs
end)

RegisterNetEvent('ts-adminmenu:server:SetJob', function(pid, job, grade)
    local xPlayer = ESX.GetPlayerFromId(source)
    local job = job
    local grade = tonumber(grade)
    local yPlayer = ESX.GetPlayerFromId(pid)
    local allowed = CheckAllowed(xPlayer.source, 'TSAdmin.OnlinePlyOptions.SetJob')
    if allowed then

        if ESX.DoesJobExist(job, grade) then
            local data = {
                ['Player'] = xPlayer.source, -- You need to set source here
                ['Target'] = yPlayer.source, -- You need to set source here
                ['Log'] = 'adminmenu-setjob', -- Log name
                ['Title'] = 'Job Logs', -- Title
                ['Message'] = yPlayer.getName() .. ' was assigned job ' .. job .. ' grade: ' .. grade .. ' by ' ..
                    xPlayer.getName(), -- Message
                ['Color'] = 'blue' -- Set your color here check Config.Colors for available colors
            }

            TriggerEvent('Boost-Logs:SendLog', data)
            yPlayer.setJob(job, grade)
        else
            xPlayer.showNotification("Job or grade invalid!")
        end
    else
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Target'] = yPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-heal-err', -- Log name
            ['Title'] = 'Job Logs - ERR', -- Title
            ['Message'] = "Unauthorized player triggered event: ts-adminmenu:server:SetJob, Triggered By: " ..
                xPlayer.getName(), -- Message
            ['Color'] = 'red' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
    end
end)
RegisterNetEvent('ts-adminmenu:server:GiveAccMoney', function(pid, acc, amount)
    print("REACHSER")
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(pid)
    local allowed = CheckAllowed(xPlayer.source, 'TSAdmin.OnlinePlyOptions.GiveMoney')
    local account = acc
    local money = tonumber(amount)
    if allowed then
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Target'] = yPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-giveaccm', -- Log name
            ['Title'] = 'Give Account Money Logs', -- Title
            ['Message'] = yPlayer.getName() .. ' recieved money in ' .. account .. ' from ' .. xPlayer.getName(), -- Message
            ['Color'] = 'blue' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
        if account == 'money' or account == 'bank' or account == 'black_money' then
            yPlayer.addAccountMoney(account, money)
        end
    else
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Target'] = yPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-giveaccm-err', -- Log name
            ['Title'] = 'Give Account Money Logs - ERR', -- Title
            ['Message'] = xPlayer.getName() ..
                ' tried to use unauthorized event: ts-adminmenu:server:GiveAccMoney to give money to ' ..
                yPlayer.getName(), -- Message
            ['Color'] = 'red' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
    end
end)

RegisterNetEvent('ts-adminmenu:server:RemoveAccMoney', function(pid, acc, amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(pid)
    local allowed = CheckAllowed(xPlayer.source, 'TSAdmin.OnlinePlyOptions.GiveMoney')
    local account = acc
    local money = tonumber(amount)
    if allowed then
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Target'] = yPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-removeaccm', -- Log name
            ['Title'] = 'Remove Account Money Logs', -- Title
            ['Message'] = xPlayer.getName() .. ' removed money from ' .. account .. ' of ' .. yPlayer.getName(), -- Message
            ['Color'] = 'blue' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
        if account == 'money' or account == 'bank' or account == 'black_money' then
            yPlayer.removeAccountMoney(account, money)
        end
    else
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Target'] = yPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-removeaccm-err', -- Log name
            ['Title'] = 'Remove Account Money Logs - ERR', -- Title
            ['Message'] = xPlayer.getName() ..
                ' tried to use unauthorized event: ts-adminmenu:server:RemoveAccMoney to remove money from ' ..
                yPlayer.getName(), -- Message
            ['Color'] = 'red' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
    end
end)

RegisterNetEvent('ts-adminmenu:server:RevivePlayer', function(pid)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(pid)
    local allowed = CheckAllowed(xPlayer.source, 'TSAdmin.OnlinePlyOptions.Revive')
    if allowed then
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Target'] = yPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-revivep', -- Log name
            ['Title'] = 'Revive Logs', -- Title
            ['Message'] = xPlayer.getName() .. ' revived ' .. yPlayer.getName(), -- Message
            ['Color'] = 'blue' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
        yPlayer.triggerEvent('esx_ambulancejob:revive')
    else
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Target'] = yPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-revivep-err', -- Log name
            ['Title'] = 'Revive Logs -ERR', -- Title
            ['Message'] = xPlayer.getName() .. ' tried to revive without authorization ' .. yPlayer.getName(), -- Message
            ['Color'] = 'red' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
    end
end)

RegisterNetEvent('ts-adminmenu:server:Goto', function(pid)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(pid)
    local allowed = CheckAllowed(xPlayer.source, 'TSAdmin.OnlinePlyOptions.Goto')
    local yPlyCoords = yPlayer.getCoords()
    if allowed then
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Target'] = yPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-goto', -- Log name
            ['Title'] = 'Goto Logs', -- Title
            ['Message'] = xPlayer.getName() .. ' teleported to ' .. yPlayer.getName(), -- Message
            ['Color'] = 'blue' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
        xPlayer.setCoords(yPlyCoords)
    else
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Target'] = yPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-goto-err', -- Log name
            ['Title'] = 'Goto Logs -ERR', -- Title
            ['Message'] = xPlayer.getName() .. ' tried to teleport without authorization to ' .. yPlayer.getName(), -- Message
            ['Color'] = 'red' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
    end
end)

RegisterNetEvent('ts-adminmenu:server:Bring', function(pid)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(pid)
    local xPlyCoords = xPlayer.getCoords()
    local allowed = CheckAllowed(xPlayer.source, 'TSAdmin.OnlinePlyOptions.Bring')
    if allowed then
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Target'] = yPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-bring', -- Log name
            ['Title'] = 'Bring Logs', -- Title
            ['Message'] = xPlayer.getName() .. ' brought ' .. yPlayer.getName(), -- Message
            ['Color'] = 'blue' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
        yPlayer.setCoords(xPlyCoords)
    else
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Target'] = yPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-bring-err', -- Log name
            ['Title'] = 'Bring Logs - ERR', -- Title
            ['Message'] = xPlayer.getName() .. ' tried to bring without authorization ' .. yPlayer.getName(), -- Message
            ['Color'] = 'red' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
    end
end)
RegisterNetEvent('ts-adminmenu:server:SetWaypoint', function(pid)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(pid)
    local yPlyCoords = yPlayer.getCoords(true)
    local allowed = CheckAllowed(xPlayer.source, 'TSAdmin.OnlinePlyOptions.SetWaypoint')
    if allowed then
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Target'] = yPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-setwaypoint', -- Log name
            ['Title'] = 'Set Waypoint Logs', -- Title
            ['Message'] = xPlayer.getName() .. ' set his waypoint to ' .. yPlayer.getName(), -- Message
            ['Color'] = 'blue' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
        TriggerClientEvent('ts-adminmenu:client:SetWaypoint', xPlayer.source, yPlyCoords)
    else
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Target'] = yPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-setwaypoint-err', -- Log name
            ['Title'] = 'Set Waypoint Logs -ERR', -- Title
            ['Message'] = xPlayer.getName() .. ' tried to set his waypoint without authorization to ' ..
                yPlayer.getName(), -- Message
            ['Color'] = 'red' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
    end
end)

RegisterNetEvent('ts-adminmenu:server:PrintID', function(pid)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(pid)
    local allowed = CheckAllowed(xPlayer.source, 'TSAdmin.OnlinePlyOptions.PRINTID')
    local steamid, license, xbl, ip, discord, liveid = nil, nil, nil, nil, nil, nil
    if allowed then
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Target'] = yPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-printid', -- Log name
            ['Title'] = 'Print ID Logs', -- Title
            ['Message'] = xPlayer.getName() .. ' printed identifiers of ' .. yPlayer.getName(), -- Message
            ['Color'] = 'blue' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
        for k, v in pairs(GetPlayerIdentifiers(yPlayer.source)) do
            if string.sub(v, 1, string.len("steam:")) == "steam:" then
                steamid = v
            elseif string.sub(v, 1, string.len("license:")) == "license:" then
                license = v
            elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
                xbl = v
            elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
                ip = v
            elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
                discord = v
            elseif string.sub(v, 1, string.len("live:")) == "live:" then
                liveid = v
            end
        end
        TriggerClientEvent('ts-adminmenu:client:PrintID', xPlayer.source, steamid, license, xbl, ip, discord, liveid)
    else
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Target'] = yPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-printid-err', -- Log name
            ['Title'] = 'Print ID Logs -ERR', -- Title
            ['Message'] = xPlayer.getName() .. ' tried to print identifiers without authorization of ' ..
                yPlayer.getName(), -- Message
            ['Color'] = 'red' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
    end
end)

RegisterNetEvent('ts-adminmenu:server:KillPlayer', function(pid)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(pid)
    local allowed = CheckAllowed(xPlayer.source, 'TSAdmin.OnlinePlyOptions.KillPlayer')
    if allowed then
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Target'] = yPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-killp', -- Log name
            ['Title'] = 'Kill Logs', -- Title
            ['Message'] = xPlayer.getName() .. ' killed ' .. yPlayer.getName(), -- Message
            ['Color'] = 'blue' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
        TriggerClientEvent('ts-adminmenu:client:Kill', yPlayer.source)
    else
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Target'] = yPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-killp-err', -- Log name
            ['Title'] = 'Kill Logs -ERR', -- Title
            ['Message'] = xPlayer.getName() .. ' tried to kill without autorization ' .. yPlayer.getName(), -- Message
            ['Color'] = 'red' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
    end
end)

RegisterNetEvent('ts-adminmenu:server:KickPlayer', function(pid)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(pid)
    local allowed = CheckAllowed(xPlayer.source, 'TSAdmin.OnlinePlyOptions.KickPlayer')
    if allowed then
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Target'] = yPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-kickp', -- Log name
            ['Title'] = 'Kick Logs', -- Title
            ['Message'] = xPlayer.getName() .. ' kicked ' .. yPlayer.getName(), -- Message
            ['Color'] = 'blue' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
        yPlayer.kick("You Have been kicked from the server by: " .. xPlayer.getName())
    else
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Target'] = yPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-kickp-err', -- Log name
            ['Title'] = 'Kick Logs -ERR', -- Title
            ['Message'] = xPlayer.getName() .. ' tried to kick without authorization ' .. yPlayer.getName(), -- Message
            ['Color'] = 'red' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
    end
end)

RegisterNetEvent('ts-adminmenu:server:DeleteVehicle', function(radi)
    local xPlayer = ESX.GetPlayerFromId(source)
    local allowed = CheckAllowed(xPlayer.source, 'TSAdmin.VehicleRelatedOptions.DeleteVehicle')
    local radius = 1.0
    if radi ~= nil then
        radius = tonumber(radi) + 0.0
    end
    local veh = GetVehiclePedIsIn(GetPlayerPed(xPlayer.source))
    if allowed then
        if veh ~= 0 then
            DeleteEntity(veh)
        else
            local vehs = TSGetVehiclesInArea(GetEntityCoords(GetPlayerPed(xPlayer.source)), radius)
            for i = 1, #vehs do
                DeleteEntity(vehs[i].entity)
                local data = {
                    ['Player'] = xPlayer.source, -- You need to set source here
                    ['Log'] = 'adminmenu-spawncar', -- Log name
                    ['Title'] = 'Delete Car Logs', -- Title
                    ['Message'] = xPlayer.getName() .. ' deleted vehicle model: ' .. GetEntityModel(veh), -- Message
                    ['Color'] = 'red' -- Set your color here check Config.Colors for available colors
                }
        
                TriggerEvent('Boost-Logs:SendLog', data)
            end
        end
        
        TriggerClientEvent('esx:deleteVehicle', xPlayer.source, radius)
    else
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-kickp-err', -- Log name
            ['Title'] = 'Delete Car Logs', -- Title
            ['Message'] = xPlayer.getName() .. ' tried to delete vehicle without authorization', -- Message
            ['Color'] = 'red' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
    end
end)

RegisterNetEvent('ts-adminmenu:server:ChangeSkin', function(ply)
    local yPlayer = ESX.GetPlayerFromId(ply)
    local xPlayer = ESX.GetPlayerFromId(source)
    local allowed = CheckAllowed(xPlayer.source, 'TSAdmin.OnlinePlyOptions.ChangeSkin')
    yPlayer.triggerEvent('esx_skin:openSaveableMenu')
end)

RegisterNetEvent('ts-adminmenu:server:SendMessage', function(pid, msg)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(pid)
    local message = msg
    local allowed = CheckAllowed(xPlayer.source, 'TSAdmin.OnlinePlyOptions.SendMessage')
    if allowed then
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Target'] = yPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-sendm', -- Log name
            ['Title'] = 'Send Message Logs', -- Title
            ['Message'] = xPlayer.getName() .. ' sent msg: ' .. msg .. ' to ' .. yPlayer.getName(), -- Message
            ['Color'] = 'blue' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
        TriggerClientEvent('chat:addMessage', yPlayer.source, {
            template = '<div class="chat-message system"><i class="fas fa-comment"></i> <b><span style="color: #df7b00">{0}</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;"> - {1}</span></b><div style="margin-top: 5px; font-weight: 300;"><b>{2}</b></div></div>',
            args = {"TS Adminmenu", xPlayer.getName(), msg}
        })
    else
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Target'] = yPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-sendm-err', -- Log name
            ['Title'] = 'Send Message Logs -ERR', -- Title
            ['Message'] = xPlayer.getName() .. ' tried to send msg: ' .. msg .. ' to ' .. yPlayer.getName(), -- Message
            ['Color'] = 'red' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
    end
end)

RegisterNetEvent('ts-adminmenu:server:GiveItem', function(pid, item, count)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerId = pid
    local titem = item
    local amount = count
    local yPlayer = ESX.GetPlayerFromId(playerId)
    local allowed = CheckAllowed(source, 'TSAdmin.OnlinePlyOptions.GiveItem') or
                        CheckAllowed(source, 'TSAdmin.OnlinePlyOptions.GiveItemName')
    if allowed then
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Target'] = yPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-giveitem', -- Log name
            ['Title'] = 'Give Item Logs', -- Title
            ['Message'] = xPlayer.getName() .. ' gave item: ' .. titem .. ' to ' .. yPlayer.getName(), -- Message
            ['Color'] = 'blue' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
        yPlayer.addInventoryItem(titem, amount)
    else
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Target'] = yPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-giveitem-err', -- Log name
            ['Title'] = 'Give Item Logs -ERR', -- Title
            ['Message'] = xPlayer.getName() .. ' tried to give item: ' .. titem .. ' without authorization to ' ..
                yPlayer.getName(), -- Message
            ['Color'] = 'red' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
    end
end)

RegisterNetEvent('ts-adminmenu:server:GetItems', function(pid)
    local src = source
    local playerId = pid
    local yPlayer = ESX.GetPlayerFromId(playerId)
    local item = exports.ox_inventory:Inventory(playerId).items
    local allowed = CheckAllowed(source, 'TSAdmin.OnlinePlyOptions.RemoveInventoryItem')
    if allowed then
        table.sort(item, function(a, b)
            return a.name:upper() < b.name:upper()
        end)
        TriggerClientEvent('ts-adminmenu:client:RemoveItem', src, pid, item)
    end
end)

RegisterNetEvent('ts-adminmenu:server:RemoveItem', function(pid, item, count)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerId = pid
    local yPlayer = ESX.GetPlayerFromId(playerId)
    local titem = item
    local amount = count
    local allowed = CheckAllowed(source, 'TSAdmin.OnlinePlyOptions.RemoveInventoryItem')
    if allowed then
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Target'] = yPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-removeitem', -- Log name
            ['Title'] = 'Remove Item Logs', -- Title
            ['Message'] = xPlayer.getName() .. ' removed item: ' .. titem .. ' x' .. amount .. ' from ' ..
                yPlayer.getName(), -- Message
            ['Color'] = 'blue' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
        yPlayer.removeInventoryItem(titem, amount)
    else
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Target'] = yPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-removeitem-err', -- Log name
            ['Title'] = 'Remove Item Logs -ERR', -- Title
            ['Message'] = xPlayer.getName() .. ' tried to remove item: ' .. titem .. ' without authorization from ' ..
                yPlayer.getName(), -- Message
            ['Color'] = 'red' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
    end
end)

RegisterNetEvent('ts-adminmenu:server:SpawnVehicle', function(veh)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerPed = GetPlayerPed(source)
    local model = veh
    local vehicle = GetVehiclePedIsIn(playerPed)
    local allowed = CheckAllowed(source, 'TSAdmin.VehicleRelatedOptions.Spawner')
    if allowed then
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-spawncar', -- Log name
            ['Title'] = 'Spawn Vehicle Logs', -- Title
            ['Message'] = xPlayer.getName() .. ' spawned vehicle ' .. model, -- Message
            ['Color'] = 'blue' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
        if vehicle then
            DeleteEntity(vehicle)
        end
        Wait(100)
        TSSpawnVehicle(model or `baller2`, GetEntityCoords(playerPed), GetEntityHeading(playerPed), function(car)
            local timeout = 50
            repeat
                Wait(0)
                timeout = timeout - 1
                SetPedIntoVehicle(playerPed, car, -1)
            until GetVehiclePedIsIn(playerPed, false) ~= 0 or timeout < 1
        end)
    else
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-spawncar-err', -- Log name
            ['Title'] = 'Spawn Vehicle Logs -ERR', -- Title
            ['Message'] = xPlayer.getName() .. ' tried to spawn vehicle without authorization ' .. model, -- Message
            ['Color'] = 'blue' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
    end
end)

RegisterNetEvent('ts-adminmenu:server:PlayerFart', function(type)
    local src = source
    local farttype = type
    local plyList = TSGetPlayers()
    local allowed = CheckAllowed(src, 'TSAdmin.TrollMenu.Fart')
    if allowed then
        TriggerClientEvent('ts-adminmenu:client:PlayFart', src, plyList, farttype)
    end
end)

RegisterNetEvent('ts-adminmenu:server:propspawner', function()
    local src = source
    local allowed = CheckAllowed(src, 'TSAdmin.MiscSettings.PropSpawn')
    if allowed then
        exports.oxmysql:query('SELECT * FROM props_spawn ORDER BY id DESC', {}, function(result)
            TriggerClientEvent('lg: openPropMenu', src, result)
        end)
    end
end)

RegisterNetEvent('ts-adminmenu:server:SendStaff', function(txt)
    local src = source
    local msg = txt
    local xPlayer = ESX.GetPlayerFromId(src)
    local time = os.date('%H:%M')
    local allowed = CheckAllowed(src, 'TSAdmin.MiscSettings.StaffChat')
    if allowed then
        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div class="chat-message staff"><i class="fas fa-shield-alt"></i> <b><span style="color: #1ebc62">[STAFF] {0}</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;">{2}</span></b><div style="margin-top: 5px; font-weight: 300;">{1}</div></div>',
            args = {xPlayer.getName(), msg, time}
        })
    end
end)

RegisterNetEvent('ts-adminmenu:server:PlayFartFromServer', function(data)
    print(data)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local farttype = data.type
    local ply = data.ply
    local yPlayer = ESX.GetPlayerFromId(ply)
    local netId = NetworkGetNetworkIdFromEntity(GetPlayerPed(yPlayer.source))
    local allowed = CheckAllowed(src, 'TSAdmin.TrollMenu.Fart')
    if allowed then
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Target'] = yPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-playfart', -- Log name
            ['Title'] = 'Fart Logs', -- Title
            ['Message'] = xPlayer.getName() .. ' played fart on ' .. yPlayer.getName(), -- Message
            ['Color'] = 'blue' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
        if farttype == 'bbfart' then
            TriggerEvent('chHyperSound:playOnEntity', netId, -1, 'bassboostedfart', false, 40.0, -1)
        elseif farttype == 'cmfart' then
            TriggerEvent('chHyperSound:playOnEntity', netId, -1, 'commonfart', false, 40.0, -1)
        elseif farttype == 'pwrfart' then
            TriggerEvent('chHyperSound:playOnEntity', netId, -1, 'peverfulfart', false, 40.0, -1)
        elseif farttype == 'smfart' then
            TriggerEvent('chHyperSound:playOnEntity', netId, -1, 'smellyfart', false, 40.0, -1)
        end
    else
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Target'] = yPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-playfart-err', -- Log name
            ['Title'] = 'Fart Logs -ERR', -- Title
            ['Message'] = xPlayer.getName() .. ' tried to play fart without authorization on ' .. yPlayer.getName(), -- Message
            ['Color'] = 'red' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
    end
end)

RegisterNetEvent('ts-adminmenu:server:TruckPunchlinePly', function(data)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(data.plyid)
    local allowed = CheckAllowed(xPlayer.source, 'TSAdmin.TrollMenu.Truck')
    if allowed then
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Target'] = yPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-truckpunch', -- Log name
            ['Title'] = 'Truck Punchline Logs', -- Title
            ['Message'] = xPlayer.getName() .. ' did a truck punchline on ' .. yPlayer.getName(), -- Message
            ['Color'] = 'blue' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
        TriggerClientEvent('ts-adminmenu:troll:TruckPunchline', yPlayer.source)
    else
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Target'] = yPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-truckpunch-err', -- Log name
            ['Title'] = 'Truck Punchline Logs -ERR', -- Title
            ['Message'] = xPlayer.getName() .. ' tried a truck punchline without authorization on ' .. yPlayer.getName(), -- Message
            ['Color'] = 'red' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
    end
end)

RegisterNetEvent('ts-adminmenu:server:ClownAttackPly', function(data)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(data.plyid)
    local allowed = CheckAllowed(xPlayer.source, 'TSAdmin.TrollMenu.Clown')
    if allowed then
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Target'] = yPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-clownattack', -- Log name
            ['Title'] = 'Clown Attack Logs', -- Title
            ['Message'] = xPlayer.getName() .. ' did a clown attack on ' .. yPlayer.getName(), -- Message
            ['Color'] = 'blue' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
        TriggerClientEvent('ts-adminmenu:troll:ClownAttack', yPlayer.source)
    else
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Target'] = yPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-clownattack-err', -- Log name
            ['Title'] = 'Clown Attack Logs -ERR', -- Title
            ['Message'] = xPlayer.getName() .. ' tried a clown attack without authorization on ' .. yPlayer.getName(), -- Message
            ['Color'] = 'red' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
    end
end)

RegisterNetEvent('ts-adminmenu:server:MerryAttackPly', function(data)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(data.plyid)
    local allowed = CheckAllowed(xPlayer.source, 'TSAdmin.TrollMenu.Merry')
    if allowed then
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Target'] = yPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-merryattack', -- Log name
            ['Title'] = 'Merry Attack Logs', -- Title
            ['Message'] = xPlayer.getName() .. ' did a merry attack on ' .. yPlayer.getName(), -- Message
            ['Color'] = 'blue' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
        TriggerClientEvent('ts-adminmenu:troll:MerryAttack', yPlayer.source)
    else
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Target'] = yPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-merryattack-err', -- Log name
            ['Title'] = 'Merry Attack Logs -ERR', -- Title
            ['Message'] = xPlayer.getName() .. ' tried a merry attack without authorization on ' .. yPlayer.getName(), -- Message
            ['Color'] = 'red' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
    end
end)

RegisterNetEvent('ts-adminmenu:server:FlashPly', function(data)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(data.plyid)
    local allowed = CheckAllowed(xPlayer.source, 'TSAdmin.TrollMenu.Flash')
    if allowed then
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Target'] = yPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-flash', -- Log name
            ['Title'] = 'Flashbang Logs', -- Title
            ['Message'] = xPlayer.getName() .. ' did a flashbang on ' .. yPlayer.getName(), -- Message
            ['Color'] = 'blue' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
        TriggerClientEvent('ts-adminmenu:troll:FlashPly', yPlayer.source)
    else
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Target'] = yPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-flash-err', -- Log name
            ['Title'] = 'Flashbang Logs -ERR', -- Title
            ['Message'] = xPlayer.getName() .. ' tried a flashbang without authorization on ' .. yPlayer.getName(), -- Message
            ['Color'] = 'red' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
    end
end)

RegisterNetEvent('ts-adminmenu:server:Announce', function(txt)
    local allowed = CheckAllowed(source, 'TSAdmin.MiscSettings.Announce')
    if allowed then
        TriggerClientEvent('bvrtck_announce:annouce', -1, txt)
    end
end)

RegisterNetEvent('ts-adminmenu:server:FakeCallply', function(data2)
    print(data2.plyid, data2.type)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(data2.plyid)
    local allowed = CheckAllowed(xPlayer.source, 'TSAdmin.TrollMenu.FakeSound')
    if allowed then
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Target'] = yPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-fakecall', -- Log name
            ['Title'] = 'Fake Call Logs', -- Title
            ['Message'] = xPlayer.getName() .. ' did a fake call on ' .. yPlayer.getName(), -- Message
            ['Color'] = 'blue' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
        TriggerClientEvent('ts-adminmenu:troll:FakeCall', yPlayer.source, data2.type)
    else
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Target'] = yPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-fakecall-err', -- Log name
            ['Title'] = 'Fake Call Logs -ERR', -- Title
            ['Message'] = xPlayer.getName() .. ' tried a fake call without authorization on ' .. yPlayer.getName(), -- Message
            ['Color'] = 'red' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
    end
end)

RegisterNetEvent('ts-adminmenu:server:LagGame', function(data2)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(data2.plyid)
    local allowed = CheckAllowed(xPlayer.source, 'TSAdmin.TrollMenu.Lag')
    if allowed then
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Target'] = yPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-laggame', -- Log name
            ['Title'] = 'Lag Game Logs', -- Title
            ['Message'] = xPlayer.getName() .. ' did a Lag Game on ' .. yPlayer.getName(), -- Message
            ['Color'] = 'blue' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
        TriggerClientEvent('ts-adminmenu:troll:LagGame', yPlayer.source)
    else
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Target'] = yPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-laggame-err', -- Log name
            ['Title'] = 'Lag Game Logs -ERR', -- Title
            ['Message'] = xPlayer.getName() .. ' tried a Lag Game without authorization on ' .. yPlayer.getName(), -- Message
            ['Color'] = 'red' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
    end
end)

RegisterNetEvent('ts-adminmenu:server:BlowPly', function(data2)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(data2.plyid)
    local allowed = CheckAllowed(xPlayer.source, 'TSAdmin.TrollMenu.BlowTyre')
    if allowed then
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Target'] = yPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-blowtyre', -- Log name
            ['Title'] = 'Blow Tyre Logs', -- Title
            ['Message'] = xPlayer.getName() .. ' blowed tyres of car of ' .. yPlayer.getName(), -- Message
            ['Color'] = 'blue' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
        TriggerClientEvent('ts-adminmenu:troll:BlowPly', yPlayer.source)
    else
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Target'] = yPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-blowtyre-err', -- Log name
            ['Title'] = 'Blow Tyre Logs -ERR', -- Title
            ['Message'] = xPlayer.getName() .. ' tried to blow tyres of car of ' .. yPlayer.getName(), -- Message
            ['Color'] = 'red' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
    end
end)

RegisterNetEvent('ts-adminmenu:server:EjectPly', function(data2)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(data2.plyid)
    local allowed = CheckAllowed(xPlayer.source, 'TSAdmin.TrollMenu.Eject')
    if allowed then
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Target'] = yPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-eject', -- Log name
            ['Title'] = 'Eject From Car Logs', -- Title
            ['Message'] = yPlayer.getName() .. ' was ejected from car by ' .. xPlayer.getName(), -- Message
            ['Color'] = 'blue' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
        TriggerClientEvent('ts-adminmenu:troll:EjectPly', yPlayer.source)
    else
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Target'] = yPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-eject-err', -- Log name
            ['Title'] = 'Eject From Car Logs -ERR', -- Title
            ['Message'] = xPlayer.getName() .. ' tried to eject ' .. yPlayer.getName() .. 'without authorization', -- Message
            ['Color'] = 'red' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
    end
end)

RegisterNetEvent('ts-adminmenu:server:Crashply', function(data2)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(data2.plyid)
    local allowed = CheckAllowed(xPlayer.source, 'TSAdmin.TrollMenu.Crash')
    if allowed then
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Target'] = yPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-crash', -- Log name
            ['Title'] = 'Crash Logs', -- Title
            ['Message'] = yPlayer.getName() .. ' was crashed by ' .. xPlayer.getName(), -- Message
            ['Color'] = 'blue' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
        TriggerClientEvent('ts-adminmenu:troll:Crashply', yPlayer.source)
    else

        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Target'] = yPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-crash-err', -- Log name
            ['Title'] = 'Crash Logs -ERR', -- Title
            ['Message'] = xPlayer.getName() .. ' tried to crash without authorization ' .. yPlayer.getName(), -- Message
            ['Color'] = 'red' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
    end
end)

RegisterNetEvent("ts-adminmenu:server:ToggleLicense", function(playerId, license)
    local playerId = playerId
    local license = license
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(playerId)
    local allowed = CheckAllowed(xPlayer.source, 'TSAdmin.OnlinePlyOptions.License')
    if allowed then
        local found = false
        TriggerEvent("esx_license:getLicensesList", function(licenses)
            for i, l in pairs(licenses) do
                if l.type == license then
                    found = true
                    TriggerEvent("esx_license:checkLicense", playerId, license, function(hasLicense)
                        if hasLicense then
                            TriggerEvent("esx_license:removeLicense", playerId, license)
                            local data = {
                                ['Player'] = xPlayer.source, -- You need to set source here
                                ['Target'] = yPlayer.source, -- You need to set source here
                                ['Log'] = 'adminmenu-togglelicense', -- Log name
                                ['Title'] = 'License Logs', -- Title
                                ['Message'] = xPlayer.getName() .. ' removed license: ' .. license .. ' of ' ..
                                    yPlayer.getName(), -- Message
                                ['Color'] = 'blue' -- Set your color here check Config.Colors for available colors
                            }

                            TriggerEvent('Boost-Logs:SendLog', data)
                            xPlayer.showNotification(yPlayer.getName(playerId) .. "'s " .. license ..
                                                         " has been removed ")
                        else
                            TriggerEvent("esx_license:addLicense", playerId, license)
                            local data = {
                                ['Player'] = xPlayer.source, -- You need to set source here
                                ['Target'] = yPlayer.source, -- You need to set source here
                                ['Log'] = 'adminmenu-togglelicense', -- Log name
                                ['Title'] = 'License Logs', -- Title
                                ['Message'] = xPlayer.getName() .. ' added license: ' .. license .. ' of ' ..
                                    yPlayer.getName(), -- Message
                                ['Color'] = 'blue' -- Set your color here check Config.Colors for available colors
                            }

                            TriggerEvent('Boost-Logs:SendLog', data)
                            xPlayer.showNotification(yPlayer.getName(playerId) .. " has been added the license " ..
                                                         license)
                        end
                    end)
                end
            end
        end)
        Wait(3000)
        if not found then
            xPlayer.showNotification("This License does not exist.")
        end
    else
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Target'] = yPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-togglelicense-err', -- Log name
            ['Title'] = 'License Logs -ERR', -- Title
            ['Message'] = xPlayer.getName() .. ' tried to toggle license without authorization of ' .. yPlayer.getName(), -- Message
            ['Color'] = 'red' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
    end
end)

lib.callback.register('ts-adminmenu:server:GetOnlinePlayers', function(source)
    return TSGetPlayers()
end)

