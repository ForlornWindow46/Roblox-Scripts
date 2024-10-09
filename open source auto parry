local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local spamParry = false
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local ballsContainer = workspace:WaitForChild("Balls", 9e9)
local remotes = ReplicatedStorage:WaitForChild("Remotes", 9e9)

player.Character.Humanoid.UseJumpPower = true

local enabled = false
local mag = 0

local function VerifyBall(ball)
    return typeof(ball) == "Instance" and ball:IsA("BasePart") and ball:IsDescendantOf(ballsContainer) and ball:GetAttribute("realBall") == true
end

local function IsTarget()
    return player.Character and player.Character:FindFirstChild("Highlight")
end

local window = Rayfield:CreateWindow({
    Name = "Forlorn Hub",
    LoadingTitle = "Forlorn Hub Loading",
    LoadingSubtitle = "by Forlornicus",
    ConfigurationSaving = {
        Enabled = false,
        FolderName = nil,
        FileName = "Forlorn Hub"
    },
})

local autoParryTab = window:CreateTab("Auto Parry", 4483362458)
local characterTab = window:CreateTab("Character", 4483362458)
local infoTab = window:CreateTab("Info", 4483362458)

autoParryTab:CreateToggle({
    Name = "Auto Parry",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(value)
        enabled = value
    end,
})

autoParryTab:CreateSlider({
    Name = "Range To Hit From",
    Range = {0, 100},
    Increment = 2.5,
    Suffix = "Studs",
    CurrentValue = 12.5,
    Flag = "Slider1",
    Callback = function(value)
        mag = value
    end,
})

autoParryTab:CreateKeybind({
    Name = "Change Parry Key",
    CurrentKeybind = "F",
    HoldToInteract = false,
    Flag = "Keybind1",
    Callback = function()
        mouse1click()
    end,
})

autoParryTab:CreateKeybind({
    Name = "Spam Parry",
    CurrentKeybind = "E",
    HoldToInteract = false,
    Flag = "Keybind2",
    Callback = function()
        spamParry = not spamParry
    end,
})

characterTab:CreateSlider({
    Name = "WalkSpeed [Normal is 36]",
    Range = {0, 100},
    Increment = 1,
    Suffix = "",
    CurrentValue = 36,
    Flag = "Slider2",
    Callback = function(value)
        player.Character.Humanoid.WalkSpeed = value
    end,
})

characterTab:CreateSlider({
    Name = "JumpPower [Normal is 50]",
    Range = {0, 100},
    Increment = 1,
    Suffix = "",
    CurrentValue = 50,
    Flag = "Slider3",
    Callback = function(value)
        player.Character.Humanoid.JumpPower = value
    end,
})

characterTab:CreateSlider({
    Name = "FieldOfView [Normal is 70]",
    Range = {0, 120},
    Increment = 1,
    Suffix = "",
    CurrentValue = 70,
    Flag = "Slider4",
    Callback = function(value)
        game.Workspace.Camera.FieldOfView = value
    end,
})

infoTab:CreateLabel("K - Hide/Show Gui")
infoTab:CreateLabel("Made By ForlornW46")
infoTab:CreateLabel("Auto Parry May Depend On Ping")

game:GetService("RunService").RenderStepped:Connect(function()
    if spamParry then
        mouse1click()
    end
end)

ballsContainer.ChildAdded:Connect(function(ball)
    if not VerifyBall(ball) then
        return
    end

    local oldPosition = ball.Position
    local oldTick = tick()

    ball:GetPropertyChangedSignal("Position"):Connect(function()
        if IsTarget() then
            local distance = (ball.Position - workspace.CurrentCamera.Focus.Position).Magnitude
            local velocity = (oldPosition - ball.Position).Magnitude
            
            local newmag = 0

            if velocity < 1 then
                newmag = (distance * velocity)
            else
                newmag = (distance / velocity)
            end
            
            if newmag <= mag and enabled then
                mouse1click()
            end
        end
        
        if tick() - oldTick >= 1/60 then
            oldTick = tick()
            oldPosition = ball.Position
        end
    end)
end)
