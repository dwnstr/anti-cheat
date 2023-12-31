DawnstarAC = {}

--[[Anti GodMode]]--
DawnstarAC.AntiGodMode = true -- Anti godmode
DawnstarAC.ArmourCheck = true -- Anti armor

--[[GodMode Configs]]--
DawnstarAC.AntiGodModeTimer = 10000 -- AntiGodMode Timer (10000 = 10 seconds)
DawnstarAC.MaxPlayerHealth = 200 -- Max player health (if over, kick or ban them)
DawnstarAC.AntiGodModeBan = true -- Ban the AntiGodMode detected player

--[[Armour Config]]--
DawnstarAC.MaxPlayerArmour = 100 -- Max player armor (if over, ban them)

--[[Spectate Config]]--
DawnstarAC.AntiSpectate = true -- Detects if a player has no permission to use

--[[Basic]]--
DawnstarAC.Basic = true -- (Includes infinite ammo, max player speed, etc..)
DawnstarAC.AntiNoclip = true -- Detect if a player try to use noclip (in testing)
DawnstarAC.AntiBlips = true -- Detect if  a user that activated Player Blips and is not allowed

--[KeyBlacklist]--
DawnstarAC.SpamWebhook = 'https://discord.com/api/webhooks/' -- Put your 'spam' discord webhook (for take screenshots, not for log)
--// You have to create a discord room for spamming screenshots
DawnstarAC.AntiKeys = true -- Take a screenshot when a player press a blacklist key (Keys list: https://docs.fivem.net/docs/game-references/controls) (screenshot-basic is required)
   DawnstarAC.AntiKeysKick = false -- Kick player (Not recommended)
   DawnstarAC.KeyBlacklist = {
    {121}, -- Insert Key 
    {37}, -- Tab Key
    {37, 44}, -- Tab + Q key 
    {47, 21}, -- Shift + G key  
    {117}, -- Numpad 7 Key
    {214}, -- Delete Key
}

--[[Resource Injection]]-- (Don't restart or stop resources)
DawnstarAC.AntiResourceStop = true -- Detects if a player tries to block the anticheat
DawnstarAC.AntiResourceStart = false -- Detects if a player tries to start another script
DawnstarAC.AntiFCommands = true -- Detects if a player injected custom commands into the server
DawnstarAC.ResourceChecker = true -- Detects if a player has a different amount of resources from the original

--[[Anti CheatEngine]]--
DawnstarAC.AntiVehicleHashChanger = true -- Detects if a player tried to change his vehicle hash model
DawnstarAC.AntiDamageModifier = true -- Detects if a player tries to modify his damage or defence value
DawnstarAC.AntiWeaponManipulator = true -- MasterSwitch for weapon damange modifier
DawnstarAC.AntiWeaponDamageModifier = false -- Detects if a player tried to modify the weapon damage
DawnstarAC.AntiExplosiveWeapons = true -- Detects if a player modified his weapon to shoot explosive bullets, or explosive punch
DawnstarAC.WeaponDamagesTable = {
    [-1357824103] = 34, -- AdvancedRifle
    [453432689] = 26, -- Pistol
    [1593441988] = 27, -- CombatPistol
    [584646201] = 25, -- APPistol
    [-1716589765] = 51, -- Pistol50
    [-1045183535] = 160, -- Revolver
    [-1076751822] = 28, -- SNSPistol
    [-771403250] = 40, -- HeavyPistol
    [137902532] = 34, -- VintagePistol
    [324215364] = 21, -- MicroSMG
    [736523883] = 22, -- SMG
    [-270015777] = 23, -- AssaultSMG
    [-1121678507] = 22, -- MiniSMG
    [-619010992] = 27, -- MachinePistol
    [171789620] = 28, -- CombatPDW
    [487013001] = 29, -- PumpShotgun
    [2017895192] = 40, -- SawnoffShotgun
    [-494615257] = 32, -- AssaultShotgun
    [-1654528753] = 14, -- BullpupShotgun
    [984333226] = 117, -- HeavyShotgun
    [-1074790547] = 30, -- AssaultRifle
    [-2084633992] = 32, -- CarbineRifle
    [-1063057011] = 32, -- SpecialCarbine
    [2132975508] = 32, -- BullpupRifle
    [1649403952] = 34, -- CompactRifle
    [-1660422300] = 40, -- MG
    [2144741730] = 45, -- CombatMG
    [1627465347] = 34, -- Gusenberg
    [100416529] = 101, -- SniperRifle
    [205991906] = 216, -- HeavySniper
    [-952879014] = 65, -- MarksmanRifle
    [1119849093] = 30, -- Minigun
    [-1466123874] = 165, -- Musket
    [911657153] = 1, -- StunGun
    [1198879012] = 10, -- FlareGun
    [-598887786] = 220, -- MarksmanPistol
    [1834241177] = 30, -- Railgun
    [-275439685] = 30, -- DoubleBarrelShotgun
    [-1746263880] = 81, -- Double Action Revolver
    [-2009644972] = 30, -- SNS Pistol Mk II
    [-879347409] = 200, -- Heavy Revolver Mk II
    [-1768145561] = 32, -- Special Carbine Mk II
    [-2066285827] = 33, -- Bullpup Rifle Mk II
    [1432025498] = 32, -- Pump Shotgun Mk II
    [1785463520] = 75, -- Marksman Rifle Mk II
    [961495388] = 40, -- Assault Rifle Mk II
    [-86904375] = 33, -- Carbine Rifle Mk II
    [-608341376] = 47, -- Combat MG Mk II
    [177293209] = 230, -- Heavy Sniper Mk II
    [-1075685676] = 32, -- Pistol Mk II
    [2024373456] = 25, -- SMG Mk II
}

DawnstarAC.AntiModelChanger = true -- Detects if a player tried to change model to a blacklisted model
    DawnstarAC.AntiModelChangerTable = {
	"a_m_y_mexthug_01", 
    "a_c_cat_01", 
    "a_c_boar", 
    "a_c_sharkhammer", 
    "a_c_coyote", 
    "a_c_chimp",  
    "a_c_cow", 
    "a_c_deer", 
    "a_c_dolphin",
    "a_c_rat", 
    "a_c_fish", 
    "a_c_hen", 
    "a_c_humpback", 
    "a_c_killerwhale", 
    "a_c_mtlion",
    "a_c_rabbit_01",  
    "a_c_rhesus",  
    "a_c_sharktiger", 
	"u_m_y_zombie_01"
}
DawnstarAC.BlacklistWeapon = true -- Detect if a player has a blacklist weapon and remove
   DawnstarAC.DeleteAllWeapon = true -- (If = true, delete all player's weapons. If = true, just delete blacklist weapon)
   DawnstarAC.WeaponBanPlayer = false -- Ban the player who has blacklisted guns (Not recommended)
   DawnstarAC.BlacklistWeaponTable = {
    --    'WEAPON_RPG',

}