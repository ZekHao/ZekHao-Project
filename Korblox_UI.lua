--[[
Korblox UI By ZekHao
]]
local v1 = game:GetService("Players")
game:GetService("ReplicatedStorage")
game:GetService("RunService")
local vu2 = game:GetService("StarterGui")
local vu3 = v1.LocalPlayer;
(vu3.Character or vu3.CharacterAdded:Wait()):WaitForChild("Humanoid")
local vu4 = "101851696"
local vu5 = "101851254"
local vu6 = "134082579"
local vu7 = "134082627"
local function v15()
    local v8 = vu3.Character
    if v8 then
        local v9 = v8:FindFirstChild("Right Leg") or v8:FindFirstChild("RightLowerLeg")
        if v9 then
            local v10, v11, v12 = pairs(v9:GetChildren())
            while true do
                local v13
                v12, v13 = v10(v11, v12)
                if v12 == nil then
                    break
                end
                if v13:IsA("SpecialMesh") then
                    v13:Destroy()
                end
            end
            local v14 = Instance.new("SpecialMesh")
            v14.MeshType = Enum.MeshType.FileMesh
            v14.MeshId = "rbxassetid://" .. vu4
            v14.TextureId = "rbxassetid://" .. vu5
            v14.Scale = Vector3.new(1, 1, 1)
            v14.Offset = Vector3.new(0, 0, 0)
            v14.Parent = v9
            v9.Transparency = 0.1
            v9.BrickColor = BrickColor.new("Really black")
            v9.Material = Enum.Material.Plastic
        end
    end
end
local function v29()
    local v16 = vu3.Character
    if v16 then
        local v17 = v16:FindFirstChild("Head")
        if v17 then
            local v18, v19, v20 = pairs(v17:GetChildren())
            while true do
                local v21
                v20, v21 = v18(v19, v20)
                if v20 == nil then
                    break
                end
                if v21:IsA("Decal") or v21:IsA("SpecialMesh") then
                    v21:Destroy()
                end
            end
            local v22 = Instance.new("SpecialMesh")
            v22.MeshType = Enum.MeshType.FileMesh
            v22.MeshId = "rbxassetid://" .. vu6
            v22.TextureId = "rbxassetid://" .. vu7
            v22.Scale = Vector3.new(1.25, 1.25, 1.25)
            v22.Offset = Vector3.new(0, 0, 0)
            v22.Parent = v17
            v17.Transparency = 0.1
            v17.BrickColor = BrickColor.new("Really black")
            v17.Material = Enum.Material.Plastic
            local v23, v24, v25 = pairs(v16:GetChildren())
            while true do
                local v26
                v25, v26 = v23(v24, v25)
                if v25 == nil then
                    break
                end
                if v26:IsA("Accessory") then
                    local v27 = v26:FindFirstChild("Handle")
                    if v27 then
                        local v28 = v27:FindFirstChildOfClass("Attachment")
                        if v28 and (v28.Name:lower():find("hair") or (v28.Name:lower():find("hat") or v28.Name:lower():find("face"))) then
                            v26:Destroy()
                        end
                    end
                end
            end
        end
    end
end
local function v36()
    local v30 = vu3.Character
    if v30 then
        local v31 = v30:FindFirstChild("Right Leg") or v30:FindFirstChild("RightLowerLeg")
        if v31 then
            local v32 = v30:FindFirstChild("FakeKorbloxLeg")
            if v32 then
                v32:Destroy()
            end
            local v33 = Instance.new("Part")
            v33.Name = "FakeKorbloxLeg"
            v33.Size = v31.Size
            v33.CFrame = v31.CFrame
            v33.Anchored = false
            v33.CanCollide = false
            v33.Transparency = 0
            v33.BrickColor = BrickColor.new("Really black")
            v33.Material = Enum.Material.Plastic
            local v34 = Instance.new("SpecialMesh")
            v34.MeshType = Enum.MeshType.FileMesh
            v34.MeshId = "rbxassetid://" .. vu4
            v34.TextureId = "rbxassetid://" .. vu5
            v34.Scale = Vector3.new(1, 1, 1)
            v34.Offset = Vector3.new(0, 0, 0)
            v34.Parent = v33
            v33.Parent = v30
            local v35 = Instance.new("WeldConstraint")
            v35.Part0 = v31
            v35.Part1 = v33
            v35.Parent = v31
            v31.Transparency = 1
            v33.CFrame = v31.CFrame
        end
    end
end
local function v40(p37, p38, p39)
    vu2:SetCore("SendNotification", {
        Title = p37,
        Text = p38,
        Duration = p39 or 5
    })
end
if vu3.Character then
    v29()
    v15()
    v36()
    wait(1)
    v40("Fake Headless & Korblox", "Credit: By ZekHao", 7)
else
    vu3.CharacterAdded:Wait()
    v29()
    v15()
    v36()
    wait(1)
    v40("Fake Headless & Korblox", "Credit: By ZekHao", 7)
end
