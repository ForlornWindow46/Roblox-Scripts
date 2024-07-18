_G.rebirth = true
_G.layout = true

spawn(function()
    while _G.layout == true do
        wait(1)
        game.ReplicatedStorage.Layouts:InvokeServer("Load", "Layout1")
        wait(5)
        game.ReplicatedStorage.Layouts:InvokeServer("Load", "Layout3")
        game.Players.LocalPlayer.Rebirths.Changed:Wait()
    end
end)

spawn(function()
    while _G.rebirth == true do
		game:GetService'ReplicatedStorage'.Rebirth:InvokeServer()
		wait(2)
	end
end)
