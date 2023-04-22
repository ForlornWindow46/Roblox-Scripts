
local RunService = game:GetService("RunService")
local IsStudio = RunService:IsStudio()

if not IsStudio then
	local mt = getrawmetatable(game)
	make_writeable(mt)

	local mouse = game:GetService("Players").LocalPlayer:GetMouse()
	local getGc = getgc
	local getInfo = debug.getinfo or getinfo
	local getUpvalue = debug.getupvalue or getupvalue or getupval
	local getConstants = debug.getconstants or getconstants or getconsts
	local isXClosure = is_synapse_function or issentinelclosure or is_protosmasher_closure or is_sirhurt_closure or checkclosure
	local isLClosure = islclosure or is_l_closure or (iscclosure and function(f) return not iscclosure(f) end)
	assert(getGc and getInfo and getConstants and isXClosure, "Your exploit is not supported")
	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer
	local Mouse = LocalPlayer:GetMouse()
	local toggle = false
	local tabDown = false
	local Lighting = game:FindService("Lighting")
	wait(2)
	local Remote = game:GetService("ReplicatedStorage").Shared.Remotes.ContextButton
	local Sync = game:GetService("ReplicatedStorage").Shared.Remotes.ArsenalResync
	local Players = game:GetService("Players")
	local Player = Players.LocalPlayer
	local Team = Player.TeamColor
	local closN = {
		[1] = "GetState",
		[2] = "Enum",
		[3] = "HumanoidStateType",
		[4] = "Freefall",
		[5] = Enum.HumanoidStateType.Freefall,
		[6] = "Jumping"
	}


	local input = game:GetService("UserInputService")
	local player = game.Players.LocalPlayer
	local myTeam = game.Players.LocalPlayer.TeamColor
	function onKeyPress(actionName, userInputState, inputObject)
		if userInputState == Enum.UserInputState.Begin then
			if toggle == false then
				toggle = true
				warn("Refill Enabled [T]")
				local z = game.Workspace.Structures:GetChildren()
				for i=1, #z do
					if z[i].Name == "Refill Station" then 
						local Team = z[i]:GetChildren()
						for i=1, #Team do
							if Team[i].Name == "TeamColor" and Team[i].BrickColor == myTeam then
								local model1 = Team[i].Parent:GetChildren()
								for i=1, #model1 do
									if model1[i].Name == "RefillConsole" then 
										local cc = model1[i]:GetChildren()
										for i=1, #cc do
											for __,v in pairs(cc) do
												if v.Name == "Part" and v:IsA("Part") then
													Boxhit1 = v
												end
											end
										end
									end
								end
							end
						end
					end
				end;

			else
				toggle = false
				warn("Refill Disabled [T]")

			end
		end
	end



	faces = {"Front", "Back", "Bottom", "Left", "Right", "Top"}


	local function Box(obj)
		local Children = obj:GetDescendants()

		for _, v in ipairs(Children) do
			if v:IsA("Part") or v:IsA("MeshPart") or v:IsA("BasePart") or v:IsA("UnionOperation") or v:IsA("WedgePart") then
				for i = 0, 5 do
					surface = Instance.new("SurfaceGui", v) 
					surface.Face = Enum.NormalId[faces[i + 1]] 
					surface.AlwaysOnTop = true


					frame = Instance.new("Frame", surface)
					frame.Size = UDim2.new(1, 0, 1, 0)
					frame.BorderSizePixel = 0
					frame.BackgroundTransparency = 0.7
					frame.BackgroundColor3 = game.Players[game.Players.LocalPlayer.Name].TeamColor.Color
				end
			end
		end
	end






	function getnearest()
		local nearest
		local kanker=math.huge
		for i,v in next, game:GetService("Players"):GetChildren() do
			if v and v.Character and v~=game:GetService("Players").LocalPlayer and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("Humanoid").Health>0 then
				if teamcheck then
					if v.Team ~= game.Players.LocalPlayer.Team then
						local worldPoint = v.Character.Head.Position
						local vector, onScreen = workspace.CurrentCamera:WorldToScreenPoint(worldPoint)
						local magnitude = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(vector.X, vector.Y)).magnitude
						if kanker>magnitude and onScreen and magnitude<250 then
							kanker=magnitude
							nearest=v
						end
					end
				else
					local worldPoint = v.Character.Head.Position
					local vector, onScreen = workspace.CurrentCamera:WorldToScreenPoint(worldPoint)
					local magnitude = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(vector.X, vector.Y)).magnitude
					if kanker>magnitude and onScreen and magnitude<250 then
						kanker=magnitude
						nearest=v
					end
				end
			end
		end
		return nearest
	end
	local function matchConstants(closure, list)
		if not list then
			return true
		end

		local constants = getConstants(closure)

		for index in pairs(list) do
			if not constants[index] then
				return false
			end
		end

		return true
	end
	game.ContextActionService:BindAction("keyPress", onKeyPress, false, Enum.KeyCode.T)
	input.InputBegan:connect(function(k)
		local key = k.KeyCode
		if key == Enum.KeyCode.E then
			tabDown = true
		end
	end)

	input.InputEnded:connect(function(k)
		local key = k.KeyCode
		if key == Enum.KeyCode.E then
			tabDown = false
		end
	end)
	local function searchClosure(script, name, upvalueIndex, constants)
		for _i, v in pairs(getGc()) do
			local parentScript = rawget(getfenv(v), "script")

			if type(v) == "function" and 
				isLClosure(v) and 
				not isXClosure(v) and 
				(
					(script == nil and parentScript.Parent == nil) or script == parentScript
				) 
					and pcall(getUpvalue, v, upvalueIndex)
			then
				if ((name and name ~= "Unnamed function") and getInfo(v).name == name) and matchConstants(v, constants) then
					return v
				elseif (not name or name == "Unnamed function") and matchConstants(v, constants) then
					return v
				end
			end
		end
	end
	pcall(function()
		if game.Players.LocalPlayer.Character:FindFirstChild('IridiumTank') then
			cloE = searchClosure(game:GetService("Players").LocalPlayer.Character.IridiumTank.NavigationScript, "thrust", 13, closN)
			closure1 = searchClosure(game:GetService("Players").LocalPlayer.Character.IridiumTank.NavigationScript, "thrust", 1, closN)
		else 
			game.Players.LocalPlayer.CharacterAdded:Connect(function()
				wait(1)
				cloE = searchClosure(game:GetService("Players").LocalPlayer.Character.IridiumTank.NavigationScript, "thrust", 13, closN)
				closure1 = searchClosure(game:GetService("Players").LocalPlayer.Character.IridiumTank.NavigationScript, "thrust", 1, closN)
			end)
		end
	end)
	game.Players.LocalPlayer.CharacterAdded:Connect(pcall(function(char)
		char:WaitForChild('IridiumTank')
		wait()
		cloE = searchClosure(game:GetService("Players").LocalPlayer.Character.IridiumTank.NavigationScript, "thrust", 13, closN)
		closure1 = searchClosure(game:GetService("Players").LocalPlayer.Character.IridiumTank.NavigationScript, "thrust", 1, closN)
	end))
	local Player            = game:GetService("Players").LocalPlayer;
	local ReplicatedStorage = game:GetService("ReplicatedStorage");
	local PlayerGui         = Player.PlayerGui;
	local setupvalue        = setupvalue or debug.setupvalue;
	_G.JetThrust = 17
	local Library           = loadstring(game:HttpGet("https://raw.githubusercontent.com/mkswlorn/My-Repo/main/UI"))();
	local MainWindow        = Library:CreateWindow("Forlorn Hub");
	local MainFolder      = MainWindow:AddFolder("Main");
	local CombatFolder      = MainWindow:AddFolder("Combat");
	local MapFolder      = MainWindow:AddFolder("Map");

	do
		MainFolder:AddBind({text = "Toggle GUI", flag = "bind", key = "F1", callback = function() 
			Library:Close()
		end}) 
	end
	do
		MainFolder:AddToggle({text = "Auto Iridium", flag = "IridTog", state = false;})
	end
	do
		MainFolder:AddToggle({text = "Inf Jetpack", flag = "JetTog"; state = false; callback = function()
			pcall(function()
				game.Players.LocalPlayer.Character.IridiumTank.IridiumUsageScript:Destroy()

			end)

		end});
		do
			MainFolder:AddSlider({text = "Jetpack Thrust", flag = "slider", value = 1, min = 1, max = 4, float = 0.3, callback = function(a) 

				if a >= 1 and a < 1.5 then
					_G.JetThrust = 17
				end
				if a >= 1.5 and a < 2.5 then
					_G.JetThrust = 25
				end
				if a >= 2.5 and a < 3.5 then
					_G.JetThrust = 33
				end
				if a > 3.5 or a == 4 then
					_G.JetThrust = 41
				end


				debug.setupvalue(cloE, 13, _G.JetThrust)

			end})
		end

	end

--[[
do
BargeFolder:AddToggle({text = "Barge Fly", flag = nil, state = false;})
end
-]]



	do
		CombatFolder:AddToggle({text = "OneShot",flag = "OneShot";state = false; callback = function(state)
			if state then
				_G.Automatic = false
				_G.Bullets = 10
				if not _G.isGunTog then
					_G.isGunTog = true
					local function ChangeGun()
						a = require(game:GetService("ReplicatedStorage").Shared.Class.GunClient)
						a.ShowReload = function(p19)
							if not p19.PrimaryFireLast then
								return;
							end;
							p19.PrimaryIridiumCost = 0
							p19.PrimaryInaccuracy = 0.3
							p19.PrimaryProjectileCount = _G.Bullets
							if _G.Automatic == true then
								p19.PrimaryAutomatic = true
							else
								p19.PrimaryAutomatic = false
							end

							local v33 = tick() - p19.PrimaryFireLast;
							local v34 = 1 / p19.PrimaryFireRate;
							if not (v33 < v34) then
								if p19.ReloadBar then
									p19.ReloadBar:Destroy();
									p19.ReloadBar = nil;
								end;
								return;
							end;
							local v36 = p19.ReloadBar;
							if not v36 then
								v36 = Instance.new("Frame");
								v36.Size = UDim2.new(0, 64, 0, 4);
								v36.BorderColor3 = Color3.new(1, 1, 1);
								v36.BackgroundColor3 = Color3.new(1, 1, 1);
								v36.AnchorPoint = Vector2.new(0.5, 0.5);
								v36.Position = UDim2.new(0, 0, 0, 32);
								v36.Parent = p19.ControlledCursor;
								p19.ReloadBar = v36;
								p19:FirstPersonAddRecoil(p19.RecoilAmount);
							end;
							v36.Size = UDim2.new(0, 64 * (1 - v33 / v34), 0, v36.Size.Y.Offset);
						end
					end;


					while wait() do

						ChangeGun()
					end
				else 
					warn('GunMod Already running!')
				end
			end
		end});
	end

	do
		CombatFolder:AddToggle({text = "Triggerbot",flag = "TrigTog";state = false;});
	end

	do
		CombatFolder:AddBind({text = "Aimbot", flag = "bind", hold = true, key = "R" , callback = function(a) 
			if a then  else 
				if getnearest() then
					local vector, onScreen = workspace.CurrentCamera:WorldToScreenPoint(getnearest().Character.Head.Position)
					local dist = (Vector2.new(vector.X, vector.Y) - Vector2.new(mouse.X,mouse.Y)).Magnitude
					local magnitudeX = mouse.X - vector.X
					local magnitudeY = mouse.Y - vector.Y
					mousemoverel(-magnitudeX*0.5,-magnitudeY*0.5)
					wait(0.01)
				end

				local teamcheck=true
				if teamcheck then
					if #game.Teams:GetChildren()<2 then
						teamcheck=false
					end
				end


			end end})
	end
	do
		CombatFolder:AddToggle({text = "Hitbox Extender",flag = "HitTog",state = false; callback = function(b) 
			if not _G.HeadSize then
				_G.HeadSize = 10    
			end end
		});
		CombatFolder:AddSlider({text = "Hitbox Size", flag = "slider", value = 10, min = 5, max = 30, float = 0.3, callback = function(a) 
			_G.HeadSize = a
		end})

	end

	do
		MapFolder:AddButton({text = "Full Bright", flag = nil, callback = function() 
			local a = true 
			game.Lighting.Changed:connect(function()
				pcall(function()
					game.Lighting.TimeOfDay = "14:00:00"
					game.Lighting.FogEnd = 9999
					game.Lighting.Brightness = 2
					game.Lighting.ColorCorrection.Brightness = 0.1
					game.Lighting.ColorCorrection.Saturation = 0.1
					game.Lighting.WaterAtmosphere:Destroy()
					game.Lighting.Blur:Destroy()
					Lighting.Atmosphere:Destroy()
					Lighting.Rays:Destroy()
					Lighting.SunRaysAlwaysOn:Destroy()
					Lighting.SunRaysAlwaysOnNight:Destroy()
					Lighting.Blur:Destroy()
					Lighting.GlobalShadows = false
					Lighting.FogEnd = (math.huge)
				end)
			end)

			local Lighting = game:FindService("Lighting")


			if Lighting:FindFirstChild("Atmosphere") and a == true then
				pcall(function()
					game.Lighting.TimeOfDay = "14:00:00"
					game.Lighting.FogEnd = 9999
					game.Lighting.Brightness = 2
					game.Lighting.ColorCorrection.Brightness = 0.1
					game.Lighting.ColorCorrection.Saturation = 0.1
					Lighting.Bloom:Destroy()
					Lighting.Sky:Destroy()
					Lighting.WaterAtmosphere:Destroy()
					Lighting.Rays:Destroy()
					Lighting.SunRaysAlwaysOn:Destroy()
					Lighting.SunRaysAlwaysOnNight:Destroy()
					Lighting.Blur:Destroy()
					Lighting.GlobalShadows = false
					Lighting.FogEnd = (math.huge)
				end)
			end
			Lighting.Atmosphere:Destroy()

		end})
	end

	do
		MapFolder:AddButton({text = "Fall Damage", flag = nil, callback = function()
			game.ReplicatedStorage.Shared.Remotes.FallDamageDamageTaken:Destroy()
			wait(1)
			game.Players.LocalPlayer.Character.FallDamageScript:Destroy()
		end})
	end

	do
		MapFolder:AddButton({text = "Chat Spy", flag = nil, callback = function()
			--This script reveals ALL hidden messages in the default chat
			--chat "/e spy" to toggle!
			enabled = true
			--if true will check your messages too
			spyOnMyself = true
			--if true will chat the logs publicly (fun, risky)
			public = false
			--if true will use /me to stand out
			publicItalics = false
			--customize private logs
			privateProperties = {
				Color = Color3.fromRGB(0,255,255); 
				Font = Enum.Font.SourceSansBold;
				TextSize = 18;
			}
			--////////////////////////////////////////////////////////////////
			local StarterGui = game:GetService("StarterGui")
			local Players = game:GetService("Players")
			local player = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait() or Players.LocalPlayer
			local saymsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
			local getmsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering")
			local instance = (_G.chatSpyInstance or 0) + 1
			_G.chatSpyInstance = instance

			local function onChatted(p,msg)
				if _G.chatSpyInstance == instance then
					if p==player and msg:lower():sub(1,6)=="/e spy" then
						enabled = not enabled
						wait(0.3)
						privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
						StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
					elseif enabled and (spyOnMyself==true or p~=player) then
						msg = msg:gsub("[\n\r]",''):gsub("\t",' '):gsub("[ ]+",' ')
						local hidden = true
						local conn = getmsg.OnClientEvent:Connect(function(packet,channel)
							if packet.SpeakerUserId==p.UserId and packet.Message==msg:sub(#msg-#packet.Message+1) and (channel=="All" or (channel=="Team" and public==false and p.Team==player.Team)) then
								hidden = false
							end
						end)
						wait(1)
						conn:Disconnect()
						if hidden and enabled then
							if public then
								saymsg:FireServer((publicItalics and "/me " or '').."{SPY} [".. p.Name .."]: "..msg,"All")
							else
								privateProperties.Text = "{SPY} [".. p.Name .."]: "..msg
								StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
							end
						end
					end
				end
			end

			for _,p in ipairs(Players:GetPlayers()) do
				p.Chatted:Connect(function(msg) onChatted(p,msg) end)
			end
			Players.PlayerAdded:Connect(function(p)
				p.Chatted:Connect(function(msg) onChatted(p,msg) end)
			end)
			privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
			player:WaitForChild("PlayerGui"):WaitForChild("Chat")
			StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
			wait(3)
			local chatFrame = player.PlayerGui.Chat.Frame
			chatFrame.ChatChannelParentFrame.Visible = true
			chatFrame.ChatBarParentFrame.Position = chatFrame.ChatChannelParentFrame.Position+UDim2.new(UDim.new(),chatFrame.ChatChannelParentFrame.Size.Y)

		end})
	end

	do
		MapFolder:AddButton({text = "ESP", flag = nil, callback = function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua", true))()
		end})
	end


	local teams = game:GetService("Teams")
	local getTeams = teams:GetChildren() 


	do

		local meta      = debug.getmetatable(game);
		local oldName   = meta.__namecall;
		setreadonly(meta, false);

		meta.__namecall = newcclosure(function(self, ...)
			local args = {...};

			if (Library.flags.OneShot and tostring(self) == "Damage" and args[4] ~= "Void") then
				args[4] = 200;
			elseif (Library.flags.NoVoid and tostring(self) == "Damage" and args[4] == "Void") then
				return; --  kicks when enabled off ( idc tho )
			end;

			return oldName(self, unpack(args));
		end);

		setreadonly(meta, true);
	end;
	game:GetService("RunService").RenderStepped:connect(function()
		if game.Players.LocalPlayer.Character then
			if Mouse.Target and Players:FindFirstChild(Mouse.Target.Parent.Name) then
				local HitPlayer = Players:FindFirstChild(Mouse.Target.Parent.Name)
				if Library.flags.TrigTog and HitPlayer.Team ~= LocalPlayer.Team then 
					if HitPlayer.Character.Humanoid and HitPlayer.Character.Humanoid.Health > 0 then
						if LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Name == "Pistol" and (HitPlayer.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 128 then
							mouse1press();  
						else
							if LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Name == "Pistol" and not (HitPlayer.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 128 then mouse1release() end
						end

						if LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Name == "Assault Rifle" and (HitPlayer.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 192 then
							mouse1press();  
						else 
							if LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Name == "Assault Rifle" and not (HitPlayer.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 128 then mouse1release() end
						end

						if LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Name == "Shotgun" and (HitPlayer.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 128 then
							mouse1press();  
						else 
							if LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Name == "Shotgun" and not (HitPlayer.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 128 then mouse1release() end
						end
						if LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Name == "Sniper Rifle" and (HitPlayer.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 512 then
							mouse1press();  
						else 
							if LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Name == "Sniper Rifle" and (HitPlayer.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 512 then mouse1release() end
						end
						if LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Name == "AP DMR" and (HitPlayer.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 256 then
							mouse1press();  
						else 
							if LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Name == "AP DMR" and not (HitPlayer.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 256 then mouse1release() end
						end
						if LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Name == "Auto-Flechette" and (HitPlayer.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 128 then
							mouse1press();
						else 
							if LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Name == "Auto-Flechette" and not (HitPlayer.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 128  then mouse1release() end
						end
						if LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Name == "High-power Photon Lancer" and (HitPlayer.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 1024 then
							mouse1press();
						else 
							if LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Name == "High-power Photon Lancer" and not (HitPlayer.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).magnitude <= 128 then   mouse1release() end
						end
					end
				end
			end
			if Library.flags.IridTog and tabDown and toggle == false then
				local Boxhit = game.Workspace.Resources.IridiumCrystal.Hitbox
				local anewCFrame1 = game.Players.LocalPlayer.Character.LeftFoot.Position
				game.ReplicatedStorage.Shared.Remotes.Portafab:FireServer(5,3,{anewCFrame1,Boxhit})
			end
			if Library.flags.IridTog and tabDown and toggle == true then 
				local anewCFrame = game.Players.LocalPlayer.Character.LeftFoot.Position
				game.ReplicatedStorage.Shared.Remotes.Portafab:FireServer(5,3,{anewCFrame,Boxhit1})
			else
			end
		end
	end)

	game:GetService("RunService").RenderStepped:connect(function()
		if game.Players.LocalPlayer.Character then
			if Library.flags.HitTog then
				for i,v in next, game:GetService('Players'):GetPlayers() do
					if v.Name ~= game:GetService('Players').LocalPlayer.Name and v.Team ~= game:GetService('Players').LocalPlayer.Team then
						pcall(function()
							if v.Character.Humanoid.Health == 0  then
								v.Character.HumanoidRootPart.Size = Vector3.new(2,2,1)
								v.Character.HumanoidRootPart.Transparency = 1
							else
								v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
								v.Character.HumanoidRootPart.Transparency = 0.7
								v.Character.HumanoidRootPart.Material = "Neon"
								v.Character.HumanoidRootPart.CanCollide = false
								v.Character.HumanoidRootPart.BrickColor = v.TeamColor
							end
						end)
					else 
						v.Character.HumanoidRootPart.Size = Vector3.new(2,2, 1)
						v.Character.HumanoidRootPart.Transparency = 1
					end
				end
			else 
				for i,v in next, game:GetService('Players'):GetPlayers() do
					if v.Name ~= game:GetService('Players').LocalPlayer.Name and v.Team ~= game:GetService('Players').LocalPlayer.Team then
						pcall(function()
							v.Character.HumanoidRootPart.Size = Vector3.new(2,2, 1)
							v.Character.HumanoidRootPart.Transparency = 1
						end)
					end
				end
			end
			if Library.flags.JetTog and game.Players.LocalPlayer.Character:FindFirstChild('IridiumTank') then

				wait(0.5)
				debug.setupvalue(closure1, 1, 99)
			end


		end

	end)



	Library:Init(); 
end
