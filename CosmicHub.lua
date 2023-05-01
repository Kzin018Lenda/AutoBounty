local library = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ShaddowScripts/Main/main/Library"))()

local Main = library:CreateWindow("Main","Crimson")

local tab = Main:CreateTab("Cheats")

tab:CreateToggle("AutoBounty • Farm",function()
  Teleport()
  Click()
end)








-- Functions

function Click()
  #// Setting \
local range = 1000
 
#// Variable \
local player = game:GetService("Players").LocalPlayer
 
#// Script \
game:GetService("RunService").RenderStepped:Connect(function()
    local p = game.Players:GetPlayers()
    for i = 2, #p do local v = p[i].Character
        if v and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v:FindFirstChild("HumanoidRootPart") and player:DistanceFromCharacter(v.HumanoidRootPart.Position) <= range then
            local tool = player.Character and player.Character:FindFirstChildOfClass("Tool")
            if tool and tool:FindFirstChild("Handle") then
                tool:Activate()
                for i,v in next, v:GetChildren() do
                    if v:IsA("BasePart") then
                        firetouchinterest(tool.Handle,v,0)
                        firetouchinterest(tool.Handle,v,1)
                    end
                end
            end
        end
    end
end)
end

function Teleport()
  --made by sadawrf#3405
_G.Enable = true --Toggle
_G.Speed = "10" --Increases/Decreases Circle Speed
_G.range = "5" --Increases/Decreases Circle Range

--Modify If You Want
local players = game:GetService("Players")
while _G.Enable do
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
        for i = 1, 360 do
            local angle = math.rad(i)
            local x = math.sin(angle) * _G.range
            local z = math.cos(angle) * _G.range
            local offset = Vector3.new(x, 0, z)
            local newCFrame = targetCFrame + offset
            players.LocalPlayer.Character.HumanoidRootPart.CFrame = newCFrame
            task.wait(_G.Speed)
        end
    end
end
end 



tab:Show()
