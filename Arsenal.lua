local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()
local function CreateInstance(cls,props)
    local inst = Instance.new(cls)
    for i,v in pairs(props) do
        inst[i] = v
    end
    return inst
    end
     
    local players = game:GetService"Players"
    local Player = game:GetService("Players").LocalPlayer
    local Camera = game:GetService("Workspace").CurrentCamera
    local mouse = Player:GetMouse()
    local RS = game:GetService("RunService")
    local Center = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y + 150 / 2)
    local teamCheck = true
    local enabled = false
    local UIS = game:GetService("UserInputService")
    local localp = players.LocalPlayer
    local uis = game:GetService"UserInputService"
    
    local cheats = {
    
        esp = true;
        esptarget = "Enemy";
        bomb = true;
        chams = true;
        chamstarget = "Enemy";
        weapons = true;
        fovchanger = true;
    
    esp_enemycolor = Color3.fromRGB(220,80,40);
    esp_teamcolor = Color3.fromRGB(40, 220, 220);
    esp_bombcolor = Color3.fromRGB(220,60,210);
    esp_bombcarriercolor = Color3.fromRGB(220,210,40);
    esp_weaponcolor = Color3.fromRGB(200,200,200);
    esp_itemtextcolor = Color3.fromRGB(220,60,210);
    
    weptype = "Pistols";
    }
    
    local espTargets = {"Enemy", "Both"}
    
    local espfolder = Instance.new("Folder", game:GetService"CoreGui")
    espfolder.Name = "espstuff"

local UI = Material.Load({
    Title = "Allinity Hub",
    Style = 1,
    SizeX = 400,
    SizeY = 300,
    Theme = "Jester"
})

UI.Banner({
	Text = "Welcome! Thanks for using Allinity Hub! Don't forget to vouch or like my post ;)"
})

local Page = UI.New({
    Title = "Main"
})

Page.Button({
    Text = "Silent Aim (T For TeamCheck = For Toggle)",
    Callback = function()

        local function getClosestPlayerToCursor() [nonamecall]
                local closestPlayer = nil
                local shortestDistance = math.huge
            
            for i, v in pairs(game:GetService("Players"):GetPlayers()) do
            if v.Name ~= Player.Name then
            if v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Head") and teamCheck and v.Team ~= Player.Team then
                local pos = Camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
                local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).magnitude
            
                if magnitude < shortestDistance then
                    closestPlayer = v
                    shortestDistance = magnitude
                end
            elseif v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Head") and not teamCheck then
                local pos = Camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
                local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).magnitude
            
                if magnitude < shortestDistance then
                    closestPlayer = v
                    shortestDistance = magnitude
                end
            end
            end
            end
            
            return closestPlayer or Player
            end
            
            game:GetService("UserInputService").InputBegan:Connect(function(input, onGui)
            if not onGui and input.KeyCode == Enum.KeyCode.T then
            teamCheck = not teamCheck
            end
            end)

            game:GetService("UserInputService").InputBegan:Connect(function(input, onGui)
            if not onGui and input.KeyCode == Enum.KeyCode.Equals then
            enabled = not enabled
            end
            end)
            
            local mt = getrawmetatable(game)
            local oldNamecall = mt.__namecall
            if setreadonly then setreadonly(mt, false) else make_writeable(mt, true) end
            local namecallMethod = getnamecallmethod or get_namecall_method
            local newClose = newcclosure or function(f) return f end
            
            mt.__namecall = newClose(function(...) [nonamecall]
            local method = namecallMethod()
            local args = {...}
            
            if tostring(method) == "FireServer" and tostring(args[1]) == "HitPart" then
            args[2] = getClosestPlayerToCursor().Character.HumanoidRootPart
            args[3] = getClosestPlayerToCursor().Character.HumanoidRootPart.Position
            
            return oldNamecall(unpack(args))
            end
            
            return oldNamecall(...)
            end)
            
            if setreadonly then setreadonly(mt, true) else make_writeable(mt, false)
            end
        end,
Menu = {
Information = function(self)
   UI.Banner({
       Text = "Does what the name says"            
   })
end
}
})

Page.Button({
    Text = "ESP",
    Callback = function()
        
        local function addEsp(object, parent, size, identifier)
            local billboard = Instance.new("BillboardGui", parent)
            billboard.Size = size
            if identifier == "object" then
                billboard.Adornee = object
            end
            billboard.AlwaysOnTop = true
            billboard.Name = object.Name
         
            local lines = Instance.new("Frame", billboard)
            lines.Name = "lines"
            lines.Size = UDim2.new(1,-2,1,-2)
            lines.Position = UDim2.new(0,1,0,1)
            lines.BackgroundTransparency = 1
         
            local outlines = Instance.new("Folder", lines)
            outlines.Name = "outlines"
            local inlines = Instance.new("Folder", lines)
            inlines.Name = "inlines"
         
            local outline1 = Instance.new("Frame", outlines)
            outline1.Name = "left"
            outline1.BorderSizePixel = 0
            outline1.BackgroundColor3 = Color3.new(0,0,0)
            outline1.Size = UDim2.new(0,-1,1,0)
         
            local outline2 = Instance.new("Frame", outlines)
            outline2.Name = "right"
            outline2.BorderSizePixel = 0
            outline2.BackgroundColor3 = Color3.new(0,0,0)
            outline2.Position = UDim2.new(1,0,0,0)
            outline2.Size = UDim2.new(0,1,1,0)
         
            local outline3 = Instance.new("Frame", outlines)
            outline3.Name = "up"
            outline3.BorderSizePixel = 0
            outline3.BackgroundColor3 = Color3.new(0,0,0)
            outline3.Size = UDim2.new(1,0,0,-1)
         
            local outline4 = Instance.new("Frame", outlines)
            outline4.Name = "down"
            outline4.BorderSizePixel = 0
            outline4.BackgroundColor3 = Color3.new(0,0,0)
            outline4.Position = UDim2.new(0,0,1,0)
            outline4.Size = UDim2.new(1,0,0,1)
         
            local inline1 = Instance.new("Frame", inlines)
            inline1.Name = "left"
            inline1.BorderSizePixel = 0
            inline1.Size = UDim2.new(0,1,1,0)
         
            local inline2 = Instance.new("Frame", inlines)
            inline2.Name = "right"
            inline2.BorderSizePixel = 0
            inline2.Position = UDim2.new(1,0,0,0)
            inline2.Size = UDim2.new(0,-1,1,0)
         
            local inline3 = Instance.new("Frame", inlines)
            inline3.Name = "up"
            inline3.BorderSizePixel = 0
            inline3.Size = UDim2.new(1,0,0,1)
         
            local inline4 = Instance.new("Frame", inlines)
            inline4.Name = "down"
            inline4.BorderSizePixel = 0
            inline4.Position = UDim2.new(0,0,1,0)
            inline4.Size = UDim2.new(1,0,0,-1)
         
            if identifier == "object" then
                local label = Instance.new("TextLabel", billboard)
                label.Name = "label"
                label.Size = UDim2.new(1,0,1,0)
                label.BackgroundTransparency = 1
                label.TextStrokeTransparency = 0
                label.TextColor3 = cheats.esp_itemtextcolor
                label.Text = object.Name
                label.Font = Enum.Font.Code
                label.TextSize = 16
                object.AncestryChanged:connect(function()
                    if object.Name ~= "C4" then
                        if object.Parent ~= workspace.Debris then
                            billboard:Destroy()
                        end
                    end
                end)
            end
         
            if identifier == "player" then
                spawn(function()
                    while object do
                        wait()
                        if cheats.esp then
                            if object.Character and object.Character:FindFirstChild"LowerTorso" then
                                local head = object.Character:FindFirstChild"Head"
                                local lowerpart = object.Character:FindFirstChild"LeftFoot"
                                local leftarm = object.Character:FindFirstChild"LeftUpperArm"
                                local rightarm = object.Character:FindFirstChild"RightUpperArm"
                                if (head and lowerpart) and (leftarm and rightarm) then
                                    billboard.Size = UDim2.new(((leftarm.Position+Vector3.new(0,0.5,0))-(rightarm.Position-Vector3.new(0,0.5,0))).magnitude,0,((head.Position+Vector3.new(0,1,0))-(lowerpart.Position)).magnitude,0)
                                end
                                local color = cheats.esp_enemycolor
                                if object.Team ~= localp.Team then
                                    color = cheats.esp_enemycolor
                                    billboard.Adornee = object.Character.LowerTorso
                                else
                                    if cheats.esptarget == "Both" then
                                        color = cheats.esp_teamcolor
                                        billboard.Adornee = object.Character.LowerTorso
                                    else
                                        billboard.Adornee = nil
                                    end
                                end
                                if object.Name == workspace.Status.HasBomb.Value then
                                    color = cheats.esp_bombcarriercolor
                                end
                                inline1.BackgroundColor3 = color
                                inline2.BackgroundColor3 = color
                                inline3.BackgroundColor3 = color
                                inline4.BackgroundColor3 = color
                            end
                        else
                            billboard.Adornee = nil
                        end
                    end
                end)
            end
        end
        
        players.PlayerAdded:connect(function(player)
            local size = UDim2.new(4,0,5.6,0)
            addEsp(player, espfolder, size, "player")
        end)
         
        for _,player in pairs(players:GetChildren()) do
            if player.Name ~= localp.Name and not espfolder:FindFirstChild(player.Name) then
                local size = UDim2.new(4,0,5.6,0)
                addEsp(player, espfolder, size, "player")
            end
        end
         
        players.PlayerRemoving:connect(function(player)
            if espfolder:FindFirstChild(player.Name) then
                espfolder[player.Name]:Destroy()
            end
        end)
         
        local function objectInWorkspace(child)
            if cheats.weapons then
                local primaries = {semis, heavies, rifles}
                for _,v in pairs(primaries) do
                    for _,w in pairs(v) do
                        if child.Name == w then
                            local size = UDim2.new(1.4,0,1.4,0)
                            addEsp(child, bombfolder, size, "object")
                        end
                    end
                end
                for _,v in pairs(pistols) do
                    if child.Name == v then
                        local size = UDim2.new(1.4,0,1.4,0)
                        addEsp(child, bombfolder, size, "object")
                    end
                end
            end
            if child.Name == "C4" then
                if cheats.bomb then
                    if bombfolder:FindFirstChild"C4" then
                        bombfolder.C4.Adornee = child
                    else
                        local size = UDim2.new(1.4,0,1.4,0)
                        addEsp(child, bombfolder, size, "object")
                        for _,v in pairs(bombfolder.C4.lines.inlines:GetChildren()) do
                            v.BackgroundColor3 = cheats.esp_bombcolor
                        end
                    end
                    if child.Parent == workspace then
                        for i=38,0,-1 do
                            wait(1)
                            bombfolder.C4.label.Text = "C4 - "..i
                        end
                        bombfolder.C4.label.Text = "C4"
                    end
                end
            end
        end
    end
})


Page.Button({
    Text = "OP Obvious HitBox Extender",
    Callback = function()
        local size = 30
        local hrpsize = 28
        for i,v in next, game.Players:GetPlayers() do
            if v.Name ~= game.Players.LocalPlayer.Name then
                game:GetService("RunService").Heartbeat:Connect(function()
                    for _, e in next, getconnections(v.Character.HeadHB:GetPropertyChangedSignal("Size")) do
                    e:Disable()
                    end

                    for _, e in next, getconnections(v.Character.HeadHB.Changed) do
                    e:Disable()
                    end

                    pcall(function()
                        v.Character.HeadHB.Size = Vector3.new(size, size, size)
                        v.Character.HeadHB.Transparency = 0.5
                        v.Character.HeadHB.CanCollide = false
                        v.Character.HumanoidRootPart.Size = Vector3.new(hrpsize, hrpsize, hrpsize)
                        v.Character.HumanoidRootPart.CanCollide = false
                    end)
                end)
            end
        end
    end,
    Menu = {
        Information = function(self)
            UI.Banner({
                Text = "More op version of HItbox Extender, may have to re execute every once and a while"            
            })
        end
    }
    })

local Page = UI.New({
    Title = "Mod Weapon/Knife"
})

Page.Button({
    Text = "Mod Ammo",
    Callback = function()

        local a
        local b
        for i,v in next, getgc() do
            if (type(v) == 'function') and (debug.getinfo(v).name == 'firebullet') then
                a = getfenv(v);
                b = v
            end
        end
        game.RunService.Heartbeat:Connect(function()
            debug.setupvalue(b,5,420)
        end)
    end,
    Menu = {
        Information = function(self)
            UI.Banner({
                Text = "Mod Ammo"            
            })
        end
    }
    })

Page.Button({
    Text = "Mod Recoil",
    Callback = function()

        local a
        local b
        for i,v in next, getgc() do
            if (type(v) == 'function') and (debug.getinfo(v).name == 'firebullet') then
                a = getfenv(v);
                b = v
            end
        end
        game.RunService.Heartbeat:Connect(function()
            a.recoil = 0
        end)
    end,
    Menu = {
        Information = function(self)
            UI.Banner({
                Text = "Mod Recoil"            
            })
        end
    }
    })

    Page.Button({
        Text = "Mod Spread",
        Callback = function()
    
                local a
                local b
                for i,v in next, getgc() do
                    if (type(v) == 'function') and (debug.getinfo(v).name == 'firebullet') then
                        a = getfenv(v);
                        b = v
                    end
                end
                game.RunService.Heartbeat:Connect(function()
                    a.currentspread = 0
                end)
            end,
    Menu = {
        Information = function(self)
            UI.Banner({
                Text = "Mod Spread"            
            })
        end
    }
    })
    
    Page.Button({
        Text = "Make Automatic",
        Callback = function()
    
                local a
                local b
                for i,v in next, getgc() do
                    if (type(v) == 'function') and (debug.getinfo(v).name == 'firebullet') then
                        a = getfenv(v);
                        b = v
                    end
                end
                game.RunService.Heartbeat:Connect(function()
                    a.mode = "automatic"
                end)
            end,
    Menu = {
        Information = function(self)
            UI.Banner({
                Text = "Makes guns automatic"            
            })
        end
    }
    })
    
    Page.Button({
        Text = "Mod Firerate",
        Callback = function()
    
                local a
                local b
                for i,v in next, getgc() do
                    if (type(v) == 'function') and (debug.getinfo(v).name == 'firebullet') then
                        a = getfenv(v);
                        b = v
                    end
                end
                game.RunService.Heartbeat:Connect(function()
                    a.DISABLED = false
                    a.DISABLED2 = false
                end)
            end,
    Menu = {
        Information = function(self)
            UI.Banner({
                Text = "Makes gun go brrrr"            
            })
        end
    }
    })

local Page = UI.New({
    Title = 'Misc/LocalPlayer'
})

Page.Slider({
    Text = "FOV",
    Callback = function(value)
        game:GetService("Players").LocalPlayer.Settings.FOV.Value = value
    end,
    Min = 50,
    Max = 120,
    Def = 50
})

Page.TextField({
    Text = "Knife Changer",
    Callback = function(value)
        game:GetService("Players").LocalPlayer.Data.Melee.Value = value
    end
})

local Page = UI.New({
    Title = 'Credits'
})

Page.Button({
    Text = "Twink Marie UI Lib Creator V3RM",
    Callback = function()
        setclipboard('https://v3rmillion.net/member.php?action=profile&uid=1078854')
    end,
Menu = {
    Information = function(self)
       UI.Banner({
           Text = "Click To Copy UI Lib Creator's V3rm"            
       })
    end
    }
    })

Page.Button({
    Text = "Allinity Hub Creator V3rm",
    Callback = function()
        setclipboard('https://v3rmillion.net/member.php?action=profile&uid=1806998')
    end,
Menu = {
    Information = function(self)
       UI.Banner({
           Text = "Click To Copy Allinity Hub Creator's V3rm"            
       })
    end
    }
    })

Page.Button({
    Text = "Allinity Hub Creator Discord",
    Callback = function()
        setclipboard('Allinity#6969')
    end,
Menu = {
    Information = function(self)
       UI.Banner({
           Text = "Click To Copy Allinity Hub Creator's Discord"            
       })
    end
    }
    })
