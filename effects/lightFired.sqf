_unit = _this select 0;
_bullet = _this select 1;
_magazine = _this select 2;

if ( ['556x45', _magazine] call BIS_fnc_inString || ['9x21', _magazine] call BIS_fnc_inString ) then {
	_colour = _unit getVariable 'light_colour';

	_light = "#lightpoint" createVehicleLocal (getPos _bullet);
	_light lightAttachObject [_bullet, [0,0,0]];

	_light setLightBrightness 1;
	_light setLightAmbient _colour;
	_light setLightColor _colour;
	_light setLightAttenuation  default_attenuation;

	_light setLightUseFlare true;
	_light setLightFlareSize 25;
	_light setLightFlareMaxDistance 2000;

	waitUntil{ isNull _bullet };

	deleteVehicle _light;
};

/*
} else {
	if ( ['chemlight', _magazine] call BIS_fnc_inString ) then {
		sleep 3;
		
		_light = "#lightpoint" createVehicleLocal (getPos _bullet);
		_light lightAttachObject [_bullet, [0,0,0]];

		_light setLightBrightness 100;
		_light setLightAmbient [1,1,1];
		_light setLightColor [1,1,1];
		_light setLightAttenuation  default_attenuation;

		_light setLightUseFlare true;
		_light setLightFlareSize 25;
		_light setLightFlareMaxDistance 2000;
		
		
		{
			diag_log format ['%1', ((getPos _bullet) vectorFromTo (getPos _x)) ];
			_x setVelocity ((getPos _bullet) vectorFromTo (getPos _x));
		} forEach allUnits;
		
		sleep 0.2;
		deleteVehicle _light;
		if (isServer) then {
			deleteVehicle _bullet;
		};
	};
};
*/