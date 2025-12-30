--[=[
    VFXHandler.luau
    Handles synchronized particle effects and tweens across all clients.
]=]

local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Shared = ReplicatedStorage:WaitForChild("Shared")
local Network = require(Shared:WaitForChild("Network"))

local VFXHandler = {}

-- Client-side listener for VFX requests
function VFXHandler.Init()
    local vfxRemote = Network.GetRemote("VFX_Broadcast")
    
    vfxRemote.OnClientEvent:Connect(function(vfxType: string, position: Vector3)
        if vfxType == "Explosion" then
            VFXHandler.CreateExplosion(position)
        end
    end)
end

function VFXHandler.CreateExplosion(position: Vector3)
    local part = Instance.new("Part")
    part.Anchored = true
    part.CanCollide = false
    part.Shape = Enum.PartType.Ball
    part.Color = Color3.fromRGB(255, 170, 0)
    part.Position = position
    part.Parent = workspace
    
    local tween = TweenService:Create(part, TweenInfo.new(0.5), {
        Size = Vector3.new(10, 10, 10),
        Transparency = 1
    })
    
    tween.Completed:Connect(function()
        part:Destroy()
    end)
    tween:Play()
end

return VFXHandler