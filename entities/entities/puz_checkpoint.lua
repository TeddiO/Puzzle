ENT.Base = "base_brush"
ENT.Type = "brush"


function ENT:Init()

end

function ENT:StartTouch(e)
	if !e:IsPlayer() then return end
	if e:GetCurrentCheckpoint() == self.PointNumber then return end

	if self.PointNumber != "final" || self.PointNumber != "finish" then
		e:SetCheckpoint(self.PointNumber)
		GM:PlayerPassedCheckpoint(e, self.PointNumber)
	else
		GM:PlayerFinishedLevel(e)
	end
end