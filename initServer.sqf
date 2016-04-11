/*
This runs on the server machine after objects have initialised in the map. Anything the server needs to set up before the mission is started is set up here.
*/

//set respawn tickets to 0
/*
[missionNamespace, 1] call BIS_fnc_respawnTickets;
[missionNamespace, -1] call BIS_fnc_respawnTickets;
*/

//Task setting: ["TaskName", locality, ["Description", "Title", "Marker"], target, "STATE", priority, showNotification, true] call BIS_fnc_setTask;
['BlueWin', west, ['REACH THE GREEN MONOLITH', 'CONQUER MONOLITH', 'ADVANCE'], (getPos green_monolith), 'ASSIGNED', 10, true, true] call BIS_fnc_setTask;
['GreenWin', resistance, ['REACH THE BLUE MONOLITH', 'CONQUER MONOLITH', 'ADVANCE'], (getPos blue_monolith), 'ASSIGNED', 10, true, true] call BIS_fnc_setTask;

respawns_blue = [[3981.5,4004,0],[3981.5,4003,0],[3981.5,4002,0],[3981.5,4000.5,0],[3981.5,3999.5,0],[3981.5,3998,0],[3981.5,3997,0],[3981.5,3996,0],[3946.5,4009,0],[3946.5,4008,0],[3946.5,4006.5,0],[3946.5,4005.5,0],[3946.5,3994.5,0],[3946.5,3993.5,0],[3946.5,3992,0],[3946.5,3991,0],[3932,4005.5,0],[3932,4004,0],[3932,3996,0],[3932,3994.5,0],[3923,4001.5,0],[3923,3998.5,0],[3923,4000.5,0],[3923,3999.5,0],[3899.5,4004,0],[3899.5,4001,0],[3899.5,4003,0],[3899.5,4002,0],[3899.5,3999,0],[3899.5,3996,0],[3899.5,3998,0],[3899.5,3997,0],[3890.5,4006.5,0],[3890.5,4005,0],[3890.5,3995,0],[3890.5,3993.5,0],[3883,4001,0],[3883,3999,0],[3875.5,4009,0],[3875.5,4007.5,0],[3875.5,3992.5,0],[3875.5,3991,0],[3870,4001,0],[3870,3999,0],[3856.5,4001,0],[3856.5,3999,0],[3863.5,4009,0],[3863.5,4007.5,0],[3863.5,3992.5,0],[3863.5,3991,0],[4011,4003,0],[4011,4002,0],[4011,4001,0],[4011,4000,0],[4011,3999,0],[4011,3998,0],[3992.5,3997,0],[3992.5,3996,0],[3992.5,3995,0],[3992.5,3994,0],[4023,4001,0],[4023,3999,0],[4046,4009,0],[4046,4008,0],[4046,4007,0],[4046,4006,0],[4046,3994,0],[4046,3993,0],[4046,3992,0],[4046,3991,0],[4093,4004,0],[4093,4003,0],[4093,4002,0],[4093,4001,0],[4093,3999,0],[4093,3998,0],[4093,3997,0],[4093,3996,0],[3848.5,4006.5,0],[3848.5,4003.5,0],[3848.5,4005.5,0],[3848.5,4004.5,0],[3848.5,3996.5,0],[3848.5,3993.5,0],[3848.5,3995.5,0],[3848.5,3994.5,0]];

respawns_green = [[4018.5,3996,0],[4018.5,3997,0],[4018.5,3998,0],[4018.5,3999.5,0],[4018.5,4000.5,0],[4018.5,4002,0],[4018.5,4003,0],[4018.5,4004,0],[4053.5,3991,0],[4053.5,3992,0],[4053.5,3993.5,0],[4053.5,3994.5,0],[4053.5,4005.5,0],[4053.5,4006.5,0],[4053.5,4008,0],[4053.5,4009,0],[4068,3994.5,0],[4068,3996,0],[4068,4004,0],[4068,4005.5,0],[4077,3998.5,0],[4077,4001.5,0],[4077,3999.5,0],[4077,4000.5,0],[4100.5,3996,0],[4100.5,3999,0],[4100.5,3997,0],[4100.5,3998,0],[4100.5,4001,0],[4100.5,4004,0],[4100.5,4002,0],[4100.5,4003,0],[4109.5,3993.5,0],[4109.5,3995,0],[4109.5,4005,0],[4109.5,4006.5,0],[4117,3999,0],[4117,4001,0],[4124.5,3991,0],[4124.5,3992.5,0],[4124.5,4007.5,0],[4124.5,4009,0],[4130,3999,0],[4130,4001,0],[4143.5,3999,0],[4143.5,4001,0],[4136.5,3991,0],[4136.5,3992.5,0],[4136.5,4007.5,0],[4136.5,4009,0],[3989,3997,0],[3989,3998,0],[3989,3999,0],[3989,4000,0],[3989,4001,0],[3989,4002,0],[4007.5,4003,0],[4007.5,4004,0],[4007.5,4005,0],[4007.5,4006,0],[3977,3999,0],[3977,4001,0],[3954,3991,0],[3954,3992,0],[3954,3993,0],[3954,3994,0],[3954,4006,0],[3954,4007,0],[3954,4008,0],[3954,4009,0],[3907,3996,0],[3907,3997,0],[3907,3998,0],[3907,3999,0],[3907,4001,0],[3907,4002,0],[3907,4003,0],[3907,4004,0],[4151.5,3993.5,0],[4151.5,3996.5,0],[4151.5,3994.5,0],[4151.5,3995.5,0],[4151.5,4003.5,0],[4151.5,4006.5,0],[4151.5,4004.5,0],[4151.5,4005.5,0]];

//Spawns a thread that will run a loop to keep an eye on mission progress and to end it when appropriate, checking which ending should be displayed.
_progress = [] spawn {
	
	//Init all variables you need in this loop
	_ending = false;
	_players_dead = false;
	
	_blu_furthest = [4000,4000,0];
	_grn_furthest = [4000,4000,0];
	
	//Starts a loop to check mission status every second, update tasks, and end mission when appropriate
	while {!_ending} do {
		
		sleep 1;
		
		//Mission ending condition check
		if ( _players_dead ) then {
			_ending = true;
			
			sleep 5;
			
			//Runs end.sqf on everyone. For varying mission end states, calculate the correct one here and send it as an argument for end.sqf
			[[[],"end.sqf"], "BIS_fnc_execVM", true, false] spawn BIS_fnc_MP;
		};
		
		//Updating tasks example: ["TaskName", "STATE", false] call BIS_fnc_taskSetState;
		//Custom task update notification: [ ["NotificationName", ["Message"]], "BIS_fnc_showNotification"] call BIS_fnc_MP;
		
		//Check if teams are dead and get furthest live team member's position
		_blu_dead = true;
		_grn_dead = true;
		{
			if (alive _x) then {
				if (side _x == west) then {
					_blu_dead = false;
					
					if ( getPos _x distance green_monolith < (_blu_furthest distance green_monolith) ) then {
						_blu_furthest = getPos _x;
					};
					
				} else {
					_grn_dead = false;
					
					if ( getPos _x distance blue_monolith < (_grn_furthest distance blue_monolith) ) then {
						_grn_furthest = getPos _x;
					};
				};
			};
		} forEach playableUnits;
		
		_teams_dead = [];
		if (_blu_dead) then {
			_teams_dead pushback west;
		};
		if (_grn_dead) then {
			_teams_dead pushback resistance;
		};
		
		if (count _teams_dead > 0) then {
			_teams_dead execVM 'logic\handleRespawn.sqf';
		};
	};
};

//client inits wait for serverInit to be true before starting, to make sure all variables the server sets up are set up before clients try to refer to them (which would cause errors)
serverInit = true;
publicVariable "serverInit";