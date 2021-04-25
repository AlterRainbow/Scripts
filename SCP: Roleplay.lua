if not syn then
    game.Players.LocalPlayer:Kick("Dm me if you got protosmasher.")
end
local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/AlterRainbow/UI-Library/main/UILib.lua"))()

local tweenService = game:GetService("TweenService")

local main = lib:Window("SCP: Roleplay")

local ignore = {}

local scps = main:Tab("SCP")

local weap = main:Tab("Weapons")

local CD = main:Tab("Class-D")

local tp = main:Tab("Teleports")

local AntiBan = main:Tab("Anti-Ban")

local hdname = AntiBan:Button("Hide name", function()
    repeat wait() until game.Players.LocalPlayer.Character
    
    game.Players.LocalPlayer.Character.Humanoid.Health = 0

    game.Players.LocalPlayer.CharacterAdded:Connect(function()
        for i = 1, 100 do
            game.Players.LocalPlayer.Character:WaitForChild("Head"):WaitForChild("Tag"):Destroy()
        end
    end)
end)

local plrs = {}

for i, v in pairs(game.Players:GetPlayers()) do
    if v ~= game.Players.LocalPlayer then
        table.insert(plrs, v)
    end
end

local tpplrs = tp:Dropdown("Teleport to a player.", plrs, function(chsn)
    local plrTPINFO = TweenInfo.new(0.1)
    if game.Players.LocalPlayer.Character and chsn.Character then
        tweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, plrTPINFO, {CFrame = chsn.Character.HumanoidRootPart.CFrame}):Play()
    end
end)

game.Players.PlayerAdded:Connect(function(playerfag)
    tpplrs:Item(playerfag.Name, playerfag)
end)

game.Players.PlayerRemoving:Connect(function(playernig)
    tpplrs:ItemRemove(playernig.Name)
end)

local antitggle = AntiBan:Toggle("Leave the game when a moderator joins.", function(banState)
    
    check = banState
    
    while check do
        local mods = loadstring(game:HttpGet("https://raw.githubusercontent.com/AlterRainbow/Scripts/main/SCP%3A%20Roleplay%20Moderators.lua"))()
        
        for gay, moderator in pairs(game.Players:GetPlayers()) do
            if table.find(mods, moderator.Name) then
                if isfolder("SCP Roleplay Anti-ban logs") and isfile("SCP Roleplay Anti-ban logs\\SCP Roleplay.txt") then
                    appendfile("SCP Roleplay Anti-ban logs\\SCP Roleplay.txt", "\nModerator "..moderator.Name.." joined on "..os.date("%c")..".")
                else
                    makefolder("SCP Roleplay Anti-ban logs")
                    writefile("SCP Roleplay Anti-ban logs\\SCP Roleplay.txt", "Moderator "..moderator.Name.." joined on "..os.date("%c")..".")
                end
                game.Players.LocalPlayer:Kick("Moderator "..moderator.Name.." is in the game.")
                wait(10)
                game:Shutdown()
            end
        end
        
        wait()
    end
end)

local tpdp = tp:Dropdown("Teleport to:", {
    ["Class-D Containment"] = CFrame.new(-75.8707504, 40.4824829, 465.459351, 0.999510646, -2.90871527e-09, 0.0312808976, 1.70104031e-09, 1, 3.86340417e-08, -0.0312808976, -3.85619252e-08, 0.999510646),
    ["Chaos Insrugency Spawn"] = CFrame.new(-33.9765739, 87.8479919, 258.198547, 0.998205483, 6.22754426e-09, 0.0598821491, -4.19422319e-09, 1, -3.40810722e-08, -0.0598821491, 3.37687531e-08, 0.998205483),
    ["Administrative Department Spawn"] = CFrame.new(-110.002289, 40.3479767, 274.667328, 1, 0, 0, 0, 1, 0, 0, 0, 1),
    ["Mobile Task Force Spawn"] = CFrame.new(412.470642, 40.3479881, 121.936981, -0.999999881, 4.56792476e-33, 0.000273158774, 4.56850626e-33, 1, 2.12794049e-33, -0.000273158774, 2.12918798e-33, -0.999999881),
    ["Rapid Respone Team Spawn"] = CFrame.new(-466.836151, 93.6979904, 53.1530609, -0.0251200739, 2.87617081e-06, 0.999684691, -1.54432897e-07, 1, -2.88095998e-06, -0.999684691, -2.26754224e-07, -0.0251200739),
    ["O5 Council Spawn"] = CFrame.new(-486.312225, 50.2979698, 112.699371, 0.0236213263, -8.20277712e-09, 0.999720991, 4.27345326e-10, 1, 8.19497004e-09, -0.999720991, 2.33650016e-10, 0.0236213263),
    ["Internal Security Spawn"] = CFrame.new(-595.029846, 40.3479881, 205.168381, 0.00491444301, 0, -0.999987721, 0, 1, 0, 0.999987721, 0, 0.00491444301),
    ["Intelligence Agency Spawn"] = CFrame.new(-610.94696, 40.3479881, 202.350006, 1, 0, 0, 0, 1, 0, 0, 0, 1),
    ["Security Department Spawn"] = CFrame.new(-597.346497, 40.3479881, -36.1572418, -0.0154640637, -0.000159070245, -0.999880612, 5.64969014e-06, 1, -0.000159176649, 0.999880612, -8.11053542e-06, -0.0154640637),
    ["Scientific Department Spawn"] = CFrame.new(72.9009857, 40.3479881, -234.726379, -0.00835041888, -9.10305999e-08, 0.999965131, 8.33635649e-09, 1, 9.11033879e-08, -0.999965131, 9.09681752e-09, -0.00835041888),
    ["SCP-066 Containment"] = CFrame.new(-213.243958, 40.3479881, -35.3706017, 0.111836486, -7.95001611e-08, 0.993726611, 6.50672138e-09, 1, 7.92697676e-08, -0.993726611, -2.39934961e-09, 0.111836486),
    ["SCP-131 Containment"] = CFrame.new(-212.714813, 40.3479767, 300.635315, -0.0625468865, 2.84567534e-08, 0.998042047, -2.25722818e-08, 1, -2.99271754e-08, -0.998042047, -2.43999381e-08, -0.0625468865),
    ["SCP-023 Containment"] = CFrame.new(257.263519, 40.3479881, 247.392044, -0.0668234006, -2.46283829e-08, -0.997764826, 8.71536177e-11, 1, -2.46893919e-08, 0.997764826, -1.73678794e-09, -0.0668234006),
    ["SCP-173 Containment"] = CFrame.new(205.168274, 53.9479828, 99.2570419, -0.0239511728, -1.64060673e-29, 0.999713063, -2.06855619e-29, 1, 1.59151899e-29, -0.999713063, -2.0298441e-29, -0.0239511728),
    ["SCP-096 Containment"] = CFrame.new(650.145325, 40.3479881, -151.293854, -0.0346832275, -0, -0.99939841, 0, 1, -0, 0.99939841, 0, -0.0346832275),
    ["SCP-008 Containment"] = CFrame.new(526.653442, 40.3479881, 368.694946, -0.999994099, -2.60325406e-09, 0.00344139407, -2.8720808e-09, 1, -7.8110709e-08, -0.00344139407, -7.81201308e-08, -0.999994099),
    ["SCP-002 Containment"] = CFrame.new(-83.6653442, 20.0985031, 117.051331, 0.99993217, 0, 0.0116486652, 0, 1, 0, -0.0116486652, 0, 0.99993217),
    ["SCP-1025 Containment"] = CFrame.new(67.8757935, 40.3479881, -151.297623, -0.013194263, -1.93714628e-11, -0.999913037, -1.73909619e-11, 1, -1.91436693e-11, 0.999913037, 1.71368614e-11, -0.013194263),
    ["SCP-2950 Containment"] = CFrame.new(-215.232849, 40.3479881, 192.785034, -0.000512978644, 4.49416468e-08, 0.999999881, -1.05422848e-09, 1, -4.4942194e-08, -0.999999881, -1.07728271e-09, -0.000512978644),
    ["SCP-1299"] = CFrame.new(138.356674, 40.3479881, -66.5386963, -0.999959707, 0, 0.00898625329, 0, 1, -0, -0.00898625329, 0, -0.999959707),
    ["SCP-457 Containment"] = CFrame.new(443.827515, 40.3479881, 173.245941, -0.999660969, 0, 0.0260475371, 0, 1, 0, -0.0260475371, 0, -0.999660969),
    ["SCP-049 Containment"] = CFrame.new(607.829102, 40.3479881, 50.6000938, -0.0166237336, 0, 0.999861836, 0, 1, 0, -0.999861836, 0, -0.0166237336),
    ["SCP-966 Containment"] = CFrame.new(607.829102, 40.3479881, 50.6000938, -0.0166237336, 0, 0.999861836, 0, 1, 0, -0.999861836, 0, -0.0166237336),
    ["SCP-409 Containment"] = CFrame.new(-43.700367, 40.3479729, -69.2229919, -0.997379243, -8.02359779e-08, -0.0723508447, -7.92350292e-08, 1, -1.67048082e-08, 0.0723508447, -1.09283071e-08, -0.997379243),
    ["Helipad"] = CFrame.new(-573.932983, 31.156765, 482.278534, 0.999801993, 0, 0.0198955834, 0, 1, 0, -0.0198955834, 0, 0.999801993),
    ["Containment Shelter"] = CFrame.new(230.015823, 40.3044395, 418.03009, 0.999654591, 2.28488261e-06, 0.0262805205, -1.49617236e-07, 1, -8.12514336e-05, -0.0262805205, 8.12194412e-05, 0.999654591),
    ["Nuclear Blast Shelter"] = CFrame.new(234.370987, 40.3044395, 461.834869, 0.999883413, 1.88937497e-06, 0.015285152, -1.38187727e-06, 1, -3.32125855e-05, -0.015285152, 3.31875817e-05, 0.999883413),
},

    function(place)
        repeat wait() until game.Players.LocalPlayer.Character.HumanoidRootPart
        local plr = game.Players.LocalPlayer
        local plrRoot = plr.Character.HumanoidRootPart
        local tpInfo = TweenInfo.new(0.1)
        
        plr.Character.Humanoid.StateChanged:Connect(function(OLDSTATE, NEWSTATE)
            if NEWSTATE == Enum.HumanoidStateType.Seated then
                plr.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
            end
        end)
        
        tweenService:Create(plrRoot, tpInfo, {CFrame = place}):Play()
    end
)

local Butten = CD:Button("Escape as a Class-D", function()
    repeat wait() until game.Players.LocalPlayer.Character.HumanoidRootPart
    local plrTeam = game.Players.LocalPlayer.Team
    if plrTeam ~= game:GetService("Teams")["Class - D"] then
        print("You are not a Class-D.")
        return
    end
    local plr = game.Players.LocalPlayer
    local plrRoot = plr.Character.HumanoidRootPart
    local Dinfo = TweenInfo.new(0.1)
    tweenService:Create(plrRoot, Dinfo, {CFrame = CFrame.new(-33.9765739, 87.8479919, 258.198547, 0.998205483, 6.22754426e-09, 0.0598821491, -4.19422319e-09, 1, -3.40810722e-08, -0.0598821491, 3.37687531e-08, 0.998205483)}):Play()
end)

local tggle = scps:Toggle("Infect everyone with SCP-409.", function(state)
    run = state
    
    local scp = game.workspace.SCPs["SCP-409"]
    local INFO = TweenInfo.new(0.0000000001)
    
    while run do
        repeat wait() until game.Players.LocalPlayer.Character.HumanoidRootPart
        local plr = game.Players.LocalPlayer
        local plrRoot = plr.Character.HumanoidRootPart
        
        firetouchinterest(plrRoot, scp, 0)
        firetouchinterest(plrRoot, scp, 1)
        
        for i, v in pairs(game.Players:GetPlayers()) do
            if v ~= plr and not table.find(ignore, v.Name) then
                if v.Character.HumanoidRootPart and game.Players.LocalPlayer.Character.HumanoidRootPart then
                    local completed = false
                    local current = tweenService:Create(plrRoot, INFO, {CFrame = v.Character.HumanoidRootPart.CFrame})
                    
                    current.Completed:Connect(function()
                        completed = true
                    end)
                        
                    current:Play()
                    
                    repeat wait() until completed
                end
            end
        end
        error("ass")
        break
    end
end)

local notice = scps:Label("The game devs have disabled SCP-409.")

local zombie = scps:Toggle("Infect everyone with SCP-008.", function(nig)
    cock = nig
    
    local zombie = game:GetService("Workspace").SCPs["SCP-008"].Particle
    local INFO = TweenInfo.new(0.0000000001)
    
    while cock do
        repeat wait() until game.Players.LocalPlayer.Character.HumanoidRootPart
        local plr = game.Players.LocalPlayer
        local plrRoot = plr.Character.HumanoidRootPart
        local zombieInfo = TweenInfo.new(0.5)
        
        tweenService:Create(plrRoot, zombieInfo, {CFrame = zombie.CFrame}):Play()
        
        plr.Character.Humanoid.StateChanged:Connect(function(OLDSTATE, NEWSTATE)
            if NEWSTATE == Enum.HumanoidStateType.Seated then
                plr.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
            end
        end)
        
        wait(1)
        
        for i, v in pairs(game.Players:GetPlayers()) do
            if v ~= plr and not table.find(ignore, v.Name) then
                if v.Character.HumanoidRootPart and game.Players.LocalPlayer.Character.HumanoidRootPart then
                    local completed = false
                    local current = tweenService:Create(plrRoot, INFO, {CFrame = v.Character.HumanoidRootPart.CFrame})
                    
                    current.Completed:Connect(function()
                        completed = true
                    end)
                    
                    current:Play()
                    
                    wait(.3)
                    
                    repeat wait() until completed
                end
            end
        end
        error("ass")
        break
    end
end)

local bttn = scps:Button("Enrage SCP-096", function()
    repeat wait() until game.Players.LocalPlayer.Character.HumanoidRootPart
    local plr = game.Players.LocalPlayer
    local plrRoot = plr.Character.HumanoidRootPart
    local old = plrRoot.CFrame
    local sgInfo = TweenInfo.new(0.1)
    local sgTween = tweenService:Create(plrRoot, sgInfo, {CFrame = game:GetService("Workspace").SCPs["SCP-096"].Rig.Head.CFrame})
    
    plr.Character.Humanoid.StateChanged:Connect(function(OLDSTATE, NEWSTATE)
        if NEWSTATE == Enum.HumanoidStateType.Seated then
            plr.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
        end
    end)
    
    sgTween.Completed:Connect(function()
        wait(5)
        tweenService:Create(plrRoot, sgInfo, {CFrame = old}):Play()
    end)
    
    sgTween:Play()
end)

local bttn = weap:Button("Get SCAR-H", function()
    repeat wait() until game.Players.LocalPlayer.Character.HumanoidRootPart
    local plr = game.Players.LocalPlayer
    local plrRoot = plr.Character.HumanoidRootPart
    local old = plrRoot.CFrame
    local Hinfo = TweenInfo.new(0.1)
    local hTween = tweenService:Create(plrRoot, Hinfo, {CFrame = CFrame.new(-33.9765739, 87.8479919, 258.198547, 0.998205483, 6.22754426e-09, 0.0598821491, -4.19422319e-09, 1, -3.40810722e-08, -0.0598821491, 3.37687531e-08, 0.998205483)})
    
    hTween.Completed:Connect(function()
        repeat wait() until game.Players.LocalPlayer.Backpack:FindFirstChild("Scar - H")
        tweenService:Create(plrRoot, Hinfo, {CFrame = old}):Play()
    end)
    
    hTween:Play()
end)

Settings()
Info()
Credits("Scripts by Alter#6089")
