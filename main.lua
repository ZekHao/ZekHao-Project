-- [[ ZekHao / Zeky Universal ESP & Aimbot ]] --

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local ESP_Enabled = true

local function CreateESP(Player)
    local Box = Drawing.new("Square")
    Box.Visible = false
    Box.Color = Color3.fromRGB(255, 0, 0) 
    Box.Thickness = 1
    Box.Transparency = 1
    Box.Filled = false

    local Name = Drawing.new("Text")
    Name.Visible = false
    Name.Color = Color3.fromRGB(255, 255, 255) 
    Name.Size = 16
    Name.Center = true
    Name.Outline = true

    local HealthBar = Drawing.new("Line")
    HealthBar.Visible = false
    HealthBar.Color = Color3.fromRGB(0, 255, 0) 
    HealthBar.Thickness = 2

    local function Update()
        local Connection
        Connection = RunService.RenderStepped:Connect(function()
            if ESP_Enabled and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and Player.Character:FindFirstChild("Humanoid") and Player ~= LocalPlayer then
                local RootPart = Player.Character.HumanoidRootPart
                local Humanoid = Player.Character.Humanoid
                local Pos, OnScreen = Camera:WorldToViewportPoint(RootPart.Position)

                if OnScreen then
                    local Size = (Camera:WorldToViewportPoint(RootPart.Position - Vector3.new(0, 3, 0)).Y - Camera:WorldToViewportPoint(RootPart.Position + Vector3.new(0, 2.6, 0)).Y)
                    local BoxSize = Vector2.new(Size / 1.5, Size)
                    local BoxPos = Vector2.new(Pos.X - BoxSize.X / 2, Pos.Y - BoxSize.Y / 2)

                    Box.Size = BoxSize
                    Box.Position = BoxPos
                    Box.Visible = true

                    Name.Text = Player.Name
                    Name.Position = Vector2.new(Pos.X, BoxPos.Y - 20)
                    Name.Visible = true

                    local HealthPercent = Humanoid.Health / Humanoid.MaxHealth
                    HealthBar.From = Vector2.new(BoxPos.X - 5, BoxPos.Y + BoxSize.Y)
                    HealthBar.To = Vector2.new(BoxPos.X - 5, BoxPos.Y + (BoxSize.Y * (1 - HealthPercent)))
                    HealthBar.Color = Color3.fromHSV(HealthPercent * 0.3, 1, 1) 
                    HealthBar.Visible = true
                else
                    Box.Visible = false; Name.Visible = false; HealthBar.Visible = false
                end
            else
                Box.Visible = false; Name.Visible = false; HealthBar.Visible = false
                if not Player.Parent then Connection:Disconnect() end
            end
        end)
    end
    coroutine.wrap(Update)()
end

-- 初始化 ESP
for _, p in pairs(Players:GetPlayers()) do CreateESP(p) end
Players.PlayerAdded:Connect(CreateESP)

-- ==========================================
-- UI 状态与主题配置
-- ==========================================
local State = {
    MenuOpen = false,
    IntroComplete = false,
    Mode = "none",
    Config = {
        Aimbot = {
            Enabled = false,
            Part = "head (both rigs)",
            FOV = 150,
            ShowFOV = true,
            Color = Color3.fromRGB(255, 255, 255), -- [ 颜色标记 ] 自瞄圈颜色 (白色)
            Stickiness = 1,
            WallCheck = true,
            TeamCheck = false,
            Keybind = Enum.UserInputType.MouseButton2
        },
        Triggerbot = { Enabled = false, Delay = 0.05 }
    },
    Theme = {
        Main = Color3.fromRGB(0, 0, 0),      
        Secondary = Color3.fromRGB(255, 255, 255),       
        Accent = Color3.fromRGB(50, 50, 50),       
        TextSize = 18,
        Font = Enum.Font.GothamBold
    }
}

print("ESP LOADED BY ZEKY - COLORS MARKED.")
