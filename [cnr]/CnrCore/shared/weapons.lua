CNRShared = CNRShared or {}
CNRShared.Weapons = {
	-- // WEAPONS
	-- Melee
	[`weapon_unarmed`] 				 = {['name'] = 'weapon_unarmed', 		['label'] = 'Fists', 				['ammotype'] = nil, ['damagereason'] = 'Melee killed / Whacked / Executed / Beat down / Murdered / Battered'},
	[`weapon_dagger`] 				 = {['name'] = 'weapon_dagger', 		['label'] = 'Dagger', 				['ammotype'] = nil,	['damagereason'] = 'Knifed / Stabbed / Eviscerated'},
	[`weapon_bat`] 					 = {['name'] = 'weapon_bat', 			['label'] = 'Bat', 					['ammotype'] = nil,	['damagereason'] = 'Melee killed / Whacked / Executed / Beat down / Murdered / Battered'},
	[`weapon_bottle`] 				 = {['name'] = 'weapon_bottle', 		['label'] = 'Broken Bottle', 		['ammotype'] = nil,	['damagereason'] = 'Knifed / Stabbed / Eviscerated'},
	[`weapon_crowbar`] 				 = {['name'] = 'weapon_crowbar', 		['label'] = 'Crowbar', 				['ammotype'] = nil,	['damagereason'] = 'Melee killed / Whacked / Executed / Beat down / Murdered / Battered'},
	[`weapon_flashlight`] 			 = {['name'] = 'weapon_flashlight', 	['label'] = 'Flashlight', 			['ammotype'] = nil,	['damagereason'] = 'Melee killed / Whacked / Executed / Beat down / Murdered / Battered'},
	[`weapon_golfclub`] 			 = {['name'] = 'weapon_golfclub', 		['label'] = 'Golfclub', 			['ammotype'] = nil,	['damagereason'] = 'Melee killed / Whacked / Executed / Beat down / Murdered / Battered'},
	[`weapon_hammer`] 				 = {['name'] = 'weapon_hammer', 		['label'] = 'Hammer', 				['ammotype'] = nil,	['damagereason'] = 'Melee killed / Whacked / Executed / Beat down / Murdered / Battered'},
	[`weapon_hatchet`] 				 = {['name'] = 'weapon_hatchet', 		['label'] = 'Hatchet', 				['ammotype'] = nil,	['damagereason'] = 'Knifed / Stabbed / Eviscerated'},
	[`weapon_knuckle`] 				 = {['name'] = 'weapon_knuckle', 		['label'] = 'Knuckle', 				['ammotype'] = nil,	['damagereason'] = 'Melee killed / Whacked / Executed / Beat down / Murdered / Battered'},
	[`weapon_knife`] 				 = {['name'] = 'weapon_knife', 			['label'] = 'Knife', 				['ammotype'] = nil,	['damagereason'] = 'Knifed / Stabbed / Eviscerated'},
	[`weapon_machete`] 				 = {['name'] = 'weapon_machete', 		['label'] = 'Machete', 				['ammotype'] = nil,	['damagereason'] = 'Knifed / Stabbed / Eviscerated'},
	[`weapon_switchblade`] 			 = {['name'] = 'weapon_switchblade', 	['label'] = 'Switchblade', 			['ammotype'] = nil,	['damagereason'] = 'Knifed / Stabbed / Eviscerated'},
	[`weapon_nightstick`] 			 = {['name'] = 'weapon_nightstick', 	['label'] = 'Nightstick', 			['ammotype'] = nil,	['damagereason'] = 'Melee killed / Whacked / Executed / Beat down / Murdered / Battered'},
	[`weapon_wrench`] 				 = {['name'] = 'weapon_wrench', 		['label'] = 'Wrench', 				['ammotype'] = nil,	['damagereason'] = 'Melee killed / Whacked / Executed / Beat down / Murdered / Battered'},
	[`weapon_battleaxe`] 			 = {['name'] = 'weapon_battleaxe', 		['label'] = 'Battle Axe', 			['ammotype'] = nil,	['damagereason'] = 'Knifed / Stabbed / Eviscerated'},
	[`weapon_poolcue`] 				 = {['name'] = 'weapon_poolcue', 		['label'] = 'Poolcue', 				['ammotype'] = nil,	['damagereason'] = 'Melee killed / Whacked / Executed / Beat down / Murdered / Battered'},
	[`weapon_briefcase`] 			 = {['name'] = 'weapon_briefcase', 		['label'] = 'Briefcase', 			['ammotype'] = nil,	['damagereason'] = 'Melee killed / Whacked / Executed / Beat down / Murdered / Battered'},
	[`weapon_briefcase_02`] 		 = {['name'] = 'weapon_briefcase_02', 	['label'] = 'Briefcase', 			['ammotype'] = nil,	['damagereason'] = 'Melee killed / Whacked / Executed / Beat down / Murdered / Battered'},
	[`weapon_garbagebag`] 			 = {['name'] = 'weapon_garbagebag', 	['label'] = 'Garbage Bag', 			['ammotype'] = nil,	['damagereason'] = 'Melee killed / Whacked / Executed / Beat down / Murdered / Battered'},
	[`weapon_handcuffs`] 			 = {['name'] = 'weapon_handcuffs', 		['label'] = 'Handcuffs', 			['ammotype'] = nil,	['damagereason'] = 'Melee killed / Whacked / Executed / Beat down / Murdered / Battered'},
	[`weapon_bread`] 				 = {['name'] = 'weapon_bread', 			['label'] = 'Baquette', 			['ammotype'] = nil,	['damagereason'] = 'Melee killed / Whacked / Executed / Beat down / Murdered / Battered'},
	[`weapon_stone_hatchet`] 		 = {['name'] = 'weapon_stone_hatchet', 	['label'] = 'Weapon Stone Hatchet', ['ammotype'] = nil,	['damagereason'] = 'Knifed / Stabbed / Eviscerated'},

    -- Handguns
	[`weapon_pistol`] 				 = {['name'] = 'weapon_pistol', 		['label'] = 'Walther P99', 				['ammotype'] = 'AMMO_PISTOL',	['damagereason'] = 'Pistoled / Blasted / Plugged / Bust a cap in'},
	[`weapon_pistol_mk2`] 			 = {['name'] = 'weapon_pistol_mk2', 	['label'] = 'Pistol Mk II', 			['ammotype'] = 'AMMO_PISTOL',	['damagereason'] = 'Pistoled / Blasted / Plugged / Bust a cap in'},
	[`weapon_combatpistol`] 		 = {['name'] = 'weapon_combatpistol', 	['label'] = 'Combat Pistol', 			['ammotype'] = 'AMMO_PISTOL',	['damagereason'] = 'Pistoled / Blasted / Plugged / Bust a cap in'},
	[`weapon_appistol`] 			 = {['name'] = 'weapon_appistol', 		['label'] = 'AP Pistol', 				['ammotype'] = 'AMMO_PISTOL',	['damagereason'] = 'Pistoled / Blasted / Plugged / Bust a cap in'},
	[`weapon_stungun`] 				 = {['name'] = 'weapon_stungun', 		['label'] = 'Taser', 					['ammotype'] = 'AMMO_STUNGUN',	['damagereason'] = 'Died'},
	[`weapon_pistol50`] 			 = {['name'] = 'weapon_pistol50', 		['label'] = 'Pistol .50 Cal', 			['ammotype'] = 'AMMO_PISTOL',	['damagereason'] = 'Pistoled / Blasted / Plugged / Bust a cap in'},
	[`weapon_snspistol`] 			 = {['name'] = 'weapon_snspistol', 		['label'] = 'SNS Pistol', 				['ammotype'] = 'AMMO_PISTOL',	['damagereason'] = 'Pistoled / Blasted / Plugged / Bust a cap in'},
	[`weapon_snspistol_mk2`] 	     = {['name'] = 'weapon_snspistol_mk2', 	['label'] = 'SNS Pistol MK2', 			['ammotype'] = 'AMMO_PISTOL',	['damagereason'] = 'Pistoled / Blasted / Plugged / Bust a cap in'},
	[`weapon_heavypistol`] 			 = {['name'] = 'weapon_heavypistol', 	['label'] = 'Heavy Pistol', 			['ammotype'] = 'AMMO_PISTOL',	['damagereason'] = 'Pistoled / Blasted / Plugged / Bust a cap in'},
	[`weapon_vintagepistol`] 		 = {['name'] = 'weapon_vintagepistol', 	['label'] = 'Vintage Pistol', 			['ammotype'] = 'AMMO_PISTOL',	['damagereason'] = 'Pistoled / Blasted / Plugged / Bust a cap in'},
	[`weapon_flaregun`] 			 = {['name'] = 'weapon_flaregun', 		['label'] = 'Flare Gun', 				['ammotype'] = 'AMMO_FLARE',	['damagereason'] = 'Died'},
	[`weapon_marksmanpistol`] 		 = {['name'] = 'weapon_marksmanpistol', ['label'] = 'Marksman Pistol', 			['ammotype'] = 'AMMO_PISTOL',	['damagereason'] = 'Pistoled / Blasted / Plugged / Bust a cap in'},
	[`weapon_revolver`] 			 = {['name'] = 'weapon_revolver', 		['label'] = 'Revolver', 				['ammotype'] = 'AMMO_PISTOL',	['damagereason'] = 'Pistoled / Blasted / Plugged / Bust a cap in'},
	[`weapon_revolver_mk2`] 		 = {['name'] = 'weapon_revolver_mk2', 	['label'] = 'Violence', 				['ammotype'] = 'AMMO_PISTOL',	['damagereason'] = 'Pistoled / Blasted / Plugged / Bust a cap in'},
	[`weapon_doubleaction`] 	     = {['name'] = 'weapon_doubleaction', 	['label'] = 'Double Action Revolver',	['ammotype'] = 'AMMO_PISTOL',	['damagereason'] = 'Pistoled / Blasted / Plugged / Bust a cap in'},
	[`weapon_raypistol`]			 = {['name'] = 'weapon_raypistol',		['label'] = 'Weapon Raypistol',			['ammotype'] = 'AMMO_PISTOL',	['damagereason'] = 'Pistoled / Blasted / Plugged / Bust a cap in'},
	[`weapon_ceramicpistol`]		 = {['name'] = 'weapon_ceramicpistol', 	['label'] = 'Weapon Ceramicpistol',		['ammotype'] = 'AMMO_PISTOL',	['damagereason'] = 'Pistoled / Blasted / Plugged / Bust a cap in'},
	[`weapon_navyrevolver`]        	 = {['name'] = 'weapon_navyrevolver', 	['label'] = 'Weapon Navyrevolver',		['ammotype'] = 'AMMO_PISTOL',	['damagereason'] = 'Pistoled / Blasted / Plugged / Bust a cap in'},
	[`weapon_gadgetpistol`] 		 = {['name'] = 'weapon_gadgetpistol', 	['label'] = 'Weapon Gadgetpistol',		['ammotype'] = 'AMMO_PISTOL',	['damagereason'] = 'Pistoled / Blasted / Plugged / Bust a cap in'},
	[`weapon_stungun_mp`] 			 = {['name'] = 'weapon_stungun_mp', 	['label'] = 'Taser', 					['ammotype'] = 'AMMO_STUNGUN',	['damagereason'] = 'Died'},

    -- Submachine Guns
	[`weapon_microsmg`] 			 = {['name'] = 'weapon_microsmg', 		['label'] = 'Micro SMG', 			['ammotype'] = 'AMMO_SMG',		['damagereason'] = 'Riddled / Drilled / Finished / Submachine Gunned'},
	[`weapon_smg`] 				 	 = {['name'] = 'weapon_smg', 			['label'] = 'SMG', 					['ammotype'] = 'AMMO_SMG',		['damagereason'] = 'Riddled / Drilled / Finished / Submachine Gunned'},
	[`weapon_smg_mk2`] 				 = {['name'] = 'weapon_smg_mk2', 		['label'] = 'PD MP5 2', 			['ammotype'] = 'AMMO_SMG',		['damagereason'] = 'Riddled / Drilled / Finished / Submachine Gunned'},
	[`weapon_assaultsmg`] 			 = {['name'] = 'weapon_assaultsmg', 	['label'] = 'Assault SMG', 			['ammotype'] = 'AMMO_SMG',		['damagereason'] = 'Riddled / Drilled / Finished / Submachine Gunned'},
	[`weapon_combatpdw`] 			 = {['name'] = 'weapon_combatpdw', 		['label'] = 'Combat PDW', 			['ammotype'] = 'AMMO_SMG',		['damagereason'] = 'Riddled / Drilled / Finished / Submachine Gunned'},
	[`weapon_machinepistol`] 		 = {['name'] = 'weapon_machinepistol', 	['label'] = 'Tec-9', 				['ammotype'] = 'AMMO_PISTOL',	['damagereason'] = 'Riddled / Drilled / Finished / Submachine Gunned'},
	[`weapon_minismg`] 				 = {['name'] = 'weapon_minismg', 		['label'] = 'Mini SMG', 			['ammotype'] = 'AMMO_SMG',		['damagereason'] = 'Riddled / Drilled / Finished / Submachine Gunned'},
	[`weapon_raycarbine`]	         = {['name'] = 'weapon_raycarbine', 	['label'] = 'Weapon Raycarbine',	['ammotype'] = 'AMMO_SMG',		['damagereason'] = 'Riddled / Drilled / Finished / Submachine Gunned'},

    -- Shotguns
	[`weapon_pumpshotgun`] 			 = {['name'] = 'weapon_pumpshotgun', 	 	['label'] = 'Pump Shotgun', 			['ammotype'] = 'AMMO_SHOTGUN',	['damagereason'] = 'Devastated / Pulverized / Shotgunned'},
	[`weapon_pumpshotgun_mk2`]		 = {['name'] = 'weapon_pumpshotgun_mk2',	['label'] = 'Pumpshotgun MK2', 			['ammotype'] = 'AMMO_SHOTGUN',	['damagereason'] = 'Devastated / Pulverized / Shotgunned'},
	[`weapon_sawnoffshotgun`] 		 = {['name'] = 'weapon_sawnoffshotgun', 	['label'] = 'Sawn-off Shotgun', 		['ammotype'] = 'AMMO_SHOTGUN',	['damagereason'] = 'Devastated / Pulverized / Shotgunned'},
	[`weapon_assaultshotgun`] 		 = {['name'] = 'weapon_assaultshotgun', 	['label'] = 'Assault Shotgun', 			['ammotype'] = 'AMMO_SHOTGUN',	['damagereason'] = 'Devastated / Pulverized / Shotgunned'},
	[`weapon_bullpupshotgun`] 		 = {['name'] = 'weapon_bullpupshotgun', 	['label'] = 'Bullpup Shotgun', 			['ammotype'] = 'AMMO_SHOTGUN',	['damagereason'] = 'Devastated / Pulverized / Shotgunned'},
	[`weapon_musket`] 			     = {['name'] = 'weapon_musket', 			['label'] = 'Musket', 					['ammotype'] = 'AMMO_SHOTGUN',	['damagereason'] = 'Devastated / Pulverized / Shotgunned'},
	[`weapon_heavyshotgun`] 		 = {['name'] = 'weapon_heavyshotgun', 	 	['label'] = 'Heavy Shotgun', 			['ammotype'] = 'AMMO_SHOTGUN',	['damagereason'] = 'Devastated / Pulverized / Shotgunned'},
	[`weapon_dbshotgun`] 			 = {['name'] = 'weapon_dbshotgun', 		 	['label'] = 'Double-barrel Shotgun', 	['ammotype'] = 'AMMO_SHOTGUN',	['damagereason'] = 'Devastated / Pulverized / Shotgunned'},
	[`weapon_autoshotgun`] 			 = {['name'] = 'weapon_autoshotgun', 	 	['label'] = 'Auto Shotgun', 			['ammotype'] = 'AMMO_SHOTGUN',	['damagereason'] = 'Devastated / Pulverized / Shotgunned'},
	[`weapon_combatshotgun`]		 = {['name'] = 'weapon_combatshotgun', 		['label'] = 'Weapon Combatshotgun',		['ammotype'] = 'AMMO_SHOTGUN',	['damagereason'] = 'Devastated / Pulverized / Shotgunned'},

    -- Assault Rifles
	[`weapon_assaultrifle`] 		 = {['name'] = 'weapon_assaultrifle', 	 	['label'] = 'Assault Rifle', 				['ammotype'] = 'AMMO_RIFLE',	['damagereason'] = 'Ended / Rifled / Shot down / Floored'},
	[`weapon_assaultrifle_mk2`] 	 = {['name'] = 'weapon_assaultrifle_mk2', 	['label'] = 'AK-47 MK2', 					['ammotype'] = 'AMMO_RIFLE',	['damagereason'] = 'Ended / Rifled / Shot down / Floored'},
	[`weapon_carbinerifle`] 		 = {['name'] = 'weapon_carbinerifle', 	 	['label'] = 'Carbine Rifle', 				['ammotype'] = 'AMMO_RIFLE',	['damagereason'] = 'Ended / Rifled / Shot down / Floored'},
    [`weapon_carbinerifle_mk2`] 	 = {['name'] = 'weapon_carbinerifle_mk2', 	['label'] = 'PD 762', 						['ammotype'] = 'AMMO_RIFLE',	['damagereason'] = 'Ended / Rifled / Shot down / Floored'},
	[`weapon_advancedrifle`] 		 = {['name'] = 'weapon_advancedrifle', 	 	['label'] = 'Advanced Rifle', 				['ammotype'] = 'AMMO_RIFLE',	['damagereason'] = 'Ended / Rifled / Shot down / Floored'},
	[`weapon_specialcarbine`] 		 = {['name'] = 'weapon_specialcarbine', 	['label'] = 'Special Carbine', 				['ammotype'] = 'AMMO_RIFLE',	['damagereason'] = 'Ended / Rifled / Shot down / Floored'},
	[`weapon_specialcarbine_mk2`]	 = {['name'] = 'weapon_specialcarbine_mk2',	['label'] = 'Weapon Wpecialcarbine MK2',	['ammotype'] = 'AMMO_RIFLE',	['damagereason'] = 'Ended / Rifled / Shot down / Floored'},
	[`weapon_bullpuprifle`] 		 = {['name'] = 'weapon_bullpuprifle', 	 	['label'] = 'Bullpup Rifle', 				['ammotype'] = 'AMMO_RIFLE',	['damagereason'] = 'Ended / Rifled / Shot down / Floored'},
	[`weapon_bullpuprifle_mk2`]		 = {['name'] = 'weapon_bullpuprifle_mk2', 	['label'] = 'Bull Puprifle MK2',			['ammotype'] = 'AMMO_RIFLE',	['damagereason'] = 'Ended / Rifled / Shot down / Floored'},
	[`weapon_compactrifle`] 		 = {['name'] = 'weapon_compactrifle', 	 	['label'] = 'Compact Rifle', 				['ammotype'] = 'AMMO_RIFLE',	['damagereason'] = 'Ended / Rifled / Shot down / Floored'},
	[`weapon_militaryrifle`]		 = {['name'] = 'weapon_militaryrifle', 		['label'] = 'Weapon Militaryrifle',			['ammotype'] = 'AMMO_RIFLE',	['damagereason'] = 'Ended / Rifled / Shot down / Floored'},
    [`weapon_heavyrifle`] 			 = {['name'] = 'weapon_heavyrifle', 	 	['label'] = 'Heavy Rifle', 					['ammotype'] = 'AMMO_RIFLE',	['damagereason'] = 'Ended / Rifled / Shot down / Floored'},

    -- Light Machine Guns
	[`weapon_mg`] 					 = {['name'] = 'weapon_mg', 			['label'] = 'Machinegun', 			['ammotype'] = 'AMMO_MG',	['damagereason'] = 'Machine gunned / Sprayed / Ruined'},
	[`weapon_combatmg`] 			 = {['name'] = 'weapon_combatmg', 		['label'] = 'Combat MG', 			['ammotype'] = 'AMMO_MG',	['damagereason'] = 'Machine gunned / Sprayed / Ruined'},
	[`weapon_combatmg_mk2`]	 		 = {['name'] = 'weapon_combatmg_mk2', 	['label'] = 'Weapon Combatmg MK2',	['ammotype'] = 'AMMO_MG',	['damagereason'] = 'Machine gunned / Sprayed / Ruined'},
	[`weapon_gusenberg`] 			 = {['name'] = 'weapon_gusenberg', 		['label'] = 'Thompson SMG', 		['ammotype'] = 'AMMO_MG',	['damagereason'] = 'Machine gunned / Sprayed / Ruined'},

    -- Sniper Rifles
	[`weapon_sniperrifle`] 			 = {['name'] = 'weapon_sniperrifle', 	 	['label'] = 'Sniper Rifle', 			['ammotype'] = 'AMMO_SNIPER',			['damagereason'] = 'Sniped / Picked off / Scoped'},
	[`weapon_heavysniper`] 			 = {['name'] = 'weapon_heavysniper', 	 	['label'] = 'Heavy Sniper', 			['ammotype'] = 'AMMO_SNIPER',			['damagereason'] = 'Sniped / Picked off / Scoped'},
	[`weapon_heavysniper_mk2`]		 = {['name'] = 'weapon_heavysniper_mk2', 	['label'] = 'Weapon Heavysniper MK2',	['ammotype'] = 'AMMO_SNIPER',			['damagereason'] = 'Sniped / Picked off / Scoped'},
	[`weapon_marksmanrifle`] 		 = {['name'] = 'weapon_marksmanrifle', 	 	['label'] = 'Marksman Rifle', 			['ammotype'] = 'AMMO_SNIPER',			['damagereason'] = 'Sniped / Picked off / Scoped'},
	[`weapon_marksmanrifle_mk2`]	 = {['name'] = 'weapon_marksmanrifle_mk2',	['label'] = 'Weapon Marksmanrifle MK2',	['ammotype'] = 'AMMO_SNIPER',			['damagereason'] = 'Sniped / Picked off / Scoped'},
	[`weapon_remotesniper`] 		 = {['name'] = 'weapon_remotesniper', 	 	['label'] = 'Remote Sniper', 			['ammotype'] = 'AMMO_SNIPER_REMOTE',	['damagereason'] = 'Sniped / Picked off / Scoped'},

    -- Heavy Weapons
	[`weapon_rpg`] 					 = {['name'] = 'weapon_rpg', 			      	['label'] = 'RPG', 						['ammotype'] = 'AMMO_RPG',				['damagereason'] = 'Killed / Exploded / Obliterated / Destroyed / Erased / Annihilated'},
	[`weapon_grenadelauncher`] 		 = {['name'] = 'weapon_grenadelauncher', 	  	['label'] = 'Grenade Launcher', 		['ammotype'] = 'AMMO_GRENADELAUNCHER',	['damagereason'] = 'Killed / Exploded / Obliterated / Destroyed / Erased / Annihilated'},
	[`weapon_grenadelauncher_smoke`] = {['name'] = 'weapon_grenadelauncher_smoke',	['label'] = 'Smoke Grenade Launcher',	['ammotype'] = 'AMMO_GRENADELAUNCHER',	['damagereason'] = 'Killed / Exploded / Obliterated / Destroyed / Erased / Annihilated'},
	[`weapon_minigun`] 				 = {['name'] = 'weapon_minigun', 		      	['label'] = 'Minigun', 					['ammotype'] = 'AMMO_MINIGUN',			['damagereason'] = 'Killed / Exploded / Obliterated / Destroyed / Erased / Annihilated'},
	[`weapon_firework`] 			 = {['name'] = 'weapon_firework', 		 	  	['label'] = 'Firework Launcher', 		['ammotype'] = nil,						['damagereason'] = 'Killed / Exploded / Obliterated / Destroyed / Erased / Annihilated'},
	[`weapon_railgun`] 				 = {['name'] = 'weapon_railgun', 		 	  	['label'] = 'Railgun', 					['ammotype'] = nil,						['damagereason'] = 'Killed / Exploded / Obliterated / Destroyed / Erased / Annihilated'},
	[`weapon_hominglauncher`] 		 = {['name'] = 'weapon_hominglauncher', 	 	['label'] = 'Homing Launcher', 			['ammotype'] = 'AMMO_STINGER',			['damagereason'] = 'Killed / Exploded / Obliterated / Destroyed / Erased / Annihilated'},
	[`weapon_compactlauncher`] 		 = {['name'] = 'weapon_compactlauncher',  	  	['label'] = 'Compact Launcher', 		['ammotype'] = nil,						['damagereason'] = 'Killed / Exploded / Obliterated / Destroyed / Erased / Annihilated'},
	[`weapon_rayminigun`]			 = {['name'] = 'weapon_rayminigun', 		 	['label'] = 'Weapon Rayminigun',		['ammotype'] = 'AMMO_MINIGUN',			['damagereason'] = 'Killed / Exploded / Obliterated / Destroyed / Erased / Annihilated'},
    [`weapon_emplauncher`] 			 = {['name'] = 'weapon_emplauncher', 			['label'] = 'EMP Launcher', 			['ammotype'] = 'AMMO_EMPLAUNCHER',		['damagereason'] = 'Died'},

    -- Throwables
	[`weapon_grenade`] 		 = {['name'] = 'weapon_grenade', 		['label'] = 'Grenade', 			['ammotype'] = nil,				['damagereason'] = 'Bombed / Exploded / Detonated / Blew up'},
	[`weapon_bzgas`] 		 = {['name'] = 'weapon_bzgas', 			['label'] = 'BZ Gas', 			['ammotype'] = nil,				['damagereason'] = 'Died'},
	[`weapon_molotov`] 		 = {['name'] = 'weapon_molotov', 		['label'] = 'Molotov', 			['ammotype'] = nil,				['damagereason'] = 'Torched / Flambeed / Barbecued'},
	[`weapon_stickybomb`] 	 = {['name'] = 'weapon_stickybomb', 	['label'] = 'C4', 				['ammotype'] = nil,				['damagereason'] = 'Bombed / Exploded / Detonated / Blew up'},
	[`weapon_proxmine`] 	 = {['name'] = 'weapon_proxmine', 		['label'] = 'Proxmine Grenade', ['ammotype'] = nil,				['damagereason'] = 'Bombed / Exploded / Detonated / Blew up'},
	[`weapon_snowball`] 	 = {['name'] = 'weapon_snowball', 		['label'] = 'Snowball', 		['ammotype'] = nil,				['damagereason'] = 'Died'},
	[`weapon_pipebomb`] 	 = {['name'] = 'weapon_pipebomb', 		['label'] = 'Pipe Bomb', 		['ammotype'] = nil,				['damagereason'] = 'Bombed / Exploded / Detonated / Blew up'},
	[`weapon_ball`] 		 = {['name'] = 'weapon_ball', 			['label'] = 'Ball', 			['ammotype'] = 'AMMO_BALL',		['damagereason'] = 'Died'},
	[`weapon_smokegrenade`]  = {['name'] = 'weapon_smokegrenade', 	['label'] = 'Smoke Grenade', 	['ammotype'] = nil,				['damagereason'] = 'Died'},
	[`weapon_flare`] 		 = {['name'] = 'weapon_flare', 			['label'] = 'Flare pistol', 	['ammotype'] = 'AMMO_FLARE',	['damagereason'] = 'Died'},

    -- Miscellaneous
	[`weapon_petrolcan`] 			= {['name'] = 'weapon_petrolcan', 		 	['label'] = 'Petrol Can', 				['ammotype'] = 'AMMO_PETROLCAN',		['damagereason'] = 'Died'},
	[`gadget_parachute`] 			= {['name'] = 'gadget_parachute', 		 	['label'] = 'Parachute', 				['ammotype'] = nil,						['damagereason'] = 'Died'},
	[`weapon_fireextinguisher`] 	= {['name'] = 'weapon_fireextinguisher',	['label'] = 'Fire Extinguisher',		['ammotype'] = nil,						['damagereason'] = 'Died'},
	[`weapon_hazardcan`]			= {['name'] = 'weapon_hazardcan',			['label'] = 'Weapon Hazardcan',			['ammotype'] = 'AMMO_PETROLCAN',		['damagereason'] = 'Died'},
    [`weapon_fertilizercan`]		= {['name'] = 'weapon_fertilizercan',		['label'] = 'Fertilizer Can',			['ammotype'] = 'AMMO_FERTILIZERCAN',	['damagereason'] = 'Died'},
	[`weapon_barbed_wire`]			= {['name'] = 'weapon_barbed_wire',			['label'] = 'Barbed Wire',				['ammotype'] = nil,						['damagereason'] = 'Prodded'},
	[`weapon_drowning`]				= {['name'] = 'weapon_drowning',			['label'] = 'Drowning',					['ammotype'] = nil,						['damagereason'] = 'Died'},
	[`weapon_drowning_in_vehicle`]	= {['name'] = 'weapon_drowning_in_vehicle',	['label'] = 'Drowning in a Vehicle',	['ammotype'] = nil,						['damagereason'] = 'Died'},
	[`weapon_bleeding`]				= {['name'] = 'weapon_bleeding',			['label'] = 'Bleeding',					['ammotype'] = nil,						['damagereason'] = 'Bled out'},
	[`weapon_electric_fence`]		= {['name'] = 'weapon_electric_fence',		['label'] = 'Electric Fence',			['ammotype'] = nil,						['damagereason'] = 'Fried'},
	[`weapon_explosion`]			= {['name'] = 'weapon_explosion',			['label'] = 'Explosion',				['ammotype'] = nil,						['damagereason'] = 'Killed / Exploded / Obliterated / Destroyed / Erased / Annihilated'},
	[`weapon_fall`]					= {['name'] = 'weapon_fall',				['label'] = 'Fall',						['ammotype'] = nil,						['damagereason'] = 'Committed suicide'},
	[`weapon_exhaustion`]			= {['name'] = 'weapon_exhaustion',			['label'] = 'Exhaustion',				['ammotype'] = nil,						['damagereason'] = 'Died'},
	[`weapon_hit_by_water_cannon`]	= {['name'] = 'weapon_hit_by_water_cannon',	['label'] = 'Water Cannon',				['ammotype'] = nil,						['damagereason'] = 'Died'},
	[`weapon_rammed_by_car`]		= {['name'] = 'weapon_rammed_by_car',		['label'] = 'Rammed - Vehicle',			['ammotype'] = nil,						['damagereason'] = 'Flattened / Ran over / Ran down'},
	[`weapon_run_over_by_car`]		= {['name'] = 'weapon_run_over_by_car',		['label'] = 'Run Over - Vehicle',		['ammotype'] = nil,						['damagereason'] = 'Flattened / Ran over / Ran down'},
	[`weapon_heli_crash`]			= {['name'] = 'weapon_heli_crash',			['label'] = 'Heli Crash',				['ammotype'] = nil,						['damagereason'] = 'Helicopter Crash'},
	[`weapon_fire`]					= {['name'] = 'weapon_fire',				['label'] = 'Fire',						['ammotype'] = nil,						['damagereason'] = 'Torched / Flambeed / Barbecued'},

	-- Animals
	[`weapon_animal`]	= {['name'] = 'weapon_animal',	['label'] = 'Animal',	['ammotype'] = nil,	['damagereason'] = 'Mauled'},
    [`weapon_cougar`]	= {['name'] = 'weapon_cougar',	['label'] = 'Cougar',	['ammotype'] = nil,	['damagereason'] = 'Mauled'},
}