local RSGCore = exports['rsg-core']:GetCoreObject()
local ped = PlayerPedId()
local Ragdollactive = false
---------------------------------------------------------------------------------


Citizen.CreateThread(function()
    while true do
        Wait(0)
        if IsControlJustPressed(0, RSGCore.Shared.Keybinds[Config.RagdollKey]) then -- Ragdoll Key
            if Ragdollactive == false then
                Ragdollactive = true
                SetPedToRagdoll(ped,Config.RagdollTime,Config.RagdollTime,3)
                SetPedRagdollForceFall(ped)
            elseif Ragdollactive == true then
                ResetPedRagdollTimer(ped)
                Citizen.InvokeNative(0x221F4D9912B7FE86, ped,true)
                Ragdollactive = false
            end
        end
    end
end)
