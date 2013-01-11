ENT.Base = "base_brush"
ENT.Type = "brush"


function ENT:Init()

end

function ENT:StartTouch(e)
	if !e:IsPlayer() then return end

	if self.speed == "reset" then
		e:SetWalkSpeed(tonumber(GetMapSetting("walkspeed")))
	else
		e:SetWalkSpeed(tonumber(self.speed))
	end
end

local function LoadSpeed(e,k,v)
	if e:GetClass() == "puz_runspeed" then
		if k == "speed" then 
			e.speed = v
		end
	end
end
hook.Add("EntityKeyValue","LoadSpeedSettings",LoadSpeed)