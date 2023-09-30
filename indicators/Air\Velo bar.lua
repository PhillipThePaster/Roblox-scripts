local player = game.Players.LocalPlayer

local AirBar = true
local VeloBar = true

if player and player.Character then
    local MyView = game.Workspace.CurrentCamera
    local barSize = Vector2.new(304, 10)
    local barOffset = Vector2.new(MyView.ViewportSize.X / 2.3, MyView.ViewportSize.Y / 50)
    local outlineThickness = 2

    local function createBar(outlineColor, fillColor, yOffset)
	    local outline = Drawing.new("Square");outline.Visible = true;outline.Color = outlineColor;outline.Thickness = outlineThickness;outline.Size = barSize + Vector2.new(outlineThickness * 2, outlineThickness * 2);outline.Position = barOffset + Vector2.new(-outlineThickness, yOffset - outlineThickness);outline.ZIndex = 1;
        local bar = Drawing.new("Square")bar.Visible = true;bar.Transparency = 1;bar.Size = barSize;bar.Position = barOffset + Vector2.new(0, yOffset);bar.Color = fillColor;bar.Filled = true;bar.ZIndex = 2;
        return bar, outline
    end

    local VT = 90
    local ATT = 6.8
    local TIA = 0

    local Air, AoutL = createBar(Color3.fromRGB(0, 0, 0), Color3.new(1, 1, 1), 15)
    local velo, outL = createBar(Color3.fromRGB(0, 0, 0), Color3.new(1, 1, 1), 0)

    local function updateVelocity(deltaTime)
        local character = player.Character
        if character and character:FindFirstChild("Humanoid") then
            local humanoid = character.Humanoid

            if humanoid.FloorMaterial == Enum.Material.Air then TIA = TIA + deltaTime else TIA = 0 end
            if AirBar then
                local airTimeRatio = math.min(TIA / ATT, 1)
                Air.Size = barSize * Vector2.new(airTimeRatio, 1)
                Air.Color = Color3.fromHSV(0.33 * (1 - airTimeRatio), 1, 1)
            else
                Air.Visible = false
                AoutL.Visible = false
            end

            if VeloBar then
                local velocityMagnitude = humanoid.RootPart.Velocity.Magnitude
                local velocityRatio = math.min(velocityMagnitude / VT, 1)
                velo.Size = barSize * Vector2.new(velocityRatio, 1)
                velo.Color = Color3.fromHSV(0.33 * (1 - velocityRatio), 1, 1)
            else
                velo.Visible = false
                outL.Visible = false
            end
        end
    end

    game:GetService("RunService").RenderStepped:Connect(updateVelocity)
end
