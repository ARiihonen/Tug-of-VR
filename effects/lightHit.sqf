_unit = _this;
_light = _unit getVariable 'light_object';

_light setLightBrightness hit_brightness;
_light setLightFlareSize hit_flare;

sleep 0.2;

_light setLightBrightness default_brightness;
_light setLightFlareSize default_flare;