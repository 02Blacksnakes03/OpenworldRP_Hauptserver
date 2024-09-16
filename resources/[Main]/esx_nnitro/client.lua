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
print("^0ESX_nNitro loaded:")
print("^0[^4Author^0] ^7:^0 ^0Nemesus | Version 1.0.0^7")
print("^0[^2Website^0] ^7:^0 ^5https://nemesus.de^7")
print("^0[^2Youtube^0] ^7:^0 ^5https://youtube.nemesus.de^7")
print("^0======================================================================^7")

-- ONLY EDIT IF YOU KNOW WHAT YOU ARE DOING!

-- Locales
ESX = nil
local PlayerData = {}
local nitroActicated = false
local nitroPower = Config.MaxNitro
local boostTimer = 0

-- Particles
n_flame_particles = {
	"exhaust",
	"exhaust_2",
} 

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

--Register Net Events
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent("client_set_flames")
AddEventHandler("client_set_flames", function(c_veh)
	for _,bones in pairs(n_flame_particles) do
		UseParticleFxAssetNextCall("core")
		createdPart = StartParticleFxLoopedOnEntityBone("veh_backfire", NetToVeh(c_veh), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, GetEntityBoneIndexByName(NetToVeh(c_veh), bones), 2.1, 0.0, 0.0, 0.0)
		StopParticleFxLooped(createdPart, 1)
	end
end)

function drawNitro(nitro)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextOutline()
    SetTextScale(0.25, 0.25)
    SetTextEntry("STRING")
	nitroPercent = 100/50*nitroPower;
    AddTextComponentString("~b~Nitro: "..nitroPercent.."%")
    DrawText(0.063, 0.981)
end

Citizen.CreateThread(function()
    while true do
		local maxSpeedSet = false;
		local maxSpeed = 0.0;
		local push = Config.SpeedBoost
		local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		if not maxSpeedSet then
			maxSpeed = GetVehicleMaxSpeed(vehicle, false)
		end
		if IsControlPressed(0, 60) then
			if IsPedInAnyVehicle(GetPlayerPed(-1), false) and not nitroActicated then
				if(nitroPower > 0) then
					speed = (GetEntitySpeed(vehicle)*3.6);
					SetVehicleMaxSpeed(vehicle, maxSpeed+Config.MaxSpeedPlus);
					if speed > Config.MinSpeedForBoost and boostTimer <= 0 and Config.SpeedBoostActivated then
						SetVehicleBoostActive(vehicle, 1, 0)
						SetVehicleForwardSpeed(vehicle, push)
						boostTimer = Config.BoostTimer
					end
					StartScreenEffect("RaceTurbo", 0, 0)
					nitroActicated = true
				end
			end
		else
			if nitroActicated then
				SetVehicleMaxSpeed(vehicle, maxSpeed);
				SetVehicleBoostActive(vehicle, 0, 0)
				StopScreenEffect("RaceTurbo")
				nitroActicated = false
			end
        end
		Citizen.Wait(1)
    end
end)

Citizen.CreateThread(function()
    while true do
		if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
			if nitroActicated then
				local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
				if nitroPower <= 0 then
					SetVehicleMaxSpeed(vehicle, maxSpeed);
					SetVehicleBoostActive(vehicle, 0, 0)
					StopScreenEffect("RaceTurbo")
					nitroActicated = false
					nitroPower = 0.0
				else
					nitroPower = nitroPower - Config.NitroLossPerSecond
				end
			end
			if boostTimer > 0 then
				boostTimer = boostTimer - 1
			end
        end
		Citizen.Wait(1002)
    end
end)

Citizen.CreateThread(function()
    while true do
		if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
			drawNitro(nitroPower)
			if nitroActicated then
				TriggerServerEvent("server_set_flames", VehToNet(GetVehiclePedIsIn(GetPlayerPed(-1), false)))
			end
        end
		Citizen.Wait(25)
    end
end)