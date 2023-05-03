loadstring(game:HttpGet('https://raw.githubusercontent.com/Kzin018Lenda/AutoBounty/main/CosmicHub.lua'))()
wait(10)
print('Começou a vigarice')
--made by sadawrf#3405
_G.Enable = true --Toggle
_G.Speed = "0" --Increases/Decreases Circle Speed
_G.range = "2" --Increases/Decreases Circle Range

--Modify If You Want
local players = game:GetService("Players")
while true do
    local closestPlayer = nil
    local shortestDistance = math.huge

    for i, player in ipairs(players:GetPlayers()) do
        if player ~= players.LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local distance =
                (player.Character.HumanoidRootPart.Position - players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
            if distance < shortestDistance then
                closestPlayer = player
                shortestDistance = distance
            end
        end
    end

    if closestPlayer then
        local rootCFrame = players.LocalPlayer.Character.HumanoidRootPart.CFrame
        local targetCFrame = closestPlayer.Character.HumanoidRootPart.CFrame
        for i = 1, 10 do
            local angle = math.rad(i)
            local x = math.sin(angle) * _G.range
            local z = math.cos(angle) * _G.range
            local offset = Vector3.new(x, 18, z)
            local newCFrame = targetCFrame + offset
            players.LocalPlayer.Character.HumanoidRootPart.CFrame = newCFrame
            task.wait(_G.Speed)
        end
    end 
end 

_G.HeadSize = 22
_G.Disabled = true

game:GetService('RunService').RenderStepped:connect(function()
if _G.Disabled then
for i,v in next, game:GetService('Players'):GetPlayers() do
if v.Name ~= game:GetService('Players').LocalPlayer.Name then
pcall(function()
v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
v.Character.HumanoidRootPart.Transparency = 0.7
v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
v.Character.HumanoidRootPart.Material = "Neon"
v.Character.HumanoidRootPart.CanCollide = false
end)
end
end
end
end)