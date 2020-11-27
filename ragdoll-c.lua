--------------------------------------
-- Toogle Ragdoll, Made by callmejaf--
---------- ReConfigured by -----------
----- FSSynthetic & Campinchris ------
--------------------------------------

---------------------------------------------------
--Local Variables
---------------------------------------------------
local ragdoll = false
ragdol = true

---------------------------------------------------
--KeyMapping Register
---------------------------------------------------
RegisterCommand('rdoll', function()
    TriggerEvent("Ragdoll", source)
end, false)
TriggerEvent( "chat:addSuggestion", "/rdoll", "Puts you in ragdoll until you click a key of your choice to set as the permanent ragdoll key. (Can be changed later in Setting/Key Bindings/FiveM)" )

RegisterKeyMapping('rdoll', 'Toggle Ragdoll', 'keyboard', 'x') -- ('(Chat Command)', '(Keybind Menu Description)', '(Input Device)', '(Default Keymap)')

---------------------------------------------------
--Client Script
---------------------------------------------------
Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if ragdoll then
          SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
        end
    end
end)
    
RegisterNetEvent("Ragdoll")
AddEventHandler("Ragdoll", function()
    if (ragdol) then
        setRagdoll(true)
        ragdol = false
    else
        setRagdoll(false)
        ragdol = true
    end
end)

---------------------------------------------------
--Functions
---------------------------------------------------
function setRagdoll(rag)
    ragdoll = rag
end