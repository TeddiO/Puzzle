include("shared.lua")



local function LoadTheirData()
	RunConsoleCommand("bb_dataload")
end
hook.Add("InitPostEntity","LoadData",LoadTheirdata)