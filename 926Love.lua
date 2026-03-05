-- [[ ZekHao / Zeky Private: 100% RELIABLE VERSION ]] --
-- 兼容性：极高 (不再依赖 Drawing API)
-- 功能：粉色 UI、下落粒子、打字机、可关闭

local Player = game:GetService("Players").LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")

-- 1. 彻底清理残留
if PlayerGui:FindFirstChild("ZekHao_Gift") then PlayerGui.ZekHao_Gift:Destroy() end

local ScreenGui = Instance.new("ScreenGui", PlayerGui)
ScreenGui.Name = "ZekHao_Gift"
ScreenGui.ResetOnSpawn = True -- 死了消失

-- 2. 主面板
local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 480, 0, 320)
Frame.Position = UDim2.new(0.5, -240, 0.5, -160)
Frame.BackgroundColor3 = Color3.fromRGB(255, 182, 193) -- 樱花粉
Frame.BorderSizePixel = 0
Frame.ZIndex = 10

local Corner = Instance.new("UICorner", Frame)
Corner.CornerRadius = UDim.new(0, 20)

-- 3. 关闭按钮
local Close = Instance.new("TextButton", Frame)
Close.Size = UDim2.new(0, 30, 0, 30)
Close.Position = UDim2.new(1, -40, 0, 10)
Close.Text = "X"
Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Close.BackgroundTransparency = 0.5
Close.ZIndex = 11
Close.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)
Instance.new("UICorner", Close).CornerRadius = UDim.new(1, 0)

-- 4. 文本标题
local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 60)
Title.Text = "I Love You 😙"
Title.TextSize = 40
Title.TextColor3 = Color3.new(1,1,1)
Title.BackgroundTransparency = 1
Title.ZIndex = 11

-- 5. 告白内容
local Content = Instance.new("TextLabel", Frame)
Content.Size = UDim2.new(0.9, 0, 0.6, 0)
Content.Position = UDim2.new(0.05, 0, 0.25, 0)
Content.TextSize = 18
Content.TextColor3 = Color3.new(1,1,1)
Content.TextWrapped = true
Content.BackgroundTransparency = 1
Content.ZIndex = 11
Content.Text = ""

local FullText = [[
今天是 26/09/2026
我们隔了5千多公里的异国恋走到今天也不容易
我很开心能和你在一起这么久 😁
过程中我们遇到了好多事但还是走到了今天
我永远爱着你 ❤️
祝姐姐生日快乐呀 🎂]]

-- 6. 下落粒子逻辑 (直接在 ScreenGui 下创建)
local function SpawnParticle()
    local items = {"🌸", "🍰", "❤️", "🎂"}
    local p = Instance.new("TextLabel", ScreenGui)
    p.Text = items[math.random(1, #items)]
    p.Size = UDim2.new(0, 30, 0, 30)
    p.BackgroundTransparency = 1
    p.TextSize = 25
    p.Position = UDim2.new(math.random(), 0, -0.1, 0)
    p.ZIndex = 5
    
    local fall = TweenService:Create(p, TweenInfo.new(math.random(4,6)), {Position = UDim2.new(p.Position.X.Scale, 0, 1.1, 0)})
    fall:Play()
    fall.Completed:Connect(function() p:Destroy() end)
end

-- 7. 启动
task.spawn(function()
    -- 打字机
    for i = 1, #FullText do
        Content.Text = string.sub(FullText, 1, i)
        task.wait(0.05)
    end
    -- 粒子循环
    while ScreenGui.Parent do
        SpawnParticle()
        task.wait(0.4)
    end
end)
