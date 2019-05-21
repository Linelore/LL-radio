/*
* Stops playing music then add the UI to start it agian
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


// Stops the music playing

_speaker setDamage 1;


// UI Control
removeAllActions _theRadio;
_theRadio addAction ["Switch on", "Scripts\Radio\radioStart.sqf"];