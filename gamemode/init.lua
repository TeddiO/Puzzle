include("shared.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")


function GM:Initialize()
end

function GM:InitPostEntity()
end

for k, v in pairs( file.Find("puzzle/gamemode/server/*","LUA") ) do
	include("puzzle/gamemode/server/"..v)
end


