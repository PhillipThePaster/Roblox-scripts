--this just teleports all players heads to infront of you're local player

local LP = game:GetService("Players").LocalPlayer

local function updatePlayerHeads()
	for _, v in pairs(game:GetService("Players"):GetPlayers()) do
		if v and v.Character and v ~= LP and v.Character:FindFirstChild("Head") then
			local hrp = v.Character:FindFirstChild("Head")
			hrp:BreakJoints()
			hrp.Transparency = 0.8
			hrp.BrickColor = v.TeamColor
			hrp.Anchored = true
			hrp.CanCollide = false
			pcall(function()
				hrp.CFrame = LP.Character.HumanoidRootPart.CFrame * CFrame.new(0.3, 0, -5.5)
			end)
		end
	end
end

game:GetService("RunService").RenderStepped:Connect(function()
	updatePlayerHeads()
end)
