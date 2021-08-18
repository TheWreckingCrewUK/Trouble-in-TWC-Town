

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
