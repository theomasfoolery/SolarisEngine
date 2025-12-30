local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Shared = ReplicatedStorage:WaitForChild("Shared")

local SolarisCore = require(Shared:WaitForChild("SolarisCore"))
local Network = require(Shared:WaitForChild("Network"))

-- Setup Network Listener
Network.GetRemote("RequestAbility").OnServerEvent:Connect(function(player: Player, abilityName: string)
    -- Complex logic here: Check if player is stunned, on cooldown, etc.
    print(player.Name .. " is attempting to use " .. abilityName)
    SolarisCore.Execute(abilityName, player)
end)

-- Register Sample Ability
SolarisCore.RegisterAbility({
    Name = "SolarFlare",
    Cooldown = 5,
    OnActivate = function(player)
        print("🔥 SERVER: " .. player.Name .. " casted Solar Flare!")
    end
})

print("☀️ Solaris Engine Server Online")