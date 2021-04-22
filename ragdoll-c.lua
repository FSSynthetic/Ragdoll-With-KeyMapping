---------------------------------
--Local and global variables
---------------------------------
local Ragdoll = false
ragdol = true

---------------------------------
--KeyMapping Register
---------------------------------
RegisterKeyMapping('rdoll', 'Toggle Ragdoll', 'keyboard', 'z') -- ('(Chat Command)', '(Keybind Menu Description)', '(Input Device)', '(Default Keymap)')
-- This essentially allows the player to set their own keybind to the ragdoll. If the player wishes to not have any keybind ragdoll, they simply select the ragdoll keybind in the keybind menu and press delete.

---------------------------------
--Ragdoll Toggle
---------------------------------

RegisterCommand('rdoll', function()
    TriggerEvent("Ragdoll", source)
end, false)
TriggerEvent( "chat:addSuggestion", "/rdoll", "Chat command for enabling and disabling ragdoll. (Can also add a keybind in Setting/Key Bindings/FiveM) Default keybind is z." )


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

---------------------------------
--Functions
---------------------------------
function setRagdoll(rag)
	Ragdoll = rag
	if Ragdoll then
		Citizen.CreateThread(function()
			while Ragdoll do 
				Citizen.Wait(0)

				vehCheck() -- Stops player from ragdolling while in any vehicle. Comment out if you'd like them to have the ability to ragdoll inside a vehicle. (Doesn't really do anything in a vehicle anyways)

				if Ragdoll then
					SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
					if ragdol then
						Ragdoll = false
					end
				end
			end
		end)
	end
end

function vehCheck()
    if Ragdoll then
        if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
            Ragdoll = false
            notify("~r~You can't ragdoll while in a vehicle!")
        end
    end
end

function notify(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(true, true)
end
