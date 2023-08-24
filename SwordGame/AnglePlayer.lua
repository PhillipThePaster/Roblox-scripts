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
    
    return closestPlayer, closestDistance
end

local function rotateToClosestPlayer()
    local closestPlayer, closestDistance = findClosestPlayer()
    
    if closestPlayer and closestDistance <= 100 then --change this for min distance 
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



-- To stop it, you can call:
-- connection:Disconnect()
