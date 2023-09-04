local function checkCharacterRig()
    if game:GetService("Players").LocalPlayer.Character then
        local humanoid = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            if humanoid.RigType == Enum.HumanoidRigType.R6 then
                return "R6"
            elseif humanoid.RigType == Enum.HumanoidRigType.R15 then
                return "R15"
            end
        end
    end
    return "Unknown"
end
local characterRig = checkCharacterRig()
print("Character Rig Type: " .. characterRig)
local R6Bones = {"Head","Torso","Left Arm","Right Arm","Left Leg","Right Leg",}
local R15Bones = {"Head","UpperTorso","LowerTorso","LeftUpperArm","LeftLowerArm","RightUpperArm","RightLowerArm","LeftHand","RightHand","LeftUpperLeg","LeftLowerLeg","LeftFoot","RightUpperLeg","RightLowerLeg","RightFoot",}

if characterRig == "R6" then
    for i, bone in ipairs(R6Bones) do
        print("R6 Bone " .. i .. ": " .. bone)
    end
elseif characterRig == "R15" then
    for i, bone in ipairs(R15Bones) do
        print("R15 Bone " .. i .. ": " .. bone)
    end
else
    print("Unknown character rig type.")
end
