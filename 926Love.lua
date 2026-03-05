-- [[ ZekHao / Zeky Private Script: 926 Pink Birthday Special ]] --
-- 适配执行器: Solara / Universal
-- 功能：粉色UI、动态下落（花、蛋糕、爱心）、打字机效果、可关闭

local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

-- 1. 清理旧界面
if CoreGui:FindFirstChild("ZekHao_Birthday_UI") then
    CoreGui:FindFirstChild("ZekHao_Birthday_UI"):Destroy()
end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "ZekHao_Birthday_UI"
ScreenGui.IgnoreGuiInset = true

-- 2. 主容器（粉色半透明）
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 550, 0, 400)
MainFrame.Position = UDim2.new(0.5, -275, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 192, 203) -- 经典粉
MainFrame.BackgroundTransparency = 1 -- 初始透明，等待渐现
MainFrame.BorderSizePixel = 0

local UICorner = Instance.new("UICorner", MainFrame)
UICorner.CornerRadius = UDim.new(0, 25)

local UIStroke = Instance.new("UIStroke", MainFrame) -- 白色描边增加高级感
UIStroke.Color = Color3.fromRGB(255, 255, 255)
UIStroke.Thickness = 2
UIStroke.Transparency = 0.5

-- 3. 关闭按钮 (技术流的体贴)
local CloseBtn = Instance.new("TextButton", MainFrame)
CloseBtn.Size = UDim2.new(0, 35, 0, 35)
CloseBtn.Position = UDim2.new(1, -45, 0, 10)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.BackgroundTransparency = 0.8
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 20
CloseBtn.Font = Enum.Font.FredokaOne

local CloseCorner = Instance.new("UICorner", CloseBtn)
CloseCorner.CornerRadius = UDim.new(1, 0)

CloseBtn.MouseButton1Click:Connect(function()
    TweenService:Create(MainFrame, TweenInfo.new(0.5), {BackgroundTransparency = 1, Size = UDim2.new(0,0,0,0)}):Play()
    task.wait(0.5)
    ScreenGui:Destroy()
end)

-- 4. 文本标题
local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 80)
Title.Text = "I Love You 😙"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 55
Title.Font = Enum.Font.Lobster
Title.BackgroundTransparency = 1
Title.TextStrokeTransparency = 0.8

-- 5. 告白内容
local FullText = [[
今天是 26/09/2026
我们隔了5千多公里的异国恋走到今天也不容易
我很开心能和你在一起这么久 😁
过程中我们遇到了好多事但还是走到了今天
我永远爱着你 ❤️
祝姐姐生日快乐呀 🎂]]

local Content = Instance.new("TextLabel", MainFrame)
Content.Size = UDim2.new(0.9, 0, 0.6, 0)
Content.Position = UDim2.new(0.05, 0, 0.25, 0)
Content.TextColor3 = Color3.fromRGB(255, 255, 255)
Content.TextSize = 22
Content.Font = Enum.Font.GothamMedium
Content.TextWrapped = true
Content.BackgroundTransparency = 1
Content.Text = ""
Content.TextXAlignment = Enum.TextXAlignment.Center

-- 6. 满屏下落效果函数
local function SpawnGift()
    local items = {"🌸", "🍰", "❤️", "🌹", "✨", "🎂"}
    local p = Instance.new("TextLabel", ScreenGui)
    p.Text = items[math.random(1, #items)]
    p.BackgroundTransparency = 1
    p.TextSize = math.random(20, 35)
    p.Position = UDim2.new(math.random(), 0, -0.1, 0)
    
    local fallTime = math.random(4, 7)
    local rotate = math.random(-180, 180)
    
    TweenService:Create(p, TweenInfo.new(fallTime, Enum.EasingStyle.Linear), {
        Position = UDim2.new(p.Position.X.Scale + (math.random()-0.5)*0.2, 0, 1.1, 0),
        Rotation = rotate
    }):Play()
    
    task.delay(fallTime, function() p:Destroy() end)
end

-- 7. 动画启动流程
task.spawn(function()
    -- 背景渐现
    TweenService:Create(MainFrame, TweenInfo.new(1.5), {BackgroundTransparency = 0.2}):Play()
    task.wait(1)
    
    -- 打字机效果
    for i = 1, #FullText do
        Content.Text = string.sub(FullText, 1, i)
        task.wait(0.07)
    end
    
    -- 持续下落
    while true do
        if not ScreenGui.Parent then break end
        SpawnGift()
        task.wait(0.25)
    end
end)

print("ZekHao's Love Script for Sis Loaded Successfully!")
