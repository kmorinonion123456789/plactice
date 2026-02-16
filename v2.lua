-- [[ 1. 初期設定（プレイヤー情報の取得） ]]
local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
-- [[ 2. UIの作成（土台） ]]
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ShiunMenu"
screenGui.Parent = CoreGui -- ExecutorではCoreGuiに入れるのが基本
-- メインフレーム
local frame = Instance.new("Frame")
frame.Name = "MainFrame"
frame.Size = UDim2.new(0, 220, 0, 280)
frame.Position = UDim2.new(0.5, -110, 0.5, -140)
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true -- マウスで自由に動かせる
frame.Parent = screenGui
-- 角を丸くする
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame
-- タイトル
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 45)
title.Text = "shiun4545's GUI"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.TextSize = 20
title.Font = Enum.Font.GothamBold
title.Parent = frame
-- スピード変更ボタン
local speedBtn = Instance.new("TextButton")
speedBtn.Size = UDim2.new(0.8, 0, 0, 45)
speedBtn.Position = UDim2.new(0.1, 0, 0.25, 0)
speedBtn.Text = "Speed Boost (100)"
speedBtn.BackgroundColor3 = Color3.fromRGB(60, 100, 200)
speedBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
speedBtn.Font = Enum.Font.Gotham
speedBtn.TextSize = 16
speedBtn.Parent = frame
Instance.new("UICorner", speedBtn).CornerRadius = UDim.new(0, 8)
-- ボタンの動作
speedBtn.MouseButton1Click:Connect(function()
    local char = lp.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.WalkSpeed = 100
        speedBtn.Text = "Done!"
        wait(1)
        speedBtn.Text = "Speed Boost (50)"
    end
end)
-- 閉じるボタン
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0.8, 0, 0, 45)
closeBtn.Position = UDim2.new(0.1, 0, 0.7, 0)
closeBtn.Text = "Close Menu"
closeBtn.BackgroundColor3 = Color3.fromRGB(150, 50, 50)
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Font = Enum.Font.Gotham
closeBtn.TextSize = 16
closeBtn.Parent = frame
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 8)

closeBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy() -- GUIを消す
end)
