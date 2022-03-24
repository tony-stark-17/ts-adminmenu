local ESX = exports['es_extended']:getSharedObject()
local TSAdmins = {}

RegisterNetEvent('onResourceStart', function()
    for k, v in ipairs(Admins) do
        TSAdmins[v] = {
            permission = {
                OpenAdminmenu = true
            }
        }
        for i, j in ipairs(FullAccess) do
            if TSAdmins[j] then
                TSAdmins[j].permission.FullAccess = true
            end
        end
        for i, j in ipairs(OnlinePlyOptions) do
            if TSAdmins[j] then
                TSAdmins[j].permission.OnlinePlyOptions = true
            end
        end

        for i, j in ipairs(PlayerOptions) do
            if TSAdmins[j] then
                TSAdmins[j].permission.PlayerOptions = true
            end
        end

        for i, j in ipairs(VehicleRelatedOptions) do
            if TSAdmins[j] then
                TSAdmins[j].permission.VehicleRelatedOptions = true
            end
        end

        for i, j in ipairs(MiscSettings) do
            if TSAdmins[j] then
                TSAdmins[j].permission.MiscSettings = true
            end
        end
        for i, j in ipairs(TrollMenu) do
            if TSAdmins[j] then
                TSAdmins[j].permission.TrollMenu = true
            end
        end
        for i, j in ipairs(OnlinePlyOptions_SendMessage) do
            if TSAdmins[j] then
                TSAdmins[j].permission.OnlinePlyOptions_SendMessage = true
            end
        end

        for i, j in ipairs(OnlinePlyOptions_Heal) do
            if TSAdmins[j] then
                TSAdmins[j].permission.OnlinePlyOptions_Heal = true
            end
        end

        for i, j in ipairs(OnlinePlyOptions_Revive) do
            if TSAdmins[j] then
                TSAdmins[j].permission.OnlinePlyOptions_Revive = true
            end
        end

        for i, j in ipairs(OnlinePlyOptions_OpenInventory) do
            if TSAdmins[j] then
                TSAdmins[j].permission.OnlinePlyOptions_OpenInventory = true
            end
        end

        for i, j in ipairs(OnlinePlyOptions_SetJob) do
            if TSAdmins[j] then
                TSAdmins[j].permission.OnlinePlyOptions_SetJob = true
            end
        end

        for i, j in ipairs(OnlinePlyOptions_RemoveInventoryItem) do
            if TSAdmins[j] then
                TSAdmins[j].permission.OnlinePlyOptions_RemoveInventoryItem = true
            end
        end

        for i, j in ipairs(OnlinePlyOptions_GiveItem) do
            if TSAdmins[j] then
                TSAdmins[j].permission.OnlinePlyOptions_GiveItem = true
            end
        end

        for i, j in ipairs(OnlinePlyOptions_GiveItemName) do
            if TSAdmins[j] then
                TSAdmins[j].permission.OnlinePlyOptions_GiveItemName = true
            end
        end

        for i, j in ipairs(OnlinePlyOptions_GiveMoney) do
            if TSAdmins[j] then
                TSAdmins[j].permission.OnlinePlyOptions_GiveMoney = true
            end
        end

        for i, j in ipairs(OnlinePlyOptions_RemoveMoney) do
            if TSAdmins[j] then
                TSAdmins[j].permission.OnlinePlyOptions_RemoveMoney = true
            end
        end

        for i, j in ipairs(OnlinePlyOptions_Goto) do
            if TSAdmins[j] then
                TSAdmins[j].permission.OnlinePlyOptions_Goto = true
            end
        end

        for i, j in ipairs(OnlinePlyOptions_Bring) do
            if TSAdmins[j] then
                TSAdmins[j].permission.OnlinePlyOptions_Bring = true
            end
        end

        for i, j in ipairs(OnlinePlyOptions_SetWaypoint) do
            if TSAdmins[j] then
                TSAdmins[j].permission.OnlinePlyOptions_SetWaypoint = true
            end
        end

        for i, j in ipairs(OnlinePlyOptions_PRINTID) do
            if TSAdmins[j] then
                TSAdmins[j].permission.OnlinePlyOptions_PRINTID = true
            end
        end

        for i, j in ipairs(OnlinePlyOptions_KillPlayer) do
            if TSAdmins[j] then
                TSAdmins[j].permission.OnlinePlyOptions_KillPlayer = true
            end
        end

        for i, j in ipairs(OnlinePlyOptions_KickPlayer) do
            if TSAdmins[j] then
                TSAdmins[j].permission.OnlinePlyOptions_KickPlayer = true
            end
        end

        for i, j in ipairs(OnlinePlyOptions_License) do
            if TSAdmins[j] then
                TSAdmins[j].permission.OnlinePlyOptions_License = true
            end
        end

        for i, j in ipairs(PlayerOptions_God) do
            if TSAdmins[j] then
                TSAdmins[j].permission.PlayerOptions_God = true
            end
        end

        for i, j in ipairs(PlayerOptions_Invisible) do
            if TSAdmins[j] then
                TSAdmins[j].permission.PlayerOptions_Invisible = true
            end
        end
        for i, j in ipairs(PlayerOptions_Stamina) do
            if TSAdmins[j] then
                TSAdmins[j].permission.PlayerOptions_Stamina = true
            end
        end
        for i, j in ipairs(PlayerOptions_FastRun) do
            if TSAdmins[j] then
                TSAdmins[j].permission.PlayerOptions_FastRun = true
            end
        end
        for i, j in ipairs(PlayerOptions_FastSwim) do
            if TSAdmins[j] then
                TSAdmins[j].permission.PlayerOptions_FastSwim = true
            end
        end
        for i, j in ipairs(PlayerOptions_SuperJump) do
            if TSAdmins[j] then
                TSAdmins[j].permission.PlayerOptions_SuperJump = true
            end
        end
        for i, j in ipairs(PlayerOptions_NoRagdoll) do
            if TSAdmins[j] then
                TSAdmins[j].permission.PlayerOptions_NoRagdoll = true
            end
        end
        for i, j in ipairs(PlayerOptions_NeverWanted) do
            if TSAdmins[j] then
                TSAdmins[j].permission.PlayerOptions_NeverWanted = true
            end
        end
        for i, j in ipairs(PlayerOptions_StayInVeh) do
            if TSAdmins[j] then
                TSAdmins[j].permission.PlayerOptions_StayInVeh = true
            end
        end

        for i, j in ipairs(PlayerOptions_Heal) do
            if TSAdmins[j] then
                TSAdmins[j].permission.PlayerOptions_Heal = true
            end
        end

        for i, j in ipairs(PlayerOptions_Revive) do
            if TSAdmins[j] then
                TSAdmins[j].permission.PlayerOptions_Revive = true
            end
        end

        for i, j in ipairs(PlayerOptions_Armor) do
            if TSAdmins[j] then
                TSAdmins[j].permission.PlayerOptions_Armor = true
            end
        end

        for i, j in ipairs(PlayerOptions_CleanClothes) do
            if TSAdmins[j] then
                TSAdmins[j].permission.PlayerOptions_CleanClothes = true
            end
        end

        for i, j in ipairs(PlayerOptions_WetClothes) do
            if TSAdmins[j] then
                TSAdmins[j].permission.PlayerOptions_WetClothes = true
            end
        end

        for i, j in ipairs(PlayerOptions_DryClothes) do
            if TSAdmins[j] then
                TSAdmins[j].permission.PlayerOptions_DryClothes = true
            end
        end

        for i, j in ipairs(PlayerOptions_Suicide) do
            if TSAdmins[j] then
                TSAdmins[j].permission.PlayerOptions_Suicide = true
            end
        end

        for i, j in ipairs(PlayerOptions_Freeze) do
            if TSAdmins[j] then
                TSAdmins[j].permission.PlayerOptions_Freeze = true
            end
        end

        for i, j in ipairs(PlayerOptions_Noclip) do
            if TSAdmins[j] then
                TSAdmins[j].permission.PlayerOptions_Noclip = true
            end
        end

        for i, j in ipairs(PlayerOptions_GiveCar) do
            if TSAdmins[j] then
                TSAdmins[j].permission.PlayerOptions_GiveCar = true
            end
        end

        for i, j in ipairs(PlayerOptions_DeleteCar) do
            if TSAdmins[j] then
                TSAdmins[j].permission.PlayerOptions_DeleteCar = true
            end
        end

        for i, j in ipairs(PlayerOptions_ChangeSkin) do
            if TSAdmins[j] then
                TSAdmins[j].permission.PlayerOptions_ChangeSkin = true
            end
        end

        for i, j in ipairs(PlayerOptions_ChangePed) do
            if TSAdmins[j] then
                TSAdmins[j].permission.PlayerOptions_ChangePed = true
            end
        end

        for i, j in ipairs(VehicleRelated_Spawner) do
            if TSAdmins[j] then
                TSAdmins[j].permission.VehicleRelated_Spawner = true
            end
        end

        for i, j in ipairs(VehicleRelated_Modmenu) do
            if TSAdmins[j] then
                TSAdmins[j].permission.VehicleRelated_Modmenu = true
            end
        end

        for i, j in ipairs(VehicleRelated_Freeze) do
            if TSAdmins[j] then
                TSAdmins[j].permission.VehicleRelated_Freeze = true
            end
        end

        for i, j in ipairs(VehicleRelated_NumberPlate) do
            if TSAdmins[j] then
                TSAdmins[j].permission.VehicleRelated_NumberPlate = true
            end
        end

        for i, j in ipairs(VehicleRelated_DoorMenu) do
            if TSAdmins[j] then
                TSAdmins[j].permission.VehicleRelated_DoorMenu = true
            end
        end

        for i, j in ipairs(VehicleRelated_MultiplierSpeed) do
            if TSAdmins[j] then
                TSAdmins[j].permission.VehicleRelated_MultiplierSpeed = true
            end
        end

        for i, j in ipairs(VehicleRelated_FlipVehicle) do
            if TSAdmins[j] then
                TSAdmins[j].permission.VehicleRelated_FlipVehicle = true
            end
        end

        for i, j in ipairs(VehicleRelated_DeleteVehicle) do
            if TSAdmins[j] then
                TSAdmins[j].permission.VehicleRelated_DeleteVehicle = true
            end
        end

        for i, j in ipairs(VehicleRelated_UnlockVehicle) do
            if TSAdmins[j] then
                TSAdmins[j].permission.VehicleRelated_UnlockVehicle = true
            end
        end

        for i, j in ipairs(VehicleRelated_InfiniteFuel) do
            if TSAdmins[j] then
                TSAdmins[j].permission.VehicleRelated_InfiniteFuel = true
            end
        end

        for i, j in ipairs(VehicleRelated_NoBikeHelmet) do
            if TSAdmins[j] then
                TSAdmins[j].permission.VehicleRelated_NoBikeHelmet = true
            end
        end

        for i, j in ipairs(VehicleRelated_Godmode) do
            if TSAdmins[j] then
                TSAdmins[j].permission.VehicleRelated_Godmode = true
            end
        end

        for i, j in ipairs(VehicleRelated_Repair) do
            if TSAdmins[j] then
                TSAdmins[j].permission.VehicleRelated_Repair = true
            end
        end

        for i, j in ipairs(VehicleRelated_Wash) do
            if TSAdmins[j] then
                TSAdmins[j].permission.VehicleRelated_Wash = true
            end
        end

        for i, j in ipairs(VehicleRelated_KeepClean) do
            if TSAdmins[j] then
                TSAdmins[j].permission.VehicleRelated_KeepClean = true
            end
        end

        for i, j in ipairs(VehicleRelated_SetDirt) do
            if TSAdmins[j] then
                TSAdmins[j].permission.VehicleRelated_SetDirt = true
            end
        end

        for i, j in ipairs(MiscSettings_Teleport) do
            if TSAdmins[j] then
                TSAdmins[j].permission.MiscSettings_Teleport = true
            end
        end

        for i, j in ipairs(MiscSettings_ShowCoords) do
            if TSAdmins[j] then
                TSAdmins[j].permission.MiscSettings_ShowCoords = true
            end
        end

        for i, j in ipairs(MiscSettings_ClearArea) do
            if TSAdmins[j] then
                TSAdmins[j].permission.MiscSettings_ClearArea = true
            end
        end

        for i, j in ipairs(MiscSettings_ThermalVision) do
            if TSAdmins[j] then
                TSAdmins[j].permission.MiscSettings_ThermalVision = true
            end
        end

        for i, j in ipairs(MiscSettings_NightVision) do
            if TSAdmins[j] then
                TSAdmins[j].permission.MiscSettings_NightVision = true
            end
        end

        for i, j in ipairs(MiscSettings_PlayerBlips) do
            if TSAdmins[j] then
                TSAdmins[j].permission.MiscSettings_PlayerBlips = true
            end
        end

        for i, j in ipairs(MiscSettings_PlayerNames) do
            if TSAdmins[j] then
                TSAdmins[j].permission.MiscSettings_PlayerNames = true
            end
        end

        for i, j in ipairs(MiscSettings_Timecycle) do
            if TSAdmins[j] then
                TSAdmins[j].permission.MiscSettings_Timecycle = true
            end
        end

        for i, j in ipairs(MiscSettings_JoinQNotif) do
            if TSAdmins[j] then
                TSAdmins[j].permission.MiscSettings_JoinQNotif = true
            end
        end

        for i, j in ipairs(MiscSettings_Kill) do
            if TSAdmins[j] then
                TSAdmins[j].permission.MiscSettings_Kill = true
            end
        end

        for i, j in ipairs(MiscSettings_Announce) do
            if TSAdmins[j] then
                TSAdmins[j].permission.MiscSettings_Announce = true
            end
        end

        for i, j in ipairs(MiscSettings_PropSpawn) do
            if TSAdmins[j] then
                TSAdmins[j].permission.MiscSettings_PropSpawn = true
            end
        end

        for i, j in ipairs(MiscSettings_StaffChat) do
            if TSAdmins[j] then
                TSAdmins[j].permission.MiscSettings_StaffChat = true
            end
        end

        for i, j in ipairs(MiscSettings_Relog) do
            if TSAdmins[j] then
                TSAdmins[j].permission.MiscSettings_Relog = true
            end
        end

        for i, j in ipairs(TrollMenu_Fart) do
            if TSAdmins[j] then
                TSAdmins[j].permission.TrollMenu_Fart = true
            end
        end

        for i, j in ipairs(TrollMenu_Truck) do
            if TSAdmins[j] then
                TSAdmins[j].permission.TrollMenu_Truck = true
            end
        end

        for i, j in ipairs(TrollMenu_Clown) do
            if TSAdmins[j] then
                TSAdmins[j].permission.TrollMenu_Clown = true
            end
        end

        for i, j in ipairs(TrollMenu_Merry) do
            if TSAdmins[j] then
                TSAdmins[j].permission.TrollMenu_Merry = true
            end
        end

        for i, j in ipairs(TrollMenu_Flash) do
            if TSAdmins[j] then
                TSAdmins[j].permission.TrollMenu_Flash = true
            end
        end

        for i, j in ipairs(TrollMenu_FakeSound) do
            if TSAdmins[j] then
                TSAdmins[j].permission.TrollMenu_FakeSound = true
            end
        end

        for i, j in ipairs(TrollMenu_Lag) do
            if TSAdmins[j] then
                TSAdmins[j].permission.TrollMenu_Lag = true
            end
        end

        for i, j in ipairs(TrollMenu_BlowTyre) do
            if TSAdmins[j] then
                TSAdmins[j].permission.TrollMenu_BlowTyre = true
            end
        end

        for i, j in ipairs(TrollMenu_Eject) do
            if TSAdmins[j] then
                TSAdmins[j].permission.TrollMenu_Eject = true
            end
        end

        for i, j in ipairs(TrollMenu_Crash) do
            if TSAdmins[j] then
                TSAdmins[j].permission.TrollMenu_Crash = true
            end
        end

        for i, j in ipairs(OnlinePlyOptions_Spectate) do
            if TSAdmins[j] then
                TSAdmins[j].permission.OnlinePlyOptions_Spectate = true
            end
        end
        for i, j in ipairs(RockstarEditor) do
            if TSAdmins[j] then
                TSAdmins[j].permission.RockstarEditor = true
            end
        end

    end

end)

RegisterCommand('tsadminlist', function(source, args, raw)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        local group = xPlayer.getGroup()
        --print(group)
        if group == 'admin' or group == 'superadmin' then
            TriggerClientEvent('table', src, PlyList)
        end
    end
end)

CheckAllowed = function(source, type, type2)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local group = xPlayer.getGroup()
    local identifier = xPlayer.getIdentifier()
    local tonyaction = type
    local tonyaction2 = type2
    local allowed = false
    if group == 'admin' or group == 'superadmin' then
        allowed = true
    else
        if TSAdmins[identifier] then
            if TSAdmins[identifier].permission[tonyaction] or TSAdmins[identifier].permission[tonyaction2] or
                TSAdmins[identifier].permission.FullAccess then
                allowed = true
            end
        end
    end
    return allowed
end

RegisterNetEvent('ts-adminmenu:server:PlayerJoined', function()
    local xPlayer  = ESX.GetPlayerFromId(source)
    TriggerClientEvent('ts-adminmenu:client:PlayerJoined', -1,xPlayer)
end)

RegisterNetEvent('ts-adminmenu:server:removeCar', function(plate)
    local src = source
    local plate = plate
    local allowed = CheckAllowed(src, 'PlayerOptions_DeleteCar', 'PlayerOptions')
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
    local allowed = CheckAllowed(xPlayer.source, 'PlayerOptions_GiveCar', 'PlayerOptions')
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
    local allowed = CheckAllowed(xPlayer.source, 'PlayerOptions_ChangePed', 'PlayerOptions')
    if yPlayer and allowed then
        TriggerClientEvent('ts-adminmenu:client:SetPed', yPlayer.source, ped2)
    end
end)

RegisterNetEvent('ts-adminmenu:server:ShowInventory', function(ply)
    local src = source
    local Ply = ply
    local allowed = CheckAllowed(src, 'OnlinePlyOptions_OpenInventory', 'OnlinePlyOptions')
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
        if CheckAllowed(v.playerId, 'MiscSettings_Kill', 'MiscSettings') then
            TriggerClientEvent('ts-adminmenu:client:killnotif', v.playerId, msg)
        end
    end

end)

AddEventHandler('playerDropped', function(reason)
    local src = source
    local reason = reason
    local Players = ESX.GetExtendedPlayers()
    for k, v in pairs(Players) do
        if CheckAllowed(v.source, 'MiscSettings_JoinQNotif', 'MiscSettings') then
            TriggerClientEvent('ts-adminmenu:client:JoinQ', v.playerId,
                '~o~' .. GetPlayerName(src) .. '~s~ Left The Server Reason: ~y~' .. reason .. '~s~')
        end
    end
end)

AddEventHandler('esx:playerLoaded', function(name, setCallback, deferrals)
    local src = source
    local Players = ESX.GetExtendedPlayers()
    for k, v in pairs(Players) do
        if CheckAllowed(v.source, 'MiscSettings_JoinQNotif', 'MiscSettings') then
            TriggerClientEvent('ts-adminmenu:client:JoinQ', v.source,
                '~o~' .. GetPlayerName(src) .. '~s~ Joined The Server')
        end
    end
end)

RegisterNetEvent('ts-adminmenu:server:HealPlayer', function(pid)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(pid)
    local allowed = CheckAllowed(xPlayer.source, 'OnlinePlyOptions_Heal', 'OnlinePlyOptions')
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

ESX.RegisterServerCallback('ts-adminmenu:server:GetJobs', function(source, cb)
    local jobs = ESX.GetJobs()
    cb(jobs)

end)

RegisterNetEvent('ts-adminmenu:server:SetJob', function(pid, job, grade)
    local xPlayer = ESX.GetPlayerFromId(source)
    local job = job
    local grade = tonumber(grade)
    local yPlayer = ESX.GetPlayerFromId(pid)
    local allowed = CheckAllowed(xPlayer.source, 'OnlinePlyOptions_SetJob', 'OnlinePlyOptions')
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
    local allowed = CheckAllowed(xPlayer.source, 'OnlinePlyOptions_GiveMoney', 'OnlinePlyOptions')
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
    local allowed = CheckAllowed(xPlayer.source, 'OnlinePlyOptions_GiveMoney', 'OnlinePlyOptions')
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
    local allowed = CheckAllowed(xPlayer.source, 'OnlinePlyOptions_Revive', 'OnlinePlyOptions')
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
    local allowed = CheckAllowed(xPlayer.source, 'OnlinePlyOptions_Goto', 'OnlinePlyOptions')
    local yPlyCoords = yPlayer.getCoords(true)
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
    local xPlyCoords = xPlayer.getCoords(true)
    local allowed = CheckAllowed(xPlayer.source, 'OnlinePlyOptions_Bring', 'OnlinePlyOptions')
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
    local allowed = CheckAllowed(xPlayer.source, 'OnlinePlyOptions_SetWaypoint', 'OnlinePlyOptions')
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
    local allowed = CheckAllowed(xPlayer.source, 'OnlinePlyOptions_PRINTID', 'OnlinePlyOptions')
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
    local allowed = CheckAllowed(xPlayer.source, 'OnlinePlyOptions_KillPlayer', 'OnlinePlyOptions')
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
    local allowed = CheckAllowed(xPlayer.source, 'OnlinePlyOptions_KickPlayer', 'OnlinePlyOptions')
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
    local allowed = CheckAllowed(xPlayer.source, 'VehicleRelated_DeleteVehicle', 'VehicleRelatedOptions')
    local radius = 4.0
    if radi then
        radius = tonumber(radi) + 0.0
    end
    local veh = GetVehiclePedIsIn(GetPlayerPed(xPlayer.source))
    --print(radius)
    if allowed then
        local data = {
            ['Player'] = xPlayer.source, -- You need to set source here
            ['Log'] = 'adminmenu-spawncar', -- Log name
            ['Title'] = 'Delete Car Logs', -- Title
            ['Message'] = xPlayer.getName() .. ' deleted vehicle model: ' .. GetEntityModel(veh), -- Message
            ['Color'] = 'red' -- Set your color here check Config.Colors for available colors
        }

        TriggerEvent('Boost-Logs:SendLog', data)
        TriggerClientEvent('tsadmin:deleteVehicle', xPlayer.source, radius)
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
    local allowed = CheckAllowed(xPlayer.source, 'OnlinePlyOptions_ChangeSkin', 'OnlinePlyOptions')
    yPlayer.triggerEvent('esx_skin:openSaveableMenu')
end)

RegisterNetEvent('ts-adminmenu:server:SendMessage', function(pid, msg)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(pid)
    local message = msg
    local allowed = CheckAllowed(xPlayer.source, 'OnlinePlyOptions_SendMessage', 'OnlinePlyOptions')
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
    local allowed = CheckAllowed(source, 'OnlinePlyOptions_GiveItem', 'OnlinePlyOptions') or
                        CheckAllowed(source, 'OnlinePlyOptions_GiveItemName', 'OnlinePlyOptions')
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
    local allowed = CheckAllowed(source, 'OnlinePlyOptions_RemoveInventoryItem', 'OnlinePlyOptions')
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
    local allowed = CheckAllowed(source, 'OnlinePlyOptions_RemoveInventoryItem', 'OnlinePlyOptions')
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
    local allowed = CheckAllowed(source, 'VehicleRelated_Spawner', 'VehicleRelatedOptions')
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
        ESX.OneSync.SpawnVehicle(model or `baller2`, GetEntityCoords(playerPed), GetEntityHeading(playerPed), function(car)
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
    local plyList = ESX.GetExtendedPlayers()
    local allowed = CheckAllowed(src, 'TrollMenu_Fart', 'TrollMenu')
    if allowed then
        TriggerClientEvent('ts-adminmenu:client:PlayFart', src, plyList, farttype)
    end
end)

RegisterNetEvent('ts-adminmenu:server:propspawner', function()
    local src = source
    local allowed = CheckAllowed(src, 'MiscSettings_PropSpawn', 'MiscSettings')
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
    local allowed = CheckAllowed(src, 'MiscSettings_StaffChat', 'MiscSettings')
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
    local allowed = CheckAllowed(src, 'TrollMenu_Fart', 'TrollMenu')
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
    local allowed = CheckAllowed(xPlayer.source, 'TrollMenu_Truck', 'TrollMenu')
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
    local allowed = CheckAllowed(xPlayer.source, 'TrollMenu_Clown', 'TrollMenu')
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
    local allowed = CheckAllowed(xPlayer.source, 'TrollMenu_Merry', 'TrollMenu')
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
    local allowed = CheckAllowed(xPlayer.source, 'TrollMenu_Flash', 'TrollMenu')
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
    local allowed = CheckAllowed(source, 'MiscSettings_Announce', 'MiscSettings')
    if allowed then
        TriggerClientEvent('bvrtck_announce:annouce', -1, txt)
    end
end)

RegisterNetEvent('ts-adminmenu:server:FakeCallply', function(data2)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPlayer = ESX.GetPlayerFromId(data2.plyid)
    local allowed = CheckAllowed(xPlayer.source, 'TrollMenu_FakeSound', 'TrollMenu')
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
    local allowed = CheckAllowed(xPlayer.source, 'TrollMenu_Lag', 'TrollMenu')
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
    local allowed = CheckAllowed(xPlayer.source, 'TrollMenu_BlowTyre', 'TrollMenu')
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
    local allowed = CheckAllowed(xPlayer.source, 'TrollMenu_Eject', 'TrollMenu')
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
    local allowed = CheckAllowed(xPlayer.source, 'TrollMenu_Crash', 'TrollMenu')
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
    local allowed = CheckAllowed(xPlayer.source, 'OnlinePlyOptions_License', 'OnlinePlyOptions')
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
--[[
RegisterNetEvent('esx:playerLoaded', function(plyId, xPly)
    local ply = xPly
    ply.name = GetPlayerName(ply.playerId)
    table.insert(PlyList, ply)
end)]]--
--[[
RegisterNetEvent('esx:playerLogout', function(playerId)
    local plyid = playerId
    for k, v in pairs(PlyList) do
        if v.source == plyid then
            PlyList[k] = nil
        end
    end
end)]]--



ESX.RegisterServerCallback('ts-adminmenu:server:GetOnlinePlayers', function(source, cb)
    local players = GetActivePlayers()
    local plylist = {}
    for k, v in ipairs(players) do
        local plytable = {source = v, name = GetPlayerName(v)}
        table.insert(plylist,plytable)
    end
    table.sort(plylist, function(a, b) return a.name:upper() < b.name:upper() end)
    cb(plylist)
end)

ESX.RegisterServerCallback("ts-adminmenu:server:IsAllowed", function(source, cb, action, action2)
    local src = source
    --print(src)
    local xPlayer = ESX.GetPlayerFromId(src)
    local allowed = false
    if xPlayer then
    local group = xPlayer.getGroup()
    local identifier = xPlayer.getIdentifier()
    local tonyaction = action
    local tonyaction2 = action2 or action
    --print(tonyaction, tonyaction2)
    if group == 'admin' or group == 'superadmin' then
        allowed = true
    else
        if TSAdmins[identifier] then
            if TSAdmins[identifier].permission[tonyaction] or TSAdmins[identifier].permission[tonyaction2] or
                TSAdmins[identifier].permission.FullAccess then
                allowed = true
            end
        end

    end
end
    cb(allowed)
end)
