# Dragonsteel Vending Machine
ComputerCraft vending machine for Ice and Fire

Ice and Fire currently has issues with bricking user interaction after smelting dragonsteel. This is a ComputerCraft based vending machine to bypass that process without having to completely cheat in itemes.

* Place a command computer on top of a chest, then place an oak button on the front of the computer.
* Update the XYZ coordinates of the oak button on line 10. This can be found in the "target block" field of the F3 screen.
* Place an Ice, Fire, and/or Lightning dragon egg in the chest underneath the computer. This will unlock related ingots.
* With dragon blood and iron ingots in your inventory, click the oak button.

The oak button allows non OP users to interact with the vending machine. 
If you do not wish to see the give/remove item spam in the chat log you can run `/gamerule SendCommandFeedback false`.
Not that setting feedback to false will suppress feedback from any op command.

Currently the vending machine processes one ingot at a time. This was done to be as close to smelting as possible.
The downside is that if you have a slow server, the vending process can be a little stuttery.
