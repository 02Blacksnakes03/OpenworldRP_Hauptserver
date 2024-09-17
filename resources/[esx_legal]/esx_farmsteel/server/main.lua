ESX 						   = nil
local CopsConnected       	   = 0
local PlayersHarvestingKoda    = {}
local PlayersTransformingKoda  = {}
local PlayersSellingKoda       = {}
local boostTime = 1
local timesBonusActive = 0

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterUsableItem('spitzhacke', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('spitzhacke', 1)
	timesBonusActive = timesBonusActive + 100
	boostTime = 0.5
	TriggerClientEvent('notifications', xPlayer.source, "#1af5c4", "PhoenixV Farmsystem", "Du hast einen Bonus aktiviert. Du farmst für die nächsten "..timesBonusActive.." Eisenerz um 50% schneller.")
end)


function CountCops()
	local xPlayers = ESX.GetPlayers()

	CopsConnected = 0

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			CopsConnected = CopsConnected + 1
		end
	end

	SetTimeout(120 * 1000, CountCops)
end

CountCops()

--kodeina
local function HarvestKoda(source)

	SetTimeout((Config.TimeToFarm * boostTime), function()
		if PlayersHarvestingKoda[source] then
			local xPlayer = ESX.GetPlayerFromId(source)
			local koda = xPlayer.getInventoryItem('ore')
			
			if xPlayer.canCarryItem('ore', 1) then
				if timesBonusActive >= 0 then
					boostTime = 0.5
					timesBonusActive = timesBonusActive - 1
					if timesBonusActive % 25 == 0 and timesBonusActive ~= 0 then
						TriggerClientEvent('notifications', xPlayer.source, "#1af5c4", "PhoenixV Farmsystem", "Dein Bonus aufs Eisenerz abbauen hält noch "..timesBonusActive.." mal.")
					elseif timesBonusActive == 0 then
						TriggerClientEvent('notifications', xPlayer.source, "#BB0000", "PhoenixV Farmsystem", "Dein Bonus aufs Eisenerz abbauen ist abgelaufen.")
					end
				else
					boostTime = 1
				end
				
				xPlayer.addInventoryItem('ore', 1)
				HarvestKoda(source)
			else
				TriggerClientEvent('esx:showNotification', source, _U('bag_full'))
			end
		end
	end)
end

RegisterServerEvent('esx_farmsteel:startHarvestKoda')
AddEventHandler('esx_farmsteel:startHarvestKoda', function()
	local _source = source

	if not PlayersHarvestingKoda[_source] then
		PlayersHarvestingKoda[_source] = true

		TriggerClientEvent('esx:showNotification', _source, _U('take_ore'))
		HarvestKoda(_source)
	else
		print(('esx_farmsteel: %s attempted to exploit the marker!'):format(GetPlayerIdentifiers(_source)[1]))
	end
end)

RegisterServerEvent('esx_farmsteel:stopHarvestKoda')
AddEventHandler('esx_farmsteel:stopHarvestKoda', function()
	local _source = source

	PlayersHarvestingKoda[_source] = false
end)

local function TransformKoda(source)

	SetTimeout(Config.TimeToProcess, function()
		if PlayersTransformingKoda[source] then
			local xPlayer = ESX.GetPlayerFromId(source)
			local kodaQuantity = xPlayer.getInventoryItem('ore').count
			local pooch = xPlayer.getInventoryItem('steel')

			if xPlayer.canSwapItem('ore', 20, 'steel', 1) then
				if kodaQuantity >=20 then
					xPlayer.removeInventoryItem('ore', 20)
					xPlayer.addInventoryItem('steel', 1)

					TransformKoda(source)
				else
					TriggerClientEvent('esx:showNotification', source, _U('you_do_not_have_any_more_oranges'))
				end
			else
				TriggerClientEvent('esx:showNotification', source, _U('you_do_not_have_enough_oranges'))
			end
		end
	end)
end

RegisterServerEvent('esx_farmsteel:startTransformKoda')
AddEventHandler('esx_farmsteel:startTransformKoda', function()
	local _source = source

	if not PlayersTransformingKoda[_source] then
		PlayersTransformingKoda[_source] = true

		TriggerClientEvent('esx:showNotification', _source, _U('transform_steel'))
		TransformKoda(_source)
	else
		print(('esx_farmsteel: %s attempted to exploit the marker!'):format(GetPlayerIdentifiers(_source)[1]))
	end
end)

RegisterServerEvent('esx_farmsteel:stopTransformKoda')
AddEventHandler('esx_farmsteel:stopTransformKoda', function()
	local _source = source

	PlayersTransformingKoda[_source] = false
end)

local function SellKoda(source)

	SetTimeout(Config.TimeToSell, function()
		if PlayersSellingKoda[source] then
			local xPlayer = ESX.GetPlayerFromId(source)
			local poochQuantity = xPlayer.getInventoryItem('steel').count

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('you_do_not_have_juice_orage'))
			else
				xPlayer.removeInventoryItem('steel', 1)
				if CopsConnected == 0 then
					xPlayer.addAccountMoney('bank', 50)
					TriggerClientEvent('esx:showNotification', source, _U('sell_juice'))
				elseif CopsConnected == 1 then
					xPlayer.addAccountMoney('bank', 50)
					TriggerClientEvent('esx:showNotification', source, _U('sell_juice'))
				elseif CopsConnected == 2 then
					xPlayer.addAccountMoney('bank', 50)
					TriggerClientEvent('esx:showNotification', source, _U('sell_juice'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('bank', 50)
					TriggerClientEvent('esx:showNotification', source, _U('sell_juice'))
				elseif CopsConnected == 4 then
					xPlayer.addAccountMoney('bank', 50)
					TriggerClientEvent('esx:showNotification', source, _U('sell_juice'))
				elseif CopsConnected >= 5 then
					xPlayer.addAccountMoney('bank', 50)
					TriggerClientEvent('esx:showNotification', source, _U('sell_juice'))
				end

				SellKoda(source)
			end
		end
	end)
end

RegisterServerEvent('esx_farmsteel:startSellKoda')
AddEventHandler('esx_farmsteel:startSellKoda', function()
	local _source = source

	if not PlayersSellingKoda[_source] then
		PlayersSellingKoda[_source] = true

		TriggerClientEvent('esx:showNotification', _source, _U('sell_steel'))
		SellKoda(_source)
	else
		print(('esx_farmsteel: %s attempted to exploit the marker!'):format(GetPlayerIdentifiers(_source)[1]))
	end
end)

RegisterServerEvent('esx_farmsteel:stopSellKoda')
AddEventHandler('esx_farmsteel:stopSellKoda', function()
	local _source = source

	PlayersSellingKoda[_source] = false
end)

RegisterServerEvent('esx_farmsteel:GetUserInventory')
AddEventHandler('esx_farmsteel:GetUserInventory', function(currentZone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerClientEvent('esx_farmsteel:ReturnInventory',
		_source,
		xPlayer.getInventoryItem('ore').count,
		xPlayer.getInventoryItem('steel').count,
		xPlayer.job.name,
		currentZone
	)
end)

ESX.RegisterUsableItem('orage', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('ore', 1)

	TriggerClientEvent('esx_farmsteel:onPot', _source)
	TriggerClientEvent('esx:showNotification', _source, _U('used_one_koda'))
end)
