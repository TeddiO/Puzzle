ENT.Base = "base_brush"
ENT.Type = "brush"


function ENT:Init()

end

function ENT:StartTouch(e)
	if !e:IsPlayer() then return end

	if self.power == "reset" then
		e:SetJumpPower(tonumber(GetMapSetting("jumppower")))
	else
		e:SetJumpPower(tonumber(self.power))
	end
end

local function LoadJumpPower(e,k,v)
	if e:GetClass() == "puz_jump" then
		if k == "power" then 
			e.power = v
		end
	end
end
hook.Add("EntityKeyValue","LoadJumpSettings",LoadJumpPower)