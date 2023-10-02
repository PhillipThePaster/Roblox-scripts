local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Blissful4992/ESPs/main/3D%20Drawing%20Api.lua"))()


local ItemSettings = {
       Color = {
           Ammo = Color3.fromRGB(0, 255, 0);
           Health = Color3.fromRGB(255, 0, 0);
           Rainbow = false;
      },
    ["SmallHP"] = true;
    ["MediumHP"] = true;
    ["LargeHP"] = true;
    ["SmallAmmo"] = true;
    ["MediumAmmo"] = true;
    ["LargeAmmo"] = true;
}

local function createItemESP(item)
    local toggle = ItemSettings[item.Name]
    if toggle then
        local color = ItemSettings.Color.Health 
        if string.find(item.Name, "Ammo") then
            color = ItemSettings.Color.Ammo
        end
        local esp = giveEsp(item, color)
        spawn(function()
            while item.Parent do
                esp.Position = item.Position
                wait()
            end
            esp:Remove()
        end)
        if ItemSettings.Color.Rainbow then
            spawn(function()
                while wait() do
                    local hue = tick() % 10 / 10
                    esp.Color = Color3.fromHSV(hue, 1, 1)
                end
            end)
        end
    end
end

local function toggleEsp(item)
    local espCube = Library.Cubes[item.Name]
    if espCube then
        espCube.Visible = ItemSettings[item.Name]
    end
end

for _, item in pairs(game:GetService("Workspace").Map.Items:GetChildren()) do
    createItemESP(item)
end

game:GetService("Workspace").Map.Items.ChildAdded:Connect(function(child)
    createItemESP(child)
end)

game:GetService("Workspace").Map.Items.ChildRemoved:Connect(function(child)
    local itemName = child.Name
    if ItemSettings[itemName] then
        local espCube = Library.Cubes[itemName]
        if espCube then
            espCube.Visible = false
        end
    end
end)

