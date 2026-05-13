-- [[ 最坚强的战场 - 手机纯触屏 UI 侧滑 Macro ]] --
local Players = game:GetService("Players")
local GuiService = game:GetService("GuiService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local RunService = game:GetService("RunService")

local lp = Players.LocalPlayer
local pGui = lp:WaitForChild("PlayerGui")

-- 清理旧按钮
if pGui:FindFirstChild("TSB_TouchMacro_UI") then
    pGui.TSB_TouchMacro_UI:Destroy()
end

-- [[ 创建快捷宏悬浮按键 ]] --
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TSB_TouchMacro_UI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = pGui

local MacroBtn = Instance.new("TextButton")
MacroBtn.Name = "MacroBtn"
MacroBtn.Size = UDim2.new(0, 80, 0, 80)
MacroBtn.Position = UDim2.new(0.85, 0, 0.5, 0)
MacroBtn.BackgroundColor3 = Color3.fromRGB(255, 69, 0) -- 亮橙色
MacroBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MacroBtn.Text = "一键侧滑"
MacroBtn.TextSize = 16
MacroBtn.Font = Enum.Font.SourceSansBold
MacroBtn.Draggable = true -- 允许用手指拖动位置
MacroBtn.Active = true

local UICorner = Instance.new("Corner")
UICorner.CornerRadius = UDim.new(0.5, 0)
UICorner.Parent = MacroBtn

MacroBtn.Parent = ScreenGui

-- [[ 核心触屏模拟逻辑 ]] --
local isRunning = false

-- 虚拟屏幕点击函数：输入屏幕绝对坐标进行点击
local function touchAt(x, y, state)
    -- state: 0 = 按下, 1 = 移动, 2 = 松开
    VirtualInputManager:SendTouchEvent(0, state, x, y, game)
end

local function doTouchMacro()
    if isRunning then return end
    isRunning = true
    MacroBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)

    -- 1. 自动获取 Roblox 官方手机摇杆、跳跃键和游戏侧滑键的动态屏幕位置
    local touchGui = pGui:FindFirstChild("TouchGui")
    local touchControlFrame = touchGui and touchGui:FindFirstChild("TouchControlFrame")
    
    -- 摇杆位置 (Roblox底层一般叫 DynamicJoystick 或 JoystickContainer)
    local joystick = touchControlFrame and (touchControlFrame:FindFirstChild("DynamicJoystick") or touchControlFrame:FindFirstChild("JoystickContainer"))
    -- 跳跃按钮位置
    local jumpButton = touchControlFrame and touchControlFrame:FindFirstChild("JumpButton")
    
    -- 最坚强的战场自定义的 2D 侧滑/技能 UI 按钮
    local dashButton = nil
    for _, v in pairs(pGui:GetDescendants()) do
        if v:IsA("GuiObject") and v.Visible and (v.Name:lower():match("dash") or v.Name:lower():match("dashbutton") or v.Name:lower():match("q")) then
            dashButton = v
            break
        end
    end

    -- [[ 极端保底机制：如果游戏隐藏了UI节点名，使用标准手机屏幕比例坐标 ]] --
    local cam = workspace.CurrentCamera
    local screenSize = cam.ViewportSize
    
    -- 估算屏幕坐标 (左侧摇杆往左拉、右侧跳跃、右侧偏上侧滑)
    local joyX, joyY = screenSize.X * 0.15 - 40, screenSize.Y * 0.75
    local jumpX, jumpY = screenSize.X * 0.88, screenSize.Y * 0.80
    local qX, qY = screenSize.X * 0.78, screenSize.Y * 0.65

    -- 如果成功抓取到了游戏真实UI，则用极其精准的绝对坐标覆盖估算值
    if joystick then joyX, joyY = joystick.AbsolutePosition.X + (joystick.AbsoluteSize.X/2) - 40, joystick.AbsolutePosition.Y + (joystick.AbsoluteSize.Y/2) end
    if jumpButton then jumpX, jumpY = jumpButton.AbsolutePosition.X + (jumpButton.AbsoluteSize.X/2), jumpButton.AbsolutePosition.Y + (jumpButton.AbsoluteSize.Y/2) end
    if dashButton then qX, qY = dashButton.AbsolutePosition.X + (dashButton.AbsoluteSize.X/2), dashButton.AbsolutePosition.Y + (dashButton.AbsoluteSize.Y/2) end

    -- [[ 开始手机触屏一键三连操作 ]] --
    
    -- 动作 1：按住拉杆往左滑 (在摇杆中心偏左的位置按下并保持)
    touchAt(joyX, joyY, 0) 
    task.wait(0.02) -- 严格延迟 20 毫秒

    -- 动作 2：戳一下跳跃按钮
    touchAt(jumpX, jumpY, 0)
    task.wait(0.01)
    touchAt(jumpX, jumpY, 2) -- 松开跳

    -- 动作 3：瞬间戳一下侧滑 UI 按钮
    touchAt(qX, qY, 0)
    task.wait(0.02)
    touchAt(qX, qY, 2) -- 松开侧滑

    -- 动作 4：松开左侧摇杆
    touchAt(joyX, joyY, 2)

    -- 恢复宏按钮
    MacroBtn.BackgroundColor3 = Color3.fromRGB(255, 69, 0)
    isRunning = false
end

MacroBtn.MouseButton1Click:Connect(doTouchMacro)
print("【TSB 纯触屏完美侧滑宏】加载成功！请点击橙色按钮测试。")
