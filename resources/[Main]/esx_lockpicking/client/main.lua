--
--	#     #
--	##    #  ######  #    #  ######   ####   #    #   ####
--	# #   #  #       ##  ##  #       #       #    #  #
--	#  #  #  #####   # ## #  #####    ####   #    #   ####
--	#   # #  #       #    #  #            #  #    #       #
--	#    ##  #       #    #  #       #    #  #    #  #    #
--	#     #  ######  #    #  ######   ####    ####    ####
--
-- Created by Nemesus for ESX Framework
-- Website: https://nemesus.de
-- Youtube: https://youtube.nemesus.de

-- Console / Delete if you want

print("^0======================================================================^7")
print("^0ESX_LOCKPICKING loaded:")
print("^0[^4Author^0] ^7:^0 ^0Nemesus | Version 1.0^7")
print("^0[^2Website^0] ^7:^0 ^5https://nemesus.de^7")
print("^0[^2Youtube^0] ^7:^0 ^5https://youtube.nemesus.de^7")
print("^0======================================================================^7")

-- ONLY EDIT IF YOU KNOW WHAT YOU ARE DOING!

-- Locales
ESX = nil
local PlayerData = {}
local showUI = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(1)
	end
end)

--Register Net Events
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

-- Commands
Citizen.CreateThread(function()
	Citizen.Wait(3)
	RegisterCommand("lockpicking", function() 
		local ped = GetPlayerPed(-1)
		local veh = getNearestVeh()
		local doorlock = GetVehicleDoorLockStatus(veh);
		if showUI == true then
			return
		end
		if GetVehiclePedIsIn(ped, false) > 0 then
			return
		end
		if veh ~= nil then
			if doorlock ~= 1 then
				local distance = GetDistanceBetweenCoords(GetEntityCoords(ped), GetEntityCoords(veh), 1)
				print(distance)
				if distance < 2.0 then
					TriggerServerEvent("esx_lockpicking:handler")
				else
					ESX.ShowNotification(_U('no_door'));
				end
			else
				ESX.ShowNotification(_U('door_open'));
			end
		else
			ESX.ShowNotification(_U('no_vehicle'));
		end
	end)
end)

-- start vehicle cracking
RegisterNetEvent("esx_lockpicking:startcracking")
AddEventHandler("esx_lockpicking:startcracking", function()
	showUI = true
	FreezeEntityPosition(GetPlayerPed(-1), true)
	startAnim("anim@amb@clubhouse@tutorial@bkr_tut_ig3@","machinic_loop_mechandplayer")
	SendNUIMessage({type = "enableui"})
	SetNuiFocus(true, true)
	SetNuiFocusKeepInput(true)
end)

-- nui callbacks
RegisterNUICallback('lockpickingStatus', function(data, cb)
	SendNUIMessage({type = "disableui"})
	SetNuiFocus(false, false)
	SetNuiFocusKeepInput(false)
	showUI = false
	FreezeEntityPosition(GetPlayerPed(-1), false)
	StopAnimTask(PlayerPedId(), 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 'machinic_loop_mechandplayer', 1.0)
	local itemId = data.itemId;
	if itemId == true then
		SetVehicleDoorsLocked(getNearestVeh(), 1);
		ESX.ShowNotification(_U('crack_success'));
	else
		ESX.ShowNotification(_U('crack_failed'));
	end
end)

-- startAnim
function startAnim(lib, anim)
	ESX.Streaming.RequestAnimDict(lib, function()
		TaskPlayAnim(GetPlayerPed(-1), lib, anim, -1, -1, -1, 49, 0, false, false, false)
		RemoveAnimDict(lib)
	end)
end

-- getNearestVeh
function getNearestVeh()
	local pos = GetEntityCoords(GetPlayerPed(-1))
	return GetClosestVehicle(pos.x, pos.y, pos.z, 3.0, 0, 70)
end

-- loop
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if showUI then
			DisableControlAction(0, 1, true) -- Disable pan
			DisableControlAction(0, 2, true) -- Disable tilt
			DisableControlAction(0, 24, true) -- Attack
			DisableControlAction(0, 257, true) -- Attack 2
			DisableControlAction(0, 25, true) -- Aim
			DisableControlAction(0, 263, true) -- Melee Attack 1
			DisableControlAction(0, 32, true) -- W
			DisableControlAction(0, 34, true) -- A
			DisableControlAction(0, 31, true) -- S
			DisableControlAction(0, 30, true) -- D
        end
    end
end)