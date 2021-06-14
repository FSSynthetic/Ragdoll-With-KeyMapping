RegisterKeyMapping('rdoll', 'Toggle Ragdoll', 'keyboard', 'x');  // ('(Chat Command)', '(Keybind Menu Description)', '(Input Device)', '(Default Keymap)')
emit("chat:addSuggestion", "/rdoll", "Chat command for enabling and disabling ragdoll. (Can also add a keybind in Setting/Key Bindings/FiveM) Default keybind is x."); // text displayed  under the command

const ped = GetPlayerPed(-1); // getting the players ped index
let toggleRagdoll = false;

RegisterCommand('rdoll', () => {
    if(CanPedRagdoll(ped)) { // checking if the ped can ragdoll or not. (Stops player from ragdolling in vehicles)
        if (!toggleRagdoll) {
            toggleRagdoll = true;
            ragdoll()
        } else {
            toggleRagdoll = false;
        }
    } else {
        notify("~r~You can't ragdoll while in a vehicle!")
    }
})

function ragdoll() { // sets the ped to ragdoll while "toggleRagdoll" is true
    const tickId = setTick(() => {
        if (toggleRagdoll) {
            SetPedToRagdoll(ped, 1000, 1000, 0, 0, 0, 0)
        } else {
            clearTick(tickId)
        }
    })
}

function notify(text) { // simple notification text
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(true, true)
}