-- [[ ZekHao / Zeky Private Script: 926 Birthday Special ]] --
-- 适配执行器: Solara
-- 核心主题：跨越 5000 公里的爱

local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

-- 清理旧界面
if CoreGui:FindFirstChild("ZekHao_926_Gift") then
    CoreGui:FindFirstChild("ZekHao_926_Gift"):Destroy()
end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "ZekHao_926_Gift"

-- 主容器：半透明磨砂感
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 500, 0, 350)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -175)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 25) 
MainFrame.BorderSizePixel = 0
MainFrame.BackgroundTransparency = 1 -- 初始隐藏

local UICorner = Instance.new("UICorner", MainFrame)
UICorner.CornerRadius = UDim.new(0, 20)

-- 标题：I Love You (动态发光)
local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 80)
Title.Text = "I Love You"
Title.TextColor3 = Color3.fromRGB(255, 182, 193) -- 浅粉
Title.TextSize = 50
Title.Font = Enum.Font.SpecialElite
Title.BackgroundTransparency = 1
Title.TextTransparency = 1

-- 告白正文
local FullText = [[
今天是 2026/09/26
我们隔了 5 千多公里的异国恋走到今天也不容易
我很开心能和你在一起这么久
过程中我们遇到了好多事但还是走到了今天
我永远爱着你
祝姐姐生日快乐呀]]

local Content = Instance.new("TextLabel", MainFrame)
Content.Size = UDim2.new(0.9, 0, 0.5, 0)
Content.Position = UDim2.new(0.05, 0, 0.3, 0)
Content.TextColor3 = Color3.fromRGB(255, 255, 255)
Content.TextSize = 20
Content.Font = Enum.Font.SourceSansItalic
Content.TextWrapped = true
Content.BackgroundTransparency = 1
Content.Text = ""
Content.TextXAlignment = Enum.TextXAlignment.Left

-- 底部动态坐标
local Stats = Instance.new("TextLabel", MainFrame)
Stats.Size = UDim2.new(1, 0, 0, 30)
Stats.Position = UDim2.new(0, 0, 0.9, 0)
Stats.Text = "Melaka [5,000KM] Shuangyashan"
Stats.TextColor3 = Color3.fromRGB(100, 100, 150)
Stats.TextSize = 14
Stats.Font = Enum.Font.Code
Stats.BackgroundTransparency = 1

-- 浪漫彩蛋：满屏飘落的雨滴与爱心
local function SpawnParticle()
    local p = Instance.new("TextLabel", ScreenGui)
    p.Text = math.random() > 0.5 and "❤" or "💧"
    p.TextColor3 = p.Text == "❤" and Color3.fromRGB(255,100,100) or Color3.fromRGB(173,216,230)
    p.BackgroundTransparency = 1
    p.TextSize = math.random(15, 25)
    p.Position = UDim2.new(math.random(), 0, -0.1, 0)
    
    local fallTime = math.random(3, 5)
    TweenService:Create(p, TweenInfo.new(fallTime, Enum.EasingStyle.Linear), {Position = UDim2.new(p.Position.X.Scale, 0, 1.1, 0)}):Play()
    task.delay(fallTime, function() p:Destroy() end)
end

-- 执行动画
task.spawn(function()
    TweenService:Create(MainFrame, TweenInfo.new(2), {BackgroundTransparency = 0.15}):Play()
    task.wait(1)
    TweenService:Create(Title, TweenInfo.new(1.5), {TextTransparency = 0}):Play()
    
    -- 打字机效果
    for i = 1, #FullText do
        Content.Text = string.sub(FullText, 1, i)
        task.wait(0.06)
    end
    
    -- 启动粒子系统
    while true do
        SpawnParticle()
        task.wait(0.3)
    end
end)

print("Birthday Script for Sister loaded. ZekHao's love is online.")
