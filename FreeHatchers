local Egg = game:GetService("Workspace").Eggs:GetChildren()
local EggTable = {}

for i,v in pairs(Egg) do
    table.insert(EggTable, v.Name)
end

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

getgenv().Egg = "Egg"
getgenv().Amount = "Buy1"

local Window = Rayfield:CreateWindow({
	Name = "Free Hatchers",
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
 
local Tab = Window:CreateTab("Hatching")
local Main = Tab:CreateSection("Main")
local Tab1 = Window:CreateTab("Other")
local Main1 = Tab1:CreateSection("Main")

local Toggle = Tab:CreateToggle({
   Name = "Auto Hatch",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
       _G.autohatch = Value
       while _G.autohatch == true do
           wait()
           local args = {
    [1] = getgenv().Egg,
    [2] = getgenv().Amount
}

game:GetService("ReplicatedStorage").GameClient.Events.RemoteFunction.BuyEgg:InvokeServer(unpack(args))
       end
   end,
})

local Toggle2 = Tab:CreateButton({
   Name = "Hatch",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
           local args = {
    [1] = getgenv().Egg,
    [2] = getgenv().Amount
}

game:GetService("ReplicatedStorage").GameClient.Events.RemoteFunction.BuyEgg:InvokeServer(unpack(args))
   end,
})

local Dropdown = Tab:CreateDropdown({
   Name = "Egg",
   Options = EggTable,
   CurrentOption = "Option 1",
   Flag = "Dropdown1",
   Callback = function(Option)
       getgenv().Egg = Option
   end,
})

local Dropdown = Tab:CreateDropdown({
   Name = "Amount",
   Options = {"Buy1","Buy3","Buy8"},
   CurrentOption = "Option 1",
   Flag = "Dropdown1",
   Callback = function(Option)
       getgenv().Amount = Option
   end,
})

local Toggle = Tab:CreateToggle({
   Name = "Auto Craft All",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
       _G.autocraft = Value
       while _G.autocraft == true do
           wait()
           game:GetService("ReplicatedStorage").Marchy.PetRemotes.Generic.CraftAll:FireServer()
       end
   end,
})

local Toggle = Tab1:CreateToggle({
   Name = "AutoCollect Coins",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
       _G.autoCollect = Value
while _G.autoCollect == true do
    wait()
    for i,v in pairs(workspace:GetChildren()) do
    if v:IsA("MeshPart") then
        v.Transparency = 1
        v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    end
end
end
   end,
})

getgenv().Rebirths = 1

local Toggle = Tab1:CreateToggle({
   Name = "Auto Rebirth [Not Working]",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
       _G.autoreb = Value
       while _G.autoreb == true do
           wait()
           local args = {
    [1] = getgenv().Rebirths
}

game:GetService("ReplicatedStorage").Events.Rebirth:FireServer(unpack(args))
       end
   end,
})
getgenv().RebirthSliderRange = 10000

local Slider = Tab1:CreateSlider({
   Name = "Rebirths Amount",
   Range = {0, getgenv().RebirthSliderRange},
   Increment = 1,
   Suffix = "",
   CurrentValue = 10,
   Flag = "Slider1",
   Callback = function(Value)
       getgenv().Rebirths = Value
   end,
})

Rayfield:LoadConfiguration()
