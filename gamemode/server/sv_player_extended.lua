
local pm = FindMetaTable("Player")

function pm:SetCheckpoint(numCheckpoint)
	self.Checkpoint = numCheckpoint
end

function pm:MoveToCheckpoint(numCheckpoint)
	self:SetPos(GetCheckpointSpawn(numCheckpoint))
end

function pm:SetCompletedCheckpoint(numCheckpoint)
	self.CompletedCheckpoints[numCheckpoint] = true
end

function pm:HasCompletedCheckpoint(numCheckpoint)
	return self.CompletedCheckpoints[numCheckpoint] == true
end

function pm:GetCompletedCheckpoints()
	local tbl = {}
	for stage, complete in pairs(self.CompletedCheckpoints) do
		if complete == true then
			tbl[#tbl+1] = stage
		end
	end
	return tbl
end
	
function pm:GetCurrentCheckpoint()
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
	





