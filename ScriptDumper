local final = {'<roblox xmlns:xmime="http://www.w3.org/2005/05/xmlmime" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="http://www.roblox.com/roblox.xsd" version="4">'}
local hierarchy = {["NIL"] = {Class = "Folder", Children = {}}, ["LOADED MODULES"] = {Class = "Folder", Children = {}}}
local totalScriptCount = 0
local doneScripts = 0
local needsDecompile = {}
local loadedIds = {}
local startTime = tick()

local Settings = {
Scripts = {"LocalScript", "ModuleScript"},
Remotes = {"RemoteEvent", "RemoteFunction", "BindableEvent", "BindableFunction"},
Services = {"StarterPlayerScripts", "StarterCharacterScripts"},
Replace = {["'"] = "&apos;", ["\""] = "&quot;", ["<"] = "&lt;", [">"] = "&gt;", ["&"] = "&amp;"},
Threads = 5,
Version = 4,
}

local ignored = {
game:GetService("RobloxReplicatedStorage"),
game:GetService("CoreGui"),
game:GetService("CorePackages"), 
game:GetService("Chat"),
--game:GetService("StarterPlayer").StarterPlayerScripts.PlayerModule,
--game:GetService("Players").LocalPlayer.PlayerScripts.PlayerModule,
}

for _, plr in next, game:GetService("Players"):GetPlayers() do
if plr ~= game:GetService("Players").LocalPlayer then
ignored[#ignored + 1] = plr
ignored[#ignored + 1] = plr.Character
end
end

local viewPort = workspace.CurrentCamera.ViewportSize
local completeBar = Drawing.new("Square")
completeBar.Filled = true
completeBar.Size = Vector2.new(500, 25)
completeBar.Position = Vector2.new(viewPort.X / 2 - completeBar.Size.X / 2, viewPort.Y - 100)
completeBar.Color = Color3.new(0, 0, 0)
completeBar.Visible = true

local progressBar = Drawing.new("Square")
progressBar.Color = Color3.new(1, 1, 1)
progressBar.Filled = true
progressBar.Position = completeBar.Position
progressBar.Size = Vector2.new(0, 25)
progressBar.Color = Color3.new(1, 1, 1)
progressBar.Visible = true

local progressText = Drawing.new("Text")
progressText.Color = Color3.new(1, 1, 1)
progressText.Center = true
progressText.Size = progressBar.Size.Y
progressText.Position = progressBar.Position + Vector2.new(completeBar.Size.X / 2, 35)
progressText.Text = string.format("Welcome to savescirpts vee%d!", Settings.Version)
progressText.Color = Color3.new(1, 1, 1)
progressText.Visible = true

local credits = Drawing.new("Text")
credits.Color = Color3.new(1, 1, 1)
credits.Position = Vector2.new(viewPort.X - 100, viewPort.Y - 25)
credits.Size = 15
credits.Text = "turtle hub when?"
credits.Color = Color3.new(1, 1, 1)
credits.Visible = true

local function isCleared(itm)
for _, obj in next, ignored do
if itm == obj or itm:IsDescendantOf(obj) then
return false
end
end 
return true
end

local function getParentTree(itm)
local trees = {}
while itm.Parent ~= nil and itm.Parent ~= game do
itm = itm.Parent
table.insert(trees, 1, itm)
end
return trees
end

function getScripts(place, checkLoaded)
for _, item in next, place do
if typeof(item) == "Instance" and isCleared(item) then
if table.find(Settings.Remotes, item.ClassName) or table.find(Settings.Scripts, item.ClassName) then
local uniqueId = item:GetDebugId()
--print("Script Collected:", item:GetFullName())

if item.Parent == nil then
hierarchy["NIL"].Children[uniqueId] = {Class = item.ClassName, Ref = item, Children = {}}
else
local start = hierarchy
for _, branch in next, getParentTree(item) do
local branchId = branch:GetDebugId()
if start[branchId] == nil then
if game:FindService(branch.ClassName) or table.find(Settings.Services, branch.ClassName) then
start[branchId] = {Class = branch.ClassName, Ref = branch, Children = {}}
else
start[branchId] = {Class = "Folder", Ref = branch, Children = {}}
end
end
start = start[branchId].Children
end
start[uniqueId] = {Class = item.ClassName, Ref = item, Children = {}}
end

if checkLoaded then
if table.find(Settings.Scripts, item.ClassName) and not table.find(loadedIds, uniqueId) then
hierarchy["LOADED MODULES"].Children[uniqueId] = {Class = item.ClassName, Ref = item, Children = {}}
end
else
loadedIds[#loadedIds + 1] = uniqueId
end
end
end
end
end

wait(2)
progressText.Text = "Collecting scripts..."
getScripts(game:GetDescendants())
getScripts(getnilinstances())
getScripts(getloadedmodules(), true)
loadedIds = nil

local function makeInstance(class, name, scr)
final[#final + 1] = '<Item class="' .. class .. '" referent="RBX' .. #final .. '"><Properties>'
final[#final + 1] = '<string name="Name">' .. string.gsub(name, "['\"<>&]", Settings.Replace) .. '</string>'

if scr and table.find(Settings.Scripts, scr.ClassName) then
if scr.ClassName == "LocalScript" then
final[#final + 1] = '<bool name="Disabled">' .. tostring(scr.Disabled) .. '</bool>'
end
final[#final + 1] = '<ProtectedString name="Source"><![CDATA['
final[#final + 1] = "" -- haha funny stole from moon
final[#final + 1] = ']]></ProtectedString>'
needsDecompile[#needsDecompile + 1] = {Script = scr, Index = #final - 1}
end
final[#final + 1] = "</Properties>"
end

function saveHierarchy(tree)
for nm, obj in next, tree do
makeInstance(obj.Class, obj.Ref and obj.Ref.Name or nm, obj.Ref)
saveHierarchy(obj.Children)
final[#final + 1] = "</Item>"
end
end

progressText.Text = "Creating xml layout..."
saveHierarchy(hierarchy)
totalScriptCount = #needsDecompile
final[#final + 1] = "</roblox>"
progressText.Text = string.format("Decompiling %d scripts...", totalScriptCount)

local runningCount = Settings.Threads
for i=1, Settings.Threads do
spawn(function()
while #needsDecompile > 0 do
local info = table.remove(needsDecompile)
local result = decompile(info.Script, false, 30)
final[info.Index] = (result == "" and "-- Failed to decompile script, or script is empty" or result)
wait()
doneScripts = doneScripts + 1
progressBar.Size = Vector2.new(500 * doneScripts / totalScriptCount, progressBar.Size.Y)
progressText.Text = string.format("Decompiling scripts... (%d / %d)", doneScripts, totalScriptCount)
end
runningCount = runningCount - 1
end)
end

while runningCount > 0 do
wait(0.5)
end

wait(1)
progressBar.Remove()
completeBar.Remove()
local gameName = string.gsub(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name, "[^%w%s]", "")
local saveName = string.format("Scripts for %s (%d) [%d].rbxlx", string.gsub(gameName, "  ", " "), game.PlaceId, os.time())
writefile(saveName, table.concat(final, "\n"))
progressText.Text = string.format("Scripts have been saved to file %q, took %d seconds for %d scripts", saveName, tick() - startTime, totalScriptCount)
wait(5)
credits.Remove()
progressText.Remove()
