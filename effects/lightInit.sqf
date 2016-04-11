//Defaults
default_brightness = 0.5;
default_attenuation = [0.5, 0, 0, 10, 500, 500];
default_flare = 1;
default_flare_distance = 1000;

hit_brightness = 5;
hit_flare = 10;

_unit = _this;
_colour = if (side _unit == west) then { [0.0,0.0,0.5]; } else { [0.0,0.5,0.0]; };
_unit setVariable ['light_colour', _colour, false];

_light = "#lightpoint" createVehicleLocal (getPos _unit);
_light lightAttachObject [_unit, [0,0,0]];
_unit setVariable ['light_object', _light, false];

_light setLightBrightness default_brightness;
_light setLightAmbient _colour;
_light setLightColor _colour;
_light setLightAttenuation  default_attenuation;

_light setLightUseFlare true;
_light setLightFlareSize default_flare;
_light setLightFlareMaxDistance default_flare_distance;

_unit addMPEventHandler [ 'MPHit', { (_this select 0) execVM "effects\lightHit.sqf"; } ];
_unit addMPEventHandler [ 'MPKilled', { (_this select 0) execVM "effects\lightKilled.sqf"; } ];
_unit addEventHandler [ 'Fired', { [(_this select 0), (_this select 6), (_this select 5)] execVM "effects\lightFired.sqf"; } ];