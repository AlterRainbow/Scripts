local mt = getrawmetatable(game)
local nc = mt.__namecall

setreadonly(mt, false)

mt.__namecall = newcclosure(function(self, ...)
    if getnamecallmethod() == "FireServer" then
        if self.Name == "GasDepleteEvent" then
            return
        end
        
        if self.Name == "BladeDurEvent" then
            return
        end
    end
    
    return nc(self, unpack(...))
end)

setreadonly(mt, true)

print("executed")

-- infinite gas and infinite blade durability
-- Alter#6089
