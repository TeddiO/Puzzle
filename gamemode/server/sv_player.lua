/*
	General player stuff.
*/

local tonumber = tonumber

local function InitialPlayerSettings(ply)
	ply:SetWalkSpeed(tonumber(GetMapSetting("walkspeed")))
	ply:SetJumpPower(tonumber(GetMapSetting("jumppower")))
	if util.tobool(tonumber(GetMapSetting("sprintenabled"))) then
		ply:SetRunSpeed(tonumber(GetMapSetting("sprintspeed")))
	else
		ply:SprintDisable()
	end
	ply:AllowFlashlight(util.tobool(tonumber(GetMapSetting("flashlight"))))
	ply.MaxSkips = GetMapSetting("skips")
	ply.Skips = GetMapSetting("skips")
	ply.ShouldTakeFallDamage = GetMapSetting("falldamage")

	ply:SetCheckpoint(1)
	ply.InitialSpawn = true
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

	if !ply.InitialSpawn then 
		ply:MoveToCheckpoint(ply:GetCurrentCheckpoint())
	end
	
	ply.InitialSpawn = false

end


function GM:DoPlayerDeath(ply,atk,dmginfo)

end

function GM:PlayerDeath(ply)
	ply:Spawn()
end

function GM:PlayerPassedCheckpoint(ply,numCheckpoint)
	ply:ChatPrint("Congradulations on getting to checkpoint "..numCheckpoint.."!")
end
	
	
function GM:PlayerFinishedLevel(ply)
	ply:ChatPrint("Congradulations on finishing the level!")
end
