-- Player load and unload handling
-- New method for checking if logged in across all scripts (optional)
-- if LocalPlayer.state['isLoggedIn'] then
RegisterNetEvent('CNRCore:Client:OnPlayerLoaded', function()
    ShutdownLoadingScreenNui()
    LocalPlayer.state:set('isLoggedIn', true, false)
    if CNRConfig.Server.pvp then
        SetCanAttackFriendly(PlayerPedId(), true, false)
        NetworkSetFriendlyFireOption(true)
    end
end)

RegisterNetEvent('CNRCore:Client:OnPlayerUnload', function()
    LocalPlayer.state:set('isLoggedIn', false, false)
end)

RegisterNetEvent('CNRCore:Client:PvpHasToggled', function(pvp_state)
    SetCanAttackFriendly(PlayerPedId(), pvp_state, false)
    NetworkSetFriendlyFireOption(pvp_state)
end)
-- Teleport Commands

RegisterNetEvent('CNRCore:Command:TeleportToPlayer', function(coords)
    local ped = PlayerPedId()
    SetPedCoordsKeepVehicle(ped, coords.x, coords.y, coords.z)
end)

RegisterNetEvent('CNRCore:Command:TeleportToCoords', function(x, y, z)
    local ped = PlayerPedId()
    SetPedCoordsKeepVehicle(ped, x, y, z)
end)

RegisterNetEvent('CNRCore:Command:GoToMarker', function()
    local ped = PlayerPedId()
    local blip = GetFirstBlipInfoId(8)
    if DoesBlipExist(blip) then
        local blipCoords = GetBlipCoords(blip)
        for height = 1, 1000 do
            SetPedCoordsKeepVehicle(ped, blipCoords.x, blipCoords.y, height + 0.0)
            local foundGround, zPos = GetGroundZFor_3dCoord(blipCoords.x, blipCoords.y, height + 0.0)
            if foundGround then
                SetPedCoordsKeepVehicle(ped, blipCoords.x, blipCoords.y, height + 0.0)
                break
            end
            Wait(0)
        end
    end
end)

-- Vehicle Commands

RegisterNetEvent('CNRCore:Command:SpawnVehicle', function(vehName)
    local ped = PlayerPedId()
    local hash = GetHashKey(vehName)
    if not IsModelInCdimage(hash) then
        return
    end
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Wait(10)
    end
    local vehicle = CreateVehicle(hash, GetEntityCoords(ped), GetEntityHeading(ped), true, false)
    TaskWarpPedIntoVehicle(ped, vehicle, -1)
    SetModelAsNoLongerNeeded(vehicle)
    TriggerEvent("vehiclekeys:client:SetOwner", CNRCore.Functions.GetPlate(vehicle))
end)

RegisterNetEvent('CNRCore:Command:DeleteVehicle', function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsUsing(ped)
    if veh ~= 0 then
        SetEntityAsMissionEntity(veh, true, true)
        DeleteVehicle(veh)
    else
        local pcoords = GetEntityCoords(ped)
        local vehicles = GetGamePool('CVehicle')
        for k, v in pairs(vehicles) do
            if #(pcoords - GetEntityCoords(v)) <= 5.0 then
                SetEntityAsMissionEntity(v, true, true)
                DeleteVehicle(v)
            end
        end
    end
end)

-- Other stuff

RegisterNetEvent('CNRCore:Player:SetPlayerData', function(val)
    CNRCore.PlayerData = val
end)

RegisterNetEvent('CNRCore:Player:UpdatePlayerData', function()
    TriggerServerEvent('CNRCore:UpdatePlayer')
end)

RegisterNetEvent('CNRCore:Notify', function(text, type, length)
    CNRCore.Functions.Notify(text, type, length)
end)

RegisterNetEvent('CNRCore:Client:TriggerCallback', function(name, ...)
    if CNRCore.ServerCallbacks[name] then
        CNRCore.ServerCallbacks[name](...)
        CNRCore.ServerCallbacks[name] = nil
    end
end)

RegisterNetEvent('CNRCore:Client:UseItem', function(item)
    TriggerServerEvent('CNRCore:Server:UseItem', item)
end)

-- Me command

local function Draw3DText(coords, str)
    local onScreen, worldX, worldY = World3dToScreen2d(coords.x, coords.y, coords.z)
	local camCoords = GetGameplayCamCoord()
	local scale = 200 / (GetGameplayCamFov() * #(camCoords - coords))
    if onScreen then
        SetTextScale(1.0, 0.5 * scale)
        SetTextFont(4)
        SetTextColour(255, 255, 255, 255)
        SetTextEdge(2, 0, 0, 0, 150)
		SetTextProportional(1)
		SetTextOutline()
		SetTextCentre(1)
        SetTextEntry("STRING")
        AddTextComponentString(str)
        DrawText(worldX, worldY)
    end
end

RegisterNetEvent('CNRCore:Command:ShowMe3D', function(senderId, msg)
    local sender = GetPlayerFromServerId(senderId)
    CreateThread(function()
        local displayTime = 5000 + GetGameTimer()
        while displayTime > GetGameTimer() do
            local targetPed = GetPlayerPed(sender)
            local tCoords = GetEntityCoords(targetPed)
            Draw3DText(tCoords, msg)
            Wait(0)
        end
    end)
end)
