if not syn then
    game.Players.LocalPlayer:Kick("Dm me if you got protosmasher.")
end

local function Chams(parents, parts, color, onlyPlayers)
    local localPlayer = game.Players.LocalPlayer
    local parents = parents or {localPlayer.Name}
	local parts = parts or {"HumanoidRootPart"}
	local color = color or Color3.fromRGB(62, 74, 88)
	local onlyPlayers = onlyPlayers or false
    local faces = {"Front", "Top", "Back", "Bottom", "Right", "Left"}
    local instances = {}
	
	if onlyPlayers then
        for playerIndex, player in pairs(game.Players:GetPlayers()) do
            if player ~= localPlayer then
                for playerDescendantIndex, playerDescendant in pairs(player.Character:GetDescendants()) do
                    if table.find(parts, playerDescendant.Name) then
                        for faceIndex, face in pairs(faces) do
                            local surface = Instance.new("SurfaceGui", playerDescendant)
                            local frame = Instance.new("Frame", surface)
                
                            surface.Adornee = playerDescendant
                            surface.AlwaysOnTop = true
                            surface.Face = Enum.NormalId[face]
                            surface.Name = face
                            surface.ResetOnSpawn = false
                
                            frame.BackgroundColor3 = color
                            frame.BackgroundTransparency = 0.6
                            frame.Name = face
                            frame.Size = UDim2.new(1, 0, 1, 0)
                
                            table.insert(instances, surface)
                        end
                    end
                end
            end
        end
    else
        for descendantIndex, descendant in pairs(game.Workspace:GetDescendants()) do
            if descendant:IsA("Part") and table.find(parts, descendant.Name) then
                for parentIndex, parent in pairs(parents) do
                    if parent == descendant.Parent.Name then
                        if table.find(parts, descendant.Name) then
                            for faceIndex, face in pairs(faces) do
                                local surface = Instance.new("SurfaceGui", descendant)
                                local frame = Instance.new("Frame", surface)
                        
                                surface.Adornee = descendant
                                surface.AlwaysOnTop = true
                                surface.Face = Enum.NormalId[face]
                                surface.Name = face
                                surface.ResetOnSpawn = false
                    
                                frame.BackgroundColor3 = color
                                frame.BackgroundTransparency = 0.6
                                frame.Name = face
                                frame.Size = UDim2.new(1, 0, 1, 0)
                        
                                table.insert(instances, surface)
                            end
                        end
                    end
                end
            end
        end
    end

    return instances
end

local runsrvc = game:GetService("RunService")

local Alterlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/AlterRainbow/UI-Library/main/UILib.lua"))()

local main = Alterlib:Window("The Maze")

local tab = main:Tab("Items")

local plrTAB = main:Tab("Local")

local monsters = main:Tab("Monsters")

local togglecrajol = monsters:Toggle("The Crajoler Chams", function(crajol)
    local crajolparents = {"TheCajoler"}
    local crajolparts = {"HumanoidRootPart"}
    
    local see = crajol
    
    if see == true then
        crajolchams = Chams(crajolparents, crajolparts, Color3.fromRGB(255, 0, 0), false)
    elseif see == false then
        for crajolchamindex, crajolcham in pairs(crajolchams) do
            crajolcham:destroy()
        end
    end
end)

local toggleorto = monsters:Toggle("The Orotund Chams", function(orotund)
    local ortoparents = {"TheOrotund"}
    local ortoparts = {"HumanoidRootPart"}
    
    local chamm = orotund
    
    if chamm == true then
        ortochams = Chams(ortoparents, ortoparts, Color3.fromRGB(255, 0, 0), false)
    elseif chamm == false then
        for ortochamindex, ortocham in pairs(ortochams) do
            ortocham:destroy()
        end
    end
end)

local welksped = plrTAB:Slider("Speed", 0, 120, 16, function(davalue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = davalue
end)

local camPath

for i, v in pairs(game.workspace:GetChildren()) do
    if v.Name == "Camera" and v.ClassName == "Model" then
        camPath = v.Camera
    end
end

local battry
local golemtesticle

for i, v in pairs(game.workspace.SpawnedObjects:GetChildren()) do
    if tostring(string.sub(v.Name, 1, 7)) == "Battery" and v.ClassName == "Model" then
        battry = v.Handle
    end
end

for i, v in pairs(game.workspace.SpawnedObjects:GetChildren()) do
    if tostring(string.sub(v.Name, 1, 4)) == "Rock" and v.ClassName == "Model" then
        golemtesticle = v.Handle
    end
end

local nigger = tab:Dropdown("Give item:", {["Camera"] = camPath, ["Rock"] = golemtesticle, ["Battery"] = battry}, function(cbh)
    fireclickdetector(cbh.ClickDetector)
end)
local code = tab:Label("Code: "..game.workspace.CodeValues.Code.Value)
local axe = tab:Keybind("Give an axe.", "F", function() fireclickdetector(game.workspace.Axe.Handle.ClickDetector) end)

JesusLight = Instance.new("PointLight")
JesusLight = Instance.new("PointLight")
JesusLight.Name = "JESUS"
JesusLight.Parent = game.Players.LocalPlayer.Character:WaitForChild("Torso")
JesusLight.Brightness = 8
JesusLight.Color = Color3.fromRGB(255, 255, 255)
JesusLight.Enabled = false
JesusLight.Range = 60

game.Players.LocalPlayer.CharacterAdded:Connect(function()
    JesusLight = Instance.new("PointLight")
    JesusLight = Instance.new("PointLight")
    JesusLight.Name = "JESUS"
    JesusLight.Parent = game.Players.LocalPlayer.Character:WaitForChild("Torso")
    JesusLight.Brightness = 8
    JesusLight.Color = Color3.fromRGB(255, 255, 255)
    JesusLight.Enabled = false
    JesusLight.Range = 60
end)

local jesus = plrTAB:Toggle("Be a flashlight.", function(t)
    run = t
    JesusLight.Brightness = 8
    
    while run do 
        wait()
        JesusLight.Enabled = run
    end
end)

Time = 0.01

local function RGB(X)
    return math.acos(math.cos(X*math.pi))/math.pi
end

local rnb = plrTAB:Toggle("RGB Flashlight", function(ass)
    rgbnigga = ass
    
    while rgbnigga do
        wait(0.1)
        if game.Players.LocalPlayer.Character.Torso.JESUS then
		    game.Players.LocalPlayer.Character.Torso.JESUS.Color = Color3.fromHSV(RGB(Time), 1, 1)
		    Time = Time + 0.02
		end
    end
    
    if rgbnigga == false then
        if game.Players.LocalPlayer.Character.Torso.JESUS then
		    game.Players.LocalPlayer.Character.Torso.JESUS.Color = Color3.fromRGB(255, 255, 255)
        end
    end
end)

local slideflash = plrTAB:Slider("Brightness", 0, 10, 8, function(bright)
    if game.Players.LocalPlayer.Character.Torso.JESUS then
        game.Players.LocalPlayer.Character.Torso.JESUS.Brightness = bright
    end
end)

Settings()
Info()
Credits("Scripts by: Alter#6089")
