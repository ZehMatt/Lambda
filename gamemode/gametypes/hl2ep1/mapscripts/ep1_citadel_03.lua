AddCSLuaFile()
local DbgPrint = GetLogging("MapScript")
local MAPSCRIPT = {}

MAPSCRIPT.DefaultLoadout = 
{
    Weapons = {
        "weapon_physcannon"
    },
    Ammo = {},
    Armor = 0,
    HEV = true
}

MAPSCRIPT.InputFilters = {}
MAPSCRIPT.EntityFilterByClass = {}

MAPSCRIPT.EntityFilterByName = 
{
    ["global_newgame_template_base_items"] = true,
}

MAPSCRIPT.GlobalStates =
{
    ["super_phys_gun"] = GLOBAL_ON,
}

function MAPSCRIPT:PostInit()

    if SERVER then
        
        local multipleTrigger = ents.FindByPos(Vector(424, 12164, 5408), "trigger_multiple")
        for k, v in pairs(multipleTrigger) do
            v:Remove()
        end

        ents.WaitForEntityByName("trigger_fall", function(ent)
            ent:Remove()
        end)

        ents.WaitForEntityByName("trigger_fall_2", function(ent)
            ent:Remove()
        end)


        local hurtTrigger = ents.Create("trigger_hurt")
        hurtTrigger:SetupTrigger(
            Vector(2768, 12144, 2896),
            Angle(0, 0, 0),
            Vector(-896, -976, -896),
            Vector(896, 976, 896)
        )
        hurtTrigger:SetKeyValue("damagetype", "1024")
        hurtTrigger:SetKeyValue("damage", "200")

        local doorCloseTrigger = ents.Create("trigger_once")
        doorCloseTrigger:SetupTrigger(
            Vector(424, 12164, 5408),
            Angle(0, 0, 0),
            Vector(-544, -208, -96),
            Vector(544, 208, 96)
        )
        doorCloseTrigger:SetKeyValue("teamwait", "1")
        doorCloseTrigger:SetKeyValue("showwait", "0")
        doorCloseTrigger:Fire("AddOutput", "OnTrigger trigger_alyx_close_airlock,Enable,0.0,-1")
        doorCloseTrigger.OnTrigger = function(_, activator)
            local checkpoint = GAMEMODE:CreateCheckpoint(Vector(-112, 12164, 5316))
            GAMEMODE:SetPlayerCheckpoint(checkpoint, activator)
        end

        ents.WaitForEntityByName("trigger_startmonitor_scene_1", function(ent) 
            ent:Remove()
        end)

        local monitorScreenTrigger = ents.Create("trigger_once")
        monitorScreenTrigger:SetupTrigger(
            Vector(1196, 11708, 5247.96),
            Angle(0, 0, 0),
            Vector(-204, -188, -512),
            Vector(204, 188, 512)
        )
        monitorScreenTrigger:SetName("trigger_startmonitor_scene_1")
        monitorScreenTrigger:SetKeyValue("StartDisabled", "1")
        monitorScreenTrigger:SetKeyValue("teamwait", "1")
        monitorScreenTrigger:Fire("AddOutput", "OnTrigger trigger_door_comb_close,Enable,0.0,-1")
        monitorScreenTrigger:Fire("AddOutput", "OnTrigger lcs_core_control_scene,Start,0.0,1")
        monitorScreenTrigger.OnTrigger = function(_, activator)
            local checkpoint = GAMEMODE:CreateCheckpoint(Vector(1224, 11835, 5317))
            GAMEMODE:SetPlayerCheckpoint(checkpoint, activator)
        end

        ents.WaitForEntityByName("Trigger_lift", function(ent)
            ent:Remove()
        end)

        local elevator
        ents.WaitForEntityByName("lift_airlock", function(ent)
            elevator = ent
        end)

        local liftTrigger = ents.Create("trigger_once")
        liftTrigger:SetupTrigger(
            Vector(1522, 11720, 5312),
            Angle(0, 0, 0),
            Vector(-78, -136, -48),
            Vector(78, 136, 48)
        )
        liftTrigger:SetName("Trigger_lift")
        liftTrigger:SetKeyValue("StartDisabled", "1")
        liftTrigger:SetKeyValue("teamwait", "1")
        liftTrigger:Fire("AddOutput", "OnTrigger lcs_core_control_scene,Resume,0.0,-1")
        liftTrigger:Fire("AddOutput", "OnTrigger Core_lift_doors,Close,0.0,-1")
        liftTrigger.OnTrigger = function(_, activator)
            local checkpoint = GAMEMODE:CreateCheckpoint(Vector(1522, 11720, 5312))
            checkpoint:SetParent(elevator)
            GAMEMODE:SetPlayerCheckpoint(checkpoint, activator)
        end

        ents.WaitForEntityByName("core_airlock_close", function(ent)
            ent:Remove()
        end)

        local checkpoint1 = GAMEMODE:CreateCheckpoint(Vector(3792, 11592, 4741))
        checkpoint1Trigger = ents.Create("trigger_once")
        checkpoint1Trigger:SetupTrigger(
            Vector(3792, 11592, 4741),
            Angle(0, 0, 0),
            Vector(-40, -20, 0),
            Vector(40, 20, 50)            
        )
        checkpoint1Trigger.OnTrigger = function(_, activator)
            GAMEMODE:SetPlayerCheckpoint(checkpoint1, activator)
        end

        local checkpoint2 = GAMEMODE:CreateCheckpoint(Vector(1947, 10766, 4997))
        checkpoint2Trigger = ents.Create("trigger_once")
        checkpoint2Trigger:SetupTrigger(
            Vector(1947, 10766, 4997),
            Angle(0, 0, 0),
            Vector(-40, -20, 0),
            Vector(40, 20, 50)            
        )
        checkpoint2Trigger.OnTrigger = function(_, activator)
            GAMEMODE:SetPlayerCheckpoint(checkpoint2, activator)
        end

    end

end

function MAPSCRIPT:PostPlayerSpawn(ply)
end

return MAPSCRIPT