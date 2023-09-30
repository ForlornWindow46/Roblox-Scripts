local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

orbs = 0
gems = 0
 
local Window = Rayfield:CreateWindow({
   Name = "Forlorn hub",
   LoadingTitle = "Forlorn Hub Loading",
   LoadingSubtitle = "by ForlornW46",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "Forlorn Hub"
   },
})
 
local Tab = Window:CreateTab("Values")
local Main = Tab:CreateSection("Main")
local Tab2 = Window:CreateTab("Auto")
local Main2 = Tab2:CreateSection("Main")
local Tab3 = Window:CreateTab("Manual")
local Main3 = Tab3:CreateSection("Main")

local Toggle = Tab2:CreateToggle({
   Name = "Auto Collect Orbs",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
       _G.autocollect = Value
       while _G.autocollect == true do
           wait(1)
           for i = 1,orbs do
           local args = {
    [1] = "collectOrb",
    [2] = "Red Orb",
    [3] = "City"
}

game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
       end
       end
   end,
})

local Toggle = Tab2:CreateToggle({
   Name = "Auto Collect Gems",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
       _G.autocollect2 = Value
       while _G.autocollect2 == true do
           wait(1)
           for i = 1,orbs do
           local args = {
    [1] = "collectOrb",
    [2] = "Gem",
    [3] = "City"
}

game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
       end
       end
   end,
})

local Toggle = Tab3:CreateButton({
   Name = "Collect Orbs",
   Flag = "Button1",
   Callback = function(Value)
       for i = 1,orbs do
           local args = {
    [1] = "collectOrb",
    [2] = "Red Orb",
    [3] = "City"
}

game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
       end
   end,
})

local Toggle = Tab3:CreateButton({
   Name = "Collect Gems",
   Flag = "Button1",
   Callback = function(Value)
       for i = 1,gems do
           local args = {
    [1] = "collectOrb",
    [2] = "Gem",
    [3] = "City"
}

game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
end
   end,
})

local Slider = Tab:CreateSlider({
   Name = "Orbs To Collect",
   Range = {0, 10000},
   Increment = 1,
   Suffix = "Orbs",
   CurrentValue = 10,
   Flag = "Slider1",
   Callback = function(Value)
       orbs = Value
   end,
})

local Slider = Tab:CreateSlider({
   Name = "Gems To Collect",
   Range = {0, 10000},
   Increment = 1,
   Suffix = "Gems",
   CurrentValue = 10,
   Flag = "Slider1",
   Callback = function(Value)
       gems = Value
   end,
})

local Toggle = Tab2:CreateToggle({
   Name = "Auto Rebirth",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
       _G.autorebirth = Value
       while _G.autorebirth == true do
           wait()
local args = {
    [1] = "rebirthRequest"
}

game:GetService("ReplicatedStorage").rEvents.rebirthEvent:FireServer(unpack(args))
       end
   end,
})

Rayfield:LoadConfiguration()
