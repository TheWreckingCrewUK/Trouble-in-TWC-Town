
twc_endtttmission = {
	params [["_string", "none"]];
	
	_isending = missionnamespace getvariable ["twc_istttmissionending", false];
	if (_isending) exitwith {};
	twc_istttmissionending = true;
	_string call bis_fnc_endmissionserver;
};