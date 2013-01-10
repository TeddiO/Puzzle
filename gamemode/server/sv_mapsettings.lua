local MapSettings={}

function GetMapSetting(strSetting)
	return MapSettings[strSetting] || 0
end

local function LoadSettings(e,k,v)
	if e:GetClass() == "puz_settings" then
		MapSettings[k]=v
	end
end
hook.Add("EntityKeyValue","LoadSettings",LoadSettings)

concommand.Add("getsettings",function() for k,v in pairs(ents.GetAll()) do
	if v:GetClass() == "puz_settings" then
		PrintTable(MapSettings)
	end
end
end)

local function DefaultSettings()
	MapSettings["walkspeed"]=250
	MapSettings["crouchspeed"]=210
	MapSettings["sprintspeed"]=280
	MapSettings["sprintenable"]=1
	MapSettings["flashlight"]=0
	MapSettings["skips"]=3
	MapSettings["falldamage"]=1
	MapSettings["crowbar"]=1
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
	ErrorNoHalt("Puzzle: Defaulting to default gamemode settings")

	DefaultSettings()
	hook.Remove("InitPostEntity","CheckForSettings")
	hook.Remove("EntityKeyValue","LoadSettings")

end
hook.Add("InitPostEntity","CheckForSettings",CheckSettingsExist)