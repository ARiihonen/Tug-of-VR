//Get player class and make sure it's all uppercase since BI classnames are super inconsistent
_side = side player;

removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

_chemlight = if (_side == west) then { "Chemlight_blue"; } else { "Chemlight_green"; };
_smoke = if (_side == west) then { "SmokeShellBlue"; } else { "SmokeShellGreen" };
_tracer = if (_side == west) then { "30Rnd_556x45_Stanag_Tracer_Yellow"; } else { "30Rnd_556x45_Stanag_Tracer_Red"; };

player addVest "V_PlateCarrier2_blk";
for "_i" from 1 to 2 do {player addItemToVest "FirstAidKit";};
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {player addItemToVest "11Rnd_45ACP_Mag";};
for "_i" from 1 to 2 do {player addItemToVest _tracer;};
for "_i" from 1 to 2 do {player addItemToVest _smoke;};
for "_i" from 1 to 2 do {player addItemToVest _chemlight;};

player addWeapon "arifle_Mk20C_plain_F";
player addPrimaryWeaponItem "optic_Aco";
player addWeapon "hgun_Pistol_heavy_01_F";
player addHandgunItem "optic_MRD";