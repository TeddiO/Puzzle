ENT.Base = "base_brush"
ENT.Type = "brush"


function ENT:Init()

end

function ENT:StartTouch(e)
	if !e:IsPlayer() then return end

	if self.speed == "reset" then
		e:SetRunSpeed(tonumber(GetMapSetting("sprintspeed")))
		if !util.tobool(tonumber(GetMapSetting("sprintenable"))) || self.speed == 0 then
			e:SprintDisable()
		end
	else
		e:SprintEnable()
		e:SetRunSpeed(tonumber(self.speed))
	end
end

local function LoadSprint(e,k,v)
	if e:GetClass() == "puz_sprintspeed" then
		if k == "speed" then 
			e.speed = v
		end
	end
end
hook.Add("EntityKeyValue","LoadSprintSettings",LoadSprint)