local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/VisualRoblox/Roblox/main/UI-Libraries/Visual%20UI%20Library/Source.lua'))()
local Window = Library:CreateWindow('Forlorn Hub', 'Destruction Simulator', 'Forlorn Hub', 'rbxassetid://10618928818', false, 'VisualUIConfigs', 'Default')
local Tab1 = Window:CreateTab('Main', true, 'rbxassetid://3926305904', Vector2.new(484, 44), Vector2.new(36, 36))
local Tab2 = Window:CreateTab('Boosts', true, 'rbxassetid://3926305904', Vector2.new(484, 44), Vector2.new(36, 36))
local Tab3 = Window:CreateTab('Misc', true, 'rbxassetid://3926305904', Vector2.new(484, 44), Vector2.new(36, 36))
local Tab4 = Window:CreateTab('LocalPlayer', true, 'rbxassetid://3926305904', Vector2.new(484, 44), Vector2.new(36, 36))

local Main = Tab1:CreateSection('Stuff')
local Boosts = Tab2:CreateSection('Stuff')
local Misc = Tab3:CreateSection('Stuff')
local LocalPlayer = Tab4:CreateSection('Stuff')

local Button = Main:CreateButton('100M Coins', function()
local args = {
    [1] = "Coins",
    [2] = "999999999999999999",
    [3] = 99999999
}

game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer(unpack(args))
end)

local Toggle = Main:CreateToggle('Auto 100M Coins', false, Color3.fromRGB(0, 125, 255), 0.25, function(Value)
    _G.auto = Value
    while _G.auto == true do
        wait()
        local args = {
    [1] = "Coins",
    [2] = "999999999999999999",
    [3] = 99999999
}

game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer(unpack(args))
    end
end)

local Button = Main:CreateButton('No Reload', function()
    local plr = game.Players.LocalPlayer
local ms = plr:GetMouse()
function Clicked()
     local args = {
    [1] = 1678293647826483248165345435.9980955,
    [2] = game:GetService("Players").LocalPlayer.Character.Launcher.Stats,
    [3] = ms.Hit.p,
    [4] = game:GetService("Players").LocalPlayer.Character.Launcher.Assets.Rocket.Boom
}

game:GetService("ReplicatedStorage").Remotes.explodeRocket:FireServer(unpack(args))
end
ms.Button1Down:Connect(Clicked)
end)

local Button = Boosts:CreateButton('Infinite XP Boost', function()
local args = {
    [1] = "XPBoost",
    [2] = "999999999999999999",
    [3] = 1000000000000000000
}

game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer(unpack(args))
end)

local Button = Boosts:CreateButton('Infinite Coin Boost', function()
local args = {
    [1] = "CoinBoost",
    [2] = "999999999999999999",
    [3] = 1000000000000000000
}

game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer(unpack(args))
end)

local Button = Boosts:CreateButton('Infinite Brick Boost', function()
local args = {
    [1] = "BrickBoost",
    [2] = "999999999999999999",
    [3] = 1000000000000000000
}

game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer(unpack(args))
end)

local Button = Boosts:CreateButton('Infinite Super Jump Boost', function()
local args = {
    [1] = "SuperJump",
    [2] = "999999999999999999",
    [3] = 1000000000000000000
}

game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer(unpack(args))
end)

local Button = Boosts:CreateButton('Infinite Extra Speed Boost', function()
local args = {
    [1] = "ExtraSpeed",
    [2] = "999999999999999999",
    [3] = 1000000000000000000
}

game:GetService("ReplicatedStorage").Remotes.generateBoost:FireServer(unpack(args))
end)

local Toggle = Misc:CreateToggle('AutoSell', false, Color3.fromRGB(0, 125, 255), 0.25, function(Value)
    _G.autosell = Value
    while _G.autosell == true do
        wait()
        game:GetService("ReplicatedStorage").Remotes.sellBricks:FireServer()
    end
end)

local Toggle = Misc:CreateToggle('Hide BackPack Full', false, Color3.fromRGB(0, 125, 255), 0.25, function(Value)
    game:GetService("Players").LocalPlayer.PlayerGui.MainUI.StoragePopupFrame.Visible = not Value
end)

local Slider = LocalPlayer:CreateSlider('WalkSpeed', 0, 750, 50, Color3.fromRGB(0, 125, 255), function(Value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
end)

local Slider = LocalPlayer:CreateSlider('JumpPower', 0, 250, 50, Color3.fromRGB(0, 125, 255), function(Value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
end)

local Slider = LocalPlayer:CreateSlider('Gravity', 1, 1000, 50, Color3.fromRGB(0, 125, 255), function(Value)
    game.Workspace.Gravity = Value
end)

local Slider = LocalPlayer:CreateSlider('FOV', 1, 200, 75, Color3.fromRGB(0, 125, 255), function(Value)
    game:GetService("Workspace").Camera.FieldOfView = Value
end)
