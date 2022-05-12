local mt = getrawmetatable(game)
setreadonly(mt, false)
local oldmt = mt.__namecall
mt.__namecall = newcclosure(function(Self, ...)
    local method = getnamecallmethod()
    if method == 'Kick' then
        print("Attempted Kick")
        wait(9e9)
        return nil
    end
    return oldmt(Self, ...)
end)
setreadonly(mt, true)
local GameMetatable = getrawmetatable(game)
local GameIndex = GameMetatable.__index
setreadonly(GameMetatable, false)
GameMetatable.__index = newcclosure(function(self, Key)
    if self == game and Key == "HttpGet" then
        return nil 
    end
    return GameIndex(self, Key)
end)
setreadonly(GameMetatable, true)
while wait(1) do
		if pcall(
			function()
				if game:GetService('Players').LocalPlayer.Idled == nil then
					print('a'+1)
				end
			end
		) then
		for i,v in pairs(getconnections(game:GetService('Players').LocalPlayer.Idled)) do
			v:Disable()
		end
		break
	end
end
printconsole("VH - Succesfully Started Bypasser",0,250,255)
