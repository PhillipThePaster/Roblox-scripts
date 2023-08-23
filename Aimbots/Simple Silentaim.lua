--no this is not universal
local Service = game.GetService
local Players = Service(game, "Players")
local Client = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local Replicated = Service(game, "ReplicatedStorage")
local Collection = Service(game, "CollectionService")
local UserInput = Service(game, "UserInputService")
local VirtualUser = Service(game, "VirtualUser")
local Run = Service(game, "RunService")

local Remove, Insert = table.remove, table.insert
local Color = Color3.new
local SimpleColor = BrickColor.new

local GetMouseRay = function()
    local MousePos = UserInput:GetMouseLocation()
    local MouseRay = Camera:ScreenPointToRay(MousePos.X, MousePos.Y)
    return MouseRay
end

local GetNearestPlayerToMouse = function(MaxDist)
    local Character = nil
    local MaxDistance = MaxDist or math.huge
    for _, Player in next, Collection:GetTagged("PlayerCharacter") do
        if not (Client.Character and Player ~= Client.Character and Player:FindFirstChild("Humanoid")) then
            continue
        end
        if not (Player:FindFirstChild("Head") and Player.Humanoid.Health > 0) then
            continue
        end
        if not Player:FindFirstChild("HumanoidRootPart") then
            continue
        end
        local Head = Player.Head
        local Ray = Ray.new(Camera.CFrame.Position, (Head.Position - Camera.CFrame.Position).Unit)
        local HitPart, _ = workspace:FindPartOnRayWithIgnoreList(Ray, {Client.Character})
        if HitPart and HitPart:IsDescendantOf(Player) then
            local Distance = (Camera.CFrame.Position - Head.Position).Magnitude
            if Distance < MaxDistance then
                MaxDistance = Distance
                Character = Player
            end
        end
    end
    return Character
end

local Circle = Drawing.new("Circle")
Circle.Filled = false
Circle.Thickness = 1
Circle.Radius = 235
Circle.NumSides = 60
Circle.Color = Color(1, 1, 1)
Circle.Visible = true

local Line = Drawing.new("Line")
Line.Visible = true
Line.From = Vector2.new(0, 0)
Line.To = Vector2.new(0, 0)
Line.Thickness = 1
Line.Transparency = 1
Line.Color = Color(1, 0, 0)

local Name = Drawing.new("Text")
Name.Visible = true
Name.Text = ""
Name.Size = 18
Name.Center = true
Name.Outline = true
Name.Color = Color(1, 1, 1)

local Health = Drawing.new("Text")
Health.Visible = true
Health.Text = ""
Health.Size = 18
Health.Center = true
Health.Outline = true
Health.Color = Color(1, 1, 1)


local Update = function()
    local MousePos = UserInput:GetMouseLocation()
    Circle.Position = MousePos

    local Player = GetNearestPlayerToMouse()
    if Player then
        local Head = Player:FindFirstChild("Head")
        if Head then
            local ViewPoint = Camera:WorldToViewportPoint(Head.Position)
            local Distance = (MousePos - Vector2.new(ViewPoint.X, ViewPoint.Y)).Magnitude
            if Distance <= Circle.Radius then
                Line.From = MousePos
                Line.To = Vector2.new(ViewPoint.X, ViewPoint.Y)
                Line.Visible = true

                Name.Text = Player.Name
                Name.Position = Vector2.new(MousePos.X, MousePos.Y + Circle.Radius + 10)
                Name.Visible = true

                local health = Player.Humanoid.Health
                local healthText = string.format("%d", math.floor(health + 0.5)) .. "/100 HP"
                Health.Text = healthText
                Health.Position = Vector2.new(MousePos.X, MousePos.Y + Circle.Radius + 25)

                if health >= 67 then
                    Health.Color = Color3.new(0, 1, 0)
                elseif health >= 34 then
                    Health.Color = Color3.new(1, 1, 0)
                else
                    Health.Color = Color3.new(1, 0, 0)
                end
                Health.Visible = true
            else
                Line.Visible = false
                Name.Visible = false
                Health.Visible = false
            end
        end
    else
        Line.Visible = false
        Name.Visible = false
        Health.Visible = false
    end
end


Run.RenderStepped:Connect(Update)
