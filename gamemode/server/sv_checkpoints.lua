/*
	This file tracks checkpoints and so on.
*/
local Checkpoints = {}

function GetCheckpointSpawn(numCheckpoint)
	if !numCheckpoint then Error("No checkpoint was specified!") return end
	return Checkpoints[numCheckpoint].spawnent:GetPos()
end
	

local function GetCheckpointNumber(e,k,v)
	if e:GetClass() == "puz_checkpoint" then
		if k == "number" then
			if v != "final" || v != "finish" then
				e.PointNumber = tonumber(v)
				if !Checkpoints[v] then Checkpoints[v] = {spawnent = "",} end
			else
				e.PointNumber = v
				if !Checkpoints[v] then Checkpoints[v] = {spawnent = "",} end
			end
		end
	end
end
hook.Add("EntityKeyValue","GetCheckpointIDs",GetCheckpointNumber)

local function LoadSpawnID(e,k,v)
	if e:GetClass() == "puz_checkpointspawn" then
		if k == "number" then 
			e.number = tonumber(v)
		end
	end
end
hook.Add("EntityKeyValue","LoadSpawnTargets",LoadSpawnID)

//The reason we perform this in InitPostEntity, and not just grab it at the same time with kv is for two reasons
//A) We can't dictate the order each server will read the entities on the server
//B) InitPostEntity is ran after the EntityKeyValue hook has been called (many times). 
//So this is the best reliable way of setting it all up without issue. 
local function AssignSpawns()
	//Jeez here we go
	for _, ent in pairs(ents.GetAll()) do
		if ent:GetClass() == "puz_checkpointspawn" then
			if !Checkpoints[ent.number] then 
				Checkpoints[ent.number] = {spawnent = ent,}
			else
				Checkpoints[ent.number].spawnent = v
			end
		end
	end
	hook.Remove("InitPostEntity","FinaliseCheckpointTargets")
end
hook.Add("InitPostEntity","FinaliseCheckpointTargets",AssignSpawns)
