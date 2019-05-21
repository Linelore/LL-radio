/*
* Stops playing music then statrs the next soung
*
* Peraminters:
*	_theRadio object
*		Used for UI and location to place the sound
*	
*	_speaker  object
*		Source of the sound
*/

_theRadio = _this select 0;
_speaker = _this select 3;

[_theRadio,0,0,_speaker] execVM "Scripts\Radio\radioEnd.sqf";
[_theRadio]execVM "Scripts\Radio\radioStart.sqf";

