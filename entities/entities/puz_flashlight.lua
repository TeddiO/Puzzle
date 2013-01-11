ENT.Base = "base_brush"
ENT.Type = "brush"


function ENT:Init()

end

function ENT:StartTouch(e)
	if !e:IsPlayer() then return end

	if self.flash == 0 then
		e:Flashlight(false)
		e:AllowFlashlight(false)
	else
		e:AllowFlashlight(true)
		e:Flashlight(true)
	end
end

local function LoadFlash(e,k,v)
	if e:GetClass() == "puz_flashlight" then
		if k == "enabled" then 
			e.flash = tonumber(v)
		end
	end
end
hook.Add("EntityKeyValue","LoadFlashlightSettings",LoadFlash)