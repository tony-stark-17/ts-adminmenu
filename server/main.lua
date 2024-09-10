local ESX = exports['es_extended']:getSharedObject()
local BanList = {}
local Admins = {}
CreateThread(function ()
    Admins = json.decode(LoadResourceFile(GetCurrentResourceName(), "server/admin_list.json")) and json.decode(LoadResourceFile(GetCurrentResourceName(), "server/admin_list.json"))[1]
end)
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

local function OnPlayerConnecting(name, setKickReason, deferrals)
    local player = source
    deferrals.defer()
    local banned
    local banid
    local identifiers = GetPlayerIdentifiers(player)
    deferrals.update("Checking Bans")
    for k,v in pairs(identifiers)do               
        for i,j in pairs(BanList) do
            for t,s in pairs(j) do
                if tostring(v) == tostring(s) then
                    banid = i
                    banned = true
                end
            end
            if banned then break end
        end
    end
    Citizen.Wait(0)
    if banned then
        deferrals.done("You are banned from this server by - TS Admin Menu - Ban ID: "..banid)
    else
        deferrals.done()
    end
end

AddEventHandler("playerConnecting", OnPlayerConnecting)

local unban = function(bid)
    local Data = LoadResourceFile(GetCurrentResourceName(), "bans.json")
    local bid = tonumber(bid)
    local content = json.decode(Data)
    local oldData = content[bid]
    content[bid] = nil
    local saved = SaveResourceFile(GetCurrentResourceName(), "bans.json", json.encode(content, {indent = true}), -1)
    if saved then
        print("Saved Bans.json")
    end
    for k,v in pairs(BanList) do
        for t,s in pairs(v) do
            for i,j in pairs(oldData) do
                if tostring(j) == tostring(s) then
                    BanList[k] = nil
                    break
                end
            end
            
        end
    end
end

RegisterCommand('tsunban', function(source,args,raw)
    if source == 0 then unban(args[1]) return end
    local allowed = CheckAllowed(source,'UnbanPlayer','MiscSettings')
    if allowed then
        unban(args[1])
    end
end, true)

RegisterNetEvent('ts-adminmenu:server:UnbanPlayer', function(data)
    local allowed = CheckAllowed(source,'UnbanPlayer','MiscSettings')
    if allowed then
        unban(data[1])
    end
end)

Citizen.CreateThread(function()
    local Data = LoadResourceFile(GetCurrentResourceName(), "bans.json")

    if not Data or Data == '' then
        Data = "[]"
    local saved = SaveResourceFile(GetCurrentResourceName(), "bans.json", "[]", -1)
    if saved then
        print("Saved Bans.json")
    end
    end
    BanList = json.decode(Data)
end)
  

local TSGetPlayers = function()
    local players = ESX.GetExtendedPlayers()
    local plylist = {}
    for k,v in pairs(players) do
        local plytable = {source = v.source, name = GetPlayerName(v.source) or v.getName(), ign = v.getName(), gender = v.get('sex')}
        plylist[#plylist+1] = plytable
    end
    players = nil
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


local IsPlayerAllowed = function(ply,obj,class)
    local hasPermission = false
    if Admins[ply] then
        if Admins[class] then
            if Admins[class].FullAccess or Admins[class][obj] or Admins.FullAccess then
                hasPermission = true
            end
        else
            if Admins[obj] then
                hasPermission = true
            end
        end
    end
    return hasPermission
end

CheckAllowed = function(source, obj,class)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local group = xPlayer.getGroup()
    local allowed = false
    if not xPlayer then return false end
    if group == 'admin' or group == 'superadmin' then
        allowed = true
    else
        if IsPlayerAllowed(xPlayer.identifier,obj,class) then
            allowed = true
        end
    end
    return allowed
end

RegisterNetEvent('ts-adminmenu:server:PlayerJoined', function()
    local src = source
    local Players = ESX.GetExtendedPlayers()
    for k, v in pairs(Players) do
        if CheckAllowed(v.source, 'JoinQuitNotif','MiscSettings') then
            TriggerClientEvent('ts-adminmenu:client:JoinQ', v.source,'~o~' .. GetPlayerName(src) .. '~s~ Joined The Server')
        end
    end
end)
RegisterNetEvent('ts-adminmenu:server:ScreenshotPlayer',function (ply)
    local src = source
    local yPlayer = ESX.GetPlayerFromId(ply)
    if CheckAllowed(src, 'Screenshot','OnlinePlayerOptions') then
        TriggerClientEvent('ts-adminmenu:client:GetScreenshot',yPlayer.source)
    end
end)
function tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
  end

function BanPlayer(data)
    local identifier = data[1]
    local temp = nil
    if data[2] == "true" then
        temp = true
    else
        temp = false
    end
    local banlen = tablelength(BanList)
    local newban = banlen + 1
    BanList[newban] = {}
    local ply = nil
    local reason = data[4]
    if data[3] then
        ply = tonumber(data[3])
    end
    local plyIdentifiers
    if ply then
        plyIdentifiers = GetPlayerIdentifiers(ply)
    end
    if ply then
        if temp then
            DropPlayer(ply,"Banned by TS Admin Reason: "..reason)
            for k,v in pairs(plyIdentifiers)do               
                  if string.sub(v, 1, string.len("steam:")) == "steam:" then
                    BanList[newban].steam = v
                  elseif string.sub(v, 1, string.len("license:")) == "license:" then
                    BanList[newban].license = v
                  elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
                    BanList[newban].xbl = v
                  elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
                    BanList[newban].ip = v
                  elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
                    BanList[newban].discord = v
                  elseif string.sub(v, 1, string.len("live:")) == "live:" then
                    BanList[newban].live = v
                  end
                
              end
        else
            DropPlayer(ply,"Banned by TS Admin Reason: "..reason)
            local Data = LoadResourceFile(GetCurrentResourceName(), "bans.json")
              Data = json.decode(Data)
              local len = tablelength(Data)
              local newlen = len + 1
              if len >=1 then
                Data[newlen] = {reason = reason}
              else
                Data[1] = {reason = reason}
              end
            for k,v in pairs(plyIdentifiers)do
                  if string.sub(v, 1, string.len("steam:")) == "steam:" then
                    BanList[newban].steam = v
                    if len >=1 then
                        Data[newlen].steam = v
                      else
                        Data[1].steam = v
                      end
                  elseif string.sub(v, 1, string.len("license:")) == "license:" then
                    BanList[newban].license = v
                    if len >=1 then
                        Data[newlen].license = v
                      else
                        Data[1].license = v
                      end
                  elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
                    BanList[newban].xbl = v
                    if len >=1 then
                        Data[#newlen].xbl = v
                      else
                        Data[1].xbl = v
                      end
                  elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
                    BanList[newban].ip = v
                    if len >=1 then
                        Data[newlen].ip = v
                      else
                        Data[1].ip = v
                      end
                  elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
                    BanList[newban].discord = v
                    if len >=1 then
                        Data[newlen].discord = v
                      else
                        Data[1].discord = v
                      end
                  elseif string.sub(v, 1, string.len("live:")) == "live:" then
                    BanList[newban].live = v
                    if len >=1 then
                        Data[newlen].live = v
                      else
                        Data[1].live = v
                      end
                  end
                
              end
              local save = SaveResourceFile(GetCurrentResourceName(),"bans.json",json.encode(Data, {indent = true}),-1)
              if not save then
                print("Saving bans.json failed!")
              else
                print("Saved Bans.json")
            end
        end
    elseif identifier then
        if temp then
            BanList[newban] = {}
            BanList[newban].identifier = identifier
        else
            local Data = LoadResourceFile(GetCurrentResourceName(), "bans.json")
              Data = json.decode(Data)
              local len = tablelength(Data)              
              local newlen = len + 1
              if len >=1 then
                Data[newlen] = {reason = reason}
              else
                Data[1] = {reason = reason}
              end
              if len >=1 then
                Data[newlen].identifier = identifier
              else
                Data[1].identifier = identifier
              end
              local save = SaveResourceFile(GetCurrentResourceName(),"bans.json",json.encode(Data, {indent = true}),-1)
              if not save then
                print("Saving bans.json failed!")
              else
                print("Saved Bans.json")
            end
        end
    end
end

RegisterCommand('tsban', function(source,args,raw)
    BanPlayer(args)
end)

RegisterNetEvent('ts-adminmenu:server:BanPlayer', function(data)
    local data = data
    local allowed = CheckAllowed(source,'BanPlayer','MiscSettings')
    if allowed then
    BanPlayer(data)
    end
end)

RegisterNetEvent('ts-adminmenu:server:removeCar', function(plate)
    local src = source
    local plate = plate
    local allowed = CheckAllowed(src, 'DeletePlate','VehicleOptions')
    if allowed then
        MySQL.query('DELETE FROM owned_vehicles WHERE plate = @plate', {
            ['@plate'] = plate
        }, function()
            TriggerClientEvent('esx:showNotification', src, "You recieved a car with Plate: " .. plate)
        end)
    end
end)

RegisterNetEvent('ts-adminmenu:server:TPVeh', function(ply)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local xPed = GetPlayerPed(src)
    local yPed = GetPlayerPed(ply)
    local veh = GetVehiclePedIsIn(yPed, false)
    local allowed = CheckAllowed(src, 'TPVeh','OnlinePlayerOptions')
    local seat = -1
    
    if allowed then
        if veh == 0 then xPlayer.showNotification('Player is not in a vehicle!') return end
    for i = 0, 8, 1 do 
        if GetPedInVehicleSeat(veh, i) == 0 then
            seat = i break
        end
    end
    if seat == -1 then 
        xPlayer.showNotification('No free seats')
        return 
    end
    
    SetPedIntoVehicle(xPed, veh, seat)
    xPlayer.showNotification('Successfully Teleported to Player Vehicle')
    end
end)

RegisterNetEvent('ts-adminmenu:server:giveCarForce', function(ply, props)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(tonumber(ply))
    local vehProps = props
    local allowed = CheckAllowed(xPlayer.source, 'GiveCar','OnlinePlayerOptions')
    if allowed then
        MySQL.update('UPDATE owned_vehicles SET owner = ? WHERE plate = ?', {yPlayer.identifier, vehProps.plate}, function(affectedRows)
            if affectedRows then
                TriggerClientEvent('esx:showNotification', yPlayer.source,
                "You recieved a car with Plate: " .. vehProps.plate)
                print(affectedRows)
            end
        end)
    end
end)

RegisterNetEvent('ts-adminmenu:server:giveCar', function(ply, props)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(tonumber(ply))
    local vehProps = props
    local allowed = CheckAllowed(xPlayer.source, 'GiveCar','OnlinePlayerOptions')
    if allowed then
        local plateExist = MySQL.single.await('SELECT * FROM owned_vehicles WHERE plate = ?', {vehProps.plate})
        if plateExist then
            return TriggerClientEvent('ts-adminmenu:client:VehicleExists', xPlayer.source,vehProps.plate)
        end
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
    local allowed = CheckAllowed(xPlayer.source, 'ChangePed','PlayerOptions')
    if yPlayer and allowed then
        TriggerClientEvent('ts-adminmenu:client:SetPed', yPlayer.source, ped2)
    end
end)

RegisterNetEvent('ts-adminmenu:server:ShowInventory', function(ply)
    local src = source
    local Ply = ply
    local allowed = CheckAllowed(src, 'OpenInventory','OnlinePlayerOptions')
    if allowed then
        local inv = exports.ox_inventory:Inventory(tonumber(Ply))
        TriggerClientEvent('ox_inventory:viewInventory', src, inv)
    end

end)
RegisterNetEvent('ts-adminmenu:server:LoadPerms',function ()
    local xPlayer = ESX.GetPlayerFromId(source)
    local group = xPlayer.getGroup()
    if Admins[xPlayer.identifier] then
        --if group == 'admin' or group == 'superadmin' then
            for k,v in pairs(Admins[xPlayer.identifier]) do
                if not v then
                    v = true
                end
                if type(v) == 'table' then
                    for i,j in pairs(v) do
                        if not j then j = true end
                    end
                end
            end
        --end
        Player(xPlayer.source).state.TSAdmin = Admins[xPlayer.identifier]
    end
end)

RegisterNetEvent('ts-adminmenu:server:AddPerms', function(data)
    local src= source
    local xPlayer = ESX.GetPlayerFromId(data[1])
    local allowed = CheckAllowed(src,'FullAccess')
    if not xPlayer or not allowed then return end
    local perms = {data[2],data[3],data[4],data[5],data[6]}
    for k,v in ipairs(perms) do
        if v and v ~= "none" then
            if v == "admin" then
                if not Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier] = {
                     FullAccess = false,
                     RockstarEditor = false,
                     OnlinePlayerOptions = {
                         FullAccess = false,
                         SendMessage = false,
                         ChangeSkin = false,
                         ChangePed = false,
                         OpenInventory = false,
                         SetJob = false,
                         GiveItemList = false,
                         GiveItemCode = false,
                         RemoveInventoryItem = false,
                         GiveAccountMoney = false,
                         RemoveAccountMoney = false,
                         ToggleLicense = false,
                         GiveCar = false,
                         HealPlayer = false,
                         RevivePlayer = false,
                         KillPlayer = false,
                         Goto = false,
                         Bring = false,
                         TPVeh = false,
                         Waypoint = false,
                         PrintID = false,
                         Kick = false,
                         Screenshot = false,
                         Spectate = false
                     },
                     PlayerOptions = {
                         FullAccess = false,
                         ChangeSkin = false,
                         ChangePed = false,
                         Godmode = false,
                         Invisible = false,
                         UnlimitedStamina = false,
                         FastRun = false,
                         FastSwim = false,
                         SuperJump = false,
                         NoRagdoll = false,
                         NeverWanted = false,
                         StayInVeh = false,
                         HealPlayer = false,
                         RevivePlayer = false,
                         SetArmor = false,
                         CleanClothes = false,
                         WetClothes = false,
                         DryClothes = false,
                         Suicide= false,
                         FreezePlayer = false,
                         Noclip = false
                     },
                     VehicleOptions = {
                         FullAccess = false,
                         Spawner = false,
                         SpawnerCode = false,
                         UnlockVehicle = false,
                         Modmenu = false,
                         FreezeVehicle = false,
                         ToggleEngine = false,
                         ChangePlate = false,
                         ToggleDoors = false,
                         TorqueMultiplier = false,
                         EngineMultiplier = false,
                         FlipVehicle = false,
                         DeleteVehicle = false,
                         RefuelVehicle = false,
                         BikeHelmet = false,
                         Godmode = false,
                         RepairVehicle = false,
                         WashVehicle = false,
                         KeepClean = false,
                         VehicleDirt = false,
                         DeletePlate = false,
                     },
                     TrollMenu = {
                         FullAccess = false,
                         Fart = false,
                         TruckPunchline = false,
                         ClownAttack = false,
                         MerryweatherAttack = false,
                         Flashbang = false,
                         FakeSound = false,
                         LagGame = false,
                         BlowTyres = false,
                         Eject = false,
                         CrashGame = false
                     },
                     MiscSettings = {
                         FullAccess = false,
                         TPM = false,
                         TPC = false,
                         ShowCoords = false,
                         CopyCoords = false,
                         BanPlayer = false,
                         UnbanPlayer = false,
                         ClearArea = false,
                         Relog = false,
                         PropSpawner = false,
                         Announcement = false,
                         StaffChat = false,
                         ThermalVision = false,
                         JoinQuitNotif = false,
                         KillNotif = false,
                         NightVision = false,
                         PlayerBlips = false,
                         PlayerNames = false,
                         DeleteLaser = false,
                         Timecycle = false,
                     }
                    }
                end
            end
            if v == "FullAccess" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].FullAccess = true
                end
            end
            if v == "OnlinePlayerOptions" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].OnlinePlayerOptions.FullAccess = true
                end
            end
            if v == "OnlinePlayerOptions.SendMessage" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].OnlinePlayerOptions.SendMessage = true
                end
            end
            if v == "OnlinePlayerOptions.ChangeSkin" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].OnlinePlayerOptions.ChangeSkin = true
                end
            end
            if v == "OnlinePlayerOptions.ChangePed" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].OnlinePlayerOptions.ChangePed = true
                end
            end
            if v == "OnlinePlayerOptions.OpenInventory" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].OnlinePlayerOptions.OpenInventory = true
                end
            end
            if v == "OnlinePlayerOptions.SetJob" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].OnlinePlayerOptions.SetJob = true
                end
            end
            if v == "OnlinePlayerOptions.GiveItemList" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].OnlinePlayerOptions.GiveItemList = true
                end
            end
            if v == "OnlinePlayerOptions.GiveItemCode" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].OnlinePlayerOptions.GiveItemCode = true
                end
            end
            if v == "OnlinePlayerOptions.GiveCar" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].OnlinePlayerOptions.GiveCar = true
                end
            end
            if v == "OnlinePlayerOptions.RemoveInventoryItem" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].OnlinePlayerOptions.RemoveInventoryItem = true
                end
            end
            if v == "OnlinePlayerOptions.HealPlayer" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].OnlinePlayerOptions.HealPlayer = true
                end
            end
            if v == "OnlinePlayerOptions.GiveAccountMoney" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].OnlinePlayerOptions.GiveAccountMoney = true
                end
            end
            if v == "OnlinePlayerOptions.RemoveAccountMoney" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].OnlinePlayerOptions.RemoveAccountMoney = true
                end
            end
            if v == "OnlinePlayerOptions.TPVeh" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].OnlinePlayerOptions.TPVeh = true
                end
            end
            if v == "OnlinePlayerOptions.RevivePlayer" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].OnlinePlayerOptions.RevivePlayer = true
                end
            end
            if v == "OnlinePlayerOptions.Goto" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].OnlinePlayerOptions.Goto = true
                end
            end
            if v == "OnlinePlayerOptions.ToggleLicense" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].OnlinePlayerOptions.ToggleLicense = true
                end
            end
            if v == "OnlinePlayerOptions.Bring" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].OnlinePlayerOptions.Bring = true
                end
            end
            if v == "OnlinePlayerOptions.Waypoint" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].OnlinePlayerOptions.Waypoint = true
                end
            end
            if v == "OnlinePlayerOptions.PrintID" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].OnlinePlayerOptions.PrintID = true
                end
            end
            if v == "OnlinePlayerOptions.KillPlayer" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].OnlinePlayerOptions.KillPlayer = true
                end
            end
            if v == "OnlinePlayerOptions.Kick" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].OnlinePlayerOptions.Kick = true
                end
            end
            if v == "OnlinePlayerOptions.Spectate" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].OnlinePlayerOptions.Spectate = true
                end
            end
            if v == "OnlinePlayerOptions.Screenshot" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].OnlinePlayerOptions.Screenshot = true
                end
            end
            if v == "PlayerOptions" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].PlayerOptions.FullAccess = true
                end
            end
            if v == "PlayerOptions.Godmode" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].PlayerOptions.Godmode = true
                end
            end
            if v == "PlayerOptions.Invisible" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].PlayerOptions.Invisible = true
                end
            end
            if v == "PlayerOptions.UnlimitedStamina" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].PlayerOptions.UnlimitedStamina = true
                end
            end
            if v == "PlayerOptions.FastRun" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].PlayerOptions.FastRun = true
                end
            end
            if v == "PlayerOptions.FastSwim" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].PlayerOptions.FastSwim = true
                end
            end
            if v == "PlayerOptions.SuperJump" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].PlayerOptions.SuperJump = true
                end
            end
            if v == "PlayerOptions.NoRagdoll" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].PlayerOptions.NoRagdoll = true
                end
            end
            if v == "PlayerOptions.NeverWanted" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].PlayerOptions.NeverWanted = true
                end
            end
            if v == "PlayerOptions.StayInVeh" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].PlayerOptions.StayInVeh = true
                end
            end
            if v == "PlayerOptions.HealPlayer" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].PlayerOptions.HealPlayer = true
                end
            end
            if v == "PlayerOptions.RevivePlayer" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].PlayerOptions.RevivePlayer = true
                end
            end
            if v == "PlayerOptions.SetArmor" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].PlayerOptions.SetArmor = true
                end
            end
            if v == "PlayerOptions.CleanClothes" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].PlayerOptions.CleanClothes = true
                end
            end
            if v == "PlayerOptions.WetClothes" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].PlayerOptions.WetClothes = true
                end
            end
            if v == "PlayerOptions.DryClothes" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].PlayerOptions.DryClothes = true
                end
            end
            if v == "PlayerOptions.Suicide" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].PlayerOptions.Suicide = true
                end
            end
            if v == "PlayerOptions.FreezePlayer" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].PlayerOptions.FreezePlayer = true
                end
            end
            if v == "PlayerOptions.Noclip" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].PlayerOptions.Noclip = true
                end
            end
            if v == "PlayerOptions.ChangeSkin" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].PlayerOptions.ChangeSkin = true
                end
            end
            if v == "PlayerOptions.ChangePed" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].PlayerOptions.ChangePed = true
                end
            end
            if v == "VehicleOptions" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].VehicleOptions.FullAccess = true
                end
            end
            if v == "VehicleOptions.Spawner" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].VehicleOptions.Spawner = true
                end
            end
            if v == "VehicleOptions.SpawnerCode" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].VehicleOptions.SpawnerCode = true
                end
            end
            if v == "VehicleOptions.Modmenu" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].VehicleOptions.Modmenu = true
                end
            end
            if v == "VehicleOptions.FreezeVehicle" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].VehicleOptions.FreezeVehicle = true
                end
            end
            if v == "VehicleOptions.ChangePlate" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].VehicleOptions.ChangePlate = true
                end
            end
            if v == "VehicleOptions.ToggleEngine" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].VehicleOptions.ToggleEngine = true
                end
            end
            if v == "VehicleOptions.ToggleDoors" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].VehicleOptions.ToggleDoors = true
                end
            end
            if v == "VehicleOptions.TorqueMultiplier" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].VehicleOptions.TorqueMultiplier = true
                end
            end
            if v == "VehicleOptions.EngineMultiplier" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].VehicleOptions.EngineMultiplier = true
                end
            end
            if v == "VehicleOptions.FlipVehicle" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].VehicleOptions.FlipVehicle = true
                end
            end
            if v == "VehicleOptions.DeleteVehicle" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].VehicleOptions.DeleteVehicle = true
                end
            end
            if v == "VehicleOptions.RefuelVehicle" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].VehicleOptions.RefuelVehicle = true
                end
            end
            if v == "VehicleOptions.BikeHelmet" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].VehicleOptions.BikeHelmet = true
                end
            end
            if v == "VehicleOptions.Godmode" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].VehicleOptions.Godmode = true
                end
            end
            if v == "VehicleOptions.RepairVehicle" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].VehicleOptions.RepairVehicle = true
                end
            end
            if v == "VehicleOptions.WashVehicle" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].VehicleOptions.WashVehicle = true
                end
            end
            if v == "VehicleOptions.KeepClean" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].VehicleOptions.KeepClean = true
                end
            end
            if v == "VehicleOptions.VehicleDirt" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].VehicleOptions.VehicleDirt = true
                end
            end
            if v == "VehicleOptions.UnlockVehicle" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].VehicleOptions.UnlockVehicle = true
                end
            end
            if v == "VehicleOptions.DeletePlate" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].VehicleOptions.DeletePlate = true
                end
            end
            if v == "MiscSettings" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].MiscSettings.FullAccess = true
                end
            end
            if v == "MiscSettings.TPM" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].MiscSettings.TPM = true
                end
            end
            if v == "MiscSettings.TPC" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].MiscSettings.TPC = true
                end
            end
            if v == "MiscSettings.ShowCoords" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].MiscSettings.TPC = true
                end
            end
            if v == "MiscSettings.CopyCoords" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].MiscSettings.CopyCoords = true
                end
            end
            if v == "MiscSettings.PropSpawner" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].MiscSettings.PropSpawner = true
                end
            end
            if v == "MiscSettings.ClearArea" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].MiscSettings.ClearArea = true
                end
            end
            if v == "MiscSettings.ThermalVision" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].MiscSettings.ThermalVision = true
                end
            end
            if v == "MiscSettings.NightVision" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].MiscSettings.NightVision = true
                end
            end
            if v == "MiscSettings.PlayerBlips" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].MiscSettings.PlayerBlips = true
                end
            end
            if v == "MiscSettings.PlayerNames" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].MiscSettings.PlayerNames = true
                end
            end
            if v == "MiscSettings.Timecycle" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].MiscSettings.Timecycle = true
                end
            end
            if v == "MiscSettings.JoinQuitNotif" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].MiscSettings.JoinQuitNotif = true
                end
            end
            if v == "MiscSettings.KillNotif" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].MiscSettings.KillNotif = true
                end
            end
            if v == "MiscSettings.Announcement" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].MiscSettings.Announcement = true
                end
            end
            if v == "MiscSettings.StaffChat" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].MiscSettings.StaffChat = true
                end
            end
            if v == "MiscSettings.Relog" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].MiscSettings.Relog = true
                end
            end
            if v == "MiscSettings.BanPlayer" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].MiscSettings.BanPlayer = true
                end
            end
            if v == "MiscSettings.UnbanPlayer" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].MiscSettings.UnbanPlayer = true
                end
            end
            if v == "MiscSettings.DeleteLaser" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].MiscSettings.DeleteLaser = true
                end
            end
            if v == "TrollMenu" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].TrollMenu.FullAccess = true
                end
            end
            if v == "TrollMenu.Fart" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].TrollMenu.Fart = true
                end
            end
            if v == "TrollMenu.TruckPunchline" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].TrollMenu.TruckPunchline = true
                end
            end
            if v == "TrollMenu.ClownAttack" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].TrollMenu.ClownAttack = true
                end
            end
            if v == "TrollMenu.MerryweatherAttack" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].TrollMenu.MerryweatherAttack = true
                end
            end
            if v == "TrollMenu.Flashbang" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].TrollMenu.Flashbang = true
                end
            end
            if v == "TrollMenu.FakeSound" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].TrollMenu.FakeSound = true
                end
            end
            if v == "TrollMenu.LagGame" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].TrollMenu.LagGame = true
                end
            end
            if v == "TrollMenu.BlowTyres" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].TrollMenu.BlowTyres = true
                end
            end
            if v == "TrollMenu.Eject" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].TrollMenu.Eject = true
                end
            end
            if v == "TrollMenu.CrashGame" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].TrollMenu.CrashGame = true
                end
            end
            if v == "RockstarEditor" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].RockstarEditor = true
                end
            end
            Player(xPlayer.source).state.TSAdmin = Admins[xPlayer.identifier]
            local encoded = json.encode(Admins, { indent = true })
            SaveResourceFile(GetCurrentResourceName(), "server/admin_list.json",encoded, -1)
        end
    end
end)

RegisterNetEvent('ts-adminmenu:server:RemovePerms', function(data)
    local src= source
    local xPlayer = ESX.GetPlayerFromId(data[1])
    local allowed = CheckAllowed(src,'FullAccess')
    if not xPlayer or not allowed then return end
    local perms = {data[2],data[3],data[4],data[5],data[6]}
    for k,v in ipairs(perms) do
        if v and v ~= "none" then
            if v == "admin" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier] = nil
                end
            end
            if v == "FullAccess" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].FullAccess = false
                end
            end
            if v == "OnlinePlayerOptions" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].OnlinePlayerOptions.FullAccess = false
                end
            end
            if v == "OnlinePlayerOptions.SendMessage" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].OnlinePlayerOptions.SendMessage = false
                end
            end
            if v == "OnlinePlayerOptions.ChangeSkin" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].OnlinePlayerOptions.ChangeSkin = false
                end
            end
            if v == "OnlinePlayerOptions.ChangePed" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].OnlinePlayerOptions.ChangePed = false
                end
            end
            if v == "OnlinePlayerOptions.OpenInventory" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].OnlinePlayerOptions.OpenInventory = false
                end
            end
            if v == "OnlinePlayerOptions.SetJob" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].OnlinePlayerOptions.SetJob = false
                end
            end
            if v == "OnlinePlayerOptions.GiveItemList" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].OnlinePlayerOptions.GiveItemList = false
                end
            end
            if v == "OnlinePlayerOptions.GiveItemCode" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].OnlinePlayerOptions.GiveItemCode = false
                end
            end
            if v == "OnlinePlayerOptions.GiveCar" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].OnlinePlayerOptions.GiveCar = false
                end
            end
            if v == "OnlinePlayerOptions.RemoveInventoryItem" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].OnlinePlayerOptions.RemoveInventoryItem = false
                end
            end
            if v == "OnlinePlayerOptions.HealPlayer" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].OnlinePlayerOptions.HealPlayer = false
                end
            end
            if v == "OnlinePlayerOptions.GiveAccountMoney" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].OnlinePlayerOptions.GiveAccountMoney = false
                end
            end
            if v == "OnlinePlayerOptions.RemoveAccountMoney" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].OnlinePlayerOptions.RemoveAccountMoney = false
                end
            end
            if v == "OnlinePlayerOptions.TPVeh" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].OnlinePlayerOptions.TPVeh = false
                end
            end
            if v == "OnlinePlayerOptions.RevivePlayer" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].OnlinePlayerOptions.RevivePlayer = false
                end
            end
            if v == "OnlinePlayerOptions.Goto" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].OnlinePlayerOptions.Goto = false
                end
            end
            if v == "OnlinePlayerOptions.ToggleLicense" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].OnlinePlayerOptions.ToggleLicense = false
                end
            end
            if v == "OnlinePlayerOptions.Bring" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].OnlinePlayerOptions.Bring = false
                end
            end
            if v == "OnlinePlayerOptions.Waypoint" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].OnlinePlayerOptions.Waypoint = false
                end
            end
            if v == "OnlinePlayerOptions.PrintID" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].OnlinePlayerOptions.PrintID = false
                end
            end
            if v == "OnlinePlayerOptions.KillPlayer" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].OnlinePlayerOptions.KillPlayer = false
                end
            end
            if v == "OnlinePlayerOptions.Kick" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].OnlinePlayerOptions.Kick = false
                end
            end
            if v == "OnlinePlayerOptions.Spectate" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].OnlinePlayerOptions.Spectate = false
                end
            end
            if v == "OnlinePlayerOptions.Screenshot" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].OnlinePlayerOptions.Screenshot = false
                end
            end
            if v == "PlayerOptions" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].PlayerOptions.FullAccess = false
                end
            end
            if v == "PlayerOptions.Godmode" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].PlayerOptions.Godmode = false
                end
            end
            if v == "PlayerOptions.Invisible" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].PlayerOptions.Invisible = false
                end
            end
            if v == "PlayerOptions.UnlimitedStamina" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].PlayerOptions.UnlimitedStamina = false
                end
            end
            if v == "PlayerOptions.FastRun" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].PlayerOptions.FastRun = false
                end
            end
            if v == "PlayerOptions.FastSwim" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].PlayerOptions.FastSwim = false
                end
            end
            if v == "PlayerOptions.SuperJump" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].PlayerOptions.SuperJump = false
                end
            end
            if v == "PlayerOptions.NoRagdoll" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].PlayerOptions.NoRagdoll = false
                end
            end
            if v == "PlayerOptions.NeverWanted" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].PlayerOptions.NeverWanted = false
                end
            end
            if v == "PlayerOptions.StayInVeh" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].PlayerOptions.StayInVeh = false
                end
            end
            if v == "PlayerOptions.HealPlayer" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].PlayerOptions.HealPlayer = false
                end
            end
            if v == "PlayerOptions.RevivePlayer" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].PlayerOptions.RevivePlayer = false
                end
            end
            if v == "PlayerOptions.SetArmor" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].PlayerOptions.SetArmor = false
                end
            end
            if v == "PlayerOptions.CleanClothes" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].PlayerOptions.CleanClothes = false
                end
            end
            if v == "PlayerOptions.WetClothes" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].PlayerOptions.WetClothes = false
                end
            end
            if v == "PlayerOptions.DryClothes" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].PlayerOptions.DryClothes = false
                end
            end
            if v == "PlayerOptions.Suicide" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].PlayerOptions.Suicide = false
                end
            end
            if v == "PlayerOptions.FreezePlayer" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].PlayerOptions.FreezePlayer = false
                end
            end
            if v == "PlayerOptions.Noclip" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].PlayerOptions.Noclip = false
                end
            end
            if v == "PlayerOptions.ChangeSkin" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].PlayerOptions.ChangeSkin = false
                end
            end
            if v == "PlayerOptions.ChangePed" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].PlayerOptions.ChangePed = false
                end
            end
            if v == "VehicleOptions" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].VehicleOptions.FullAccess = false
                end
            end
            if v == "VehicleOptions.Spawner" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].VehicleOptions.Spawner = false
                end
            end
            if v == "VehicleOptions.SpawnerCode" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].VehicleOptions.SpawnerCode = false
                end
            end
            if v == "VehicleOptions.Modmenu" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].VehicleOptions.Modmenu = false
                end
            end
            if v == "VehicleOptions.FreezeVehicle" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].VehicleOptions.FreezeVehicle = false
                end
            end
            if v == "VehicleOptions.ChangePlate" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].VehicleOptions.ChangePlate = false
                end
            end
            if v == "VehicleOptions.ToggleEngine" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].VehicleOptions.ToggleEngine = false
                end
            end
            if v == "VehicleOptions.ToggleDoors" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].VehicleOptions.ToggleDoors = false
                end
            end
            if v == "VehicleOptions.TorqueMultiplier" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].VehicleOptions.TorqueMultiplier = false
                end
            end
            if v == "VehicleOptions.EngineMultiplier" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].VehicleOptions.EngineMultiplier = false
                end
            end
            if v == "VehicleOptions.FlipVehicle" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].VehicleOptions.FlipVehicle = false
                end
            end
            if v == "VehicleOptions.DeleteVehicle" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].VehicleOptions.DeleteVehicle = false
                end
            end
            if v == "VehicleOptions.RefuelVehicle" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].VehicleOptions.RefuelVehicle = false
                end
            end
            if v == "VehicleOptions.BikeHelmet" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].VehicleOptions.BikeHelmet = false
                end
            end
            if v == "VehicleOptions.Godmode" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].VehicleOptions.Godmode = false
                end
            end
            if v == "VehicleOptions.RepairVehicle" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].VehicleOptions.RepairVehicle = false
                end
            end
            if v == "VehicleOptions.WashVehicle" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].VehicleOptions.WashVehicle = false
                end
            end
            if v == "VehicleOptions.KeepClean" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].VehicleOptions.KeepClean = false
                end
            end
            if v == "VehicleOptions.VehicleDirt" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].VehicleOptions.VehicleDirt = false
                end
            end
            if v == "VehicleOptions.UnlockVehicle" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].VehicleOptions.UnlockVehicle = false
                end
            end
            if v == "VehicleOptions.DeletePlate" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].VehicleOptions.DeletePlate = false
                end
            end
            if v == "MiscSettings" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].MiscSettings.FullAccess = false
                end
            end
            if v == "MiscSettings.TPM" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].MiscSettings.TPM = false
                end
            end
            if v == "MiscSettings.TPC" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].MiscSettings.TPC = false
                end
            end
            if v == "MiscSettings.ShowCoords" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].MiscSettings.TPC = false
                end
            end
            if v == "MiscSettings.CopyCoords" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].MiscSettings.CopyCoords = false
                end
            end
            if v == "MiscSettings.PropSpawner" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].MiscSettings.PropSpawner = false
                end
            end
            if v == "MiscSettings.ClearArea" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].MiscSettings.ClearArea = false
                end
            end
            if v == "MiscSettings.ThermalVision" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].MiscSettings.ThermalVision = false
                end
            end
            if v == "MiscSettings.NightVision" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].MiscSettings.NightVision = false
                end
            end
            if v == "MiscSettings.PlayerBlips" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].MiscSettings.PlayerBlips = false
                end
            end
            if v == "MiscSettings.PlayerNames" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].MiscSettings.PlayerNames = false
                end
            end
            if v == "MiscSettings.Timecycle" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].MiscSettings.Timecycle = false
                end
            end
            if v == "MiscSettings.JoinQuitNotif" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].MiscSettings.JoinQuitNotif = false
                end
            end
            if v == "MiscSettings.KillNotif" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].MiscSettings.KillNotif = false
                end
            end
            if v == "MiscSettings.Announcement" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].MiscSettings.Announcement = false
                end
            end
            if v == "MiscSettings.StaffChat" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].MiscSettings.StaffChat = false
                end
            end
            if v == "MiscSettings.Relog" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].MiscSettings.Relog = false
                end
            end
            if v == "MiscSettings.BanPlayer" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].MiscSettings.BanPlayer = false
                end
            end
            if v == "MiscSettings.UnbanPlayer" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].MiscSettings.UnbanPlayer = false
                end
            end
            if v == "MiscSettings.DeleteLaser" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].MiscSettings.DeleteLaser = false
                end
            end
            if v == "TrollMenu" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].TrollMenu.FullAccess = false
                end
            end
            if v == "TrollMenu.Fart" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].TrollMenu.Fart = false
                end
            end
            if v == "TrollMenu.TruckPunchline" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].TrollMenu.TruckPunchline = false
                end
            end
            if v == "TrollMenu.ClownAttack" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].TrollMenu.ClownAttack = false
                end
            end
            if v == "TrollMenu.MerryweatherAttack" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].TrollMenu.MerryweatherAttack = false
                end
            end
            if v == "TrollMenu.Flashbang" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].TrollMenu.Flashbang = false
                end
            end
            if v == "TrollMenu.FakeSound" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].TrollMenu.FakeSound = false
                end
            end
            if v == "TrollMenu.LagGame" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].TrollMenu.LagGame = false
                end
            end
            if v == "TrollMenu.BlowTyres" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].TrollMenu.BlowTyres = false
                end
            end
            if v == "TrollMenu.Eject" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].TrollMenu.Eject = false
                end
            end
            if v == "TrollMenu.CrashGame" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].TrollMenu.CrashGame = false
                end
            end
            if v == "RockstarEditor" then
                if Admins[xPlayer.identifier] then
                    Admins[xPlayer.identifier].RockstarEditor = false
                end
            end
            Player(xPlayer.source).state.TSAdmin = Admins[xPlayer.identifier]
            local encoded = json.encode(Admins, { indent = true })
            SaveResourceFile(GetCurrentResourceName(), "server/admin_list.json",encoded, -1)
        end
    end
end)
lib.callback.register('ts-adminmenu:server:GetSpectateData', function(source,pid)
    local src = source
    local target = pid
    local pCoords = GetEntityCoords(GetPlayerPed(target))
    return pCoords
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
        if CheckAllowed(v.playerId, 'KillNotif','MiscSettings') then
            TriggerClientEvent('ts-adminmenu:client:killnotif', v.playerId, msg)
        end
    end

end)

AddEventHandler('playerDropped', function(reason)
    local src = source
    local reason = reason
    local Players = ESX.GetExtendedPlayers()
    for k, v in pairs(Players) do
        if CheckAllowed(v.source, 'JoinQuitNotif','MiscSettings') then
            TriggerClientEvent('ts-adminmenu:client:JoinQ', v.playerId,
                '~o~' .. GetPlayerName(src) .. '~s~ Left The Server Reason: ~y~' .. reason .. '~s~')
        end
    end
end)
AddEventHandler('playerDropped', function()
    local src = source
    TriggerClientEvent('ts-adminmenu:client:PlayerLeft', -1, src)
end)

AddEventHandler('playerLeftScope', function(data)
    local source = tonumber(data['for'])
    local target = tonumber(data.player)
    TriggerClientEvent('ts-adminmenu:client:LeftScope', source, target)
end)


RegisterNetEvent('ts-adminmenu:server:HealPlayer', function(pid)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(pid)
    local allowed = CheckAllowed(xPlayer.source, 'HealPlayer','OnlinePlayerOptions')
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
    local allowed = CheckAllowed(xPlayer.source, 'SetJob','OnlinePlayerOptions')
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
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(pid)
    local allowed = CheckAllowed(xPlayer.source, 'GiveAccountMoney','OnlinePlayerOptions')
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
    local allowed = CheckAllowed(xPlayer.source, 'RemoveAccountMoney','OnlinePlayerOptions')
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
    local allowed = CheckAllowed(xPlayer.source, 'RevivePlayer','OnlinePlayerOptions')
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
    local allowed = CheckAllowed(xPlayer.source, 'Goto','OnlinePlayerOptions')
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
    local allowed = CheckAllowed(xPlayer.source, 'Bring','OnlinePlayerOptions')
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
    local allowed = CheckAllowed(xPlayer.source, 'Waypoint','OnlinePlayerOptions')
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
    local allowed = CheckAllowed(xPlayer.source, 'PrintID','OnlinePlayerOptions')
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
    local allowed = CheckAllowed(xPlayer.source, 'KillPlayer','OnlinePlayerOptions')
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
    local allowed = CheckAllowed(xPlayer.source, 'Kick','OnlinePlayerOptions')
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
    local allowed = CheckAllowed(xPlayer.source, 'DeleteVehicle','VehicleOptions')
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
    local allowed = CheckAllowed(xPlayer.source, 'ChangeSkin','OnlinePlayerOptions')
    yPlayer.triggerEvent('vms_charcreator:openCreator')
end)

RegisterNetEvent('ts-adminmenu:server:SendMessage', function(pid, msg)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(pid)
    local message = msg
    local allowed = CheckAllowed(xPlayer.source, 'SendMessage','OnlinePlayerOptions')
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
    local allowed = CheckAllowed(source, 'GiveItemList','OnlinePlayerOptions') or
                        CheckAllowed(source, 'GiveItemCode','OnlinePlayerOptions')
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
    local item = exports.ox_inventory:Inventory(playerId).items
    local allowed = CheckAllowed(source, 'RemoveInventoryItem','OnlinePlayerOptions')
    if allowed then
        TriggerClientEvent('ts-adminmenu:client:RemoveItem', src, pid, item)
    end
end)

RegisterNetEvent('ts-adminmenu:server:RemoveItem', function(pid, item, count)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerId = pid
    local yPlayer = ESX.GetPlayerFromId(playerId)
    local titem = item
    local amount = count
    local allowed = CheckAllowed(source, 'RemoveInventoryItem','OnlinePlayerOptions')
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
    local allowed = CheckAllowed(source, 'Spawner','VehicleOptions') or CheckAllowed(source,'SpawnerCode','VehicleOptions')
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
    local allowed = CheckAllowed(src, 'Fart','TrollMenu')
    if allowed then
        TriggerClientEvent('ts-adminmenu:client:PlayFart', src, plyList, farttype)
    end
end)

RegisterNetEvent('ts-adminmenu:server:propspawner', function()
    local src = source
    local allowed = CheckAllowed(src, 'PropSpawner','MiscSettings')
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
    local allowed = CheckAllowed(src, 'StaffChat','MiscSettings')
    if allowed then
        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div class="chat-message staff"><i class="fas fa-shield-alt"></i> <b><span style="color: #1ebc62">[STAFF] {0}</span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;">{2}</span></b><div style="margin-top: 5px; font-weight: 300;">{1}</div></div>',
            args = {xPlayer.getName(), msg, time}
        })
    end
end)

RegisterNetEvent('ts-adminmenu:server:PlayFartFromServer', function(data)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local farttype = data.type
    local ply = data.ply
    local yPlayer = ESX.GetPlayerFromId(ply)
    local netId = NetworkGetNetworkIdFromEntity(GetPlayerPed(yPlayer.source))
    local allowed = CheckAllowed(src, 'Fart','TrollMenu')
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
    local allowed = CheckAllowed(xPlayer.source, 'TruckPunchline','TrollMenu')
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
    local allowed = CheckAllowed(xPlayer.source, 'ClownAttack','TrollMenu')
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
    local allowed = CheckAllowed(xPlayer.source, 'MerryweatherAttack','TrollMenu')
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
    local allowed = CheckAllowed(xPlayer.source, 'Flashbang','TrollMenu')
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
    local allowed = CheckAllowed(source, 'Announcement','MiscSettings')
    if allowed then
        TriggerClientEvent('ts-adminmenu:client:Announce', -1, txt)
    end
end)

RegisterNetEvent('ts-adminmenu:server:FakeCallply', function(data2)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(data2.plyid)
    local allowed = CheckAllowed(xPlayer.source, 'FakeSound','TrollMenu')
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
    local allowed = CheckAllowed(xPlayer.source, 'LagGame','TrollMenu')
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
    local allowed = CheckAllowed(xPlayer.source, 'BlowTyres','TrollMenu')
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
    local allowed = CheckAllowed(xPlayer.source, 'Eject','TrollMenu')
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
    local allowed = CheckAllowed(xPlayer.source, 'CrashGame','TrollMenu')
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
    local allowed = CheckAllowed(xPlayer.source, 'ToggleLicense','OnlinePlayerOptions')
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

lib.callback.register('ts-adminmenu:server:GetOnlinePlayers', function()
    return TSGetPlayers()
end)

