local player = game.Players.LocalPlayer

local function findClosestPlayer()
    local closestPlayer = nil
    local closestDistance = math.huge
    
    for _, otherPlayer in pairs(game.Players:GetPlayers()) do
        if otherPlayer ~= player and otherPlayer.Character and otherPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local distance = (player.Character.HumanoidRootPart.Position - otherPlayer.Character.HumanoidRootPart.Position).Magnitude
            if otherPlayer.Character:FindFirstChild("Humanoid") and otherPlayer.Character.Humanoid.Health > 0 then
                if distance < closestDistance then
                    closestDistance = distance
                    closestPlayer = otherPlayer
                end
            end
        end
    end
    
    return closestPlayer
end

local function rotateToClosestPlayer()
    local closestPlayer = findClosestPlayer()
    
    if closestPlayer then
        local playerPos = player.Character.HumanoidRootPart.Position
        local targetPos = closestPlayer.Character.HumanoidRootPart.Position
        local horizontalLookVector = (targetPos - playerPos)
        horizontalLookVector = Vector3.new(horizontalLookVector.x, 0, horizontalLookVector.z).unit
        local rotation = CFrame.new(playerPos, playerPos + horizontalLookVector)
        player.Character.HumanoidRootPart.CFrame = rotation
    end
end

local RunService = game:GetService("RunService")
local connection

connection = RunService.RenderStepped:Connect(function()
    rotateToClosestPlayer()
end)

-- if you want it to stop doing it just run this 
-- connection:Disconnect()
