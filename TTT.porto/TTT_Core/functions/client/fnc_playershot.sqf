//_testing = missionnamespace getvariable ["twc_testmode", false];
		//if (!_testing) exitwith {};
twc_fnc_playerheadshot = {
//	if ((random 1) < 0.5) exitwith {};
	{
		_x params ['_target', '_shooter', '_projectile', '_position', '_velocity', '_selection', '_ammo', '_vector', '_radius', '_surfaceType', '_isDirect'];
		if (!alive _target) exitwith {};
		if (!_isdirect) exitwith {};
		_value = (_ammo select 0); 
		if (_value > 20) exitwith {
			[_target, {if (isDamageAllowed _this) then {_this setdamage 1;};}] remoteExec ['call', _target];
			//[_target, {[_this] call ttt_playerkill}] remoteExec ['call', _shooter];
		}; 
		if (('head' in _selection) || (('neck' in _selection) && ((random 1) > 0.5))) exitwith {
			[_target, {if (isDamageAllowed _this) then {_this setdamage 1;};}] remoteExec ['call', _target];
			//[_target, {[_this] call ttt_playerkill}] remoteExec ['call', _shooter];
		}; 
		if (!(('spine1' in _selection) || ('spine2' in _selection) || ('spine3' in _selection))) exitwith {};
		
		_armour = (getNumber (configFile >> 'CfgWeapons' >> vest _target >> 'iteminfo' >> 'HitpointsProtectionInfo' >> 'Chest' >> 'armor')); 
		
		_hit = (((((_value) - 4) max 3) + ((vectorMagnitude _velocity) * 0.01) - (((_armour) max 0) * 0.1)) + (random 1));
		
		if ('spine3' in _selection) exitwith {
			if ((_hit > 10) || ((_hit > 6) && ((lifeState _target) != 'HEALTHY'))) then {
				[_target, {if (isDamageAllowed _this) then {_this setdamage 1;};}] remoteExec ['call', _target];
				//[_target, {[_this] call ttt_playerkill}] remoteExec ['call', _shooter];
			};
		};
		if (('spine1' in _selection) || ('spine2' in _selection)) exitwith {
			if ((_hit > 12) || ((_hit > 6) && ((lifeState _target) != 'HEALTHY'))) then {
				[_target, {if (isDamageAllowed _this) then {_this setdamage 1;};}] remoteExec ['call', _target];
				//[_target, {[_this] call ttt_playerkill}] remoteExec ['call', _shooter];
			};
		};
	} foreach _this;
	
};

//this is exec'd on the killer's client, so that uinamespace affects the correct karma rating
ttt_playerkill = {
	params ["_victim"];
	_role = player getvariable ["twc_tttrole", "none"];
	
	_rolename = "an Innocent";
	
	if (_role == "tra") then {
		_rolename = "a Traitor";
	};
	
	if (_role == "det") then {
		_rolename = "the Detective";
	};
	
	_killtxt = ("You were killed by " + ((name player)) + "<br/><br/>They were " + (_rolename));
	
	
	_killmsg = parsetext _killtxt;
	_killmsg remoteExec ["hint", _victim]; 
	
	if (_role == "tra") exitwith {
		
		_money = player getvariable ["ttt_money", 1];
		player setvariable ["ttt_money", (_money + 1)];
		_money = player getvariable ["ttt_money", 1];
		_killtxt = ("You have received £1 for your efforts<br/><br/>You now have £" + (str _money));
		
		
		_killmsg = parsetext _killtxt;
		hint _killmsg;
	};
	
	_vrole = _victim getvariable ["twc_tttrole", "none"];
	
	if (_vrole != "tra") then {
		_karma = uinamespace getvariable ["ttt_karma", 100];
		uinamespace setvariable ["ttt_karma", (_karma - 20)];
	} else {
		_karma = uinamespace getvariable ["ttt_karma", 100];
		uinamespace setvariable ["ttt_karma", (_karma + 10)];
	};
};