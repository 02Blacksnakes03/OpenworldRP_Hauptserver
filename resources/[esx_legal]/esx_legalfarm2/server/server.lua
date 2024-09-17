ESX								= nil
local CopsConnected				= 0
local PlayersHarvesting			= {}
local PlayersTransforming		= {}
local PlayersSelling			= {}
local Drug						= {}

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

local function Harvest(source, drug)
	local v = Config.Drugs[""..drug ..""]
	if CopsConnected < v.RequiredCops then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, v.RequiredCops))
		return
	end
	SetTimeout(v.TimeToFarm * 250, function(xPlayer, item)
		if PlayersHarvesting[source] == true and Drug[source] == drug then
			local xPlayer  = ESX.GetPlayerFromId(source)
			local item = xPlayer.getInventoryItem(v.Item)
			--[[
			if item.weight ~= -1 and not xPlayer.canCarryItem(v.item, 1) then
				TriggerClientEvent('esx_legalfarm2:hasExitedMarker', source)
				TriggerClientEvent('esx:showNotification', source, "Dein Inventar ist voll!")
			else
				xPlayer.addInventoryItem(v.Item, 1)
				Harvest(source, drug)
			end
]]--

			local qtd = math.random(1, 4)
			if xPlayer.canCarryItem(v.Item, 1) then
				xPlayer.addInventoryItem(v.Item, 1)
				Harvest(source, drug)
			else
				TriggerClientEvent('esx_legalfarm2:hasExitedMarker', source)
				TriggerClientEvent('esx:showNotification', source, "Dein Inventar ist voll!")
			end
		end
	end)
end

RegisterServerEvent('esx_legalfarm2:startHarvest')
AddEventHandler('esx_legalfarm2:startHarvest', function(drug)
	local _source = source
	PlayersHarvesting[_source] = true
	Drug[source] = drug
	TriggerClientEvent('esx:showNotification', _source, "Du sammelst..")
	Harvest(_source, drug)
end)

RegisterServerEvent('esx_legalfarm2:stopHarvest')
AddEventHandler('esx_legalfarm2:stopHarvest', function()
	local _source = source
	PlayersHarvesting[_source] = false
	Drug[source] = false
end)

local function Transform(source, drug)
	local v = Config.Drugs[""..drug ..""]
	if CopsConnected < v.RequiredCops then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, v.RequiredCops))
		return
	end
	SetTimeout(v.TimeToProcess * 1000, function()
		if PlayersTransforming[source] == true and Drug[source] == drug then
			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)
			local itemQuantity = xPlayer.getInventoryItem(v.Item).count
			local transformQuantity = xPlayer.getInventoryItem(v.ItemTransform).count
			if transformQuantity > 100 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			elseif itemQuantity < 6 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_prog', drug))
			else
				xPlayer.removeInventoryItem(v.Item, 6)
				xPlayer.addInventoryItem(v.ItemTransform, 1)
				Transform(source, drug)
			end

		end
	end)
end

RegisterServerEvent('esx_legalfarm2:startTransform')
AddEventHandler('esx_legalfarm2:startTransform', function(drug)
	local _source = source
	PlayersTransforming[_source] = true
	Drug[source] = drug
	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))
	Transform(_source, drug)
end)

RegisterServerEvent('esx_legalfarm2:stopTransform')
AddEventHandler('esx_legalfarm2:stopTransform', function()
	local _source = source
	PlayersTransforming[_source] = false
	Drug[source] = false
end)

local function Sell(source, drug)
	local v = Config.Drugs[""..drug ..""]
	if CopsConnected < v.RequiredCops then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, v.RequiredCops))
		return
	end
	SetTimeout(v.TimeToSell * 1000, function()
		if PlayersSelling[source] == true and Drug[source] == drug then
			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			local item = xPlayer.getInventoryItem(v.ItemTransform).count
			local item2 = xPlayer.getInventoryItem(v.ItemTransform).name
			
			

			if item == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_sell', drug))

			elseif item2 == 'erdnussbutter' then 
				xPlayer.removeInventoryItem(v.ItemTransform, 1)
				xPlayer.addMoney(17)
				TriggerClientEvent('esx:showNotification', source, _U('sold_one', drug))
				Sell(source, drug)

			elseif item2 == 'apfelsaft' then 
				xPlayer.removeInventoryItem(v.ItemTransform, 1)
				xPlayer.addMoney(21)
				TriggerClientEvent('esx:showNotification', source, _U('sold_one', drug))
				Sell(source, drug)

			elseif item2 == 'leinenstoff' then 
				xPlayer.removeInventoryItem(v.ItemTransform, 1)
				xPlayer.addMoney(13)
				TriggerClientEvent('esx:showNotification', source, _U('sold_one', drug))
				Sell(source, drug)

			elseif item2 == 'zitronenlimonade' then 
				xPlayer.removeInventoryItem(v.ItemTransform, 1)
				xPlayer.addMoney(7)
				TriggerClientEvent('esx:showNotification', source, _U('sold_one', drug))
				Sell(source, drug)
			
			elseif item2 == 'marijuana' then
				xPlayer.removeInventoryItem(v.ItemTransform, 1)
				xPlayer.addMoney(17)
				TriggerClientEvent('esx:showNotification', source, _U('sold_one', drug))
				Sell(source, drug)
			
			elseif item2 == 'coke' then
				xPlayer.removeInventoryItem(v.ItemTransform, 1)
				xPlayer.addMoney(13)
				TriggerClientEvent('esx:showNotification', source, _U('sold_one', drug))
				Sell(source, drug)

			else 
				xPlayer.removeInventoryItem(v.ItemTransform, 1)
				xPlayer.addMoney(270)
				TriggerClientEvent('esx:showNotification', source, _U('sold_one', drug))
				Sell(source, drug)	
			end

		end
	end)
end

RegisterServerEvent('esx_legalfarm2:startSell')
AddEventHandler('esx_legalfarm2:startSell', function(drug)
	local _source = source
	PlayersSelling[_source] = true
	Drug[source] = drug
	TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))
	Sell(_source, drug)
end)

RegisterServerEvent('esx_legalfarm2:stopSell')
AddEventHandler('esx_legalfarm2:stopSell', function()
	local _source = source
	PlayersSelling[_source] = false
	Drug[source] = false
end)

ESX.RegisterServerCallback('esx_legalfarm2:getInventoryItem', function(source, cb, item)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local oItem = xPlayer.getInventoryItem(item)
	cb(oItem)
end)

for k,v in pairs(Config.Drugs) do
	if v.Usable then
		ESX.RegisterUsableItem(v.Item, function(source)
			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)

			xPlayer.removeInventoryItem(v.Item, 5)
			if v.UseEffect then
				TriggerClientEvent('esx_legalfarm2:onUse', _source, v.Item)
			end
			TriggerClientEvent('esx:showNotification', _source, _U('used_one', k))
		end)
	end
end