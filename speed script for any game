local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local uis = game:GetService("UserInputService")
local hum = game.Players.LocalPlayer.Character.Humanoid
local speeding = false
local speedmulti = 1
local speedboost = false
local instastop = false
local downforce = false
local downforceamount = 1
local flingvelocity = 50

function flingcar(velocity)
    if hum.SeatPart then
        hum.SeatPart.Velocity = velocity
    end
end

local Window = Rayfield:CreateWindow({
   Name = "Forlorn Hub",
   LoadingTitle = "Loading",
   LoadingSubtitle = "by ForlornW46",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "Forlorn Hub"
   },
})

function speed()
    if not Rayfield and Window then return end
    repeat
        if not Rayfield then return end
        if hum.SeatPart and not downforce and speedboost then
            hum.SeatPart.Velocity += hum.SeatPart.CFrame.LookVector * (speedmulti / 10)
        elseif hum.SeatPart and downforce then
            if speedboost then
                hum.SeatPart.Velocity += hum.SeatPart.CFrame.LookVector * (speedmulti / 10) - Vector3.new(0,downforceamount/10,0)
            else
               hum.SeatPart.Velocity += hum.SeatPart.CFrame.LookVector - Vector3.new(0,downforceamount/10,0) 
            end
        end
        task.wait()
    until speeding == false
end

local Tab = Window:CreateTab("Main SpeedBoosts")
local Tab1 = Window:CreateTab("Fun")
local Tab2 = Window:CreateTab("Character")
local Section = Tab:CreateSection("Stuff?")
local Section1 = Tab2:CreateSection("Stuff?")
local Section2 = Tab1:CreateSection("Stuff?")

local Slider = Tab:CreateSlider({
   Name = "Speed Multi",
   Range = {1, 150},
   Increment = 1,
   Suffix = "Boost",
   CurrentValue = 1,
   Flag = "Slider1",
   Callback = function(Value)
        speedmulti = Value
   end,
})

local Slider = Tab1:CreateSlider({
   Name = "Fling Multi",
   Range = {10, 1000},
   Increment = 10,
   Suffix = "X Velocity",
   CurrentValue = 50,
   Flag = "Slider1",
   Callback = function(Value)
        flingvelocity = Value
   end,
})

local Slider = Tab:CreateSlider({
   Name = "DownForce Multi",
   Range = {1, 150},
   Increment = 1,
   Suffix = "DownForce",
   CurrentValue = 1,
   Flag = "Slider2",
   Callback = function(Value)
        downforceamount = Value
   end,
})

local Slider = Tab2:CreateSlider({
   Name = "WalkSpeed",
   Range = {1, 250},
   Increment = 1,
   Suffix = "",
   CurrentValue = hum.WalkSpeed,
   Flag = "Slider2",
   Callback = function(Value)
        hum.WalkSpeed = Value
   end,
})

local Slider = Tab2:CreateSlider({
   Name = "JumpPower",
   Range = {1, 250},
   Increment = 1,
   Suffix = "",
   CurrentValue = hum.JumpPower,
   Flag = "Slider2",
   Callback = function(Value)
        hum.JumpPower = Value
        hum.JumpHeight = Value
   end,
})

local Slider = Tab2:CreateSlider({
   Name = "FOV",
   Range = {1, 120},
   Increment = 1,
   Suffix = "",
   CurrentValue = workspace.CurrentCamera.FieldOfView,
   Flag = "Slider2",
   Callback = function(Value)
        workspace.CurrentCamera.FieldOfView = Value
   end,
})

local Toggle = Tab:CreateToggle({
   Name = "Speed Boost [W] or [Up Arrow]",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
        speedboost = Value
   end,
})

local Toggle = Tab:CreateToggle({
   Name = "Speed Boost DownForce",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
        downforce = Value
   end,
})

local Toggle = Tab:CreateToggle({
   Name = "Insta Brake",
   CurrentValue = false,
   Flag = "Toggle2",
   Callback = function(Value)
        instastop = Value
   end,
})

local Button = Tab1:CreateButton({
   Name = "Fling Vehicle",
   Callback = function()
        flingcar(Vector3.new(math.random(-flingvelocity,flingvelocity),math.random(-flingvelocity,flingvelocity),math.random(-flingvelocity,flingvelocity)))
   end,
})

local Button = Tab1:CreateButton({
   Name = "Fling Vehicle Up",
   Callback = function()
        if hum.SeatPart then
            flingcar(Vector3.new(hum.SeatPart.Velocity.X,flingvelocity,hum.SeatPart.Velocity.Z))
        end
   end,
})

local Button = Tab1:CreateButton({
   Name = "Flip Vehicle",
   Callback = function()
        if hum.SeatPart then
            hum.SeatPart:PivotTo((hum.SeatPart.CFrame * CFrame.new(Vector3.new(0,15,0))) * CFrame.Angles(0,0,0))
        end
   end,
})

local Label = Tab:CreateLabel("Restart Script If You Die!")

local connection = uis.InputBegan:Connect(function(input)
    if not Rayfield and Window then return end
    if input.KeyCode == Enum.KeyCode.W or input.KeyCode == Enum.KeyCode.Up then
        speeding = true
        if Rayfield then
            speed()
        end
    elseif input.KeyCode == Enum.KeyCode.S or input.KeyCode == Enum.KeyCode.Down then
        if hum.SeatPart and instastop then
            hum.SeatPart.Velocity = Vector3.new(0,0,0)
        end
    end
end)

local connection1 = uis.InputEnded:Connect(function(input)
    if not Rayfield and Window then return end
    if input.KeyCode == Enum.KeyCode.W or input.KeyCode == Enum.KeyCode.Up and rayfield then
        speeding = false
    end
end)

hum.Died:Connect(function()
    Rayfield:Destroy()
    connection:Disconnect()
    connection1:Disconnect()
end)
