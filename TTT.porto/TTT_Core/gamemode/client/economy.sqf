_checkmoney = ["Economy","Check Bank Balance","",{call _checkbank},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "Check Money"], _checkmoney] call ace_interact_menu_fnc_addActionToObject;

_buystuff = ["buy","Buy Kit","",{},{((player getvariable ["twc_tttrole", "none"]) == "tra") || ((player getvariable ["twc_tttrole", "none"]) == "det")}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _buystuff] call ace_interact_menu_fnc_addActionToObject;

_buystuff = ["gun","AA-12 (£1)","",{call twc_buy_aa12},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "buy"], _buystuff] call ace_interact_menu_fnc_addActionToObject;

_buystuff = ["gun","Shield (£2)","",{call twc_buy_shield},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "buy"], _buystuff] call ace_interact_menu_fnc_addActionToObject;

_buystuff = ["gun","Grenade (£2)","",{call twc_buy_grenade},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "buy"], _buystuff] call ace_interact_menu_fnc_addActionToObject;

_buystuff = ["gun","L115 (£2)","",{call twc_buy_sniper},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "buy"], _buystuff] call ace_interact_menu_fnc_addActionToObject;

_buystuff = ["gun","M4 (£3)","",{call twc_buy_m4},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "buy"], _buystuff] call ace_interact_menu_fnc_addActionToObject;

_buystuff = ["gun","PKM (£3)","",{call twc_buy_pkm},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "buy"], _buystuff] call ace_interact_menu_fnc_addActionToObject;

checkbank = {
	_money = player getvariable ["seige_money", 1];
	hint (" You currently have £" + (str _money));
	};

twc_buy_pkm = {
	_money = player getvariable ["ttt_money", 1];
	_cost = 3;
	if (_money < _cost) exitwith {
		hint ("You need £" + (str _cost) + " for that. You have £" + (str _money));
	};
	player setvariable ["ttt_money", (_money - _cost), true];
	player addbackpack "B_AssaultPack_sgg";
	player additem "CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Red_M";
	player additem "CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Red_M";
	player additem "CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Red_M";
	player addweapon "CUP_lmg_PKM";
	
	hint "You have bought a weapon";
};

twc_buy_aa12 = {
	_money = player getvariable ["ttt_money", 1];
	_cost = 1;
	if (_money < _cost) exitwith {
		hint ("You need £" + (str _cost) + " for that. You have £" + (str _money));
	};
	player setvariable ["ttt_money", (_money - _cost), true];
	player addbackpack "B_AssaultPack_sgg";
	player additem "CUP_20Rnd_B_AA12_Buck_00";
	player additem "CUP_20Rnd_B_AA12_Buck_00";
	player additem "CUP_20Rnd_B_AA12_Buck_00";
	player additem "CUP_20Rnd_B_AA12_Buck_00";
	player additem "CUP_20Rnd_B_AA12_Buck_00";
	player additem "CUP_20Rnd_B_AA12_Buck_00";
	player additem "CUP_20Rnd_B_AA12_Buck_00";
	player additem "CUP_20Rnd_B_AA12_Buck_00";
	player addweapon "CUP_sgun_AA12";
	
	hint "You have bought a weapon";
};

twc_buy_shield = {
	_money = player getvariable ["ttt_money", 1];
	_cost = 2;
	if (_money < _cost) exitwith {
		hint ("You need £" + (str _cost) + " for that. You have £" + (str _money));
	};
	player setvariable ["ttt_money", (_money - _cost), true];
	player addbackpack "B_AssaultPack_sgg";
	player additem "CUP_15Rnd_9x19_M9";
	player additem "CUP_15Rnd_9x19_M9";
	player additem "CUP_15Rnd_9x19_M9";
	player additem "CUP_15Rnd_9x19_M9";
	player additem "CUP_15Rnd_9x19_M9";
	player additem "CUP_15Rnd_9x19_M9";
	player additem "CUP_15Rnd_9x19_M9";
	player additem "CUP_15Rnd_9x19_M9";
	player addweapon "CUP_hgun_BallisticShield_Armed";
	
	hint "You have bought a weapon";
};

twc_buy_sniper = {
	_money = player getvariable ["ttt_money", 1];
	_cost = 2;
	if (_money < _cost) exitwith {
		hint ("You need £" + (str _cost) + " for that. You have £" + (str _money));
	};
	player setvariable ["ttt_money", (_money - _cost), true];
	player addbackpack "B_AssaultPack_sgg";
	player additem "TWC_5Rnd_338_300gr_HPBT_Mag";
	player additem "TWC_5Rnd_338_300gr_HPBT_Mag";
	player additem "TWC_5Rnd_338_300gr_HPBT_Mag";
	player additem "TWC_5Rnd_338_300gr_HPBT_Mag";
	player additem "TWC_5Rnd_338_300gr_HPBT_Mag";
	player additem "TWC_5Rnd_338_300gr_HPBT_Mag";
	player additem "TWC_5Rnd_338_300gr_HPBT_Mag";
	player additem "TWC_5Rnd_338_300gr_HPBT_Mag";
	player additem "TWC_5Rnd_338_300gr_HPBT_Mag";
	player additem "TWC_5Rnd_338_300gr_HPBT_Mag";
	player addweapon "UK3CB_BAF_L115A3";
	
	hint "You have bought a weapon";
};

twc_buy_m4 = {
	_money = player getvariable ["ttt_money", 1];
	_cost = 3;
	if (_money < _cost) exitwith {
		hint ("You need £" + (str _cost) + " for that. You have £" + (str _money));
	};
	player setvariable ["ttt_money", (_money - _cost), true];
	player addbackpack "B_AssaultPack_sgg";
	player additem "30Rnd_556x45_Stanag_Tracer_Red";
	player additem "30Rnd_556x45_Stanag_Tracer_Red";
	player additem "30Rnd_556x45_Stanag_Tracer_Red";
	player additem "30Rnd_556x45_Stanag_Tracer_Red";
	player additem "30Rnd_556x45_Stanag_Tracer_Red";
	player additem "30Rnd_556x45_Stanag_Tracer_Red";
	player additem "30Rnd_556x45_Stanag_Tracer_Red";
	player addweapon "CUP_arifle_M4A3_Black";
	
	hint "You have bought a weapon";
};

twc_buy_grenade = {
	_money = player getvariable ["ttt_money", 1];
	_cost = 2;
	if (_money < _cost) exitwith {
		hint ("You need £" + (str _cost) + " for that. You have £" + (str _money));
	};
	
	if (!(player canAdd "HandGrenade")) exitwith {
		hint "You don't have enough inventory space for that right now";
	};
	player setvariable ["ttt_money", (_money - _cost), true];
	player additem "HandGrenade";
	
	hint "You have bought a weapon";
};
