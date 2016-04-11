//Runs on both server and clients after initServer.sqf is finished
waitUntil {!isNil "serverInit"};
waitUntil {serverInit};

#include "logic\activeMods.sqf"

//initialise mods if active
if ( "task_force_radio" call caran_checkMod ) then {
	_load = [] execVM "mods\tfar.sqf";
};

if ("acre_" call caran_checkMod ) then {
	_load = [] execVM "mods\acre.sqf";
};

if ( "ace_" call caran_checkMod ) then {
	_load = [] execVM "mods\ace.sqf";
};

//Light effects
/*
{
	[_x,"effects\lightInit.sqf"] remoteExec ['BIS_fnc_execVM', 0, true];
} forEach allUnits;
*/

//Player init: this will only run on players. Use it to add the briefing and any player-specific stuff like action-menu items.
if (!isServer || (isServer && !isDedicated) ) then {
	//put in briefings
	briefing = [] execVM "briefing\briefing.sqf";
	
	//Environment lights
	_blue_spot = getPos blue_monolith;
	_blue_spot set [2, (_blue_spot select 2) + 12];

	light_blue = "#lightpoint" createVehicleLocal _blue_spot;
	light_blue setLightBrightness 5;
	light_blue setLightAmbient [0.0,0.0,0.5];
	light_blue setLightColor [0.0,0.0,0.5];
	light_blue setLightAttenuation [0.5, 0, 0, 5, 4000, 5000];

	light_blue setLightUseFlare true;
	light_blue setLightFlareSize 10;
	light_blue setLightFlareMaxDistance 5000;

	_green_spot = getPos green_monolith;
	_green_spot set [2, (_green_spot select 2) + 12];

	light_green = "#lightpoint" createVehicleLocal _green_spot;

	light_green setLightBrightness 5;
	light_green setLightAmbient [0.0,0.5,0.0];
	light_green setLightColor [0.0,0.5,0.0];
	light_green setLightAttenuation [0.5, 0, 0, 5, 2000, 3000];

	light_green setLightUseFlare true;
	light_green setLightFlareSize 10;
	light_green setLightFlareMaxDistance 5000;
};