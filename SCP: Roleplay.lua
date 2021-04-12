local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/AlterRainbow/UI-Library/main/UILib.lua"))()

local tweenService = game:GetService("TweenService")

local main = lib:Window("SCP: Roleplay")

local scps = main:Tab("SCP")

local ignore = {"playernames"}

local tggle = scps:Toggle("Infect everyone with SCP-409.", function(state)
    run = state
    
    local scp = game.workspace.SCPs["SCP-409"]
    local INFO = TweenInfo.new(0.1)
    
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

local bttn = scps:Button("Enrage SCP-096", function()
    repeat wait() until game.Players.LocalPlayer.Character.HumanoidRootPart
    local plr = game.Players.LocalPlayer
    local plrRoot = plr.Character.HumanoidRootPart
    local sgInfo = TweenInfo.new(0.5)
    tweenService:Create(plrRoot, sgInfo, {CFrame = (game:GetService("Workspace").SCPs["SCP-096"].Rig.Head.CFrame * CFrame.Angles (0, 0, 180))}):Play()
end)

Settings()
Info()
Credits("Scripts by AlterRainbow#6089")
