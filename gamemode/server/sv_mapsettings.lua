/*
	This file just tracks and controls the default settings for the map. 
	Also, if the map is olde, this should hopefully allow for some minor compatability
	For per-map compat. , check the 'maps' folder. 	

	Oh, and these won't provide "forever" enabled / disbled stuff. If a mapper places the appropriate brush in the map, then it will allow for it to be enabled.

*/

local MapSettings={}
MapSettings["walkspeed"]=250
MapSettings["crouchspeed"]=210
MapSettings["sprintspeed"]=280
MapSettings["sprintenable"]=0
MapSettings["flashlight"]=0
MapSettings["skips"]=3
MapSettings["falldamage"]=1
MapSettings["crowbar"]=1
MapSettings["jumppower"]=200

function GetMapSetting(strSetting)
	return MapSettings[strSetting] || 0
end

local function LoadSettings(e,k,v)
	if e:GetClass() == "puz_settings" then
		MapSettings[k]=v
	end
end
hook.Add("EntityKeyValue","LoadSettings",LoadSettings)


function GM:GetFallDamage(ply, numSpeed )
	if !ply.ShouldTakeFallDamage then return 0 end
	if !util.tobool(tonumber(MapSettings["falldamage"])) then return 0 else
 		return (numSpeed-580)*(100/(1024-580))
	end
end
	
	
local function CheckSettingsExist()
	for _, ent in pairs(ents.GetAll()) do
		if ent:GetClass() == "puz_settings" then
			hook.Remove("InitPostEntity","CheckForSettings")
			hook.Remove("EntityKeyValue","LoadSettings")
			return
		end
	end

	ErrorNoHalt("Puzzle: Warning! No settings entity exists for this map!\n")
	ErrorNoHalt("Puzzle: All settings will be default!")
	hook.Remove("InitPostEntity","CheckForSettings")
	hook.Remove("EntityKeyValue","LoadSettings")
end
hook.Add("InitPostEntity","CheckForSettings",CheckSettingsExist)

//Just clean up the hooks, there's no need for them to exist post-init and it's just bloat. 
local function CleanupIPEHooks()
	hook.Remove("EntityKeyValue","LoadSpeedSettings")
	hook.Remove("EntityKeyValue","LoadSprintSettings")
	hook.Remove("EntityKeyValue","LoadJumpSettings")
	hook.Remove("EntityKeyValue","LoadFlashlightSettings")
	hook.Remove("EntityKeyValue","LoadFallSettings")
	hook.Remove("InitPostEntity","CleanupIPEHooks")
	hook.Remove("EntityKeyValue","LoadSpawnTargets")
end
hook.Add("InitPostEntity","CleanupIPEHooks",CleanupIPEHooks)