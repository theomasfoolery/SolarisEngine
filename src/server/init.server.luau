local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Shared = ReplicatedStorage:WaitForChild("Shared")
local SolarisCore = require(Shared:WaitForChild("SolarisCore"))

-- Simulate loading abilities
local Fireball = {
    Name = "SolarFlare",
    Cooldown = 5,
    OnActivate = function(player)
        print("🔥 Solaris Flare activated by " .. player.Name)
        -- Logic for creating a projectile would go here
    end
}

SolarisCore.RegisterAbility(Fireball)

print("☀️ Solaris Engine Server Initialized")