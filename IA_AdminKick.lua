--Credits
loadstring(game:HttpGet("https://pastebin.com/raw/urvzBY4a"))()
wait(5)
--[[
loadstring(game:HttpGet('https://github.com/xrtzrr/scripts/raw/main/IA_AdminKick.lua'))()
https://www.roblox.com/games/5670218884/IA
Kicks you out of the game automatically if an item asylum admin/headadmin/developer joins in-game, can also kick you if a roblox QA tester or admin joins.
The list will be updated if necessary, i'm not going to add contributors or testers, they won't do any good.
Also, if the developers are reading this, fuck you for banning me, I did nothing wrong. So consider this payback.
**NOTE**: I've noticed they do bans in a console now. Be aware of that and use alts to avoid this. [ https://noah.ovh/files/2010.txt ]
--]]

if not game:IsLoaded() then
    game.Loaded:Wait()
end

Players = game:GetService"Players"
Names = {
--  Music Developers [1]:
    "LEBWEE",
--  Admins List [8]:
--  "D1s_c",
--  "SniffE_Boi",
--  "OriginallyKosar",
--  "Nanachiiky",
--  "TrixisDev",
--  "FormalNoob",
--  "Acorlan",
    "JonathanFoxx", --New admin lol, i guess those 7 people who got fired weren't enough!
    "Iei5h",
    "NFKitsune",
    "TazNova",
    "TheLunaticSome",
    "TimidNomf",
    "Siterior",
    "Lovely_Sammer",
--  HeadAdmin List [2]:
    "Weko",
    "Pixelmen360",
--  Developer List [3]:
    "JeanRBLX",
    "PortABoi",
    "Xerroz"
--  Count: 20 people in total
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
