local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
 
local Window = Rayfield:CreateWindow({
	Name = "Forlorn Hub",
	LoadingTitle = "Forlorn Hub Loading",
	LoadingSubtitle = "by ForlornW46",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = "Forlorn Hub",
		FileName = "Forlorn Hub"
	},
        Discord = {
        	Enabled = false,
        	Invite = "",
        	RememberJoins = false
        },
	KeySystem = false,
	KeySettings = {
		Title = "Forlorn Hub",
		Subtitle = "Key System",
		Note = "Join the discord",
		FileName = "ForlornKey",
		SaveKey = true,
		GrabKeyFromSite = false,
		Key = "Forlornicus"
	}
})
 
local Farm = Window:CreateTab("Farms")
local Creds = Window:CreateTab("Credits/Info")
local Main = Farm:CreateSection("Farms")
local Credits = Creds:CreateSection("Credits")

local Toggle = Farm:CreateButton({
   Name = "AutoFarm Drift Points",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
       for i,v in pairs(workspace.Cars:GetChildren()) do
    if tostring(v.Owner.Value) == game.Players.LocalPlayer.Name then
        while wait() do
            v.Main.CFrame = CFrame.new(0,200,0)
        game:GetService("TweenService"):Create(v.Main,TweenInfo.new(40,Enum.EasingStyle.Linear),{CFrame = CFrame.new(-17.2,32.3,-3.17)}):Play()
        end
    end
end
   end,
})

local addedspeed

local Slider = Farm:CreateSlider({
   Name = "Speed Multi",
   Range = {0, 50},
   Increment = 1,
   Suffix = "Sped",
   CurrentValue = 1,
   Flag = "Slider1",
   Callback = function(Value)
       addedspeed = Value
   end,
})

local Toggle = Farm:CreateToggle({
   Name = "Speed Boost",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
   _G.enabled = Value
       local CarsFolder = workspace.Cars

local player = game.Players.LocalPlayer
_G.speed = false
local function handleInput(input, car)
    if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.W then
        _G.speed = true
        while _G.speed == true and _G.enabled == true do
            wait()
            car.Main.Velocity += car.Main.CFrame.LookVector * Vector3.new(addedspeed / 10, 0, addedspeed / 10) + Vector3.new(0,-5,0)
        end
    end
end

local function handleInputEnded(input, car)
    if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.W then
        _G.speed = false
    end
end

for _, car in ipairs(CarsFolder:GetChildren()) do
    if car:IsA("Model") and car.Owner and tostring(car.Owner.Value) == player.Name then
        local uis = game:GetService("UserInputService")
        
        uis.InputBegan:Connect(function(input)
            handleInput(input, car)
        end)
        
        uis.InputEnded:Connect(function(input)
            handleInputEnded(input, car)
        end)
    end
end

   end,
})

local Toggle = Farm:CreateButton({
   Name = "Instant Brake",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
   local CarsFolder = workspace.Cars
local player = game.Players.LocalPlayer
       local function handleInput(input, car)
    if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.S then
        car.Main.Velocity = Vector3.new(0,0,0)
    end
end

local function handleInputEnded(input, car)
    if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.S then
        _G.speed = false
    end
end

for _, car in ipairs(CarsFolder:GetChildren()) do
    if car:IsA("Model") and car.Owner and tostring(car.Owner.Value) == player.Name then
        local uis = game:GetService("UserInputService")
        
        uis.InputBegan:Connect(function(input)
            handleInput(input, car)
        end)
        
        uis.InputEnded:Connect(function(input)
            handleInputEnded(input, car)
        end)
    end
end
   end,
})

local Toggle = Farm:CreateButton({
   Name = "Fling Car",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
      for i, v in pairs(game:GetService("Workspace").Cars:GetChildren()) do
    if tostring(v.Owner.Value) == game:GetService("Players").LocalPlayer.Name then 
        v.Main.Velocity = Vector3.new(math.random(-2000,2000),math.random(0,600),math.random(-2000,2000))
    end
end
   end,
})

local Toggle = Farm:CreateButton({
   Name = "Donut Mode",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
       local angularVelocity = 10

for _, car in ipairs(workspace.Cars:GetChildren()) do
    if car:IsA("Model") and car.Owner.Value == game.Players.LocalPlayer then
        local part = car:FindFirstChild("Main")
        if part then
            local bodyAngularVelocity = Instance.new("BodyAngularVelocity")
            bodyAngularVelocity.AngularVelocity = Vector3.new(0, angularVelocity, 0)
            bodyAngularVelocity.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
            bodyAngularVelocity.P = math.huge
            bodyAngularVelocity.Parent = part
        end
    end
end
   end,
})

local Toggle = Farm:CreateButton({
   Name = "Donut Mode [FAST]",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
       local angularVelocity = 100

for _, car in ipairs(workspace.Cars:GetChildren()) do
    if car:IsA("Model") and car.Owner.Value == game.Players.LocalPlayer then
        local part = car:FindFirstChild("Main")
        if part then
            local bodyAngularVelocity = Instance.new("BodyAngularVelocity")
            bodyAngularVelocity.AngularVelocity = Vector3.new(0, angularVelocity, 0)
            bodyAngularVelocity.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
            bodyAngularVelocity.P = math.huge
            bodyAngularVelocity.Parent = part
        end
    end
end

   end,
})

local Toggle = Farm:CreateButton({
   Name = "AntiAFK",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
      local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
Rayfield:Notify({
   Title = "AntiAFK",
   Content = "-- Enabled",
   Duration = 3,
   Image = 4483362458,
   Actions = {
      Ignore = {
         Name = "Okay!",
         Callback = function()
      end
   },
},
})
   end,
})
local Label = Creds:CreateLabel("Respaw Car To Stop!")
local Label2 = Creds:CreateLabel("By ForlornW46#9306")

Rayfield:LoadConfiguration()
