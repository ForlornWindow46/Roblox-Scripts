if not game.Loaded then
    game.Loaded:Wait()
    wait(1)
end

if _G.forlornicusloadedyes == false or _G.forlornicusloadedyes == nil then
	_G.forlornicusloadedyes = true
	local Executor = Instance.new("ScreenGui")
	local Main = Instance.new("Frame")
	local Title = Instance.new("TextLabel")
	local Close = Instance.new("TextButton")
	local Clear = Instance.new("TextButton")
	local Execute = Instance.new("TextButton")
	local UICorner = Instance.new("UICorner")
	local UIStroke = Instance.new("UIStroke")
	local ScrollingFrame = Instance.new("ScrollingFrame")
	local ScriptBox = Instance.new("TextBox")
	local UIPadding = Instance.new("UIPadding")
	
	Executor.Name = "Executor"
	Executor.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	Executor.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	
	Main.Name = "Main"
	Main.Parent = Executor
	Main.BackgroundColor3 = Color3.new(0.172549, 0.172549, 0.172549)
	Main.BorderColor3 = Color3.new(0, 0, 0)
	Main.BorderSizePixel = 0
	Main.Position = UDim2.new(0.276393831, 0, 0.259036154, 0)
	Main.Size = UDim2.new(0, 389, 0, 240)
	Main.ZIndex = 999999999
	
	Title.Name = "Title"
	Title.Parent = Main
	Title.BackgroundColor3 = Color3.new(0.121569, 0.121569, 0.121569)
	Title.BorderColor3 = Color3.new(0, 0, 0)
	Title.BorderSizePixel = 0
	Title.Size = UDim2.new(0, 389, 0, 34)
	Title.Font = Enum.Font.SourceSansBold
	Title.Text = "       Forlornicus - Simple Edition [80% UNC]"
	Title.TextColor3 = Color3.new(1, 1, 1)
	Title.TextSize = 14
	Title.TextXAlignment = Enum.TextXAlignment.Left
	
	Close.Name = "Close"
	Close.Parent = Main
	Close.BackgroundColor3 = Color3.new(1, 1, 1)
	Close.BackgroundTransparency = 1
	Close.BorderColor3 = Color3.new(0, 0, 0)
	Close.BorderSizePixel = 0
	Close.Position = UDim2.new(0.948780477, 0, 0, 0)
	Close.Size = UDim2.new(0, 21, 0, 21)
	Close.Font = Enum.Font.SourceSansBold
	Close.Text = "X"
	Close.TextColor3 = Color3.new(1, 1, 1)
	Close.TextSize = 14
	
	Clear.Name = "Clear"
	Clear.Parent = Main
	Clear.BackgroundColor3 = Color3.new(0.294118, 0.294118, 0.294118)
	Clear.BorderColor3 = Color3.new(1, 1, 1)
	Clear.BorderSizePixel = 2
	Clear.Position = UDim2.new(0.535343051, 0, 0.858333349, 0)
	Clear.Size = UDim2.new(0, 168, 0, 22)
	Clear.Font = Enum.Font.SourceSansBold
	Clear.Text = "Clear"
	Clear.TextColor3 = Color3.new(1, 1, 1)
	Clear.TextSize = 14
	
	Execute.Name = "Execute"
	Execute.Parent = Main
	Execute.BackgroundColor3 = Color3.new(0.294118, 0.294118, 0.294118)
	Execute.BorderColor3 = Color3.new(1, 1, 1)
	Execute.BorderSizePixel = 2
	Execute.Position = UDim2.new(0.0288733169, 0, 0.858333349, 0)
	Execute.Size = UDim2.new(0, 168, 0, 22)
	Execute.Font = Enum.Font.SourceSansBold
	Execute.Text = "Execute"
	Execute.TextColor3 = Color3.new(1, 1, 1)
	Execute.TextSize = 14
	
	UICorner.Parent = Main
	UIStroke.Parent = main
	UIStroke.LineJoinMode = Enum.LineJoinMode.Miter
	UIStroke.Color = Color3.fromRGB(255, 255, 255)
	
	ScrollingFrame.Parent = Main
	ScrollingFrame.Active = true
	ScrollingFrame.BackgroundColor3 = Color3.new(1, 1, 1)
	ScrollingFrame.BorderColor3 = Color3.new(0, 0, 0)
	ScrollingFrame.BorderSizePixel = 0
	ScrollingFrame.Position = UDim2.new(0.0282778703, 0, 0.174999997, 0)
	ScrollingFrame.Size = UDim2.new(0, 366, 0, 155)
	ScrollingFrame.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	ScrollingFrame.CanvasSize = UDim2.new(2000, 0, 2000, 0)
	ScrollingFrame.ScrollBarThickness = 5
	ScrollingFrame.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	
	ScriptBox.Name = "ScriptBox"
	ScriptBox.Parent = ScrollingFrame
	ScriptBox.BackgroundColor3 = Color3.new(0.388235, 0.388235, 0.388235)
	ScriptBox.BorderColor3 = Color3.new(1, 1, 1)
	ScriptBox.BorderSizePixel = 2
	ScriptBox.Size = UDim2.new(1, 0, 1, 0)
	ScriptBox.ClearTextOnFocus = false
	ScriptBox.Font = Enum.Font.ArialBold
	ScriptBox.MultiLine = true
	ScriptBox.PlaceholderColor3 = Color3.new(1, 1, 1)
	ScriptBox.PlaceholderText = "-- your script"
	ScriptBox.Text = "print(\"Hello, World!\")"
	ScriptBox.TextColor3 = Color3.new(1, 1, 1)
	ScriptBox.TextSize = 12
	ScriptBox.TextXAlignment = Enum.TextXAlignment.Left
	ScriptBox.TextYAlignment = Enum.TextYAlignment.Top
	
	UIPadding.Parent = ScriptBox
	UIPadding.PaddingBottom = UDim.new(0, 5)
	UIPadding.PaddingLeft = UDim.new(0, 5)
	UIPadding.PaddingRight = UDim.new(0, 5)
	UIPadding.PaddingTop = UDim.new(0, 5)
	
	
	local function YESFRVK_fake_script()
		local script = Instance.new('LocalScript', Close)
	
		local StarterGui = game.StarterGui
		
		script.Parent.MouseButton1Click:Connect(function()
			StarterGui:SetCore("SendNotification", {
				Title = "Forlornicus";
				Text = "Remember press 'Home' or 'Ins' to close or open";
				Duration = 5;
			})
			script.Parent.Parent.Visible = false
		end)
		
		game:GetService("UserInputService").InputBegan:Connect(function(inp)
			if inp.KeyCode == Enum.KeyCode.Home or inp.KeyCode == Enum.KeyCode.Insert then
				script.Parent.Parent.Position = UDim2.new(0,1,0,1)
				script.Parent.Parent.Visible = not script.Parent.Parent.Visible
			end
		end)
	end
	coroutine.wrap(YESFRVK_fake_script)()
	local function YETVFFD_fake_script()
		local script = Instance.new('LocalScript', Clear)
	
		script.Parent.MouseButton1Click:Connect(function()
			script.Parent.Parent.ScrollingFrame.ScriptBox.Text = ""
		end)
	end
	coroutine.wrap(YETVFFD_fake_script)()
	local function IXYLUF_fake_script()
		local script = Instance.new('LocalScript', Execute)
	
		script.Parent.MouseButton1Click:Connect(function()
			loadstring(script.Parent.Parent.ScrollingFrame.ScriptBox.Text)()
		end)
	end
	coroutine.wrap(IXYLUF_fake_script)()
	local function JDOGC_fake_script()
		local script = Instance.new('LocalScript', Main)
		
		local UIS = game:GetService('UserInputService')
		local frame = script.Parent
		local dragToggle = nil
		local dragSpeed = 0.25
		local dragStart = nil
		local startPos = nil
		
		local function updateInput(input)
			local delta = input.Position - dragStart
			local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
				startPos.Y.Scale, startPos.Y.Offset + delta.Y)
			game:GetService('TweenService'):Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
		end
		
		frame.InputBegan:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
				dragToggle = true
				dragStart = input.Position
				startPos = frame.Position
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragToggle = false
					end
				end)
			end
		end)
		
		UIS.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				if dragToggle then
					updateInput(input)
				end
			end
		end)
		
	end
	coroutine.wrap(JDOGC_fake_script)()
end