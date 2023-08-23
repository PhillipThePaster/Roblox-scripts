local UserInputService = game:GetService("UserInputService")
local function hideCursor()
    UserInputService.MouseIconEnabled = false
end
hideCursor()
UserInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        hideCursor()
    end
end)
