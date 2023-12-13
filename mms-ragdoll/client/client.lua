local RSGCore = exports['rsg-core']:GetCoreObject()

local Ragdollactive = false
---------------------------------------------------------------------------------


CreateThread(function()
    while true do
        Wait(200)
        if IsControlJustPressed(0, RSGCore.Shared.Keybinds[Config.RagdollKey]) then -- Ragdoll Key
            if not PlayerData.metadata["ishandcuffed"] and not PlayerData.metadata["isdead"] and not IsPauseMenuActive() and Ragdollactive == false then
                local ped = PlayerPedId()
                Ragdollactive = true
                SetPedToRagdoll(ped,Config.RagdollTime,Config.RagdollTime)
                Citizen.Wait(Config.RagdollTime)
                Citizen.Wait(1000)
                Ragdollactive = false
                end
            end
        end
end)