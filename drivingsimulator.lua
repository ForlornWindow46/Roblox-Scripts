local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local cars = workspace["$cars"]
local plr = game.Players.LocalPlayer
local uis = game:GetService("UserInputService")
local vu = game:GetService("VirtualUser")

local addedspeed = 1
local speed_boost_enabled = false
local braking_enabled = false
local holding_w = false
local holding_s = false
local supercontrol = false

local function getcar()
    for _, car in cars:GetChildren() do
        if car.State and car.State.Owner and car.State.Owner.Value == plr then
            return car
        end
    end
end

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
	KeySystem = false
})

local Farm = Window:CreateTab("Farms")
local Creds = Window:CreateTab("Credits/Info")
Farm:CreateSection("Farms")
Creds:CreateSection("Credits")

Farm:CreateSlider({
	Name = "Speed Multi",
	Range = {0, 50},
	Increment = 1,
	Suffix = "Sped",
	CurrentValue = 1,
	Callback = function(Value)
		addedspeed = Value
	end
})

Farm:CreateToggle({
	Name = "Speed Boost",
	CurrentValue = false,
	Callback = function(Value)
		speed_boost_enabled = Value
	end
})

Farm:CreateToggle({
	Name = "Instant Brake",
	CurrentValue = false,
	Callback = function(Value)
		braking_enabled = Value
	end
})

Farm:CreateToggle({
	Name = "Super Control",
	CurrentValue = false,
	Callback = function(Value)
		supercontrol = Value
	end
})

Farm:CreateButton({
	Name = "Fling Car",
	Callback = function()
		local v = getcar()
		if v and v:FindFirstChild("RootPart") then
			v.RootPart.Velocity = Vector3.new(math.random(-2000, 2000), math.random(0, 600), math.random(-2000, 2000))
		end
	end
})

Farm:CreateButton({
	Name = "AntiAFK",
	Callback = function()
		game:GetService("Players").LocalPlayer.Idled:Connect(function()
			vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
			wait(1)
			vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
		end)
		Rayfield:Notify({
			Title = "AntiAFK",
			Content = "-- Enabled",
			Duration = 3,
			Image = 4483362458,
			Actions = {
				Ignore = {
					Name = "Okay!",
					Callback = function() end
				}
			}
		})
	end
})

Creds:CreateLabel("Respawn Car To Stop!")
Creds:CreateLabel("By Forlornicus6")

uis.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.Keyboard then
		if input.KeyCode == Enum.KeyCode.W then
			holding_w = true
			while holding_w and speed_boost_enabled do
				task.wait()
				local car = getcar()
				if car and car:FindFirstChild("RootPart") then
					if supercontrol then
					    car.RootPart.Velocity += car.RootPart.CFrame.LookVector * Vector3.new(addedspeed / 10, 0, addedspeed / 10) + Vector3.new(0, -5, 0)
					else
					    car.RootPart.Velocity += car.RootPart.CFrame.LookVector * Vector3.new(addedspeed / 10, 0, addedspeed / 10)
					end
				end
			end
		elseif input.KeyCode == Enum.KeyCode.S then
			holding_s = true
			if braking_enabled then
				local car = getcar()
				if car and car:FindFirstChild("RootPart") then
					car.RootPart.Velocity = Vector3.zero
				end
			end
		end
	end
end)

uis.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.Keyboard then
		if input.KeyCode == Enum.KeyCode.W then
			holding_w = false
		elseif input.KeyCode == Enum.KeyCode.S then
			holding_s = false
		end
	end
end)

Rayfield:LoadConfiguration()
