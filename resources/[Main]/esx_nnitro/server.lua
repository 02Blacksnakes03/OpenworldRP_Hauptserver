RegisterServerEvent("server_set_flames")
AddEventHandler("server_set_flames", function(entity)
	TriggerClientEvent("client_set_flames", -1, entity)
end)