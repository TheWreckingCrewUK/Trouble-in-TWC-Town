


	
_twc_repveh = ["spawnveh","Check Role","",{[_target] call ttt_checkrole},{(!alive _target) && (((name player) == twc_detective) || (twc_detective == ""))}] call ace_interact_menu_fnc_createAction;
[typeof player,0,["ACE_MainActions"],_twc_repveh,true] call ace_interact_menu_fnc_addActionToClass;


ttt_checkrole = {
	params ["_target"];
	_textlist = [];
	
	_fintext  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>BODY CHECKER</t><br /><br />This man was a";
	
	_roletext = " Nun";
	_role = _target getvariable ["twc_tttrole", "none"];
	if (_role == "inno") then {_roletext = "n Innocent"};
	if (_role == "tra") then {_roletext = " Traitor"};
	if (_role == "det") then {_roletext = " Detective"};
	
	_textlist pushback _roletext;
	
	_myrole = player getvariable ["twc_tttrole", "none"];
	
	
	if (_myrole in ["tra", "det"]) then {
		_beenchecked = _target getvariable ["ttt_beenchecked", false];
		if (!_beenchecked) then {
			_money = player getvariable ["ttt_money", 1];
			player setvariable ["ttt_money", (_money + 1)];
			_money = player getvariable ["ttt_money", 1];
			
			_textlist pushback ("<br /><br />You earned £1 and 5 Karma for checking the body<br /><br />You now have £" + (str _money));
			
			
			_target setvariable ["ttt_beenchecked", true, true];
			_karma = uinamespace getvariable ["ttt_karma", 100];
			uinamespace setvariable ["ttt_karma", (_karma + 5)];
		} else {
			_textlist pushback "<br /><br />This person has been checked already, you get no money";
		};
	};
	
	{
		_fintext = _fintext + _x;
	} foreach _textlist;
	hint (parsetext _fintext);
	
	
};

player addEventHandler ["Fired", {
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
	_karma = ttt_karma;
	if (_karma > 99) exitwith {};
	_mult = (((_karma * -1) + 100) * 0.1);
	
	if (_weapon == "Throw") then {
		_mult = _mult * 0.2;
	};
	
	_projectile setvelocity [(velocity _projectile select 0) + (((random 12) - 6) * _mult), (velocity _projectile select 1) + (((random 12) - 6) * _mult), 	(velocity _projectile select 2) + (((random 6) - 3) * _mult)]


}];

#include "diary.sqf";
#include "economy.sqf";


//playSound "RHS_APS_Warning";
//playSound "FD_Start_F";
//playSound "Beep_Strobe"