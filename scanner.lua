-- NathanBloxx Universal Scanner & Executor
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local ScriptBox = Instance.new("TextBox")
local ExecButton = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BorderColor3 = Color3.fromRGB(0, 255, 255)
MainFrame.Size = UDim2.new(0, 350, 0, 250)
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.Active = true
MainFrame.Draggable = true -- Perfect for mobile touchscreens

-- UI Elements
Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Text = "NATHANBLOXX SCANNER v2"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundColor3 = Color3.fromRGB(35, 35, 35)

ScriptBox.Parent = MainFrame
ScriptBox.Position = UDim2.new(0.05, 0, 0.2, 0)
ScriptBox.Size = UDim2.new(0.9, 0, 0.5, 0)
ScriptBox.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
ScriptBox.TextColor3 = Color3.fromRGB(0, 255, 0)
ScriptBox.Text = "-- Script Loaded"

-- [INJECTION DETECTION LOGIC]
local function scanGame()
    local name = string.lower(game.Name)
    local info = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
    local desc = string.lower(info.Description)
    
    local keywords = {"infected", "free robux", "admin hack", "generator", "get admin"}
    for _, word in pairs(keywords) do
        if string.find(name, word) or string.find(desc, word) then
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "⚠️ INFECTED",
                Text = "The Game is absolutely infected",
                Duration = 15
            })
            return
        end
    end
end

-- Run scan automatically on load
scanGame()

-- Execute Button
ExecButton.Parent = MainFrame
ExecButton.Position = UDim2.new(0.05, 0, 0.75, 0)
ExecButton.Size = UDim2.new(0.9, 0, 0, 40)
ExecButton.Text = "EXECUTE"
ExecButton.MouseButton1Click:Connect(function()
    loadstring(ScriptBox.Text)()
end)
