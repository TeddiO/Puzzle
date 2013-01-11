ENT.Base = "base_brush"
ENT.Type = "brush"


function ENT:Init()

end

function ENT:StartTouch(e)
	if !e:IsPlayer() then return end

	if self.Enabled == 0 then
		e.ShouldTakeFallDamage = false
	else
		e.ShouldTakeFallDamage = true
	end
end

local function LoadFallDamage(e,k,v)
	if e:GetClass() == "puz_falldamage" then
		if k == "enabled" then 
			e.Enabled = tonumber(v)
		end
	end
end
hook.Add("EntityKeyValue","LoadFallSettings",LoadFallDamage)