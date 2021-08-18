

#include "fnc_playershot.sqf"

InsP_MissionStatus = ["MissionStatus","Mission Status","",{execvm "TTT_core\gamemode\client\missionstatus.sqf"},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], InsP_MissionStatus] call ace_interact_menu_fnc_addActionToObject;



player addEventHandler ["InventoryOpened", { 
	params ["_unit", "_container"];
	_check = player getvariable ["twc_bodysearch", objnull];
	if (!isnull _check) exitwith {};
	_haschecked = _container getvariable ["twc_bodychecked", false];
	if (_haschecked) exitwith {};
	if ( (_container iskindof "man")) exitwith {
		player setvariable ["twc_bodysearch", _container];
		[] spawn {
			waituntil {dialog};
			closeDialog 602;
			[5, [],{_container = player getvariable ["twc_bodysearch", objnull];player action ["Gear", _container];player setvariable ["twc_bodysearch", objnull];_container setvariable ["twc_bodychecked", true];}, {player setvariable ["twc_bodysearch", objnull];}, "Searching..."] call ace_common_fnc_progressBar;
		};
	}; 
}];


//gas blowback simulation for firing with suppressors

twc_suppressgasblowback = ppEffectCreate ["DynamicBlur", 401];

player addEventHandler ["Fired", { 
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
	if ((vehicle player) != player) exitwith {};
	if ((_weapon != (primaryweapon player)) && (_weapon != (handgunweapon player))) exitwith {};
	_suppressors = [
	"rhsusf_acc_rotex5_grey",
	"twc_acc_rotex5_grey"
	];
	
	_hassuppressor = false;
	
	
	{
		if (((_x in (primaryweaponitems player)) && (_weapon == (primaryweapon player))) || ((_x in (handgunitems player)) && (_weapon == (handgunweapon player)))) then {
			_hassuppressor = true;
		};
	} foreach _suppressors;
	
	if (!_hassuppressor) exitwith {};
	
	_lastblowback = player getvariable ["twc_lastgasblowback", []];
	
	
	{
		if (_x < (time - 10)) then {
			_lastblowback deleteat (_lastblowback find _x);
		};
	} foreach _lastblowback;
	
	_thistime = time;
	_lastblowback pushback _thistime;
	
	player setvariable ["twc_lastgasblowback", _lastblowback];
	
	_tolerance = missionnamespace getvariable ["twcblowbacktolerance", 5];
	
	if ((count _lastblowback) < _tolerance) exitwith {};
	
	_severity = 0.05 * (count _lastblowback);
	
	["DynamicBlur", 400, [_severity], _thistime] spawn {
	params ["_name", "_priority", "_effect", "_thistime"];
	_time = _effect select 0;
	twc_suppressgasblowback ppEffectEnable true; 
	twc_suppressgasblowback ppEffectAdjust _effect; 
	twc_suppressgasblowback ppEffectCommit _time * 2;
	uiSleep (_time * 2);
	twc_suppressgasblowback ppEffectAdjust [0];
	twc_suppressgasblowback ppEffectCommit (_time);
	uiSleep (_time);
	_lastblowback = player getvariable ["twc_lastgasblowback", []];
	if ((_lastblowback select ((count _lastblowback) - 1)) != _thistime) exitwith {};
	twc_suppressgasblowback ppEffectEnable false; 
	
	};
}];

player addEventHandler ["Fired", { 
 params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
if (!(_unit == player)) exitwith {};
if (!((vehicle player) == player)) exitwith {}; 
if ((speed _projectile) < 1350) exitwith {};[_projectile] spawn {params ["_projectile"];waituntil {((((speed _projectile) < 1300) && ((speed _projectile) > 1200))) || (!alive _projectile)};if (!alive _projectile) exitwith {}; 
//systemchat ("transonic at " + (str(player distance _projectile)) + "m");
_mult = 0.2;if ((_projectile distance player) < 300) then {_mult = 0.05;};while {alive _projectile} do {
_projectile setvelocity [(velocity _projectile select 0) + (((random 8) - 4) * _mult), (velocity _projectile select 1) + (((random 8) - 4) * _mult), 	(velocity _projectile select 2) + (((random 4) - 2) * _mult)];sleep (random 1)};}}];

player addEventHandler ["InventoryClosed", {
	params ["_unit", "_container"];
	_suppressors = [
	"twc_l85_suppressor",
	"twc_acc_rotex5_grey",
	"twc_acc_nt4_tan",
	"rhsusf_acc_omega9k"
	];
	
	_hassuppressor = false;
	
	{
		if ((_x in (primaryweaponitems player)) || (_x in (handgunitems player))) then {
			_hassuppressor = true;
		};
	} foreach _suppressors;
	
	_msgdone = player getvariable ["twc_hassuppmessage", false];
	
	if (!_hassuppressor) exitwith {
		if (_msgdone) then {
			player setvariable ["twc_hassuppmessage", false];
		};
	};
	
	
	if (_msgdone) exitwith {};
	
	hint "You have a suppressor attached. Your shots will be harder to locate but you will suffer gas blowback under sustained fire, making it hard to see";
	player setvariable ["twc_hassuppmessage", true];
	
}];