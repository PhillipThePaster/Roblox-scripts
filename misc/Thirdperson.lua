--wont work in all games
local LocalPlayer = game.Players.LocalPlayer
local CurrentCamera = workspace.CurrentCamera

local newindex; newindex = hookmetamethod(game, '__newindex', function(obj, idx, val)

   if obj == CurrentCamera and idx == 'CFrame' then
       val = val + (val.LookVector * -1)
   end

   return newindex(obj, idx, val)
end)
