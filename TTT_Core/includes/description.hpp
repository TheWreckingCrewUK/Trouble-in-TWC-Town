
DisabledAI		= 1;
joinUnassigned	= 1;
disableChannels[]={0,1,2,3,4,6};

onLoadMission = "http://www.thewreckingcrew.eu/";
author = "Hobbs [TWC]";
loadScreen = "twc_ui\insurgency\loading.jpg";
onLoadName = "Trouble in Terrorist Town"; 

class Header {
	gameType   = Coop;
	minPlayers = 4;
	maxPlayers = 60;
};

//Respawn settings
respawn = "base";
respawnDelay = 1000000;
respawnTemplates[] = {"ace_spectator"};

enableDebugConsole = 1;

class CfgDebriefing {
	class traVictory {
		title = "Traitors Win";
		subtitle = "All Innocents Killed";
		description = "The Traitors successfully killed all the Innocents.";
	};
	class innoVictory {
		title = "Innocents Win";
		subtitle = "All Traitors Killed";
		description = "The Traitors were all found and killed.";
	};
	class innoVictory_time {
		title = "Innocents Win";
		subtitle = "Time limit reached";
		description = "The Traitors failed to kill the Innocents in time.";
	};
	class draw_playercount {
		title = "Mission Cancelled";
		subtitle = "Not enough players";
		description = "There were not enough players to continue.";
	};
};

//ACE3 Settings
class ACE_Settings {
	#include "AceSettings.hpp"
};

class CfgDebriefingSections {
	class acex_killTracker {
		title = "Acex Killed Events";
		variable = "acex_killTracker_outputText";
	};
};