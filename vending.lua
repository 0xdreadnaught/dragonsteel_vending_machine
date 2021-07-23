local vend = false
local lightning = false
local fire = false
local ice = false
local chest = peripheral.wrap("bottom")

--runtime loop
while true do
   --check if button was pushed
   pushed = commands.exec("execute if block -116 69 -88 oak_button[powered=true]")

   if pushed then
      --start vending loop
      vend = true

      --check for eggs in chest
      chestcontents = chest.list()
      for a, b in pairs(chestcontents) do
         --fire eggs: red, gray, emerald, bronze
         --ice eggs: blue, sapphire, white, silver
         --lightning eggs: copper, electric blue, amethyst, black

         --check for fire eggs
         if (b.name == "iceandfire:dragonegg_red" or b.name == "iceandfire:dragonegg_gray" or b.name == "iceandfire:dragonegg_green" or b.name == "iceandfire:dragonegg_bronze") then
            fire = true
         end
         --check for ice eggs
         if (b.name == "iceandfire:dragonegg_blue" or b.name == "iceandfire:dragonegg_sapphire" or b.name == "iceandfire:dragonegg_white" or b.name == "iceandfire:dragonegg_silver") then
            ice = true
         end
         --check for lightning eggs
         if (b.name == "iceandfire:dragonegg_copper" or b.name == "iceandfire:dragonegg_electric" or b.name == "iceandfire:dragonegg_amethyst" or b.name == "iceandfire:dragonegg_black") then
            lightning = true
         end
      end

      while vend do
         --check inventory for reagents
         ironingot = commands.exec('execute if entity @p[nbt={Inventory:[{id:"minecraft:iron_ingot"}]}]')
         fireblood = commands.exec('execute if entity @p[nbt={Inventory:[{id:"iceandfire:fire_dragon_blood"}]}]')
         iceblood = commands.exec('execute if entity @p[nbt={Inventory:[{id:"iceandfire:ice_dragon_blood"}]}]')
         lightningblood = commands.exec('execute if entity @p[nbt={Inventory:[{id:"iceandfire:lightning_dragon_blood"}]}]')
         allthemodiumingot = commands.exec('execute if entity @p[nbt={Inventory:[{id:"allthemodium:allthemodium_ingot"}]}]')
         vibraniumingot = commands.exec('execute if entity @p[nbt={Inventory:[{id:"allthemodium:vibranium_ingot"}]}]')
         unobtainiumingot = commands.exec('execute if entity @p[nbt={Inventory:[{id:"allthemodium:unobtainium_ingot"}]}]')

         --if true give unobtainium/allthemodium ingot
         if (allthemodiumingot and unobtainiumingot and lightning) then
            commands.exec("clear @p allthemodium:allthemodium_ingot 1")
            commands.exec("clear @p allthemodium:unobtainium_ingot 1")
            commands.exec("give @p allthemodium:unobtainium_allthemodium_alloy_ingot 1")
         end

         --update ingots
         allthemodiumingot = commands.exec('execute if entity @p[nbt={Inventory:[{id:"allthemodium:allthemodium_ingot"}]}]')
         unobtainiumingot = commands.exec('execute if entity @p[nbt={Inventory:[{id:"allthemodium:unobtainium_ingot"}]}]')

         --if true give unobtainium/vibranium ingot
         if (unobtainiumingot and vibraniumingot and ice) then
            commands.exec("clear @p allthemodium:unobtainium_ingot 1")
            commands.exec("clear @p allthemodium:vibranium_ingot 1")
            commands.exec("give @p allthemodium:unobtainium_vibranium_alloy_ingot 1")
         end

         --update ingots
         vibraniumingot = commands.exec('execute if entity @p[nbt={Inventory:[{id:"allthemodium:vibranium_ingot"}]}]')
         unobtainiumingot = commands.exec('execute if entity @p[nbt={Inventory:[{id:"allthemodium:unobtainium_ingot"}]}]')

         --if true give vibranium/allthemodium ingot
         if (vibraniumingot and allthemodiumingot and fire) then
            commands.exec("clear @p allthemodium:vibranium_ingot 1")
            commands.exec("clear @p allthemodium:allthemodium_ingot 1")
            commands.exec("give @p allthemodium:vibranium_allthemodium_alloy_ingot 1")
         end

         --update ingots
         allthemodiumingot = commands.exec('execute if entity @p[nbt={Inventory:[{id:"allthemodium:allthemodium_ingot"}]}]')
         vibraniumingot = commands.exec('execute if entity @p[nbt={Inventory:[{id:"allthemodium:vibranium_ingot"}]}]')
         unobtainiumingot = commands.exec('execute if entity @p[nbt={Inventory:[{id:"allthemodium:unobtainium_ingot"}]}]')

         --if true give fire dragonsteel
         if (ironingot and fireblood and fire) then
            commands.exec("clear @p minecraft:iron_ingot 1")
            commands.exec("clear @p iceandfire:fire_dragon_blood 1")
            commands.exec("give @p iceandfire:dragonsteel_fire_ingot 1")
         end

         --update iron ingot count
         ironingot = commands.exec('execute if entity @p[nbt={Inventory:[{id:"minecraft:iron_ingot"}]}]')

         --if true give ice dragonsteel
         if (ironingot and iceblood and ice) then
            commands.exec("clear @p minecraft:iron_ingot 1")
            commands.exec("clear @p iceandfire:ice_dragon_blood 1")
            commands.exec("give @p iceandfire:dragonsteel_ice_ingot 1")
         end

         --update iron ingot count
         ironingot = commands.exec('execute if entity @p[nbt={Inventory:[{id:"minecraft:iron_ingot"}]}]')

         --if true give lightning dragonsteel
         if (ironingot and lightningblood and lightning) then
            commands.exec("clear @p minecraft:iron_ingot 1")
            commands.exec("clear @p iceandfire:lightning_dragon_blood 1")
            commands.exec("give @p iceandfire:dragonsteel_lightning_ingot 1")
         end

         --stop vending if no more reagent sets
         ironingot = commands.exec('execute if entity @p[nbt={Inventory:[{id:"minecraft:iron_ingot"}]}]')
         fireblood = commands.exec('execute if entity @p[nbt={Inventory:[{id:"iceandfire:fire_dragon_blood"}]}]')
         iceblood = commands.exec('execute if entity @p[nbt={Inventory:[{id:"iceandfire:ice_dragon_blood"}]}]')
         lightningblood =
         commands.exec('execute if entity @p[nbt={Inventory:[{id:"iceandfire:lightning_dragon_blood"}]}]')

         vend = false

         if (ironingot and fireblood and fire) then
            vend = true
         end
         if (ironingot and iceblood and ice) then
            vend = true
         end
         if (ironingot and lightningblood and lightning) then
            vend = true
         end
      end
   end
end
