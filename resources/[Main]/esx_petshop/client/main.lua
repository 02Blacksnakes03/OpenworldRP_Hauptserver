ESX = nil
local PlayerData = {}

-- [+] Variables
local Key = { ["E"] = 38, ["Y"] = 246, ["ALT"] = 19 }

local Ped, Model = nil, {}
local Pid = nil
local ball, getball, isInAnimation = false, false, false
local isHere = false
local nShow = false
local eName, eHandler, eAge, eHunger = nil, nil, nil, nil
local conDog, conHunter = nil, nil
-- [-] Variables

-- [+] Start
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	while ESX.GetPlayerData() == nil do
		Citizen.Wait(10)
  end

  PlayerData = ESX.GetPlayerData()

  ESX.TriggerServerCallback("mdr_petshop:getPetName", function(name) eName = name end)
  ESX.TriggerServerCallback("mdr_petshop:getPetHandler", function(handler) eHandler = handler end)
  ESX.TriggerServerCallback("mdr_petshop:getPetAge", function(age) eAge = age end)
  ESX.TriggerServerCallback("mdr_petshop:getPetHunger", function(hunger) eHunger = hunger end)

  Citizen.Wait(5000)

	DoRequestModel(-1788665315) DoRequestModel(1462895032) DoRequestModel(1682622302) DoRequestModel(-541762431) DoRequestModel(1318032802) DoRequestModel(-1323586730) DoRequestModel(1125994524) DoRequestModel(1832265812) DoRequestModel(882848737) DoRequestModel(1126154828) DoRequestModel(-1384627013) DoRequestModel(351016938)

	cConPed(-1788665315, 565.40, 2743.80, 41.88, 93.74, "dog")
	cConPed(1318032802, 565.33, 2745.7, 41.88, 93.74, "husky")
	cConPed(1126154828, 565.28, 2748.17, 41.88, 93.74, "alastin")
	cConPed(1832265812, 563.82, 2750.95, 41.88, 189.19, "pug")
	cConPed(882848737, 561.79, 2751.1, 41.88, 189.19, "retriever")
	cConPed(-1384627013, 559.38, 2752.65, 41.88, 189.19, "westie")
	cConPed(1125994524, 559.8, 2749.86, 41.88, 271.55, "poodle")
	cConPed(1462895032, 560.49, 2747.45, 42.87, 271.55, "cat")
	cConPed(-541762431, 560.62, 2745.08, 42.87, 271.55, "bunny")
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)
-- [-] Start

-- [+] Functions
function cConPed(pide, pos1, pos2, pos3, head, type)
	if type == "dog" then conDog = CreatePed(28, tonumber(pide), pos1, pos2, pos3, head, 1) TaskSetBlockingOfNonTemporaryEvents(conDog, true) FreezeEntityPosition(conDog, true) ClearPedTasks(tonumber(conDog)) end
	if type == "husky" then conHus = CreatePed(28, tonumber(pide), pos1, pos2, pos3, head, 1) TaskSetBlockingOfNonTemporaryEvents(conHus, true) FreezeEntityPosition(conHus, true) ClearPedTasks(tonumber(conHus)) end
	if type == "alastin" then conAla = CreatePed(28, tonumber(pide), pos1, pos2, pos3, head, 1) TaskSetBlockingOfNonTemporaryEvents(conAla, true) FreezeEntityPosition(conAla, true) ClearPedTasks(tonumber(conAla)) end
	if type == "pug" then conPug = CreatePed(28, tonumber(pide), pos1, pos2, pos3, head, 1) TaskSetBlockingOfNonTemporaryEvents(conPug, true) FreezeEntityPosition(conPug, true) ClearPedTasks(tonumber(conPug)) end
	if type == "retriever" then conRet = CreatePed(28, tonumber(pide), pos1, pos2, pos3, head, 1) TaskSetBlockingOfNonTemporaryEvents(conRet, true) FreezeEntityPosition(conRet, true) ClearPedTasks(tonumber(conRet)) end
	if type == "westie" then conWes = CreatePed(28, tonumber(pide), pos1, pos2, pos3, head, 1) TaskSetBlockingOfNonTemporaryEvents(conWes, true) FreezeEntityPosition(conWes, true) ClearPedTasks(tonumber(conWes)) end
	if type == "poodle" then conPoo = CreatePed(28, tonumber(pide), pos1, pos2, pos3, head, 1) TaskSetBlockingOfNonTemporaryEvents(conPoo, true) FreezeEntityPosition(conPoo, true) ClearPedTasks(tonumber(conPoo)) end
	if type == "cat" then conCat = CreatePed(28, tonumber(pide), pos1, pos2, pos3, head, 1) TaskSetBlockingOfNonTemporaryEvents(conCat, true) FreezeEntityPosition(conCat, true) ClearPedTasks(tonumber(conCat)) end
	if type == "bunny" then conBun = CreatePed(28, tonumber(pide), pos1, pos2, pos3, head, 1) TaskSetBlockingOfNonTemporaryEvents(conBun, true) FreezeEntityPosition(conBun, true) ClearPedTasks(tonumber(conBun)) end
end

function DrawText3d(x,y,z, size, font, text, r, g, b, outline)
	local onScreen,_x,_y = World3dToScreen2d(x,y,z)
    local px,py,pz = table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

    local scale = (1 / dist)*2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
	
	if onScreen then
		SetTextScale(size*scale, size*scale)
		SetTextFont(font)
		SetTextProportional(1)
		SetTextColour(r, g, b, 255)
		if not outline then
			SetTextDropshadow(0, 0, 0, 0, 55)
			SetTextEdge(2, 0, 0, 0, 150)
			SetTextDropShadow()
			SetTextOutline()
		end
		SetTextEntry("STRING")
		SetTextCentre(1)
		AddTextComponentString(text)
		SetDrawOrigin(x,y,z, 0)
		DrawText(0.0, 0.0)
		ClearDrawOrigin()
	end
end

function playerIsInside(playerCoords, coords, distance) 	
	local vecDiffrence = GetDistanceBetweenCoords(playerCoords, coords.x, coords.y, coords.z, false)
	return vecDiffrence < distance		
end

function cMarker(type, position, scale, color, facecamera, rotate)
    if facecamera == nil then facecamera = false end
    if rotate == nil then rotate = false end
    local coord = vector3(position.x, position.y, position.z)
    DrawMarker(type, coord, 0.0, 0.0, 0.0, 0.0,  0.0, 0.0, scale.a, scale.b, scale.c, color.r, color.g, color.b, 150, false, facecamera, 2, rotate)
end

function callPet(model)
	local LastPosition = GetEntityCoords(PlayerPedId())
	local GroupHandle = GetPlayerGroup(PlayerId())

	DoRequestAnimSet('rcmnigel1c')
	TaskPlayAnim(PlayerPedId(), 'rcmnigel1c', 'hailing_whistle_waive_a' ,8.0, -8, -1, 120, 0, false, false, false)

		Ped = CreatePed(28, tonumber(model), LastPosition.x -20, LastPosition.y -20, LastPosition.z -1, 1, 1)

		ESX.ShowHelpNotification('Your pet lost you Press ~INPUT_MP_TEXT_CHAT_TEAM~', true)

		isHere = true
		SetEntityInvincible(Ped, true)

		TaskSetBlockingOfNonTemporaryEvents(Ped, true)
		SetPedCanBeTargetted(Ped, false)
		SetEntityAsMissionEntity(Ped, true,true)

		local E_Blip = AddBlipForEntity(Ped)
		SetBlipAsFriendly(E_Blip, true)
		SetBlipSprite(E_Blip, 273)
		BeginTextCommandSetBlipName("STRING");
		AddTextComponentString("Your Pet")
		EndTextCommandSetBlipName(E_Blip)

		NetworkRegisterEntityAsNetworked(Ped)
		while not NetworkGetEntityIsNetworked(Ped) do
			NetworkRegisterEntityAsNetworked(Ped)
			Citizen.Wait(1)
		end
end

function spawnPet(model)
	local GroupHandle = GetPlayerGroup(PlayerId())

		Ped = CreatePed(28, tonumber(model), 559.41, 2740.35, 42.2, 1, 1)

		SetEntityInvincible(Ped, true)
		isHere = true

		ESX.TriggerServerCallback('mdr_petshop:setPetHandler', function(ws) end, tostring(model))

		TaskSetBlockingOfNonTemporaryEvents(Ped, true)
		SetPedCanBeTargetted(Ped, false)
		SetEntityAsMissionEntity(Ped, true,true)

		local E_Blip = AddBlipForEntity(Ped)
		SetBlipAsFriendly(E_Blip, true)
		SetBlipSprite(E_Blip, 273)
		BeginTextCommandSetBlipName("STRING");
		AddTextComponentString("Your Pet")
		EndTextCommandSetBlipName(E_Blip)

		NetworkRegisterEntityAsNetworked(Ped)
		while not NetworkGetEntityIsNetworked(Ped) do
			NetworkRegisterEntityAsNetworked(Ped)
			Citizen.Wait(1)
		end
end

function DoRequestModel(model)
	RequestModel(model)
	while not HasModelLoaded(model) do
		Citizen.Wait(1)
	end
end
function DoRequestAnimSet(anim)
	RequestAnimDict(anim)
	while not HasAnimDictLoaded(anim) do
		Citizen.Wait(1)
	end
end
-- [-] Functions

-- [+] Citizens
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(30)

		if ball then
			local coords1, coords2 = GetEntityCoords(PlayerPedId()), GetEntityCoords(Ped)
			local distance, distance2  = GetDistanceBetweenCoords(objCoords, coords2, true), GetDistanceBetweenCoords(coords1, coords2, true)

			if distance < 0.5 then
				local boneIndex = GetPedBoneIndex(Ped, 17188)
				AttachEntityToEntity(object, Ped, boneIndex, 0.120, 0.010, 0.010, 5.0, 150.0, 0.0, true, true, false, true, 1, true)
				TaskGoToCoordAnyMeans(Ped, coords1, 5.0, 0, 0, 786603, 0xbf800000)
				ball = false
				getball = true
			end
		end

		if getball then
			local coords1, coords2 = GetEntityCoords(PlayerPedId()), GetEntityCoords(Ped)
			local distance2 = GetDistanceBetweenCoords(coords1, coords2, true)

			if distance2 < 1.5 then
				DetachEntity(object,false,false)
				Citizen.Wait(50)
				SetEntityAsMissionEntity(object)
				DeleteEntity(object)
				GiveWeaponToPed(PlayerPedId(), GetHashKey("WEAPON_BALL"), 1, false, true)
				local GroupHandle = GetPlayerGroup(PlayerId())
				getball = false
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(Config.hungerMin * 60000)
		if isHere then TriggerServerEvent("mdr_petshop:hungerSystem") end
end
end)

Citizen.CreateThread(function()
	while true do Citizen.Wait(10000)
		ESX.TriggerServerCallback("mdr_petshop:checkHunger", function(callback) 
			if callback then
				SetEntityHealth(Ped, 0)
	            ESX.ShowNotification(_U('dead_notification'), true)
	            isHere = false
			end
		end)
		ESX.TriggerServerCallback("mdr_petshop:checkAge", function(callback)
			if callback then
				SetEntityHealth(Ped, 0)
	            ESX.ShowNotification(_U('dead_notification'), true)
	            isHere = false
			end
		end)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(Config.ageMin * 60000)
		TriggerServerEvent("mdr_petshop:ageSystem")
	end
end)

Citizen.CreateThread(function()
      local blip = AddBlipForCoord(Config.Blip.pos.x, Config.Blip.pos.y, Config.Blip.pos.z)
      SetBlipSprite(blip, Config.Blip.id)
      SetBlipDisplay(blip, 4)
      SetBlipScale(blip, 1.2)
      SetBlipColour(blip, Config.Blip.colour)
      SetBlipAsShortRange(blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(Config.Blip.title)
	  EndTextCommandSetBlipName(blip)
end)

Citizen.CreateThread(function()
while true do Citizen.Wait(0)
   
    local coords = GetEntityCoords(PlayerPedId())

    if playerIsInside(coords, Config.Zones.Buy.Position, 20) then
      cMarker(Config.Zones.Buy.Type, Config.Zones.Buy.Position, Config.Zones.Buy.Size, Config.Zones.Buy.Colour, false, true)
	end
  end
end)

Citizen.CreateThread(function()
    while true do Citizen.Wait(0)
	   local coords = GetEntityCoords(PlayerPedId())
	   local dogPosition, husPosition, alaPosition, pugPosition, retPosition, wesPosition, pooPosition, catPosition, bunPosition = GetEntityCoords(tonumber(conDog)), GetEntityCoords(tonumber(conHus)), GetEntityCoords(tonumber(conAla)), GetEntityCoords(tonumber(conPug)), GetEntityCoords(tonumber(conRet)), GetEntityCoords(tonumber(conWes)), GetEntityCoords(tonumber(conPoo)), GetEntityCoords(tonumber(conCat)), GetEntityCoords(tonumber(conBun))

	   if playerIsInside(coords, Config.Zones.Buy.Position, 1.0) then ESX.ShowHelpNotification("Press ~INPUT_VEH_HORN~ to get ball", true)
		if IsControlJustPressed(1, Key['E']) then GiveWeaponToPed(PlayerPedId(), GetHashKey("WEAPON_BALL"), 1, false, true) end
	   end

    if playerIsInside(coords, dogPosition, 1.1) then if IsControlJustPressed(1, Key['E']) then
			DoScreenFadeOut(2000) Citizen.Wait(2000) DoScreenFadeIn(2000)
		--if E_Pet == '' then
			ESX.TriggerServerCallback('mdr_petshop:buyPet', function(boughtPed) if boughtPed then spawnPet(-1788665315) SetEntityCoords(PlayerPedId(), 560.34, 2738.66, 42.2) end end, "chien")
		--else --ESX.ShowNotification('~r~You can\'t get two pet', true, true) --end --end
        end
	end
	if playerIsInside(coords, husPosition, 1.1) then if IsControlJustPressed(1, Key['E']) then
		    DoScreenFadeOut(2000) Citizen.Wait(2000) DoScreenFadeIn(2000)
		--if E_Pet == '' then
		    ESX.TriggerServerCallback('mdr_petshop:buyPet', function(boughtPed) if boughtPed then spawnPet(1318032802) SetEntityCoords(PlayerPedId(), 560.34, 2738.66, 42.2) end end, "husky")
		--else --ESX.ShowNotification('~r~You can\'t get two pet', true, true) --end --end
	    end
    end
    if playerIsInside(coords, alaPosition, 1.1) then if IsControlJustPressed(1, Key['E']) then
	        DoScreenFadeOut(2000) Citizen.Wait(2000) DoScreenFadeIn(2000)
	    --if E_Pet == '' then
		    ESX.TriggerServerCallback('mdr_petshop:buyPet', function(boughtPed) if boughtPed then spawnPet(1126154828) SetEntityCoords(PlayerPedId(), 560.34, 2738.66, 42.2) end end, "berger")
	    --else --ESX.ShowNotification('~r~You can\'t get two pet', true, true) --end --end
        end
    end
    if playerIsInside(coords, pugPosition, 1.1) then if IsControlJustPressed(1, Key['E']) then
		DoScreenFadeOut(2000) Citizen.Wait(2000) DoScreenFadeIn(2000)
	    --if E_Pet == '' then
		    ESX.TriggerServerCallback('mdr_petshop:buyPet', function(boughtPed) if boughtPed then spawnPet(1832265812) SetEntityCoords(PlayerPedId(), 560.34, 2738.66, 42.2) end end, "carlin")
        --else --ESX.ShowNotification('~r~You can\'t get two pet', true, true) --end --end
	    end
	end
    if playerIsInside(coords, retPosition, 1.1) then if IsControlJustPressed(1, Key['E']) then
        DoScreenFadeOut(2000) Citizen.Wait(2000) DoScreenFadeIn(2000)
    	--if E_Pet == '' then
    	    ESX.TriggerServerCallback('mdr_petshop:buyPet', function(boughtPed) if boughtPed then spawnPet(882848737) SetEntityCoords(PlayerPedId(), 560.34, 2738.66, 42.2) end end, "retriever")
    	--else --ESX.ShowNotification('~r~You can\'t get two pet', true, true) --end --end
        end
    end
    if playerIsInside(coords, wesPosition, 1.1) then if IsControlJustPressed(1, Key['E']) then
		DoScreenFadeOut(2000) Citizen.Wait(2000) DoScreenFadeIn(2000)
        --if E_Pet == '' then
		    ESX.TriggerServerCallback('mdr_petshop:buyPet', function(boughtPed) if boughtPed then spawnPet(-1384627013) SetEntityCoords(PlayerPedId(), 560.34, 2738.66, 42.2) end end, "westie")
        --else --ESX.ShowNotification('~r~You can\'t get two pet', true, true) --end --end
        end
    end
    if playerIsInside(coords, pooPosition, 1.1) then if IsControlJustPressed(1, Key['E']) then
		DoScreenFadeOut(2000) Citizen.Wait(2000) DoScreenFadeIn(2000)
		--if E_Pet == '' then
		    ESX.TriggerServerCallback('mdr_petshop:buyPet', function(boughtPed) if boughtPed then spawnPet(1125994524) SetEntityCoords(PlayerPedId(), 560.34, 2738.66, 42.2) end end, "caniche")
		--else --ESX.ShowNotification('~r~You can\'t get two pet', true, true) --end --end
	    end
    end
	if playerIsInside(coords, catPosition, 1.1) then if IsControlJustPressed(1, Key['E']) then
		DoScreenFadeOut(2000) Citizen.Wait(2000) DoScreenFadeIn(2000)
    	--if E_Pet == '' then
		    ESX.TriggerServerCallback('mdr_petshop:buyPet', function(boughtPed) if boughtPed then spawnPet(1462895032) SetEntityCoords(PlayerPedId(), 560.34, 2738.66, 42.2) end end, "chat")
        --else --ESX.ShowNotification('~r~You can\'t get two pet', true, true) --end --end
        end
    end
    if playerIsInside(coords, bunPosition, 1.1) then if IsControlJustPressed(1, Key['E']) then
        DoScreenFadeOut(2000) Citizen.Wait(2000) DoScreenFadeIn(2000)
        --if E_Pet == '' then
            ESX.TriggerServerCallback('mdr_petshop:buyPet', function(boughtPed) if boughtPed then spawnPet(-541762431) SetEntityCoords(PlayerPedId(), 560.34, 2738.66, 42.2) end end, "lapin")
        --else --ESX.ShowNotification('~r~You can\'t get two pet', true, true) --end --end
        end
    end

	if IsPlayerFreeAiming(PlayerId()) and IsControlJustPressed(1, Key['Y']) and Ped ~= nil then TriggerEvent("mdr_petshop:huntersAttack") end
	 
	if not IsControlPressed(1, Key['ALT']) and IsControlJustPressed(1, Key['Y']) and not IsPlayerFreeAiming(PlayerId()) and Ped ~= nil then
	 if IsPedInAnyVehicle(PlayerPedId()) then TriggerEvent("mdr_petshop:Vehicle") else TriggerEvent("mdr_petshop:Follow") end end

	 if IsControlPressed(1, Key['ALT']) and IsControlJustPressed(1, Key['Y']) then openPetMenu() end end

end)

Citizen.CreateThread(function()
 while true do Citizen.Wait(100)
	if Pid ~= nil then
	   ESX.TriggerServerCallback("mdr_petshop:getPetAttacking", function(attacking)
	   if attacking == true then
		if IsPedDeadOrDying(Pid, 1) then
			ESX.ShowNotification('Killed !', true, false)
			TriggerEvent("mdr_petshop:huntersAttack")
			ESX.TriggerServerCallback('mdr_petshop:setPetAttacking', function(_isChanged) end, 'false')
		end
	end
end)
end
end
end)

Citizen.CreateThread(function()
 while true do Citizen.Wait(1)
	local petPosition = GetEntityCoords(tonumber(Ped))

	local coords = GetEntityCoords(PlayerPedId())
	local dogPosition, husPosition, alaPosition, pugPosition, retPosition, wesPosition, pooPosition, catPosition, bunPosition = GetEntityCoords(tonumber(conDog)), GetEntityCoords(tonumber(conHus)), GetEntityCoords(tonumber(conAla)), GetEntityCoords(tonumber(conPug)), GetEntityCoords(tonumber(conRet)), GetEntityCoords(tonumber(conWes)), GetEntityCoords(tonumber(conPoo)), GetEntityCoords(tonumber(conCat)), GetEntityCoords(tonumber(conBun))
    --
	DrawText3d(petPosition.x, petPosition.y, petPosition.z + 0.7, 0.5, 0, "~g~[~r~ ".. GetPlayerName(PlayerId()) .." ~g~]", 255, 255, 255, false)
	DrawText3d(564.56, 2752.29, 43.85, 0.5, 0, "~p~Purple~w~: Decoratives~n~~r~Red~w~: Hunters", 255, 255, 255, false)
	if nShow then ESX.TriggerServerCallback("mdr_petshop:getPetName", function(name) eName = name end)
	DrawText3d(petPosition.x, petPosition.y, petPosition.z + 0.6, 0.5, 0, tostring(eName), 255, 255, 255, false)
	end
    --
	local D_dist = GetDistanceBetweenCoords(coords, dogPosition, true)
	if D_dist < 1.1 then
	DrawText3d(dogPosition.x, dogPosition.y, dogPosition.z + 0.7, 0.5, 0, "~o~[~g~ Buy [e] ~o~]", 255, 255, 255, false)
	DrawText3d(dogPosition.x, dogPosition.y, dogPosition.z + 0.5, 0.3, 0, "50000 ~g~$", 255, 255, 255, false)
	elseif D_dist < 10 then
	DrawText3d(dogPosition.x, dogPosition.y, dogPosition.z + 0.7, 0.5, 0, "~o~[~r~ ".._U('dog').." ~o~]", 255, 255, 255, false)
	DrawText3d(dogPosition.x, dogPosition.y, dogPosition.z + 0.5, 0.3, 0, "50000 ~g~$", 255, 255, 255, false)
	end
	local H_dist = GetDistanceBetweenCoords(coords, husPosition, true)
	if H_dist < 1.1 then
	DrawText3d(husPosition.x, husPosition.y, husPosition.z + 0.7, 0.5, 0, "~o~[~g~ Buy [e] ~o~]", 255, 255, 255, false)
	DrawText3d(husPosition.x, husPosition.y, husPosition.z + 0.5, 0.3, 0, "35000 ~g~$", 255, 255, 255, false)
	elseif H_dist < 10 then
	DrawText3d(husPosition.x, husPosition.y, husPosition.z + 0.7, 0.5, 0, "~o~[~r~ ".._U('husky').." ~o~]", 255, 255, 255, false)
	DrawText3d(husPosition.x, husPosition.y, husPosition.z + 0.5, 0.3, 0, "35000 ~g~$", 255, 255, 255, false)
	end
	local A_dist = GetDistanceBetweenCoords(coords, alaPosition, true)
	if A_dist < 1.1 then
	DrawText3d(alaPosition.x, alaPosition.y, alaPosition.z + 0.7, 0.5, 0, "~o~[~g~ Buy [e] ~o~]", 255, 255, 255, false)
	DrawText3d(alaPosition.x, alaPosition.y, alaPosition.z + 0.5, 0.3, 0, "55000 ~g~$", 255, 255, 255, false)
	elseif A_dist < 10 then
	DrawText3d(alaPosition.x, alaPosition.y, alaPosition.z + 0.7, 0.5, 0, "~o~[~r~ ".._U('asatian').." ~o~]", 255, 255, 255, false)
	DrawText3d(alaPosition.x, alaPosition.y, alaPosition.z + 0.5, 0.3, 0, "55000 ~g~$", 255, 255, 255, false)
	end
	local P_dist = GetDistanceBetweenCoords(coords, pugPosition, true)
	if P_dist < 1.1 then
	DrawText3d(pugPosition.x, pugPosition.y, pugPosition.z + 0.7, 0.5, 0, "~o~[~g~ Buy [e] ~o~]", 255, 255, 255, false)
	DrawText3d(pugPosition.x, pugPosition.y, pugPosition.z + 0.5, 0.3, 0, "6000 ~g~$", 255, 255, 255, false)
	elseif P_dist < 10 then
	DrawText3d(pugPosition.x, pugPosition.y, pugPosition.z + 0.7, 0.5, 0, "~o~[~r~ ".._U('pug').." ~o~]", 255, 255, 255, false)
	DrawText3d(pugPosition.x, pugPosition.y, pugPosition.z + 0.5, 0.3, 0, "6000 ~g~$", 255, 255, 255, false)
	end
	local R_dist = GetDistanceBetweenCoords(coords, retPosition, true)
	if R_dist < 1.1 then
	DrawText3d(retPosition.x, retPosition.y, retPosition.z + 0.7, 0.5, 0, "~o~[~g~ Buy [e] ~o~]", 255, 255, 255, false)
	DrawText3d(retPosition.x, retPosition.y, retPosition.z + 0.5, 0.3, 0, "10000 ~g~$", 255, 255, 255, false)
	elseif R_dist < 10 then
	DrawText3d(retPosition.x, retPosition.y, retPosition.z + 0.7, 0.5, 0, "~o~[~r~ ".._U('retriever').." ~o~]", 255, 255, 255, false)
	DrawText3d(retPosition.x, retPosition.y, retPosition.z + 0.5, 0.3, 0, "10000 ~g~$", 255, 255, 255, false)
	end
	local W_dist = GetDistanceBetweenCoords(coords, wesPosition, true)
	if W_dist < 1.1 then
	DrawText3d(wesPosition.x, wesPosition.y, wesPosition.z + 0.7, 0.5, 0, "~o~[~g~ Buy [e] ~o~]", 255, 255, 255, false)
	DrawText3d(wesPosition.x, wesPosition.y, wesPosition.z + 0.5, 0.3, 0, "50000 ~g~$", 255, 255, 255, false)
	elseif W_dist < 10 then
	DrawText3d(wesPosition.x, wesPosition.y, wesPosition.z + 0.7, 0.5, 0, "~o~[~p~ ".._U('westie').." ~o~]", 255, 255, 255, false)
	DrawText3d(wesPosition.x, wesPosition.y, wesPosition.z + 0.5, 0.3, 0, "50000 ~g~$", 255, 255, 255, false)
	end
	local PD_dist = GetDistanceBetweenCoords(coords, pooPosition, true)
	if PD_dist < 1.1 then
	DrawText3d(pooPosition.x, pooPosition.y, pooPosition.z + 0.7, 0.5, 0, "~o~[~g~ Buy [e] ~o~]", 255, 255, 255, false)
	DrawText3d(pooPosition.x, pooPosition.y, pooPosition.z + 0.5, 0.3, 0, "50000 ~g~$", 255, 255, 255, false)
	elseif PD_dist < 10 then
	DrawText3d(pooPosition.x, pooPosition.y, pooPosition.z + 0.7, 0.5, 0, "~o~[~p~ ".._U('poodle').." ~o~]", 255, 255, 255, false)
	DrawText3d(pooPosition.x, pooPosition.y, pooPosition.z + 0.5, 0.3, 0, "50000 ~g~$", 255, 255, 255, false)
	end
	local C_dist = GetDistanceBetweenCoords(coords, catPosition, true)
	if C_dist < 1.1 then
	DrawText3d(catPosition.x, catPosition.y, catPosition.z + 0.7, 0.5, 0, "~o~[~g~ Buy [e] ~o~]", 255, 255, 255, false)
	DrawText3d(catPosition.x, catPosition.y, catPosition.z + 0.5, 0.3, 0, "15000 ~g~$", 255, 255, 255, false)
	elseif C_dist < 10 then
	DrawText3d(catPosition.x, catPosition.y, catPosition.z + 0.7, 0.5, 0, "~o~[~p~ ".._U('cat').." ~o~]", 255, 255, 255, false)
	DrawText3d(catPosition.x, catPosition.y, catPosition.z + 0.5, 0.3, 0, "15000 ~g~$", 255, 255, 255, false)
	end
	local B_dist = GetDistanceBetweenCoords(coords, bunPosition, true)
	if B_dist < 1.1 then
	DrawText3d(bunPosition.x, bunPosition.y, bunPosition.z + 0.7, 0.5, 0, "~o~[~g~ Buy [e] ~o~]", 255, 255, 255, false)
	DrawText3d(bunPosition.x, bunPosition.y, bunPosition.z + 0.5, 0.3, 0, "25000 ~g~$", 255, 255, 255, false)
	elseif B_dist < 10 then
	DrawText3d(bunPosition.x, bunPosition.y, bunPosition.z + 0.7, 0.5, 0, "~o~[~p~ ".._U('bunny').." ~o~]", 255, 255, 255, false)
	DrawText3d(bunPosition.x, bunPosition.y, bunPosition.z + 0.5, 0.3, 0, "25000 ~g~$", 255, 255, 255, false)
	end
end
end)
-- [-] Citizens

-- [+] Events
RegisterNetEvent("mdr_petshop:Follow")
AddEventHandler("mdr_petshop:Follow", function()
  if Ped ~= nil then
	ESX.TriggerServerCallback("mdr_petshop:getPetFollowing", function(following)
		if following == false then
		TaskFollowToOffsetOfEntity(tonumber(Ped), GetPlayerPed(PlayerId()), 0.5, 0.0, 0.0, 5.0, -1, 0.0, 1)
		ESX.TriggerServerCallback('mdr_petshop:setPetFollowing', function(_isChanged) end, 'true')
		ESX.ShowNotification('Follow Me !', true, false)
		else
		ClearPedTasks(tonumber(Ped))
		ESX.TriggerServerCallback('mdr_petshop:setPetFollowing', function(_isChanged) end, 'false')
		ESX.ShowNotification('Stop !', true, false)
		end
	end)
end
end)

RegisterNetEvent("mdr_petshop:huntersAttack")
AddEventHandler("mdr_petshop:huntersAttack", function()
 local bool, Pid = GetEntityPlayerIsFreeAimingAt(PlayerId())
	ESX.TriggerServerCallback("mdr_petshop:getPetAttacking", function(attacking)
	if attacking == false then
		if IsEntityAPed(Pid) then
			if not IsEntityDead(Pid) then
				SetEntityInvincible(Ped, false)
				SetCanAttackFriendly(Ped, true, true)
				TaskSetBlockingOfNonTemporaryEvents(Ped, false)
				TaskPutPedDirectlyIntoMelee(Ped, Pid, 0.0, -1.0, 0.0, 0)
				ESX.TriggerServerCallback('mdr_petshop:setPetAttacking', function(_isChanged) end, 'true')
				ESX.TriggerServerCallback('mdr_petshop:setPetFollowing', function(_isChanged) end, 'false')
				ESX.ShowNotification("Kill him !", true)
			end
		end
	elseif attacking == true then
		ESX.TriggerServerCallback('mdr_petshop:setPetAttacking', function(_isChanged) end, 'false')
		Pid = nil
		ClearPedTasks(Ped)
		SetEntityInvincible(Ped, true)
		SetCanAttackFriendly(Ped, false, true)
		TaskSetBlockingOfNonTemporaryEvents(Ped, true)
		ESX.ShowNotification("Let him go", true)
	end
end)
end)

RegisterNetEvent("mdr_petshop:Vehicle")
AddEventHandler("mdr_petshop:Vehicle", function()
	if Ped ~= nil then
		if IsPedInAnyVehicle(Ped, false) then
			TaskLeaveVehicle(Ped, GetVehiclePedIsIn(Ped, false), 262144)
			SetEntityHealth(Ped, 200)
		else
		local eVehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local coords1   = GetEntityCoords(eVehicle)
		local coords2   = GetEntityCoords(tonumber(Ped))
		local distance  = GetDistanceBetweenCoords(coords1, coords2, true)
	
		if distance < 3 then
			SetPedIntoVehicle(Ped, eVehicle, 0)
			TaskEnterVehicle(Ped, eVehicle, 1, 0, 1.0, 1, 0)
		else
		ESX.ShowHelpNotification('Your pet have to be close to vehicle', true, true, 300)
		end
		end
	end
end)
-- [-] Events

-- [+] Menus
function openPetMenu()
	local options = {}

	if isHere == true then
		table.insert(options, {label = _U('age', eAge), value = nil})
		table.insert(options, {label = _U('givename'),   value = 'give_name'})
		table.insert(options, {label = _U('givefood'),   value = 'give_food'})
		table.insert(options, {label = _U('giveorders'), value = 'give_orders'})
	else
		table.insert(options, {label = _U('callpet'), value = 'call_pet'})
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'petmenu', {
        title    = _U('pet_management'),
        align    = "top-right",
        elements = options
    }, function(data, menu)

	menu.close()
	
	if data.current.value == 'call_pet' then
		if isHere == false then
			ESX.TriggerServerCallback("mdr_petshop:getPetHandler", function(EA)
				if EA ~= nil then
				callPet(EA)
				end
			end)
			menu.close()
		end
		elseif data.current.value == 'give_food' then
		local coords1   = GetEntityCoords(PlayerPedId())
		local coords2   = GetEntityCoords(tonumber(Ped))
		local distance  = GetDistanceBetweenCoords(coords1, coords2, true)
	
		if distance < 5 then
			openFeedMenu()
		else
		ESX.ShowHelpNotification('For feeding your pet. you have to be close to him', true, true, 300)
		end
		elseif data.current.value == 'give_name' then
			openNameMenu()
		elseif data.current.value == 'give_orders' then
			openGiveOMenu()
		end
		end, function(data, menu)
		menu.close()
		end)
	  end

function openGiveOMenu()
	ESX.TriggerServerCallback("mdr_petshop:getPet", function(pey)
		local options = {}

		if not isInAnimation then
			if pey ~= 'chat' then
				table.insert(options, {label = _U('ball'), value = 'ball'})
			end

			table.insert(options, {label = _U('gohouse'), value = 'returntohouse'})

			if pey == 'chien' then
				table.insert(options, {label = _U('sitdown'), value = 'chien_sitdown'})
				table.insert(options, {label = _U('getdown'), value = 'chien_getdown'})
			elseif pey == 'chat' then
				table.insert(options, {label = _U('getdown'), value = 'chat_getdown'})
			elseif pey == 'loup' then
				table.insert(options, {label = _U('getdown'), value = 'loup_getdown'})
			elseif pey == 'carlin' then
				table.insert(options, {label = _U('sitdown'), value = 'carlin_getdown'})
			elseif pey == 'retriever' then
				table.insert(options, {label = _U('sitdown'), value = 'retriever_getdown'})
			end
		else
			table.insert(options, {label = _U('getup'), value = 'getup'})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'give_orders', {
			title    = _U('pet_orders'),
			align    = 'top-right',
			elements = options
		}, function(data, menu)
			if data.current.value == 'returntohouse' then
				local coords = GetEntityCoords(PlayerPedId())

				ESX.ShowNotification(_U('house_returning'))
				TaskGoToCoordAnyMeans(Ped, coords.x + 40, coords.y, coords.z, 5.0, 0, 0, 786603, 0xbf800000)

				Citizen.Wait(5000)
				DeleteEntity(Ped)
				isHere = false

				ESX.UI.Menu.CloseAll()
			elseif data.current.value == 'ball' then
				local pedCoords = GetEntityCoords(tonumber(Ped))
				object = GetClosestObjectOfType(pedCoords, 190.0, GetHashKey('w_am_baseball'))

				if DoesEntityExist(object) then
					ball = true
					objCoords = GetEntityCoords(object)
					TaskGoToCoordAnyMeans(Ped, objCoords, 5.0, 0, 0, 786603, 0xbf800000)
					menu.close()
				else
					ESX.ShowNotification(_U('noball'))
				end
			elseif data.current.value == 'chien_sitdown' then -- [chien ]
				DoRequestAnimSet('creatures@rottweiler@amb@world_dog_sitting@base')
				TaskPlayAnim(Ped, 'creatures@rottweiler@amb@world_dog_sitting@base', 'base' ,8.0, -8, -1, 1, 0, false, false, false)
				isInAnimation = true
				menu.close()
			elseif data.current.value == 'chien_getdown' then -- [chien ]
				DoRequestAnimSet('creatures@rottweiler@amb@sleep_in_kennel@')
				TaskPlayAnim(Ped, 'creatures@rottweiler@amb@sleep_in_kennel@', 'sleep_in_kennel' ,8.0, -8, -1, 1, 0, false, false, false)
				isInAnimation = true
				menu.close()
			elseif data.current.value == 'chat_getdown' then -- [chat ]
				DoRequestAnimSet('creatures@cat@amb@world_cat_sleeping_ground@idle_a')
				TaskPlayAnim(Ped, 'creatures@cat@amb@world_cat_sleeping_ground@idle_a', 'idle_a' ,8.0, -8, -1, 1, 0, false, false, false)
				isInAnimation = true
				menu.close()
			elseif data.current.value == 'loup_getdown' then -- [loup ]
				DoRequestAnimSet('creatures@coyote@amb@world_coyote_rest@idle_a')
				TaskPlayAnim(Ped, 'creatures@coyote@amb@world_coyote_rest@idle_a', 'idle_a' ,8.0, -8, -1, 1, 0, false, false, false)
				isInAnimation = true
				menu.close()
			elseif data.current.value == 'carlin_getdown' then -- [carlin ]
				DoRequestAnimSet('creatures@carlin@amb@world_dog_sitting@idle_a')
				TaskPlayAnim(Ped, 'creatures@carlin@amb@world_dog_sitting@idle_a', 'idle_b' ,8.0, -8, -1, 1, 0, false, false, false)
				isInAnimation = true
				menu.close()
			elseif data.current.value == 'retriever_getdown' then -- [retriever ]
				DoRequestAnimSet('creatures@retriever@amb@world_dog_sitting@idle_a')
				TaskPlayAnim(Ped, 'creatures@retriever@amb@world_dog_sitting@idle_a', 'idle_c' ,8.0, -8, -1, 1, 0, false, false, false)
				isInAnimation = true
				menu.close()
			elseif data.current.value == 'getup' then
				ClearPedTasks(Ped)
				isInAnimation = false
				menu.close()
			end
	end, function(data, menu)
		menu.close()
	end)


	end)
end

function openNameMenu()
	local options = {
		{label = _U('name', tostring(eName)), value = nil},
		{label = 'Change', value = 'change_name'},
		{label = 'Show/Unshow', value = 'show_unshow'},
	}
	
		ESX.UI.Menu.CloseAll()
	
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'namemenu', {
			title    = _U('pet_cname'),
			align    = 'top-right',
			elements = options
	  }, function(data, menu)
		if data.current.value == 'change_name' then
			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'change_dialog', {
				title = _U('pet_nc')
			}, function(data2, menu2)
				local _name = tostring(data2.value)
		
				if _name == nil then
					ESX.ShowNotification('~r~Name is wrong !')
				else
					menu2.close()
					menu.close()
					ESX.TriggerServerCallback('mdr_petshop:setPetName', function(_isChanged) end, _name)
					isChanged = true
				end
			end, function(data2, menu2)
				menu2.close()
			end)
			elseif data.current.value == 'show_unshow' then
				if nShow then
				   nShow = false
				   menu.close()
				else
				   nShow = true
				   menu.close()
				end
				menu.close()
			end
		end, function(data, menu)
			menu.close()
		end)
	end

function openFeedMenu()

	local options = {
		{label = _U('hunger', eHunger), value = nil},
		{label = 'Sausage', value = 'sausage'},
		{label = 'Croquettes', value = 'croquettes'},
	}
	
		ESX.UI.Menu.CloseAll()
	
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'feedmenu', {
			title    = _U('pet_feed'),
			align    = 'center',
			elements = options
	  }, function(data, menu)
		if data.current.value == 'sausage' then
			TriggerServerEvent('mdr_petshop:feedPet', 'sausage')
			ESX.ShowNotification('You feeded your pet', true)
			elseif data.current.value == 'croquettes' then
			TriggerServerEvent('mdr_petshop:feedPet', 'croquettes')
			ESX.ShowNotification('You feeded your pet', true)
			end
		end, function(data, menu)
			menu.close()
		end)
	end

-- [-] Menus