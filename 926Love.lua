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
我们相隔五千多公里的异国恋能到今天也不容易呀
这可是五千多公里 
我好开心能和你在一起这么久 😁
过程中我们遇到了好多麻烦但你依旧没有离开我  我特别开心😙
我永远爱着你 ❤️

祝姐姐生日快乐呀 🎂
：爱你的YHao 
I Love You...
Five thousand kilometers, a world away
Our love's a code I run every day
So happy we made it through everything
My forever love, I want to sing
Happy birthday to you, my dear
(Happy birthday🎂, my love❤️)]]

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
