# Toggle ragdoll with a chat command and custom keybinding ability

> This is a toggle ragdoll script that allows for both a chat command and a player-set keybind to turn on and off a ragdoll animation.

This script makes use of the **RegisterKeyMapping** native which creates a new keymap that the player can set any key to of their liking. Because there is a mix between people liking keybinds and chat commands, I figured why not add both!

You won’t need to worry about changing the keybind as that’s set by the player, but if you’d like to change the chat command then just replace **rdoll** in: **RegisterCommand** and **chat:addSuggestion** to whatever you want. It would be preferred, if you change them, to both have the same command otherwise the chat suggestion would be useless :slightly_frowning_face:

_Hope you enjoy!_
