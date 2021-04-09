local runsrvc = game:GetService("RunService")

local alterlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/AlterRainbow/UILibV7/main/UILibv1.0.lua"))()

local main = alterlib:Window("The Maze")

local tab = main:Tab("Items")

local plrTAB = main:Tab("Local")

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
JesusLight.Brightness = 10
JesusLight.Color = Color3.fromRGB(255, 255, 255)
JesusLight.Enabled = false
JesusLight.Range = 60

game.Players.LocalPlayer.CharacterAdded:Connect(function()
    JesusLight = Instance.new("PointLight")
    JesusLight = Instance.new("PointLight")
    JesusLight.Name = "JESUS"
    JesusLight.Parent = game.Players.LocalPlayer.Character:WaitForChild("Torso")
    JesusLight.Brightness = 10
    JesusLight.Color = Color3.fromRGB(255, 255, 255)
    JesusLight.Enabled = false
    JesusLight.Range = 60
end)

local jesus = tab:Toggle("Be a flashlight.", function(t)
    run = t
    
    while run do 
        wait()
        JesusLight.Enabled = run
    end
end)

Time = 0.01

local function RGB(X)
    return math.acos(math.cos(X*math.pi))/math.pi
end

local rnb = tab:Toggle("RGB Flashlight", function(ass)
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

local slideflash = tab:Slider("Brightness", 0, 10, 10, function(bright)
    if game.Players.LocalPlayer.Character.Torso.JESUS then
        game.Players.LocalPlayer.Character.Torso.JESUS.Brightness = bright
    end
end)

Settings()
Credits("Scripts by: AlterRainbow#6089")