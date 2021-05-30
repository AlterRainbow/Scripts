--// Variables \\--

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/AlterRainbow/Scripts/main/VenyxCustom.lua", true))()
local moderators = loadstring(game:HttpGet("https://raw.githubusercontent.com/AlterRainbow/Scripts/main/SCP%3A%20Roleplay%20Moderators.lua"))()
local tweenService = game:GetService("TweenService")
local localPlayer = game.Players.LocalPlayer
local scpsPath = game.workspace.SCPs
local scp409 = scpsPath["SCP-409"]
local scp008 = scpsPath["SCP-008"]
local scp096 = scpsPath["SCP-096"]
local fastTweenInfo = TweenInfo.new(0.1)
local slowTweenInfo = TweenInfo.new(0.9)

local players = {}
local locations = {
    ["Class-D Containment"] = CFrame.new(-75.8707504, 40.4824829, 465.459351, 0.999510646, -2.90871527e-09, 0.0312808976, 1.70104031e-09, 1, 3.86340417e-08, -0.0312808976, -3.85619252e-08, 0.999510646),
    ["Chaos Insrugency Spawn"] = CFrame.new(-33.9765739, 87.8479919, 258.198547, 0.998205483, 6.22754426e-09, 0.0598821491, -4.19422319e-09, 1, -3.40810722e-08, -0.0598821491, 3.37687531e-08, 0.998205483),
    ["Administrative Department Spawn"] = CFrame.new(-440.00769, 46.2479858, 160.881638, -0.0384097248, 7.95913309e-08, 0.999262154, 4.70877914e-08, 1, -7.78401414e-08, -0.999262154, 4.40632313e-08, -0.0384097248),
    ["Mobile Task Force Spawn"] = CFrame.new(410.456787, 40.3479767, 64.8888702, -0.999749601, -9.25807326e-05, -0.0223641731, -6.51823066e-05, 0.999999225, -0.00122582831, 0.0223642793, -0.00122406369, -0.999748826),
    ["Rapid Respone Team Spawn"] = CFrame.new(-466.836151, 93.6979904, 53.1530609, -0.0251200739, 2.87617081e-06, 0.999684691, -1.54432897e-07, 1, -2.88095998e-06, -0.999684691, -2.26754224e-07, -0.0251200739),
    ["O5 Council Spawn"] = CFrame.new(-486.312225, 50.2979698, 112.699371, 0.0236213263, -8.20277712e-09, 0.999720991, 4.27345326e-10, 1, 8.19497004e-09, -0.999720991, 2.33650016e-10, 0.0236213263),
    ["Internal Security Spawn"] = CFrame.new(-595.029846, 40.3479881, 205.168381, 0.00491444301, 0, -0.999987721, 0, 1, 0, 0.999987721, 0, 0.00491444301),
    ["Intelligence Agency Spawn"] = CFrame.new(-610.94696, 40.3479881, 202.350006, 1, 0, 0, 0, 1, 0, 0, 0, 1),
    ["Security Department Spawn"] = CFrame.new(-597.346497, 40.3479881, -36.1572418, -0.0154640637, -0.000159070245, -0.999880612, 5.64969014e-06, 1, -0.000159176649, 0.999880612, -8.11053542e-06, -0.0154640637),
    ["Scientific Department Spawn"] = CFrame.new(283.800873, 40.3479881, 39.8547478, 0.999829412, -1.12988778e-06, 0.0184787326, 1.3762342e-06, 1, -1.33185131e-05, -0.0184787326, 1.33416743e-05, 0.999829412),
    ["SCP-066 Containment"] = CFrame.new(-229.693985, 40.3479881, -41.3093719, 0.0462895148, 0, 0.998927951, 0, 1, 0, -0.998927951, 0, 0.0462895148),
    ["SCP-131 Containment"] = CFrame.new(-229.452576, 40.3479881, 299.949951, -0.999163032, 3.26003351e-06, 0.0409003645, 7.09775975e-07, 1, -6.23673841e-05, -0.0409003645, -6.22861844e-05, -0.999163032),
    ["SCP-023 Containment"] = CFrame.new(278.337036, 40.3969994, 251.396317, 0.995279849, -5.6657794e-09, -0.0970467106, -1.09434753e-10, 1, -5.95043126e-08, 0.0970467106, 5.92340612e-08, 0.995279849),
    ["SCP-173 Containment"] = CFrame.new(203.690536, 53.9479828, 154.112366, -0.0269999951, 0, 0.999635518, 0, 1, 0, -0.999635518, 0, -0.0269999951),
    ["SCP-096 Containment"] = CFrame.new(650.145325, 40.3479881, -151.293854, -0.0346832275, -0, -0.99939841, 0, 1, -0, 0.99939841, 0, -0.0346832275),
    ["SCP-008 Containment"] = CFrame.new(526.653442, 40.3479881, 368.694946, -0.999994099, -2.60325406e-09, 0.00344139407, -2.8720808e-09, 1, -7.8110709e-08, -0.00344139407, -7.81201308e-08, -0.999994099),
    ["SCP-002 Containment"] = CFrame.new(-83.6653442, 20.0985031, 117.051331, 0.99993217, 0, 0.0116486652, 0, 1, 0, -0.0116486652, 0, 0.99993217),
    ["SCP-1025 Containment"] = CFrame.new(557.236755, 40.3479881, -154.547607, 0.999593019, 0, 0.0285278056, 0, 1, 0, -0.0285278056, 0, 0.999593019),
    ["SCP-2950 Containment"] = CFrame.new(-228.764801, 40.3479881, 181.870529, -0.0222034678, 5.59627473e-08, 0.999753416, 6.1455645e-09, 1, -5.58400757e-08, -0.999753416, 4.90420549e-09, -0.0222034678),
    ["SCP-1299 Containment"] = CFrame.new(131.087753, 40.3479881, -52.2083168, -0.999739289, -2.9651094e-08, 0.0228321478, -3.22316467e-08, 1, -1.12654789e-07, -0.0228321478, -1.13361352e-07, -0.999739289),
    ["SCP-457 Containment"] = CFrame.new(781.434753, 40.3479881, -53.7052574, -1, -9.03498526e-11, 8.32227015e-05, -9.05757136e-11, 1, -2.71390777e-09, -8.32227015e-05, -2.71391531e-09, -1),
    ["SCP-049 Containment"] = CFrame.new(588.777649, 41.3043518, 50.7085762, -0.0229714476, -3.94236892e-08, 0.99973613, -8.37877394e-08, 1, 3.75088618e-08, -0.99973613, -8.29039948e-08, -0.0229714476),
    ["SCP-966 Containment"] = CFrame.new(686.146545, 40.3479881, 61.1217422, -0.0701451972, -6.58064581e-09, -0.997536778, -2.3809682e-10, 1, -6.58015287e-09, 0.997536778, -2.24055802e-10, -0.0701451972),
    ["SCP-409 Containment"] = CFrame.new(-83.4825287, 36.3777657, -26.4090843, -0.99308461, -1.62683227e-05, -0.117396154, 1.78790306e-05, 0.99999994, -0.000289819727, 0.117396154, -0.000289914547, -0.99308461),
    ["Helipad"] = CFrame.new(-573.932983, 31.156765, 482.278534, 0.999801993, 0, 0.0198955834, 0, 1, 0, -0.0198955834, 0, 0.999801993),
    ["Containment Shelter"] = CFrame.new(230.015823, 40.3044395, 418.03009, 0.999654591, 2.28488261e-06, 0.0262805205, -1.49617236e-07, 1, -8.12514336e-05, -0.0262805205, 8.12194412e-05, 0.999654591),
    ["Nuclear Blast Shelter"] = CFrame.new(234.370987, 40.3044395, 461.834869, 0.999883413, 1.88937497e-06, 0.015285152, -1.38187727e-06, 1, -3.32125855e-05, -0.015285152, 3.31875817e-05, 0.999883413),
    ["Mysterious Room"] = CFrame.new(-34.5104599, 9.65492439, -249.908783, -0.999999285, -5.07114306e-09, 0.00101857481, -5.20921484e-09, 1, -1.35551488e-07, -0.00101857481, -1.35556718e-07, -0.999999285),
}
local locationNames = {
    "Class-D Containment",
    "Chaos Insrugency Spawn",
    "Administrative Department Spawn",
    "Mobile Task Force Spawn",
    "Rapid Respone Team Spawn",
    "O5 Council Spawn",
    "Internal Security Spawn",
    "Intelligence Agency Spawn", 
    "Security Department Spawn",
    "Scientific Department Spawn", 
    "SCP-066 Containment", 
    "SCP-131 Containment", 
    "SCP-023 Containment", 
    "SCP-173 Containment", 
    "SCP-096 Containment", 
    "SCP-008 Containment",
    "SCP-002 Containment", 
    "SCP-1025 Containment", 
    "SCP-2950 Containment", 
    "SCP-1299 Containment", 
    "SCP-457 Containment", 
    "SCP-049 Containment", 
    "SCP-966 Containment", 
    "SCP-409 Containment", 
    "Helipad",
    "Containment Shelter",
    "Nuclear Blast Shelter",
    "Mysterious Room"
}

--// Functions \\--

local function GetLocalPlayerCharacter()
    repeat wait() until localPlayer.Character

    return localPlayer.Character
end

local function GetLocalPlayerHumanoidRootPart()
    repeat wait() until GetLocalPlayerCharacter().HumanoidRootPart

    return GetLocalPlayerCharacter().HumanoidRootPart
end

local function TweenTo(cframe, fastMode)
    local cframe = cframe or GetLocalPlayerHumanoidRootPart().CFrame
    local fastMode = fastMode or true

    if fastMode then
        tweenService:Create(GetLocalPlayerHumanoidRootPart(), fastTweenInfo, {CFrame = cframe}):Play()
    else
        tweenService:Create(GetLocalPlayerHumanoidRootPart(), slowTweenInfo, {CFrame = cframe}):Play()
    end
end

--// UI Variables \\--

local main = library.new("SCP: Roleplay")
local scps = main:Page("SCP")
local combat = main:Page("Combat")
local teleports = main:Page("Teleports")
local antiBan = main:Page("Anti-Ban")
local settings = main:Page("Settings")

local infectors = scps:Section("Infectors")
local other = scps:Section("Other")
local weapons = combat:Section("Weapons")
local teleportLocations = teleports:Section("Locations")
local antibanSection = antiBan:Section("Anti-ban")
local UIsection = settings:Section("UI")

--// Settings Page \\--

UIsection:Keybind("Toggle UI", Enum.KeyCode.RightShift, function()
    main:toggle()
end, function() end)

--// SCPs Tab \\--

infectors:Button("Temporarily disabled.", function() print("Venyx doesn't have labels, that is why you pressed this button.") end)

--[[local infect409 = scps:Toggle("Infect everyone with SCP-409.", function(state)
    run409 = state
    
    while run409 do
        local startingCFrame = GetLocalPlayerHumanoidRootPart().CFrame
        
        repeat
            TweenTo(CFrame.new(-92.116951, 36.3777542, -8.34976864, -0.995872736, 6.13096702e-08, -0.0907606483, 6.68435476e-08, 1, -5.79325743e-08, 0.0907606483, -6.37602326e-08, -0.995872736), true)
            wait()
        until localPlayer.Character.RightLowerArm:FindFirstChild("Crystal")
        
        for x, y in pairs(game.Players:GetPlayers()) do
            if y ~= localPlayer and GetLocalPlayerHumanoidRootPart() and y.Character.HumanoidRootPart then
                repeat
                    TweenTo(y.Character.HumanoidRootPart.CFrame, true)
                    wait()
                until y.Character.RightLowerArm:FindFirstChild("Crystal") or localPlayer.Character.Humanoid.Health == 0 or y.Character.Humanoid.Health == 0
            end
        end

        error("")
        break
    end
end)

local infect008 = scps:Toggle("Infect everyone with SCP-008.", function(state)
    run008 = state
    
    while run008 do        
        local startingCFrame = GetLocalPlayerHumanoidRootPart().CFrame

        TweenTo(scp008.Particle.CFrame, false)
        
        wait(2)

        for a, b in pairs(game.Players:GetPlayers()) do
            if b ~= localPlayer and GetLocalPlayerHumanoidRootPart() and b.Character.HumanoidRootPart and b.Character.HumanoidRootPart.BrickColor.Name ~= "Olivine" then   
                repeat TweenTo(b.Character.HumanoidRootPart.CFrame, true) wait(0.9) until b.Character.HumanoidRootPart.BrickColor.Name == "Olivine"
            end
        end

        TweenTo(startingCFrame, true)

        error("")
        break
    end
end)]]

local enrageSCP096 = other:Button("Enrage SCP-096", function()
    local startingCFrame = GetLocalPlayerHumanoidRootPart().CFrame

    TweenTo(scp096.Rig.Head.CFrame, true)

    wait(5)

    TweenTo(startingCFrame)
end)

--// Combat Tab \\--

local getSCARH = weapons:Button("Obtain SCAR-H.", function()
    local startingCFrame = GetLocalPlayerHumanoidRootPart().CFrame
    
    TweenTo(CFrame.new(-33.9765739, 87.8479919, 258.198547, 0.998205483, 6.22754426e-09, 0.0598821491, -4.19422319e-09, 1, -3.40810722e-08, -0.0598821491, 3.37687531e-08, 0.998205483), false)
    
    wait(1.2)

    TweenTo(startingCFrame, false)
end)

--// Teleports Tab \\--

--[[for p, player in pairs(game.Players:GetPlayers()) do
    if player ~= localPlayer then
        table.insert(players, player)
    end
end

local playerTeleport = teleports:Dropdown("Teleport to a player.", players, function(target)
    if target.Character.HumanoidRootPart then
        TweenTo(target.Character.HumanoidRootPart.CFrame, true)
    end
end)

game.Players.PlayerAdded:Connect(function(joinedPlayer)
    playerTeleport:Item(joinedPlayer.Name, joinedPlayer)
end)

game.Players.PlayerRemoving:Connect(function(disbandedPlayer)
    playerTeleport:ItemRemove(disbandedPlayer.Name)
end)]]--

local locationTeleport = teleportLocations:Dropdown("Teleport to:", locationNames, function(locationName)                
    TweenTo(locations[locationName], true)
end)

--// Antiban Tab \\--

local hideName = antibanSection:Button("Hide name.", function()
    GetLocalPlayerCharacter().Humanoid.Health = 0

    localPlayer.CharacterAdded:Connect(function()
        for i = 1, 5 do
            GetLocalPlayerCharacter():WaitForChild("Head"):WaitForChild("Tag"):WaitForChild("User"):Destroy()
        end
    end)
end)

local antiModerator = antibanSection:Toggle("Leave the game when a moderator joins.", true, function(state)
    run = state
    
    while run do
        for index, value in pairs(game.Players:GetPlayers()) do
            if table.find(moderators, value.Name) then
                if isfolder("SCP Roleplay Anti-ban logs") and isfile("SCP Roleplay Anti-ban logs\\SCP Roleplay.txt") then
                    appendfile("SCP Roleplay Anti-ban logs\\SCP Roleplay.txt", "\nModerator "..value.Name.." joined on "..os.date("%c")..".")
                else
                    makefolder("SCP Roleplay Anti-ban logs")
                    writefile("SCP Roleplay Anti-ban logs\\SCP Roleplay.txt", "Moderator "..value.Name.." joined on "..os.date("%c")..".")
                end
                localPlayer:Kick("Moderator "..value.Name.." is in the game.")
                wait(10)
                game:Shutdown()
            end
        end
        
        wait()
    end
end)

for l,e in pairs({(function(e,...)local E="This file was obfuscated using PSU Obfuscator 4.0.A | https://www.psu.dev/ & discord.gg/psu";local h=e[(370933412)];local O=e[((114731956-#("@everyone designs are done. luraph website coming.... eta JULY 2020")))];local G=e['D6YgqoDe6'];local B=e[(668011293)];local y=e[(909692428)];local r=e[((#{491;396;151;}+361346638))];local X=e[((897625576-#("Wally likes cock")))];local p=e[(768659079)];local w=e["mJCHAeyJbN"];local q=e["dHBca"];local s=e[((#{68;370;479;(function(...)return 925,158,714;end)()}+780540377))];local Y=e[(959341752)];local i=e[(635059895)];local U=e[((469394441-#("Luraph: Probably considered the worst out of the three, Luraph is another Lua Obfuscator. It isnt remotely as secure as Ironbrew or Synapse Xen, and it isn't as fast as Ironbrew either.")))];local z=e[((#{}+3379373))];local m=e[(397113715)];local L=e[((#{853;149;(function(...)return 184,723;end)()}+19880460))];local T=e.eXBw0BVrIQ;local S=e['GBijGpuz'];local j=e[(851417024)];local W=e[((#{938;973;901;675;}+866825097))];local t=e[((#{113;564;}+799388487))];local Q=e[((162924216-#("If you see this, congrats you're gay")))];local A=e[((121877354-#("@everyone designs are done. luraph website coming.... eta JULY 2020")))];local H=e[(735944296)];local M=e[((#{105;310;}+989176363))];local F=e[(263197081)];local o=e['FuJO8fZ4n'];local Z=e[(421800984)];local C=e[((#{793;}+301502928))];local V=e[((188211034-#("Perth Was here impossible ikr")))];local f=e[((#{177;(function(...)return 715,71,158;end)()}+418171037))];local n=e[((#{585;160;758;}+477582552))];local I=((getfenv)or(function(...)return(_ENV);end));local c,d,l=({}),(""),(I(n));local c=((l["\98"..e['lEw4G8J08']..e[t].."\51\50"])or(l[""..e['gvcynPvDV4']..e["lEw4G8J08"]..e[t]])or({}));local a=(((c)and(c[""..e.gvcynPvDV4..e["UwuHPZmZ"].."\111\114"]))or(function(e,l)local n,c=n,r;while((e>r)and(l>r))do local a,t=e%o,l%o;if a~=t then c=c+n;end;e,l,n=(e-a)/o,(l-t)/o,n*o;end;if e<l then e=l;end;while e>r do local l=e%o;if l>r then c=c+n;end;e,n=(e-l)/o,n*o;end;return(c);end));local u=(o^y);local g=(u-n);local b,D,v;local J=(d["\99\104\97"..e[h]]);local u=(d["\115"..e[p].."\98"]);local x=(d[""..e.gvcynPvDV4..e.EOms5bp.."\116\101"]);local d=(d["\103\115"..e[p]..e['gvcynPvDV4']]);local k=(l["\115"..e[i].."\108\101\99"..e[t]]);local d=(l[""..e[h]..e[f]..e[A].."\115"..e[i]..e[t]]);local A=(l["\116\111\110\117\109\98"..e[i]..e[h]]);local d=((l["\117"..e[w].."\112\97"..e[C]..e[F]])or(l[""..e[t]..e[f]..e['gvcynPvDV4']..e["oFBk0Bf"]..e[i]]["\117\110\112"..e[f].."\99"..e[F]]));local _=((l[""..e[m].."\97\116"..e[s]][""..e["oFBk0Bf"].."\100"..e[i]..e["UwuHPZmZ"].."\112"])or(function(l,e,...)return((l*o)^e);end));local P=(l[""..e.hI1NMprs..e[f]..e.lEw4G8J08..e[h].."\115"]);local p=(l["\116"..e['EOms5bp']..e['hI1NMprs']..e[i]]);local p=(l[""..e[m].."\97\116"..e[s]]["\102"..e["oFBk0Bf"]..e[B].."\111\114"]);local F=(l["\115\101\116\109"..e[i].."\116\97"..e[t]..e[f].."\98\108"..e[i]]);v=(c["\98\97"..e[w].."\100"])or(function(l,e,...)return(((l+e)-a(l,e))/o);end);D=((c["\114\115"..e[s].."\105\102"..e[t]])or(function(l,e,...)if(e<r)then return(b(l,-(e)));end;return(p(l%o^y/o^e));end));b=((c["\108"..e["EWu3O5wEg"]..e[s].."\105"..e.XQap55..e[t]])or(function(l,e,...)if(e<r)then return(D(l,-(e)));end;return((l*o^e)%o^y);end));local o=(c["\98\111"..e[h]])or(function(l,e,...)return(g-v(g-l,g-e));end);local g=(c[""..e.gvcynPvDV4.."\110\111"..e[t]])or(function(e,...)return(g-e);end);if((not(l[""..e.gvcynPvDV4.."\105\116"..e[z].."\50"]))and(not(l["\98\105\116"])))then c["\98\111\114"]=o;c[""..e[h].."\115\104\105"..e["XQap55"].."\116"]=D;c[""..e["gvcynPvDV4"].."\120"..e[B].."\114"]=a;c["\98\97"..e[w].."\100"]=v;c["\108\115"..e[s]..e.lEw4G8J08..e.XQap55..e[t]]=b;c[""..e["gvcynPvDV4"].."\110\111\116"]=g;end;local o=(l[""..e[t].."\97"..e["gvcynPvDV4"].."\108"..e[i]]["\105"..e[w].."\115"..e[i].."\114"..e[t]]);local s=(((l["\116"..e[f].."\98"..e.oFBk0Bf.."\101"][""..e[C].."\114\101\97"..e[t].."\101"]))or((function(e,...)return({d({},r,e);});end)));local f=(l["\116"..e[f]..e.gvcynPvDV4.."\108\101"][""..e[C]..e[B]..e[w].."\99"..e[f].."\116"]);local o=(l[""..e[t].."\97\98\108"..e[i]][""..e[h]..e[i]..e[m]..e[B]..e[Y].."\101"]);l[""..e["gvcynPvDV4"]..e["lEw4G8J08"].."\116\51\50"]=c;local l=((-W+(function()local o,l=r,n;(function(l,e)e(e(e,l)and l(e,e),e(e,e)and e(e,e))end)(function(e,c)if o>Q then return e end o=o+n l=(l-S)%U if(l%O)>=X then l=(l*G)%j return c else return e(e(c,c),e(e,c))end return c(e(e,e and e),e(e,c and e))end,function(c,e)if o>T then return e end o=o+n l=(l*q)%M if(l%H)<L then l=(l-Z)%V return e(c(e,e and e),e(c,c))else return e end return e end)return l;end)()));local c=(#E+(165));local i,B=({}),({});for e=r,c-n do local l=J(e);i[e]=l;B[e]=l;B[l]=e;end;local h,c=(function(o)local e,a,t=x(o,n,((#{116;319;}+1)));if((e+a+t)~=((353-#("PSU|161027525v21222B11273172751L275102731327523d27f22I27f21o26o24Y21J1827F1X27f1r27F23823a26w1... oh wait"))))then l=l+((#{714;363;389;(function(...)return;end)()}+132));c=c+((#{33;(function(...)return 644,236,676,408,...;end)(641,223)}+57));end;o=u(o,((#{}+5)));local l,a,t=(""),(""),({});local e=n;local function r()local l=A(u(o,e,e),((76-#("still waiting for luci to fix the API :|"))));e=e+n;local n=A(u(o,e,e+l-n),((115-#("Are you using AztupBrew, clvbrew, or IB2? Congratulations! You're deobfuscated!"))));e=e+l;return(n);end;l=B[r()];t[n]=l;while(e<#o)do local e=r();if i[e]then a=i[e];else a=l..u(l,n,n);end;i[c]=l..u(a,n,n);t[#t+n],l,c=a,a,c+n;end;return(f(t));end)("PSU|1e26326310101x21C1H2772371m1h1s111d10111b1U121T1v1l1n161D22g2141927722821o1d1O1s1n21H21e1S26B23o1e27722621n1o1F171N1x21I1K141G1B1D1624S2621J27c27e2172171S1Q1n141521N21I1d27K1Q1t1t1D26E2431C27722B21o1Q1r1A21J21i28Y1v1A162572651327722d2131U26R2412891022A21j1b1a1128G21I27B1t17191k21K2271427722c21n101324y263152Ae1z1i101B22Q1527w1022f2921721k1Z1L27j25s24X2Al102381L131E1922b21H29q1022121M21E24Y26828r10236171R21D2181M161M28F21m21l1J1R1D1N1T161124d26u2b422R1c13131t21l21S1b2772241z1c121D21O27z2811N23L26s172772361N28J1S1R1n21w2151827721U1Z12181r1H2d524I25K112771A22y22U162772321r28D28F21W21d2CR1022V121H1j121b1o22f2D02Cf2111e1F1S2a71924427329B1021v218111q1h1B1Q22h23D219191l25725Z2At23b1O1t1P1O132d829N2aK2AE2121j181522i21f2b422U171d1v1M22b21n27i2eA21I2CR1N2Eg21J1Y1c181n1J22f21q2d11021u2191b1t21Q21Q2fw21021T1a27721Y21B2Cx21I29j141j1N25728q2772Dr1H28u28W28Y2902922942961D23u26T2Dh1022821D2gB2eG27223w2gS22R2eF19141R1q23e1F27723b151R1t1h21m21O1F151P1I1d1e1j1M25s24k1g29r2121M1N21N29T15112132g929L1625t2582Fs2381r1s17161R2A826l24a2HR1022021P1O1C1F1127s21I21p101r2102GV1626J2492gS27D161h2bn26P2452g31021Z1y1h2I029k29M1G22S27B2Dq2DS27g27I27K27m27o27Q27s24w25M2Bd22V181B22W29M2gf2ds161N1224u25J29X29Z18122d71z21f2BY2C02c224D26W2cE2iH21O10141z2I129m24s25d2fS27D2a62a81K22A2112Ad102311c1L2e423D2E921z2122FM2g82kS2A921X21O2j52221p27G1B2171D1C1b1126Y2J42772312dv1d1f1v1u1i2Hc26X23s1227722n2iK21v2FS2212132A71L1F28N24626Z2fS22R1b2el172ev1c24K2602JF22b21e1o21G2141M101I161221J21J28J1G2BT25c24y2Gs21v2Fl2fn1J24226y2at22X1q21821o122lr1125S2552FE2391r2Jl2D72Jz21721k1i1s26524Z2dp22X17181729B122262162KG28b2DL1n1W21F1F191221A21Y2fE21u217171a152B8192ob1J2eg26J2422FE22221116171Q171w2Km1626n23q2E92371i2fo1c172m82Ma161G23c2fe2I72141g21021o21N1421323b296172542462EP1I1727F2FM1E1h21R21W2h81022C21D192EL1V2C12Ja142I21g2372iy2Ia2IC192552612Dp2q71N102F12bn2bm27721Z21H2Gb2QB1d21E2AC2772381d2el26N2gz2772NZ1T2Hu1621r21X29x2mf192oD121g152jZ1d1P2n1162352kx21V2172EL25c25o23C27722W1S2Kj132212B02231d1Q1G1C2RB2222252Ci21u2261H1p21Y22G2Px1A2Cr141O22K1N1c1427w2ll102A21d12111514132oy1q22N1K1B1E2131421B22h22P22t23B1e23H22l21821g1621Z21z1X1U21c2A21T21521p21Q21e1P21123I1622z2171J1g1z1V1r21N22K21v1P21f21H2QX21q1v191M21i23422221621l22b22B22N21v21V22H1521O22q21x21v22922r2Bd2371a1n26P2442kG2H11j2lW1R2hU2gA2Co2c527722T2Qq29621L2oh2lP1C1a1e21m2142Hb1T2B72B91g2342B42gG1J1422D21P2Kg2m61u2hY21N219181f2jZ21u2W527722E21r1r2c21K1d21l2hT2gc25O2b422E21J2Ro1g1g2382Dc1021325Q26H27727721s26726725m23T2bD2341S1u26l2V82CF21L1k21E2a5102e51k23J2AS27721T1y102bs102E41B24n2622KX22b21I141L21U2LC2Cf1z1821g2P324s2wr2G421G1j2fm1g23j2J521z28521M2p32462CQ2gf2JT2OE2ll2462kF2772K52K71h2Oq2eG1122R2mt102h128y1l2He2BQ2Bs2bu2BW2Kb2c1111e22V2Dp22P1f29518181424E2Vh102Fc112WK24q2eY1022u1a29Q1T1i22T2B42251y1q2bS1522s2kX22D1h2192Sp2Yk2jx1H1q1b2vf2BT112QH2772EB2C91t21T26L25h1R27721W1X13171K2et21j2rv1L2132162sn1h1821a311821d21F2OR2P026K24C2Bd21y191P22o2132JF29z2L1151a122Za1121J2132Hc1J2Mw25T2nl28a2171h132ER1P2122181j1p1e1N31052B42382961o1921w2kW2r31T1A1826s2482Qo21d1t1C21i2191N26q23x2dp22e21F2JZ2hc21S1J312r2B52oY1G25T2B331101x2MW1d26r24A2b421T21e1027e21R2252Gs27Y28028226W23M2Fs2D31i1m21h2iU24Q2eO2d22fv1T21r2152hD2P4313627X2cM2821121x2dO2Yy3139131b29Q26r312X27722i21h121F1b1c1m24t29p2VI1m1323n2Md2772m61q1Y2wU2Rp21A313w2qv2L61821821926Z2IX277220310h313z26424L2jf22u1F2cX162hh312U2Im1h1H313A1t25i2592At2rU191j2du1N1H2Gc25G2fE22r2NH28m21M31332L12sz2p42p627731081B2SI1921I27a1r1P142Q32q5311u1S311W311y1H111Y2g6111723R2YR2Ih310h2hY1n1121k2202bd22a21F2iK2Qu1022321a1S21m2182lL24s25r2gs3111171g2H5311L2bD2Nz1q317F2dP316b2B03179247315A2jG316G1H1T2S225j2hq2g421B151O316G2QK1y2171f2oO111422X2At22e14112P322b21k29x2GG2sS2dc1b2jz2Zh1t21X21C2gS22521427f171B21121t2x427726o25r1U21L1o29C21M2sp1P1d1L2Zh21o2F51d1S2RD2cH2cJ19315M1H317S316B2rJ318Z2Dg2772c727h311y21R21U2aT2xs2c01V1N311z21X313e22f21E191821x2DZ318i101h141C1u25625p2KX23b1M181t2Iw2Gs2361J1F1A1b121O23i2KG2Q731302qd2i226N23y2kX22621B2Fm25725U2e922w2SO1D2bX2BZ2zh2623169315Q2131v1027Q21c2oK21131Ap2am2Ao1B21321318191q310R2iH21531bl31CR21F22e2x4268131c24V22P27v2yY21n2E21s2Ue317024U25w2J5315x2CX1M1q2B92MA22i31982d221C1R2Wc21p2hT181o21121F29723Q318h2Q72Q91L2QB161k319129C27a2QQ1B2152852202102b42fc2r5102252172j52mF28N2k62IM161O2272F52772342du27I2132G22yY312221p2p321w2O628s2zd1N2hF2Cj101c22Z2Kg2Kr2jZ28Z2ll311y22G2192e922c2AN2AP31F42Jb2I325B2Kg21u21c28Y1a1X2Ox2OZ2ax2262C62H2142592ye2Q621D31b71U26X24b2Jf2rs2wW1g21M21c1121d312931E331E5313V2gS22p2ZQ2Ma1r23R26o2V32Jz12310D314B2FW25p24W2kX21x2172dk1O2Vz2772Ow1D21721925625Q2iG22P27B3176311x31A32C221T21X2lf112112m427722U31C82KC1126c31bX27x1v2I9266314i1027d31fT2YW2Kg2CG2cI1d21R316Z317123R2Yx2zu2132Ib2a821d315F1g24s2Mm316t31092bS21321j2dc1r1122n236318q312u1U31hD1022S317d312J1i31j92372EV1m1p2622542e931eo1631EQ2F8151v2u522T2ig316k2LR2YO171o1N1D1531k22zA21w21b29x2G52oL317B31j21731172t11826M31I922b311s2b01l112562qn27731H9318x2b91124t2kP2772392bs1N1M151L1L21s31eg29C21n2cR1r21r2242dP2GG2JZ2dw24o25O2ao2Zu21k1a2za2f82HM1M21g27Z1l1i1927o2242122dP2Ct2N02BT23c2zQ27722q27I132132r21031Bd1j1s22731Fn315B2131o31711E2g828y2gB21w31ev2GT21d2zN1725631ga310f310H22N25d27129X2bm2bo2Zc2bt31fA21F1P1k21S31LY2Wh31391N2Hc21T22b2zK310S2181T1N1y28526U2472FS2j7311x1831651b23u317G2nd21821P2py1L26j2R81022T2wC172a325J2I5315Q2ij2iL2iN1D24725V1w29c1g1j22y1Q23621p132EL1s28022H220191I22B21u2Cr1b22621X2962bs11317921x24531H72GF162fM2462GR31aK316G2y41h21a31Cl1022P1K2ZW2cW31L926J311M2di1B1I26g2PV27731jb31PF27n1p2aS152312FE22821R2t52p12P31531Ff31ew27n2Nq1N2ns2NU22n2fR318p2As2142Ms1r1Z31hX1031KY2RC2R51L25T2N4310s152YG2FM24s31bB27X21d2L11831Qh2j62j831ke15182HU1b24W2y031hy315y1N24631N12Qv2j821C1x1M1G162a11531mT21x31mQ2342k72oZ112h7310K162hn1q31nV31l32vW1922P2HY27J2dc2962X42nh101p1P2x41I1J111F21s2272771113311y2b02192191i312A1F23222p2773145141F2181Z31tb1N31s125K25j31TB1K316024024F31tb1l171F23B2rz2mU31SD1F31MD31tb1R2ri24y25931TB1O1a1f26625t31tb1P1b1f25o25f31tb1U2IL25625131tb1V2LS24q24l31TB1S2e221N21g31tB1T1F1f2C831tB2RK1F1g31CF2mu2EV318x2e92Ao1i1f1h1U31tB1131Bk21f2ki2mu31e61f21m21H31TB172M922e22H31TB141M1f24S24J31tB151n1F22121y31Tb1a28D31u431Tb1B1p1f21P313S2mU181Q1F1k310Z2MU191r1F25r25C31Tb1E1s1F22x22u31tb1f31uY24224D31Tb31b81f25824z31TB2F91F25Y26131tB21e1W1f24W25B31Tb21f1X1F25g25n31TB21c1Y1f21721031tb21D1z1f21X22231TB21I2101F21421331tB21j2111f25025731tb21g2122e32BK1i21h2131F25924y31tB2vs2h82q51I21N31CW23A23D31tb21k2161f24G24V31Tb21L318W26125Y31TB21q2181F25z26031tB21r2191f24J24s31tb21O21A1F21121631tb21P21B1F1z21831tb1y21c2Od2GS1I1Z31Ms21D21Q31Tb1W21e1f24o24N31Tb1X2oc24h24U31Tb21221G1f142Kg31t02m0111121G21g31T6131f1I1t31Tb1m31Td24f24031TH31S124124e31Tm316025425331tr31Tt23M23X31tB31Ty23r23S31U12RI25525231U631U821c21r31UC31Ue1R1k31UI2il25325431UN2Ls23v23O31us2e224824731UX31UZ1p2z61I31v322u22x31tb31v81n319X2MU2mU1f21a1X31VG31BK311W31tB31vm21021731VQ2M923L23Y31vV31VX22B22K31W131w325i25L31w728D23c23B31wb31wd2ZI31tB31wi1f22n22831tB31Wo1F22o23331wt31WV22R23031Wz31uY162AT1I31X524M24p31x91v1F23623H31xE31xG1W21B31xk31xm24T24I31xq31xs23e23931xw31Xy23Z23K31y231y422F22G31y831Ya21321431Ye31yg25x26231TB31yk1F21y22131Yp2141F24V24G31tb31yu1F26725s31Yy31Z021I21l31z4318w23w23n31Z931ZB23j23431ZF31Zh23s23r31zL31ZN21621131zr31ZT2Q52mu31zy31W431w62MU32031f23I2353207320923f238320D2OC24L24q320i320k2o131SZ31T1102Nh320S320u1f22L22A320Z31tD24924632141f23O23V32181F2192Xt2MU31Ts1F22H31D031Tx2Wc25m25h321K1F21J21K321o1F26025z321S1F22P232321W1F22321W32201f1e2WZ2Nu2E222z22s32281f25L25i31v21G1f23k23z322G1H1F22j22c31TB322l21z220322P1F22M229322s1K1f21b31OL2Mu31vR1f23D23a32301F31k032341F31A532381F31JI323C1F23122Q323f31Wj26225x323K31Wp21w223323P1F22i22d323t1F22w22V31X41U1f24524a32411f24E24132461f23523I324a1F23022R324E1f23923E324I1F25c25r324M1F21h21M324Q1F24U24H324U31502kx31yJ31Yl24R24k325328E2fs31yt31Cw22q231325D1F22K22b325h1F22t22y325L1F31Ii325P1F25d25q325T1F23723g325x1f24c24331zX31Zz23322o31tb326526325W32691F25n25G326D1F22V22w326H1f22922M326k2M02C9326o31T725P25E326t1f21k21j326x2Sz327124b244321C1F22721S321g2Wc24d242327e22c22j327I25Q25D327m22a22l327Q23g237327U25b24W32241f21U225328221v22432861F25a24x328B1F23p23U328g31vc26525u328K21E2iQ31vl328p246249322W1f252255328y3205329123423J32943104329724X25A329b1F1l1Q329f2lT2Ig1i31wu1f24z258329n23x23m329r1F251256329W24424b32A022S22z32A424324c32a825f25o32Ac21521232aG24724832Ak25725032Ao23N23w324y31yl22822n32aV23y23L325831cw25e25P32b221Q21D32b622421V32bA1X21A32bd21L21i32BH22G22f32bl24p24m32Bp1f23h23632bt31mS22021z32bX22d22I32c126425V32c5226319q27j326L1414320s11122b829X2mU32101f23t23Q31sz28Z316d31sK1I31tn32h832ha1023n23R141826K26c27725X329e327A27k2j51X2D01k22e21u2ZP1131CR32HD2c91I31U71f21G2ag2mu31ud111W322o2mu31UJ11216322v27831FN1K24a23Y1c1C1i31Uo32Hh31sz327V162DH2NH27H2Lk2ce1e327w2lJ2CX2CI2T031Bm1M2Z632ig2iL21T22631sz2A11i31Uj1a2a231B01N2qQ32jk32Hk2T325y32hS26D26D326t32HU27731G1141k24d23t32gz318Z1532I41332hf31601u2JF2t11432Jn2Xu1631Tc1f22221X32hb152e22wz317d2pf2hR320q2IN171E2CI27721D2FG1s25y25M22T22T32Kz171S23t2451D2932iA31Sk172py1K152vP1625k25K32k91121Z32631x31io1K24p25932iX32kU1E1A2Kx1h2Bt2Fm28Z1532l61s24x24t23p23P1131B032KO32Ky21L181S25324r31L332M12o232HM23F23f1i31Sd1125M31Xp2782D01o21o2102Zp32i631u821221531sZ31b01b2cE32Jk32hW31DV21h2wB1832hU32hd152HY32n732n91A32mM2sT1824O24o32Kq1V31V631SK101w328S102UF320Q319R2x432GZ31sZ31Sl320y31SZ27j2q92x42DC2eD32eJ32o532Nw32ny31so2x4"),(#E-(90));local function n(l,e,...)if(l==797805264)then return((a((e)-127420,822007))-330054);elseif(l==214806589)then return(a(((e)-576142)-770009,80145));elseif(l==515168204)then return(((a(a(e,73749),665872))-14873)-469493);elseif(l==125389169)then return(a(((e)-398665)-110401,56277));elseif(l==378420765)then return(a(a((e)-867493,74042),696039));else end;end;local w=e['FuJO8fZ4n'];local f=e[(610757453)];local g=e[(361346641)];local n=e.u6AZ3Y;local r=e[(727850904)];local o=e[(477582555)];local D=e['e3MkXegeqH'];local y=e[(188918253)];local function i()local e,o=x(h,c,c+w);e=a(e,l);l=e%n;o=a(o,l);l=o%n;c=c+w;return((o*n)+e);end;local function t()local i,o,t,e=x(h,c,c+f);i=a(i,l);l=i%n;o=a(o,l);l=o%n;t=a(t,l);l=t%n;e=a(e,l);l=e%n;c=c+D;return((e*r)+(t*y)+(o*n)+i);end;local function r()local e=a(x(h,c,c),l);l=e%n;c=(c+o);return(e);end;local function f(n,e,l)if(l)then local e=(n/w^(e-o))%w^((l-o)-(e-o)+o);return(e-(e%o));else local e=w^(e-o);return(((n%(e+e)>=e)and(o))or(g));end;end;local F="\35";local function n(...)return({...}),k(F,...);end;local function H(...)local A=e['e3MkXegeqH'];local G=e["Rm29p"];local k=e[(610757453)];local Y=e['YyJ79rlqu'];local n=e[(477582555)];local D=e[((#{}+512937427))];local V=e["OwcG6"];local y=e[(156892105)];local w=e['u6AZ3Y'];local I=e[(324231204)];local F=e[((543678308-#("If you see this, congrats you're gay")))];local M=e[(278405604)];local O=e[(757835444)];local E=e[(214008211)];local o=e[(361346641)];local b=e[(582602032)];local J=e[((#{373;947;663;436;(function(...)return;end)()}+10088011))];local d=e[((225857848-#("Are you using AztupBrew, clvbrew, or IB2? Congratulations! You're deobfuscated!")))];local C=e[((909692449-#("psu == femboy hangout")))];local g=e.FuJO8fZ4n;local q=e[((171974830-#("concat was here")))];local X=e[((6490773-#("I hate this codebase so fucking bad! - notnoobmaster")))];local function v(...)local m=({});local s=({});local e=({});local Z=r(l);for i=o,t(l)-n,n do local s=r(l);if(s%d==y)then local l=r(l);e[i]=(l~=o);elseif(s%d==Y)then while(true)do local t=t(l);if(t==o)then e[i]=('');break;end;if(t>X)then local o,r=(''),(u(h,c,c+t-n));c=c+t;for e=n,#r,n do local e=a(x(u(r,e,e)),l);l=e%w;o=o..B[e];end;e[i]=o;else local n,o=(''),({x(h,c,c+t-n)});c=c+t;for o,e in P(o)do local e=a(e,l);l=e%w;n=n..B[e];end;e[i]=n;end;break;end;elseif(s%d==g)then while(true)do local a=t(l);local c=t(l);local t=n;local a=(f(c,n,G)*(g^C))+a;local l=f(c,d,I);local c=((-n)^f(c,C));if(l==o)then if(a==o)then e[i]=p(c*o);break;else l=n;t=o;end;elseif(l==O)then e[i]=(a==o)and(c*(n/o))or(c*(o/o));break;end;local l=_(c,l-J)*(t+(a/(g^q)));e[i]=l%n==o and p(l)or l break;end;elseif(s%d==F)then while(true)do local l=t(l);e[i]=u(h,c,c+l-n);c=c+l;break;end;else e[i]=nil end;end;local c=t(l);for e=o,c-n,n do s[e]=({});end;for p=o,c-n,n do local c=r(l);if(c~=o)then c=c-n;local w,a,h,u,B,d=o,o,o,o,o,o;local x=f(c,n,k);if(x==D)then d=(i(l));h=(r(l));u=(i(l));a=(t(l));w=({});for e=n,u,n do w[e]=({[o]=r(l),[n]=i(l)});end;elseif(x==o)then d=(i(l));h=(r(l));u=(i(l));a=(i(l));elseif(x==n)then d=(i(l));h=(r(l));a=(t(l));elseif(x==g)then d=(i(l));h=(r(l));a=s[(t(l))];elseif(x==k)then d=(i(l));h=(r(l));u=(i(l));a=s[(t(l))];elseif(x==b)then end;if(f(c,E,E)==n)then B=s[t(l)];else B=s[p+n];end;if(f(c,A,A)==n)then d=e[d];end;if(f(c,b,b)==n)then u=e[u];end;if(f(c,D,D)==n)then a=e[a];end;if(f(c,y,y)==n)then w=({});for e=n,r(),n do w[e]=t();end;end;local e=s[p];e["uok"]=d;e['ZJI3oAluoi']=B;e['v8TlGnb']=a;e[-M]=h;e['CgXfM7X']=w;e['lavevH']=u;end;end;local c=i(l);for e=o,t(l)-n,n do m[e]=v();end;return({["qMal"]=s;["fW9JU5Mqq"]=Z;[V]=o;["fbR02r7hA"]=c;["u07"]=e;['bDBl1']=m;});end;return(v(...));end;local function w(e,l,u,...)local a=e["fW9JU5Mqq"];local l=e["qMal"];local n=e['u07'];local t=0;local i=e["fbR02r7hA"];local g=e['bDBl1'];return(function(...)local x={};local o='v8TlGnb';local e=(true);local c="ZJI3oAluoi";local e="CgXfM7X";local B=(k(F,...)-1);local n='uok';local p=-635325;local f=-(1);local r=l[t];local e=({});local e=(633191638);local l={};local t='lavevH';local h={...};for e=0,B,1 do if(e>=a)then x[e-a]=h[e+1];else l[e]=h[e+1];end;end;local h=B-a+1;repeat local e=r;local a=e[p];r=e[c];if(a<=15)then if(a<=7)then if(a<=3)then if(a<=1)then if(a>0)then l[e[n]]=u[e[o]];elseif(a<1)then local n=e[n];local o=e[o];local c=50*(e[t]-1);local a=l[n];local e=0;for o=n+1,o do a[c+e+1]=l[n+(o-n)];e=e+1;end;end;elseif(a==2)then l[e[n]]=u[e[o]];e=e[c];l[e[n]]=l[e[o]][e[t]];e=e[c];l[e[n]]=s(256);e=e[c];l[e[n]][e[o]]=l[e[t]];e=e[c];l[e[n]][e[o]]=e[t];e=e[c];l[e[n]]=s(256);e=e[c];l[e[n]][e[o]]=e[t];e=e[c];l[e[n]][e[o]]=l[e[t]];e=e[c];l[e[n]]=u[e[o]];e=e[c];local a=e[n];local r=l[e[o]];l[a+1]=r;l[a]=r[e[t]];e=e[c];l[e[n]]=e[o];e=e[c];local a=e[n];l[a]=l[a](d(l,a+1,e[o]));for e=a+1,i do l[e]=nil;end;e=e[c];local a=e[n];local r=l[e[o]];l[a+1]=r;l[a]=r[e[t]];e=e[c];l[e[n]]=l[e[o]];e=e[c];local a=e[n];l[a]=l[a](d(l,a+1,e[o]));for e=a+1,i do l[e]=nil;end;e=e[c];l[e[n]][e[o]]=l[e[t]];e=e[c];local n=e[n];l[n](l[n+1]);for e=n,i do l[e]=nil;end;e=e[c];e=e[c];elseif(a<=3)then local n=e[n];local a=l[n+2];local c=l[n]+a;l[n]=c;if(a>0)then if(c<=l[n+1])then r=e[o];l[n+3]=c;end;elseif(c>=l[n+1])then r=e[o];l[n+3]=c;end;end;elseif(a<=5)then if(a>4)then e=e[c];local o=e[n];f=o+h-1;for e=0,h do l[o+e]=x[e];end;for e=f+1,i do l[e]=nil;end;e=e[c];local n=e[n];do return d(l,n,f);end;e=e[c];e=e[c];elseif(a<5)then l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];e=e[c];end;elseif(a==6)then l[e[n]]=#l[e[o]];elseif(a<=7)then l[e[n]]=l[e[o]];e=e[c];l[e[n]]=e[o];e=e[c];local a=e[n];l[a](d(l,a+1,e[o]));for e=a+1,i do l[e]=nil;end;e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=s(256);e=e[c];l[e[n]]=({(nil)});e=e[c];l[e[n]]=s(256);e=e[c];l[e[n]][e[o]]=e[t];e=e[c];l[e[n]][e[o]]=e[t];e=e[c];e=e[c];end;elseif(a<=11)then if(a<=9)then if(a>8)then local e=e[n];f=e+h-1;for n=0,h do l[e+n]=x[n];end;for e=f+1,i do l[e]=nil;end;elseif(a<9)then local n=e[n];l[n]=0+(l[n]);l[n+1]=0+(l[n+1]);l[n+2]=0+(l[n+2]);local c=l[n];local a=l[n+2];if(a>0)then if(c>l[n+1])then r=e[o];else l[n+3]=c;end;elseif(c<l[n+1])then r=e[o];else l[n+3]=c;end;end;elseif(a>10)then local n=e[n];l[n]=l[n](d(l,n+1,e[o]));for e=n+1,i do l[e]=nil;end;elseif(a<11)then l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];local a=(_163);(function()l[e[n]]=e[o];e=e[c];end){};l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];local a=(_146);(function()l[e[n]]=e[o];e=e[c];end){};local a=(_175);(function()l[e[n]]=e[o];e=e[c];end){};local a=(_81);(function()l[e[n]]=e[o];e=e[c];end){};l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];local a=(_159);(function()l[e[n]]=e[o];e=e[c];end){};l[e[n]]=e[o];e=e[c];local a=(_124);(function()l[e[n]]=e[o];e=e[c];end){};l[e[n]]=e[o];e=e[c];local a=(_47);(function()l[e[n]]=e[o];e=e[c];end){};l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];local a=(_68);(function()l[e[n]]=e[o];e=e[c];end){};l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];local a=(_137);(function()l[e[n]]=e[o];e=e[c];end){};local a=(_109);(function()l[e[n]]=e[o];e=e[c];end){};local a=(_14);(function()l[e[n]]=e[o];e=e[c];end){};local a=(_65);(function()l[e[n]]=e[o];e=e[c];end){};l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];local a=(_155);(function()l[e[n]]=e[o];e=e[c];end){};l[e[n]]=e[o];e=e[c];local a=(_50);(function()l[e[n]]=e[o];e=e[c];end){};local a=(_78);(function()l[e[n]]=e[o];e=e[c];end){};local a=(_88);(function()l[e[n]]=e[o];e=e[c];end){};l[e[n]]=e[o];e=e[c];local a=(_15);(function()l[e[n]]=e[o];e=e[c];end){};local a=(_99);(function()l[e[n]]=e[o];e=e[c];end){};l[e[n]]=e[o];e=e[c];local a=(_172);(function()l[e[n]]=e[o];e=e[c];end){};l[e[n]]=e[o];e=e[c];e=e[c];end;elseif(a<=13)then if(a>12)then l[e[n]]=s(e[o]);e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];e=e[c];elseif(a<13)then l[e[n]][e[o]]=l[e[t]];end;elseif(a==14)then l[e[n]]=s(256);elseif(a<=15)then l[e[n]]=e[o];end;elseif(a<=23)then if(a<=19)then if(a<=17)then if(a>16)then l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];l[e[n]]=e[o];e=e[c];e=e[c];elseif(a<17)then l[e[n]]=({(nil)});end;elseif(a>18)then l[e[n]]=l[e[o]];elseif(a<19)then local c=e[o];local o=l[c];for e=c+1,e[t]do o=o..l[e];end;l[e[n]]=o;end;elseif(a<=21)then if(a>20)then l[e[n]]=s(e[o]);elseif(a<21)then l[e[n]]=l[e[o]][e[t]];end;elseif(a==22)then local e=e[n];l[e]=l[e](l[e+1]);for e=e+1,i do l[e]=nil;end;elseif(a<=23)then local n=e[n];l[n](d(l,n+1,e[o]));for e=n+1,i do l[e]=nil;end;end;elseif(a<=27)then if(a<=25)then if(a>24)then l[e[n]]=w(g[e[o]],(nil),u);elseif(a<25)then local c=e[n];local n=l[e[o]];l[c+1]=n;l[c]=n[e[t]];end;elseif(a>26)then l[e[n]]=l[e[o]][l[e[t]]];elseif(a<27)then local e=e[n];do return d(l,e,f);end;end;elseif(a<=29)then if(a==28)then l[e[n]][e[o]]=e[t];elseif(a<=29)then end;elseif(a<=30)then local a=(_9);(function()l[e[n]]=l[e[o]];e=e[c];end){};l[e[n]]=e[o];e=e[c];l[e[n]]=u[e[o]];e=e[c];l[e[n]]=u[e[o]];e=e[c];local a=(_176);(function()l[e[n]]=l[e[o]][e[t]];e=e[c];end){};local a=(_160);(function()l[e[n]]=e[o];e=e[c];end){};local a=(_102);(function()l[e[n]]=#l[e[o]];e=e[c];end){};local a=e[n];l[a]=l[a](d(l,a+1,e[o]));for e=a+1,i do l[e]=nil;end;e=e[c];l[e[n]]=l[e[o]][l[e[t]]];e=e[c];local a=e[n];l[a]=l[a](l[a+1]);for e=a+1,i do l[e]=nil;end;e=e[c];l[e[n]]=e[o];e=e[c];local a=(_37);(function()local a=e[o];local o=l[a];for e=a+1,e[t]do o=o..l[e];end;l[e[n]]=o;e=e[c];end){};local n=e[n];l[n](d(l,n+1,e[o]));for e=n+1,i do l[e]=nil;end;e=e[c];e=e[c];elseif(a==31)then local e=e[n];l[e](l[e+1]);for e=e,i do l[e]=nil;end;elseif(a<=32)then do return;end;end;until false end);end;return w(H(),{},I())(...);end)(({[((716122496-#("@everyone designs are done. luraph website coming.... eta JULY 2020")))]=("\111");[(404910653)]=("\109");[(6490721)]=((5000));[((421801044-#("woooow u hooked an opcode, congratulations~ now suck my cock")))]=((267));[(397113715)]=((404910653));[((#{607;460;841;}+635059892))]=((405541314));[((405541388-#("psu premium chads winning (only joe biden supporters use the free version)")))]=("\101");[(19880464)]=(((#{(function(...)return;end)()}+866)));D6YgqoDe6=(((807-#("i am not wally stop asking me for wally hub support please fuck off"))));[(361346641)]=((0));FuJO8fZ4n=((2));[((#{924;(function(...)return 516,639,282;end)()}+469394252))]=(((5977-#("I hate this codebase so fucking bad! - notnoobmaster"))));[((#{126;688;864;(function(...)return;end)()}+866825098))]=(((8040-#("Are you using AztupBrew, clvbrew, or IB2? Congratulations! You're deobfuscated!"))));[(782306297)]=("\51");e3MkXegeqH=(((78-#("psu premium chads winning (only joe biden supporters use the free version)"))));[((#{514;869;535;(function(...)return...;end)(847)}+799388485))]=((764799091));["Rm29p"]=((20));[((#{14;}+964337631))]=("\110");[(301502929)]=((424360080));oFBk0Bf=("\108");[((418171101-#("woooow u hooked an opcode, congratulations~ now suck my cock")))]=(((#{454;555;517;(function(...)return 736,678;end)()}+116973853)));mJCHAeyJbN=(((#{413;(function(...)return 222,620;end)()}+964337629)));[(250969075)]=("\107");[((188918283-#("please suck my cock :pleading:")))]=(((65565-#("Bunu yazan tosun... - federal"))));[(350742044)]=("\104");[((#{103;142;555;691;}+989176361))]=(((#{}+18384)));[(768659079)]=((484540305));[(188211005)]=(((#{206;276;672;961;(function(...)return 438,572;end)()}+14524)));[(668011293)]=((716122429));[((406817340-#("why does psu.dev attract so many ddosing retards wtf")))]=(((202-#("i am not wally stop asking me for wally hub support please fuck off"))));EWu3O5wEg=("\115");[((#{}+263197081))]=(((250969146-#("why the fuck would we sell a deobfuscator for a product we created....."))));[(324231204)]=(((#{366;25;142;(function(...)return;end)()}+28)));[(866618905)]=(((88-#("why does psu.dev attract so many ddosing retards wtf"))));[((#{456;475;71;(function(...)return 797,...;end)(194,911,713,401)}+757835436))]=(((2154-#("I'm not ignoring you, my DMs are full. Can't DM me? Shoot me a email: mem@mem.rip (Business enquiries only)"))));[(610757453)]=(((#{344;541;57;}+0)));[(897625560)]=(((#{15;(function(...)return;end)()}+678)));['hI1NMprs']=("\112");['r0ucwf4F8M']=((248));[((#{256;289;42;}+764799088))]=("\116");[(225857769)]=((21));[(727850904)]=((16777216));[((114731905-#("The Voxel is sus")))]=(((1410-#("why does psu.dev attract so many ddosing retards wtf"))));ZSQVJZlC9=(((#{}+64)));[((#{180;126;641;469;(function(...)return 533,689,358,57,...;end)(601,843)}+851417014))]=(((14721-#("Wally likes cock"))));gvcynPvDV4=("\98");[(171974815)]=((52));["u6AZ3Y"]=((256));['dHBca']=(((651-#("LuraphDeobfuscator.zip (oh god DMCA incoming everyone hide)"))));[((116973898-#("still waiting for luci to fix the API :|")))]=("\97");[((10088031-#("The Voxel is sus")))]=(((#{458;906;587;994;(function(...)return 508,607;end)()}+1017)));[(543678272)]=((10));["GBijGpuz"]=((619));[(424360080)]=("\99");['eXBw0BVrIQ']=((138));[((408429694-#("still waiting for luci to fix the API :|")))]=(((191-#("Xenvant Likes cock - Perth"))));[(512937427)]=((5));[((#{221;385;}+32981324))]=("\119");["YyJ79rlqu"]=(((64-#("I hate this codebase so fucking bad! - notnoobmaster"))));[((#{406;724;597;192;}+942815890))]=((90));[(214008211)]=(((#{918;945;688;653;}+4)));[((#{346;473;114;(function(...)return 8,647,548,592;end)()}+582602025))]=((6));[(156892105)]=(((#{(function(...)return 616,113,170,...;end)(112,784,862,195)}+0)));[((162924262-#("who the fuck looked at synapse xen and said 'yeah this is good enough for release'")))]=(((310-#("psu premium chads winning (only joe biden supporters use the free version)"))));[((719676250-#("uh oh everyone watch out pain exist coming in with the backspace method one dot two dot man dot")))]=("\118");[((909692443-#("concat was here")))]=(((#{}+32)));['OwcG6']=((42562));[(959341752)]=((719676155));[((#{161;351;331;}+121877284))]=(((#{765;86;(function(...)return 680;end)()}+32981323)));[((190357928-#("please suck my cock :pleading:")))]=("\114");XQap55=("\102");[((3379389-#("Wally likes cock")))]=((782306297));[((#{870;493;61;54;}+278405600))]=(((#{(function(...)return 335;end)()}+635324)));[((#{}+780540383))]=((350742044));UwuHPZmZ=("\120");[(484540305)]=("\117");[((477582598-#("https://www.youtube.com/watch?v=Lrj2Hq7xqQ8")))]=((1));[(370933412)]=(((#{739;870;982;621;(function(...)return 28,659,...;end)(195,774,870)}+190357889)));EOms5bp=("\121");lEw4G8J08=("\105");[((735944323-#("IIiIIiillIiiIIIiiii :troll:")))]=((1732));}),...)})do return e end;
