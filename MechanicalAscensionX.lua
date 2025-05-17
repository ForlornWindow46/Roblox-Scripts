local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "Forlorn Hub",
    LoadingTitle = "Loading...",
    LoadingSubtitle = "By ForlornW46",
    ConfigurationSaving = {
        Enabled = false
    },
    KeySystem = false
})

local main = Window:CreateTab("Main", 4483345998)
local misc = Window:CreateTab("Misc", 4483345998)
local credits = Window:CreateTab("Credits", 4483345998)

main:CreateSection("Base")
misc:CreateSection("Client/Player")
credits:CreateSection("Credits")

local remotewait = 1
local waittime = 0.5
local oreboost = false
local autobox = false
local autocoin = false
local autorebirth = false
local autoremote = false
local antiafk = false
local autoload = false

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

local baseteslas = {
    "AfterShock",
}

local tyc = nil
for i, v in ipairs(workspace.Bases:GetChildren()) do
    if v.BaseOwner.Value == game.Players.LocalPlayer then
        tyc = v
    end
end

local drops = tyc.Ores
local virtualuser = game:GetService("VirtualUser")

local function notify(text)
    Rayfield:Notify({
       Title = text,
       Content = "Forlorn Hub",
       Duration = 4,
       Image = 4483362458,
    })
end

local function grabfurnace()
    for _, v in pairs(tyc.Items:GetChildren()) do
        if v:IsA("Model") then
            local model = v:FindFirstChild("Model")
            if model and model:FindFirstChild("Process") then
                return v
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
    drop.Anchored = false
    drop.CFrame = CFrame.new(tyc.Planes.Main.Position + Vector3.new(0, 40, 0))
    task.wait(0.1)
    drop.Anchored = true

    --[[local usedTeslas = {}
    for _, teslaName in ipairs(baseteslas) do
        for _, upg in ipairs(tyc.Items:GetChildren()) do
            if upg.Name == teslaName and not usedTeslas[teslaName] and upg:FindFirstChild("Model") and upg:FindFirstChild("Model"):FindFirstChild("Upgrade") then
                drop.Anchored = false
                drop.CFrame = upg.Model.Upgrade.CFrame
                task.wait(0.05)
                drop.Anchored = true
                usedTeslas[teslaName] = true
                break
            end
        end
    end]]--

    for _, upg in ipairs(tyc.Items:GetChildren()) do
        if not isTesla(upg.Name) and upg:FindFirstChild("Model") then
            local model = upg.Model
            local upgradePart = nil
            
            if model:FindFirstChild("MeshPart") then
                upgradePart = model.MeshPart
            elseif model:FindFirstChild("Part") then
                upgradePart = model.Part
            end

            if upgradePart and upgradePart:IsA("BasePart") then
                drop.Anchored = false
                drop.CFrame = upgradePart.CFrame
                task.wait(0.05)
                drop.Anchored = true
            end
        end
    end
    
    local furnaceItem = grabfurnace()
    if furnaceItem and furnaceItem:FindFirstChild("Model") then
        local lava = furnaceItem.Model:FindFirstChild("Process")
        if lava and lava:IsA("BasePart") then
            drop.Anchored = true
            drop:PivotTo(lava.CFrame * CFrame.new(0, 1, 0))
            task.wait(0.25)
            drop.Anchored = false
        end
    end
end

drops.ChildAdded:Connect(function(child)
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
                upg.Model.Upgrade.CFrame = CFrame.new(tyc.Planes.Main.Position + Vector3.new(0, 40, 0))
            end
        end
    end
end

main:CreateDropdown({
    Name = "Base Material",
    Options = {
        "Brick", "Cobblestone", "Concrete", "CorrodedMetal", "DiamondPlate", "Fabric",
        "Foil", "Glass", "Granite", "Grass", "Ice", "Marble", "Metal", "Neon",
        "Pebble", "Plastic", "Sand", "Slate", "SmoothPlastic", "Wood"
    },
    CurrentOption = "Slate",
    Callback = function(Value)
        local mat = Enum.Material[Value[1]]
        if mat then
            tyc.Planes.Main.Material = mat
        else
            tyc.Planes.Main.Material = Enum.Material.Slate
        end
    end
})

main:CreateButton({
    Name = "TP to Base",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(tyc.Planes.Main.Position + Vector3.new(0, 3.5, 0))
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
    Name = "Grab Coins",
    Callback = function()
        for i, v in pairs(workspace.Game.Coins:GetChildren()) do
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Position)
            task.wait()
        end
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(tyc.Planes.Main.Position + Vector3.new(0, 3.5, 0))
    end
})

main:CreateButton({
    Name = "Grab Crates",
    Callback = function()
        for i, v in pairs(workspace.Game.Crated:GetChildren()) do
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Position)
            task.wait(waittime)
        end
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(tyc.Planes.Main.Position + Vector3.new(0, 3.5, 0))
    end
})

main:CreateToggle({
    Name = "Auto Grab Coins",
    CurrentValue = false,
    Callback = function(Value)
        autocoin = Value
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
        for i, v in pairs(tyc.Ores:GetChildren()) do
            v.Position = tyc.Planes.Main.Position
            v.Transparency = 1
            v.Anchored = false
        end
        notify("Destroyed All Ores")
    end
})

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

credits:CreateLabel("Made By ForlornW46")

credits:CreateButton({
    Name = "Destroy Forlorn Hub",
    Callback = function()
        Rayfield:Destroy()
    end
})

spawn(function()
    while task.wait(0.1) do
        if runKey ~= shouldrun then return end
        if autobox and #workspace.Game.Crates:GetChildren() > 0 then
            for i, v in pairs(workspace.Game.Crates:GetChildren()) do
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Position)
                task.wait(waittime)
            end
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(tyc.Planes.Main.Position + Vector3.new(0, 3, 0))
        end
        if autocoin and #workspace.Game.Coins:GetChildren() > 0 then
            for i, v in pairs(workspace.Game.Coins:GetChildren()) do
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Position)
                task.wait(waittime)
            end
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(tyc.Planes.Main.Position + Vector3.new(0, 3, 0))
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

game.Players.LocalPlayer.Idled:Connect(function()
    if runKey ~= shouldrun then return end
    if antiafk then
        virtualuser:CaptureController()
        virtualuser:ClickButton2(Vector2.new())
    end
end)
