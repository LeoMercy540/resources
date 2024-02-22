CNRCore = {}
CNRCore.Config = CNRConfig
CNRCore.Shared = CNRShared
CNRCore.ServerCallbacks = {}
CNRCore.UseableItems = {}

exports('GetCoreObject', function()
    return CNRCore
end)

-- To use this export in a script instead of manifest method
-- Just put this line of code below at the very top of the script
-- local CNRCore = exports['cnr-core']:GetCoreObject()

-- Get permissions on server start

CreateThread(function()
    local result = MySQL.Sync.fetchAll('SELECT * FROM permissions', {})
    if result[1] then
        for k, v in pairs(result) do
            CNRCore.Config.Server.PermissionList[v.license] = {
                license = v.license,
                permission = v.permission,
                optin = true,
            }
        end
    end
end)