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

-- ONLY EDIT IF YOU KNOW WHAT YOU ARE DOING!

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent("esx_lockpicking:handler")
AddEventHandler("esx_lockpicking:handler", function()
    local _source       = source
    local xPlayer       = ESX.GetPlayerFromId(_source)
    local count         = xPlayer.getInventoryItem('Lockpick').count

    if count >= 1 then
        xPlayer.removeInventoryItem('Lockpick', 1)
        xPlayer.showNotification(_U('vehicle_crack'))
        -- start cracking
        TriggerClientEvent("esx_lockpicking:startcracking", _source)
    else
        xPlayer.showNotification(_U('no_lockpicks'))
        return
    end
end)