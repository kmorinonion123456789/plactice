local player = game:GetService("Players").LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

-- 重複防止：古いメニューがあれば消す
if PlayerGui:FindFirstChild("ShiunSuperMenu") then
    PlayerGui.ShiunSuperMenu:Destroy()
end

-- 1. スクリーン（外枠）の作成
local sg = Instance.new("ScreenGui")
sg.Name = "ShiunSuperMenu"
sg.ResetOnSpawn = false -- キャラが死んでもボタンを消さない
sg.Parent = PlayerGui

-- 2. メインパネル
local frame = Instance.new("Frame")
frame.Name = "MainFrame"
frame.Size = UDim2.new(0, 200, 0, 150)
frame.Position = UDim2.new(0.5, -100, 0.4, 0) -- 画面中央付近に表示
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40) -- 濃いグレー
frame.BorderSizePixel = 2
frame.Active = true
frame.Draggable = true -- ドラッグで動かせる
frame.Parent = sg

-- タイトル
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "shiun4545 VIP"
title.TextColor3 = Color3.new(1, 1, 0) -- 黄色
title.BackgroundTransparency = 1
title.Parent = frame

-- 3. スピード変更ボタン
local speedBtn = Instance.new("TextButton")
speedBtn.Size = UDim2.new(0.8, 0, 0, 40)
speedBtn.Position = UDim2.new(0.1, 0, 0.3, 0)
speedBtn.Text = "Speed: 100"
speedBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
speedBtn.TextColor3 = Color3.new(1, 1, 1)
speedBtn.Parent = frame

speedBtn.MouseButton1Click:Connect(function()
    local char = player.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.WalkSpeed = 100
    end
end)

-- 4. ジャンプ変更ボタン
local jumpBtn = Instance.new("TextButton")
jumpBtn.Size = UDim2.new(0.8, 0, 0, 40)
jumpBtn.Position = UDim2.new(0.1, 0, 0.65, 0)
jumpBtn.Text = "Jump: 150"
jumpBtn.BackgroundColor3 = Color3.fromRGB(255, 80, 0)
jumpBtn.TextColor3 = Color3.new(1, 1, 1)
jumpBtn.Parent = frame

jumpBtn.MouseButton1Click:Connect(function()
    local char = player.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.JumpPower = 150
        char.Humanoid.UseJumpPower = true
    end
end)

print("メニューを表示したよ！")
