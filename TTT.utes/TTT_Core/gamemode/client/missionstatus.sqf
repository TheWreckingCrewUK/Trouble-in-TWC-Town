


_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>MISSION STATUS</t><br /><br />"; 

_timeremaining = (floor ((720 - (servertime - twc_starttime)) / 60)) max 0;

_text1 = format["%1 Minutes Remaining<br /><br />",_timeremaining];
if ((servertime - twc_starttime) < 120) then {
	_timeremaining = (floor (120 - (servertime - twc_starttime)));

	_text1 = format["%1 Seconds until Game Start<br /><br />",_timeremaining];
};
_text2 = "";

if ((count allplayers) == 1) then {
	_text2 = "You are currently the only player on the server<br />";
} else {
	_text2 = format ["There are %1 players in the game<br />", (count allplayers)];
	
};



_roletext = "You are Innocent<br />Find and kill the Traitors<br />Protect Yourself<br />";
			 
_role = player getvariable ["twc_tttrole", "none"];
if (_role == "none") then {
	_roletext = "You have no role<br />";
};
if (_role == "tra") then {
	_traitorlistbase = twc_traitors;
	_traitorlist = [];
	{
		if (_x != (name player)) then {
			_traitorlist pushback _x;
		};
	} foreach _traitorlistbase;
	
	if ((count _traitorlist) > 0) then {
		_roletext = ("You are a Traitor<br />Kill the Innocents<br />Protect Yourself");
		_roletext = (_roletext + ("<br />The other Traitors are:<br />"));
		{
			if (_x != (_traitorlist select 0)) then {
				_roletext = (_roletext + ", ");
			};
			_roletext = (_roletext + _x);
		} foreach _traitorlist;
		_roletext = (_roletext + "<br");
		_roletext = (_roletext + "<br");
	} else {
		_roletext = ("You are the only Traitor<br />Kill the Innocents<br />Protect Yourself");
	};
	
	_money = player getvariable ["ttt_money", 1];
	_roletext = (_roletext + "<br /><br />You have £" + (str _money) + "<br />");
};
if (_role == "det") then {
	_roletext = "You are a Detective<br />Find and kill the Traitors<br />Identify the roles of corpses<br />";
	
	_money = player getvariable ["ttt_money", 1];
	_roletext = (_roletext + "<br /><br />You have £" + (str _money));
};


_traitors = missionnamespace getvariable ["twc_traitors", []];
_roletext2 = ("There are " + (str (count _traitors)) + " Traitors active");
if ((count _traitors) == 1) then {
	_roletext2 = "<br />There is 1 traitor active";
};

if (_role == "tra") then {
	_roletext3 = "<br />The Traitors are ";
	{
		_roletext3 = _roletext3 + _x + " ";
	} foreach _traitors;
	if ((count _traitors) == 1) then {
		_roletext3 = "<br />You are the only Traitor";
	};
};
_text3 = "<br />There is no Detective";

_isdet = missionnamespace getvariable ["twc_detective", ""];
if (_isdet != "") then {
	_text3 = ("<br />" + twc_detective + " is the Detective");
};
_karma = ttt_karma;
_text4 = ("<br />Your Karma is " + (str _karma) + " so you have ");
if (_karma > 99) then {
	_text4 = (_text4 + "full accuracy this round.");
} else {
	_text4 = (_text4 + (str _karma) + "% accuracy this round.");
};

_finaltext = parsetext (_title + _text1 + _text2 + _roletext + _roletext2 + _text3 + _text4);
hint _finaltext;