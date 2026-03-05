-- [[ ZekHao / Zeky Private: FULLSCREEN ROMANCE VERSION ]] --
-- 适配场景：926 姐姐生日 5000公里告白
-- 特点：全屏粉色半透明、全屏下落粒子、打字机、右下角隐藏退出

local Player = game:GetService("Players").LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")

-- 1. 清理旧界面
if PlayerGui:FindFirstChild("ZekHao_FullLove") then PlayerGui.ZekHao_FullLove:Destroy() end

local ScreenGui = Instance.new("ScreenGui", PlayerGui)
ScreenGui.Name = "ZekHao_FullLove"
ScreenGui.IgnoreGuiInset = true -- 覆盖任务栏，真正全屏
ScreenGui.DisplayOrder = 999 -- 确保在所有游戏UI之上

-- 2. 全屏背景 (淡粉色半透明)
local Background = Instance.new("Frame", ScreenGui)
Background.Size = UDim2.new(1, 0, 1, 0)
Background.BackgroundColor3 = Color3.fromRGB(255, 192, 203) -- 樱花粉
Background.BackgroundTransparency = 1 -- 初始透明，等待渐变
Background.BorderSizePixel = 0

-- 3. 隐藏的关闭按钮 (右下角)
local Close = Instance.new("TextButton", Background)
Close.Size = UDim2.new(0, 80, 0, 30)
Close.Position = UDim2.new(1, -90, 1, -40)
Close.Text = "[ 关闭界面 ]"
Close.BackgroundTransparency = 1
Close.TextColor3 = Color3.new(1, 1, 1)
Close.TextTransparency = 0.5
Close.Font = Enum.Font.SourceSans
Close.TextSize = 14

Close.MouseButton1Click:Connect(function()
    TweenService:Create(Background, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
    task.wait(1)
    ScreenGui:Destroy()
end)

-- 4. 居中告白文字
local Content = Instance.new("TextLabel", Background)
Content.Size = UDim2.new(0.8, 0, 0.6, 0)
Content.Position = UDim2.new(0.1, 0, 0.2, 0)
Content.TextColor3 = Color3.new(1, 1, 1)
Content.TextSize = 30 -- 调大字号，全屏更震撼
Content.Font = Enum.Font.SourceSansItalic
Content.TextWrapped = true
Content.BackgroundTransparency = 1
Content.TextStrokeTransparency = 0.8
Content.Text = ""

local FullText = [[
I Love You 😙

今天是 26/09/2026
我们隔了 5 千多公里的异国恋能到今天也不容易呀
我很开心能和你在一起这么久 😁
过程中我们遇到了好多事但你依旧没有离开我
我永远爱着你 ❤️

祝姐姐生日快乐呀 🎂
爱你的YHao 
I Love You...
Five thousand kilometers, a world away
Our love's a code I run every day
So happy we made it through everything
My forever love, I want to sing
Happy birthday to you, my dear
(Happy birthday, my love)]]

-- 5. 浪漫全屏下落函数
local function SpawnParticle()
    local items = {"🌸", "🍰", "❤️", "🎂", "🌹", "✨"}
    local p = Instance.new("TextLabel", Background)
    p.Text = items[math.random(1, #items)]
    p.Size = UDim2.new(0, 40, 0, 40)
    p.BackgroundTransparency = 1
    p.TextSize = math.random(25, 45)
    p.Position = UDim2.new(math.random(), 0, -0.1, 0)
    p.ZIndex = 5
    
    local fallTime = math.random(5, 8)
    local tween = TweenService:Create(p, TweenInfo.new(fallTime, Enum.EasingStyle.Linear), {
        Position = UDim2.new(p.Position.X.Scale + (math.random()-0.5)*0.2, 0, 1.1, 0),
        Rotation = math.random(-360, 360)
    })
    tween:Play()
    tween.Completed:Connect(function() p:Destroy() end)
end

-- 6. 动画启动逻辑
task.spawn(function()
    -- 背景渐现到半透明 (0.4 是最舒服的透明度)
    TweenService:Create(Background, TweenInfo.new(2), {BackgroundTransparency = 0.4}):Play()
    task.wait(1.5)
    
    -- 打字机效果
    for i = 1, #FullText do
        Content.Text = string.sub(FullText, 1, i)
        task.wait(0.02)
    end
    
    -- 持续全屏下落
    while ScreenGui.Parent do
        SpawnParticle()
        task.wait(0.02) -- 调快一点，让屏幕更丰富
    end
end)

print("ZekHao's Fullscreen Love is Loaded.")
