/*
	General player stuff.
*/

local tonumber = tonumber

local function InitialPlayerSettings(ply)
	ply:AllowFlashlight(util.tobool(tonumber(GetMapSetting("flashlight"))))
	ply.MaxSkips = GetMapSetting("skips")
end


function GM:PlayerInitialSpawn(ply)
	InitialPlayerSettings(ply)
end

function GM:PlayerSpawn(ply)
	if util.tobool(tonumber(GetMapSetting("crowbar"))) then
		ply:Give("weapon_crowbar")
	end

	if util.tobool(tonumber(GetMapSetting("gravgun"))) then
		ply:Give("weapon_physcannon")
	end

	if util.tobool(tonumber(GetMapSetting("sprintenabled"))) then
		ply:SetRunSpeed(tonumber(GetMapSetting("sprintspeed")))
	else
		ply:SprintDisable()
	end
	
	ply:SetWalkSpeed(tonumber(GetMapSetting("walkspeed")))
	ply:SetJumpPower(tonumber(GetMapSetting("jumppower")))

end
	