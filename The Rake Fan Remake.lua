local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/AlterRainbow/UI-Library/main/UILib.lua"))()

local main = lib:Window("The Rake Fan Remake")

local tp = main:Tab("Teleports")

local dropTP = tp:Dropdown("Teleport to:", {
    ["Shop"] = game:GetService("Workspace").ShopGuy.HumanoidRootPart.Position + Vector3.new(-10, 0, 0),
    ["Plane"] = game:GetService("Workspace").SuperplaneIdle.Propeller.Position,
    ["Burnt House"] = game:GetService("Workspace").BurntHouse.Table.Part.Position + Vector3.new(0, 5, 0),
    ["Bunker"] = game:GetService("Workspace").Bunker["Bunker (Exterior)"]["Wooden Crate"].Crate.Part.Position + Vector3.new(0, 3, 0),
    ["Power Station"] = game:GetService("Workspace").PowerStation.InteractionPart.Position,
    ["Radio Station"] = game:GetService("Workspace").RadioStation.CollisionModel.Part.Position,
    ["Tower 1"] = game:GetService("Workspace").Tower.Top.Chair.Position + Vector3.new(0, 4, 0),
    ["Tower 2"] = game:GetService("Workspace").Tower2.Floor.Position + Vector3.new(0, 5, 0),
    ["Campsite"] = game:GetService("Workspace").Campsite["Wooden Crate of Bottle of Wo'A"]["Wooden Crate (Empty)"].Union.Position
    },
    function(chsn)
        if not game.Players.LocalPlayer.Character then
            return
        else
            game.Players.LocalPlayer.Character.HumanoidRootPart.Position = chsn
        end
    end)
    
local plrs = {}

for i, v in pairs(game.Players:GetPlayers()) do
    if v ~= game.Players.LocalPlayer then
        table.insert(plrs, v)
    end
end
    
local plrsTP = tp:Dropdown("Teleport to a player:", plrs, function(playr)
    if not playr.Character then
        return
    elseif not game.Players.LocalPlayer.Character then
        return
    else
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = playr.Character.HumanoidRootPart.CFrame
    end
end)

game.Players.PlayerAdded:Connect(function(plrnig)
    plrsTP:Item(plrnig.Name, plrnig)
end)

game.Players.PlayerRemoving:Connect(function(plrfag)
    plrsTP:ItemRemove(plrfag.Name)
end)

local raketab = main:Tab("Rake")

local tggleantirake = raketab:Toggle("Anti-rake", function(stte)
    
    run = stte
    behind = false
    
    while run do
        repeat wait() until game.Players.LocalPlayer.Character.HumanoidRootPart
        repeat wait() until game.workspace.Rake
        
        local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game.workspace.Rake.HumanoidRootPart.Position).Magnitude
        
        if distance < 35 then
            if behind then
                game.Players.LocalPlayer.Character.HumanoidRootPart.Position = (game.workspace.Rake.HumanoidRootPart.Position + Vector3.new(0, 0, -40))
            elseif behind == false then
                game.Players.LocalPlayer.Character.HumanoidRootPart.Position = (game.workspace.Rake.HumanoidRootPart.Position + Vector3.new(0, 0, 40))
            end
            
            behind = not behind 
        end
        wait()
    end
end)

local selftab = main:Tab("Local")

local sped = selftab:Slider("Walkspeed", 0, 100, 16, function(spedvalue)
    if not game.Players.LocalPlayer.Character.Humanoid then
        return
    else
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = spedvalue
    end
end)

local jump = selftab:Slider("Jumppower", 0, 200, 50, function(jumpvalue)
    if not game.Players.LocalPlayer.Character.Humanoid then
        return
    else
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = jumpvalue
    end
end)

if not game.Players.LocalPlayer.Character.Torso then
    repeat wait()
    until game.Players.LocalPlayer.Character.Torso
end

JesusLight = Instance.new("PointLight")
JesusLight.Name = "JESUS"
JesusLight.Parent = game.Players.LocalPlayer.Character.Torso
JesusLight.Brightness = 8
JesusLight.Color = Color3.fromRGB(255, 255, 255)
JesusLight.Enabled = false
JesusLight.Range = 60

game.Players.LocalPlayer.CharacterAdded:Connect(function()
    JesusLight = Instance.new("PointLight")
    JesusLight.Name = "JESUS"
    JesusLight.Parent = game.Players.LocalPlayer.Character:WaitForChild("Torso")
    JesusLight.Brightness = 8
    JesusLight.Color = Color3.fromRGB(255, 255, 255)
    JesusLight.Enabled = false
    JesusLight.Range = 60
end)

local jesus = selftab:Toggle("Be a flashlight.", function(t)
    dool = t
    
    while dool do 
        wait()
        JesusLight.Enabled = dool
        
        if JesusLight.Brightness == 0 then
            JesusLight.Brightness = 8
        end
    end
end)

Time = 0.01

local function RGB(X)
    return math.acos(math.cos(X*math.pi))/math.pi
end

local rnb = selftab:Toggle("RGB Flashlight", function(ass)
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

local slideflash = selftab:Slider("Brightness", 0, 10, 10, function(bright)
    if game.Players.LocalPlayer.Character.Torso.JESUS then
        game.Players.LocalPlayer.Character.Torso.JESUS.Brightness = bright
    end
end)

Settings()
Info()
Credits("Scripts by AlterRainbow#6089")
