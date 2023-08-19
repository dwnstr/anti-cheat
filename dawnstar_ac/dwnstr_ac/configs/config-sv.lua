DwnS = {}

--[[System Config]]--
DwnS.LicenseKey = 'KEY_HERE' -- Put your license key here 
DwnS.Logo = 'https://i.imgur.com/VSnfn9r.png' -- Put your server logo
DwnS.ServerName = 'Server Name' -- Put your server name
DwnS.FileName = 'IR' -- Name of your lua file for install (Default = IR.lua) // You can change this if you want

--[Webhook]--
DwnS.BanWebhook = 'https://discord.com/api/webhooks/' -- Put your ban webhook
DwnS.LogWebhook = 'https://discord.com/api/webhooks/' -- Put your log webhook
DwnS.ScreenWebhook = 'https://discord.com/api/webhooks/' -- Put your screenshot webhook

--[[Kick Message]]--
DwnS.KickMessage = "You have been permanently banned." -- You can edit this

--[[Blacklist System]]--
DwnS.ExplosionsAC = true -- Detects blacklisted explosions and who created them (tables/explosions.lua) // HIGHLY RECOMMENDED
DwnS.BlacklistPed = true -- Detects blacklisted ped and remove (tables/blacklist.lua) // HIGHLY RECOMMENDED
DwnS.BlacklistVeh = true -- Detects blacklisted vehicle and remove (tables/blacklist.lua) // HIGHLY RECOMMENDED

DwnS.ObjectDetect = true -- Detects blacklisted object and remove // HIGHLY RECOMMENDED
DwnS.AllObject = true -- If = true, All objects will be detected and deleted | If = false, will detect the objects contained here (tables/blacklist.lua)
    DwnS.AllObjectWhitelist = { -- Objects in this list will not be deleted (Works only if AllObject = true)
    "prop_ballistic_shield",
    "prop_phone_ing_02",
    "prop_roadcone02a",
    "prop_barrier_work05",
    "p_ld_stinger_s",
    "prop_boxpile_07d",
    "hei_prop_cash_crate_half_full",
    "ba_prop_battle_glowstick_01",
    "ba_prop_battle_hobby_horse",
    "prop_notepad_01",
    "hei_prop_heist_box",
    "prop_single_rose",
    "prop_cs_ciggy_01",
    "hei_heist_sh_bong_01",
    "prop_ld_suitcase_01",
    "prop_security_case_01",
    "prop_police_id_board",
    "p_amb_coffeecup_01",
    "prop_drink_whisky",
    "prop_amb_beer_bottle",
    "prop_plastic_cup_02",
    "prop_amb_donut",
    "prop_cs_burger_01",
    "prop_sandwich_01",
    "prop_ecola_can",
    "prop_choc_ego",
    "prop_drink_redwine",
    "prop_champ_flute",
    "prop_drink_champ",
    "prop_cigar_02",
    "prop_cigar_01",
    "prop_acc_guitar_01",
    "prop_el_guitar_01",
    "prop_el_guitar_03",
    "prop_novel_01",
    "prop_snow_flower_02",
    "v_ilev_mr_rasberryclean",
    "p_michael_backpack_s",
    "p_amb_clipboard_01",
    "prop_tourist_map_01",
    "prop_beggers_sign_03",
    "prop_anim_cash_pile_01",
    "prop_pap_camera_01",
    "ba_prop_battle_champ_open",
    "p_cs_joint_02",
    "prop_amb_ciggy_01",
    "prop_ld_case_01",
    "prop_cs_tablet",
    "prop_npc_phone_02",
    "prop_sponge_01",
    }
DwnS.ObjectBan = false -- Ban player who created blacklistobject (Works only if AllObject = false)


--[[Logs System]]--
DwnS.PedsLog = true
DwnS.VehiclesLog = true
DwnS.ObjectsLog = true

--[[Onesync Configs]]-- You can edit numbers
DwnS.MaxSpawner = true -- (Set = true to use the options below, set = false to disable)
DwnS.MaxObject = 500 -- Maximum number of objects the player can spawn in 1 minute, if over the player will be banned (Default = 80, set = 0 to disable)
DwnS.MaxVehicle = 500 -- Maximum number of vehicles the player can spawn in 1 minute, if over the player will be banned (Default = 80, set = 0 to disable)
DwnS.MaxPed = 500 -- Maximum number of peds the player can spawn in 1 minute, if over the player will be banned (Default = 80, set = 0 to disable)

--[[Blacklist Event]]--
DwnS.BlacklistEvent = false -- Detects when player TriggerServer blacklisted event and ban them (tables/blacklistevent.lua) // (Remember to save your original server resource)

--[[Blacklist Words]]--
DwnS.FakeChat = true -- Detects if player try to say with other player's name
DwnS.BlacklistWords = true -- Detects if player try to say a blacklist word and ban them (tables/blacklistwords.lua)

--[[ClearPedTasksImmediately Detection]]--
DwnS.ClearDetected = true -- Detects ClearPedTasksImmediately (Detects cheaters that are kicking out of vehicles other players) // HIGHLY RECOMMENDED
DwnS.ClearDetectedBan = false -- Ban Player

--[[GiveWeapon Detection]]--
DwnS.WeaponDetected = true -- Detects GiveWeapon (detects if cheater tries to give another player a weapon on the blacklist) // (tables/weapon.lua) HIGHLY RECOMMENDED

DwnS.BlacklistNames = true -- Do not allow players named in the blacklist to connect to the server
DwnS.NamesKickReason = 'Your name contains blacklist wording' -- You can edit this
DwnS.BlackListNamesTables = {
"administrator", "admin", "adm1n", "adm!n", "admln", "moderator", "owner", "nigger", "n1gger", "eulencheats", "lynxmenu", "atgmenu", "hacker", "bastard", "hamhaxia", "333gang", "ukrp", "eguk", "n1gger", "n1ga", "nigga", "n1gga", "nigg3r",
    "nig3r", "shagged", "4dm1n", "4dmin", "m0d3r4t0r", "n199er", "n1993r", "rustchance.com", "rustchance", "hellcase.com", "hellcase", "youtube.com", "youtu.be", "youtube", "twitch.tv", "twitch", "anticheat.gg", "anticheat", "fucking", "ψ", "@", "&", "{", "}", ";", "ϟ", "♕", "Æ", "Œ", "‰", "™", "š", "œ", "Ÿ", "µ", "ß",
    "±", "¦", "»", "«", "¼", "½", "¾", "¬", "¿", "Ñ", "®", "©", "²", "·", "•", "°", "þ", "ベ", "ル", "ろ", "ぬ", "ふ", "う", "え", "お", "や", "ゆ", "よ", "わ", "ほ", "へ", "た", "て", "い", "す", "か", "ん", "な", "に", "ら", "ぜ", "む",
    "ち", "と", "し", "は", "き", "く", "ま", "の", "り", "れ", "け", "む", "つ", "さ", "そ", "ひ", "こ", "み", "も", "ね", "る", "め", "ロ", "ヌ", "フ", "ア", "ウ", "エ", "オ", "ヤ", "ユ", "ヨ", "ワ", "ホ", "ヘ", "タ", "テ", "イ", "ス", "カ", "ン",
    "ナ", "ニ", "ラ", "セ", "ム", "チ", "ト", "シ", "ハ", "キ", "ク", "マ", "ノ", "リ", "レ", "ケ", "ム", "ツ", "サ", "ソ", "ヒ", "コ", "ミ", "モ", "ネ", "ル", "メ", "✪", "Ä", "ƒ", "Ã", "¢", "?", "†", "€", "웃", "и", "】", "【", "j4p.pl", "ֆ", "ȶ",
    "你", "好", "爱", "幸", "福", "猫", "狗", "微", "笑", "中", "安", "東", "尼", "杰", "诶", "西", "开", "陈", "瑞", "华", "馬", "塞", "洛", "ダ", "仇", "觉", "感", "衣", "德", "曼", "L͙", "a͙", "l͙", "ľ̶̚͝", "Ḩ̷̤͚̤͑͂̎̎͆", "a̸̢͉̠͎͒͌͐̑̇", "♚", "я", "Ʒ", "Ӂ̴", "Ƹ̴", "≋",
    "chocohax", "civilgamers.com", "civilgamers", "csgoempire.com", "csgoempire", "g4skins.com", "g4skins", "gameodds.gg", "duckfuck.com", "crysishosting.com", "crysishosting", "key-drop.com", "key-drop.pl", "skinhub.com", "skinhub", "`", "¤", "¡",
    "casedrop.eu", "casedrop", "cs.money", "rustypot.com", "✈", "⛧", "☭", "☣", "✠", "dkb.xss.ht", "( . )( . )", "⚆", "╮", "╭", "rampage.lt", "?", "xcasecsgo.com", "xcasecsgo", "csgocases.com",
    "csgocases", "K9GrillzUK.co.uk", "moat.gg", "princevidz.com", "princevidz", "pvpro.com", "Pvpro", "ez.krimes.ro", "loot.farm", "arma3fisherslife.net", "arma3fisherslife", "egamers.io", "ifn.gg", "key-drop", "sups.gg", "tradeit.gg",
    "§", "csgotraders.net", "csgotraders", "Σ", "Ξ", "hurtfun.com", "hurtfun", "gamekit.com", "¥", "t.tv", "yandex.ru", "yandex", "csgofly.com", "csgofly", "pornhub.com", "pornhub", "一", "", "Ｊ", "◢", "◤", "⋡", "℟", "ᴮ", "ᴼ", "ᴛᴇᴀᴍ",
    "cs.deals","twat", "STRESS.PW", "/", "script", "<", ">"
}

--[[Permission System]]-- DO NOT TOUCH IF YOU DON'T KNOW WHAT ARE U DOING 
DwnS.Admin = {"dawnstaradmin","dawnstarmod"} -- This will allow the user with these perms to bypass Violation detections such as mod menus/weapons/godmode, etc.
DwnS.Blips = {"dawnstaradmin","dawnstarmod","dawnstarpolice","dawnstarambulance","dawnstarmechanic"} -- This will allow the user with these perms to use Player Blips.