if SERVER then
    AddCSLuaFile()
end

local DbgPrint = GetLogging("Difficulty")

local DIFFICULTY_VERYEASY = 1
local DIFFICULTY_EASY = 2
local DIFFICULTY_NORMAL = 3
local DIFFICULTY_HARD = 4
local DIFFICULTY_VERYHARD = 5
local DIFFICULTY_MAX = DIFFICULTY_VERYHARD

DMG_SCALE_PVN = 1
DMG_SCALE_NVP = 2
DMG_SCALE_PVP = 3
DMG_SCALE_NVN = 4

local DIFFICULTY_DATA =
{
    [DIFFICULTY_VERYEASY] = {
        Proficiency = WEAPON_PROFICIENCY_POOR,
        Skill = 1,
        NPCSpawningScale = 0.0,
        DamageScale = {
            [DMG_SCALE_PVN] = 2,
            [DMG_SCALE_NVP] = 0.5,
            [DMG_SCALE_PVP] = 1,
            [DMG_SCALE_NVN] = 1,
        },
        HitgroupPlayerDamageScale = {
            [HITGROUP_GENERIC] = 1,
            [HITGROUP_HEAD] = 3,
            [HITGROUP_CHEST] = 1,
            [HITGROUP_STOMACH] = 1,
            [HITGROUP_LEFTARM] = 1,
            [HITGROUP_RIGHTARM] = 1,
            [HITGROUP_LEFTLEG] = 1,
            [HITGROUP_RIGHTLEG] = 1,
        },
        HitgroupNPCDamageScale = {
            [HITGROUP_GENERIC] = 1,
            [HITGROUP_HEAD] = 3,
            [HITGROUP_CHEST] = 1,
            [HITGROUP_STOMACH] = 1,
            [HITGROUP_LEFTARM] = 1,
            [HITGROUP_RIGHTARM] = 1,
            [HITGROUP_LEFTLEG] = 1,
            [HITGROUP_RIGHTLEG] = 1,
        },
    },
    [DIFFICULTY_EASY] = {
        Proficiency = WEAPON_PROFICIENCY_AVERAGE,
        Skill = 1,
        NPCSpawningScale = 0.2,
        DamageScale = {
            [DMG_SCALE_PVN] = 1.5,
            [DMG_SCALE_NVP] = 0.7,
            [DMG_SCALE_PVP] = 1,
            [DMG_SCALE_NVN] = 1,
        },
        HitgroupPlayerDamageScale = {
            [HITGROUP_GENERIC] = 1,
            [HITGROUP_HEAD] = 3,
            [HITGROUP_CHEST] = 1,
            [HITGROUP_STOMACH] = 1,
            [HITGROUP_LEFTARM] = 1,
            [HITGROUP_RIGHTARM] = 1,
            [HITGROUP_LEFTLEG] = 1,
            [HITGROUP_RIGHTLEG] = 1,
        },
        HitgroupNPCDamageScale = {
            [HITGROUP_GENERIC] = 1,
            [HITGROUP_HEAD] = 3,
            [HITGROUP_CHEST] = 1,
            [HITGROUP_STOMACH] = 1,
            [HITGROUP_LEFTARM] = 1,
            [HITGROUP_RIGHTARM] = 1,
            [HITGROUP_LEFTLEG] = 1,
            [HITGROUP_RIGHTLEG] = 1,
        },
    },
    [DIFFICULTY_NORMAL] = {
        Proficiency = WEAPON_PROFICIENCY_GOOD,
        Skill = 2,
        NPCSpawningScale = 0.3,
        DamageScale = {
            [DMG_SCALE_PVN] = 1,
            [DMG_SCALE_NVP] = 1,
            [DMG_SCALE_PVP] = 1,
            [DMG_SCALE_NVN] = 1,
        },
        HitgroupPlayerDamageScale = {
            [HITGROUP_GENERIC] = 1,
            [HITGROUP_HEAD] = 3,
            [HITGROUP_CHEST] = 1,
            [HITGROUP_STOMACH] = 1,
            [HITGROUP_LEFTARM] = 1,
            [HITGROUP_RIGHTARM] = 1,
            [HITGROUP_LEFTLEG] = 1,
            [HITGROUP_RIGHTLEG] = 1,
        },
        HitgroupNPCDamageScale = {
            [HITGROUP_GENERIC] = 1,
            [HITGROUP_HEAD] = 3,
            [HITGROUP_CHEST] = 1,
            [HITGROUP_STOMACH] = 1,
            [HITGROUP_LEFTARM] = 1,
            [HITGROUP_RIGHTARM] = 1,
            [HITGROUP_LEFTLEG] = 1,
            [HITGROUP_RIGHTLEG] = 1,
        },
    },
    [DIFFICULTY_HARD] = {
        Proficiency = WEAPON_PROFICIENCY_VERY_GOOD,
        Skill = 2,
        NPCSpawningScale = 0.7,
        DamageScale = {
            [DMG_SCALE_PVN] = 1,
            [DMG_SCALE_NVP] = 1,
            [DMG_SCALE_PVP] = 1,
            [DMG_SCALE_NVN] = 1,
        },
        HitgroupPlayerDamageScale = {
            [HITGROUP_GENERIC] = 1,
            [HITGROUP_HEAD] = 3,
            [HITGROUP_CHEST] = 1,
            [HITGROUP_STOMACH] = 1,
            [HITGROUP_LEFTARM] = 1,
            [HITGROUP_RIGHTARM] = 1,
            [HITGROUP_LEFTLEG] = 1,
            [HITGROUP_RIGHTLEG] = 1,
        },
        HitgroupNPCDamageScale = {
            [HITGROUP_GENERIC] = 1,
            [HITGROUP_HEAD] = 3,
            [HITGROUP_CHEST] = 1,
            [HITGROUP_STOMACH] = 1,
            [HITGROUP_LEFTARM] = 1,
            [HITGROUP_RIGHTARM] = 1,
            [HITGROUP_LEFTLEG] = 1,
            [HITGROUP_RIGHTLEG] = 1,
        },
    },
    [DIFFICULTY_VERYHARD] = {
        Proficiency = WEAPON_PROFICIENCY_PERFECT,
        Skill = 3,
        NPCSpawningScale = 1,
        DamageScale = {
            [DMG_SCALE_PVN] = 1,
            [DMG_SCALE_NVP] = 1,
            [DMG_SCALE_PVP] = 1,
            [DMG_SCALE_NVN] = 1,
        },
        HitgroupPlayerDamageScale = {
            [HITGROUP_GENERIC] = 1,
            [HITGROUP_HEAD] = 3,
            [HITGROUP_CHEST] = 1,
            [HITGROUP_STOMACH] = 1,
            [HITGROUP_LEFTARM] = 1,
            [HITGROUP_RIGHTARM] = 1,
            [HITGROUP_LEFTLEG] = 1,
            [HITGROUP_RIGHTLEG] = 1,
        },
        HitgroupNPCDamageScale = {
            [HITGROUP_GENERIC] = 1,
            [HITGROUP_HEAD] = 3,
            [HITGROUP_CHEST] = 1,
            [HITGROUP_STOMACH] = 1,
            [HITGROUP_LEFTARM] = 1,
            [HITGROUP_RIGHTARM] = 1,
            [HITGROUP_LEFTLEG] = 1,
            [HITGROUP_RIGHTLEG] = 1,
        },
    },
}

cvars.AddChangeCallback("lambda_difficulty", function(cvar, oldVal, newVal)

    GAMEMODE:ResetMetrics()
    GAMEMODE:AdjustDifficulty()

end, "LambdaDifficulty")

function GM:InitializeDifficulty()

    DbgPrint("GM:InitializeDifficulty")

    self.RoundNumber = 0

    self.PlayerDeaths = 1
    self.PlayerKills = 1
    self.PlayerBulletsFired = 0
    self.PlayerFitness = 1
    self.PlayerFitnessScale = 0.2

    self.NPCDeaths = 1
    self.NPCKills = 1
    self.NPCFitness = 1
    self.NPCBulletsFired = 0
    self.NPCAwareness = 0
    self.NPCDamage = 1
    self.PlayerDamage = 1
    self.RoundsLost = 1
    self.RoundsWon = 1

end

function GM:SaveTransitionDifficulty(data)
end

function GM:LoadTransitionDifficulty(data)
end

function GM:RegisterRoundLost()
    self.RoundsLost = self.RoundsLost + 1
end

function GM:RegisterRoundWon()
    self.RoundsWon = self.RoundsWon + 1
end

function GM:GetDifficulty()

    local difficulty = self:GetSetting("difficulty"):GetInt()
    if difficulty > DIFFICULTY_MAX then
        difficulty = DIFFICULTY_MAX
    end
    if difficulty < DIFFICULTY_VERYEASY then
        difficulty = DIFFICULTY_VERYEASY
    end
    return difficulty

end

local DIFFICULTY_NAME =
{
    [DIFFICULTY_VERYEASY] = "Very Easy",
    [DIFFICULTY_EASY] = "Easy",
    [DIFFICULTY_NORMAL] = "Normal",
    [DIFFICULTY_HARD] = "Hard",
    [DIFFICULTY_VERYHARD] = "Very Hard"
}

local PROFICIENCY_NAME =
{
    [WEAPON_PROFICIENCY_POOR] = "Poor",
    [WEAPON_PROFICIENCY_AVERAGE] = "Average",
    [WEAPON_PROFICIENCY_GOOD] = "Good",
    [WEAPON_PROFICIENCY_VERY_GOOD] = "Very Good",
    [WEAPON_PROFICIENCY_PERFECT] = "Perfect"
}

local DIFFICULTIES =
{
    [1] = DIFFICULTY_VERYEASY,
    [2] = DIFFICULTY_EASY,
    [3] = DIFFICULTY_NORMAL,
    [4] = DIFFICULTY_HARD,
    [5] = DIFFICULTY_VERYHARD,
}

function GM:GetDifficulties()
    return table.Copy(DIFFICULTIES)
end

function GM:GetDifficultyText(d)
    if d == nil then
        d = self:GetDifficulty()
    end
    return DIFFICULTY_NAME[d]
end

function GM:GetDifficultyDamageScale(type)

    local difficulty = self:GetDifficulty()
    local data = DIFFICULTY_DATA[difficulty]
    if data == nil then
        error("Invalid difficulty selected")
        return
    end

    return data.DamageScale[type]

end

function GM:GetDifficultyNPCHitgroupDamageScale(group)

    local difficulty = self:GetDifficulty()
    local data = DIFFICULTY_DATA[difficulty]
    if data == nil then
        error("Invalid difficulty selected")
        return
    end

    return data.HitgroupNPCDamageScale[group]

end

function GM:GetDifficultyWeaponProficiency()
    local difficulty = self:GetDifficulty()
    local data = DIFFICULTY_DATA[difficulty]
    if data == nil then
        error("Invalid difficulty selected")
        return
    end

    return data.Proficiency
end

function GM:GetDifficultyWeaponProficiencyText()
    local proficiency = self:GetDifficultyWeaponProficiency()
    return PROFICIENCY_NAME[proficiency]
end

function GM:GetDifficultyPlayerHitgroupDamageScale(group)

    local difficulty = self:GetDifficulty()
    local data = DIFFICULTY_DATA[difficulty]
    if data == nil then
        error("Invalid difficulty selected")
        return
    end

    return data.HitgroupPlayerDamageScale[group]

end

-- Returns the scale the game should base on player count.
function GM:GetNPCSpawningScale()
    local difficulty = self:GetDifficulty()
    local data = DIFFICULTY_DATA[difficulty]
    if data == nil then
        error("Invalid difficulty selected")
        return
    end
    return data.NPCSpawningScale
end

function GM:AdjustDifficulty()

    if player.GetCount() == 0 then
        -- calling game.SetSkilLLevel can crash if gamesrules is nullptr, so we just use it once players are around.
        return
    end

    local difficulty = self:GetDifficulty()
    DbgPrint("Difficulty: " .. difficulty)

    local data = DIFFICULTY_DATA[difficulty]
    if data == nil then
        error("Invalid difficulty selected")
        return
    end

    if SERVER then
        RunConsoleCommand("skill", tostring(data.Skill))
        game.SetSkillLevel(data.Skill)

        for k,v in pairs(self.EnemyNPCs or {}) do
            if IsValid(v) then
                self:AdjustNPCDifficulty(v, data)
            end
        end
    end

end

function GM:AdjustNPCDifficulty(npc, data)

    if data == nil then
        local difficulty = self:GetDifficulty()
        data = DIFFICULTY_DATA[difficulty]
        if data == nil then
            error("Invalid difficulty selected")
            return
        end
    end
    DbgPrint("Adjusting NPC difficulty: " .. tostring(npc) .. ", Prof: " .. data.Proficiency)
    npc:SetCurrentWeaponProficiency(data.Proficiency)

end
