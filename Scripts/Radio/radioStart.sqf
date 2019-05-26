/*
* Starts playing sounds, manages the selection of the next sound and manages the the object the sound comes form
*
* Peraminters:
*	_theRadio object
*		Used for UI and location to place the sound
*/

_theRadio = _this select 0;
_numberOfSoungs = 2;


// Spawning the object the sound will come from
_speaker = "Land_Tableware_01_fork_F" createVehicle position _theRadio;
_speaker setPos (getPos _theRadio);
hideObject _speaker;
_speaker enableSimulationGlobal false;
_speaker attachTo [_theRadio];

// Controler for soung to play
_radioLoop = _theRadio getVariable ["radioLoop",-1];
if (_radioLoop == -1)
then{
	_radioLoop = 0;
};
if (_radioLoop == _numberOfSoungs)
then{
	_radioLoop = 1;
}
else{
	_radioLoop = _radioLoop + 1;
};
_theRadio setVariable ["radioLoop", _radioLoop, true];


// starting the music playing and seting how long the soung lasts
_soungLength = 0;
switch (_radioLoop) do {
	case 1 : {	
		[_speaker, ["example1",2000,1]] remoteExec ["say3d"];
		_soungLength = 15;
	};
	case 2 : {	
		[_speaker, ["example2",2000,1]] remoteExec ["say3d"];
		_soungLength = 15;
	};
	// add new soungs here
};


// Seting up the user interactions via addactions on the radio object
removeAllActions _theRadio;
_theRadio addAction ["Next Soung", "Scripts\Radio\radioNext.sqf",_speaker];
_theRadio addAction ["Switch off", "Scripts\Radio\radioEnd.sqf",_speaker];


// waiting for the soung to finish
sleep _soungLength;


// Cleaning Up the speaker and start the next soung if no user action all ready has.
if (damage _speaker > 0.5)
then{
	deleteVehicle _speaker;
}
else{
	[_theRadio,0,0,_speaker] execVM "Scripts\Radio\radioNext.sqf";
	sleep 5;
	deleteVehicle _speaker;
};
