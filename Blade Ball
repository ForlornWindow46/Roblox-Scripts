local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local spamparry = false

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
Players.LocalPlayer.Character.Humanoid.UseJumpPower = true
local enabled = false

local Player = Players.LocalPlayer or Players.PlayerAdded:Wait()
local Remotes = ReplicatedStorage:WaitForChild("Remotes", 9e9)
local Balls = workspace:WaitForChild("Balls", 9e9)

local function VerifyBall(Ball)
    if typeof(Ball) == "Instance" and Ball:IsA("BasePart") and Ball:IsDescendantOf(Balls) and Ball:GetAttribute("realBall") == true then
        return true
    end
end

local function IsTarget()
    return (Player.Character and Player.Character:FindFirstChild("Highlight"))
end

local mag = 0

local Window = Rayfield:CreateWindow({
   Name = "Forlorn Hub",
   LoadingTitle = "Forlorn Hub Loading",
   LoadingSubtitle = "by ForlornW46",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil,
      FileName = "Forlorn Hub"
   },
})

local Tab = Window:CreateTab("Auto Parry", 4483362458)
local Section = Tab:CreateSection("Stuff")
local Tab1 = Window:CreateTab("Character", 4483362458)
local Section = Tab1:CreateSection("Stuff")
local Tab2 = Window:CreateTab("Info", 4483362458)
local Section = Tab2:CreateSection("Stuff")

local Toggle1 = Tab:CreateToggle({
   Name = "Auto Parry",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
   		enabled = Value
   end,
})

local Slider1 = Tab:CreateSlider({
   Name = "Range To Hit From",
   Range = {0, 100},
   Increment = 2.5,
   Suffix = "Studs",
   CurrentValue = 10,
   Flag = "Slider1",
   Callback = function(Value)
   		mag = Value
   end,
})

local Keybind = Tab:CreateKeybind({
   Name = "Change Parry Key",
   CurrentKeybind = "F",
   HoldToInteract = false,
   Flag = "Keybind1",
   Callback = function(Keybind)
   	   Remotes:WaitForChild("ParryButtonPress"):Fire()
   end,
})

local Keybind = Tab:CreateKeybind({
   Name = "Spam Parry",
   CurrentKeybind = "E",
   HoldToInteract = false,
   Flag = "Keybind1",
   Callback = function(Keybind)
   	   spamparry = not spamparry
   end,
})

local Slider2 = Tab1:CreateSlider({
   Name = "WalkSpeed [Normal is 36]",
   Range = {0, 100},
   Increment = 1,
   Suffix = "",
   CurrentValue = 36,
   Flag = "Slider2",
   Callback = function(Value)
   		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

local Slider3 = Tab1:CreateSlider({
   Name = "JumpPower [Normal is 50]",
   Range = {0, 100},
   Increment = 1,
   Suffix = "",
   CurrentValue = 50,
   Flag = "Slider3",
   Callback = function(Value)
   		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
   end,
})

local Slider3 = Tab1:CreateSlider({
   Name = "FieldOfView - [Normal is 70]",
   Range = {0, 120},
   Increment = 1,
   Suffix = "",
   CurrentValue = 70,
   Flag = "Slider3",
   Callback = function(Value)
   		game.Workspace.Camera.FieldOfView = Value
   end,
})

local Label1 = Tab2:CreateLabel("K - Hide/Show Gui")
local Label2 = Tab2:CreateLabel("Made By ForlornW46")
local Label3 = Tab2:CreateLabel("Auto Parry May Depend On Ping")

game:GetService("RunService").RenderStepped:Connect(function()
	if spamparry == true then
		Remotes:WaitForChild("ParryButtonPress"):Fire()
	end
end)

Balls.ChildAdded:Connect(function(Ball)
    if not VerifyBall(Ball) then
        return
    end
    local OldPosition = Ball.Position
    local OldTick = tick()
    Ball:GetPropertyChangedSignal("Position"):Connect(function()
        if IsTarget() then
            local Distance = (Ball.Position - workspace.CurrentCamera.Focus.Position).Magnitude
            local Velocity = (OldPosition - Ball.Position).Magnitude
        
            if (Distance * Velocity) <= mag then
                if enabled then
                	Remotes:WaitForChild("ParryButtonPress"):Fire()
                end
            end
        end
        if (tick() - OldTick >= 1/60) then
            OldTick = tick()
            OldPosition = Ball.Position
        end
    end)
end)
