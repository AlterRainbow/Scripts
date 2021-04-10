local libr = loadstring(game:HttpGet("https://raw.githubusercontent.com/AlterRainbow/UI-Library/main/UILib.lua"))()
local main = libr:Window("SCP-3008")

local tab = main:Tab("Self")
local tggle = tab:Button("Infinite stamina.", function()
    local at = game.Players.LocalPlayer.Character.Energy
    local metat = getrawmetatable(game)
    local Indexbackup = metat.__index
    
    setreadonly(metat, false)
        
    metat.__index = newcclosure(function(Index, Value)
        if not checkcaller() and Index == at and Value == "Value" then
            return math.huge
        end
            
        return Indexbackup(Index, Value)
    end)
    
    setreadonly(metat, true)
end)

local bttn = tab:Button("Unlimited inventory space.", function()
    local ac = game.Players.LocalPlayer.Settings.MaxInventorySpace
    local mt = getrawmetatable(game)
    local backup = mt.__index
    setreadonly(mt, false)
    
    mt.__index = newcclosure(function(self, key)
        if not checkcaller() and self == ac and key == "Value" then
            return math.huge
        end
        
        return backup(self, key)
    end)
    
    setreadonly(mt, true)
end)

local plrs = {}

for i, v in pairs(game.Players:GetPlayers()) do
    if v ~= game.Players.LocalPlayer then
        table.insert(plrs, v)
    end
end

local tp = tab:Dropdown("TP to players", plrs, function(chsn)
    if game.Players.LocalPlayer.Character and chsn.Character then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = chsn.Character.HumanoidRootPart.CFrame
    end
end)

game.Players.PlayerAdded:Connect(function(playerfag)
    tp:Item(playerfag.Name, playerfag)
end)

game.Players.PlayerRemoving:Connect(function(playernig)
    tp:ItemRemove(playernig.Name)
end)

Settings()
Info()
Credits("Inf stamina and unlimited inv space made by HeIsNotMySon")
