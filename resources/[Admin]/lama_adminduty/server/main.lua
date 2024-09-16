local ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj  end)

ESX.RegisterServerCallback("lama_admin:getRankFromPlayer", function(source, cb)
    local player = ESX.GetPlayerFromId(source)
    if player ~= nil then
        local playerGroup = player.getGroup()

        if playerGroup ~= nil then 
            cb(playerGroup)
        else
            cb("user")
        end
    else
        cb("user")
    end
end)

function isAllowed(xPlayer)
	if xPlayer.getGroup() == "user" then
		return false
	end
	return true
end

function toAdmins(func)
    local ac = 0
    for k,v in ipairs(ESX.GetPlayers()) do
        if isAllowed(ESX.GetPlayerFromId(v)) then
            ac = ac + 1
            func(v)
        end
    end
    return ac
end

-- CLOTHES
RegisterCommand(Config.DutyCommand, function(source, args)
	TriggerClientEvent("lama_toggleDuty", source)
end, false) 

-- CALL ADMIN
RegisterCommand(Config.CallAdminCommand, function(source, args, rawCommand)  
    local reason = string.gsub(rawCommand, "calladmin ", "")
    local name = GetPlayerName(source)
    local xPlayer  = ESX.GetPlayerFromId(source)
    local playerPed = GetPlayerPed(source)
    local playerCoords = GetEntityCoords(playerPed)
    
    if Config.ChatSystem == 'okokChatV2' then
		TriggerEvent('okokChat:ServerMessage', 'linear-gradient(90deg, rgb(0 32 51) 0%, rgb(0 132 210 / 90%) 100%)', '#00d0ff', 'fas fa-bell', '', _U('okokCallAdminTitle'), _U('okokCallAdminMessage'), source)
		if reason == "calladmin" then
            toAdmins(function(admin) TriggerEvent('okokChat:ServerMessage', 'linear-gradient(90deg, rgb(0 32 51) 0%, rgb(0 132 210 / 90%) 100%)', '#00d0ff', 'fas fa-bell', '', _U('okokCallAdminTitle')..' '..'['..name..' - '..source..']', _U('noMessage'), source) end)
        else
            toAdmins(function(admin) TriggerEvent('okokChat:ServerMessage', 'linear-gradient(90deg, rgb(0 32 51) 0%, rgb(0 132 210 / 90%) 100%)', '#00d0ff', 'fas fa-bell', '', _U('okokCallAdminTitle')..' '..'['..name..' - '..source..']', reason, source) end)
        end  
	else
		TriggerClientEvent('chat:addMessage', source, {args = {_U('callAdminTitle'), _U('callAdminMessage')}, color = 255,255,255})
		if reason == "calladmin" then
            toAdmins(function(admin) TriggerClientEvent('chat:addMessage', source, {args = {_U('callAdminTitle')..' '..'['..name..' - '..source..']', _U('noMessage')}, color = 255,255,255 }) end)
        else
            toAdmins(function(admin) TriggerClientEvent('chat:addMessage', source, {args = {_U('callAdminTitle')..' '..'['..name..' - '..source..']', reason }, color = 255,255,255 }) end)
        end  
	end
    
end, false)

