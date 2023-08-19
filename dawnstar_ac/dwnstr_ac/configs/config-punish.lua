-- this file is the layout to a new punishment system I have yet to finish.
-- do not include this in your fxmanifest.lua

DawnPunish = {}

DawnPunish.AntiGodModeMethod = {0}
DawnPunish.ArmourCheckMethod = {2}
DawnPunish.AntiSpectateMethod = {0}

DawnPunish.Methods = {
    [DawnPunish.Ban] = 0,
    [DawnPunish.TempBan] = 1,
    [DawnPunish.Kick] = 2,
    [DawnPunish.Crash] = 3,
    [DawnPunish.Mars] = 4,
    [DawnPunish.Attackers] = 5,
    [DawnPunish.SoundSpam] = 6,
    [DawnPunish.Freeze] = 7,
    [DawnPunish.Mirror] = 8,
    [DawnPunish.FuckedCam] = 9,
    [DawnPunish.Voices] = 10,
}