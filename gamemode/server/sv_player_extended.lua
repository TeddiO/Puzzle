
local pm = FindMetaTable("Player")

function pm:SetCheckpoint(numCheckpoint)
	self.Checkpoint = numCheckpoint
end

function pm:GetCheckpoint()
	return self.Checkpoint
end


