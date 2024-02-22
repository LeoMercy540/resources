CNRCore.Players = {}
CNRCore.Player = {}

-- On player login get their data or set defaults
-- Don't touch any of this unless you know what you are doing
-- Will cause major issues!

function CNRCore.Player.Login(source, citizenid, newData)
    local src = source
    if src then
        if citizenid then
            local license = CNRCore.Functions.GetIdentifier(src, 'license')
            local PlayerData = MySQL.Sync.prepare('SELECT * FROM players where citizenid = ?', { citizenid })
            if PlayerData and license == PlayerData.license then
                PlayerData.money = json.decode(PlayerData.money)
                PlayerData.position = json.decode(PlayerData.position)
                PlayerData.metadata = json.decode(PlayerData.metadata)
                PlayerData.charinfo = json.decode(PlayerData.charinfo)
                CNRCore.Player.CheckPlayerData(src, PlayerData)
            else
                DropPlayer(src, 'You Have Been Kicked For Exploitation')
                TriggerEvent('cnr-log:server:CreateLog', 'anticheat', 'Anti-Cheat', 'white', GetPlayerName(src) .. ' Has Been Dropped For Character Joining Exploit', false)
            end
        else
            CNRCore.Player.CheckPlayerData(src, newData)
        end
        return true
    else
        CNRCore.ShowError(GetCurrentResourceName(), 'ERROR CNRCORE.PLAYER.LOGIN - NO SOURCE GIVEN!')
        return false
    end
end

function CNRCore.Player.CheckPlayerData(source, PlayerData)
    local src = source
    PlayerData = PlayerData or {}
    PlayerData.source = src
    PlayerData.citizenid = PlayerData.citizenid or CNRCore.Player.CreateCitizenId()
    PlayerData.license = PlayerData.license or CNRCore.Functions.GetIdentifier(src, 'license')
    PlayerData.name = GetPlayerName(src)
    PlayerData.cid = PlayerData.cid or 1
    PlayerData.money = PlayerData.money or {}
    for moneytype, startamount in pairs(CNRCore.Config.Money.MoneyTypes) do
        PlayerData.money[moneytype] = PlayerData.money[moneytype] or startamount
    end
    -- Metadata
    PlayerData.metadata = PlayerData.metadata or {}
    PlayerData.metadata['isdead'] = PlayerData.metadata['isdead'] or false
    PlayerData.metadata['inlaststand'] = PlayerData.metadata['inlaststand'] or false
    PlayerData.metadata['armor'] = PlayerData.metadata['armor'] or 0
    PlayerData.metadata['ishandcuffed'] = PlayerData.metadata['ishandcuffed'] or false
    PlayerData.metadata['injail'] = PlayerData.metadata['injail'] or 0
    PlayerData.metadata['status'] = PlayerData.metadata['status'] or {}
    PlayerData.metadata['currentapartment'] = PlayerData.metadata['currentapartment'] or nil
    PlayerData.metadata['inside'] = PlayerData.metadata['inside'] or {
        house = nil,
        apartment = {
            apartmentType = nil,
            apartmentId = nil,
        }
    }
    -- Other
    PlayerData.position = PlayerData.position or CNRConfig.DefaultSpawn
    PlayerData.LoggedIn = true
    PlayerData = CNRCore.Player.LoadInventory(PlayerData)
    CNRCore.Player.CreatePlayer(PlayerData)
end

-- On player logout

function CNRCore.Player.Logout(source)
    local src = source
    TriggerClientEvent('CNRCore:Client:OnPlayerUnload', src)
    TriggerClientEvent('CNRCore:Player:UpdatePlayerData', src)
    Wait(200)
    CNRCore.Players[src] = nil
end

-- Create a new character
-- Don't touch any of this unless you know what you are doing
-- Will cause major issues!

function CNRCore.Player.CreatePlayer(PlayerData)
    local self = {}
    self.Functions = {}
    self.PlayerData = PlayerData

    self.Functions.UpdatePlayerData = function(dontUpdateChat)
        TriggerClientEvent('CNRCore:Player:SetPlayerData', self.PlayerData.source, self.PlayerData)
        if dontUpdateChat == nil then
            CNRCore.Commands.Refresh(self.PlayerData.source)
        end
    end

    self.Functions.SetMetaData = function(meta, val)
        local meta = meta:lower()
        if val ~= nil then
            self.PlayerData.metadata[meta] = val
            self.Functions.UpdatePlayerData()
        end
    end

    self.Functions.AddMoney = function(moneytype, amount, reason)
        reason = reason or 'unknown'
        local moneytype = moneytype:lower()
        local amount = tonumber(amount)
        if amount < 0 then
            return
        end
        if self.PlayerData.money[moneytype] then
            self.PlayerData.money[moneytype] = self.PlayerData.money[moneytype] + amount
            self.Functions.UpdatePlayerData()
            if amount > 100000 then
                TriggerEvent('cnr-log:server:CreateLog', 'playermoney', 'AddMoney', 'lightgreen', '**' .. GetPlayerName(self.PlayerData.source) .. ' (citizenid: ' .. self.PlayerData.citizenid .. ' | id: ' .. self.PlayerData.source .. ')** $' .. amount .. ' (' .. moneytype .. ') added, new ' .. moneytype .. ' balance: ' .. self.PlayerData.money[moneytype], true)
            else
                TriggerEvent('cnr-log:server:CreateLog', 'playermoney', 'AddMoney', 'lightgreen', '**' .. GetPlayerName(self.PlayerData.source) .. ' (citizenid: ' .. self.PlayerData.citizenid .. ' | id: ' .. self.PlayerData.source .. ')** $' .. amount .. ' (' .. moneytype .. ') added, new ' .. moneytype .. ' balance: ' .. self.PlayerData.money[moneytype])
            end
            TriggerClientEvent('hud:client:OnMoneyChange', self.PlayerData.source, moneytype, amount, false)
            return true
        end
        return false
    end

    self.Functions.RemoveMoney = function(moneytype, amount, reason)
        reason = reason or 'unknown'
        local moneytype = moneytype:lower()
        local amount = tonumber(amount)
        if amount < 0 then
            return
        end
        if self.PlayerData.money[moneytype] then
            for _, mtype in pairs(CNRCore.Config.Money.DontAllowMinus) do
                if mtype == moneytype then
                    if self.PlayerData.money[moneytype] - amount < 0 then
                        return false
                    end
                end
            end
            self.PlayerData.money[moneytype] = self.PlayerData.money[moneytype] - amount
            self.Functions.UpdatePlayerData()
            if amount > 100000 then
                TriggerEvent('cnr-log:server:CreateLog', 'playermoney', 'RemoveMoney', 'red', '**' .. GetPlayerName(self.PlayerData.source) .. ' (citizenid: ' .. self.PlayerData.citizenid .. ' | id: ' .. self.PlayerData.source .. ')** $' .. amount .. ' (' .. moneytype .. ') removed, new ' .. moneytype .. ' balance: ' .. self.PlayerData.money[moneytype], true)
            else
                TriggerEvent('cnr-log:server:CreateLog', 'playermoney', 'RemoveMoney', 'red', '**' .. GetPlayerName(self.PlayerData.source) .. ' (citizenid: ' .. self.PlayerData.citizenid .. ' | id: ' .. self.PlayerData.source .. ')** $' .. amount .. ' (' .. moneytype .. ') removed, new ' .. moneytype .. ' balance: ' .. self.PlayerData.money[moneytype])
            end
            TriggerClientEvent('hud:client:OnMoneyChange', self.PlayerData.source, moneytype, amount, true)
            if moneytype == 'bank' then
                TriggerClientEvent('cnr-phone:client:RemoveBankMoney', self.PlayerData.source, amount)
            end
            return true
        end
        return false
    end

    self.Functions.SetMoney = function(moneytype, amount, reason)
        reason = reason or 'unknown'
        local moneytype = moneytype:lower()
        local amount = tonumber(amount)
        if amount < 0 then
            return
        end
        if self.PlayerData.money[moneytype] then
            self.PlayerData.money[moneytype] = amount
            self.Functions.UpdatePlayerData()
            TriggerEvent('cnr-log:server:CreateLog', 'playermoney', 'SetMoney', 'green', '**' .. GetPlayerName(self.PlayerData.source) .. ' (citizenid: ' .. self.PlayerData.citizenid .. ' | id: ' .. self.PlayerData.source .. ')** $' .. amount .. ' (' .. moneytype .. ') set, new ' .. moneytype .. ' balance: ' .. self.PlayerData.money[moneytype])
            return true
        end
        return false
    end

    self.Functions.GetMoney = function(moneytype)
        if moneytype then
            local moneytype = moneytype:lower()
            return self.PlayerData.money[moneytype]
        end
        return false
    end

    self.Functions.AddItem = function(item, amount, slot, info)
        local totalWeight = CNRCore.Player.GetTotalWeight(self.PlayerData.items)
        local itemInfo = CNRCore.Shared.Items[item:lower()]
        if itemInfo == nil then
            TriggerClientEvent('CNRCore:Notify', self.PlayerData.source, Lang:t('error.item_not_exist'), 'error')
            return
        end
        local amount = tonumber(amount)
        local slot = tonumber(slot) or CNRCore.Player.GetFirstSlotByItem(self.PlayerData.items, item)
        if itemInfo['type'] == 'weapon' and info == nil then
            info = {
                serie = tostring(CNRCore.Shared.RandomInt(2) .. CNRCore.Shared.RandomStr(3) .. CNRCore.Shared.RandomInt(1) .. CNRCore.Shared.RandomStr(2) .. CNRCore.Shared.RandomInt(3) .. CNRCore.Shared.RandomStr(4)),
            }
        end
        if (totalWeight + (itemInfo['weight'] * amount)) <= CNRCore.Config.Player.MaxWeight then
            if (slot and self.PlayerData.items[slot]) and (self.PlayerData.items[slot].name:lower() == item:lower()) and (itemInfo['type'] == 'item' and not itemInfo['unique']) then
                self.PlayerData.items[slot].amount = self.PlayerData.items[slot].amount + amount
                self.Functions.UpdatePlayerData()
                TriggerEvent('cnr-log:server:CreateLog', 'playerinventory', 'AddItem', 'green', '**' .. GetPlayerName(self.PlayerData.source) .. ' (citizenid: ' .. self.PlayerData.citizenid .. ' | id: ' .. self.PlayerData.source .. ')** got item: [slot:' .. slot .. '], itemname: ' .. self.PlayerData.items[slot].name .. ', added amount: ' .. amount .. ', new total amount: ' .. self.PlayerData.items[slot].amount)
                return true
            elseif (not itemInfo['unique'] and slot or slot and self.PlayerData.items[slot] == nil) then
                self.PlayerData.items[slot] = { name = itemInfo['name'], amount = amount, info = info or '', label = itemInfo['label'], description = itemInfo['description'] or '', weight = itemInfo['weight'], type = itemInfo['type'], unique = itemInfo['unique'], useable = itemInfo['useable'], image = itemInfo['image'], shouldClose = itemInfo['shouldClose'], slot = slot, combinable = itemInfo['combinable'] }
                self.Functions.UpdatePlayerData()
                TriggerEvent('cnr-log:server:CreateLog', 'playerinventory', 'AddItem', 'green', '**' .. GetPlayerName(self.PlayerData.source) .. ' (citizenid: ' .. self.PlayerData.citizenid .. ' | id: ' .. self.PlayerData.source .. ')** got item: [slot:' .. slot .. '], itemname: ' .. self.PlayerData.items[slot].name .. ', added amount: ' .. amount .. ', new total amount: ' .. self.PlayerData.items[slot].amount)
                return true
            elseif (itemInfo['unique']) or (not slot or slot == nil) or (itemInfo['type'] == 'weapon') then
                for i = 1, CNRConfig.Player.MaxInvSlots, 1 do
                    if self.PlayerData.items[i] == nil then
                        self.PlayerData.items[i] = { name = itemInfo['name'], amount = amount, info = info or '', label = itemInfo['label'], description = itemInfo['description'] or '', weight = itemInfo['weight'], type = itemInfo['type'], unique = itemInfo['unique'], useable = itemInfo['useable'], image = itemInfo['image'], shouldClose = itemInfo['shouldClose'], slot = i, combinable = itemInfo['combinable'] }
                        self.Functions.UpdatePlayerData()
                        TriggerEvent('cnr-log:server:CreateLog', 'playerinventory', 'AddItem', 'green', '**' .. GetPlayerName(self.PlayerData.source) .. ' (citizenid: ' .. self.PlayerData.citizenid .. ' | id: ' .. self.PlayerData.source .. ')** got item: [slot:' .. i .. '], itemname: ' .. self.PlayerData.items[i].name .. ', added amount: ' .. amount .. ', new total amount: ' .. self.PlayerData.items[i].amount)
                        return true
                    end
                end
            end
        else
            TriggerClientEvent('CNRCore:Notify', self.PlayerData.source, Lang:t('error.too_heavy'), 'error')
        end
        return false
    end

    self.Functions.RemoveItem = function(item, amount, slot)
        local amount = tonumber(amount)
        local slot = tonumber(slot)
        if slot then
            if self.PlayerData.items[slot].amount > amount then
                self.PlayerData.items[slot].amount = self.PlayerData.items[slot].amount - amount
                self.Functions.UpdatePlayerData()
                TriggerEvent('cnr-log:server:CreateLog', 'playerinventory', 'RemoveItem', 'red', '**' .. GetPlayerName(self.PlayerData.source) .. ' (citizenid: ' .. self.PlayerData.citizenid .. ' | id: ' .. self.PlayerData.source .. ')** lost item: [slot:' .. slot .. '], itemname: ' .. self.PlayerData.items[slot].name .. ', removed amount: ' .. amount .. ', new total amount: ' .. self.PlayerData.items[slot].amount)
                return true
            elseif self.PlayerData.items[slot].amount == amount then
                self.PlayerData.items[slot] = nil
                self.Functions.UpdatePlayerData()
                TriggerEvent('cnr-log:server:CreateLog', 'playerinventory', 'RemoveItem', 'red', '**' .. GetPlayerName(self.PlayerData.source) .. ' (citizenid: ' .. self.PlayerData.citizenid .. ' | id: ' .. self.PlayerData.source .. ')** lost item: [slot:' .. slot .. '], itemname: ' .. item .. ', removed amount: ' .. amount .. ', item removed')
                return true
            end
        else
            local slots = CNRCore.Player.GetSlotsByItem(self.PlayerData.items, item)
            local amountToRemove = amount
            if slots then
                for _, slot in pairs(slots) do
                    if self.PlayerData.items[slot].amount > amountToRemove then
                        self.PlayerData.items[slot].amount = self.PlayerData.items[slot].amount - amountToRemove
                        self.Functions.UpdatePlayerData()
                        TriggerEvent('cnr-log:server:CreateLog', 'playerinventory', 'RemoveItem', 'red', '**' .. GetPlayerName(self.PlayerData.source) .. ' (citizenid: ' .. self.PlayerData.citizenid .. ' | id: ' .. self.PlayerData.source .. ')** lost item: [slot:' .. slot .. '], itemname: ' .. self.PlayerData.items[slot].name .. ', removed amount: ' .. amount .. ', new total amount: ' .. self.PlayerData.items[slot].amount)
                        return true
                    elseif self.PlayerData.items[slot].amount == amountToRemove then
                        self.PlayerData.items[slot] = nil
                        self.Functions.UpdatePlayerData()
                        TriggerEvent('cnr-log:server:CreateLog', 'playerinventory', 'RemoveItem', 'red', '**' .. GetPlayerName(self.PlayerData.source) .. ' (citizenid: ' .. self.PlayerData.citizenid .. ' | id: ' .. self.PlayerData.source .. ')** lost item: [slot:' .. slot .. '], itemname: ' .. item .. ', removed amount: ' .. amount .. ', item removed')
                        return true
                    end
                end
            end
        end
        return false
    end

    self.Functions.SetInventory = function(items, dontUpdateChat)
        self.PlayerData.items = items
        self.Functions.UpdatePlayerData(dontUpdateChat)
        TriggerEvent('cnr-log:server:CreateLog', 'playerinventory', 'SetInventory', 'blue', '**' .. GetPlayerName(self.PlayerData.source) .. ' (citizenid: ' .. self.PlayerData.citizenid .. ' | id: ' .. self.PlayerData.source .. ')** items set: ' .. json.encode(items))
    end

    self.Functions.ClearInventory = function()
        self.PlayerData.items = {}
        self.Functions.UpdatePlayerData()
        TriggerEvent('cnr-log:server:CreateLog', 'playerinventory', 'ClearInventory', 'red', '**' .. GetPlayerName(self.PlayerData.source) .. ' (citizenid: ' .. self.PlayerData.citizenid .. ' | id: ' .. self.PlayerData.source .. ')** inventory cleared')
    end

    self.Functions.GetItemByName = function(item)
        local item = tostring(item):lower()
        local slot = CNRCore.Player.GetFirstSlotByItem(self.PlayerData.items, item)
        if slot then
            return self.PlayerData.items[slot]
        end
        return nil
    end

    self.Functions.GetItemsByName = function(item)
        local item = tostring(item):lower()
        local items = {}
        local slots = CNRCore.Player.GetSlotsByItem(self.PlayerData.items, item)
        for _, slot in pairs(slots) do
            if slot then
                items[#items+1] = self.PlayerData.items[slot]
            end
        end
        return items
    end

    self.Functions.SetCreditCard = function(cardNumber)
        self.PlayerData.charinfo.card = cardNumber
        self.Functions.UpdatePlayerData()
    end

    self.Functions.GetCardSlot = function(cardNumber, cardType)
        local item = tostring(cardType):lower()
        local slots = CNRCore.Player.GetSlotsByItem(self.PlayerData.items, item)
        for _, slot in pairs(slots) do
            if slot then
                if self.PlayerData.items[slot].info.cardNumber == cardNumber then
                    return slot
                end
            end
        end
        return nil
    end

    self.Functions.GetItemBySlot = function(slot)
        local slot = tonumber(slot)
        if self.PlayerData.items[slot] then
            return self.PlayerData.items[slot]
        end
        return nil
    end

    self.Functions.Save = function()
        CNRCore.Player.Save(self.PlayerData.source)
    end

    CNRCore.Players[self.PlayerData.source] = self
    CNRCore.Player.Save(self.PlayerData.source)

    -- At this point we are safe to emit new instance to third party resource for load handling
    TriggerEvent('CNRCore:Server:PlayerLoaded', self)
    self.Functions.UpdatePlayerData()
end

-- Save player info to database (make sure citizenid is the primary key in your database)

function CNRCore.Player.Save(source)
    local src = source
    local ped = GetPlayerPed(src)
    local pcoords = GetEntityCoords(ped)
    local PlayerData = CNRCore.Players[src].PlayerData
    if PlayerData then
        MySQL.Async.insert('INSERT INTO players (citizenid, cid, license, name, money, charinfo, position, metadata) VALUES (:citizenid, :cid, :license, :name, :money, :charinfo, :position, :metadata) ON DUPLICATE KEY UPDATE cid = :cid, name = :name, money = :money, charinfo = :charinfo, position = :position, metadata = :metadata', {
            citizenid = PlayerData.citizenid,
            cid = tonumber(PlayerData.cid),
            license = PlayerData.license,
            name = PlayerData.name,
            money = json.encode(PlayerData.money),
            charinfo = json.encode(PlayerData.charinfo),
            position = json.encode(pcoords),
            metadata = json.encode(PlayerData.metadata)
        })
        CNRCore.Player.SaveInventory(src)
        CNRCore.ShowSuccess(GetCurrentResourceName(), PlayerData.name .. ' PLAYER SAVED!')
    else
        CNRCore.ShowError(GetCurrentResourceName(), 'ERROR CNRCORE.PLAYER.SAVE - PLAYERDATA IS EMPTY!')
    end
end

-- Delete character

local playertables = { -- Add tables as needed
    { table = 'players' }
}

function CNRCore.Player.DeleteCharacter(source, citizenid)
    local src = source
    local license = CNRCore.Functions.GetIdentifier(src, 'license')
    local result = MySQL.Sync.fetchScalar('SELECT license FROM players where citizenid = ?', { citizenid })
    if license == result then
        local query = "DELETE FROM %s WHERE citizenid = ?"
		local tableCount = #playertables
		local queries = table.create(tableCount, 0)

		for i=1, tableCount do
			local v = playertables[i]
			queries[i] = {query = query:format(v.table), values = { citizenid }}
		end

        MySQL.Async.transaction(queries, function(result)
			if result then
				TriggerEvent('cnr-log:server:CreateLog', 'joinleave', 'Character Deleted', 'red', '**' .. GetPlayerName(src) .. '** ' .. license .. ' deleted **' .. citizenid .. '**..')
            end
		end)
    else
        DropPlayer(src, 'You Have Been Kicked For Exploitation')
        TriggerEvent('cnr-log:server:CreateLog', 'anticheat', 'Anti-Cheat', 'white', GetPlayerName(src) .. ' Has Been Dropped For Character Deletion Exploit', false)
    end
end

-- Inventory

CNRCore.Player.LoadInventory = function(PlayerData)
    PlayerData.items = {}
    local inventory = MySQL.Sync.prepare('SELECT inventory FROM players WHERE citizenid = ?', { PlayerData.citizenid })
    if inventory then
        inventory = json.decode(inventory)
        if next(inventory) then
            for _, item in pairs(inventory) do
                if item then
                    local itemInfo = CNRCore.Shared.Items[item.name:lower()]
                    if itemInfo then
                        PlayerData.items[item.slot] = {
                            name = itemInfo['name'],
                            amount = item.amount,
                            info = item.info or '',
                            label = itemInfo['label'],
                            description = itemInfo['description'] or '',
                            weight = itemInfo['weight'],
                            type = itemInfo['type'],
                            unique = itemInfo['unique'],
                            useable = itemInfo['useable'],
                            image = itemInfo['image'],
                            shouldClose = itemInfo['shouldClose'],
                            slot = item.slot,
                            combinable = itemInfo['combinable']
                        }
                    end
                end
            end
        end
    end
    return PlayerData
end

CNRCore.Player.SaveInventory = function(source)
    local src = source
    if CNRCore.Players[src] then
        local PlayerData = CNRCore.Players[src].PlayerData
        local items = PlayerData.items
        local ItemsJson = {}
        if items and next(items) then
            for slot, item in pairs(items) do
                if items[slot] then
                    ItemsJson[#ItemsJson+1] = {
                        name = item.name,
                        amount = item.amount,
                        info = item.info,
                        type = item.type,
                        slot = slot,
                    }
                end
            end
            MySQL.Async.prepare('UPDATE players SET inventory = ? WHERE citizenid = ?', { json.encode(ItemsJson), PlayerData.citizenid })
        else
            MySQL.Async.prepare('UPDATE players SET inventory = ? WHERE citizenid = ?', { '[]', PlayerData.citizenid })
        end
    end
end

-- Util Functions

function CNRCore.Player.GetTotalWeight(items)
    local weight = 0
    if items then
        for slot, item in pairs(items) do
            weight = weight + (item.weight * item.amount)
        end
    end
    return tonumber(weight)
end

function CNRCore.Player.GetSlotsByItem(items, itemName)
    local slotsFound = {}
    if items then
        for slot, item in pairs(items) do
            if item.name:lower() == itemName:lower() then
                slotsFound[#slotsFound+1] = slot
            end
        end
    end
    return slotsFound
end

function CNRCore.Player.GetFirstSlotByItem(items, itemName)
    if items then
        for slot, item in pairs(items) do
            if item.name:lower() == itemName:lower() then
                return tonumber(slot)
            end
        end
    end
    return nil
end

function CNRCore.Player.CreateCitizenId()
    local UniqueFound = false
    local CitizenId = nil
    while not UniqueFound do
        CitizenId = tostring(CNRCore.Shared.RandomStr(3) .. CNRCore.Shared.RandomInt(5)):upper()
        local result = MySQL.Sync.prepare('SELECT COUNT(*) as count FROM players WHERE citizenid = ?', { CitizenId })
        if result == 0 then
            UniqueFound = true
        end
    end
    return CitizenId
end

function CNRCore.Player.CreateFingerId()
    local UniqueFound = false
    local FingerId = nil
    while not UniqueFound do
        FingerId = tostring(CNRCore.Shared.RandomStr(2) .. CNRCore.Shared.RandomInt(3) .. CNRCore.Shared.RandomStr(1) .. CNRCore.Shared.RandomInt(2) .. CNRCore.Shared.RandomStr(3) .. CNRCore.Shared.RandomInt(4))
        local query = '%' .. FingerId .. '%'
        local result = MySQL.Sync.prepare('SELECT COUNT(*) as count FROM `players` WHERE `metadata` LIKE ?', { query })
        if result == 0 then
            UniqueFound = true
        end
    end
    return FingerId
end

function CNRCore.Player.CreateWalletId()
    local UniqueFound = false
    local WalletId = nil
    while not UniqueFound do
        WalletId = 'cnr-' .. math.random(11111111, 99999999)
        local query = '%' .. WalletId .. '%'
        local result = MySQL.Sync.prepare('SELECT COUNT(*) as count FROM players WHERE metadata LIKE ?', { query })
        if result == 0 then
            UniqueFound = true
        end
    end
    return WalletId
end

function CNRCore.Player.CreateSerialNumber()
    local UniqueFound = false
    local SerialNumber = nil
    while not UniqueFound do
        SerialNumber = math.random(11111111, 99999999)
        local query = '%' .. SerialNumber .. '%'
        local result = MySQL.Sync.prepare('SELECT COUNT(*) as count FROM players WHERE metadata LIKE ?', { query })
        if result == 0 then
            UniqueFound = true
        end
    end
    return SerialNumber
end

PaycheckLoop() -- This just starts the paycheck system
