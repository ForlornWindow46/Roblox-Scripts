oreboost = false
autoloadout1 = false
autorebirth = false
remotemineactive = false
clickymineactive = false
playerselected = false
basefound = false

local factorys = workspace.Tycoons:GetChildren()
for i =1, #factorys do
	if factorys[i].Owner.Value == game.Players.LocalPlayer.Name then
		myfac = factorys[i]
	end
end

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

local MainGUI = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local CloseMH = Instance.new("TextButton")
local Label = Instance.new("TextLabel")
local PlayerBase = Instance.new("TextBox")
local OreBoostButton = Instance.new("TextButton")
local RemoteMines = Instance.new("TextButton")
local ClickyMines = Instance.new("TextButton")
local AutoRebirthButton = Instance.new("TextButton")
local AutoLoadout1Button = Instance.new("TextButton")
local PlayerFrame = Instance.new("Frame")
local Player1 = Instance.new("TextButton")
local Player2 = Instance.new("TextButton")
local Player3 = Instance.new("TextButton")
local Player4 = Instance.new("TextButton")
local Player5 = Instance.new("TextButton")
local Player6 = Instance.new("TextButton")

MainGUI.Name = "MainGUI"
MainGUI.Parent = game.CoreGui
local MainCORE = game.CoreGui["MainGUI"]

MainFrame.Name = "MainFrame"
MainFrame.Parent = MainGUI
MainFrame.BackgroundColor3 = Color3.new(1, 1, 1)
MainFrame.BorderColor3 = Color3.new(0, 0, 0)
MainFrame.Position = UDim2.new(1, -328, 0, 0)
MainFrame.Size = UDim2.new(0, 328, 0, 215)
MainFrame.Selectable = true
MainFrame.Active = true
MainFrame.Draggable = true

CloseMH.Name = "CloseMH"
CloseMH.Parent = MainFrame
CloseMH.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
CloseMH.BorderColor3 = Color3.new(0, 0, 0)
CloseMH.Position = UDim2.new(0, 5, 0, 8)
CloseMH.Size = UDim2.new(0, 21, 0, 21)
CloseMH.Font = Enum.Font.SourceSans
CloseMH.Text = "X"
CloseMH.TextColor3 = Color3.new(1, 0, 0)
CloseMH.TextScaled = true
CloseMH.TextSize = 17

Label.Name = "Label"
Label.Parent = MainFrame
Label.BackgroundColor3 = Color3.new(1, 1, 1)
Label.BackgroundTransparency = 1
Label.BorderSizePixel = 0
Label.Position = UDim2.new(0, 32, 0, 6)
Label.Size = UDim2.new(0, 130, 0, 25)
Label.Font = Enum.Font.SourceSans
Label.Text = "ORE BOOSTER GUI"
Label.TextColor3 = Color3.new(0.4, 0, 0)
Label.TextSize = 20

Player1.Name = "Player1"
Player1.Parent = MainFrame
Player1.BackgroundColor3 = Color3.new(0.8, 0.8, 0.8)
Player1.BorderColor3 = Color3.new(0, 1, 0)
Player1.Position = UDim2.new(0, 5, 0, 37)
Player1.Size = UDim2.new(0, 160, 0, 24)
Player1.Font = Enum.Font.SourceSans
Player1.Text = ""
Player1.TextColor3 = Color3.new(0, 0, 0)
Player1.TextSize = 16

Player2.Name = "Player2"
Player2.Parent = MainFrame
Player2.BackgroundColor3 = Color3.new(0.8, 0.8, 0.8)
Player2.BorderColor3 = Color3.new(0, 1, 0)
Player2.Position = UDim2.new(0, 5, 0, 66)
Player2.Size = UDim2.new(0, 160, 0, 24)
Player2.Font = Enum.Font.SourceSans
Player2.Text = ""
Player2.TextColor3 = Color3.new(0, 0, 0)
Player2.TextSize = 16

Player3.Name = "Player3"
Player3.Parent = MainFrame
Player3.BackgroundColor3 = Color3.new(0.8, 0.8, 0.8)
Player3.BorderColor3 = Color3.new(0, 1, 0)
Player3.Position = UDim2.new(0, 5, 0, 95)
Player3.Size = UDim2.new(0, 160, 0, 24)
Player3.Font = Enum.Font.SourceSans
Player3.Text = ""
Player3.TextColor3 = Color3.new(0, 0, 0)
Player3.TextSize = 16

Player4.Name = "Player4"
Player4.Parent = MainFrame
Player4.BackgroundColor3 = Color3.new(0.8, 0.8, 0.8)
Player4.BorderColor3 = Color3.new(0, 1, 0)
Player4.Position = UDim2.new(0, 5, 0, 124)
Player4.Size = UDim2.new(0, 160, 0, 24)
Player4.Font = Enum.Font.SourceSans
Player4.Text = ""
Player4.TextColor3 = Color3.new(0, 0, 0)
Player4.TextSize = 16

Player5.Name = "Player5"
Player5.Parent = MainFrame
Player5.BackgroundColor3 = Color3.new(0.8, 0.8, 0.8)
Player5.BorderColor3 = Color3.new(0, 1, 0)
Player5.Position = UDim2.new(0, 5, 0, 153)
Player5.Size = UDim2.new(0, 160, 0, 24)
Player5.Font = Enum.Font.SourceSans
Player5.Text = ""
Player5.TextColor3 = Color3.new(0, 0, 0)
Player5.TextSize = 16

Player6.Name = "Player6"
Player6.Parent = MainFrame
Player6.BackgroundColor3 = Color3.new(0.8, 0.8, 0.8)
Player6.BorderColor3 = Color3.new(0, 1, 0)
Player6.Position = UDim2.new(0, 5, 0, 182)
Player6.Size = UDim2.new(0, 160, 0, 24)
Player6.Font = Enum.Font.SourceSans
Player6.Text = ""
Player6.TextColor3 = Color3.new(0, 0, 0)
Player6.TextSize = 16

PlayerBase.Name = "PlayerBase"
PlayerBase.Parent = MainFrame
PlayerBase.BackgroundColor3 = Color3.new(0.8, 0.8, 0.8)
PlayerBase.Position = UDim2.new(0, 173, 0, 37)
PlayerBase.Size = UDim2.new(0, 150, 0, 24)
PlayerBase.Font = Enum.Font.SourceSans
PlayerBase.Text = "Best Base Player"
PlayerBase.TextColor3 = Color3.new(0, 0, 0)
PlayerBase.TextScaled = true
PlayerBase.TextSize = 18
PlayerBase.TextWrapped = true


OreBoostButton.Name = "OreBoostButton"
OreBoostButton.Parent = MainFrame
OreBoostButton.BackgroundColor3 = Color3.new(0.8, 0.8, 0.8)
OreBoostButton.Position = UDim2.new(0, 173, 0, 66)
OreBoostButton.Size = UDim2.new(0, 150, 0, 24)
OreBoostButton.Font = Enum.Font.SourceSans
OreBoostButton.Text = "Ore Booster: OFF"
OreBoostButton.TextColor3 = Color3.new(0, 0, 0)
OreBoostButton.TextSize = 18
OreBoostButton.TextWrapped = true

RemoteMines.Name = "RemoteMines"
RemoteMines.Parent = MainFrame
RemoteMines.BackgroundColor3 = Color3.new(0.8, 0.8, 0.8)
RemoteMines.Position = UDim2.new(0, 173, 0, 95)
RemoteMines.Size = UDim2.new(0, 150, 0, 24)
RemoteMines.Font = Enum.Font.SourceSans
RemoteMines.Text = "Remote Mine: OFF"
RemoteMines.TextColor3 = Color3.new(0, 0, 0)
RemoteMines.TextSize = 18
RemoteMines.TextWrapped = true

ClickyMines.Name = "ClickyMines"
ClickyMines.Parent = MainFrame
ClickyMines.BackgroundColor3 = Color3.new(0.8, 0.8, 0.8)
ClickyMines.Position = UDim2.new(0, 173, 0, 124)
ClickyMines.Size = UDim2.new(0, 150, 0, 24)
ClickyMines.Font = Enum.Font.SourceSans
ClickyMines.Text = "Button Mine: OFF"
ClickyMines.TextColor3 = Color3.new(0, 0, 0)
ClickyMines.TextSize = 18
ClickyMines.TextWrapped = true

AutoRebirthButton.Name = "AutoRebirthButton"
AutoRebirthButton.Parent = MainFrame
AutoRebirthButton.BackgroundColor3 = Color3.new(0.8, 0.8, 0.8)
AutoRebirthButton.Position = UDim2.new(0, 173, 0, 153)
AutoRebirthButton.Size = UDim2.new(0, 150, 0, 24)
AutoRebirthButton.Font = Enum.Font.SourceSans
AutoRebirthButton.Text = "Auto Rebirth: OFF"
AutoRebirthButton.TextColor3 = Color3.new(0, 0, 0)
AutoRebirthButton.TextSize = 18
AutoRebirthButton.TextWrapped = true

AutoLoadout1Button.Name = "AutoLoadout1Button"
AutoLoadout1Button.Parent = MainFrame
AutoLoadout1Button.BackgroundColor3 = Color3.new(0.8, 0.8, 0.8)
AutoLoadout1Button.Position = UDim2.new(0, 173, 0, 182)
AutoLoadout1Button.Size = UDim2.new(0, 150, 0, 24)
AutoLoadout1Button.Font = Enum.Font.SourceSans
AutoLoadout1Button.Text = "AutoLoad Layout1: OFF"
AutoLoadout1Button.TextColor3 = Color3.new(0, 0, 0)
AutoLoadout1Button.TextSize = 18
AutoLoadout1Button.TextWrapped = true

-- Player Select --

local buttons = {
    Player1,
    Player2,
    Player3,
    Player4,
    Player5,
    Player6
}
spawn(function()
	while true do
		Player1.Text = ""
		Player2.Text = ""
		Player3.Text = ""
		Player4.Text = ""
		Player5.Text = ""
		Player6.Text = ""
		for i, v in pairs(game.Players:GetChildren()) do
			buttons[i].Text = v.Name
			buttons[i].Visible = true
		end
		wait(0.5)
	end
end)

Player1.MouseButton1Down:connect(function()
	PlayerBase.Text = Player1.Text
	showplayeritems()
end)
Player2.MouseButton1Down:connect(function()
    PlayerBase.Text = Player2.Text
	showplayeritems()
end)
Player3.MouseButton1Down:connect(function()
    PlayerBase.Text = Player3.Text
	showplayeritems()
end)
Player4.MouseButton1Down:connect(function()
    PlayerBase.Text = Player4.Text
	showplayeritems()
end)
Player5.MouseButton1Down:connect(function()
    PlayerBase.Text = Player5.Text
	showplayeritems()
end)
Player6.MouseButton1Down:connect(function()
    PlayerBase.Text = Player6.Text
	showplayeritems()
end)

-- Close GUI --
	
CloseMH.MouseButton1Down:connect(function()
MainGUI:Destroy()
end)

-- Auto Load Layout 1 --

RemoteMines.MouseButton1Down:connect(function()
	if remotemineactive == false then
		remotemineactive = true
		RemoteMines.Text = "Remote Mine: ON"
	else
		remotemineactive = false
		RemoteMines.Text = "Remote Mine: OFF"
	end
end)

local mytycoon
for _, tycoon in ipairs(game.Workspace.Tycoons:GetChildren()) do
    if tostring(tycoon.Owner.Value) == tostring(game.Players.LocalPlayer) then
        mytycoon = tycoon
    break
    end
end

function grabmine()
    for _, v in pairs(mytycoon:GetChildren()) do
        if v.ClassName == "Model" then
            if v.Model:FindFirstChild("DropperScript") then
                return v.Name
            end
        end
    end
end

function grabfurnace()
    for _, v in pairs(mytycoon:GetChildren()) do
        if v.ClassName == "Model" then
            if v.Model:FindFirstChild("Lava") then
                return v.Name
            end
        end
    end
end

spawn(function()
	while wait(0.2) do
		if remotemineactive == true then
			game:GetService'ReplicatedStorage'.RemoteDrop:FireServer()
		end
	end
end)

ClickyMines.MouseButton1Down:connect(function()
	if clickymineactive == false then
		clickymineactive = true
		ClickyMines.Text = "Button Mine: ON"
	else
		clickymineactive = false
		ClickyMines.Text = "Button Mine: OFF"
	end
end)

spawn (function()
	while wait(0.2) do
		if clickymineactive == true then
			local clickymines = myfac:GetChildren()
			for i =1, #clickymines do
				if clickymines[i].ClassName == "Model" then
					if clickymines[i].Model:findFirstChild("Button") then
						local de = clickymines[i].Model:GetChildren()
						for i =1, #de do
							if de[i].Name == "Button" then
								game.ReplicatedStorage.Click:FireServer(de[i])
							end
						end
					end
				end
			end
		end
	end
end)

AutoLoadout1Button.MouseButton1Down:connect(function()
	if autoloadout1 == false then
		autoloadout1 = true
		layoutempty = true
		AutoLoadout1Button.Text = "Auto Loadout 1: ON"
	else
		autoloadout1 = false
		AutoLoadout1Button.Text = "Auto Loadout 1: OFF"
	end
end)

spawn(function()
	while wait(0.2) do
		if autoloadout1 == true then
			if layoutempty == true then
				game:GetService("ReplicatedStorage").DestroyAll:InvokeServer()
				wait(1)
				game.Players.LocalPlayer.PlayerGui.GUI.Notifications.Visible = false
				game.Players.LocalPlayer.PlayerGui.GUI.Menu.Menu.Sounds.Message.Volume = 0
				game:GetService("ReplicatedStorage").Layouts:InvokeServer("Load", "Layout1")
				wait(3)
				layoutempty = false
			end
			while autoloadout1 == true do
				local factoryitems = myfac:GetChildren()
				for i =1, #factoryitems do
					if factoryitems[i].ClassName == "Model" then 
						layoutempty = false
						break
					end
					layoutempty = true
				end
				if layoutempty then
					if autorebirth == true then
						print("ReBirthed to Life ".. rebirthilfe .. " at ".. rebirthcashvalue ..". Plot Empty. Layout 1 Reloading..")
					end
					wait(3)
					game:GetService("ReplicatedStorage").DestroyAll:InvokeServer()
					wait(1)
					game.Players.LocalPlayer.PlayerGui.GUI.Notifications.Visible = false
					game.Players.LocalPlayer.PlayerGui.GUI.Menu.Menu.Sounds.Message.Volume = 0
					game:GetService("ReplicatedStorage").Layouts:InvokeServer("Load", "Layout1")
				end
				wait(3)
			end
		else
			game.Players.LocalPlayer.PlayerGui.GUI.Menu.Menu.Sounds.Message.Volume = 0.5
			game.Players.LocalPlayer.PlayerGui.GUI.Notifications.Visible = true
		end
		wait(2)
	end
end)

AutoRebirthButton.MouseButton1Down:connect(function()
	if autorebirth == false then
		autorebirth = true
		AutoRebirthButton.Text = "Auto Rebirth 1: ON"
	else
		autorebirth = false
		AutoRebirthButton.Text = "Auto Rebirth 1: OFF"
	end
	while autorebirth == true do
		Plrs = game:GetService("Players")
		MyPlr = Plrs.LocalPlayer
		rebirthcashvalue = tostring(Plrs.LocalPlayer.leaderstats.Cash.Value)
		rebirthilfe = MyPlr.leaderstats.Life.Value
		rebirthilfe = tostring(rebirthilfe)
		game:GetService'ReplicatedStorage'.Rebirth:InvokeServer()
		wait(2)
	end
end)

OreBoostButton.MouseButton1Down:connect(function()
	if oreboost == false then
		oreboost = true
		playerselected = false
		basefound = false
		OreBoostButton.Text = "Ore Booster: ON"
	else
		oreboost = false
		basefound = false
		OreBoostButton.Text = "Ore Booster: OFF"
	end
end)

function showplayeritems()
	local pp1 = game.Players:GetChildren()
	for i=1,#pp1 do
		baseplyr = tostring(pp1[i])
		if baseplyr == PlayerBase.Text then
			playerselected = true
			basename = tostring(game.Players[tostring(baseplyr)].PlayerTycoon.Value)
			print("Player " ..tostring(PlayerBase.Text).. " selected. " ..basename.. " found")
			break
		end
	end
	if playerselected then
		local basepart = workspace.Tycoons[tostring(basename)]:GetChildren()
		for i=1,#basepart do
			if basepart[i].Name ~= "Portable Ore Advancer" then
				if basepart[i].ClassName == "Model" then
					if basepart[i].Model:findFirstChild("Upgrade") then
						if basepart[i].Model.Upgrade:findFirstChild("Cloned") then
						else
							print("Upgrader placed: " ..tostring(basepart[i]))
						end
					end
				end
			end
		end
		print(" ")
	else
		print("Player base not found")
		playerselected = false
	end
end

spawn (function()
	while true do
		wait(0.01)
			if oreboost then
				if basefound ~= true then
					if PlayerBase.Text == "Best Base Player" then
						print("Type the player name with the best base to use")
						oreboost = false
						OreBoostButton.Text = "Ore Boost: OFF"
					else
						local pp1 = game.Players:GetChildren()
						for i=1,#pp1 do
							baseplyr = tostring(pp1[i])
							if baseplyr == PlayerBase.Text then
								playerselected = true
								break
							end
						end
					end
					if not playerselected then
						print("Player not Found. Ending Process")
						oreboost = false
						OreBoostButton.Text = "Ore Boost: OFF"
					else
						basename = tostring(game.Players[tostring(baseplyr)].PlayerTycoon.Value)
						basefound = true
					end
					if not basefound then
						print("Base not found. Ending process")
						oreboost = false
						OreBoostButton.Text = "Ore Boost: OFF"
					else
						print ("Starting Ore Boost")
					end
				end
			end
			while oreboost == true do
				wait()
				if basefound then
					while basefound == true do
						if oreboost then
							wait()
                            print(basename)
							local basepart = workspace.Tycoons[basename]:GetChildren()
							for i=1,#basepart do
								if basepart[i].Name ~= "Portable Ore Advancer" then
									if basepart[i].ClassName == "Model" then
										if basepart[i].Model:findFirstChild("Upgrade") then
											if basepart[i].Model.Upgrade:findFirstChild("Cloned") then
											else
												local decoy = basepart[i].Model.Upgrade:Clone()
												decoy.Parent = basepart[i].Model
												decoy.Name = "UpgradeDecoy"
												local tag = Instance.new("StringValue",basepart[i].Model.Upgrade)
												tag.Name = "Cloned"
												local deco = basepart[i].Model.Upgrade:GetChildren()
												for i=1,#deco do
													if deco[i].ClassName == "ParticleEmitter" then
														deco[i]:remove()
													end
													if deco[i].Name == "Mesh" then
														deco[i]:remove()
													end
													if deco[i].Name == "Smoke" then
														deco[i]:remove()
													end
													if deco[i].Name == "Fire" then
														deco[i]:remove()
													end
												end
												if basepart[i].Model.Upgrade:findFirstChild("Error") then
													basepart[i].Model.Upgrade.Error.Volume = 0
												end
												upgradeitem = tostring(basepart[i])
												basepart[i].Model.Upgrade.Transparency = 1
												basepart[i].Model.Upgrade.Size = Vector3.new(5,5,5)
												basepart[i].Model.Upgrade.CFrame = CFrame.new(workspace.Tycoons[tostring(game.Players.LocalPlayer.PlayerTycoon.Value)][grabmine()].Model.Drop.Position)
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
end)

workspace:FindFirstChild("DroppedParts")[mytycoon.Name].ChildAdded:Connect(function(child)
    if child:IsA("BasePart") then
        spawn(function()
            if oreboost then
                task.wait()
                child.Anchored = true
                task.wait(0.25)
                child.Position = mytycoon[grabfurnace()].Model.Lava.Position
                child.Anchored = false
            end
        end)
    end
end)
