ENT.Base = "base_brush"
ENT.Type = "brush"


function ENT:Init()

end

function ENT:StartTouch(e)
	if !e:IsPlayer() then return end
	e:SetCheckpoint(self.PointNumber)
	e:PrintMessage("Congradulations on getting to "..self.PointNumber.."!")
end