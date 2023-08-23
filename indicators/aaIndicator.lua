-- ive tested thison fluxxus and krnl 
--krnl is broken and i dont want to fix it so fuck you
local Settings = {
    ["uiaccent"] = Color3.new(12/255, 221/255, 92/255),
}
local player = game.Players.LocalPlayer
local camera = game:GetService("Workspace").CurrentCamera
local function CreateDrawingObject(drawType, properties)
    local drawingObject = Drawing.new(drawType)
    for property, value in pairs(properties) do
        drawingObject[property] = value
    end
    return drawingObject
end
local BackgroundOutline = CreateDrawingObject("Square", {Color = Color3.new(60/255, 60/255, 60/255), Thickness = 3, Transparency = 1, Filled = false, Visible = true})
local Background = CreateDrawingObject("Square", {Color = Color3.new(37/255, 37/255, 37/255), Thickness = 1, Transparency = 1, Filled = true, Visible = true})
local Topbar = CreateDrawingObject("Square", {Color = Settings["uiaccent"], Thickness = 0, Transparency = 1, Filled = true, Visible = true})
local AngleText = CreateDrawingObject("Text", {Text = "", Font = Drawing.Fonts.Plex, Color = Color3.new(1, 1, 1), Position = Vector2.new(17, camera.ViewportSize.Y / 1.85), Size = 16, Transparency = 1, Outline = true, Visible = true})
local aaLine = CreateDrawingObject("Line", {Color = Settings["uiaccent"], Thickness = 2, Transparency = 1, Visible = true})
local PlayerLine = CreateDrawingObject("Line", {Color = Color3.new(255/255, 255/255, 255/255), Thickness = 1, Transparency = 0.7, Visible = true})
local PlayerCircle = CreateDrawingObject("Circle", {Color = Color3.new(1, 1, 1), Thickness = 1, Transparency = 1, Visible = true, Filled = true})
local aaCircle = CreateDrawingObject("Circle", {Color = Color3.new(1, 1, 1), Thickness = 2, Transparency = 0.7, Visible = true})
local function UpdateWatermark()
    local playerRotation = player.Character.HumanoidRootPart.CFrame - player.Character.HumanoidRootPart.CFrame.Position
    local cameraRotation = camera.CFrame - camera.CFrame.Position
    local angleRadians = math.atan2(playerRotation.lookVector.Z, playerRotation.lookVector.X) - math.atan2(cameraRotation.lookVector.Z, cameraRotation.lookVector.X)
    local angleDegrees = math.deg(angleRadians)
    local adjustedAngle = -angleDegrees + 90
    AngleText.Text = string.format("Angle: %.2f°", adjustedAngle)
    local circleRadius = 50
    local lineLength = math.min(circleRadius, 100)
    local lineStart = Vector2.new(60, camera.ViewportSize.Y / 2)
    local lineEnd = lineStart + Vector2.new(lineLength * math.cos(math.rad(adjustedAngle)), -lineLength * math.sin(math.rad(adjustedAngle)))
    aaLine.From = lineStart
    aaLine.To = lineEnd
    aaCircle.Position = lineStart
    aaCircle.StartAngle = adjustedAngle - 15
    aaCircle.EndAngle = adjustedAngle + 15
    aaCircle.Radius = circleRadius
    local squareSize = Vector2.new(115, 150)
    local squarePosition = Vector2.new(3, camera.ViewportSize.Y / 1.98 - squareSize.y / 2)
    Background.Position = squarePosition
    Background.Size = squareSize
    local outlineSize = Vector2.new(squareSize.x + 2, squareSize.y + 2) 
    local outlinePosition = Vector2.new(squarePosition.x - 1, squarePosition.y - 1) 
    BackgroundOutline.Position = outlinePosition
    BackgroundOutline.Size = outlineSize 
    local topBarSize = Vector2.new(115, 3)
    local topBarPosition = squarePosition - Vector2.new(0, squareSize.y / 500 + topBarSize.y -2)
    Topbar.Position = topBarPosition
    Topbar.Size = topBarSize
    local centerCircleRadius = 3
    local centerCirclePosition = lineStart
    PlayerCircle.Position = centerCirclePosition
    PlayerCircle.Radius = centerCircleRadius
    local outerCircleRadius = 50
    local outerCircleTopPosition = Vector2.new(60, camera.ViewportSize.Y / 2 - outerCircleRadius)
    PlayerLine.From = lineStart
    PlayerLine.To = outerCircleTopPosition
end
local function RenderSteppedUpdate()
    UpdateWatermark()
end
game:GetService("RunService").RenderStepped:Connect(RenderSteppedUpdate)
