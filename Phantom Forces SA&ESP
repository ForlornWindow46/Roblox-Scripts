--made by ForlornW46
if getgenv().syn and getgenv().syn.run_on_actor then
    for _,v in pairs(getactors())do
        --if tostring(v)=="lol"then
            syn.run_on_actor(v,[[
                local mouse
                for _,v in pairs(getgc(true))do
                    if type(v)=="table"then
                        if rawget(v,"mouse")then
                            if rawget(v.mouse,"onmousemove")then
                                mouse=v.mouse
                                break
                            end
                        end
                    end
                end
                local GetR6Parts=function(all)--get table with r6 parts
                    local Parts
                    if all then
                        Parts={"All","Head","Torso","Right Arm","Left Arm","Right Leg","Left Leg"}
                    else
                        Parts={"Head","Torso","Right Arm","Left Arm","Right Leg","Left Leg"}
                    end
                    return Parts
                end
                local Options={
                    Enabled=false,--true,false  set to true to enable silent aim
                    Target={"Head"},--All,Head,Torso,Left Leg,Right Leg,Left Arm,Right Arm  target for silent aim (due to the shittyness of the script it probly will just hit the legs or torso)
                    Auto_Shoot=false,--true,false  automaticly shoots when a play is in your fov 
                    Auto_Wall=false,--true,false  automaticly targets players if they cna be penetrated by gun (may break with attachments)
                    Fov=50,--0-inf  set fov size
                    Show_Fov=false,--true,false   show fov circle
                    Fov_Color=Color3.fromRGB(255,0,0),--rgb  circle color
                    Ignore_Fov=false,--true,false  disable or enable fov chck
                }
                --epic coasting ui lib
                _G.UILib=_G.UILib or loadstring(game:HttpGet("https://raw.githubusercontent.com/The3Bakers4565/Spicy-Bagel/main/Functions/UI/Coasting.lua"))()
                local Main=_G.UILib:CreateTab("Silent Aim")--tabs
                local MainSection=Main:CreateSection("Main")--section 1
                local ConfigSection=Main:CreateSection("Field of View")--section 2
                MainSection:CreateToggle("Enabled",function(x)
                    Options.Enabled=x
                end)
                MainSection:CreateDropdown("Target",GetR6Parts(true),2,function(x)
                    if x=="All"then
                        Options.Target=GetR6Parts()--if we select all we get every part from the r6 table
                    else
                        Options.Target={x}--keep part inside table
                    end
                end)
                MainSection:CreateToggle("Auto Shoot",function(x)
                    Options.Auto_Shoot=x
                end)
                MainSection:CreateToggle("Auto Wall",function(x)
                    Options.Auto_Wall=x
                end)
                MainSection:CreateToggle("Ignore Fov",function(x)
                    Options.Ignore_Fov=x
                end)
                ConfigSection:CreateToggle("Show Fov",function(x)
                    Options.Show_Fov=x
                end)
                ConfigSection:CreateColorPicker("Fov Color",Color3.new(1,0,0),function(x)
                    Options.Fov_Color=x
                end)
                ConfigSection:CreateSlider("Fov Size",1,500,50,false,function(x)
                    Options.Fov=x
                end)
                local IsAlive=function()--check if player is alive
                    if game.Players.LocalPlayer.Character and not game.Workspace:FindFirstChild("MenuLobby")then
                        return true
                    end
                    return false
                end
                local NotGuns={"ONE HAND BLUNT","TWO HAND BLADE","EQUIPMENT","FRAGMENTATION","IMPACT","ONE HAND BLADE","TWO HAND BLUNT","HIGH EXPLOSIVE"}--production folder >:)
                local guns={}--gun table
                local gunpendepths={None=0,["M14 BR"]=1.8,HK417=1.6,L22=0.9,["HECATE II"]=10,["M79 THUMPER"]=0.5,["AS VAL"]=1,MP1911=0.5,["GI M1"]=1,["TEC-9"]=0.5,GSP=0.1,["GLOCK 18"]=0.5,["GB-22"]=0.5,X95R=1,M16A3=1.2,["SCAR SSR"]=2.6,["STEYR SCOUT"]=3,K2=1,MG36=1.8,["AUTO 9"]=1,MP5SD=0.5,MAC10=0.5,UZI=0.7,["COLT MARS"]=1.5,["SAIGA-12U"]=0.4,["FAL PARA SHORTY"]=1.4,L115A3=3,MP40=1.1,["AN-94"]=1,["ARM PISTOL"]=0.9,BLOCKSON=0.5,MP5K=0.5,["MAKAROV PM"]=0.5,["L86 LSW"]=1.6,AK12=1,["BOXY BUSTER"]=0,["BEOWULF ECR"]=1.9,EXECUTIONER=1,["DRAGUNOV SVU"]=2.8,M16A4=1.2,M1903=5,["TOMMY GUN"]=0.5,["SCAR-H"]=1.5,G36K=1.1,AK74=1,JURY=1,["1858 CARBINE"]=0.5,["GLOCK 40"]=0.8,["BEOWULF TCR"]=3,["1858 NEW ARMY"]=0.5,M4=1,["NTW-20"]=20,HK51B=1,9,C8A2=0.8,MP7=1.5,AK47=1.4,MC51SD=1.5,KRINKOV=0.9,["GOLDEN ZIP 22"]=0.5,["KAC SRR"]=1,["TRG-42"]=3,["KRISS VECTOR"]=0.5,["RAMA 1130"]=0.5,["SR-3M"]=1,["SCAR PDW"]=0.9,["FAL 50.63 PARA"]=2,["E SHOTGUN"]=0.5,M1911=0.5,["AG-3"]=2,M231=1,K7=0.5,AKM=1.4,SKS=1.5,K1A=0.75,["GYROJET MARK I"]=0.5,["M14 DMR"]=2.4,["MICRO UZI"]=0.5,["PPSH-41"]=1,["REMINGTON 870"]=0.5,["VSS VINTOREZ"]=1.5,MK11=1.7,MSG90=2,["SL-8"]=1.3,M3A1=0.5,["GLOCK 17"]=0.5,["SASS 308"]=2,FT300=3,RPK74=1.6,["KS-23M"]=0.7,["AA-12"]=0.3,M7644=0.5,ALIEN=0.5,["TAR-21"]=1.2,["SCAR HAMR"]=1.4,MG3KWS=2,["GOLDEN HK51B"]=0.3,HK21=1.6,MG42=2.5,["AUG A3"]=1,["SA58 SPR"]=2,["BFG 50"]=10,["SAIGA-12"]=.5,AKU12=1,["FAL 50.00"]=2,FAMAS=1,["TYPE 88"]=.9,["REDHAWK 44"]=1,GRIZZLY=1.3,["COLT LMG"]=1.4,MP10=0.5,RAILGUN=200,["HENRY 45-70"]=2,["MP412 REX"]=.5,WA2000=2.8,["DEAGLE 44"]=1,["GLOCK 50"]=1,["GLOCK 21"]=0.7,HARDBALLER=1.2,M4A1=1,M9=0.5,["GOLDEN TOMMY GUN"]=0.5,["GOLDEN REDHAWK 45"]=0.5,["SCAR-L"]=1,["STG-44"]=1.6,P90=2,["DEAGLE 50"]=1.3,MP5=0.5,["AUG A3 PARA"]=0.5,["TOY M1911"]=0,["REMINGTON 700"]=3,["PP-2000"]=1,["MP5/10"]=0.8,AK12BR=2,["KG-99"]=0.5,UMP45=1.4,["ZIP 22"]=0.5,["GLOCK 1"]=0.5,C7A2=0.9,["SERBU SHOTGUN"]=0.6,["AUG A1"]=1,["COLT SMG 635"]=0.5,RPK12=1.6,["FIVE SEVEN"]=1.5,["DT11 PRO"]=.7,["GYROJET CARBINE"]=0.7,["OTs-126"]=1.2,M93R=0.5,DBV12=0.5,M45A1=0.5,["SAWED OFF"]=0.6,G36C=1,["SFG 50"]=10,["E GUN"]=0.5,SKORPION=0.5,OBREZ=2,RPK=1.8,["ROPOD SHOTTY"]=1.5,M41A=1,["GROZA-1"]=1.5,["GOLDEN SHORTY"]=0.1,["GROZA-4"]=1.5,M2011=0.5,["GLOCK 23"]=0.8,["KSG 12"]=0.4,["USAS-12"]=0.3,M60=3,["MOSIN NAGANT"]=4,["HONEY BADGER"]=1.3,["SPAS-12"]=0.6,["AM III"]=1.2,["STEVENS DB"]=0.5,["DRAGUNOV SVDS"]=3.2,["AUG HBAR"]=1.6,K14=3,["CAN CANNON"]=1.2,["AUG A2"]=1,AK103=1.4,AWS=2,INTERVENTION=6,["X95 SMG"]=0.7,["MATEBA 6"]=1,JUDGE=1,G36=1.3,["PP-19 BIZON"]=0.5,M107=10,G3=1.5,["GOLDEN DEAGLE 50"]=1.5,AK12C=1.2,L2A3=1.1,["GOLDEN DEAGLE 2"]=1.5,ASMI=0.5,["IZHEVSK PB"]=0.5,AK105=1,M3822=0.5,L85A2=1.2,["HOWA TYPE 20"]=1.4,HK416=1,M16A1=0.8,G11K2=2}
                local StringToTable=function(string)--string to table function used in find broken module penetratrion
                    local a={}
                    for i=1,string.len(string)do
                        a[#a+1]=string.sub(string,i,i)
                    end
                    return a
                end
                local FindBrokenModulePenetration=function(modulescript)--find broken module penetratrion used in new updates
                    local gundata=decompile(modulescript)--you cant require anymore
                    local exists,penstart=string.find(gundata,"v1.penetrationdepth = ")
                    if not exists then return 0 end
                    local pendata=string.sub(gundata,penstart,penstart+4)
                    local number=""
                    for _,v in pairs(StringToTable(pendata))do
                        if tonumber(v)or v=="."then
                            number=number..v
                        end
                    end
                    return tonumber(number)
                end
                local weapondata={}--my shitty gun detection (it works fuck u)
                for _,v in pairs(game:GetService("ReplicatedStorage").Content.ProductionContent.WeaponDatabase:GetChildren())do
                    for _,c in pairs(v:GetChildren())do
                        if c:FindFirstChild("Main")then
                            weapondata[c.Name]={Union={},MeshPart={}}
                            for _,x in pairs(c.Main:GetChildren())do
                                if x:IsA("MeshPart")then
                                    weapondata[c.Name].MeshPart[x.MeshId]=x.MeshId
                                elseif x:IsA("Union")then
                                    weapondata[c.Name].Union[x.AssetId]=x.AssetId
                                end
                            end
                        end
                    end
                    if not table.find(NotGuns,v.Name)then
                        for _,c in pairs(v:GetChildren())do
                            guns[c]=c.Name
                        end
                    end
                end
                for i,v in pairs(guns)do--if there is a new update it will detect the weapons and try to add the new penetratrion depths
                    if not gunpendepths[v]then
                        local depth=FindBrokenModulePenetration(i[v])
                        gunpendepths[v]=depth
                        print("Error, Missing "..v..", Error Depth Recovery Found "..depth.." As Penetration, Please Contact The Dev To Fix https://discord.gg/vQQqcgBWCG")
                    end
                end
                local GetGunName=function()--get weapon from closest model from camera?! omg shut up ik its stupid but it works quit bullying me
                    if not IsAlive()then return"None"end
                    local curdata={Union={},MeshPart={}}
                    for _,v in pairs(game.Workspace.CurrentCamera.Main:GetChildren())do
                        if v:IsA("MeshPart")then
                            curdata.MeshPart[v.MeshId]=v.MeshId
                        elseif v:IsA("Union")then
                            curdata.Union[v.AssetId]=v.AssetId
                        end
                    end
                    local matches={}
                    for i,v in pairs(weapondata)do
                        for i2,c in pairs(v)do
                            for _,x in pairs(c)do
                                if x==curdata[i2][x]then
                                    if matches[i]then
                                        matches[i]=matches[i]+1
                                    else
                                        matches[i]=1
                                    end
                                end
                            end
                        end
                    end
                    local a=0
                    local closest="None"
                    for i,v in pairs(matches)do
                        if v>a then
                            a=v
                            closest=i
                        end
                    end
                    return closest
                end
                local GetEnemys=function()--simple ass get enemys
                    local players={}
                    local characters={}
                    local enemyteam
                    for _,v in pairs(game.Players:GetChildren())do
                        if v.Team~=game.Players.LocalPlayer.Team then
                            enemyteam=tostring(v.TeamColor)
                            players[#players+1]=v
                        end
                    end
                    if not enemyteam then
                        enemyteam="Bright orange"
                        if game.Players.LocalPlayer.Team.Name=="Ghosts"then
                            enemyteam="Bright blue"
                        end
                    end
                    for _,v in pairs(game.Workspace.Players[enemyteam]:GetChildren())do
                        characters[#characters+1]=v
                    end
                    return{characters,players}
                end
                local GetDirChange=function()--get bullet direction changes
                    local a={}
                    if game.Workspace.CurrentCamera:FindFirstChild("Main")then
                        for _,v in pairs(game.Workspace.CurrentCamera.Main:GetChildren())do
                            if string.find(string.lower(tostring(v)),"flame")or string.find(string.lower(tostring(v)),"sightmark")then
                                a[#a+1]=v
                            end
                        end
                    end
                    return a
                end
                local Ignore={game.Workspace.CurrentCamera,game.Workspace.Ignore}--old ignore stuff (still works lul)
                local function CanSee(Target,Penetrate,PenDepth)
                    if not Penetrate then PenDepth=0 end
                    local Dir=Target.Position-game.Workspace.CurrentCamera.CFrame.Position
                    local InitCast=game.Workspace:FindPartOnRayWithIgnoreList(Ray.new(game.Workspace.CurrentCamera.CFrame.Position,Dir),Ignore,false,true)
                    if not InitCast then
                        return true
                    end
                    local Penetrated=0
                    for _,v in pairs(game.Workspace.CurrentCamera:GetPartsObscuringTarget({Target.Position},Ignore))do
                        if v.CanCollide and v.Transparency~=1 and v.Name~="Window"then
                            local MaxExtent=v.Size.Magnitude*Dir.Unit;
                            local _,Enter=game.Workspace:FindPartOnRayWithWhitelist(Ray.new(game.Workspace.CurrentCamera.CFrame.Position,Dir),{v},true)
                            local _,Exit=game.Workspace:FindPartOnRayWithWhitelist(Ray.new(Enter+MaxExtent,-MaxExtent),{v},true)
                            local Depth=(Exit-Enter).Magnitude;
                            if Depth>PenDepth then
                                return false;
                            else
                                Penetrated=Penetrated+Depth;
                            end
                        else
                            table.insert(Ignore,v)
                        end
                    end
                    return Penetrated<PenDepth
                end
                local target
                game.RunService.RenderStepped:Connect(function()
                    target=nil--reset targets
                    if Options.Enabled and IsAlive()then--are we alive and enabled?
                        local a=math.huge
                        local penetratrion=gunpendepths[GetGunName()]
                        for _,v in pairs(GetEnemys()[1])do--get characters
                            for _,c in pairs(Options.Target)do--get part target list
                                local main=v[c]--part to detect
                                local mainmag=(main.Position-game.Workspace.CurrentCamera.CFrame.Position).Magnitude--distance between us
                                if Options.Ignore_Fov then--is ignoring fov
                                    if mainmag<a and CanSee(main,Options.Auto_Wall,penetratrion)then
                                        a=mainmag
                                        target=main
                                    end
                                else--i dont wanna explain the lower part just figure it out
                                    local center=game.Workspace.CurrentCamera:WorldToViewportPoint(game.Workspace.CurrentCamera.CFrame.Position+game.Workspace.CurrentCamera.CFrame.LookVector)
                                    local partloc,isvisible=game.Workspace.CurrentCamera:WorldToScreenPoint(main.Position)
                                    if(Vector2.new(partloc.X,partloc.Y)-Vector2.new(center.X,center.Y)).Magnitude<=Options.Fov then
                                        if mainmag<a and CanSee(main,Options.Auto_Wall,penetratrion)then
                                            target=main
                                            a=mainmag
                                        end
                                    end
                                end
                            end
                        end
                        if target then--have we has target :D
                            for _,v in pairs(GetDirChange())do--our direction changes >:)
                                v.Position=game.Workspace.CurrentCamera.CFrame.Position
                                v.Velocity=Vector3.new()--because we remove welds later >:)
                                local weld=v:FindFirstChildWhichIsA("Weld")or v:FindFirstChildWhichIsA("WeldConstraint")
                                if weld then
                                    weld:Destroy()--remove weld to remove swat to affecte accuracy
                                end
                                local x,y,z=CFrame.new(v.Position,target.Position+Vector3.new(0,.45,0)):ToEulerAnglesYXZ()
                                v.Orientation=Vector3.new(math.deg(x),math.deg(y),math.deg(z))--my very first silent aim i made came in handy LOL
                            end
                        else
                            local straight=game.Workspace.CurrentCamera.CFrame.LookVector*100000
                            for _,v in pairs(GetDirChange())do--fix bullet angle if we nolonger has target
                                v.Position=game.Workspace.CurrentCamera.CFrame.Position
                                v.Velocity=Vector3.new()--because we remove welds later >:)
                                local weld=v:FindFirstChildWhichIsA("Weld")or v:FindFirstChildWhichIsA("WeldConstraint")
                                if weld then
                                    weld:Destroy()
                                end
                                local x,y,z=CFrame.new(v.Position,straight):ToEulerAnglesYXZ()
                                v.Orientation=Vector3.new(math.deg(x),math.deg(y),math.deg(z))
                            end
                        end
                    end
                end)
                coroutine.wrap(function()--our fov circle fuck you figure it out urself
                    while game.RunService.RenderStepped:Wait()do
                        pcall(function()
                            if Options.Auto_Shoot and target then
                                for i,v in pairs(mouse.onbuttondown._connections[1])do
                                    if type(v)=="function"then
                                        v("left")break--wow pf really steppin up the anti cheat for this shit
                                    end
                                end
                                wait()
                                for i,v in pairs(mouse.onbuttonup._connections[1])do
                                    if type(v)=="function"then
                                        v("left")break--same thing but undo
                                    end
                                end
                            end
                        end)
                    end
                end)()
                coroutine.wrap(function()--our fov circle fuck you figure it out urself
                    while wait(1)do
                        pcall(function()
                            if Options.Enabled and Options.Show_Fov and not Options.Ignore_Fov then
                                local center=game.Workspace.CurrentCamera:WorldToViewportPoint(game.Workspace.CurrentCamera.CFrame.Position+game.Workspace.CurrentCamera.CFrame.LookVector)
                                local a=Drawing.new("Circle")
                                a.Visible=true
                                a.Position=Vector2.new(center.X,center.Y)
                                a.Color=Options.Fov_Color
                                a.Thickness=2.5
                                a.Transparency=1
                                a.NumSides=100
                                a.Radius=Options.Fov
                                coroutine.wrap(function()
                                    wait(1.1)
                                    a:Remove()
                                end)()
                            end
                        end)
                    end
                end)()
            ]])
        --end
    end
else
    local GetR6Parts=function(all)--get table with r6 parts
        local Parts
        if all then
            Parts={"All","Head","Torso","Right Arm","Left Arm","Right Leg","Left Leg"}
        else
            Parts={"Head","Torso","Right Arm","Left Arm","Right Leg","Left Leg"}
        end
        return Parts
    end
    local Options={
        Enabled=false,--true,false  set to true to enable silent aim
        Target={"Head"},--All,Head,Torso,Left Leg,Right Leg,Left Arm,Right Arm  target for silent aim (due to the shittyness of the script it probly will just hit the legs or torso)
        Auto_Shoot=false,--true,false  automaticly shoots when a play is in your fov 
        Auto_Wall=false,--true,false  automaticly targets players if they cna be penetrated by gun (may break with attachments)
        Fov=50,--0-inf  set fov size
        Show_Fov=false,--true,false   show fov circle
        Fov_Color=Color3.fromRGB(255,0,0),--rgb  circle color
        Ignore_Fov=false,--true,false  disable or enable fov chck
    }
    --epic coasting ui lib
    _G.UILib=_G.UILib or loadstring(game:HttpGet("https://raw.githubusercontent.com/The3Bakers4565/Spicy-Bagel/main/Functions/UI/Coasting.lua"))()
    local Main=_G.UILib:CreateTab("Silent Aim")--tabs
    local MainSection=Main:CreateSection("Main")--section 1
    local ConfigSection=Main:CreateSection("Field of View")--section 2
    MainSection:CreateToggle("Enabled",function(x)
        Options.Enabled=x
    end)
    MainSection:CreateDropdown("Target",GetR6Parts(true),2,function(x)
        if x=="All"then
            Options.Target=GetR6Parts()--if we select all we get every part from the r6 table
        else
            Options.Target={x}--keep part inside table
        end
    end)
    MainSection:CreateToggle("Auto Shoot",function(x)
        Options.Auto_Shoot=x
    end)
    MainSection:CreateToggle("Auto Wall",function(x)
        Options.Auto_Wall=x
    end)
    MainSection:CreateToggle("Ignore Fov",function(x)
        Options.Ignore_Fov=x
    end)
    ConfigSection:CreateToggle("Show Fov",function(x)
        Options.Show_Fov=x
    end)
    ConfigSection:CreateColorPicker("Fov Color",Color3.new(1,0,0),function(x)
        Options.Fov_Color=x
    end)
    ConfigSection:CreateSlider("Fov Size",1,500,50,false,function(x)
        Options.Fov=x
    end)
    local IsAlive=function()--check if player is alive
        if game.Players.LocalPlayer.Character and not game.Workspace:FindFirstChild("MenuLobby")then
            return true
        end
        return false
    end
    local NotGuns={"ONE HAND BLUNT","TWO HAND BLADE","EQUIPMENT","FRAGMENTATION","IMPACT","ONE HAND BLADE","TWO HAND BLUNT","HIGH EXPLOSIVE"}--production folder >:)
    local guns={}--gun table
    local gunpendepths={None=0,["M14 BR"]=1.8,HK417=1.6,L22=0.9,["HECATE II"]=10,["M79 THUMPER"]=0.5,["AS VAL"]=1,MP1911=0.5,["GI M1"]=1,["TEC-9"]=0.5,GSP=0.1,["GLOCK 18"]=0.5,["GB-22"]=0.5,X95R=1,M16A3=1.2,["SCAR SSR"]=2.6,["STEYR SCOUT"]=3,K2=1,MG36=1.8,["AUTO 9"]=1,MP5SD=0.5,MAC10=0.5,UZI=0.7,["COLT MARS"]=1.5,["SAIGA-12U"]=0.4,["FAL PARA SHORTY"]=1.4,L115A3=3,MP40=1.1,["AN-94"]=1,["ARM PISTOL"]=0.9,BLOCKSON=0.5,MP5K=0.5,["MAKAROV PM"]=0.5,["L86 LSW"]=1.6,AK12=1,["BOXY BUSTER"]=0,["BEOWULF ECR"]=1.9,EXECUTIONER=1,["DRAGUNOV SVU"]=2.8,M16A4=1.2,M1903=5,["TOMMY GUN"]=0.5,["SCAR-H"]=1.5,G36K=1.1,AK74=1,JURY=1,["1858 CARBINE"]=0.5,["GLOCK 40"]=0.8,["BEOWULF TCR"]=3,["1858 NEW ARMY"]=0.5,M4=1,["NTW-20"]=20,HK51B=1,9,C8A2=0.8,MP7=1.5,AK47=1.4,MC51SD=1.5,KRINKOV=0.9,["GOLDEN ZIP 22"]=0.5,["KAC SRR"]=1,["TRG-42"]=3,["KRISS VECTOR"]=0.5,["RAMA 1130"]=0.5,["SR-3M"]=1,["SCAR PDW"]=0.9,["FAL 50.63 PARA"]=2,["E SHOTGUN"]=0.5,M1911=0.5,["AG-3"]=2,M231=1,K7=0.5,AKM=1.4,SKS=1.5,K1A=0.75,["GYROJET MARK I"]=0.5,["M14 DMR"]=2.4,["MICRO UZI"]=0.5,["PPSH-41"]=1,["REMINGTON 870"]=0.5,["VSS VINTOREZ"]=1.5,MK11=1.7,MSG90=2,["SL-8"]=1.3,M3A1=0.5,["GLOCK 17"]=0.5,["SASS 308"]=2,FT300=3,RPK74=1.6,["KS-23M"]=0.7,["AA-12"]=0.3,M7644=0.5,ALIEN=0.5,["TAR-21"]=1.2,["SCAR HAMR"]=1.4,MG3KWS=2,["GOLDEN HK51B"]=0.3,HK21=1.6,MG42=2.5,["AUG A3"]=1,["SA58 SPR"]=2,["BFG 50"]=10,["SAIGA-12"]=.5,AKU12=1,["FAL 50.00"]=2,FAMAS=1,["TYPE 88"]=.9,["REDHAWK 44"]=1,GRIZZLY=1.3,["COLT LMG"]=1.4,MP10=0.5,RAILGUN=200,["HENRY 45-70"]=2,["MP412 REX"]=.5,WA2000=2.8,["DEAGLE 44"]=1,["GLOCK 50"]=1,["GLOCK 21"]=0.7,HARDBALLER=1.2,M4A1=1,M9=0.5,["GOLDEN TOMMY GUN"]=0.5,["GOLDEN REDHAWK 45"]=0.5,["SCAR-L"]=1,["STG-44"]=1.6,P90=2,["DEAGLE 50"]=1.3,MP5=0.5,["AUG A3 PARA"]=0.5,["TOY M1911"]=0,["REMINGTON 700"]=3,["PP-2000"]=1,["MP5/10"]=0.8,AK12BR=2,["KG-99"]=0.5,UMP45=1.4,["ZIP 22"]=0.5,["GLOCK 1"]=0.5,C7A2=0.9,["SERBU SHOTGUN"]=0.6,["AUG A1"]=1,["COLT SMG 635"]=0.5,RPK12=1.6,["FIVE SEVEN"]=1.5,["DT11 PRO"]=.7,["GYROJET CARBINE"]=0.7,["OTs-126"]=1.2,M93R=0.5,DBV12=0.5,M45A1=0.5,["SAWED OFF"]=0.6,G36C=1,["SFG 50"]=10,["E GUN"]=0.5,SKORPION=0.5,OBREZ=2,RPK=1.8,["ROPOD SHOTTY"]=1.5,M41A=1,["GROZA-1"]=1.5,["GOLDEN SHORTY"]=0.1,["GROZA-4"]=1.5,M2011=0.5,["GLOCK 23"]=0.8,["KSG 12"]=0.4,["USAS-12"]=0.3,M60=3,["MOSIN NAGANT"]=4,["HONEY BADGER"]=1.3,["SPAS-12"]=0.6,["AM III"]=1.2,["STEVENS DB"]=0.5,["DRAGUNOV SVDS"]=3.2,["AUG HBAR"]=1.6,K14=3,["CAN CANNON"]=1.2,["AUG A2"]=1,AK103=1.4,AWS=2,INTERVENTION=6,["X95 SMG"]=0.7,["MATEBA 6"]=1,JUDGE=1,G36=1.3,["PP-19 BIZON"]=0.5,M107=10,G3=1.5,["GOLDEN DEAGLE 50"]=1.5,AK12C=1.2,L2A3=1.1,["GOLDEN DEAGLE 2"]=1.5,ASMI=0.5,["IZHEVSK PB"]=0.5,AK105=1,M3822=0.5,L85A2=1.2,["HOWA TYPE 20"]=1.4,HK416=1,M16A1=0.8,G11K2=2}
    local StringToTable=function(string)--string to table function used in find broken module penetratrion
        local a={}
        for i=1,string.len(string)do
            a[#a+1]=string.sub(string,i,i)
        end
        return a
    end
    local FindBrokenModulePenetration=function(modulescript)--find broken module penetratrion used in new updates
        local gundata=decompile(modulescript)--you cant require anymore
        local exists,penstart=string.find(gundata,"v1.penetrationdepth = ")
        if not exists then return 0 end
        local pendata=string.sub(gundata,penstart,penstart+4)
        local number=""
        for _,v in pairs(StringToTable(pendata))do
            if tonumber(v)or v=="."then
                number=number..v
            end
        end
        return tonumber(number)
    end
    local weapondata={}--my shitty gun detection (it works fuck u)
    for _,v in pairs(game:GetService("ReplicatedStorage").Content.ProductionContent.WeaponDatabase:GetChildren())do
        for _,c in pairs(v:GetChildren())do
            if c:FindFirstChild("Main")then
                weapondata[c.Name]={Union={},MeshPart={}}
                for _,x in pairs(c.Main:GetChildren())do
                    if x:IsA("MeshPart")then
                        weapondata[c.Name].MeshPart[x.MeshId]=x.MeshId
                    elseif x:IsA("Union")then
                        weapondata[c.Name].Union[x.AssetId]=x.AssetId
                    end
                end
            end
        end
        if not table.find(NotGuns,v.Name)then
            for _,c in pairs(v:GetChildren())do
                guns[c]=c.Name
            end
        end
    end
    for i,v in pairs(guns)do--if there is a new update it will detect the weapons and try to add the new penetratrion depths
        if not gunpendepths[v]then
            local depth=FindBrokenModulePenetration(i[v])
            gunpendepths[v]=depth
            print("Error, Missing "..v..", Error Depth Recovery Found "..depth.." As Penetration, Please Contact The Dev To Fix https://discord.gg/vQQqcgBWCG")
        end
    end
    local GetGunName=function()--get weapon from closest model from camera?! omg shut up ik its stupid but it works quit bullying me
        if not IsAlive()then return"None"end
        local curdata={Union={},MeshPart={}}
        for _,v in pairs(game.Workspace.CurrentCamera.Main:GetChildren())do
            if v:IsA("MeshPart")then
                curdata.MeshPart[v.MeshId]=v.MeshId
            elseif v:IsA("Union")then
                curdata.Union[v.AssetId]=v.AssetId
            end
        end
        local matches={}
        for i,v in pairs(weapondata)do
            for i2,c in pairs(v)do
                for _,x in pairs(c)do
                    if x==curdata[i2][x]then
                        if matches[i]then
                            matches[i]=matches[i]+1
                        else
                            matches[i]=1
                        end
                    end
                end
            end
        end
        local a=0
        local closest="None"
        for i,v in pairs(matches)do
            if v>a then
                a=v
                closest=i
            end
        end
        return closest
    end
    local GetEnemys=function()--simple ass get enemys
        local players={}
        local characters={}
        local enemyteam
        for _,v in pairs(game.Players:GetChildren())do
            if v.Team~=game.Players.LocalPlayer.Team then
                enemyteam=tostring(v.TeamColor)
                players[#players+1]=v
            end
        end
        if not enemyteam then
            enemyteam="Bright orange"
            if game.Players.LocalPlayer.Team.Name=="Ghosts"then
                enemyteam="Bright blue"
            end
        end
        for _,v in pairs(game.Workspace.Players[enemyteam]:GetChildren())do
            characters[#characters+1]=v
        end
        return{characters,players}
    end
    local GetDirChange=function()--get bullet direction changes
        local a={}
        if game.Workspace.CurrentCamera:FindFirstChild("Main")then
            for _,v in pairs(game.Workspace.CurrentCamera.Main:GetChildren())do
                if string.find(string.lower(tostring(v)),"flame")or string.find(string.lower(tostring(v)),"sightmark")then
                    a[#a+1]=v
                end
            end
        end
        return a
    end
    local Ignore={game.Workspace.CurrentCamera,game.Workspace.Ignore}--old ignore stuff (still works lul)
    local function CanSee(Target,Penetrate,PenDepth)
        if not Penetrate then PenDepth=0 end
        local Dir=Target.Position-game.Workspace.CurrentCamera.CFrame.Position
        local InitCast=game.Workspace:FindPartOnRayWithIgnoreList(Ray.new(game.Workspace.CurrentCamera.CFrame.Position,Dir),Ignore,false,true)
        if not InitCast then
            return true
        end
        local Penetrated=0
        for _,v in pairs(game.Workspace.CurrentCamera:GetPartsObscuringTarget({Target.Position},Ignore))do
            if v.CanCollide and v.Transparency~=1 and v.Name~="Window"then
                local MaxExtent=v.Size.Magnitude*Dir.Unit;
                local _,Enter=game.Workspace:FindPartOnRayWithWhitelist(Ray.new(game.Workspace.CurrentCamera.CFrame.Position,Dir),{v},true)
                local _,Exit=game.Workspace:FindPartOnRayWithWhitelist(Ray.new(Enter+MaxExtent,-MaxExtent),{v},true)
                local Depth=(Exit-Enter).Magnitude;
                if Depth>PenDepth then
                    return false;
                else
                    Penetrated=Penetrated+Depth;
                end
            else
                table.insert(Ignore,v)
            end
        end
        return Penetrated<PenDepth
    end
    local target
    game.RunService.RenderStepped:Connect(function()
        target=nil--reset targets
        if Options.Enabled and IsAlive()then--are we alive and enabled?
            local a=math.huge
            local penetratrion=gunpendepths[GetGunName()]
            for _,v in pairs(GetEnemys()[1])do--get characters
                for _,c in pairs(Options.Target)do--get part target list
                    local main=v[c]--part to detect
                    local mainmag=(main.Position-game.Workspace.CurrentCamera.CFrame.Position).Magnitude--distance between us
                    if Options.Ignore_Fov then--is ignoring fov
                        if mainmag<a and CanSee(main,Options.Auto_Wall,penetratrion)then
                            a=mainmag
                            target=main
                        end
                    else--i dont wanna explain the lower part just figure it out
                        local center=game.Workspace.CurrentCamera:WorldToViewportPoint(game.Workspace.CurrentCamera.CFrame.Position+game.Workspace.CurrentCamera.CFrame.LookVector)
                        local partloc,isvisible=game.Workspace.CurrentCamera:WorldToScreenPoint(main.Position)
                        if(Vector2.new(partloc.X,partloc.Y)-Vector2.new(center.X,center.Y)).Magnitude<=Options.Fov then
                            if mainmag<a and CanSee(main,Options.Auto_Wall,penetratrion)then
                                target=main
                                a=mainmag
                            end
                        end
                    end
                end
            end
            if target then--have we has target :D
                for _,v in pairs(GetDirChange())do--our direction changes >:)
                    v.Position=game.Workspace.CurrentCamera.CFrame.Position
                    v.Velocity=Vector3.new()--because we remove welds later >:)
                    local weld=v:FindFirstChildWhichIsA("Weld")or v:FindFirstChildWhichIsA("WeldConstraint")
                    if weld then
                        weld:Destroy()--remove weld to remove swat to affecte accuracy
                    end
                    local x,y,z=CFrame.new(v.Position,target.Position+Vector3.new(0,.45,0)):ToEulerAnglesYXZ()
                    v.Orientation=Vector3.new(math.deg(x),math.deg(y),math.deg(z))--my very first silent aim i made came in handy LOL
                end
            else
                local straight=game.Workspace.CurrentCamera.CFrame.LookVector*100000
                for _,v in pairs(GetDirChange())do--fix bullet angle if we nolonger has target
                    v.Position=game.Workspace.CurrentCamera.CFrame.Position
                    v.Velocity=Vector3.new()--because we remove welds later >:)
                    local weld=v:FindFirstChildWhichIsA("Weld")or v:FindFirstChildWhichIsA("WeldConstraint")
                    if weld then
                        weld:Destroy()
                    end
                    local x,y,z=CFrame.new(v.Position,straight):ToEulerAnglesYXZ()
                    v.Orientation=Vector3.new(math.deg(x),math.deg(y),math.deg(z))
                end
            end
        end
    end)
    coroutine.wrap(function()--our fov circle fuck you figure it out urself
        while game.RunService.RenderStepped:Wait()do
            pcall(function()
                if Options.Auto_Shoot and target and iswindowactive()then
                    mouse1press()wait()mouse1rlease()
                end
            end)
        end
    end)()
    coroutine.wrap(function()--our fov circle fuck you figure it out urself
        while wait(1)do
            pcall(function()
                if Options.Enabled and Options.Show_Fov and not Options.Ignore_Fov then
                    local center=game.Workspace.CurrentCamera:WorldToViewportPoint(game.Workspace.CurrentCamera.CFrame.Position+game.Workspace.CurrentCamera.CFrame.LookVector)
                    local a=Drawing.new("Circle")
                    a.Visible=true
                    a.Position=Vector2.new(center.X,center.Y)
                    a.Color=Options.Fov_Color
                    a.Thickness=2.5
                    a.Transparency=1
                    a.NumSides=100
                    a.Radius=Options.Fov
                    coroutine.wrap(function()
                        wait(1.1)
                        a:Remove()
                    end)()
                end
            end)
        end
    end)()
end
setclipboard("ForlornW46#9306")
