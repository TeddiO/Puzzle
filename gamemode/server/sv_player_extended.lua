
local pm = FindMetaTable("Player")

function pm:SetCheckpoint(numCheckpoint)
	self.Checkpoint = numCheckpoint
end

function pm:GetCheckpoint()
	return self.Checkpoint
end

function pm:GetSkips()
	return self.Skips
end

function pm:AddSkip(numSkip)
	self.Skips = self.Skips + numSkip
end

function pm:RemoveSkip(numSkip)
	self.Skips = self.Skips - numSkip
end

function pm:SetSkips(numSkip)
	self.Skips = numSkip
end

function pm:SetMaxSkips(numMaxSkips)
	self.MaxSkips = numMaxSkips
end
	





