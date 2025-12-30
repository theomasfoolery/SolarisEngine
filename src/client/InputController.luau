--[=[
    InputController.luau
    Handles UserInputService and maps keys to Solaris abilities.
]=]

local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Shared = ReplicatedStorage:WaitForChild("Shared")

local Network = require(Shared:WaitForChild("Network"))

local InputController = {}

local KEY_BINDINGS = {
	[Enum.KeyCode.E] = "SolarFlare",
	[Enum.KeyCode.Q] = "LunarBurst",
}

function InputController.Init()
	UserInputService.InputBegan:Connect(function(input, processed)
		if processed then return end -- Ignore if typing in chat
		
		local actionName = KEY_BINDINGS[input.KeyCode]
		if actionName then
			print("[Client] Requesting Action: " .. actionName)
			-- Fire the network event to the server
			Network.FireServer("RequestAbility", actionName)
		end
	end)
end

return InputController