local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

--// Create the UI Window
local Window = Rayfield:CreateWindow({
    Name = "Forlorn Hub",
    LoadingTitle = "Loading...",
    LoadingSubtitle = "By ForlornW46",
    ConfigurationSaving = {
        Enabled = false
    },
    KeySystem = false
})

--// Define Tabs
local main = Window:CreateTab("Main", 4483345998)
local layouts = Window:CreateTab("Layouts", 4483345998)
local misc = Window:CreateTab("Misc", 4483345998)
local credits = Window:CreateTab("Credits", 4483345998)

--// Create Sections
main:CreateSection("Base")
layouts:CreateSection("Layouts")
misc:CreateSection("Client/Player")
credits:CreateSection("Credits")

--// Replace global variables with locals
local remotewait = 1
local waittime = 0.5
local oreboost = false
local autobox = false
local autorebirth = false
local autoremote = false
local antiafk = false
local autoload = false

--// Utility: Generates a numeric string of the given length
local function generatestring(length)
    local charset = "123456789"
    local result = ""
    for _ = 1, length do
        local rand = math.random(1, #charset)
        result = result .. charset:sub(rand, rand)
    end
    return tonumber(result)
end
local shouldrun = generatestring(20)
local runKey = shouldrun

local slf = false
local sls = false
local slt = false

local l1 = "Layout1"
local l2 = "Layout1"
local l3 = "Layout1"

local baseteslas = {
    "All For One", "Voided Black Dwarf", "Black Dwarf", "Hyperspace", 
    "Tesla Refuter", "Data Destroyer", "Tesla Resetter", "The Final Upgrader", 
    "One For All", "Prismatic Genesis"
}

--// Get the player's Tycoon from workspace.Tycoons
local tyc = nil
for i, v in ipairs(workspace.Tycoons:GetChildren()) do
    if v.Owner.Value == game.Players.LocalPlayer.Name then
        tyc = v
        break
    end
end

local drops = workspace.DroppedParts
local virtualuser = game:GetService("VirtualUser")

--// Replace OrionLib notifications with Rayfield's Notify
local function notify(text)
    Rayfield:Notify({
        Title = "Forlorn Hub",
        Content = text,
        Duration = 5,
        Image = "rbxassetid://4483345998",
        Actions = {
            Ignore = {
                Name = "Okay",
                Callback = function() end
            }
        }
    })
end

--// Utility Functions
local function grabfurnace()
    for _, v in pairs(tyc:GetChildren()) do
        if v:IsA("Model") then
            local model = v:FindFirstChild("Model")
            if model and model:FindFirstChild("Lava") and not model:FindFirstChild("Lava"):FindFirstChild("TeleportSend") then
                return v.Name
            end
        end
    end
    return false
end

local function isTesla(upgName)
    for _, teslaName in ipairs(baseteslas) do
        if upgName == teslaName then
            return true
        end
    end
    return false
end

local function upgrade(drop)
    drop.Transparency = 1
    drop.Anchored = false
    drop.CFrame = CFrame.new(tyc.Base.Position + Vector3.new(0, 40, 0))
    task.wait(0.1)
    drop.Anchored = true

    local usedTeslas = {}
    for _, teslaName in ipairs(baseteslas) do
        for _, upg in ipairs(tyc:GetChildren()) do
            if upg.Name == teslaName and not usedTeslas[teslaName] and upg:FindFirstChild("Model") and upg:FindFirstChild("Model"):FindFirstChild("Upgrade") then
                drop.Anchored = false
                drop.CFrame = upg.Model.Upgrade.CFrame
                task.wait(0.05)
                drop.Anchored = true
                usedTeslas[teslaName] = true
                break
            end
        end
    end

    for _, upg in ipairs(tyc:GetChildren()) do
        if not isTesla(upg.Name) and upg:FindFirstChild("Model") and upg:FindFirstChild("Model"):FindFirstChild("Upgrade") then
            drop.Anchored = false
            local upgradePart = upg.Model.Upgrade
            drop.CFrame = upgradePart.CFrame
            task.wait(0.05)
            drop.Anchored = true
        end
    end
    drop.Anchored = true
    drop:PivotTo(tyc[grabfurnace()].Model.Lava.CFrame * CFrame.new(0, 1, 0))
    task.wait(0.25)
    drop.Anchored = false
end

drops[tyc.Name].ChildAdded:Connect(function(child)
    if oreboost then
        upgrade(child)
    end
end)

local function createDuplicates()
    for _, upg in ipairs(tyc:GetChildren()) do
        if not isTesla(upg.Name) and upg:FindFirstChild("Model") and upg:FindFirstChild("Model"):FindFirstChild("Upgrade") then
            if not upg.Model.Upgrade:FindFirstChild("Cloned") then
                local decoy = upg.Model.Upgrade:Clone()
                decoy.Parent = upg.Model
                decoy.Name = "UpgradeDecoy"
                local tag = Instance.new("StringValue", upg.Model.Upgrade)
                tag.Name = "Cloned"
                upg.Model.Upgrade.Transparency = 1
                upg.Model.Upgrade.Size = Vector3.new(5, 5, 5)
                upg.Model.Upgrade.CFrame = CFrame.new(tyc.Base.Position + Vector3.new(0, 40, 0))
            end
        end
    end
end

--// Main Tab Controls

main:CreateSlider({
    Name = "Conveyor Speed Multi",
    Range = {0, 10},
    Increment = 0.1,
    Suffix = "",
    CurrentValue = 1.0,
    Callback = function(Value)
        tyc.AdjustSpeed.Value = Value
    end
})

main:CreateDropdown({
    Name = "Base Material",
    Options = {"Brick", "Cobblestone", "Concrete", "CorrodedMetal", "DiamondPlate", "Fabric", "Foil", "Glass", "Granite", "Grass", "Ice", "Marble", "Metal", "Neon", "Pebble", "Plastic", "Sand", "Slate", "SmoothPlastic", "Wood", "WoodPlanks"},
    CurrentOption = "Slate",
    Callback = function(Value)
        tyc.Base.Material = Enum.Material[Value]
    end
})

main:CreateButton({
    Name = "TP to Base",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(tyc.Base.Position + Vector3.new(0, 3.5, 0))
    end
})

main:CreateSection("Boxes")

main:CreateSlider({
    Name = "Box Grab Wait Time",
    Range = {0, 10},
    Increment = 0.1,
    Suffix = " sec",
    CurrentValue = 1.0,
    Callback = function(Value)
        waittime = Value
    end
})

main:CreateButton({
    Name = "Grab Boxes",
    Callback = function()
        for i, v in pairs(workspace.Boxes:GetChildren()) do
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Position)
            task.wait(waittime)
        end
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(tyc.Base.Position + Vector3.new(0, 3.5, 0))
    end
})

main:CreateToggle({
    Name = "Auto Grab Boxes",
    CurrentValue = false,
    Callback = function(Value)
        autobox = Value
    end
})

main:CreateSection("Ores")

main:CreateToggle({
    Name = "Ore Boost",
    CurrentValue = false,
    Callback = function(Value)
        oreboost = Value
        if oreboost then
            notify("Ore Boost Enabled!")
        else
            notify("Ore Boost Disabled!")
        end
    end
})

main:CreateButton({
    Name = "Destroy Ores",
    Callback = function()
        for i, v in pairs(workspace.DroppedParts[tyc.Name]:GetChildren()) do
            v.Position = tyc.Base.Position
            v.Transparency = 1
            v.Anchored = false
        end
        notify("Destroyed All Ores")
    end
})

main:CreateSection("Remote Mine")

main:CreateSlider({
    Name = "Remote Mine Wait Time",
    Range = {0, 10},
    Increment = 0.1,
    Suffix = " sec",
    CurrentValue = 1.0,
    Callback = function(Value)
        remotewait = Value
    end
})

main:CreateToggle({
    Name = "Auto Remote Mine",
    CurrentValue = false,
    Callback = function(Value)
        autoremote = Value
    end
})

--// Misc Tab Controls

misc:CreateSlider({
    Name = "WalkSpeed",
    Range = {0, 360},
    Increment = 1,
    Suffix = "",
    CurrentValue = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end
})

misc:CreateSlider({
    Name = "JumpPower",
    Range = {0, 360},
    Increment = 1,
    Suffix = "",
    CurrentValue = game.Players.LocalPlayer.Character.Humanoid.JumpPower,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
    end
})

misc:CreateSlider({
    Name = "FOV",
    Range = {0, 120},
    Increment = 1,
    Suffix = "",
    CurrentValue = workspace.CurrentCamera.FieldOfView,
    Callback = function(Value)
        workspace.CurrentCamera.FieldOfView = Value
    end
})

misc:CreateToggle({
    Name = "Anti-AFK",
    CurrentValue = false,
    Callback = function(Value)
        antiafk = Value
        if antiafk then
            notify("Anti-AFK Enabled!")
        else
            notify("Anti-AFK Disabled!")
        end
    end
})

--// Layouts Tab Controls

layouts:CreateDropdown({
    Name = "First Layout",
    Options = {"Layout1", "Layout2", "Layout3"},
    CurrentOption = "Layout1",
    Callback = function(Value)
        l1 = Value
    end
})

layouts:CreateDropdown({
    Name = "Second Layout",
    Options = {"Layout1", "Layout2", "Layout3"},
    CurrentOption = "Layout1",
    Callback = function(Value)
        l2 = Value
    end
})

layouts:CreateDropdown({
    Name = "Third Layout",
    Options = {"Layout1", "Layout2", "Layout3"},
    CurrentOption = "Layout1",
    Callback = function(Value)
        l3 = Value
    end
})

layouts:CreateSection("Settings")
layouts:CreateLabel("layouts selected by order to load")

layouts:CreateToggle({
    Name = "Load First Layout",
    CurrentValue = false,
    Callback = function(Value)
        slf = Value
    end
})

layouts:CreateToggle({
    Name = "Load Second Layout",
    CurrentValue = false,
    Callback = function(Value)
        sls = Value
    end
})

layouts:CreateToggle({
    Name = "Load Third Layout",
    CurrentValue = false,
    Callback = function(Value)
        slt = Value
    end
})

layouts:CreateSection("Other Settings")

layouts:CreateToggle({
    Name = "Layout Loading",
    CurrentValue = false,
    Callback = function(Value)
        autoload = Value
    end
})

layouts:CreateToggle({
    Name = "Auto Rebirth",
    CurrentValue = false,
    Callback = function(Value)
        autorebirth = Value
    end
})

--// Credits Tab Controls

credits:CreateLabel("Made By ForlornW46")

credits:CreateButton({
    Name = "Destroy Forlorn Hub",
    Callback = function()
        Rayfield:Destroy()
    end
})

--// Spawns & Loops

spawn(function()
    while task.wait(0.1) do
        if runKey ~= shouldrun then return end
        if autobox and #workspace.Boxes:GetChildren() > 0 then
            for i, v in pairs(workspace.Boxes:GetChildren()) do
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Position)
                task.wait(waittime)
            end
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(tyc.Base.Position + Vector3.new(0, 3, 0))
        end
    end
end)

spawn(function()
    while wait(1) do
        if runKey ~= shouldrun then return end
        if oreboost then
            if tyc then
                createDuplicates()
            end
            wait(1)
        end
    end
end)

spawn(function()
    while true do
        if runKey ~= shouldrun then return end
        wait(remotewait)
        if autoremote then
            game:GetService('ReplicatedStorage').RemoteDrop:FireServer()
        end
    end
end)

spawn(function()
    while task.wait(1) do
        if runKey ~= shouldrun then return end
        if autorebirth then
            game.ReplicatedStorage.Rebirth:InvokeServer()
        end
    end
end)

spawn(function()
    while wait(1) do
        if runKey ~= shouldrun then return end
        if autoload then
            if slf then
                game.ReplicatedStorage.Layouts:InvokeServer("Load", l1)
                game.Players.LocalPlayer.leaderstats.Cash.Changed:Wait()
            end
            if sls then
                game.ReplicatedStorage.Layouts:InvokeServer("Load", l2)
                game.Players.LocalPlayer.leaderstats.Cash.Changed:Wait()
            end
            if slt then
                game.ReplicatedStorage.Layouts:InvokeServer("Load", l3)
                game.Players.LocalPlayer.leaderstats.Cash.Changed:Wait()
            end
            game.Players.LocalPlayer.Rebirths.Changed:Wait()
            task.wait(0.5)
        end
    end
end)

game.Players.LocalPlayer.Idled:Connect(function()
    if runKey ~= shouldrun then return end
    if antiafk then
        virtualuser:CaptureController()
        virtualuser:ClickButton2(Vector2.new())
    end
end)
