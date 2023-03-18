--Made By ForlornW46#9306
if not game:IsLoaded() then
    game.Loaded:Wait()
end

isloaded = false
while not isloaded do
    if game.Players.LocalPlayer:FindFirstChild("Rebirths") then
        isloaded = true
    end
    wait(0.1)
end



local shouldchangeconvspeed = false
local conveyormulti = 1
local autorebirth = false
local loadlayouts = false
local loadlayouts1 = false
local moneytorebirth = "no"
local after
local shouldboost = false
local shouldboostout = false
local itemtocraft = ""
local amounttocraft = 1

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Miners Haven Fucker by ForlornW46#9306", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local Tab1 = Window:MakeTab({
	Name = "Miners Haven",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Tab2 = Window:MakeTab({
	Name = "Auto crafter",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Tab3 = Window:MakeTab({
	Name = "Ore Booster",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Tab4 = Window:MakeTab({
	Name = "Shops",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Tab5 = Window:MakeTab({
	Name = "Misc",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Section1e = Tab5:AddSection({
	Name = "Misc"
})

local Section1a = Tab1:AddSection({
	Name = "Auto"
})


local Section1b = Tab2:AddSection({
	Name = "Auto Craft"
})

local Section1c = Tab3:AddSection({
	Name = "Ore Booster"
})


Section1b:AddTextbox({
	Name = "Item to craft",
	Default = "Case sensitive",
	TextDisappear = false,
	Callback = function(Value)
		itemtocraft = Value
	end
})

Section1b:AddTextbox({
	Name = "Amount to craft",
	Default = "1",
	TextDisappear = false,
	Callback = function(Value)
		amounttocraft = Value
	end
})

Section1b:AddButton({
	Name = "Check if you can craft (Will Lag)(LIKE REALLY HARD)",
	Callback = function()
        autochecker(itemtocraft,tonumber(amounttocraft))
  	end
})

Section1b:AddButton({
	Name = "Craft",
	Callback = function()
        autocrafter(itemtocraft,tonumber(amounttocraft))
  	end
})


local Section1d = Tab4:AddSection({
	Name = "GUI"
})


Section1d:AddButton({
	Name = "Show Craftsman",
	Callback = function()
        game.Players.LocalPlayer.PlayerGui.GUI.Craftsman.Visible = not game.Players.LocalPlayer.PlayerGui.GUI.Craftsman.Visible
  	end
})


Section1d:AddButton({
	Name = "Masked Man",
	Callback = function()
        game.Players.LocalPlayer.PlayerGui.GUI.TheWanderer.Visible = not game.Players.LocalPlayer.PlayerGui.GUI.TheWanderer.Visible
  	end
})

Section1d:AddButton({
	Name = "Craftsman 2",
	Callback = function()
        game.Players.LocalPlayer.PlayerGui.GUI.Craftsman2.Visible = not game.Players.LocalPlayer.PlayerGui.GUI.Craftsman2.Visible
  	end
})

Section1a:AddTextbox({
	Name = "Money to rebirth",
	Default = "onlyscientific, put the exponent",
	TextDisappear = false,
	Callback = function(Value)
		moneytorebirth = Value
        --print(moneytorebirth)
        OrionLib:MakeNotification({
            Name = "Money to Rebirth",
            Content = "Minimum money to rebirth is: ".."1e"..moneytorebirth,
            Image = "rbxassetid://4483345998",
            Time = 5
        })
	end
})

function testnumber()
    local x
    x = tonumber(moneytorebirth)/40
end

local mytycoon
for _, tycoon in ipairs(game.Workspace.Tycoons:GetChildren()) do
    if tostring(tycoon.Owner.Value) == tostring(game.Players.LocalPlayer) then
        mytycoon = tycoon
    break
    end
end

game.Players.LocalPlayer.PlayerGui.GUI.Money.Changed:Connect(function()
    if autorebirth then
        if pcall(testnumber) then
            ttd = game.Players.LocalPlayer.PlayerGui.GUI.Money.Value
            exponent,_ = ttd:match("(.+),(.+)")
            exponent = exponent:gsub("%[","")
            exponent = tonumber(exponent)
            if exponent >= tonumber(moneytorebirth) then
                game.ReplicatedStorage.Rebirth:InvokeServer()
            end
        else
            game.ReplicatedStorage.Rebirth:InvokeServer()
        end
    end
end)




Section1a:AddToggle({
	Name = "Auto Rebirth",
	Default = false,
	Callback = function(Value)
		autorebirth = Value
        if Value then
            game.ReplicatedStorage.Rebirth:InvokeServer()
        end
	end
})







Section1a:AddToggle({
	Name = "Auto Layout 1",
	Default = false,
	Callback = function(Value)
		loadlayouts = Value
        if loadlayouts then
            wait(0.75)
            game.ReplicatedStorage.Layouts:InvokeServer("Load", "Layout1")
        end
    end
})

Section1a:AddToggle({
	Name = "Auto Layout 2",
	Default = false,
	Callback = function(Value)
		loadlayouts1 = Value
        if loadlayouts1 then
            wait(0.75)
            game.ReplicatedStorage.Layouts:InvokeServer("Load", "Layout2")
        end
    end
})






local teslatable = {}

local baseteslas = {"All For One", "Voided Black Dwarf", "Black Dwarf", "Hyperspace", "Tesla Refuter", "Data Destroyer", "Tesla Resetter", "The Final Upgrader", "One For All", "Prismatic Genesis"}
-- if you're looking throuhg the code because they're more teslas, just add to this table^

function grabteslas()
    table.clear(teslatable)

    for _,v in pairs(game.Workspace.Tycoons[mytycoon.name]:GetChildren()) do
        if v.ClassName == "Model" then
            if table.find(baseteslas,v.Name) then
                table.insert(teslatable,v.Name)
            end
        end
    end
    OrionLib:MakeNotification({
        Name = "Teslas:",
        Content = table.concat(teslatable,"\n"),
        Image = "rbxassetid://4483345998",
        Time = 5
    })
    table.insert(teslatable,"go ahead do it again") -- this is required becasue after the last tesla runs it has to go through the upgraders again
    print(table.concat(teslatable,", "))
end



local furnacename
local mine
function grabminefurnace()
    for _, v in pairs(mytycoon:GetChildren()) do
        if v.ClassName == "Model" then
            if v.Model:FindFirstChild("Lava") then
                furnacename = v.Name
            elseif v.Model:FindFirstChild("DropperScript") then
                mine = v.Name
            end
        end
    end
    OrionLib:MakeNotification({
        Name = "Mine/Furnace:",
        Content = "Mine is: "..mine.."\n".."Furnace is: "..furnacename,
        Image = "rbxassetid://4483345998",
        Time = 5
    })
end





Section1c:AddParagraph("How to","Place layout and then turn on the booster, it will auto grab the teslas and should be fine. If it doesnt work turn it off and on\n\nFor those who are completely clueless, place down as many upgraders as you want then a single mine and a single furnace.")

local itemstoload = {}
Section1c:AddToggle({
	Name = "Boost to the Moon",
	Default = false,
	Callback = function(Value)
		shouldboost = Value
        if shouldboost then
            grabminefurnace()
            grabteslas()
            --print(table.concat(teslatable,", "))
            grabitems()
        end
    end
})


Section1c:AddParagraph("ONLY 1 BOOSTER CAN BE USED AT A TIME","THIS IS SHIT, If you're wondering yes this also uses your own upgraders\nWill probably get patched soon since its literally 2 lines to patch")
Section1c:AddToggle({
	Name = "Boost with Other peoples items",
	Default = false,
	Callback = function(Value)
		shouldboostout = Value
        if shouldboostout then
            grabminefurnace()
            graboutteslas()
            --print(table.concat(teslatable,", "))
            graboutitems()
        end
    end
})

function grabitems()
    table.clear(itemstoload)
    for _,v in pairs(mytycoon:GetChildren()) do
        if v.ClassName == "Model" then
            if v.Model:FindFirstChild("Upgrade") then
                if not table.find(teslatable,v.Name) then
                    table.insert(itemstoload,v.Name)
                end
            end
        end
    end
    print(table.concat(itemstoload,", "))
    OrionLib:MakeNotification({
        Name = "Items:",
        Content = table.concat(itemstoload,"\n"),
        Image = "rbxassetid://4483345998",
        Time = 5
    })
end


local teslatableout = {}
function graboutteslas()
    table.clear(teslatableout)
    for _,tycoons in pairs(game.Workspace.Tycoons:GetChildren()) do
        for _,v in pairs(game.Workspace.Tycoons[tycoons.Name]:GetChildren()) do
            if v.ClassName == "Model" then
                if table.find(baseteslas,v.Name) then
                    if not table.find(teslatableout, v.Name) then
                        table.insert(teslatableout,v.Name)
                    end
                end
            end
        end
    end
    OrionLib:MakeNotification({
        Name = "Teslas:",
        Content = table.concat(teslatableout,"\n"),
        Image = "rbxassetid://4483345998",
        Time = 5
    })
    table.insert(teslatableout,"go ahead do it again") -- this is required becasue after the last tesla runs it has to go through the upgraders again
    print(table.concat(teslatableout,", "))
end


local upgradersthatblowupores = {"Dragon Blaster", "Hydra Blaster", "Master Spark Blaster"}

local itemstoloadout = {}
function graboutitems()
    table.clear(itemstoloadout)
    for _,tycoons in pairs(game.Workspace.Tycoons:GetChildren()) do
        for _,v in pairs(game.Workspace.Tycoons[tycoons.Name]:GetChildren()) do
            if v.ClassName == "Model" then
                if v.Model:FindFirstChild("Upgrade") then
                    if not (table.find(teslatableout,v.Name) and table.find(itemstoloadout,v.Name) and table.find(upgradersthatblowupores,v.Name)) then
                        table.insert(itemstoloadout,v.Name)
                    end
                end
            end
        end
    end
    OrionLib:MakeNotification({
        Name = "Items:",
        Content = table.concat(itemstoloadout,"\n"),
        Image = "rbxassetid://4483345998",
        Time = 5
    })
    print(table.concat(itemstoloadout,", "))

end




local oredebounce = false
game.Workspace.DroppedParts[mytycoon.name].ChildAdded:Connect(function(child)
    if shouldboost then
        if not oredebounce then
            oredebounce = true
            spawn(function()
                --actually boosting :)
                child.Anchored = true
                -- for _,v in pairs(itemstoload) do
                --     mytycoon:WaitForChild(v)
                --     mytycoon[v].Model:WaitForChild("Upgrade")
                -- end
                local furnace
                for _, v in pairs(mytycoon:GetChildren()) do
                    if v.ClassName == "Model" then
                        if v.Model:FindFirstChild("Lava") then
                            furnace = v.Model.Lava
                        end
                    end
                end

                if shouldboost then
                    for _,tesla in pairs(teslatable) do
                        for _,upgrader in pairs(itemstoload) do
                                spawn(function()
                                    mytycoon:WaitForChild(upgrader)
                                    mytycoon[upgrader].Model:WaitForChild("Upgrade")
                                
                                    firetouchinterest(child,mytycoon[upgrader].Model.Upgrade,0)
                                    wait()
                                    firetouchinterest(child,mytycoon[upgrader].Model.Upgrade,1)
                                end)
                        end
                        wait(0.15)
                        if tesla ~= "go ahead do it again" then
                                mytycoon:WaitForChild(tesla)
                                firetouchinterest(child,mytycoon[tesla].Model.Upgrade,0)
                                wait()
                                firetouchinterest(child,mytycoon[tesla].Model.Upgrade,1)
                            wait(0.15)
                        end
                    end
                    firetouchinterest(child,furnace,0)
                    firetouchinterest(child,furnace,1)
                else
                    child.Anchored = false
                end
                oredebounce = false
            end)
            oredebounce = false
        end




        --this is poop and just open boxes yourself and use exotics its more than enough
    elseif shouldboostout then
        if not oredebounce then
            oredebounce = true
            spawn(function()
                child.Anchored = true
                local furnace
                for _, v in pairs(mytycoon:GetChildren()) do
                    if v.ClassName == "Model" then
                        if v.Model:FindFirstChild("Lava") then
                            furnace = v.Model.Lava
                        end
                    end
                end
                if shouldboostout then
                    for _,tesla in pairs(teslatableout) do
                        for _,upgrader in pairs(itemstoloadout) do
                            spawn(function()
                                local theupgrader
                                for _,v in pairs(game.Workspace.Tycoons:GetChildren()) do
                                    if v:FindFirstChild(upgrader) then
                                        theupgrader = v[upgrader].Model.Upgrade
                                    end
                                end
                                firetouchinterest(child,theupgrader,0)
                                wait()
                                firetouchinterest(child,theupgrader,1)
                            end)
                        end
                        wait(0.15)
                        if tesla ~= "go ahead do it again" then
                            local theupgrader
                            for _,v in pairs(game.Workspace.Tycoons:GetChildren()) do
                                if v:FindFirstChild(tesla) then
                                    theupgrader = v[tesla].Model.Upgrade
                                end
                            end
                            firetouchinterest(child,theupgrader,0)
                            wait()
                            firetouchinterest(child,theupgrader,1)
                            wait(0.15)
                        end
                    end
                    firetouchinterest(child,furnace,0)
                    firetouchinterest(child,furnace,1)
                else
                    child.Anchored = false
                end
                oredebounce = false
            end)
            oredebounce = false
        end
    end
end)



function testnumber2(x) -- because i can tbe bothered to change the otehr one
    x = 20/x
end


Section1e:AddTextbox({
	Name = "Conveyor Speed Multiplier",
	Default = 1,
	TextDisappear = false,
	Callback = function(Value)
        if pcall(testnumber2,Value) then
            shouldchangeconvspeed = true
            conveyormulti = Value
            conveyorspeedboost()
        else
            OrionLib:MakeNotification({
                Name = "Seek Help",
                Content = "A multiplier is a number",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
	end
})


function conveyorspeedboost()
    if shouldchangeconvspeed then
        for _,item in pairs(mytycoon:GetChildren()) do
            if item.ClassName == "Model" then
                if item.Model:FindFirstChild("Conv") then
                    local conveyor = item.Model.Conv
                    local conveyorspeed = tostring(item.Model.Conv.ConveyorSpeed.Value)
                    conveyor.Velocity = conveyor.CFrame.lookVector*(conveyormulti*conveyorspeed)
                end
            end
        end
    end
end



mytycoon.ChildAdded:Connect(function(item)
    if conveyormulti ~= 1 then
        wait(0.1)
        if item.ClassName == "Model" then
            if item.Model:FindFirstChild("Conv") then
                local conveyor = item.Model.Conv
                local conveyorspeed = tostring(item.Model.Conv.ConveyorSpeed.Value)
                conveyor.Velocity = conveyor.CFrame.lookVector*(conveyormulti*conveyorspeed)
            end
        end
    end
end)

pcall(function()
    game.Players.LocalPlayer.PlayerGui.GUI.Notifications.Template:Destroy()
end)

local debounce = false
game.Players.LocalPlayer.Rebirths.Changed:Connect(function()
    if not debounce then
        debounce = true
        if loadlayouts then
            local loaded = false
            while loaded ~= true do
                if #mytycoon:GetChildren() <= 4 then
                    game.ReplicatedStorage.Layouts:InvokeServer("Load", "Layout1")
                elseif #mytycoon:GetChildren() > 4 then
                    loaded = true
                end
                wait()
            end
        elseif loadlayouts1 == true then
            local loaded = false
            while loaded ~= true do
                if #mytycoon:GetChildren() <= 4 then
                    game.ReplicatedStorage.Layouts:InvokeServer("Load", "Layout2")
                elseif #mytycoon:GetChildren() > 4 then
                    loaded = true
                end
                wait()
            end
        end
        debounce = false
    end
end)


spawn(function()
    while true do 
        game.ReplicatedStorage.RemoteDrop:FireServer()
        wait(0.2)
    end
end)



local Section2e = Tab5:AddSection({
	Name = "Power Farm"
})


local powerfarmfurnace = "yes"
Section2e:AddTextbox({
	Name = "Auto Power Furnace:",
	Default = "yes",
	TextDisappear = false,
	Callback = function(Value)
		powerfarmfurnace = Value
        if game.Workspace.Tycoons[mytycoon.name]:FindFirstChild(powerfarmfurnace) then
            OrionLib:MakeNotification({
                Name = "Furnace Farm: ",
                Content = powerfarmfurnace,
                Image = "rbxassetid://4483345998",
                Time = 10
            })
        else
            OrionLib:MakeNotification({
                Name = "Aint Exist my guy",
                Content = "(real)",
                Image = "rbxassetid://4483345998",
                Time = 10
            })
        end
	end
})

local powerfurfarm = false
Section2e:AddToggle({
	Name = "Auto Farm Furnace",
	Default = false,
	Callback = function(Value)
		powerfurfarm = Value
	end
})



game.Workspace.DroppedParts[mytycoon.name].ChildAdded:Connect(function(child)
    if powerfurfarm then
        child.CFrame = game.Workspace.Tycoons[mytycoon.name][powerfarmfurnace].Model.Lava.CFrame
    end
end)












local enchantitems = {}; --Enchant
local forbiddenitems = {}; --Forbidden
local etherealitems = {}; --Ethereal
local paradoxalitems = {}; --Paradocial
local fableditems = {}; --Fabled
local evolutionitems = {}; --Evolutions
local fusionitems = {}; --Fusions
local celestialitems = {}; --Celestial
local transcendentitems = {}; --Transcendent
local rebornitems = {}; -- Reborn
local universalitems = {}; -- Universal
local omnipotentitems = {}; -- omnipotent
local intergalacticitems = {}; -- Intergalactic
local overclockitems = {}; -- overclock

local function tiergrabber() --not my code btw its from the game itself :)
    for v15, v16 in pairs(game.ReplicatedStorage.Items:GetChildren()) do
        if v16:FindFirstChild("Tier") and v16.Tier.Value == 100 then
            table.insert(enchantitems, v16.Name);
        elseif v16:FindFirstChild("Tier") and v16.Tier.Value == 101 then
            table.insert(enchantitems, v16.Name);
        elseif v16:FindFirstChild("Tier") and v16.Tier.Value == 102 then
            table.insert(enchantitems, v16.Name);
        elseif v16:FindFirstChild("Tier") and v16.Tier.Value == 103 then
            table.insert(enchantitems, v16.Name);
        elseif v16:FindFirstChild("Tier") and v16.Tier.Value == 104 then
            table.insert(enchantitems, v16.Name);
        elseif v16:FindFirstChild("Tier") and v16.Tier.Value == 105 then
            table.insert(enchantitems, v16.Name);

        elseif v16:FindFirstChild("Tier") and v16.Tier.Value == 32 then
            table.insert(evolutionitems, v16.Name);
        elseif v16:FindFirstChild("Tier") and v16.Tier.Value == 33 then
            table.insert(rebornitems, v16.Name);
        elseif v16:FindFirstChild("Tier") and v16.Tier.Value == 31 then
            table.insert(fusionitems, v16.Name);
        elseif v16:FindFirstChild("RebornChance") then
            table.insert(rebornitems, v16.Name);
        elseif v16:FindFirstChild("Tier") and v16.Tier.Value == 30 then
            table.insert(rebornitems, v16.Name);
        end;
    end;
end
tiergrabber()

local function tierfinder(yes)
    if table.find(enchantitems, yes) then
        return "Enchant"
    elseif table.find(forbiddenitems, yes) then
        return "Forbidden"
    elseif table.find(etherealitems, yes) then
        return "Ethereal"
    elseif table.find(paradoxalitems, yes) then
        return "Paradoxal"
    elseif table.find(fableditems, yes) then
        return "Fabled"
    elseif table.find(evolutionitems, yes) then
        return "Evolutions"
    elseif table.find(fusionitems, yes) then
        return "Fusions"
    elseif table.find(celestialitems, yes) then
        return "Celestial"
    elseif table.find(transcendentitems, yes) then
        return "Transcendent"
    elseif table.find(universalitems, yes) then
        return "Universal"
    elseif table.find(omnipotentitems, yes) then
        return "Omnipotent"
    elseif table.find(intergalacticitems, yes) then
        return "Intergalactic"
    elseif table.find(overclockitems, yes) then
        return "Overclock"

    elseif table.find(rebornitems, yes) then
        return "Reborn"
    else
        return "Other"
    end
end

local function itemfinder(id)
    for _,v in pairs(game.ReplicatedStorage.Items:GetChildren()) do
        if v.ItemId.Value == id then
            return v.Name
        end
    end
end

local function navtoitemtab(item)
    local tier
    for _,v in pairs(game.ReplicatedStorage.Items:GetChildren()) do
        if v.Name == item then
            tier = tierfinder(itemfinder(v.ItemId.Value))
            tier = tostring(tier)
            if tier ~= "Universal" and tier ~= "Omnipotent" and tier ~= "Intergalactic" and tier ~= "Overclock" then
                firesignal(game.Players.LocalPlayer.PlayerGui.GUI.Craftsman.Contents.Buttons[tier].MouseButton1Click)
            else
                firesignal(game.Players.LocalPlayer.PlayerGui.GUI.Craftsman2.Contents.Buttons[tier].MouseButton1Click)
            end
        end
    end
    if tier ~= "Universal" and tier ~= "Omnipotent" and tier ~= "Intergalactic" and tier ~= "Overclock" then
        firesignal(game.Players.LocalPlayer.PlayerGui.GUI.Craftsman.Contents.Items[item].MouseButton1Click)
    else
        firesignal(game.Players.LocalPlayer.PlayerGui.GUI.Craftsman2.Contents.Items[item].MouseButton1Click)
    end
end

function autocrafter(pogitem,pogyes)
    firesignal(game.Players.LocalPlayer.PlayerGui.GUI.HUDLeft.Buttons.Inventory.MouseButton1Click)
    wait()
    firesignal(game.Players.LocalPlayer.PlayerGui.GUI.Inventory.Frame.Bottom.Search.Cancel.MouseButton1Click)
    wait()
    firesignal(game.Players.LocalPlayer.PlayerGui.GUI.Inventory.Close.MouseButton1Click)
    wait()
    firesignal(game.Players.LocalPlayer.PlayerGui.GUI.HUDLeft.Buttons.Inventory.MouseButton1Click)
    wait()
    firesignal(game.Players.LocalPlayer.PlayerGui.GUI.Inventory.Close.MouseButton1Click)
    wait(0.5)
    if tierfinder(pogitem) == "Reborn" or tierfinder(pogitem) == "Other" then
        OrionLib:MakeNotification({
            Name = "WAKE UP (real)",
            Content = "my guy, did you seriously just try to craft: ".. pogitem,
            Image = "rbxassetid://4483345998",
            Time = 10
        })
        return
    end
    local function itembuyer(yesitem,yesamount)
        local aggup = {}
        local aggnum = {}
        local function yes(item, amount)
            if tierfinder(item) ~= "Reborn" and tierfinder(item) ~= "Other" then
                navtoitemtab(item)
                local upgraders = {}
                local amountinrecepie = {}
                local tier = tierfinder(item)
                for _,v in pairs(game.Players.LocalPlayer.PlayerGui.GUI.Craftsman.Contents.Crafting.Cost:GetChildren()) do
                    if v.Name == "SampleItem" then
                        v:WaitForChild("ItemId")
                        local amounttomake = v.Amount.Text
                        amounttomake = amounttomake:gsub("x","")
                        amounttomake = tonumber(amounttomake)
                        table.insert(amountinrecepie,amounttomake*amount)
                        table.insert(upgraders,itemfinder(v.ItemId.Value))
                    end
                end
                --print("---Materials: "..table.concat(upgraders, ", "))
                --print("---Amount: "..table.concat(amountinrecepie, ", "))
                for i,upgrader in pairs(upgraders) do
                    yes(upgrader,amountinrecepie[i])
                    navtoitemtab(item)
                end
                --print("Sending Server: "..item.." Amount: "..amount)
                game.ReplicatedStorage.BuyItem:InvokeServer(item,amount,amount)
            else
                if table.find(aggup, item) then
                    for i,upgrader in pairs(aggup) do
                        if upgrader == item then
                            aggnum[i] = aggnum[i]+amount
                        end
                    end
                else
                    table.insert(aggup, item)
                    table.insert(aggnum, amount)
                end
            end
        end
        yes(yesitem,yesamount)


        local finaltable = {}
        for i,v in pairs(aggup) do
            local string = v..":  "..aggnum[i]
            table.insert(finaltable,string)
        end
        OrionLib:MakeNotification({
            Name = "Auto Crafter:",
            Content = "You made :"..yesitem,
            Image = "rbxassetid://4483345998",
            Time = 5
        })
        OrionLib:MakeNotification({
            Name = "RAW Auto Crafter Materials:",
            Content = table.concat(finaltable,"\n"),
            Image = "rbxassetid://4483345998",
            Time = 5
        })
    end
    itembuyer(pogitem,pogyes)
end





function autochecker(pogitem,pogyes)
    firesignal(game.Players.LocalPlayer.PlayerGui.GUI.HUDLeft.Buttons.Inventory.MouseButton1Click)
    wait()
    firesignal(game.Players.LocalPlayer.PlayerGui.GUI.Inventory.Frame.Bottom.Search.Cancel.MouseButton1Click)
    wait()
    firesignal(game.Players.LocalPlayer.PlayerGui.GUI.Inventory.Close.MouseButton1Click)
    wait()
    firesignal(game.Players.LocalPlayer.PlayerGui.GUI.HUDLeft.Buttons.Inventory.MouseButton1Click)
    wait()
    firesignal(game.Players.LocalPlayer.PlayerGui.GUI.Inventory.Close.MouseButton1Click)
    wait(0.5)
    if tierfinder(pogitem) == "Reborn" or tierfinder(pogitem) == "Other" then
        OrionLib:MakeNotification({
            Name = "WAKE UP (real)",
            Content = "my guy, did you seriously just try to craft: ".. pogitem,
            Image = "rbxassetid://4483345998",
            Time = 10
        })
        return
    end
    local function itembuyer(yesitem,yesamount)
        local aggup = {}
        local aggnum = {}
        local function yes(item, amount,incursion)
            if tierfinder(item) ~= "Reborn" and tierfinder(item) ~= "Other" then
                local incursions = incursion + 1
                navtoitemtab(item)
                local upgraders = {}
                local amountinrecepie = {}
                local tier = tierfinder(item)
                for _,v in pairs(game.Players.LocalPlayer.PlayerGui.GUI.Craftsman.Contents.Crafting.Cost:GetChildren()) do
                    if v.Name == "SampleItem" then
                        v:WaitForChild("ItemId")
                        local amounttomake = v.Amount.Text
                        amounttomake = amounttomake:gsub("x","")
                        amounttomake = tonumber(amounttomake)
                        table.insert(amountinrecepie,amounttomake*amount)
                        table.insert(upgraders,itemfinder(v.ItemId.Value))
                    end
                end
                --print("---Materials: "..table.concat(upgraders, ", "))
                --print("---Amount: "..table.concat(amountinrecepie, ", "))
                for i,upgrader in pairs(upgraders) do
                    yes(upgrader,amountinrecepie[i],incursions)
                    navtoitemtab(item)
                end
            --print("creating: "..item.." Amount: "..amount.." --incursions: "..incursion)
            else
                if table.find(aggup, item) then
                    for i,upgrader in pairs(aggup) do
                        if upgrader == item then
                            aggnum[i] = aggnum[i]+ amount
                        end
                    end
                else
                    table.insert(aggup, item)
                    table.insert(aggnum, amount)
                end
            end
        end
        yes(yesitem,yesamount,0)
        print("---Materials: "..table.concat(aggup, ", "))
        print("---Amount: "..table.concat(aggnum, ", "))

        local endaggnum = {}
        for int,v in pairs(aggup) do
            local done = false
            for _,vs in pairs(game.Players.LocalPlayer.PlayerGui.GUI.Inventory.Frame.Items:GetChildren()) do
                if vs.ClassName == "ImageButton" then
                    if itemfinder(vs.ItemId.Value) == v then
                        local amount = vs.Amount.Text
                        amount = amount:gsub("x","")
                        amount = tonumber(amount)
                        amount = amount-aggnum[int]
                        print(v.." "..amount.." "..aggnum[int])
                        table.insert(endaggnum,amount)
                        done = true
                        break
                    end
                end
            end
            if not done then
                print(v.." "..tostring(-aggnum[int]).." "..aggnum[int])
                table.insert(endaggnum,-aggnum[int])
            end
        end


        local cannotcraft = {}
        for i,v in pairs(aggup) do
            --print(v.."   "..endaggnum[i])
            if endaggnum[i] then
                if endaggnum[i] < 0 then
                    endaggnum[i] = tostring(endaggnum[i])
                    endaggnum[i] = endaggnum[i]:gsub("-","")
                    table.insert(cannotcraft,v.." missing: "..endaggnum[i])
                end
            end
        end

        local content = ""
        if not next(cannotcraft) then
            content = "You can craft"
            OrionLib:MakeNotification({
                Name = "So True, FR: "..yesitem,
                Content = content,
                Image = "rbxassetid://4483345998",
                Time = 10
            })
        elseif next(cannotcraft) then
            content = table.concat(cannotcraft,"\n")
            print(content)
            OrionLib:MakeNotification({
                Name = "L Cant Craft: "..yesitem,
                Content = content,
                Image = "rbxassetid://4483345998",
                Time = 10
            })
        end
    end
    itembuyer(pogitem,pogyes)
end

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

print("Loaded")
