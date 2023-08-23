local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/PhillipThePaster/3d-DrawingLib/main/drawing.lua"))()
local Circle = Library:New3DCircle()
Circle.Visible = true
Circle.ZIndex = 1
Circle.Transparency = 1
Circle.Color = Color3.fromRGB(0, 255, 255)
Circle.Thickness = 1
Circle.Radius = 0

local settings = {
    active = true,
    reachType = "Circle", -- unused for now
    dmgEnabled = true,
    Visualizer = true,
    reach = 20
}

local function onHit(hit, handle)
    local victim = hit.Parent:FindFirstChildOfClass("Humanoid")
    if victim and victim.Parent.Name ~= game.Players.LocalPlayer.Name then
        if settings.dmgEnabled then
            for _, v in pairs(hit.Parent:GetChildren()) do
                if v:IsA("Part") then
                    firetouchinterest(v, handle, 0)
                    firetouchinterest(v, handle, 1)
                end
            end
        else
            firetouchinterest(hit, handle, 0)
            firetouchinterest(hit, handle, 1)
        end
    end
end

local function getWhiteList()
    local wl = {}
    for _, v in pairs(game.Players:GetPlayers()) do
        if v ~= game.Players.LocalPlayer then
            local char = v.Character
            if char then
                for _, q in pairs(char:GetChildren()) do
                    if q:IsA("Part") then
                        table.insert(wl, q)
                    end
                end
            end
        end
    end
    return wl
end

game:GetService("RunService").RenderStepped:Connect(function()
    if not settings.active then return end
    local s = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
    if not s then Circle.Visible = false return end
    if s then
        local handle = s:FindFirstChild("Handle") or s:FindFirstChildOfClass("Part")
        if handle then
            Circle.Visible = settings.Visualizer

            if settings.reach then
                if settings.reachType == "Circle" then
                    Circle.Position = handle.Position
                    Circle.Radius = settings.reach / 2
                    if settings.Visualizer then
                        Circle.Visible = true
                    else
                        Circle.Visible = false
                    end
                    for _, v in pairs(game.Players:GetPlayers()) do
                        local hrp = v.Character and v.Character:FindFirstChild("HumanoidRootPart")
                        if hrp and handle then
                            local mag = (hrp.Position - handle.Position).magnitude
                            if mag <= settings.reach then
                                onHit(hrp, handle)
                            end
                        end
                    end
                end
            end
        else
            Circle.Visible = false
        end
    end
end)
