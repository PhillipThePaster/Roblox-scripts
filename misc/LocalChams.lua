local player = game.Players.LocalPlayer

local settings = {
    LocalChams = true,
    Color = Color3.new(1, 0, 0),
    Material = Enum.Material.ForceField,

}
local function PMCHANGER(character)
    if character then
        local parts = character:GetDescendants()
        for i = 1, #parts do
            if parts[i]:IsA("BasePart") then
                if LocalChams then
                    parts[i].Material = Enum.Material.SmoothPlastic 
                    parts[i].Color = Color3.new(1, 1, 1)
                else
                    parts[i].Material = settings.Material
                    parts[i].Color = settings.Color
                end
            end
        end
    end
end

local function onCharacterAdded(character)
    PMCHANGER(character)
end

player.CharacterAdded:Connect(onCharacterAdded)

local function LCTOGGLE()
    settings.LocalChams = not settings.LocalChams
    local character = player.Character
    if character then
        PMCHANGER(character)
    end
end

LCTOGGLE()
