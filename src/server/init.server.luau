local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Shared = ReplicatedStorage:WaitForChild("Shared")
local Network = require(Shared:WaitForChild("Network"))
local SolarisCore = require(Shared:WaitForChild("SolarisCore"))

-- Listener for client requests
Network.GetRemote("RequestAbility").OnServerEvent:Connect(function(player: Player, abilityName: string)
    local character = player.Character
    if not character then return end
    
    -- Execute ability logic
    SolarisCore.Execute(abilityName, player)
    
    -- Tell ALL clients to play the VFX at the player's position
    Network.GetRemote("VFX_Broadcast"):FireAllClients("Explosion", character.PrimaryPart.Position)
end)