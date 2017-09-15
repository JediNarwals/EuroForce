/*
Script: Script for spawning units in random buildings in a given area
Author: Fredoodle
Instructions:
	Syntax: this addaction ["Run me", "Garrison.sqf",[100,["B_Soldier_F"],WEST]];
	Parameters:
		"Run me" - This is the title, you can change this!
		"Garrison.sqf" - This is the file title, it should be located in the main mission directory!
		[100,["B_Soldier_F"],WEST] - This is the configuration, the first parameter (100) is the radius from the object where units will spawn. The second parameter is
									an array containing the classname of all the units that you want to spawn, if no classname is given, the script will spawn standard NATO Riflemen.
									The third parameter is the faction of the unit spawned: it can either be WEST for Blufor, EAST for Opfor or Resistance for Independent.
									If you desire to change the unit selection it should look like this: [100,["Classname1","Classname2","Classname3"......],WEST], remember the " sign!
		
		Remember to first check with _debug = true before implementning into your mission, then it should be set to _debug = false.
		
Examples:
	I want to spawn the OPFOR Sniper or OPFOR Team Leader unit within a radius of 1500 meters: 
	
	1. Find the classname of the unit you want to spawn, in this case it is "O_Sharpshooter_F". You can find these classnames in the editor if you hover over the unit in the menu on the right side of the screen!
	2. Copy paste the template into an object and adjust parameters: ["Run me", "Garrison.sqf",[1500,["O_Sharpshooter_F","O_Soldier_TL_F"],EAST]];
	3. Run mission and click action	
*/


//Parameters
_debug = false; //Change this 

//Variables definitions - do not touch
_object = getpos (_this select 0);
_radius = (_this select 3) select 0;
_whitelist = (_this select 3) select 1;
_faction = (_this select 3) select 2;
_allBuildings = nearestObjects [_object, ["house"], _radius];
_allBuildingPos = [];

//Set the script to spawn a default unit if no unit is provided
if ((count _whitelist) == 0) then
	{
		_whitelist = ["O_Soldier_F"];
	};

//Create a marker covereing the affected zone, for debuggning purposes
if (_debug) then
	{
		_markerstr = createMarker ["mkr",_object];
		_markerstr setMarkerShape "Ellipse";
		_markerstr setMarkerSize [_radius,_radius];
	};
	
//Add all building positions to an array
{
	_allBuildingPos = _allBuildingPos + (_x buildingPos -1);
} foreach _allBuildings;

/*
Spawn units 33% of the time
This can be adjusted on line 62, by increasing X in the (round random X).
Increasing X will lower the spawn chance of the units, lowering X will increase the spawn chance.
(round random 1) will give the units 50% chance to spawn where as (round random 2) will give the units a 33% chance to spawn and so forth.
*/
{
		if ((round random 2) == 0) then
			{
				_unit = (_whitelist call bis_fnc_selectRandom) createUnit [_x, createGroup _faction, "this setdir (random 359); (group this) setBehaviour 'AWARE';", (random 1), "corporal"];
			
				if (_debug) then
					{
						_markerstr = createMarker [format ["%1",_x],_x];
						_markerstr setMarkerShape "ICON";
						_markerstr setMarkerType "hd_dot";
						_markerstr setMarkerColor "colorRed";
					};
			} else
				{
					if (_debug) then
						{
							_markerstr = createMarker [format ["%1",_x],_x];
							_markerstr setMarkerShape "ICON";
							_markerstr setMarkerType "hd_dot";
							_markerstr setMarkerColor "colorYellow";
						};
				};
} foreach _allBuildingPos;