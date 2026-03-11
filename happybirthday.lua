-- [[ ZekHao / Zeky Private: FULLSCREEN ROMANCE VERSION ]] --

local Player = game:GetService("Players").LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")

if PlayerGui:FindFirstChild("ZekHao_FullLove") then PlayerGui.ZekHao_FullLove:Destroy() end

local ScreenGui = Instance.new("ScreenGui", PlayerGui)
ScreenGui.Name = "ZekHao_FullLove"
ScreenGui.IgnoreGuiInset = true 
ScreenGui.DisplayOrder = 999 

local Background = Instance.new("Frame", ScreenGui)
Background.Size = UDim2.new(1, 0, 1, 0)
Background.BackgroundColor3 = Color3.fromRGB(255, 192, 203) 
Background.BackgroundTransparency = 1 
Background.BorderSizePixel = 0

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

local Content = Instance.new("TextLabel", Background)
Content.Size = UDim2.new(0.8, 0, 0.6, 0)
Content.Position = UDim2.new(0.1, 0, 0.2, 0)
Content.TextColor3 = Color3.new(1, 1, 1)
Content.TextSize = 40
Content.Font = Enum.Font.SourceSansItalic
Content.TextWrapped = true
Content.BackgroundTransparency = 1
Content.TextStrokeTransparency = 0.8
Content.Text = ""

local FullText = [[
I Love You 😙

今天是 26/09/2026
也是姐姐的生日🎂
对不起 我一直都很自私
让你很窒息没有社交空间
如果有一天我们要是分手了
这个就是留言了呀
姐姐别天天熬夜 记得按时吃饭
想买的东西也要得攒一攒钱
不能天天吃泡面 它不营养和健康
如果真的分手了记得照顾好自己呀
我永远爱着你 ❤️

祝姐姐生日快乐呀 🎂
：爱你的YHao 
I Love You...
(Happy birthday🎂❤️)]]

local function SpawnParticle()
    local items = {"🌸", "🍰", "❤️", "🎂", "🌹", "✨", "🎉", "❤️", "💕", "💖", "💝", "🎂", "🌸", "🍰", "🌹", "✨"}
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

task.spawn(function()

    TweenService:Create(Background, TweenInfo.new(2), {BackgroundTransparency = 0.4}):Play()
    task.wait(1.5)
    
  
    for i = 1, #FullText do
        Content.Text = string.sub(FullText, 1, i)
        task.wait(0.02)
    end
    
    while ScreenGui.Parent do
        SpawnParticle()
        task.wait(0.02) 
    end
end)

print("ZekHao's Fullscreen Love is Loaded.")
