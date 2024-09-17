ESX 						   = nil
local CopsConnected       	   = 0
local PlayersHarvestingKoda    = {}
local PlayersTransformingKoda  = {}
local PlayersSellingKoda       = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

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

	SetTimeout(Config.TimeToFarm, function()
		if PlayersHarvestingKoda[source] then
			local xPlayer = ESX.GetPlayerFromId(source)
			local koda = xPlayer.getInventoryItem('kautschuk')

			if xPlayer.canCarryItem('kautschuk', 1) then
				xPlayer.addInventoryItem('kautschuk', 1)
				HarvestKoda(source)
			else
				TriggerClientEvent('esx:showNotification', source, _U('bag_full'))
			end
		end
	end)
end

RegisterServerEvent('esx_farmRubber:startHarvestKoda')
AddEventHandler('esx_farmRubber:startHarvestKoda', function()
	local _source = source

	if not PlayersHarvestingKoda[_source] then
		PlayersHarvestingKoda[_source] = true

		TriggerClientEvent('esx:showNotification', _source, _U('take_kautschuk'))
		HarvestKoda(_source)
	else
		print(('esx_farmRubber: %s attempted to exploit the marker!'):format(GetPlayerIdentifiers(_source)[1]))
	end
end)

RegisterServerEvent('esx_farmRubber:stopHarvestKoda')
AddEventHandler('esx_farmRubber:stopHarvestKoda', function()
	local _source = source

	PlayersHarvestingKoda[_source] = false
end)

local function TransformKoda(source)

	SetTimeout(Config.TimeToProcess, function()
		if PlayersTransformingKoda[source] then
			local xPlayer = ESX.GetPlayerFromId(source)
			local kodaQuantity = xPlayer.getInventoryItem('kautschuk').count
			local pooch = xPlayer.getInventoryItem('rubber')

			if xPlayer.canSwapItem('kautschuk', 2, 'rubber', 1) then
				if kodaQuantity >= 2 then
					xPlayer.removeInventoryItem('kautschuk', 2)
					xPlayer.addInventoryItem('rubber', 1)
				else
					TriggerClientEvent('esx:showNotification', source, _U('you_do_not_have_any_more_oranges'))
				end
			else
				TriggerClientEvent('esx:showNotification', source, _U('you_do_not_have_enough_oranges'))
			end
			--[[

			if pooch.weight ~= -1 and pooch.count >= pooch.weight then
				TriggerClientEvent('esx:showNotification', source, _U('you_do_not_have_enough_oranges'))
			elseif kodaQuantity < 5 then
				TriggerClientEvent('esx:showNotification', source, _U('you_do_not_have_any_more_oranges'))
			else
				xPlayer.removeInventoryItem('kautschuk', 2)
				xPlayer.addInventoryItem('rubber', 1)

				TransformKoda(source)
			end
			]]--
		end
	end)
end

RegisterServerEvent('esx_farmRubber:startTransformKoda')
AddEventHandler('esx_farmRubber:startTransformKoda', function()
	local _source = source

	if not PlayersTransformingKoda[_source] then
		PlayersTransformingKoda[_source] = true

		TriggerClientEvent('esx:showNotification', _source, _U('transform_rubber'))
		TransformKoda(_source)
	else
		print(('esx_farmRubber: %s attempted to exploit the marker!'):format(GetPlayerIdentifiers(_source)[1]))
	end
end)

RegisterServerEvent('esx_farmRubber:stopTransformKoda')
AddEventHandler('esx_farmRubber:stopTransformKoda', function()
	local _source = source

	PlayersTransformingKoda[_source] = false
end)

local function SellKoda(source)

	SetTimeout(Config.TimeToSell, function()
		if PlayersSellingKoda[source] then
			local xPlayer = ESX.GetPlayerFromId(source)
			local poochQuantity = xPlayer.getInventoryItem('rubber').count

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('you_do_not_have_juice_orage'))
			else
				xPlayer.removeInventoryItem('rubber', 1)
				if CopsConnected == 0 then
					xPlayer.addAccountMoney('bank', 45)
					TriggerClientEvent('esx:showNotification', source, _U('sell_juice'))
				elseif CopsConnected == 1 then
					xPlayer.addAccountMoney('bank', 45)
					TriggerClientEvent('esx:showNotification', source, _U('sell_juice'))
				elseif CopsConnected == 2 then
					xPlayer.addAccountMoney('bank', 45)
					TriggerClientEvent('esx:showNotification', source, _U('sell_juice'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('bank', 45)
					TriggerClientEvent('esx:showNotification', source, _U('sell_juice'))
				elseif CopsConnected == 4 then
					xPlayer.addAccountMoney('bank', 45)
					TriggerClientEvent('esx:showNotification', source, _U('sell_juice'))
				elseif CopsConnected >= 5 then
					xPlayer.addAccountMoney('bank', 45)
					TriggerClientEvent('esx:showNotification', source, _U('sell_juice'))
				end

				SellKoda(source)
			end
		end
	end)
end

RegisterServerEvent('esx_farmRubber:startSellKoda')
AddEventHandler('esx_farmRubber:startSellKoda', function()
	local _source = source

	if not PlayersSellingKoda[_source] then
		PlayersSellingKoda[_source] = true

		TriggerClientEvent('esx:showNotification', _source, _U('sell_rubber'))
		SellKoda(_source)
	else
		print(('esx_farmoranges: %s attempted to exploit the marker!'):format(GetPlayerIdentifiers(_source)[1]))
	end
end)

RegisterServerEvent('esx_farmRubber:stopSellKoda')
AddEventHandler('esx_farmRubber:stopSellKoda', function()
	local _source = source

	PlayersSellingKoda[_source] = false
end)

RegisterServerEvent('esx_farmRubber:GetUserInventory')
AddEventHandler('esx_farmRubber:GetUserInventory', function(currentZone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerClientEvent('esx_farmRubber:ReturnInventory',
		_source,
		xPlayer.getInventoryItem('kautschuk').count,
		xPlayer.getInventoryItem('rubber').count,
		xPlayer.job.name,
		currentZone
	)
end)

ESX.RegisterUsableItem('orage', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('kautschuk', 1)

	TriggerClientEvent('esx_farmRubber:onPot', _source)
	TriggerClientEvent('esx:showNotification', _source, _U('used_one_koda'))
end)
