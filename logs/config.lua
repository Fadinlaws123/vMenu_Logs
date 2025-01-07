Config = {}

-- Things that are REQUIRED.
Config.NearestPostal = "nearest-postal" -- https://github.com/DevBlocky/nearest-postal/releases/tag/1.5.3
Config.Webhook = ""

-- Here you can Configure what you want and don't want logged, By Default all are enabled.
-- The Things after Config. are the same as the envent names (SBJ:vMenuLogs:EVENTNAME) If you want to change something feel free to
-- Just don't change the event names or the data instide of the functions as it may break the logs :)

-- Misc Menu
Config.ClearArea                = true
Config.PlayerBlipToggle         = true
Config.PlayerNamesToggle        = true

-- Online Players
Config.PrivateMessages          = true
Config.TeleportToPlayer         = true
Config.SummonPlayer             = true
Config.SpectatePlayer           = true
Config.KillPlayer               = true
Config.ToggleGPS                = true
Config.KickPlayer               = true
Config.TempBanPlayer            = true
Config.BanPlayer                = true

-- Player Menu
Config.ToggleGodMode            = true
Config.ToggleInvisibility       = true
Config.ToggleUnlimitedStamina   = true
Config.ToggleFastRun            = true
Config.ToggleFastSwim           = true
Config.ToggleSuperJump          = true
Config.ToggleNoRagdoll          = true
Config.SpawnWeapon              = true

-- Vehicle Menus
Config.SpawnVehicle             = true
Config.ToggleVehicleGodMode     = true
Config.RepairVehicle            = true
Config.ToggleExtra              = true

-- Weather Options
Config.UpdateServerWeather      = true
Config.DynamicWeather           = true
Config.BlackoutMode             = true
Config.SnowEffects              = true