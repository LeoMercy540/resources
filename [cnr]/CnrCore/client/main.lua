CNRCore = {}
CNRCore.PlayerData = {}
CNRCore.Config = CNRConfig
CNRCore.Shared = CNRShared
CNRCore.ServerCallbacks = {}

exports('GetCoreObject', function()
    return CNRCore
end)

-- To use this export in a script instead of manifest method
-- Just put this line of code below at the very top of the script
-- local CNRCore = exports['cnr-core']:GetCoreObject()