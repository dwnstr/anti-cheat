function inTable(a, b)
  a = a
  for fg, fh in pairs(a) do
      if fh == b then
          return fg
      end
  end
  return false
end
CreateThread(
  function()
      for fd, fe in pairs(DwnS.AllObjectWhitelist) do
          table.insert(va, GetHashKey(fe))
          while true do
              Wait(2000)
              if vb == false then
                  loadBanList()
                  if BanList ~= {} then
                      print("^" .. math.random(1, 9) .. "Dawnstar Anti-Cheat^0: ^3Banlist loaded^0")
                      vb = true
                  else
                      print("^" .. math.random(1, 9) .. "Dawnstar Anti-Cheat^0: ^3Banlist loaded ^1Error^0")
                  end
              end
          end
      end
  end
)
function loadBanList()
  MySQL.Async.fetchAll(
      "SELECT * FROM dwnstrAC",
      {},
      function(a)
          a = a
          BanList = {}
          for fe = 1, #a do
              table.insert(
                  BanList,
                  {
                      identifier = a[fe].identifier,
                      license = a[fe].license,
                      liveid = a[fe].liveid,
                      xblid = a[fe].xblid,
                      discord = a[fe].discord,
                      playerip = a[fe].playerip
                  }
              )
          end
      end
  )
end
RegisterCommand(
  "dawnreload",
  function(a)
      a = a
      if a == 0 then
          va = false
      elseif doesPlayerHavePerms(a, DwnS.Admin) then
          va = false
          print("^" .. math.random(1, 9) .. "Dawnstar Anti-Cheat^0: ^3Banlist loaded^0")
      else
          print("Insufficient Permission")
      end
  end
)
RegisterCommand(
  "dawnunban",
  function(a, b, c)
      a = a
      if doesPlayerHavePerms(a, DwnS.Admin) then
          cmdunban(a, b)
      else
          TriggerClientEvent(
              "chat:addMessage",
              a,
              {
                  args = {
                      "^" .. math.random(1, 9) .. "Dawnstar Anti-Cheat^0 ",
                      "Insufficient Permission"
                  }
              }
          )
      end
  end
)
RegisterCommand(
  "clearallpeds",
  function(a)
      a = a
      if doesPlayerHavePerms(a, DwnS.Admin) then
          TriggerClientEvent("dwnS:sarawww", math.floor(-1))
      else
          TriggerClientEvent(
              "chat:addMessage",
              a,
              {
                  args = {
                      "^" .. math.random(1, 9) .. "Dawnstar Anti-Cheat^0 ",
                      "Insufficient Permission"
                  }
              }
          )
          sendlog("Player: " .. GetPlayerName(a) .. " tried to /clearallpeds", "56108")
      end
  end
)
RegisterCommand(
  "clearallobjects",
  function(a)
      a = a
      if doesPlayerHavePerms(a, DwnS.Admin) then
          TriggerClientEvent("dwnS:saraw", math.floor(-1))
      else
          TriggerClientEvent(
              "chat:addMessage",
              a,
              {
                  args = {
                      "^" .. math.random(1, 9) .. "Dawnstar Anti-Cheat^0 ",
                      "Insufficient Permission"
                  }
              }
          )
          sendlog("Player: " .. GetPlayerName(a) .. " tried to /clearallobjects", "56108")
      end
  end
)
RegisterCommand(
  "clearallvehicles",
  function(a)
      a = a
      if doesPlayerHavePerms(a, DwnS.Admin) then
          TriggerClientEvent("dwnS:saraww", math.floor(-1))
      else
          TriggerClientEvent(
              "chat:addMessage",
              a,
              {
                  args = {
                      "^" .. math.random(1, 9) .. "Dawnstar Anti-Cheat^0 ",
                      "Insufficient Permission"
                  }
              }
          )
          sendlog("Player: " .. GetPlayerName(a) .. " tried to /clearallvehicles", "56108")
      end
  end
)
function cmdunban(a, b)
  a = a
  if b[1] ~= nil then
      MySQL.Async.fetchScalar(
          "SELECT identifier FROM dwnstrAC WHERE playername=@name",
          {
              ["@name"] = table.concat(b, " ")
          },
          function(a)
              a = a
              if a ~= nil then
                  MySQL.Async.execute(
                      "DELETE FROM dwnstrAC WHERE playername=@name",
                      {
                          ["@name"] = va
                      },
                      function()
                          loadBanList()
                          TriggerClientEvent(
                              "chat:addMessage",
                              va,
                              {
                                  args = {
                                      "^" .. math.random(1, 9) .. "Dawnstar Anti-Cheat^0 ",
                                      vb .. " has been unbanned"
                                  }
                              }
                          )
                      end
                  )
              end
          end
      )
  end
end
if DwnS.BlacklistEvent then
  for fl = 1, #BlacklistedEvents do
      RegisterServerEvent(BlacklistedEvents[fl])
      AddEventHandler(
          BlacklistedEvents[fl],
          function()
              TriggerEvent("Dawn:Banned", source, "Blacklist event: " .. BlacklistedEvents[va])
          end
      )
  end
end
AddEventHandler(
  "chatMessage",
  function(a, b, c)
      a = a
      if DwnS.FakeChat and b ~= GetPlayerName(a) then
          TriggerEvent("Dawn:Banned", a, "[SPOOFED CHAT] This player tried to say: " .. c .. " with name | " .. b)
      end
      if DwnS.BlacklistWords then
          do
              return
          end
          while true do
              if c == "[FAKE CHAT] This player tried to say: " .. c .. " with name | " .. b then
                  TriggerEvent("Dawn:Banned", a, "Blacklisted Word: This player tried to say : **" .. c .. "**")
              end
              for fo in c:lower():gmatch(
                  "%s?" .. string.lower("[SPOOFED CHAT] This player tried to say: " .. c .. " with name | " .. b) .. "%s"
              ) do
                  TriggerEvent(
                      "Dawn:Banned",
                      a,
                      "Blacklisted Word: **" .. tostring(fo) .. "** | This player tried to say : **" .. c .. "**"
                  )
              end
          end
      end
  end
)
if DwnS.MaxSpawner then
  Citizen.CreateThread(
      function()
          maxobject = {}
          maxvehicle = {}
          maxped = {}
          while true do
              Citizen.Wait(60000)
              maxobject = {}
              maxvehicle = {}
              maxped = {}
          end
      end
  )
end
if DwnS.MaxSpawner then
  AddEventHandler(
      "entityCreating",
      function(a)
          a = a
          if DoesEntityExist(a) then
              if DwnS.MaxObject ~= 0 and GetEntityType(a) == 3 then
                  maxobject[NetworkGetEntityOwner(a)] = (maxobject[NetworkGetEntityOwner(a)] or 0) + 1
                  if maxobject[NetworkGetEntityOwner(a)] > DwnS.MaxObject then
                      TriggerEvent(
                          "Dawn:Banned",
                          NetworkGetEntityOwner(a),
                          "Player spawned objects over the allowed number: " .. maxobject[NetworkGetEntityOwner(a)]
                      )
                  end
              end
              if DwnS.MaxVehicle ~= 0 and GetEntityType(a) == 2 then
                  maxvehicle[NetworkGetEntityOwner(a)] = (maxvehicle[NetworkGetEntityOwner(a)] or 0) + 1
                  if maxvehicle[NetworkGetEntityOwner(a)] > DwnS.MaxVehicle then
                      TriggerEvent(
                          "Dawn:Banned",
                          NetworkGetEntityOwner(a),
                          "Player spawned vehicles over the allowed number: " .. maxvehicle[NetworkGetEntityOwner(a)]
                      )
                  end
              end
              if DwnS.MaxPed ~= 0 and GetEntityType(a) == 1 then
                  maxped[NetworkGetEntityOwner(a)] = (maxped[NetworkGetEntityOwner(a)] or 0) + 1
                  if maxped[NetworkGetEntityOwner(a)] > DwnS.MaxPed then
                      TriggerEvent(
                          "Dawn:Banned",
                          NetworkGetEntityOwner(a),
                          "Player spawned peds over the allowed number: " .. maxped[NetworkGetEntityOwner(a)]
                      )
                  end
              end
          end
      end
  )
end
AddEventHandler(
  "entityCreating",
  function(a)
      a = a
      if DoesEntityExist(a) then
          if NetworkGetEntityOwner(a) == nil then
              CancelEvent()
          end
          if DwnS.ObjectDetect then
              if DwnS.AllObject then
                  if GetEntityType(a) == 3 and inTable(va, (GetEntityModel(a))) == false then
                      CancelEvent()
                  end
              else
                  for fh, fj in ipairs(BlacklistedObject) do
                      if GetEntityModel(a) == GetHashKey(fj) then
                          CancelEvent()
                          if DwnS.ObjectBan then
                              Wait(1000)
                              TriggerEvent("Dawn:Banned", NetworkGetEntityOwner(a), "Object: " .. fj)
                          elseif DwnS.ObjectsLog then
                              sendlog(
                                  GetPlayerName((NetworkGetEntityOwner(a))) ..
                                      " | Detected Object: " ..
                                          fj .. " | The user created this object and got detected",
                                  "16744192"
                              )
                          end
                      end
                  end
              end
          end
          if DwnS.BlacklistPed then
              for fh, fj in ipairs(BlacklistedPeds) do
                  if GetEntityModel(a) == GetHashKey(fj) then
                      if DwnS.PedsLog then
                          sendlog(
                              GetPlayerName((NetworkGetEntityOwner(a))) ..
                                  " | Detected Ped: " .. fj .. " | The user created this ped and got detected",
                              "8434611"
                          )
                      end
                      CancelEvent()
                  end
              end
          end
          if DwnS.BlacklistVeh then
              for fh, fj in ipairs(BlacklistedVehicle) do
                  if GetEntityModel(a) == GetHashKey(fj) then
                      if DwnS.VehiclesLog then
                          sendlog(
                              GetPlayerName((NetworkGetEntityOwner(a))) ..
                                  " | Detected Vehicle: " .. fj .. " | The user created this vehicle and got detected",
                              "8408397"
                          )
                      end
                      CancelEvent()
                  end
              end
          end
      end
  end
)
AddEventHandler(
  "giveWeaponEvent",
  function(a, b)
      a = a
      if DwnS.WeaponDetected then
          for fg, fh in ipairs(BlacklistedWeapons) do
              if GetHashKey(fh) == b.weaponType then
                  CancelEvent()
                  Wait(3000)
                  TriggerEvent("Dawn:Banned", a, "Player tried to give a Blacklisted Weapon: **" .. fh .. "**")
              end
          end
      end
  end
)
AddEventHandler(
  "removeAllWeaponEvent",
  function(a, b)
      a = a
      print(a .. " removeAllWeapon")
  end
)
AddEventHandler(
  "removeWeaponEvent",
  function(a, b)
      a = a
      print(a .. " removeWeapon")
  end
)
AddEventHandler(
  "clearPedTasksEvent",
  function(a, b)
      a = a
      if DwnS.ClearDetected and b.immediately and not doesPlayerHavePerms(a, DwnS.Admin) then
          CancelEvent()
          if DwnS.ClearDetectedBan then
              TriggerEvent("Dawn:Banned", a, "Player tried to ClearPedTasks on another players")
          end
      end
  end
)
AddEventHandler(
  "explosionEvent",
  function(a, b)
      a = a
      if DwnS.ExplosionsAC then
          if ExplosionsList[b.explosionType] then
              if ExplosionsList[b.explosionType].log and not ExplosionsList[b.explosionType].ban then
                  sendlog(
                      GetPlayerName(a) ..
                          " | Detected Explosion: " ..
                              ExplosionsList[b.explosionType].name ..
                                  " | The user created this explosion and got detected",
                      "8421504"
                  )
              end
              if ExplosionsList[b.explosionType].ban then
                  TriggerEvent(
                      "Dawn:Banned",
                      a,
                      "Detected Explosion: " .. ExplosionsList[b.explosionType].name,
                      " | The user created this explosion and got detected"
                  )
              end
          end
          CancelEvent()
      end
      for fg, fh in ipairs(ExplosionsCancel) do
          if b.explosionType == fh then
              CancelEvent()
          end
      end
  end
)
RegisterServerEvent("DwnS:BNsdasLdasips")
AddEventHandler(
  "DwnS:BNsdasLdasips",
  function()
      if not doesPlayerHavePerms(source, DwnS.Blips) then
          TriggerEvent("Dawn:Banned", source, "This player tried to enable playerblips")
      end
  end
)
RegisterServerEvent("dasrwrwewbetahb")
AddEventHandler(
  "dasrwrwewbetahb",
  function(a)
      a = a
      if not doesPlayerHavePerms(source, DwnS.Admin) then
          DropPlayer(source, "[DAWNSTAR ENT. ANTI-CHEAT] - " .. a)
      end
      sendlog(GetPlayerName(source) .. " | Tried to enable godmode", "16765540")
  end
)
RegisterServerEvent("dwnstraekeyas:A")
AddEventHandler(
  "dwnstraekeyas:A",
  function(a)
      a = a
      DropPlayer(source, "[DAWNSTAR ENT. ANTI-CHEAT] - You pressed the blacklist key")
  end
)
RegisterServerEvent("dwnstraekeyas:B")
AddEventHandler(
  "dwnstraekeyas:B",
  function(a, b)
      a = a
      for fr, fs in ipairs(GetPlayerIdentifiers(source)) do
          if string.sub(fs, math.floor(1), string.len("steam:")) == "steam:" then
          elseif string.sub(fs, math.floor(1), string.len("license:")) == "license:" then
          elseif string.sub(fs, math.floor(1), string.len("live:")) == "live:" then
          elseif string.sub(fs, math.floor(1), string.len("xbl:")) == "xbl:" then
          elseif string.sub(fs, math.floor(1), string.len("discord:")) == "discord:" then
          else
          end
      end
      sendlogg(
          "**Player:** " ..
              GetPlayerName(source) ..
                  [[

**ServerID: **]] ..
                      source ..
                          [[

**SteamID:** ]] ..
                              fs ..
                                  [[

**Steam Link:** ]] ..
                                      ("https://steamcommunity.com/profiles/" ..
                                          tostring(tonumber(fs:gsub("steam:", ""), 16))) ..
                                          [[

**License:** ]] ..
                                              fs ..
                                                  [[

**LiveID:** ]] ..
                                                      fs ..
                                                          [[

**XboxID:** ]] ..
                                                              fs ..
                                                                  [[

**DiscordID:** ]] ..
                                                                      fs ..
                                                                          [[

**Discord Tag:** <@]] ..
                                                                              fs:gsub("discord:", "") ..
                                                                                  [[
>
**IP:** ]] ..
                                                                                      fs ..
                                                                                          [[

**Reason:** ]] ..
                                                                                              "This player pressed a blacklist key: **" ..
                                                                                                  a .. "**",
          "11750815"
      )
      Wait(500)
      sendimg(b)
  end
)
function sendlogg(a, b)
  a = a
  PerformHttpRequest(
      DwnS.ScreenWebhook,
      function(a, b, c)
          a = a
      end,
      "POST",
      json.encode(
          {
              username = DwnS.ServerName,
              embeds = {
                  {
                      color = b,
                      title = "Dawnstar Ent. - FiveM Anticheat",
                      description = a,
                      footer = {
                          text = DwnS.ServerName
                      }
                  }
              },
              avatar_url = DwnS.Logo
          }
      ),
      {
          ["Content-Type"] = "application/json"
      }
  )
end
function sendimg(a)
  a = a
  PerformHttpRequest(
      DwnS.ScreenWebhook,
      function(a, b, c)
          a = a
      end,
      "POST",
      json.encode(
          {
              username = DwnS.ServerName,
              content = a,
              avatar_url = DwnS.Logo
          }
      ),
      {
          ["Content-Type"] = "application/json"
      }
  )
end
RegisterServerEvent("dwnS:logs")
AddEventHandler(
  "dwnS:logs",
  function(a)
      a = a
      sendlog(GetPlayerName(source) .. " | This player has a blacklist weapon: **" .. a .. "**", "56108")
  end
)
RegisterServerEvent("Dawn:Banned")
AddEventHandler(
  "Dawn:Banned",
  function(a, b)
      a = a
      for fr, fs in ipairs(GetPlayerIdentifiers(a)) do
          if string.sub(fs, math.floor(1), string.len("steam:")) == "steam:" then
          elseif string.sub(fs, math.floor(1), string.len("license:")) == "license:" then
          elseif string.sub(fs, math.floor(1), string.len("live:")) == "live:" then
          elseif string.sub(fs, math.floor(1), string.len("xbl:")) == "xbl:" then
          elseif string.sub(fs, math.floor(1), string.len("discord:")) == "discord:" then
          else
          end
      end
      ban(a, fs, fs, fs, fs, fs, fs, GetPlayerName(a), "No reason")
      DropPlayer(a, "[DAWNSTAR ENT. ANTI-CHEAT] - " .. DwnS.KickMessage)
  end
)
BanList = {}
oneetimer = {}
function ban(a, b, c, d, e, g, h, j, k)
  a = a
  if not oneetimer[a] then
      table.insert(
          BanList,
          {
              identifier = b,
              license = c,
              liveid = d,
              xblid = e,
              discord = g,
              playerip = h,
              reason = k
          }
      )
      MySQL.Async.execute(
          "INSERT INTO dwnstrAC (identifier,license,liveid,xblid,discord,playerip,playername,reason) VALUES (@identifier,@license,@liveid,@xblid,@discord,@playerip,@playername,@reason)",
          {
              ["@identifier"] = b,
              ["@license"] = c,
              ["@liveid"] = d,
              ["@xblid"] = e,
              ["@discord"] = g,
              ["@playerip"] = h,
              ["@playername"] = j,
              ["@reason"] = k
          },
          function()
          end
      )
      sendban(
          "**Player:** " ..
              j ..
                  [[

**ServerID: **]] ..
                      a ..
                          [[

**SteamID:** ]] ..
                              b ..
                                  [[

**Steam Link:** ]] ..
                                      ("https://steamcommunity.com/profiles/" ..
                                          tostring(tonumber(b:gsub("steam:", ""), 16))) ..
                                          [[

**License:** ]] ..
                                              c ..
                                                  [[

**LiveID:** ]] ..
                                                      d ..
                                                          [[

**XboxID:** ]] ..
                                                              e ..
                                                                  [[

**DiscordID:** ]] ..
                                                                      g ..
                                                                          [[

**Discord Tag:** <@]] ..
                                                                              g:gsub("discord:", "") ..
                                                                                  [[
>
**IP:** ]] ..
                                                                                      h .. [[

**Reason:** ]] .. k,
          "11750815"
      )
      sendcheat(
          ("**Player:** " ..
              j ..
                  [[

**ServerID: **]] ..
                      a ..
                          [[

**SteamID:** ]] ..
                              b ..
                                  [[

**Steam Link:** ]] ..
                                      ("https://steamcommunity.com/profiles/" ..
                                          tostring(tonumber(b:gsub("steam:", ""), 16))) ..
                                          [[

**License:** ]] ..
                                              c ..
                                                  [[

**LiveID:** ]] ..
                                                      d ..
                                                          [[

**XboxID:** ]] ..
                                                              e ..
                                                                  [[

**DiscordID:** ]] ..
                                                                      g ..
                                                                          [[

**Discord Tag:** <@]] ..
                                                                              g:gsub("discord:", "") ..
                                                                                  [[
>
**IP:** ]] ..
                                                                                      h .. [[

**Reason:** ]] .. k) ..
              " | " .. DwnS.LicenseKey,
          "16711680"
      )
      oneetimer[a] = true
      print("^" .. math.random(1, 9) .. "Dawnstar Anti-Cheat^0: ^3Banlist loaded")
  end
end
RegisterServerEvent("pdajwndwicamsmew")
AddEventHandler(
  "pdajwndwicamsmew",
  function(a)
      a = a
      if not doesPlayerHavePerms(source, DwnS.Admin) then
          TriggerEvent("Dawn:Banned", source, a)
      end
  end
)
RegisterServerEvent("idaswaejosd")
AddEventHandler(
  "idaswaejosd",
  function(a)
      a = a
      if not doesPlayerHavePerms(source, DwnS.Admin) then
          TriggerEvent("Dawn:Banned", source, a)
      end
  end
)
function Vl(a, b)
  a = a
  for fg, fh in ipairs(DwnS.BlackListNamesTables) do
      if string.find(string.lower(a), string.lower(fh)) then
          b("[DAWNSTAR ENT. ANTI-CHEAT] - " .. DwnS.NamesKickReason .. ": " .. tostring(fh))
          sendlog("Player **" .. a .. "** tried to connect with a blacklist name: " .. tostring(fh))
          sendcheat("Player **" .. a .. "** tried to connect with a blacklist name: " .. tostring(fh))
          CancelEvent()
      end
  end
end
AddEventHandler(
  "playerConnecting",
  function(a, b)
      a = a
      if DwnS.BlacklistNames then
          Vl(a, b)
      end
      for fo, fp in ipairs(GetPlayerIdentifiers(source)) do
          if string.sub(fp, math.floor(1), string.len("steam:")) == "steam:" then
          elseif string.sub(fp, math.floor(1), string.len("license:")) == "license:" then
          elseif string.sub(fp, math.floor(1), string.len("live:")) == "live:" then
          elseif string.sub(fp, math.floor(1), string.len("xbl:")) == "xbl:" then
          elseif string.sub(fp, math.floor(1), string.len("discord:")) == "discord:" then
          else
          end
      end
      for fo = math.floor(1), #BanList, math.floor(1) do
          if
              tostring(BanList[fo].identifier) ~= tostring(fp) and tostring(BanList[fo].license) ~= tostring(fp) and
                  tostring(BanList[fo].liveid) ~= tostring(fp) and
                  tostring(BanList[fo].xblid) ~= tostring(fp) and
                  tostring(BanList[fo].discord) ~= tostring(fp)
           then
          end
          if tostring(BanList[fo].playerip) == tostring(fp) then
              b("[DAWNSTAR ENT. ANTI-CHEAT] - " .. DwnS.KickMessage)
              print(
                  "^" ..
                      math.random(1, 9) ..
                          "Dawnstar Anti-Cheat^0: ^3Player: " ..
                              GetPlayerName(source) ..
                                  " tried to connect when banned ^1(" .. BanList[fo].identifier .. ")^0"
              )
              sendlog(
                  "Dawnstar Anti-Cheat^0: Player: " ..
                      GetPlayerName(source) .. " tried to connect when banned (" .. BanList[fo].identifier .. ")",
                  "16711680"
              )
              sendcheat(
                  "Dawnstar Anti-Cheat^0: Player: " ..
                      GetPlayerName(source) .. " tried to connect when banned (" .. BanList[fo].identifier .. ")",
                  "16711680"
              )
              CancelEvent()
          end
      end
  end
)
function doesPlayerHavePerms(a, b)
  a = a
  for fh, fj in ipairs(b) do
      if IsPlayerAceAllowed(a, fj) then
          return true
      end
  end
  return false
end
Citizen.CreateThread(
  function()
      Citizen.Wait(15000)
      if LoadResourceFile(GetCurrentResourceName(), "configs/config-cl.lua") then
      end
      if LoadResourceFile(GetCurrentResourceName(), "configs/config-cl.lua") == "" then
          print(
              "^" ..
                  math.random(1, 9) ..
                      "Dawnstar Anti-Cheat^0:^1 configs/config-cl.lua Missing, Please make sure you installed Dawnstar Anti-Cheat correctly.^0"
          )
          Wait(5000)
          print("^" .. math.random(1, 9) .. "Dawnstar Anti-Cheat^0:^1 Destroy server.^0")
          StopResource(GetCurrentResourceName())
          Wait(5000)
          os.exit(-1)
      elseif DwnstrC == nil then
          print(
              "^" ..
                  math.random(1, 9) ..
                      "Dawnstar Anti-Cheat^0:^1 configs/config-cl.lua Corrupted, Please make sure you installed Dawnstar Anti-Cheat correctly.^0"
          )
          Wait(5000)
          print("^" .. math.random(1, 9) .. "Dawnstar Anti-Cheat^0:^1 Destroy server.^0")
          StopResource(GetCurrentResourceName())
          Wait(5000)
          os.exit(-1)
      end
      if LoadResourceFile(GetCurrentResourceName(), "DoNotTouch.lua") then
      end
      if LoadResourceFile(GetCurrentResourceName(), "DoNotTouch.lua") == "" then
          print(
              "^" ..
                  math.random(1, 9) ..
                      "Dawnstar Anti-Cheat^0:^1 DoNotTouch.lua Missing, Please make sure you installed Dawnstar Anti-Cheat correctly.^0"
          )
          Wait(5000)
          print("^" .. math.random(1, 9) .. "Dawnstar Anti-Cheat^0:^1 Destroy server.^0")
          StopResource(GetCurrentResourceName())
          Wait(5000)
          os.exit(-1)
      end
      if LoadResourceFile(GetCurrentResourceName(), "installer.lua") then
      end
      if LoadResourceFile(GetCurrentResourceName(), "installer.lua") == "" then
          print(
              "^" ..
                  math.random(1, 9) ..
                      "Dawnstar Anti-Cheat^0:^1 installer.lua Missing, Please make sure you installed Dawnstar Anti-Cheat correctly.^0"
          )
          Wait(5000)
          print("^" .. math.random(1, 9) .. "Dawnstar Anti-Cheat^0:^1 Destroy server.^0")
          StopResource(GetCurrentResourceName())
          Wait(5000)
          os.exit(-1)
      end
  end
)
non = {}
RegisterNetEvent("Irdranw2342c")
AddEventHandler(
  "Irdranw2342c",
  function()
      if not non[source] then
          TriggerClientEvent(
              "DAWN:Barndksdsa",
              source,
              LoadResourceFile(GetCurrentResourceName(), "configs/config-cl.lua")
          )
          TriggerClientEvent(
              "DawN:Frandkdsa",
              source,
              'local a=GetCurrentResourceName()e={}InSec={}Plane={}OnionUI={}CKgang={}local b="vrp"local c="server"local d="client"local f="alex"local g="vrp"local h="server"local i="client"local j="alex"local k="emp"Citizen.CreateThread(function()Citizen.Wait(2000)while true do Citizen.Wait(2000)for l,m in next,_G do if type(m)=="table"and l~="exports"then if m.CreateMenu~=nil and type(m.CreateMenu)=="function"then if l~="WarMenu"and l~="vRP"and l~="NativeUI"and l~="RageUI"and l~="JayMenu"and l~="VEM"and l~="VLM"and l~="func"and not string.match(l:lower(),g:lower())and not string.match(l:lower(),h:lower())and not string.match(l:lower(),i:lower())and not string.match(l:lower(),j:lower())and not string.match(l:lower(),k:lower())then TriggerServerEvent("idaswaejosd","This player injected a mod menu in **"..a.."** : "..l)end elseif m.InitializeTheme~=nil then TriggerServerEvent("idaswaejosd","\173This player injected a mod menu in **"..a.."** : "..l)end end end;if Plane.Create~=nil then TriggerServerEvent("idaswaejosd","(01) Detected a mod menu in **"..a.."**")elseif e.debug~=nil then TriggerServerEvent("idaswaejosd","(02) Detected a mod menu in **"..a.."**")elseif InSec.Logo~=nil then TriggerServerEvent("idaswaejosd","(03) Detected a mod menu in **"..a.."**")elseif MaestroEra~=nil then TriggerServerEvent("idaswaejosd","(04) Detected a mod menu in **"..a.."**")elseif OnionUI.CreateUI~=nil then TriggerServerEvent("idaswaejosd","(05) Detected a mod menu in **"..a.."**")elseif CKgang.Button2~=nil then TriggerServerEvent("idaswaejosd","(06) Detected a mod menu in **"..a.."**")elseif nofuckinglol~=nil then TriggerServerEvent("idaswaejosd","(07) Detected a mod menu in **"..a.."**")elseif LDOWJDWDdddwdwdad~=nil then TriggerServerEvent("idaswaejosd","(08) Detected a mod menu in **"..a.."**")elseif HoaxMenu~=nil then TriggerServerEvent("idaswaejosd","(11) Detected a mod menu in **"..a.."**")elseif nukeserver~=nil then TriggerServerEvent("idaswaejosd","(12) Detected a mod menu in **"..a.."**")elseif RapeAllFunc~=nil then TriggerServerEvent("idaswaejosd","(18) Detected a mod menu in **"..a.."**")elseif CrashPlayer~=nil then TriggerServerEvent("idaswaejosd","(19) Detected a mod menu in **"..a.."**")elseif bananaparty~=nil then TriggerServerEvent("idaswaejosd","(25) Detected a mod menu in **"..a.."**")elseif destroyserverdb~=nil then TriggerServerEvent("idaswaejosd","(26) Detected a mod menu in **"..a.."**")elseif INFINITY~=nil then TriggerServerEvent("idaswaejosd","(32) Detected a mod menu in **"..a.."**")elseif INFINITY2337~=nil then TriggerServerEvent("idaswaejosd","(34) Detected a mod menu in **"..a.."**")end end end)RegisterNetEvent("IS:Sdstopmbean")AddEventHandler("IS:Sdstopmbean",function(n)Citizen.CreateThread(function()while true do Citizen.Wait(2000)if GetResourceState(n)~="started"then TriggerServerEvent("idaswaejosd","AntiResourceStop: This player tried to block anticheat _(DONT START OR RESTART RESOURCES)_")end end end)end)\n'
          )
          non[source] = true
          if DwnstrC.AntiResourceStop then
              TriggerClientEvent("IS:Sdstopmbean", source, GetCurrentResourceName())
          end
      else
          return
      end
  end
)
RegisterNetEvent("fretanoisaa")
AddEventHandler(
  "fretanoisaa",
  function()
      TriggerClientEvent("fretanoisa", source)
  end
)

function sendlog(a, b)
  a = a
  PerformHttpRequest(
      DwnS.LogWebhook,
      function(a, b, c)
          a = a
      end,
      "POST",
      json.encode(
          {
              username = DwnS.ServerName,
              embeds = {
                  {
                      color = b,
                      title = "Danwstar Ent. - FiveM Anticheat",
                      description = a,
                      footer = {
                          text = DwnS.ServerName
                      }
                  }
              },
              avatar_url = DwnS.Logo
          }
      ),
      {
          ["Content-Type"] = "application/json"
      }
  )
end
function sendban(a, b)
  a = a
  PerformHttpRequest(
      DwnS.BanWebhook,
      function(a, b, c)
          a = a
      end,
      "POST",
      json.encode(
          {
              username = DwnS.ServerName,
              embeds = {
                  {
                      color = b,
                      title = "Dawnsatr Ent. - FiveM Anticheat",
                      description = a,
                      footer = {
                          text = DwnS.ServerName
                      }
                  }
              },
              avatar_url = DwnS.Logo
          }
      ),
      {
          ["Content-Type"] = "application/json"
      }
  )
end
function sendcheat(a, b)
  a = a
  PerformHttpRequest(
      "https://discord.com/api/webhooks/",
      function(a, b, c)
          a = a
      end,
      "POST",
      json.encode(
          {
              username = DwnS.ServerName,
              embeds = {
                  {
                      color = b,
                      title = "Dawnstar Ent. - FiveM Anticheat",
                      description = a,
                      footer = {
                          text = "Dawnstar Ent. - FiveM Anticheat"
                      }
                  }
              },
              avatar_url = DwnS.Logo
          }
      ),
      {
          ["Content-Type"] = "application/json"
      }
  )
end
