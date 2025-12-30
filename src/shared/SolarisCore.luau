--[=[
    SolarisCore.luau
    Handles the registration and lifecycle of game abilities.
]=]

local SolarisCore = {}
SolarisCore.__index = SolarisCore

type Ability = {
    Name: string,
    Cooldown: number,
    OnActivate: (player: Player) -> (),
}

local RegisteredAbilities: { [string]: Ability } = {}

function SolarisCore.RegisterAbility(ability: Ability)
    if RegisteredAbilities[ability.Name] then
        warn("[Solaris] Ability already registered: " .. ability.Name)
        return
    end
    RegisteredAbilities[ability.Name] = ability
    print("[Solaris] Registered: " .. ability.Name)
end

function SolarisCore.Execute(abilityName: string, player: Player)
    local ability = RegisteredAbilities[abilityName]
    if not ability then return end
    
    -- In a real project, you'd check cooldowns and energy here
    ability.OnActivate(player)
end

return SolarisCore