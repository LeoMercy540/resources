CNRConfig = {}

CNRConfig.MaxPlayers = GetConvarInt('sv_maxclients', 48) -- Gets max players from config file, default 48
CNRConfig.DefaultSpawn = vector4(-1035.71, -2731.87, 12.86, 0.0)
CNRConfig.UpdateInterval = 5 -- how often to update player data in minutes
CNRConfig.StatusInterval = 5000 -- how often to check hunger/thirst status in ms

CNRConfig.Money = {}
CNRConfig.Money.MoneyTypes = { ['cash'] = 5000, ['bank'] = 0 } -- ['type']=startamount - Add or remove money types for your server (for ex. ['blackmoney']=0), remember once added it will not be removed from the database!
CNRConfig.Money.DontAllowMinus = { 'cash' } -- Money that is not allowed going in minus
CNRConfig.Money.PayCheckTimeOut = 10 -- The time in minutes that it will give the paycheck
CNRConfig.Money.PayCheckSociety = false -- If true paycheck will come from the society account that the player is employed at, requires cnr-bossmenu

CNRConfig.Player = {}
CNRConfig.Player.MaxWeight = 120000 -- Max weight a player can carry (currently 120kg, written in grams)
CNRConfig.Player.MaxInvSlots = 41 -- Max inventory slots for a player

CNRConfig.Server = {} -- General server config
CNRConfig.Server.closed = false -- Set server closed (no one can join except people with ace permission 'cnradmin.join')
CNRConfig.Server.closedReason = "Server Closed" -- Reason message to display when people can't join the server
CNRConfig.Server.uptime = 0 -- Time the server has been up.
CNRConfig.Server.whitelist = false -- Enable or disable whitelist on the server
CNRConfig.Server.pvp = true -- Enable or disable pvp on the server (Ability to shoot other players)
CNRConfig.Server.discord = "" -- Discord invite link
CNRConfig.Server.checkDuplicateLicense = true -- check for duplicate rockstar license on join
CNRConfig.Server.PermissionList = {} -- permission list

CNRConfig.Notify = {}

CNRConfig.Notify.NotificationStyling = {
    group = false, -- Allow notifications to stack with a badge instead of repeating
    position = "right", -- top-left | top-right | bottom-left | bottom-right | top | bottom | left | right | center
    progress = true -- Display Progress Bar
}

-- These are how you define different notification variants
-- The "color" key is background of the notification
-- The "icon" key is the css-icon code, this project uses `Material Icons` & `Font Awesome`
CNRConfig.Notify.VariantDefinitions = {
    success = {
        classes = 'success',
        icon = 'done'
    },
    primary = {
        classes = 'primary',
        icon = 'info'
    },
    error = {
        classes = 'error',
        icon = 'dangerous'
    },
    police = {
        classes = 'police',
        icon = 'local_police'
    },
    ambulance = {
        classes = 'ambulance',
        icon = 'fas fa-ambulance'
    }
}
