_item = _this select 2;

if ( ['556x45', _item] call BIS_fnc_inString || ['9x21', _item] call BIS_fnc_inString ) then {
	player removeMagazines _item;
	player addMagazine _item;
};