--[=[
    Network.luau
    A lightweight wrapper for Roblox RemoteEvents.
]=]

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Network = {}
local Remotes = ReplicatedStorage:FindFirstChild("Remotes") or Instance.new("Folder")
Remotes.Name = "Remotes"
Remotes.Parent = ReplicatedStorage

function Network.GetRemote(name: string): RemoteEvent
	local remote = Remotes:FindFirstChild(name)
	if not remote then
		remote = Instance.new("RemoteEvent")
		remote.Name = name
		remote.Parent = Remotes
	end
	return remote
end

function Network.FireServer(name: string, ...: any)
	Network.GetRemote(name):FireServer(...)
end

return Network