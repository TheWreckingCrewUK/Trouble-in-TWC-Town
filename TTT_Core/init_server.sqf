#include "defines.sqf";
twc_starttime = servertime;
publicvariable "twc_starttime";
sleep 10;

execVM "TTT_core\gamemode\endmission.sqf";

_center = [worldsize / 2, worldsize / 2, 0];
{
	deletevehicle _x;
} foreach ((_center nearObjects ["CUP_WV_B_RAM_Launcher_naval",20000]) + (_center nearObjects ["CUP_WV_B_SS_Launcher_naval",20000]) + (_center nearObjects ["CUP_WV_B_Phalanx",20000]));


_roles = ["tra", "inno", "inno", "inno", "inno", "det", "inno", "tra", "inno", "inno", "inno", "tra", "inno", "inno", "inno", "tra", "inno", "inno", "inno"];

_spawns = [0,0,0] nearObjects ["FlagSmall_F", 10000];

_spawnlist = [];
twc_spawns = [];
twc_takenspawns = [];

{
	twc_spawns pushback (getposasl _x);
	_spawnlist pushback (getposasl _x);
	deletevehicle _x;
} foreach _spawns;
publicvariable "twc_spawns";
publicvariable "twc_takenspawns";


sleep 95;
_count = 0;

_playerlist = [];

{
	if ((random 1) > 0.5) then {
		_playerlist = _playerlist + [_x];
	} else {
		_playerlist = [_x] + _playerlist;
	};
} foreach allplayers;


twc_roles = [];
twc_traitors = [];
twc_traitorobjects = [];
twc_detective = "";

while {(count _playerlist > 0)} do {
	_player = selectrandom _playerlist;
	_role = _roles select _count;
	_player setvariable ["twc_tttrole", _role, true];
	
	if (_role == "tra") then {
		twc_traitors pushback (name _player);
		twc_traitorobjects pushback (_player);
	};
	if (_role == "det") then {
		twc_detective = (name _player);
	};
	
	
	_count = _count + 1;
	_playerlist deleteat (_playerlist find _player);
};
publicvariable "twc_traitors";
publicvariable "twc_traitorobjects";
publicvariable "twc_detective";
sleep 10;

twc_ismissionrunning = true;
publicvariable "twc_ismissionrunning";
[] spawn {
	sleep 60;
	if (hasinterface) exitwith {hint "test mode initserver";};
	while {(count allplayers) > 0} do {
		sleep 30;
		
		_tracount = 0;
		{
			if (alive _x) then {
				_tracount = _tracount + 1;
			};
		} foreach twc_traitorobjects;
		if (_tracount == 0) then {
			"innoVictory" remoteExec ["twc_endtttmission", 2];
		};
		_innocount = 0;
		{
			_role = _x getvariable ["twc_tttrole", "none"];
			if ((alive _x) && (!(_x in twc_traitorobjects)) && (_role != "none")) then {
				_innocount = _innocount + 1;
			};
		} foreach allplayers;
		if (_innocount == 0) then {
			"traVictory" remoteExec ["twc_endtttmission", 2];
		};
	};
};
[] spawn {
	
	
	sleep 300;
	
	_title  = "<t color='#FC3105' size='1.2' shadow='1' shadowColor='#000000' align='center'>TIME REMAINING</t>"; 

	 _text1 = ("<br />5 Minutes Remaining");
	_spawntext = parsetext (_title + _text1);
	
	_spawntext remoteExec ["hint"];
	
	sleep 300;
	
	_isgoing = missionnamespace getvariable ["twc_ismissionrunning", false];
	if (_isgoing) exitwith {
		"innoVictory_time" remoteExec ["twc_endtttmission", 2];
	};
	
};

