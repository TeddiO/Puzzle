ENT.Base = "base_brush"
ENT.Type = "brush"


function ENT:Init()

end

function ENT:StartTouch(e)
	if !e:IsPlayer() then return end
	if e:GetCurrentCheckpoint() == self.PointNumber then return end

	if self.PointNumber != "final" || self.PointNumber != "finish" then
		if !e:HasCompletedCheckpoint(self.PointNumber) then
			e:SetCheckpoint(self.PointNumber)
			e:SetCompletedCheckpoint(self.PointNumber)
			GM:PlayerPassedCheckpoint(e, self.PointNumber)
		end
	else
		GM:PlayerFinishedLevel(e)
		e:SetCompletedCheckpoint(e)
	end
end