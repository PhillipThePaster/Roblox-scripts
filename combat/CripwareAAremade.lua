local antiaimEnabled = true

local motionOptions = {
    sineWave = {  --AKA sway in csgo cheats
        isEnabled = true,
        startAngle = 0,--First Angle
        endAngle = 180,--Second Angle
        frequency = 1, --Means speed
        amplitude = (180 - 0) / 2,--dont change unless u know what it means
    },
    jitter = {
        isEnabled = false,
        startAngle = 5,--First Angle
        endAngle = 20,--Second angle
        intensity = 5,--Means speed
    },
    spin = {
        isEnabled = false,
        speed = 1,
    },
}

local camera = workspace.CurrentCamera
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local humanoid = Players.LocalPlayer.Character.Humanoid

RunService.RenderStepped:Connect(function()
    if antiaimEnabled then
        local angle = 0

        if motionOptions.sineWave.isEnabled then
            angle = motionOptions.sineWave.startAngle + motionOptions.sineWave.amplitude * math.sin(time() * motionOptions.sineWave.frequency)
        end

        if motionOptions.jitter.isEnabled then
            angle = angle + motionOptions.jitter.startAngle + (motionOptions.jitter.endAngle - motionOptions.jitter.startAngle) * math.random(-100, 100) / 100 + motionOptions.jitter.intensity * math.random(-100, 100) / 100
        end

        if motionOptions.spin.isEnabled then
            humanoid.RootPart.CFrame = humanoid.RootPart.CFrame * CFrame.Angles(0, math.rad(motionOptions.spin.speed), 0)
        end

        if motionOptions.sineWave.isEnabled or motionOptions.jitter.isEnabled then
            local lookAtPos = camera.CFrame.Position
            lookAtPos = Vector3.new(lookAtPos.X, humanoid.RootPart.Position.Y, lookAtPos.Z)
            humanoid.RootPart.CFrame = CFrame.new(humanoid.RootPart.Position, lookAtPos) * CFrame.Angles(0, math.rad(angle), 0)
        end
        humanoid.AutoRotate = false
    else
        humanoid.AutoRotate = true
    end
end)
