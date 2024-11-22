local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local MenuPanel1 = Instance.new("Frame")
local MenuPanel2 = Instance.new("Frame")
local NextButton = Instance.new("TextButton")
local ToggleButton = Instance.new("TextButton")
local lplr = game.Players.LocalPlayer
local data = game.ReplicatedStorage:WaitForChild("Datas"):WaitForChild(lplr.UserId)

ScreenGui.Parent = game.CoreGui

Frame.Parent = ScreenGui
Frame.BackgroundTransparency = 1
Frame.Position = UDim2.new(0.5, -150, 0.4, -130)
Frame.Size = UDim2.new(0, 410, 0, 30)
Frame.Active = true
Frame.Draggable = true

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Text = "Hazme mover"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 14
TextLabel.TextStrokeTransparency = 1
TextLabel.TextScaled = true

MenuPanel1.Parent = TextLabel
MenuPanel1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MenuPanel1.Position = UDim2.new(0, 0, 1, 0)
MenuPanel1.Size = UDim2.new(0, 410, 0, 400)
MenuPanel1.Visible = false  -- Comienza oculto


MenuPanel2.Parent = TextLabel
MenuPanel2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MenuPanel2.Position = UDim2.new(0, 0, 1, 0)
MenuPanel2.Size = UDim2.new(0, 410, 0, 400)
MenuPanel2.Visible = false  -- Comienza oculto



local ScrollingFrame1 = Instance.new("ScrollingFrame")
ScrollingFrame1.Parent = MenuPanel1
ScrollingFrame1.Size = UDim2.new(1, 0, 1, 0)
ScrollingFrame1.CanvasSize = UDim2.new(0, 0, 2, 0)
ScrollingFrame1.ScrollBarThickness = 10
ScrollingFrame1.BackgroundTransparency = 1
ScrollingFrame1.ScrollingDirection = Enum.ScrollingDirection.Y 


local ScrollingFrame2 = Instance.new("ScrollingFrame")
ScrollingFrame2.Parent = MenuPanel2
ScrollingFrame2.Size = UDim2.new(1, 0, 1, 0)
ScrollingFrame2.CanvasSize = UDim2.new(0, 0, 2, 0)
ScrollingFrame2.ScrollBarThickness = 10
ScrollingFrame2.BackgroundTransparency = 1
ScrollingFrame2.ScrollingDirection = Enum.ScrollingDirection.Y 

NextButton.Parent = Frame
NextButton.BackgroundTransparency = 1
NextButton.Position = UDim2.new(1, -60, 0, 0)
NextButton.Size = UDim2.new(0, 30, 0, 30)
NextButton.Text = ">"
NextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
NextButton.TextSize = 20

ToggleButton.Parent = Frame
ToggleButton.BackgroundTransparency = 1
ToggleButton.Position = UDim2.new(1, -90, 0, 0)
ToggleButton.Size = UDim2.new(0, 30, 0, 30)
ToggleButton.Text = "+"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextSize = 20

--incio color\/
local UIStroke1 = Instance.new("UIStroke")
UIStroke1.Parent = MenuPanel1
UIStroke1.Thickness = 2
UIStroke1.Color = Color3.fromRGB(255, 0, 0) 

local UIStroke2 = Instance.new("UIStroke")
UIStroke2.Parent = MenuPanel2
UIStroke2.Thickness = 2
UIStroke2.Color = Color3.fromRGB(255, 0, 0) 

local textBox = Instance.new("TextBox", MenuPanel2)
textBox.Size = UDim2.new(0, 200, 0, 50)
textBox.Position = UDim2.new(0.5, -100, 0.5, -25)
textBox.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
textBox.BorderSizePixel = 6
textBox.BorderColor3 = Color3.fromRGB(0, 0, 255)
textBox.TextColor3 = Color3.fromRGB(0, 0, 0)
textBox.TextSize = 18
textBox.PlaceholderText = "Introduce un número (Ej. 100M, 1B)"
textBox.ClearTextOnFocus = true
Instance.new("UICorner", textBox).CornerRadius = UDim.new(0, 12)

local function saveToJSON(fileName, data)
    writefile(fileName, game:GetService("HttpService"):JSONEncode(data))
end

local function loadFromJSON(fileName)
    if isfile(fileName) then
        return game:GetService("HttpService"):JSONDecode(readfile(fileName))
    end
    return nil
end

local savedData = loadFromJSON("TObills")
local minStrength = savedData and savedData.minStrength
if minStrength then textBox.Text = tostring(minStrength) end

textBox.FocusLost:Connect(function()
    local input = textBox.Text
    local number, suffix = input:match("^(%d+)([MmBb])$")
    if number then
        minStrength = tonumber(number) * (suffix == "M" and 1e6 or 1e9)
        saveToJSON("TObills", {minStrength = minStrength})
    else
        minStrength = nil
    end
end)


task.spawn(function()
    local colors = {
        Color3.fromRGB(255, 0, 0), -- Rojo
        Color3.fromRGB(0, 255, 0), -- Verde
        Color3.fromRGB(0, 0, 255), -- Azul
        Color3.fromRGB(255, 255, 0) -- Amarillo
    }
    local index = 1

    while true do
        UIStroke1.Color = colors[index]
        UIStroke2.Color = colors[index]
        index = index + 1
        if index > #colors then
            index = 1
        end
        task.wait(1) 
    end
end)
--Fin color/\


--incio de color txt\/
local textProperties = {
    {text = "Farm", position = UDim2.new(-0.150, 0, 0, 0), color = Color3.fromRGB(255, 0, 0)},
    {text = "Ozaru", position = UDim2.new(-0.140, 0, 0.06, 0), color = Color3.fromRGB(0, 255, 0)},
    {text = "Mel", position = UDim2.new(-0.130, 0, 0.115, 0), color = Color3.fromRGB(0, 0, 255)},
    {text = "Reb", position = UDim2.new(-0.180, 0, 0.176, 0), color = Color3.fromRGB(255, 255, 0)},
    {text = "Puch", position = UDim2.new(-0.160, 0, 0.236, 0), color = Color3.fromRGB(0, 255, 255)},
    {text = "Players", position = UDim2.new(-0.110, 0, 0.296, 0), color = Color3.fromRGB(255, 0, 255)},
    {text = "Main", position = UDim2.new(-0.150, 0, 0.357, 0), color = Color3.fromRGB(255, 255, 255)},
}

for _, props in pairs(textProperties) do
    local TextLabel = Instance.new("TextLabel")
    TextLabel.Parent = ScrollingFrame1
    TextLabel.Size = UDim2.new(0, 200, 0, 36)
    TextLabel.Position = props.position
    TextLabel.BackgroundTransparency = 1
    TextLabel.TextColor3 = props.color
    TextLabel.Text = props.text
    TextLabel.TextScaled = true
end
 --Fin del color txt/\
 
 
local currentPanel = 1
local isMinimized = true  
NextButton.MouseButton1Click:Connect(function()
    if not isMinimized then
        if currentPanel == 1 then
            MenuPanel1.Visible = false
            currentPanel = 2
            MenuPanel2.Visible = true
        else
            MenuPanel2.Visible = false
            currentPanel = 1
            MenuPanel1.Visible = true
        end
    end
end)

ToggleButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    if isMinimized then
        MenuPanel1.Visible = false
        MenuPanel2.Visible = false
        ToggleButton.Text = "+"
    else
        if currentPanel == 1 then
            MenuPanel1.Visible = true
        else
            MenuPanel2.Visible = true
        end
        ToggleButton.Text = "×"
    end
end)

--Aki ya es del interrutor <:

local function SaveSwitchState(isActive, switchName)
    writefile(switchName.."_SwitchState.json", game:GetService("HttpService"):JSONEncode({SwitchOn = isActive, LastModified = os.time()}))
end

local function LoadSwitchState(switchName)
    return isfile(switchName.."_SwitchState.json") and game:GetService("HttpService"):JSONDecode(readfile(switchName.."_SwitchState.json")).SwitchOn or false
end
local function createSwitch(parent, position, switchName, initialState)
    local switchButton = Instance.new("TextButton")
    switchButton.Parent = parent
    switchButton.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    switchButton.BorderSizePixel = 0
    switchButton.Position = position
    switchButton.Size = UDim2.new(0, 84, 0, 30)
    switchButton.Text = ""
    Instance.new("UICorner", switchButton).CornerRadius = UDim.new(0.4, 0)

    local switchBall = Instance.new("Frame")
    switchBall.Parent = switchButton
    switchBall.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    switchBall.Size = UDim2.new(0, 30, 0, 30)
    switchBall.Position = UDim2.new(0, 5, 0.5, -15)
    switchBall.BorderSizePixel = 0
    Instance.new("UICorner", switchBall).CornerRadius = UDim.new(0.5, 0)

    local isActive = initialState

    switchBall.Position, switchBall.BackgroundColor3 = 
        isActive and UDim2.new(1, -35, 0.5, -15) or UDim2.new(0, 5, 0.5, -15), 
        isActive and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)

    switchButton.MouseButton1Click:Connect(function()
        isActive = not isActive
        switchBall.Position, switchBall.BackgroundColor3 = 
            isActive and UDim2.new(1, -35, 0.5, -15) or UDim2.new(0, 5, 0.5, -15), 
            isActive and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)        
        SaveSwitchState(isActive, switchName)
    end)

    return function() return isActive end
end

local getIsActive1 = createSwitch(ScrollingFrame1, UDim2.new(0.1, 50, 0, 1), "Switch1", LoadSwitchState("Switch1"))
local getIsActive2 = createSwitch(ScrollingFrame1, UDim2.new(0.1, 75, 0, 52), "Switch2", LoadSwitchState("Switch2"))
local getIsActive3 = createSwitch(ScrollingFrame1, UDim2.new(0.1, 45, 0.120, 0), "Switch3", LoadSwitchState("Switch3"))
local getIsActive4 = createSwitch(ScrollingFrame1, UDim2.new(0.1, 45, 0.240, 0), "Switch4", LoadSwitchState("Switch4"))
local getIsActive5 = createSwitch(ScrollingFrame1, UDim2.new(0.1, 25, 0.180, 0), "Switch5", LoadSwitchState("Switch5"))

task.spawn(function()
    pcall(function()
local player = game.Players.LocalPlayer
local data = game.ReplicatedStorage.Datas[player.UserId]
local events = game:GetService("ReplicatedStorage").Package.Events

local SelectedQuest, SelectedMob


local questDataOutsideID = {
    {range = {0, 200000}, options = {"Klirin", "Kid Nohag"}},
    {range = {200000, 850000}, options = {"Mapa", "Radish"}},
    {range = {850000, 4500000}, options = {"Super Vegetable", "Chilly"}},
    {range = {4500000, 5000000}, options = {"Perfect Atom", "SSJ2 Wukong"}},
    {range = {5000000, 30000000}, options = {"SSJB Wukong", "Kai-fist Master"}},
    {range = {30000000, 80000000}, options = {"SSJB Wukong", "Broccoli"}},
    {range = {80000000, math.huge}, options = {"SSJG Kakata", "Broccoli"}}
}

local questDataInsideID = {
    {range = {200000000, 1500000000}, options = {"Vegetable (GoD in-training)", "Wukong (Omen)"}},
    {range = {1500000000, 2500000000}, options = {"Vis (20%)", "Vegetable (LBSSJ4)"}},
    {range = {2500000000, 3500000000}, options = {"Wukong (LBSSJ4)", "Vegetable (LBSSJ4)"}},
    {range = {3500000000, math.huge}, options = {"Vekuta (SSJBUI)", "Wukong Rose"}}
}

local questData = game.PlaceId ~= 5151400895 and questDataOutsideID or questDataInsideID


local function assignQuest()
    local minimo = data.Strength.Value
    for _, quest in pairs(questData) do
        local minRange, maxRange = quest.range[1], quest.range[2]
        if minimo >= minRange and minimo < maxRange then
            for _, mob in pairs(quest.options) do
                local boss = game:GetService("Workspace").Living:FindFirstChild(mob)
                if boss and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 then
                    SelectedQuest, SelectedMob = mob, mob
                    return
                end
            end
        end
    end
end


local function startMission()
    if data.Quest.Value == ""  then
        pcall(function()
            local npc = game:GetService("Workspace").Others.NPCs:FindFirstChild(SelectedQuest)
            if npc and npc:FindFirstChild("HumanoidRootPart")  then
                player.Character.HumanoidRootPart.CFrame = npc.HumanoidRootPart.CFrame
                events.Qaction:InvokeServer(npc)
            end
        end)
    end
end


task.spawn(function()
    while true do
        game:GetService("RunService").Stepped:Wait()
        local success, errorMessage = pcall(function()
            assignQuest()
            if getIsActive1() and data.Quest.Value == "" then
                startMission()
            end
            local boss = game:GetService("Workspace").Living:FindFirstChild(SelectedMob)
            if boss and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health <= 0 then
                startMission() 
            end
        end)
        if not success then
            warn("Error en el script: " .. errorMessage)
        end
    end
end)
    

task.spawn(function()
    while true do
        pcall(function()
            if getIsActive1() then
                local questValue = game.ReplicatedStorage.Datas[player.UserId].Quest.Value
                local boss = game.Workspace.Living:FindFirstChild(questValue)            
                if boss and boss:FindFirstChild("Humanoid") then
                    lplr.Character.HumanoidRootPart.CFrame = boss.HumanoidRootPart.CFrame * CFrame.new(0, 0, 8)
                end
            end
        end)
       task.wait()
    end
end)


task.spawn(function()
    while true do
        pcall(function()
            if getIsActive2() then
                local currentGameHour = math.floor(game.Lighting.ClockTime)

                if currentGameHour == 20 or currentGameHour == 2 then
                    if data.Quest.Value == "" then
                        lplr.Character.HumanoidRootPart.CFrame = game.Workspace.Others.NPCs["Kid Nohag"].HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                        game.ReplicatedStorage.Package.Events.Qaction:InvokeServer(workspace.Others.NPCs["Kid Nohag"])
                    end
                elseif currentGameHour ~= 20 and currentGameHour ~= 2 then
                    if data.Quest.Value == "" then
                        lplr.Character.HumanoidRootPart.CFrame = game.Workspace.Others.NPCs["SSJG Kakata"].HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                        game.ReplicatedStorage.Package.Events.Qaction:InvokeServer(workspace.Others.NPCs["SSJG Kakata"])
                    end
                end
            end
        end)
        wait(0.1)
    end
end)

task.spawn(function()
    while true do
        pcall(function()
            if getIsActive2() then
                local questValue = game.ReplicatedStorage.Datas[lplr.UserId].Quest.Value
                local boss = game.Workspace.Living:FindFirstChild(questValue)
                if boss and boss:FindFirstChild("Humanoid") then
                    if boss.Humanoid.Health > 0 then
                        lplr.Character.HumanoidRootPart.CFrame = boss.HumanoidRootPart.CFrame * CFrame.new(0, 0, 8)
                    elseif boss.Humanoid.Health <= 0 then
                        lplr.Character.HumanoidRootPart.CFrame = CFrame.new(-35233.1953125, 18.168001174926758, -28942.220703125)
                        local halloweenBoss = game.Workspace.Living:FindFirstChild("Halloween Boss")
                        if halloweenBoss and halloweenBoss:FindFirstChild("Humanoid") then
                            lplr.Character.HumanoidRootPart.CFrame = halloweenBoss.HumanoidRootPart.CFrame * CFrame.new(0, 0, 8)
                        end
                    end
                end
            end
        end)
        task.wait()
    end
end)

task.spawn(function()
    while true do
        pcall(function()
            if game.PlaceId == 5151400895 and data.Strength.Value <= 200000000 then
                game:GetService("ReplicatedStorage").Package.Events.TP:InvokeServer("Earth")
                task.wait(4)
            end
        end)
        wait(1)
    end
end)


task.spawn(function()
    while true do
        if minStrength and game.PlaceId ~= 5151400895 and data.Strength.Value >= minStrength then
            game:GetService("ReplicatedStorage").Package.Events.TP:InvokeServer("Vills Planet")
            task.wait(8)
        end
        wait(1)
    end
end)

local moves = { "Super Dragon Fist", "God Slicer", "Spirit Barrage", "Mach Kick", "Wolf Fang Fist", 
                "High Power Rush", "Meteor Strike", "Meteor Charge", "Spirit Breaking Cannon", 
                "Vital Strike", "Flash Kick", "Vanish Strike", "Uppercut", "Sledgehammer", "Rock Impact" }

local Iplr = game.Players.LocalPlayer
local data = game.ReplicatedStorage.Datas[Iplr.UserId]
local dat = (game.PlaceId == 5151400895) and game.Workspace.Living:FindFirstChild(Iplr.Name) or game.Players.LocalPlayer

task.spawn(function()
    while true do
        pcall(function()
            if data.Quest.Value ~= "" and  getIsActive3()  then
                local boss = game.Workspace.Living:FindFirstChild(data.Quest.Value)
                if boss and boss:FindFirstChild("Humanoid") and boss.Humanoid.Health > 0 then
                    local distance = (boss.HumanoidRootPart.Position - Iplr.Character.HumanoidRootPart.Position).Magnitude
                    if distance <= 10 then
                        if dat:FindFirstChild("Status") then
                            for _, move in ipairs(moves) do
                                if not dat.Status:FindFirstChild(move) then
                                    task.spawn(function()
                                        game:GetService("ReplicatedStorage").Package.Events.mel:InvokeServer(move, "Blacknwhite27")
                                    end)
                                end
                            end
                        end
                    end
                end
            end
        end)
        wait(1)
    end
end)

task.spawn(function()
    while true do
        pcall(function()
            if data.Quest.Value ~= "" and  getIsActive4() then
                game:GetService("ReplicatedStorage").Package.Events.p:FireServer("Blacknwhite27", 1)
                game:GetService("ReplicatedStorage").Package.Events.p:FireServer("Blacknwhite27", 2)
                    game:GetService("ReplicatedStorage").Package.Events.cha:InvokeServer("Blacknwhite27")            
            end
        end)
        task.wait()
    end
end)

task.spawn(function()
    while true do
        pcall(function()
            if getIsActive5() then
                game:GetService("ReplicatedStorage").Package.Events.reb:InvokeServer()
            end
        end)
        wait(.5)
    end
end)


spawn(function()
    local originalPosition = lplr.Character.HumanoidRootPart.Position

    local bodyPosition = Instance.new("BodyPosition")
    bodyPosition.MaxForce = Vector3.new(400000, 400000, 400000)
    bodyPosition.D = 1000
    bodyPosition.P = 10000
    bodyPosition.Position = originalPosition + Vector3.new(0, 5, 0)  -- Eleva un poco
    bodyPosition.Parent = lplr.Character.HumanoidRootPart

    local Event = game:GetService("ReplicatedStorage").Package.Events.Start
    Event:InvokeServer()
    wait()

    Event:InvokeServer()
    wait()

    lplr.PlayerGui.Main.bruh.Disabled = true
    lplr.PlayerGui.Main.bruh.Disabled = false
    task.wait()

    Event:InvokeServer()

    wait()

    bodyPosition:Destroy()

    game.Workspace.Gravity = 196.2
end)
            
--fin de todo \/
    end)    
    wait(1)
end)



