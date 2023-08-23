--this is my old ass debug watermark 
version = "2103.6"

local camera = game:GetService("Workspace").CurrentCamera
local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local Teams = game:GetService("Teams")

local watermark3 = Drawing.new("Text")
watermark3.Font = Drawing.Fonts.Plex
watermark3.Color = Color3.new(0/255,255/255,20/255)
watermark3.Position = Vector2.new(camera.ViewportSize.X - 2550, camera.ViewportSize.Y - 1100)
watermark3.Size = 16.0
watermark3.Transparency = 1
watermark3.Outline = true
watermark3.Visible = true
Paused = false
local function updateWatermark()
    local position = character.HumanoidRootPart.Position
    local formattedTeam = player.Team and "Team: " .. player.Team.Name or "Team: None"
    local playerCount = #game.Players:GetPlayers()
    local mousePos = game:GetService("UserInputService"):GetMouseLocation()
    local formattedMousePos = string.format("Mouse X: %.2f, Mouse Y: %.2f", mousePos.X, mousePos.Y)
    local formattedPosition = string.format("Player Position: X: %.2f, Y: %.2f, Z: %.2f", position.X, position.Y, position.Z)
    local fps = tostring(math.floor(1 / game:GetService("RunService").RenderStepped:Wait()))
    local memoryUsage = string.format("Memory Usage: %.2f MB", collectgarbage("count")/1024)
    watermark3.Text = "Doshka Internal V.".. version .."\nPlayer: " .. player.Name .. "\nFPS: " .. fps .. "\n" .. formattedTeam .. "\nPlayer Count: " .. playerCount .. "\n" .. formattedMousePos .. "\n" .. formattedPosition .."\n" .. memoryUsage .. "\nTime:" .. os.date("%X") .. ""
end
local function mainLoop()
    updateWatermark()
end
game:GetService("RunService").RenderStepped:Connect(mainLoop)

