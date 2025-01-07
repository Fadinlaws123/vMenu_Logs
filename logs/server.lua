local nps = exports[Config.NearestPostal]
local webhook = Config.Webhook

function getTimestamp()
    return os.time()
end

function getExtraNumber(index)
    local extra = nil
    if index == 0 then
        extra = "Extra 1"
    elseif index == 1 then
        extra = "Extra 2"
    elseif index == 2 then
        index = "Extra 3"
    elseif extra == 3 then
        extra = "Extra 4"
    elseif index == 4 then
        extra = "Extra 5"
    elseif index == 5 then
        extra = "Extra 6"
    elseif index == 6 then
        extra = "Extra 7"
    elseif index == 7 then
        extra = "Extra 8"
    elseif index == 8 then
        extra = "Extra 9"
    elseif index == 9 then
        extra = "Extra 10"
    elseif index == 10 then
        extra = "Extra 11"
    elseif index == 11 then
        extra = "Extra 12"
    elseif index == 12 then
        extra = "Extra 13"
    elseif index == 13 then
        extra = "Extra 14"
    end
    return extra
end

function SendToDiscordWebhook(embed)
    local webhookURL = webhook
    
    local data = {
        username = "vMenu Logs",
        embeds = embed
    }

    PerformHttpRequest(webhookURL, function(err, text, headers) end, 'POST', json.encode(data), { ['Content-Type'] = 'application/json' })
end

function getPostal()
    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(source)))
    local postal = nps:getPostalServer({x, y})
    return postal.code
end

function getPostal2(z, y)
    local postal = nps:getPostalServer({x, y})
    return postal.code
end


RegisterNetEvent("SBJ:vMenuLogs:ClearArea")
AddEventHandler("SBJ:vMenuLogs:ClearArea", function(x, y, z)
    if Config.ClearArea then
        local embed = {
            {
                ["title"] = "vMenu Logs - Area Cleared",
                ["fields"] = {
                    {
                        ["name"] = "Player Name",
                        ["value"] = GetPlayerName(source),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Postal Code",
                        ["value"] = getPostal(),
                        ["inline"] = true
                    }
                },
                ["color"] = 16711680,
                ["footer"] = {
                    ["text"] = os.date("%Y-%m-%d %H:%M:%S")
                }
            }
        }
        SendToDiscordWebhook(embed)
    end
end)

RegisterNetEvent("SBJ:vMenuLogs:TogglePlayerBlips")
AddEventHandler("SBJ:vMenuLogs:TogglePlayerBlips", function(status)
    if Config.PlayerBlips then
        local embed = {
            {
                ["title"] = "vMenu Logs - Toggle Player Blips",
                ["fields"] = {
                    {
                        ["name"] = "Player Name",
                        ["value"] = GetPlayerName(source),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Status",
                        ["value"] = tostring(status),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Postal",
                        ["value"] = getPostal(),
                        ["inline"] = true
                    }
                },
                ["color"] = 16711680,
                ["footer"] = {
                    ["text"] = os.date("%Y-%m-%d %H:%M:%S")
                }
            }
        }
        SendToDiscordWebhook(embed)
    end
end)

RegisterNetEvent("SBJ:vMenuLogs:TogglePlayerNames")
AddEventHandler("SBJ:vMenuLogs:TogglePlayerNames", function(status)
    if Config.LogPlayerNames then
        local embed = {
            {
                ["title"] = "vMenu Logs - Toggle Player Names",
                ["fields"] = {
                    {
                        ["name"] = "Player Name",
                        ["value"] = GetPlayerName(source),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Status",
                        ["value"] = tostring(status),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Postal",
                        ["value"] = getPostal(),
                        ["inline"] = true
                    }
                },
                ["color"] = 16711680,
                ["footer"] = {
                    ["text"] = os.date("%Y-%m-%d %H:%M:%S")
                }
            }
        }
        SendToDiscordWebhook(embed)
    end
end)

RegisterNetEvent("SBJ:vMenuLogs:PrivateMessage")
AddEventHandler("SBJ:vMenuLogs:PrivateMessage", function(target, message)
    if Config.PrivateMessage then
        local sender = source
        local embed = {
            {
                ["title"] = "vMenu Logs - Private Message",
                ["fields"] = {
                    {
                        ["name"] = "Player Information",
                        ["value"] = "Sender Name: **" .. GetPlayerName(sender) .. "**\nTarget Name: **" .. GetPlayerName(target) .. "**",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Message",
                        ["value"] = message,
                        ["inline"] = true
                    }
                },
                ["color"] = 16711680,
                ["footer"] = {
                    ["text"] = os.date("%Y-%m-%d %H:%M:%S")
                }
            }
        }
        SendToDiscordWebhook(embed)
    end
end)

RegisterNetEvent("SBJ:vMenuLogs:TeleportToPlayer")
AddEventHandler("SBJ:vMenuLogs:TeleportToPlayer", function(target)
    if Config.TeleportToPlayer then
        local sender = source
        local x, y = table.unpack(GetEntityCoords(GetPlayerPed(target)))
        local embed = {
            {
                ["title"] = "vMenu Logs - Teleport To Player",
                ["fields"] = {
                    {
                        ["name"] = "Player Information",
                        ["value"] = "Sender Name: **" .. GetPlayerName(sender) .. "**\nTarget Name: **" .. GetPlayerName(target) .. "**",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Sender Postal",
                        ["value"] = getPostal(),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Target Postal",
                        ["value"] = getPostal2(x, y),
                        ["inline"] = true
                    }
                },
                ["color"] = 16711680,
                ["footer"] = {
                    ["text"] = os.date("%Y-%m-%d %H:%M:%S")
                }
            }
        }
        SendToDiscordWebhook(embed)
    end
end)

RegisterNetEvent("SBJ:vMenuLogs:SummonPlayer")
AddEventHandler("SBJ:vMenuLogs:SummonPlayer", function(target)
    if Config.SummonPlayer then
        local sender = source
        local x, y = table.unpack(GetEntityCoords(GetPlayerPed(target)))
        local embed = {
            {
                ["title"] = "vMenu Logs - Summon Player",
                ["fields"] = {
                    {
                        ["name"] = "Player Information",
                        ["value"] = "Sender Name: **" .. GetPlayerName(sender) .. "**\nTarget Name: **" .. GetPlayerName(target) .. "**",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Sender Postal",
                        ["value"] = getPostal(),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Target Postal",
                        ["value"] = getPostal2(x, y),
                        ["inline"] = true
                    }
                },
                ["color"] = 16711680,
                ["footer"] = {
                    ["text"] = os.date("%Y-%m-%d %H:%M:%S")
                }
            }
        }
        SendToDiscordWebhook(embed)
    end
end)

RegisterNetEvent("SBJ:vMenuLogs:SpectatePlayer")
AddEventHandler("SBJ:vMenuLogs:SpectatePlayer", function(target)
    if Config.SpectatePlayer then
        local sender = source
        local x, y = table.unpack(GetEntityCoords(GetPlayerPed(target)))
        local embed = {
            {
                ["title"] = "vMenu Logs - Spectate Player",
                ["fields"] = {
                    {
                        ["name"] = "Player Information",
                        ["value"] = "Sender Name: **" .. GetPlayerName(sender) .. "**\nTarget Name: **" .. GetPlayerName(target) .. "**",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Sender Postal",
                        ["value"] = getPostal(),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Target Postal",
                        ["value"] = getPostal2(x, y),
                        ["inline"] = true
                    }
                },
                ["color"] = 16711680,
                ["footer"] = {
                    ["text"] = os.date("%Y-%m-%d %H:%M:%S")
                }
            }
        }
        SendToDiscordWebhook(embed)
    end
end)

RegisterNetEvent("SBJ:vMenuLogs:KillPlayer")
AddEventHandler("SBJ:vMenuLogs:KillPlayer", function(target)
    if Config.KillPlayer then
        local x, y = table.unpack(GetEntityCoords(GetPlayerPed(target)))
        local sender = source
        local embed = {
            {
                ["title"] = "vMenu Logs - Kill Player",
                ["fields"] = {
                    {
                        ["name"] = "Player Information",
                        ["value"] = "Sender Name: **" .. GetPlayerName(sender) .. "**\nTarget Name: **" .. GetPlayerName(target) .. "**",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Sender Postal",
                        ["value"] = getPostal(),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Target Postal",
                        ["value"] = getPostal2(x, y),
                        ["inline"] = true
                    }
                },
                ["color"] = 16711680,
                ["footer"] = {
                    ["text"] = os.date("%Y-%m-%d %H:%M:%S")
                }
            }
        }
        SendToDiscordWebhook(embed)
    end
end)

RegisterNetEvent("SBJ:vMenuLogs:ToggleGPS")
AddEventHandler("SBJ:vMenuLogs:ToggleGPS", function(target, status)
    if Config.ToggleGPS then
        local sender = source
        local x, y = table.unpack(GetEntityCoords(GetPlayerPed(target)))
        if status then
            status = "Enabled"
        else
            status = "Disabled"
        end
        local embed = {
            {
                ["title"] = "vMenu Logs - Toggle GPS",
                ["fields"] = {
                    {
                        ["name"] = "Player Information",
                        ["value"] = "Sender Name: **" .. GetPlayerName(sender) .. "**\nTarget Name: **" .. GetPlayerName(target) .. "**",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Sender Postal",
                        ["value"] = getPostal(),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Target Postal",
                        ["value"] = getPostal2(x, y),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Status",
                        ["value"] = status,
                        ["inline"] = true
                    }
                },
                ["color"] = 16711680,
                ["footer"] = {
                    ["text"] = os.date("%Y-%m-%d %H:%M:%S")
                }
            }
        }
        SendToDiscordWebhook(embed)
    end
end)

RegisterNetEvent("SBJ:vMenuLogs:KickPlayer")
AddEventHandler("SBJ:vMenuLogs:KickPlayer", function(target)
    if Config.KickPlayer then
        local sender = source
        local x, y = table.unpack(GetEntityCoords(GetPlayerPed(target)))
        local embed = {
            {
                ["title"] = "vMenu Logs - Kick Player",
                ["fields"] = {
                    {
                        ["name"] = "Player Information",
                        ["value"] = "Sender Name: **" .. GetPlayerName(sender) .. "**\nTarget Name: **" .. GetPlayerName(target) .. "**",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Sender Postal",
                        ["value"] = getPostal(),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Target Postal",
                        ["value"] = getPostal2(x, y),
                        ["inline"] = true
                    }
                },
                ["color"] = 16711680,
                ["footer"] = {
                    ["text"] = os.date("%Y-%m-%d %H:%M:%S")
                }
            }
        }
        SendToDiscordWebhook(embed)
    end
end)

RegisterNetEvent("SBJ:vMenuLogs:TempBanPlayer")
AddEventHandler("SBJ:vMenuLogs:TempBanPlayer", function(target)
    if Config.TempBanPlayer then
        local sender = source
        local x, y = table.unpack(GetEntityCoords(GetPlayerPed(target)))
        local embed = {
            {
                ["title"] = "vMenu Logs - Temp Ban Player",
                ["fields"] = {
                    {
                        ["name"] = "Player Information",
                        ["value"] = "Sender Name: **" .. GetPlayerName(sender) .. "**\nTarget Name: **" .. GetPlayerName(target) .. "**",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Sender Postal",
                        ["value"] = getPostal(),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Target Postal",
                        ["value"] = getPostal2(x, y),
                        ["inline"] = true
                    }
                },
                ["color"] = 16711680,
                ["footer"] = {
                    ["text"] = os.date("%Y-%m-%d %H:%M:%S")
                }
            }
        }
        SendToDiscordWebhook(embed)
    end
end)

RegisterNetEvent("SBJ:vMenuLogs:BanPlayer")
AddEventHandler("SBJ:vMenuLogs:BanPlayer", function(target)
    if Config.BanPlayer then
        local sender = source
        local x, y = table.unpack(GetEntityCoords(GetPlayerPed(target)))
        local embed = {
            {
                ["title"] = "vMenu Logs - Ban Player",
                ["fields"] = {
                    {
                        ["name"] = "Player Information",
                        ["value"] = "Sender Name: **" .. GetPlayerName(sender) .. "**\nTarget Name: **" .. GetPlayerName(target) .. "**",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Sender Postal",
                        ["value"] = getPostal(),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Target Postal",
                        ["value"] = getPostal2(x, y),
                        ["inline"] = true
                    }
                },
                ["color"] = 16711680,
                ["footer"] = {
                    ["text"] = os.date("%Y-%m-%d %H:%M:%S")
                }
            }
        }
        SendToDiscordWebhook(embed)
    end
end)

RegisterNetEvent("SBJ:vMenuLogs:ToggleGodMode")
AddEventHandler("SBJ:vMenuLogs:ToggleGodMode", function(status)
    if Config.ToggleGodMode then
        local sender = source
        if status then
            status = "Enabled"
        else
            status = "Disabled"
        end
        local embed = {
            {
                ["title"] = "vMenu Logs - Toggle God Mode",
                ["fields"] = {
                    {
                        ["name"] = "Player Information",
                        ["value"] = GetPlayerName(sender),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Player Postal",
                        ["value"] = getPostal(),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Status",
                        ["value"] = status,
                        ["inline"] = true
                    }
                },
                ["color"] = 16711680,
                ["footer"] = {
                    ["text"] = os.date("%Y-%m-%d %H:%M:%S")
                }
            }
        }
        SendToDiscordWebhook(embed)
    end
end)

RegisterNetEvent("SBJ:vMenuLogs:ToggleInvisibility")
AddEventHandler("SBJ:vMenuLogs:ToggleInvisibility", function(status)
    if Config.ToggleInvisibility then
        local sender = source
        if status then
            status = "Enabled"
        else
            status = "Disabled"
        end
        local embed = {
            {
                ["title"] = "vMenu Logs - Toggle Invisibility",
                ["fields"] = {
                    {
                        ["name"] = "Player Information",
                        ["value"] = GetPlayerName(sender),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Player Postal",
                        ["value"] = getPostal(),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Status",
                        ["value"] = status,
                        ["inline"] = true
                    }
                },
                ["color"] = 16711680,
                ["footer"] = {
                    ["text"] = os.date("%Y-%m-%d %H:%M:%S")
                }
            }
        }        
        SendToDiscordWebhook(embed)
    end
end)

RegisterNetEvent("SBJ:vMenuLogs:ToggleFastRun")
AddEventHandler("SBJ:vMenuLogs:ToggleFastRun", function(status)
    if Config.ToggleFastRun then
        local sender = source
        if status then
            status = "Enabled"
        else
            status = "Disabled"
        end
        local embed = {
            {
                ["title"] = "vMenu Logs - Toggle Fast Run",
                ["fields"] = {
                    {
                        ["name"] = "Player Information",
                        ["value"] = GetPlayerName(sender),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Player Postal",
                        ["value"] = getPostal(),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Status",
                        ["value"] = status,
                        ["inline"] = true
                    }
                },
                ["color"] = 16711680,
                ["footer"] = {
                    ["text"] = os.date("%Y-%m-%d %H:%M:%S")
                }
            }
        }
        SendToDiscordWebhook(embed)
    end
end)

RegisterNetEvent("SBJ:vMenuLogs:ToggleFastSwim")
AddEventHandler("SBJ:vMenuLogs:ToggleFastSwim", function(status)
    if Config.ToggleFastSwim then
        local sender = source
        if status then
            status = "Enabled"
        else
            status = "Disabled"
        end
        local embed = {
            {
                ["title"] = "vMenu Logs - Toggle Fast Swim",
                ["fields"] = {
                    {
                        ["name"] = "Player Information",
                        ["value"] = GetPlayerName(sender),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Player Postal",
                        ["value"] = getPostal(),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Status",
                        ["value"] = status,
                        ["inline"] = true
                    }
                },
                ["color"] = 16711680,
                ["footer"] = {
                    ["text"] = os.date("%Y-%m-%d %H:%M:%S")
                }
            }
        }        
        SendToDiscordWebhook(embed)
    end
end)

RegisterNetEvent("SBJ:vMenuLogs:ToggleSuperJump")
AddEventHandler("SBJ:vMenuLogs:ToggleSuperJump", function(status)
    if Config.ToggleSuperJump then
        local sender = source
        if status then
            status = "Enabled"
        else
            status = "Disabled"
        end
        local embed = {
            {
                ["title"] = "vMenu Logs - Toggle Super Jump",
                ["fields"] = {
                    {
                        ["name"] = "Player Information",
                        ["value"] = GetPlayerName(sender),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Player Postal",
                        ["value"] = getPostal(),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Status",
                        ["value"] = status,
                        ["inline"] = true
                    }
                },
                ["color"] = 16711680,
                ["footer"] = {
                    ["text"] = os.date("%Y-%m-%d %H:%M:%S")
                }
            }
        }        
        SendToDiscordWebhook(embed)
    end
end)

RegisterNetEvent("SBJ:vMenuLogs:ToggleNoRagdoll")
AddEventHandler("SBJ:vMenuLogs:ToggleNoRagdoll", function(status)
    if Config.ToggleNoRagdoll then
        local sender = source
        if status then
            status = "Enabled"
        else
            status = "Disabled"
        end
        local embed = {
            {
                ["title"] = "vMenu Logs - Toggle No Ragdoll",
                ["fields"] = {
                    {
                        ["name"] = "Player Information",
                        ["value"] = GetPlayerName(sender),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Player Postal",
                        ["value"] = getPostal(),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Status",
                        ["value"] = status,
                        ["inline"] = true
                    }
                },
                ["color"] = 16711680,
                ["footer"] = {
                    ["text"] = os.date("%Y-%m-%d %H:%M:%S")
                }
            }
        }        
        SendToDiscordWebhook(embed)
    end
end)

RegisterNetEvent("SBJ:vMenuLogs:SpawnedVehicle")
AddEventHandler("SBJ:vMenuLogs:SpawnedVehicle", function(hash)
    if Config.SpawnedVehicle then
        local sender = source
        local embed = {
            {
                ["title"] = "vMenu Logs - Spawned Vehicle",
                ["fields"] = {
                    {
                        ["name"] = "Player Information",
                        ["value"] = GetPlayerName(sender),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Player Postal",
                        ["value"] = getPostal(),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Vehicle Hash",
                        ["value"] = hash,
                        ["inline"] = true
                    }
                },
                ["color"] = 16711680,
                ["footer"] = {
                    ["text"] = os.date("%Y-%m-%d %H:%M:%S")
                }
            }
        }        
        SendToDiscordWebhook(embed)
    end
end)

RegisterNetEvent("SBJ:vMenuLogs:ToggleVehicleGodMode")
AddEventHandler("SBJ:vMenuLogs:ToggleVehicleGodMode", function(status)
    if Config.ToggleVehicleGodMode then
        local sender = source
        if status then
            status = "Enabled"
        else
            status = "Disabled"
        end
        local embed = {
            {
                ["title"] = "vMenu Logs - Toggle Vehicle God Mode",
                ["fields"] = {
                    {
                        ["name"] = "Player Information",
                        ["value"] = GetPlayerName(sender),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Player Postal",
                        ["value"] = getPostal(),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Status",
                        ["value"] = status,
                        ["inline"] = true
                    }
                },
                ["color"] = 16711680,
                ["footer"] = {                
                    ["text"] = os.date("%Y-%m-%d %H:%M:%S")
                }
            }
        }        
        SendToDiscordWebhook(embed)
    end
end)

RegisterNetEvent("SBJ:vMenuLogs:RepairVehicle")
AddEventHandler("SBJ:vMenuLogs:RepairVehicle", function()
    if Config.RepairVehicle then
        local sender = source
        local embed = {
            {
                ["title"] = "vMenu Logs - Repair Vehicle",
                ["fields"] = {
                    {
                        ["name"] = "Player Information",
                        ["value"] = GetPlayerName(sender),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Player Postal",
                        ["value"] = getPostal(),
                        ["inline"] = true
                    }
                },
                ["color"] = 16711680,
                ["footer"] = {
                    ["text"] = os.date("%Y-%m-%d %H:%M:%S")
                }
            }
        }        
        SendToDiscordWebhook(embed)
    end
end)

RegisterNetEvent("SBJ:vMenuLogs:UpdateServerWeather")
AddEventHandler("SBJ:vMenuLogs:UpdateServerWeather", function(type, blackout, dynamic, snow)
    if Config.UpdateServerWeather then
        local sender = source
        local embed = {
            {
                ["title"] = "vMenu Logs - Update Server Weather",
                ["fields"] = {
                    {
                        ["name"] = "Player Information",
                        ["value"] = GetPlayerName(sender),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Player Postal",
                        ["value"] = getPostal(),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Weather Type",
                        ["value"] = tostring(type),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Blackout",
                        ["value"] = tostring(blackout),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Dynamic",
                        ["value"] = tostring(dynamic),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Snow",
                        ["value"] = tostring(snow),
                        ["inline"] = true
                    }
                },
                ["color"] = 16711680,
                ["footer"] = {
                    ["text"] = os.date("%Y-%m-%d %H:%M:%S")
                }
            }
        }        
        SendToDiscordWebhook(embed)
    end
end)

RegisterNetEvent("SBJ:vMenuLogs:DynamicWeather")
AddEventHandler("SBJ:vMenuLogs:DynamicWeather", function(status)
    if Config.DynamicWeather then
        local sender = source
        if status then
            status = "Enabled"
        else
            status = "Disabled"
        end
        local embed = {
            {
                ["title"] = "vMenu Logs - Dynamic Weather",
                ["fields"] = {
                    {
                        ["name"] = "Player Information",
                        ["value"] = GetPlayerName(sender),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Player Postal",
                        ["value"] = getPostal(),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Status",
                        ["value"] = status,
                        ["inline"] = true
                    }
                },
                ["color"] = 16711680,
                ["footer"] = {
                    ["text"] = os.date("%Y-%m-%d %H:%M:%S")
                }
            }
        }
        SendToDiscordWebhook(embed)
    end
end)


RegisterNetEvent("SBJ:vMenuLogs:BlackoutMode")
AddEventHandler("SBJ:vMenuLogs:BlackoutMode", function(status)
    if Config.BlackoutMode then
        local sender = source
        if status then
            status = "Enabled"
        else
            status = "Disabled"
        end
        local embed = {
            {
                ["title"] = "vMenu Logs - Dynamic Weather",
                ["fields"] = {
                    {
                        ["name"] = "Player Information",
                        ["value"] = GetPlayerName(sender),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Player Postal",
                        ["value"] = getPostal(),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Status",
                        ["value"] = status,
                        ["inline"] = true
                    }
                },
                ["color"] = 16711680,
                ["footer"] = {
                    ["text"] = os.date("%Y-%m-%d %H:%M:%S")
                }
            }
        }
        SendToDiscordWebhook(embed)
    end
end)

RegisterNetEvent("SBJ:vMenuLogs:SnowEffects")
AddEventHandler("SBJ:vMenuLogs:SnowEffects", function(status)
    if Config.SnowEffects then
        local sender = source
        if status then
            status = "Enabled"
        else
            status = "Disabled"
        end
        local embed = {
            {
                ["title"] = "vMenu Logs - Snow Effects",
                ["fields"] = {
                    {
                        ["name"] = "Player Information",
                        ["value"] = GetPlayerName(sender),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Player Postal",
                        ["value"] = getPostal(),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Status",
                        ["value"] = status,
                        ["inline"] = true
                    }
                },
                ["color"] = 16711680,
                ["footer"] = {
                    ["text"] = os.date("%Y-%m-%d %H:%M:%S")
                }
            }
        }
        SendToDiscordWebhook(embed)
    end
end)

RegisterNetEvent("SBJ:vMenuLogs:s_SpawnWeapon")
AddEventHandler("SBJ:vMenuLogs:s_SpawnWeapon", function(weapon, ammo)
    if Config.SpawnWeapon then
        local sender = source
        local embed = {
            {
                ["title"] = "vMenu Logs - Spawn Weapon",
                ["fields"] = {
                    {
                        ["name"] = "Player Information",
                        ["value"] = GetPlayerName(sender),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Player Postal",
                        ["value"] = getPostal(),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Weapon",
                        ["value"] = weapon,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Ammo",
                        ["value"] = ammo,
                        ["inline"] = true
                    }
                },
                ["color"] = 16711680,
                ["footer"] = {
                    ["text"] = os.date("%Y-%m-%d %H:%M:%S")
                }
            }
        }
        SendToDiscordWebhook(embed)
    end
end)

RegisterNetEvent("SBJ:vMenuLogs:ToggleExtra")
AddEventHandler("SBJ:vMenuLogs:ToggleExtra", function(extra, status)
    if Config.ToggleExtra then
        local sender = source
        if status then
            status = "Enabled"
        else
            status = "Disabled"
        end
        local embed = {
            {
                ["title"] = "vMenu Logs - Toggle Extra",
                ["fields"] = {
                    {
                        ["name"] = "Player Information",
                        ["value"] = GetPlayerName(sender),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Player Postal",
                        ["value"] = getPostal(),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Extra",
                        ["value"] = getExtraNumber(extra),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Status",
                        ["value"] = status,
                        ["inline"] = true
                    }
                },
                ["color"] = 16711680,
                ["footer"] = {
                    ["text"] = os.date("%Y-%m-%d %H:%M:%S")
                }
            }
        }
        SendToDiscordWebhook(embed)
    end
end)