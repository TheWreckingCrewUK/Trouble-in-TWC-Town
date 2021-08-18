//Stuff that happens on player respawnVehicle
//If player is civ then kick them. Apparently players respawning as civ is an issue?
if(side player == civilian) then{
	call BIS_fnc_endMission;
};


sleep 1;
cutText ["","Black IN",0.001];

_karma = uinamespace getvariable ["ttt_karma", 100];
_newkarma = ((_karma + 10) min 100);
uinamespace setvariable ["ttt_karma", _newkarma];

ttt_karma = _newkarma;

player allowdamage false;


_bananamen = missionnamespace getvariable ["twc_bananamen", []];

if (!((name player) in _bananamen)) then {
	_bananamen pushback (name player);
	twc_bananamen = _bananamen;
	publicvariable "twc_bananamen";
	systemchat "You are placed on the carrier with other players";
	systemchat "Most of them are innocent. They will try to find and kill the traitor";
	systemchat "At least one of them is a traitor. Their objective is to kill the innocents";
	systemchat "If you have more than 6 players then one of them will be a detective. He has extra medical supplies and can identify the roles of corpses";
	
	
	
};



while {"ACE_CableTie" in (items player)} do {
	player removeitem "ACE_CableTie";
};



if ((servertime - twc_starttime) < 120) then {
	_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>TROUBLE IN TERRORIST TOWN</t>";

	 _text1 = ("<br />" + (str (ceil (120 - (servertime - twc_starttime)))) + " seconds until game start");
	_spawntext = parsetext (_title + _text1);

	hint _spawntext;
	
	
	
	if ((servertime - twc_starttime) < 117) then {
		[] spawn {
			waituntil {(servertime - twc_starttime) > 57};
			[] spawn {
				sleep (2 + (random 2));
				_spawnpos = [];

				while {_spawnpos isequalto []} do {
					_pos = selectrandom twc_spawns;
					if (!((str _pos) in (str (twc_takenspawns)))) then {
						_spawnpos = _pos;
					};
				};
				player setposasl _spawnpos;
				_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>TROUBLE IN TERRORIST TOWN</t>";

				 _text1 = ("<br />" + (str (ceil (120 - (servertime - twc_starttime)))) + " seconds until game start");
				_spawntext = parsetext (_title + _text1);
				hint _spawntext;
			};
			
				
			waituntil {(servertime - twc_starttime) > 116.9};
			
			//reset the player if they've fallen off the carrier, and heal them regardless
			if (((getposasl player) select 2) < 0) then {
				_spawnpos = selectrandom twc_spawns;
				player setposasl _spawnpos;
			};
			player call twc_medical_fnc_fullHealWithoutLog;
			
			//(servertime - twc_starttime) to arm up
			removeallweapons player;
			
	
			_colour = selectrandom ["Violet", "Red", "Green", "Blue", "Brown", "White", "Yellow"];
			
			player addvest (("CUP_V_B_LHDVest_") + _colour);
			player addHeadgear (("CUP_H_Navy_CrewHelmet_") + _colour);
			player addbackpack "twc_tan_belt";
			player additem "acre_prc343";
			
			_role = player getvariable ["twc_tttrole", "none"];
			
			if (_role == "det") then {
				removeHeadgear player;
				player addHeadgear "H_Cap_police";
				for "_i" from 1 to 10 do {
					player additem "ACE_fieldDressing";
					player additem "ACE_morphine";
				};
			};
			player additem "ACE_tourniquet";
			player additem "ACE_tourniquet";
			player additem "ACE_fieldDressing";
			player additem "ACE_fieldDressing";
			player additem "ACE_morphine";
			player additem "SmokeShell";
			player additem "SmokeShell";
			
			_guns = selectrandom [["CUP_smg_MP5A5_flashlight", "CUP_30Rnd_9x19_MP5"], ["SMG_02_F", "30Rnd_9x21_Mag_SMG_02"], ["SMG_01_F", "30Rnd_45ACP_Mag_SMG_01"], ["hgun_Pistol_heavy_02_F", "6Rnd_45ACP_Cylinder"], ["UK3CB_BAF_L105A1", "UK3CB_BAF_9_15Rnd"], ["CUP_hgun_Deagle", "CUP_7Rnd_50AE_Deagle"], ["hgun_P07_F", "16Rnd_9x21_Mag"], ["UK3CB_BAF_L9A1", "UK3CB_BAF_9_13Rnd"]];
			
			for "_i" from 1 to 20 do {
				player additem (_guns select 1);
			};
			player addweapon (_guns select 0);
			
			_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>TROUBLE IN TWC TOWN</t>";

			 _text1 = ("<br /><t color='#FFFFFF' size='5' shadow='1' shadowColor='#000000' align='center'>3</t>");
			_spawntext = parsetext (_title + _text1);
			playSound "Beep_Strobe";
			hint _spawntext;
			sleep 1;
			_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>TROUBLE IN TWC TOWN</t>";

			 _text1 = ("<br /><t color='#FFFFFF' size='5' shadow='1' shadowColor='#000000' align='center'>2</t>");
			_spawntext = parsetext (_title + _text1);
			playSound "Beep_Strobe";
			hint _spawntext;
			sleep 1;
			_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>TROUBLE IN TWC TOWN</t>";

			 _text1 = ("<br /><t color='#FFFFFF' size='5' shadow='1' shadowColor='#000000' align='center'>1</t>");
			_spawntext = parsetext (_title + _text1);
			playSound "Beep_Strobe";
			hint _spawntext;
			
			sleep 1;
			_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>TROUBLE IN TWC TOWN</t>";

			_text1 = ("<br /><t color='#FFFFFF' size='5' shadow='1' shadowColor='#000000' align='center'>GO</t><br /><br /><br />");
			 
			_roletext = "You are Innocent<br />Find and kill the Traitors<br />Protect Yourself";
			 
			_role = player getvariable ["twc_tttrole", "none"];
			if (_role == "tra") then {
				_traitorlistbase = twc_traitors;
				_traitorlist = [];
				{
					if (_x != (name player)) then {
						_traitorlist pushback _x;
					};
				} foreach _traitorlistbase;
				_roletext = ("You are a Traitor<br />Kill the Innocents<br />Protect Yourself<br /><br />Extra equipment is available in your ACE Self Interact");
				if ((count _traitorlist) > 0) then {
					_roletext = (_roletext + ("<br />The other Traitors are:<br />"));
					{
						if (_x != (_traitorlist select 0)) then {
							_roletext = (_roletext + ", ");
						};
						_roletext = (_roletext + _x);
					} foreach _traitorlist;
					_roletext = (_roletext + "<br");
				};
			};
			if (_role == "det") then {
				_roletext = "You are a Detective<br />Find and kill the Traitors<br />Identify the roles of corpses to get money and help the Innocents<br /><br />Extra equipment is available in your ACE Self Interact";
			};
			if (_role == "none") then {
				_roletext = "Role Error, slow network. Check mission status in a few seconds";
			};
			_spawntext = parsetext (_title + _text1 + _roletext);

			hint _spawntext;
			player allowdamage true;
			
			player addEventHandler ["Killed", {
				params ["_unit", "_killer", "_instigator", "_useEffects"];
				_var = missionnamespace getvariable ["twc_traitorobjects", []];
				_var deleteat (_var find player);
				twc_traitorobjects = _var;
				
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
				
				_lastshot = _unit getvariable ["ace_medical_lastDamageSource", _killer];
				[_unit, {[_this] call ttt_playerkill}] remoteExec ['call', _lastshot];
			}];
			
			
			[] spawn {
				while {alive player} do {
					sleep 5;
					if ((((getposasl player) select 2) < 0) || ((vehicle player) != player))then {
						_var = player getvariable ["twc_watercount ", 0];
						_var = _var + 1;
						_text = ("Stay out of the water. You will be autokilled in " + (str (15 - (_var * 5))) + " seconds");
						
						if ((vehicle player) != player) then {
							_text = ("Stay out of vehicles. You will be autokilled in " + (str (15 - (_var * 5))) + " seconds");
						};
						hint _text;
						player setvariable ["twc_watercount ", _var];
						if (_var > 2) then {
							player setdamage 1;
						};
					} else {
					_var = player getvariable ["twc_watercount ", 0];
						if (_var > 0) then {
							player setvariable ["twc_watercount ", 0];
							hint "You get to live";
							sleep 3;
							hint "";
						};
					};
				};
			};
		};
	};
	
	
} else {
	player setdamage 1;
	/*
	waituntil {!isnil "twc_roles"};
	_role = "";
	{
		if ((_x select 0) == (name player)) then {
			_role = _x select 1;
		};
	} foreach twc_roles;
	
	if (_role == "") then {
		player setdamage 1;
	} else {
		_spawnpos = selectrandom twc_spawns;
		player setposasl _spawnpos;
	};
	*/
};
