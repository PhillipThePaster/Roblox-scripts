local Settings = { 
    ["uiaccent"] = Color3.new(12/255, 221/255, 92/255),
}

local camera = game:GetService("Workspace").CurrentCamera
local player = game.Players.LocalPlayer
local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")

local function CreateDrawingObject(drawType, properties)
    local drawingObject = Drawing.new(drawType)
    for property, value in pairs(properties) do
        drawingObject[property] = value
    end
    return drawingObject
end

local Topbar = CreateDrawingObject("Square", {Color = Settings["uiaccent"],Thickness = 1,Transparency = 1,Filled = true,Visible = true})

local Background = CreateDrawingObject("Square", {Color = Color3.new(0, 0, 0),Thickness = 1,Transparency = 0.5,Filled = true,Visible = true})

local AirIndicator = CreateDrawingObject("Text", {Text = "",Font = Drawing.Fonts.Plex,Color = Color3.new(1, 1, 1),Size = 16,Transparency = 1,Outline = true,Visible = true})

local function updateStatusText()
    local statusText = ""
    if humanoid and humanoid.RootPart == nil then
        statusText = "Player cannot jump (no RootPart)."
    elseif humanoid and humanoid.FloorMaterial == Enum.Material.Air then
    AirIndicator.Position = Vector2.new(camera.ViewportSize.X / 2.02, camera.ViewportSize.Y / 1.9)
       statusText = "In-Air"
    else
    AirIndicator.Position = Vector2.new(camera.ViewportSize.X / 2.035, camera.ViewportSize.Y / 1.9)
       statusText = "On-Land"
  end
    AirIndicator.Text = statusText
    
    
    local squareSize = Vector2.new(115, 19)
    local squarePosition = Vector2.new(camera.ViewportSize.X / 2.09, camera.ViewportSize.Y / 1.9)
    Background.Position = squarePosition
    Background.Size = squareSize
    local topBarSize = Vector2.new(115, 3)
    local topBarPosition = squarePosition - Vector2.new(0, squareSize.y / 500 + topBarSize.y)
    Topbar.Position = topBarPosition
    Topbar.Size = topBarSize
    
end

local function RenderSteppedUpdate()
    updateStatusText()
end

game:GetService("RunService").RenderStepped:Connect(RenderSteppedUpdate)
