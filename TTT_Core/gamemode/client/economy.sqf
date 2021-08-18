
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

twc_buy_pkm = {
	_money = player getvariable ["ttt_money", 1];
	_cost = 3;
	if (_money < _cost) exitwith {
		hint ("You need £" + (str _cost) + " for that. You have £" + (str _money));
	};
	player setvariable ["ttt_money", (_money - _cost), true];
	player addbackpack "B_AssaultPack_sgg";
	player additem "rhs_100Rnd_762x54mmR_green";
	player additem "rhs_100Rnd_762x54mmR_green";
	player additem "rhs_100Rnd_762x54mmR_green";
	player addweapon "rhs_weap_pkm";
	
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
	player additem "rhsusf_mag_15Rnd_9x19_FMJ";
	player additem "rhsusf_mag_15Rnd_9x19_FMJ";
	player additem "rhsusf_mag_15Rnd_9x19_FMJ";
	player additem "rhsusf_mag_15Rnd_9x19_FMJ";
	player additem "rhsusf_mag_15Rnd_9x19_FMJ";
	player additem "rhsusf_mag_15Rnd_9x19_FMJ";
	player additem "rhsusf_mag_15Rnd_9x19_FMJ";
	player additem "rhsusf_mag_15Rnd_9x19_FMJ";
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
	player additem "rhs_mag_30Rnd_556x45_M855_Stanag";
	player additem "rhs_mag_30Rnd_556x45_M855_Stanag";
	player additem "rhs_mag_30Rnd_556x45_M855_Stanag";
	player additem "rhs_mag_30Rnd_556x45_M855_Stanag";
	player additem "rhs_mag_30Rnd_556x45_M855_Stanag";
	player additem "rhs_mag_30Rnd_556x45_M855_Stanag";
	player additem "rhs_mag_30Rnd_556x45_M855_Stanag";
	player addweapon "rhs_weap_m4_carryhandle";
	
	hint "You have bought a weapon";
};

twc_buy_grenade = {
	_money = player getvariable ["ttt_money", 1];
	_cost = 2;
	if (_money < _cost) exitwith {
		hint ("You need £" + (str _cost) + " for that. You have £" + (str _money));
	};
	
	if (!(player canAdd "rhs_mag_f1")) exitwith {
		hint "You don't have enough inventory space for that right now";
	};
	player setvariable ["ttt_money", (_money - _cost), true];
	player additem "rhs_mag_f1";
	
	hint "You have bought a weapon";
};