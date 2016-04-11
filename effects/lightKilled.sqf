_old_body = _this;
_light = _old_body getVariable 'light_object';

_light setLightBrightness hit_brightness;
_light setLightFlareSize hit_flare;
_light setLightFlareMaxDistance 200;

for '_i' from 1 to 100 do {
	_light setLightBrightness 5-(_i/20);
	_light setLightFlareSize 10-(_i/10);
	sleep 0.01;
};

deleteVehicle _light;
//deleteVehicle _old_body;