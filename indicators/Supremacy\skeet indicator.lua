
--this is a library so it will automaticaly adjust and shit 
--the docs are pretty self explanatory just scroll down




local indicators = Instance.new("ScreenGui")
local indicatorholder = Instance.new("Frame")
local listlayout = Instance.new("UIListLayout")

indicators.Name = " "
indicators.Parent = game.CoreGui
indicators.ResetOnSpawn = false

indicatorholder.Name = "indicatorholder"
indicatorholder.Parent = indicators
indicatorholder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
indicatorholder.BackgroundTransparency = 1.000
indicatorholder.Position = UDim2.new(0.0140000004, 0, 0.5, 0)
indicatorholder.Size = UDim2.new(0.150000006, 0, 0.48, 0)

listlayout.Name = "listlayout"
listlayout.Parent = indicatorholder
listlayout.SortOrder = Enum.SortOrder.LayoutOrder
listlayout.VerticalAlignment = Enum.VerticalAlignment.Center

local function createIndicator(str, color, visible)
	local indlabel = Instance.new("TextLabel")
	local fadebg = Instance.new("ImageLabel")

	indlabel.Name = "indlabel"
	indlabel.Parent = indicatorholder
	indlabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	indlabel.BackgroundTransparency = 1.000
	indlabel.Position = UDim2.new(0, 15, 0.5, 0)
	indlabel.Size = UDim2.new(0, 65, 0, 35)
	indlabel.ZIndex = 2
	indlabel.Font = Enum.Font.GothamBold
	indlabel.Text = str
	indlabel.TextColor3 = color
	indlabel.TextSize = 32.000
	indlabel.TextXAlignment = Enum.TextXAlignment.Left
	indlabel.Visible = visible

	fadebg.Name = "fadebg"
	fadebg.Parent = indlabel
	fadebg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	fadebg.BackgroundTransparency = 1.000
	fadebg.Position = UDim2.new(-0.100000001, 0, 0, 0)
	fadebg.Size = UDim2.new(1, 0, 0.930000007, 0)
	fadebg.Image = "http://www.roblox.com/asset/?id=8010952676"
	fadebg.ImageTransparency = 0.700
	fadebg.Visible = visible
	
	return indlabel
end

local fakeLag_indicator = createIndicator("FL", Color3.fromRGB(170, 255, 0), true)
local DT_indicator = createIndicator("DT", Color3.fromRGB(170, 255, 0), true)

