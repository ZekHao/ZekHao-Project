-- [[ ZekHao KorBloxUI_For Ayo]] --
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

local KORBLOX_MESH = "101851696"
local KORBLOX_TEX = "101851254"
local HEAD_MESH = "134082579"
local HEAD_TEX = "134082627"

local function ApplyFakeHeadless()
    local Head = Character:FindFirstChild("Head")
    if Head then
        for _, v in pairs(Head:GetChildren()) do
            if v:IsA("Decal") or v:IsA("SpecialMesh") then
                v:Destroy()
            end
        end
        
        for _, acc in pairs(Character:GetChildren()) do
            if acc:IsA("Accessory") then
                local handle = acc:FindFirstChild("Handle")
                if handle then
                    local attachment = handle:FindFirstChildOfClass("Attachment")
                    if attachment then
                        if attachment.Name:find("Face") then
                            acc:Destroy()
                        end
                    end
                end
            end
        end
        
        local Mesh = Instance.new("SpecialMesh", Head)
        Mesh.MeshType = Enum.MeshType.FileMesh
        Mesh.MeshId = "rbxassetid://" .. HEAD_MESH
        Mesh.TextureId = "rbxassetid://" .. HEAD_TEX
        Mesh.Scale = Vector3.new(1.25, 1.25, 1.25)
        Head.Transparency = 0.1
        Head.Color = Color3.fromRGB(17, 17, 17)
    end
end

local function ApplyFakeKorblox()
    local Leg = Character:FindFirstChild("Right Leg") or Character:FindFirstChild("RightLowerLeg")
    if Leg then
        for _, v in pairs(Leg:GetChildren()) do
            if v:IsA("SpecialMesh") or v:IsA("CharacterMesh") then v:Destroy() end
        end

        local FakeLeg = Instance.new("Part")
        FakeLeg.Name = "FakeKorbloxLeg"
        FakeLeg.Size = Leg.Size
        FakeLeg.CFrame = Leg.CFrame
        FakeLeg.Anchored = false
        FakeLeg.CanCollide = false
        FakeLeg.Transparency = 0
        FakeLeg.Color = Color3.fromRGB(17, 17, 17)
        FakeLeg.Material = Enum.Material.Plastic

        local Mesh = Instance.new("SpecialMesh", FakeLeg)
        Mesh.MeshType = Enum.MeshType.FileMesh
        Mesh.MeshId = "rbxassetid://" .. KORBLOX_MESH
        Mesh.TextureId = "rbxassetid://" .. KORBLOX_TEX
        FakeLeg.Parent = Character
        
        local Weld = Instance.new("WeldConstraint", Leg)
        Weld.Part0 = Leg
        Weld.Part1 = FakeLeg
        Weld.Parent = Leg
        Leg.Transparency = 1
    end
end

ApplyFakeHeadless()
ApplyFakeKorblox()

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "加载成功",
    Text = "KorBlox UI By ZekHao",
    Duration = 5
})
