local duty = false
ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

function cleanPlayer(playerPed)
    SetPedArmour(playerPed, 0)
    ClearPedBloodDamage(playerPed)
    ResetPedVisibleDamage(playerPed)
    ClearPedLastWeaponDamage(playerPed)
    ResetPedMovementClipset(playerPed, 0)
end

function setUniform(playerPed)
    local playerPed = PlayerPedId()
    
    TriggerEvent('skinchanger:getSkin', function(skin)
    ESX.TriggerServerCallback("Admin:getRankFromPlayer", function(group)
        if skin.sex == 0 then
            if group == "superadmin" then
                    TriggerEvent("skinchanger:loadClothes", skin, Config.Admin.superadmin.male)
                elseif group == "admin" then
                    TriggerEvent("skinchanger:loadClothes", skin, Config.Admin.admin.male)
                elseif group == "mod" then
                    TriggerEvent("skinchanger:loadClothes", skin, Config.Admin.mod.male)
                elseif group == "support" then
                    TriggerEvent("skinchanger:loadClothes", skin, Config.Admin.support.male)					
                end
            else
                if group == "superadmin" then
                    TriggerEvent("skinchanger:loadClothes", skin, Config.Admin.superadmin.female)
                elseif group == "admin" then
                    TriggerEvent("skinchanger:loadClothes", skin, Config.Admin.admin.female)
                elseif group == "mod" then
                    TriggerEvent("skinchanger:loadClothes", skin, Config.Admin.mod.female)
                elseif group == "support" then
                    TriggerEvent("skinchanger:loadClothes", skin, Config.Admin.support.female)					
                end
            end
        end)
    end)
end

RegisterNetEvent("toggleDuty")
AddEventHandler("toggleDuty", function()
    local playerPed = PlayerPedId()
    ESX.TriggerServerCallback("Admin:getRankFromPlayer", function(group)
        if group ~= "user" then
            if duty then
                duty = false
                TriggerEvent("chatMessage", "🤖^7» ^8AdminDuty ^7| Du bist nichtmehr im Admindienst, benutze ^8 /aduty ^7 um deinen Admindienst zu starten!")
                ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                    TriggerEvent('skinchanger:loadSkin', skin)
                end)
            else
                duty = true
                TriggerEvent("chatMessage", "🤖^7» ^8AdminDuty ^7| Du hast den Admindienst gestartet. Benutze ^8 /aduty ^7 um deinen Admindienst zu beenden!")
                setUniform()
            end 
        else
            TriggerEvent("chatMessage", "🤖^7» ^8AdminDuty ^7| Du hast keine Berechtigung für diesen Befehl!")
        end
    end)
end)