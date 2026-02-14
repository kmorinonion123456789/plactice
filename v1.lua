-- 変数設定
local player = game.Players.LocalPlayer
local replicatedStorage = game:GetService("ReplicatedStorage")
local sellRemote = replicatedStorage.Remotes:WaitForChild("SellEntity")

-- GUIの作成
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AutoSellGui"
screenGui.Parent = player:WaitForChild("PlayerGui")

local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 220, 0, 50)
toggleButton.Position = UDim2.new(0.5, -110, 0.8, 0)
toggleButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
toggleButton.Text = "Batch Sell: OFF"
toggleButton.TextColor3 = Color3.new(1, 1, 1)
toggleButton.Font = Enum.Font.SourceSansBold
toggleButton.TextSize = 22
toggleButton.Parent = screenGui

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 8)
uiCorner.Parent = toggleButton

-- メインロジック
local isToggled = false

toggleButton.MouseButton1Click:Connect(function()
    isToggled = not isToggled
    toggleButton.Text = isToggled and "Batch Sell: ON" or "Batch Sell: OFF"
    toggleButton.BackgroundColor3 = isToggled and Color3.fromRGB(50, 200, 50) or Color3.fromRGB(200, 50, 50)
end)

-- 0.3秒おきに1〜10を一気に実行するループ
task.spawn(function()
    while true do
        if isToggled then
            -- スロット1から10までを「一気に」送信
            for i = 1, 10 do
                -- 送信自体には待機(wait)を挟まない
                sellRemote:FireServer(i)
            end
            
            -- 全スロット送信した後に0.3秒待機
            task.wait(0.3)
        else
            -- OFFの時は無駄な負荷を避けるために少し待つ
            task.wait(0.1)
        end
    end
end)

