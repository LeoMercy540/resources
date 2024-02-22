-- Event Handler

AddEventHandler('playerDropped', function()
    local src = source
    if CNRCore.Players[src] then
        local Player = CNRCore.Players[src]
        TriggerEvent('cnr-log:server:CreateLog', 'joinleave', 'Dropped', 'red', '**' .. GetPlayerName(src) .. '** (' .. Player.PlayerData.license .. ') left..')
        Player.Functions.Save()
        _G.Player_Buckets[Player.PlayerData.license] = nil
        CNRCore.Players[src] = nil
    end
end)

AddEventHandler('chatMessage', function(source, n, message)
    local src = source
    if string.sub(message, 1, 1) == '/' then
        local args = CNRCore.Shared.SplitStr(message, ' ')
        local command = string.gsub(args[1]:lower(), '/', '')
        CancelEvent()
        if CNRCore.Commands.List[command] then
            local Player = CNRCore.Functions.GetPlayer(src)
            if Player then
                local isGod = CNRCore.Functions.HasPermission(src, 'god')
                local hasPerm = CNRCore.Functions.HasPermission(src, CNRCore.Commands.List[command].permission)
                local isPrincipal = IsPlayerAceAllowed(src, 'command')
                table.remove(args, 1)
                if isGod or hasPerm or isPrincipal then
                    if (CNRCore.Commands.List[command].argsrequired and #CNRCore.Commands.List[command].arguments ~= 0 and args[#CNRCore.Commands.List[command].arguments] == nil) then
                        TriggerClientEvent('CNRCore:Notify', src, Lang:t('error.missing_args2'), 'error')
                    else
                        CNRCore.Commands.List[command].callback(src, args)
                    end
                else
                    TriggerClientEvent('CNRCore:Notify', src, Lang:t('error.no_access'), 'error')
                end
            end
        end
    end
end)

-- Player Connecting

local function OnPlayerConnecting(name, setKickReason, deferrals)
    local player = source
    local license
    local identifiers = GetPlayerIdentifiers(player)
    deferrals.defer()

    -- mandatory wait!
    Wait(0)

    deferrals.update(string.format('Hello %s. Validating Your Rockstar License', name))

    for _, v in pairs(identifiers) do
        if string.find(v, 'license') then
            license = v
            break
        end
    end

    -- mandatory wait!
    Wait(2500)

    deferrals.update(string.format('Hello %s. We are checking if you are banned.', name))

    local isBanned, Reason = CNRCore.Functions.IsPlayerBanned(player)
    local isLicenseAlreadyInUse = CNRCore.Functions.IsLicenseInUse(license)

    Wait(2500)

    deferrals.update(string.format('Welcome %s to {Server Name}.', name))

    if not license then
        deferrals.done('No Valid Rockstar License Found')
    elseif isBanned then
        deferrals.done(Reason)
    elseif isLicenseAlreadyInUse and CNRCore.Config.Server.checkDuplicateLicense then
        deferrals.done('Duplicate Rockstar License Found')
    else
        deferrals.done()
        Wait(1000)
        TriggerEvent('connectqueue:playerConnect', name, setKickReason, deferrals)
    end
    --Add any additional defferals you may need!
end

AddEventHandler('playerConnecting', OnPlayerConnecting)

-- Open & Close Server (prevents players from joining)

RegisterNetEvent('CNRCore:server:CloseServer', function(reason)
    local src = source
    if CNRCore.Functions.HasPermission(src, 'admin') or CNRCore.Functions.HasPermission(src, 'god') then
        local reason = reason or 'No reason specified'
        CNRCore.Config.Server.closed = true
        CNRCore.Config.Server.closedReason = reason
    else
        CNRCore.Functions.Kick(src, 'You don\'t have permissions for this..', nil, nil)
    end
end)

RegisterNetEvent('CNRCore:server:OpenServer', function()
    local src = source
    if CNRCore.Functions.HasPermission(src, 'admin') or CNRCore.Functions.HasPermission(src, 'god') then
        CNRCore.Config.Server.closed = false
    else
        CNRCore.Functions.Kick(src, 'You don\'t have permissions for this..', nil, nil)
    end
end)

-- Callbacks

RegisterNetEvent('CNRCore:Server:TriggerCallback', function(name, ...)
    local src = source
    CNRCore.Functions.TriggerCallback(name, src, function(...)
        TriggerClientEvent('CNRCore:Client:TriggerCallback', src, name, ...)
    end, ...)
end)

-- Player

RegisterNetEvent('CNRCore:UpdatePlayer', function()
    local src = source
    local Player = CNRCore.Functions.GetPlayer(src)
    if Player then
        local newHunger = Player.PlayerData.metadata['hunger'] - CNRCore.Config.Player.HungerRate
        local newThirst = Player.PlayerData.metadata['thirst'] - CNRCore.Config.Player.ThirstRate
        if newHunger <= 0 then
            newHunger = 0
        end
        if newThirst <= 0 then
            newThirst = 0
        end
        Player.Functions.SetMetaData('thirst', newThirst)
        Player.Functions.SetMetaData('hunger', newHunger)
        TriggerClientEvent('hud:client:UpdateNeeds', src, newHunger, newThirst)
        Player.Functions.Save()
    end
end)

RegisterNetEvent('CNRCore:Server:SetMetaData', function(meta, data)
    local src = source
    local Player = CNRCore.Functions.GetPlayer(src)
    if meta == 'hunger' or meta == 'thirst' then
        if data > 100 then
            data = 100
        end
    end
    if Player then
        Player.Functions.SetMetaData(meta, data)
    end
    TriggerClientEvent('hud:client:UpdateNeeds', src, Player.PlayerData.metadata['hunger'], Player.PlayerData.metadata['thirst'])
end)

RegisterNetEvent('CNRCore:ToggleDuty', function()
    local src = source
    local Player = CNRCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.onduty then
        Player.Functions.SetJobDuty(false)
        TriggerClientEvent('CNRCore:Notify', src, Lang:t('info.off_duty'))
    else
        Player.Functions.SetJobDuty(true)
        TriggerClientEvent('CNRCore:Notify', src, Lang:t('info.on_duty'))
    end
    TriggerClientEvent('CNRCore:Client:SetDuty', src, Player.PlayerData.job.onduty)
end)

-- Items

RegisterNetEvent('CNRCore:Server:UseItem', function(item)
    local src = source
    if item and item.amount > 0 then
        if CNRCore.Functions.CanUseItem(item.name) then
            CNRCore.Functions.UseItem(src, item)
        end
    end
end)

RegisterNetEvent('CNRCore:Server:RemoveItem', function(itemName, amount, slot)
    local src = source
    local Player = CNRCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(itemName, amount, slot)
end)

RegisterNetEvent('CNRCore:Server:AddItem', function(itemName, amount, slot, info)
    local src = source
    local Player = CNRCore.Functions.GetPlayer(src)
    Player.Functions.AddItem(itemName, amount, slot, info)
end)

-- Non-Chat Command Calling (ex: cnr-adminmenu)

RegisterNetEvent('CNRCore:CallCommand', function(command, args)
    local src = source
    if CNRCore.Commands.List[command] then
        local Player = CNRCore.Functions.GetPlayer(src)
        if Player then
            local isGod = CNRCore.Functions.HasPermission(src, 'god')
            local hasPerm = CNRCore.Functions.HasPermission(src, CNRCore.Commands.List[command].permission)
            local isPrincipal = IsPlayerAceAllowed(src, 'command')
            if (CNRCore.Commands.List[command].permission == Player.PlayerData.job.name) or isGod or hasPerm or isPrincipal then
                if (CNRCore.Commands.List[command].argsrequired and #CNRCore.Commands.List[command].arguments ~= 0 and args[#CNRCore.Commands.List[command].arguments] == nil) then
                    TriggerClientEvent('CNRCore:Notify', src, Lang:t('error.missing_args2'), 'error')
                else
                    CNRCore.Commands.List[command].callback(src, args)
                end
            else
                TriggerClientEvent('CNRCore:Notify', src, Lang:t('error.no_access'), 'error')
            end
        end
    end
end)

-- Has Item Callback (can also use client function - CNRCore.Functions.HasItem(item))

CNRCore.Functions.CreateCallback('CNRCore:HasItem', function(source, cb, items, amount)
    local src = source
    local retval = false
    local Player = CNRCore.Functions.GetPlayer(src)
    if Player then
        if type(items) == 'table' then
            local count = 0
            local finalcount = 0
            for k, v in pairs(items) do
                if type(k) == 'string' then
                    finalcount = 0
                    for i, _ in pairs(items) do
                        if i then
                            finalcount = finalcount + 1
                        end
                    end
                    local item = Player.Functions.GetItemByName(k)
                    if item then
                        if item.amount >= v then
                            count = count + 1
                            if count == finalcount then
                                retval = true
                            end
                        end
                    end
                else
                    finalcount = #items
                    local item = Player.Functions.GetItemByName(v)
                    if item then
                        if amount then
                            if item.amount >= amount then
                                count = count + 1
                                if count == finalcount then
                                    retval = true
                                end
                            end
                        else
                            count = count + 1
                            if count == finalcount then
                                retval = true
                            end
                        end
                    end
                end
            end
        else
            local item = Player.Functions.GetItemByName(items)
            if item then
                if amount then
                    if item.amount >= amount then
                        retval = true
                    end
                else
                    retval = true
                end
            end
        end
    end
    cb(retval)
end)
