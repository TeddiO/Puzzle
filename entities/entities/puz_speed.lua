ENT.Base = "base_brush"
ENT.Type = "brush"


function ENT:Init()

end

function ENT:StartTouch(e)
	if !e:IsPlayer() then return end

	if self.type == "reset" then
		e:SetWalkSpeed(GetMapSetting(walkspeed))
	else
		e:SetWalkSpeed(self.speed)
	end
end