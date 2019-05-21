_theRadio = _this select 0;
_soungLength = 0;


// Spawning the object the sound will come from
_speaker = "Land_Tableware_01_fork_F" createVehicle position _theRadio;
_speaker setPos (getPos _theRadio);
hideObject _speaker;
_speaker enableSimulationGlobal false;
_speaker attachTo [_theRadio];


// stating the music playing and seting how loung the soung lasts
switch (radioLoop) do {
	case 1 : {	
		[_speaker, ["relax",2000,1]] remoteExec ["say3d"];
		_soungLength = 10;
	};
	case 2 : {	
		[_speaker, ["wantMe",2000,1]] remoteExec ["say3d"];
		_soungLength = 10;
	};
	case 3 : {	
		[_speaker, ["99",2000,1]] remoteExec ["say3d"];
		_soungLength = 10;
	};
	case 4 : {	
		[_speaker, ["master",2000,1]] remoteExec ["say3d"];
		_soungLength = 10;
	};
};


// Controler for neex soung to play
if (radioLoop == 4)
then{
	radioLoop = 1;
}
else{
	radioLoop = radioLoop + 1;
};


// Seting up the user interactions via addactions on the radio object
removeAllActions _theRadio;
_theRadio addAction ["Next Soung", "Scripts\Radio\radioNext.sqf",_speaker];
_theRadio addAction ["Switch off", "Scripts\Radio\radioEnd.sqf",_speaker];


// waiting for the soung to finish
sleep _soungLength;


// Cleaning Up the speaker and staring the next soung if no user action all ready has.
if (damage _speaker > 0.5)
then{
	deleteVehicle _speaker;
}
else{
	[_theRadio,0,0,_speaker] execVM "Scripts\Radio\radioNext.sqf";
	sleep 5;
	deleteVehicle _speaker;
};