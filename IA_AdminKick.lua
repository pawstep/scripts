--Credits
loadstring(game:HttpGet('https://pastebin.com/raw/tZJF8g3K'))()
wait(5)
--[[
loadstring(game:HttpGet('https://github.com/xrtzrr/scripts/raw/main/IA_AdminKick.lua'))()
https://www.roblox.com/games/5670218884/IA
Kicks you out of the game automatically if an item asylum admin/headadmin/developer joins in-game, can also kick you if a roblox QA tester or admin joins.
The list will be updated if necessary, i'm not going to add contributors or testers, they won't do any good.
**NOTE**: I've noticed they do bans in a console now. Be aware of that and use alts to avoid this.
[ https://noah.ovh/files/2010.txt ]
--]]

if not game:IsLoaded() then
    game.Loaded:Wait()
end

Players = game:GetService"Players"
Names = {
--  Music Developers [1]:
    "LEBWEE",

--  Moderators [5]:
    "Candle_Pastries",
    "Lanternsaurus",
    "dilbertron2",
    "loosefreak"
    "Emerald_Plasma"

--  Administrator [8]:
    "JonathanFoxx",
    "Iei5h",
    "NFKitsune",
    "TazNova",
    "TheLunaticSome",
    "TimidNomf",
    "Siterior",
    "Lovely_Sammer",

--  Head Administrators [2]:
    "Weko",
    "Pixelmen360",

--  Game Developers [3]:
    "JeanRBLX",
    "PortABoi",
    "Xerroz",

-- Other Staff [7]:
    "D1s_c", -- Past Administrator
    "SniffE_Boi", -- Past Administrator
    "OriginallyKosar", -- Past Administrator
    "Nanachiiky", -- Past Administrator
    "TrixisDev", -- Past Administrator
    "FormalNoob", -- Past Administrator
    "Acorlan" -- Past Administrator
-- Adding previous admins here because they probably have relations with staff and can probably report you to the current game moderators.

-- Total people (current moderators): 19
-- Total count (including past staff): 26
}

local function Check(Player)
    for _,GroupId in {
        1200769,
        3055661,
        3253689,
        6821794,
        10279336,
        12513722,
        14593111
    } do
        task.spawn(function()
            if table.find(Names,Player.Name) or Player:IsInGroup(GroupId) then
                -- game:Shutdown("A game/roblox admin and/or a QA tester has joined your game! Be careful next time when exploiting.")
                game:Shutdown()
            end
        end)
    end
    task.spawn(function()
        Character = Player.Character or Player.CharacterAdded:Wait()
        for _,AccessoryName in {
            "Valiant Top Hat of Testing",
            "Thoroughly-Tested Hat of QA",
            "Valiant Valkyrie of Testing"
        } do
            task.spawn(function()
                if Character:WaitForChild(AccessoryName,10) then
                -- game:Shutdown("A game/roblox admin and/or a QA tester has joined your game! Be careful next time when exploiting.")
                game:Shutdown()
                end
            end)
        end
    end)
end
Players.PlayerAdded:Connect(Check)
for _,Player in Players:GetPlayers() do
    Check(Player)
end
