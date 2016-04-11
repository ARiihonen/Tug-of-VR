//This runs on every respawning player AND players spawning in for the first time EVEN IF description.ext has set respawnOnStart to 0. Yeah, I don't get it either.
#include "logic\activeMods.sqf";

//_gear = player execVM "player\gear.sqf"; //running the gear script

//Radio init
if ( "task_force_radio" call caran_checkMod || "acre_" call caran_checkMod ) then {
	call caran_playerRadioSetup;
};

//Light effects
[player,"effects\lightInit.sqf"] remoteExec ['BIS_fnc_execVM', 0, true];

//Disable fatigue, add infinite ammo
player enableFatigue false;
player addEventHandler ['Take', { _rearm = _this execVM 'logic\rearm.sqf'; } ];