mESX 						   = nil
local CopsConnected       	   = 0
local PlayersHarvestingKoda    = {}
local PlayersTransformingKoda  = {}
local PlayersSellingKoda       = {}
local timesBonusActive = 0
local boostTime = 1


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterUsableItem('stahlaxt', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('stahlaxt', 1)
	timesBonusActive = timesBonusActive + 100
	boostTime = 0.5
	TriggerClientEvent('notifications', xPlayer.source, "#1af5c4", "PhoenixV Farmsystem", "Du hast einen Bonus aktiviert. Du farmst für die nächsten "..timesBonusActive.." Holz um 50% schneller.")
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

	SetTimeout(Config.TimeToFarm, function()
		if PlayersHarvestingKoda[source] then
			local xPlayer = ESX.GetPlayerFromId(source)
			local koda = xPlayer.getInventoryItem('wood_log')

			if timesBonusActive >= 0 then
					boostTime = 0.5
					timesBonusActive = timesBonusActive - 1
					if timesBonusActive % 25 == 0 and timesBonusActive ~= 0 then
						TriggerClientEvent('notifications', xPlayer.source, "#1af5c4", "PhoenixV Farmsystem", "Dein Bonus aufs Holzhacken hält noch "..timesBonusActive.." mal.")
					elseif timesBonusActive == 0 then
						TriggerClientEvent('notifications', xPlayer.source, "#BB0000", "PhoenixV Farmsystem", "Dein Bonus aufs Holzhacken ist abgelaufen.")
					end
				else
					boostTime = 1
				end
			
			local qtd = math.random(1, 4)
			if xPlayer.canCarryItem('wood_log', 1) then
				xPlayer.addInventoryItem('wood_log', 1)
				HarvestKoda(source)
			else
				TriggerClientEvent('esx:showNotification', source, _U('bag_full'))
			end
		end
	end)
end

RegisterServerEvent('esx_farmwood:startHarvestKoda')
AddEventHandler('esx_farmwood:startHarvestKoda', function()
	local _source = source

	if not PlayersHarvestingKoda[_source] then
		PlayersHarvestingKoda[_source] = true

		TriggerClientEvent('esx:showNotification', _source, _U('take_ore'))
		HarvestKoda(_source)
	else
		print(('esx_farmwood: %s attempted to exploit the marker!'):format(GetPlayerIdentifiers(_source)[1]))
	end
end)

RegisterServerEvent('esx_farmwood:stopHarvestKoda')
AddEventHandler('esx_farmwood:stopHarvestKoda', function()
	local _source = source

	PlayersHarvestingKoda[_source] = false
end)

local function TransformKoda(source)

	SetTimeout(Config.TimeToProcess, function()
		if PlayersTransformingKoda[source] then
			local xPlayer = ESX.GetPlayerFromId(source)
			local kodaQuantity = xPlayer.getInventoryItem('wood_log').count
			local pooch = xPlayer.getInventoryItem('wood_planks')


			if xPlayer.canSwapItem('wood_log', 2, 'wood_planks', 5) then
				if kodaQuantity >= 5 then
					xPlayer.removeInventoryItem('wood_log', 2)
					xPlayer.addInventoryItem('wood_planks', 5)
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
				xPlayer.removeInventoryItem('wood_log', 2)
				xPlayer.addInventoryItem('wood_planks', 1)

				TransformKoda(source)
			end
			]]--
		end
	end)
end

RegisterServerEvent('esx_farmwood:startTransformKoda')
AddEventHandler('esx_farmwood:startTransformKoda', function()
	local _source = source

	if not PlayersTransformingKoda[_source] then
		PlayersTransformingKoda[_source] = true

		TriggerClientEvent('esx:showNotification', _source, _U('transform_steel'))
		TransformKoda(_source)
	else
		print(('esx_farmwood: %s attempted to exploit the marker!'):format(GetPlayerIdentifiers(_source)[1]))
	end
end)

RegisterServerEvent('esx_farmwood:stopTransformKoda')
AddEventHandler('esx_farmwood:stopTransformKoda', function()
	local _source = source

	PlayersTransformingKoda[_source] = false
end)

local function SellKoda(source)

	SetTimeout(Config.TimeToSell, function()
		if PlayersSellingKoda[source] then
			local xPlayer = ESX.GetPlayerFromId(source)
			local poochQuantity = xPlayer.getInventoryItem('wood_planks').count

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('you_do_not_have_juice_orage'))
			else
				xPlayer.removeInventoryItem('wood_planks', 1)
				if CopsConnected == 0 then
					xPlayer.addAccountMoney('bank', 40)
					TriggerClientEvent('esx:showNotification', source, _U('sell_juice'))
				elseif CopsConnected == 1 then
					xPlayer.addAccountMoney('bank', 40)
					TriggerClientEvent('esx:showNotification', source, _U('sell_juice'))
				elseif CopsConnected == 2 then
					xPlayer.addAccountMoney('bank', 40)
					TriggerClientEvent('esx:showNotification', source, _U('sell_juice'))
				elseif CopsConnected == 3 then
					xPlayer.addAccountMoney('bank', 40)
					TriggerClientEvent('esx:showNotification', source, _U('sell_juice'))
				elseif CopsConnected == 4 then
					xPlayer.addAccountMoney('bank', 40)
					TriggerClientEvent('esx:showNotification', source, _U('sell_juice'))
				elseif CopsConnected >= 5 then
					xPlayer.addAccountMoney('bank', 40)
					TriggerClientEvent('esx:showNotification', source, _U('sell_juice'))
				end

				SellKoda(source)
			end
		end
	end)
end

RegisterServerEvent('esx_farmwood:startSellKoda')
AddEventHandler('esx_farmwood:startSellKoda', function()
	local _source = source

	if not PlayersSellingKoda[_source] then
		PlayersSellingKoda[_source] = true

		TriggerClientEvent('esx:showNotification', _source, _U('sell_wood_planks'))
		SellKoda(_source)
	else
		print(('esx_farmwood: %s attempted to exploit the marker!'):format(GetPlayerIdentifiers(_source)[1]))
	end
end)

RegisterServerEvent('esx_farmwood:stopSellKoda')
AddEventHandler('esx_farmwood:stopSellKoda', function()
	local _source = source

	PlayersSellingKoda[_source] = false
end)

RegisterServerEvent('esx_farmwood:GetUserInventory')
AddEventHandler('esx_farmwood:GetUserInventory', function(currentZone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	TriggerClientEvent('esx_farmwood:ReturnInventory',
		_source,
		xPlayer.getInventoryItem('wood_log').count,
		xPlayer.getInventoryItem('wood_planks').count,
		xPlayer.job.name,
		currentZone
	)
end)
