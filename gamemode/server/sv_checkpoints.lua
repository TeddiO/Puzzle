/*
	This file tracks checkpoints and so on.
*/


local function GetCheckpointNumber(e,k,v)
	if e:GetClass() == "puz_checkpoint" then
		if k == "number" then
			e.PointNumber = tonumber(v)
		end
	end
end
hook.Add("EntityKeyValue","LoadSettings",GetCheckpointNumber)