getgenv().walkspeed = 0.3
getgenv().autowalk = true

game:GetService("RunService").RenderStepped:Connect(function()
    if autowalk then
        local player = game.Players.LocalPlayer
        local character = player.Character
        if character then
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                local newCFrame = humanoidRootPart.CFrame + humanoidRootPart.CFrame.lookVector * walkspeed
                humanoidRootPart.CFrame = newCFrame
            end
        end
    end
end)
