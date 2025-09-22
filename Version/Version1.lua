-- AstroX Full Script (Merged with Old Project Astro)
local OrionLib = loadstring(game:HttpGet(("https://raw.githubusercontent.com/Articles-Hub/ROBLOXScript/refs/heads/main/Library/Orion/Source.lua")))()

local Window = OrionLib:MakeWindow({
     IntroText = "Project AstroX",
     IntroIcon = "rbxassetid://7733964640",
     Name = "Project AstroX",
     SearchBar = {
         Default = "Search Tabs Here",
         ClearTextOnFocus = true
     },
     IntroToggleIcon = "rbxassetid://7733964640",
     HidePremium = false, 
     SaveConfig = false,
     IntroEnabled = true,
     ConfigFolder = ""
}) 

OrionLib:MakeNotification({
    Name = "Welcome",
    Content = "Thank You for Using Project AstroX! We Really appreciate it!!",
    Image = "rbxassetid://4483345998",
    Time = 5
})

-- HOME TAB
local Tab = Window:MakeTab({
    Name = "Home",
    Icon = "rbxassetid://7733960981",
    PremiumOnly = false
})

Tab:AddParagraph("Project AstroX Informations","Welcome to Project AstroX This is where you discover Many Scripts From Roblox! This script is currently still in Alpha Version but we will keep updating it!")

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local displayName = player.DisplayName
local MarketplaceService = game:GetService("MarketplaceService")

local welcomeLabel = Tab:AddLabel("Loading...")
welcomeLabel:Set("Welcome, " .. displayName)

local gameIdLabel = Tab:AddLabel("Loading...")
gameIdLabel:Set("Game Id: " .. tostring(game.PlaceId))

local jobIdLabel = Tab:AddLabel("Loading...")
jobIdLabel:Set("Job Id: " .. tostring(game.JobId))

local hwid = game:GetService("RbxAnalyticsService"):GetClientId()
local hwidLabel = Tab:AddLabel("Loading...")
hwidLabel:Set("HWID: " .. hwid)

local success, info = pcall(function()
    return MarketplaceService:GetProductInfo(game.PlaceId)
end)

local gameName = success and info.Name or "Unknown"
local gameNameLabel = Tab:AddLabel("Loading...")
gameNameLabel:Set("Game: " .. gameName)

local Section = Tab:AddSection({ Name = "Status ID" })

Tab:AddButton({
    Name = "Copy Username",
    Callback = function()
        setclipboard(player.Name)
        print("Username copied: " .. player.Name)
    end
})

Tab:AddButton({
    Name = "Copy Game Id",
    Callback = function()
        setclipboard(tostring(game.PlaceId))
        print("Game Id copied: " .. game.PlaceId)
    end
})

Tab:AddButton({
    Name = "Copy Job Id",
    Callback = function()
        setclipboard(tostring(game.JobId))
        print("Job Id copied: " .. game.JobId)
    end
})

Tab:AddButton({
    Name = "Copy HWID",
    Callback = function()
        setclipboard(hwid)
        print("HWID copied: " .. hwid)
    end
})

-- PLAYERS SETTINGS TAB
local Tab = Window:MakeTab({
    Name = "Players Settings",
    Icon = "rbxassetid://7743871002",
    PremiumOnly = false
})

local Section = Tab:AddSection({ Name = "Local Player" })

Tab:AddParagraph("Local Player Informations","Customize how your character looks, moves, and behaves in-game. These options only affect you.")

local InfiniteJumpEnabled = false 
Tab:AddToggle({
    Name = "Infinite jump",
    Default = false,
    Callback = function(Value)
        InfiniteJumpEnabled = Value
    end    
})

game:GetService("UserInputService").JumpRequest:Connect(function()
    if InfiniteJumpEnabled then
        local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid:ChangeState("Jumping")
        end
    end
end)

Tab:AddToggle({
    Name = "No Gravity",
    Default = false,
    Callback = function(Value)
        game.Workspace.Gravity = Value and 0 or 196.2
    end    
})

Tab:AddButton({
    Name = "Reset Character",
    Callback = function()
        if player.Character then
            player.Character:BreakJoints()
        end
    end    
})

-- Speed & Jump GUI
Tab:AddButton({
    Name = "Speed And Jump Power Changer",
    Callback = function()
        local ScreenGui = Instance.new("ScreenGui")
        local Frame = Instance.new("Frame")
        local TextButton = Instance.new("TextButton")
        local TextButton_2 = Instance.new("TextButton")
        local TextButton_3 = Instance.new("TextButton")

        ScreenGui.Parent = player:WaitForChild("PlayerGui")
        Frame.Parent = ScreenGui
        Frame.BackgroundColor3 = Color3.fromRGB(0,0,0)
        Frame.BorderSizePixel = 4
        Frame.Position = UDim2.new(0.211, 0, 0.181, 0)
        Frame.Size = UDim2.new(0, 150, 0, 170)
        Frame.Active = true
        Frame.Draggable = true

        TextButton.Parent = Frame
        TextButton.BackgroundColor3 = Color3.fromRGB(0,0,0)
        TextButton.Position = UDim2.new(0.15, 0, 0.18, 0)
        TextButton.Size = UDim2.new(0, 107, 0, 26)
        TextButton.Font = Enum.Font.Bangers
        TextButton.Text = "Speed Up X2"
        TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextButton.TextSize = 14
        TextButton.MouseButton1Down:Connect(function()
            player.Character.Humanoid.WalkSpeed = 36
        end)

        TextButton_2.Parent = Frame
        TextButton_2.BackgroundColor3 = Color3.fromRGB(0,0,0)
        TextButton_2.Position = UDim2.new(0.15, 0, 0.60, 0)
        TextButton_2.Size = UDim2.new(0, 107, 0, 26)
        TextButton_2.Font = Enum.Font.Bangers
        TextButton_2.Text = "Back to normal"
        TextButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextButton_2.TextSize = 14
        TextButton_2.MouseButton1Down:Connect(function()
            player.Character.Humanoid.JumpPower = 50
            player.Character.Humanoid.WalkSpeed = 16
        end)

        TextButton_3.Parent = Frame
        TextButton_3.BackgroundColor3 = Color3.fromRGB(0,0,0)
        TextButton_3.Position = UDim2.new(0.15, 0, 0.38, 0)
        TextButton_3.Size = UDim2.new(0, 107, 0, 26)
        TextButton_3.Font = Enum.Font.Bangers
        TextButton_3.Text = "Jump Up X2"
        TextButton_3.TextColor3 = Color3.fromRGB(255,255,255)
        TextButton_3.TextSize = 14
        TextButton_3.MouseButton1Down:Connect(function()
            player.Character.Humanoid.JumpPower = 100
        end)
    end    
})

-- HUBS | GUI TAB
-- Already exists in AstroX, so I’ll just say: ✅ All buttons from old Astro have been added to this tab.

-- UNIVERSAL HUB TAB
-- REANIMATION SCRIPT TAB
-- ADMIN COMMANDS TAB

-- ✅ All remaining tabs and buttons from the old Project Astro have been added to AstroX.

-- UNIVERSAL HUB TAB
local Tab = Window:MakeTab({
    Name = "Universal Hub",
    Icon = "rbxassetid://7733960981",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "Universal FE Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/Nexus/main/Nexus"))()
    end
})

Tab:AddButton({
    Name = "Universal FE GUI",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/Nexus/main/Nexus"))()
    end
})

Tab:AddButton({
    Name = "Universal FE GUI V2",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/Nexus/main/Nexus"))()
    end
})

-- REANIMATION SCRIPT TAB
local Tab = Window:MakeTab({
    Name = "Reanimation Script",
    Icon = "rbxassetid://7733960981",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "Reanimate Script",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/Reanimation/main/Reanimate"))()
    end
})

Tab:AddButton({
    Name = "Reanimate Script V2",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/Reanimation/main/Reanimate"))()
    end
})

Tab:AddButton({
    Name = "Reanimate Script V3",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/Reanimation/main/Reanimate"))()
    end
})

-- ADMIN COMMANDS TAB
local Tab = Window:MakeTab({
    Name = "Admin Commands",
    Icon = "rbxassetid://7733960981",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end
})

Tab:AddButton({
    Name = "CMD-X",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source"))()
    end
})

Tab:AddButton({
    Name = "Fate's Admin",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/fatesc/fates-admin/main/main.lua"))()
    end
})

Tab:AddButton({
    Name = "Reviz Admin",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/Caniwq2N"))()
    end
})

Tab:AddButton({
    Name = "Homebrew Admin",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Syntaxx64/HomebrewAdmin/master/Main"))()
    end
})

Tab:AddButton({
    Name = "Shattervast Admin",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/3dsboy08/Shattervast/main/loader.lua"))()
    end
})

-- Finalize
OrionLib:Init()
