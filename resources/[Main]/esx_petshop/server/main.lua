ESX = nil
local license  = false

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

-- [+] Get License
RegisterNetEvent('esx:onPlayerJoined')
AddEventHandler('esx:onPlayerJoined', function()
	if not ESX.Players[source] then
		onPlayerJoined(source)
	end
end)

function onPlayerJoined(playerId)
	local identifier

	for k,v in ipairs(GetPlayerIdentifiers(playerId)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			break
		end
	end

	if identifier then

		if ESX.GetPlayerFromIdentifier(identifier) then
			DropPlayer(playerId, ('there was an error loading your character!\nError code: identifier-active-ingame\n\nThis error is caused by a player on this server who has the same identifier as you have. Make sure you are not playing on the same Rockstar account.\n\nYour Rockstar identifier: %s'):format(identifier))
		else
			MySQL.Async.fetchScalar('SELECT 1 FROM pets WHERE identifier = @identifier', {
				['@identifier'] = identifier
			}, function(result)
				if result then
				else
					MySQL.Async.execute('INSERT INTO pets (`pet_handler`, `identifier`, `pet`) VALUES (@pet_handler, @identifier, @pet)', {
						['@pet_handler'] = 0,
						['@identifier'] = identifier,
						['@pet'] = nil
					}, function(rowsChanged) end)
				end
			end)
		end
	else
		DropPlayer(playerId, 'there was an error loading your character!\nError code: identifier-missing-ingame\n\nThe cause of this error is not known, your identifier could not be found. Please come back later or report this problem to the server administration team.')
	end
end

AddEventHandler('playerConnecting', function(name, setCallback, deferrals)
	deferrals.defer()
	local playerId, identifier = source
	Citizen.Wait(100)

	for k,v in ipairs(GetPlayerIdentifiers(playerId)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			break
		end
	end

	if identifier then
		if ESX.GetPlayerFromIdentifier(identifier) then
			deferrals.done(('There was an error loading your character!\nError code: identifier-active\n\nThis error is caused by a player on this server who has the same identifier as you have. Make sure you are not playing on the same Rockstar account.\n\nYour Rockstar identifier: %s'):format(identifier))
		else
			deferrals.done()
		end
	else
		deferrals.done('There was an error loading your character!\nError code: identifier-missing\n\nThe cause of this error is not known, your identifier could not be found. Please come back later or report this problem to the server administration team.')
	end
end)
-- [-] Get License

-- [+] Functions

function getPetPrice(pet)
	for i=1, #Config.PetShop, 1 do
		if Config.PetShop[i].pet == pet then
			return Config.PetShop[i].price
		end
	end

	return 0
end
-- [-] Functions

ESX.RegisterUsableItem('sausage',    function() end)
ESX.RegisterUsableItem('croquettes', function() end)

-- [+] Events
RegisterServerEvent('mdr_petshop:feedPet')
AddEventHandler('mdr_petshop:feedPet', function(xType)
	local identifier = source
	for k,v in ipairs(GetPlayerIdentifiers(source)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			break
		end
	end
	local xPlayer = ESX.GetPlayerFromId(source)
	local result = MySQL.Sync.fetchScalar("SELECT pet_hunger FROM pets WHERE identifier = @identifier", { ['@identifier'] = identifier })
	local xItem, xItem2 = xPlayer.getInventoryItem('sausage'), xPlayer.getInventoryItem('croquettes')
    
	if xType == 'sausage' then
	if xItem.count > 0 then

			local cHung = result + 20
			if result ~= nil then
				if cHung >= 100 then
					xPlayer.showNotification('FULL !', true)
					MySQL.Async.execute('UPDATE pets SET pet_hunger = @pet_hunger WHERE identifier = @identifier', {
						['@identifier'] = identifier,
						['@pet_hunger'] = 100
					}, function(rowsChanged) end)
			else
				MySQL.Async.execute('UPDATE pets SET pet_hunger = @hunger WHERE identifier = @identifier', {
					['@identifier'] = identifier,
					['@hunger'] = cHung
				}, function(rowsChanged) end)
				end
			end
	
	else
    xPlayer.showNotification('You have no food for your pet', true, false)
	end
    elseif xType == 'croquettes' then
		if xItem2.count > 0 then
	
				local cHung = result + 50
				if result ~= nil then
					if cHung >= 100 then
						xPlayer.showNotification('FULL !', true)
						MySQL.Async.execute('UPDATE pets SET pet_hunger = @pet_hunger WHERE identifier = @identifier', {
							['@identifier'] = identifier,
							['@pet_hunger'] = 100
						}, function(rowsChanged) end)
				else
					MySQL.Async.execute('UPDATE pets SET pet_hunger = @hunger WHERE identifier = @identifier', {
						['@identifier'] = identifier,
						['@hunger'] = cHung
					}, function(rowsChanged) end)
					end
				end
		
		else
		xPlayer.showNotification('You have no food for your pet', true, false)
		end
	end
end)

RegisterServerEvent("mdr_petshop:hungerSystem")
AddEventHandler("mdr_petshop:hungerSystem", function()
	local identifier = source
	for k,v in ipairs(GetPlayerIdentifiers(source)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			break
		end
	end

	local checkArePetHere = MySQL.Sync.fetchScalar("SELECT pet_handler FROM pets WHERE identifier = @identifier", { ['@identifier'] = identifier })

	if checkArePetHere ~= nil then

	local result = MySQL.Sync.fetchScalar("SELECT pet_hunger FROM pets WHERE identifier = @identifier", { ['@identifier'] = identifier })
	local FoH = result - 1
	MySQL.Async.execute('UPDATE pets SET pet_hunger = @pet_hunger WHERE identifier = @identifier', {
		['@identifier'] = identifier,
		['@pet_hunger'] = FoH
	}, function(rowsChanged) end)

  end
end)

RegisterServerEvent("mdr_petshop:ageSystem")
AddEventHandler("mdr_petshop:ageSystem", function()
	local identifier = source
	for k,v in ipairs(GetPlayerIdentifiers(source)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			break
		end
	end

	local checkDoHavePet = MySQL.Sync.fetchScalar("SELECT pet_handler FROM pets WHERE identifier = @identifier", { ['@identifier'] = identifier })

	if checkDoHavePet ~= nil then

	local result = MySQL.Sync.fetchScalar("SELECT pet_age FROM pets WHERE identifier = @identifier", { ['@identifier'] = identifier })
	local FoJ = result + 1
	MySQL.Async.execute('UPDATE pets SET pet_age = @pet_age WHERE identifier = @identifier', {
		['@identifier'] = identifier,
		['@pet_age'] = FoJ
	}, function(rowsChanged) end)

	if result == 20 then
		TriggerClientEvent("mdr_petshop:deathOfPet")
		
		MySQL.Async.execute('UPDATE pets SET pet_handler = @handler, pet = @pet, pet_name = @name, pet_age = @age, pet_hunger = @hunger, in_vehicle = @in_vehicle, following = @following, attacking = @attacking, ped_attacked = @attacked WHERE identifier = @identifier', {
			['@identifier'] = identifier,
			['@handler'] = nil,
			['@pet'] = nil,
			['@name'] = nil,
			['@age'] = 0,
			['@hunger'] = 0,
			['@in_vehicle'] = nil,
			['@following'] = nil,
			['@attacking'] = nil,
			['@attacked'] = nil
		}, function(rowsChanged) end)
	end
  end
end)
-- [-] Events

-- [+] Callbacks
ESX.RegisterServerCallback('mdr_petshop:getPetHandler', function(src, cb)
	local identifier = src
	for k,v in ipairs(GetPlayerIdentifiers(src)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			break
		end
	end
	local result = MySQL.Sync.fetchScalar("SELECT pet_handler FROM pets WHERE identifier = @identifier", { ['@identifier'] = identifier })

		if result ~= nil then
			cb(result)
		else
			cb("")
		end
end)

ESX.RegisterServerCallback('mdr_petshop:getPet', function(src, cb)
	local identifier = src
	for k,v in ipairs(GetPlayerIdentifiers(src)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			break
		end
	end
	local result = MySQL.Sync.fetchScalar("SELECT pet FROM pets WHERE identifier = @identifier", { ['@identifier'] = identifier })

		if result ~= nil then
			cb(result)
		else
			cb('')
		end
end)

ESX.RegisterServerCallback('mdr_petshop:getPetName', function(src, cb)
	local identifier = src
	for k,v in ipairs(GetPlayerIdentifiers(src)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			break
		end
	end
	local result = MySQL.Sync.fetchScalar("SELECT pet_name FROM pets WHERE identifier = @identifier", { ['@identifier'] = identifier })

		if result ~= nil then
			cb(result)
		else
			cb('')
		end
end)

ESX.RegisterServerCallback('mdr_petshop:getPetAge', function(src, cb)
	local identifier = src
	for k,v in ipairs(GetPlayerIdentifiers(src)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			break
		end
	end
	local result = MySQL.Sync.fetchScalar("SELECT pet_age FROM pets WHERE identifier = @identifier", { ['@identifier'] = identifier })

		if result ~= nil then
			cb(result)
		else
			cb('')
		end
end)

ESX.RegisterServerCallback('mdr_petshop:getPetHunger', function(src, cb)
	local identifier = src
	for k,v in ipairs(GetPlayerIdentifiers(src)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			break
		end
	end
	local result = MySQL.Sync.fetchScalar("SELECT pet_hunger FROM pets WHERE identifier = @identifier", { ['@identifier'] = identifier })

		if result ~= nil then
			cb(result)
		else
			cb('')
		end
end)

ESX.RegisterServerCallback('mdr_petshop:getPetVehicleS', function(src, cb)
	local identifier = src
	for k,v in ipairs(GetPlayerIdentifiers(src)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			break
		end
	end
	local result = MySQL.Sync.fetchScalar("SELECT in_vehicle FROM pets WHERE identifier = @identifier", { ['@identifier'] = identifier })

		if result ~= nil then
			cb(true)
		else
			cb(false)
		end
end)

ESX.RegisterServerCallback('mdr_petshop:getPetFollowing', function(src, cb)
	local identifier = src
	for k,v in ipairs(GetPlayerIdentifiers(src)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			break
		end
	end
	local result = MySQL.Sync.fetchScalar("SELECT following FROM pets WHERE identifier = @identifier", { ['@identifier'] = identifier })

		if result == "true" then
			cb(true)
		elseif result == "false" then
			cb(false)
		end
end)

ESX.RegisterServerCallback('mdr_petshop:getPetAttacking', function(src, cb)
	local identifier = src
	for k,v in ipairs(GetPlayerIdentifiers(src)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			break
		end
	end
	local result = MySQL.Sync.fetchScalar("SELECT attacking FROM pets WHERE identifier = @identifier", { ['@identifier'] = identifier })

		if result == "true" then
			cb(true)
		elseif result == "false" then
			cb(false)
		end
end)

ESX.RegisterServerCallback('mdr_petshop:getPetWhoAttacked', function(src, cb)
	local identifier = src
	for k,v in ipairs(GetPlayerIdentifiers(src)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			break
		end
	end
	local result = MySQL.Sync.fetchScalar("SELECT ped_attacked FROM pets WHERE identifier = @identifier", { ['@identifier'] = identifier })

		if result ~= nil then
			cb(result)
		else
			cb('')
		end
end)

ESX.RegisterServerCallback("mdr_petshop:setPetHandler" , function(src, cb, handle)
	local identifier = src
	for k,v in ipairs(GetPlayerIdentifiers(src)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			break
		end
	end
	MySQL.Async.execute('UPDATE pets SET pet_handler = @pet_handler WHERE identifier = @identifier', {
		['@identifier'] = identifier,
		['@pet_handler'] = handle
	}, function(rowsChanged) end)
	cb(true)
end)

ESX.RegisterServerCallback("mdr_petshop:setPetHunger" , function(src, cb, hunger)
	local identifier = src
	for k,v in ipairs(GetPlayerIdentifiers(src)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			break
		end
	end
	MySQL.Async.execute('UPDATE pets SET pet_hunger = @pet_hunger WHERE identifier = @identifier', {
		['@identifier'] = identifier,
		['@pet_hunger'] = hunger
	}, function(rowsChanged) end)
	cb(true)
end)

ESX.RegisterServerCallback("mdr_petshop:setPetAge" , function(src, cb, age)
	local identifier = src
	for k,v in ipairs(GetPlayerIdentifiers(src)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			break
		end
	end
	MySQL.Async.execute('UPDATE pets SET pet_age = @pet_age WHERE identifier = @identifier', {
		['@identifier'] = identifier,
		['@pet_age'] = age
	}, function(rowsChanged) end)
	cb(true)
end)

ESX.RegisterServerCallback("mdr_petshop:setPetName" , function(src, cb, name)
	local identifier = src
	for k,v in ipairs(GetPlayerIdentifiers(src)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			break
		end
	end
	MySQL.Async.execute('UPDATE pets SET pet_name = @name WHERE identifier = @identifier', {
		['@identifier'] = identifier,
		['@name'] = name
	}, function(rowsChanged) end)
	cb(true)
end)

ESX.RegisterServerCallback("mdr_petshop:setPetFollowing" , function(src, cb, following)
	local identifier = src
	for k,v in ipairs(GetPlayerIdentifiers(src)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			break
		end
	end
	MySQL.Async.execute('UPDATE pets SET following = @following WHERE identifier = @identifier', {
		['@identifier'] = identifier,
		['@following'] = following
	}, function(rowsChanged) end)
	cb(true)
end)

ESX.RegisterServerCallback("mdr_petshop:setPetAttacking" , function(src, cb, attacking)
	local identifier = src
	for k,v in ipairs(GetPlayerIdentifiers(src)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			break
		end
	end
	MySQL.Async.execute('UPDATE pets SET attacking = @attacking WHERE identifier = @identifier', {
		['@identifier'] = identifier,
		['@attacking'] = attacking
	}, function(rowsChanged) end)
	cb(true)
end)

ESX.RegisterServerCallback("mdr_petshop:checkHunger", function(src, cb)
	local identifier = src
	for k,v in ipairs(GetPlayerIdentifiers(src)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			break
		end
	end

	local checkArePetHere = MySQL.Sync.fetchScalar("SELECT pet_handler FROM pets WHERE identifier = @identifier", { ['@identifier'] = identifier })

	if checkArePetHere ~= nil then

	local result = MySQL.Sync.fetchScalar("SELECT pet_hunger FROM pets WHERE identifier = @identifier", { ['@identifier'] = identifier })
	if result == 0 then
		cb(true)

		MySQL.Async.execute('UPDATE pets SET pet_handler = @handler, pet = @pet, pet_name = @name, pet_age = @age, pet_hunger = @hunger, in_vehicle = @in_vehicle, following = @following, attacking = @attacking, ped_attacked = @attacked WHERE identifier = @identifier', {
			['@identifier'] = identifier,
			['@handler'] = nil,
			['@pet'] = nil,
			['@name'] = nil,
			['@age'] = 0,
			['@hunger'] = 0,
			['@in_vehicle'] = nil,
			['@following'] = nil,
			['@attacking'] = nil,
			['@attacked'] = nil
		}, function(rowsChanged) end)
	end
end
end)

ESX.RegisterServerCallback("mdr_petshop:checkAge", function(src, cb)
	local identifier = src
	for k,v in ipairs(GetPlayerIdentifiers(src)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			break
		end
	end

	local checkArePetHere = MySQL.Sync.fetchScalar("SELECT pet_handler FROM pets WHERE identifier = @identifier", { ['@identifier'] = identifier })

	if checkArePetHere ~= nil then

	local result = MySQL.Sync.fetchScalar("SELECT pet_age FROM pets WHERE identifier = @identifier", { ['@identifier'] = identifier })
	if result == 20 then
		cb(true)

		MySQL.Async.execute('UPDATE pets SET pet_handler = @handler, pet = @pet, pet_name = @name, pet_age = @age, pet_hunger = @hunger, in_vehicle = @in_vehicle, following = @following, attacking = @attacking, ped_attacked = @attacked WHERE identifier = @identifier', {
			['@identifier'] = identifier,
			['@handler'] = nil,
			['@pet'] = nil,
			['@name'] = nil,
			['@age'] = 0,
			['@hunger'] = 0,
			['@in_vehicle'] = nil,
			['@following'] = nil,
			['@attacking'] = nil,
			['@attacked'] = nil
		}, function(rowsChanged) end)
	end
end
end)

ESX.RegisterServerCallback('mdr_petshop:buyPet', function(src, cb, pet)
	local xPlayer = ESX.GetPlayerFromId(src)
	local xIdentifier = src
	for k,v in ipairs(GetPlayerIdentifiers(src)) do
		if string.match(v, 'license:') then
			xIdentifier = string.sub(v, 9)
			break
		end
	end
	local xMoney  = xPlayer.getMoney()
	local price   = getPetPrice(pet)

	if price == 0 then
		print(('mdr_petshop: %s attempt to buy an invalid pet !'):format(xIdentifier))
		cb(false)
	end

	if xMoney >= price then
		xPlayer.removeMoney(price)

		MySQL.Async.execute('UPDATE pets SET pet = @pet, pet_name = @name, pet_age = @age, pet_hunger = @hunger, in_vehicle = @in_vehicle, following = @following, attacking = @attacking, ped_attacked = @attacked WHERE identifier = @identifier', {
			['@identifier'] = xIdentifier,
			['@pet'] = pet,
			['@name'] = "Bobby",
			['@age'] = 1,
			['@hunger'] = math.random(40, 90),
			['@in_vehicle'] = 'false',
			['@following'] = 'false',
			['@attacking'] = 'false',
			['@attacked'] = ''
		}, function(rowsChanged)
			xPlayer.showNotification(_U('you_bought', pet, ESX.Math.GroupDigits(price)), true)
			cb(true)
		end)
	else
		xPlayer.showNotification(_U('no_money'), true)
		cb(false)
	end
end)
-- [-] Callbacks
