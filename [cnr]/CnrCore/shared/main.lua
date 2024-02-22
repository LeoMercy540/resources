CNRShared = {}

local StringCharset = {}
local NumberCharset = {}

for i = 48,  57 do NumberCharset[#NumberCharset+1] = string.char(i) end
for i = 65,  90 do StringCharset[#StringCharset+1] = string.char(i) end
for i = 97, 122 do StringCharset[#StringCharset+1] = string.char(i) end

CNRShared.RandomStr = function(length)
    if length <= 0 then return '' end
    return CNRShared.RandomStr(length - 1) .. StringCharset[math.random(1, #StringCharset)]
end

CNRShared.RandomInt = function(length)
    if length <= 0 then return '' end
    return CNRShared.RandomInt(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
end

CNRShared.SplitStr = function(str, delimiter)
    local result = { }
    local from = 1
    local delim_from, delim_to = string.find(str, delimiter, from)
    while delim_from do
		result[#result+1] = string.sub(str, from, delim_from - 1)
        from = delim_to + 1
        delim_from, delim_to = string.find(str, delimiter, from)
    end
	result[#result+1] = string.sub(str, from)
    return result
end

CNRShared.Trim = function(value)
	if not value then return nil end
    return (string.gsub(value, '^%s*(.-)%s*$', '%1'))
end

CNRShared.Round = function(value, numDecimalPlaces)
    if not numDecimalPlaces then return math.floor(value + 0.5) end
    local power = 10 ^ numDecimalPlaces
    return math.floor((value * power) + 0.5) / (power)
end

CNRShared.ChangeVehicleExtra = function (vehicle, extra, enable)
	if DoesExtraExist(vehicle, extra) then
		if enable then
			SetVehicleExtra(vehicle, extra, false)
			if not IsVehicleExtraTurnedOn(vehicle, extra) then
				CNRShared.ChangeVehicleExtra(vehicle, extra, enable)
			end
		else
			SetVehicleExtra(vehicle, extra, true)
			if IsVehicleExtraTurnedOn(vehicle, extra) then
				CNRShared.ChangeVehicleExtra(vehicle, extra, enable)
			end
		end
	end
end

CNRShared.SetDefaultVehicleExtras = function (vehicle, config)
    -- Clear Extras
    for i=1,20 do
        if DoesExtraExist(vehicle, i) then
            SetVehicleExtra(vehicle, i, 1)
        end
    end

    for id, enabled in pairs(config) do
        CNRShared.ChangeVehicleExtra(vehicle, tonumber(id), true)
    end
end

CNRShared.StarterItems = {
    ['phone'] = { amount = 1, item = 'phone' },
    ['id_card'] = { amount = 1, item = 'id_card' },
    ['driver_license'] = { amount = 1, item = 'driver_license' },
}

CNRShared.MaleNoGloves = {
    [0] = true, [1] = true, [2] = true, [3] = true, [4] = true, [5] = true, [6] = true, [7] = true, [8] = true, [9] = true, [10] = true, [11] = true, [12] = true, [13] = true, [14] = true, [15] = true, [18] = true, [26] = true, [52] = true, [53] = true, [54] = true, [55] = true, [56] = true, [57] = true, [58] = true, [59] = true, [60] = true, [61] = true, [62] = true, [112] = true, [113] = true, [114] = true, [118] = true, [125] = true, [132] = true
}

CNRShared.FemaleNoGloves = {
    [0] = true, [1] = true, [2] = true, [3] = true, [4] = true, [5] = true, [6] = true, [7] = true, [8] = true, [9] = true, [10] = true, [11] = true, [12] = true, [13] = true, [14] = true, [15] = true, [19] = true, [59] = true, [60] = true, [61] = true, [62] = true, [63] = true, [64] = true, [65] = true, [66] = true, [67] = true, [68] = true, [69] = true, [70] = true, [71] = true, [129] = true, [130] = true, [131] = true, [135] = true, [142] = true, [149] = true, [153] = true, [157] = true, [161] = true, [165] = true
}
