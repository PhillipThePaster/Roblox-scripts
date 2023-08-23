--this one makes your localplayer a amongus
		local ply = game.Players.LocalPlayer
		local chr = ply.Character
		for i,v in pairs(chr:GetChildren()) do 
			if v:IsA("Accessory") then
				v:Destroy()
			end
		end
		for i,a in pairs(chr.Head:GetChildren()) do
			if a:IsA("Decal") then
				a:Destroy() 
			end
		end

		chr.UpperTorso.Transparency = 1
		chr.LowerTorso.Transparency = 1
		chr.LeftFoot.Transparency = 1
		chr.LeftLowerLeg.Transparency = 1
		chr.LeftUpperLeg.Transparency = 1
		chr.RightFoot.Transparency = 1
		chr.RightLowerLeg.Transparency = 1
		chr.RightUpperLeg.Transparency = 1
		chr.LeftHand.Transparency = 1
		chr.LeftLowerArm.Transparency = 1
		chr.LeftUpperArm.Transparency = 1
		chr.RightHand.Transparency = 1
		chr.RightLowerArm.Transparency = 1
		chr.RightUpperArm.Transparency = 1
		chr.Head.Transparency = 1
		chr.HumanoidRootPart.Transparency = 0

--remove from here if you want furry model
	local hrp = chr:WaitForChild("HumanoidRootPart")
	hrp.BrickColor = BrickColor.new("Really Blue")
	local fuckingmesh = Instance.new("SpecialMesh")
	fuckingmesh.VertexColor = Vector3.new(0,0,255)
	fuckingmesh.Name = "Really Blue"
		fuckingmesh.Parent = hrp
		fuckingmesh.TextureId = "1"
		fuckingmesh.MeshId = 'rbxassetid://6789346871'
		fuckingmesh.Scale = Vector3.new(0.15000000596046448, 0.1300000101327896, 0.1300000101327896)

--{Furry Model}--
--[[	local hrp = chr:WaitForChild("HumanoidRootPart")
	local fuckingmesh = Instance.new("SpecialMesh")
		fuckingmesh.Parent = hrp
		fuckingmesh.TextureId = "rbxassetid://3279148584"
		fuckingmesh.MeshId = 'rbxassetid://3279148402'
		fuckingmesh.Scale = Vector3.new(0.15000000596046448, 0.1300000101327896, 0.1300000101327896 
]]--
