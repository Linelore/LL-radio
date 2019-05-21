# LL Radio

LL-radio is uesd to add a controllable radio with stop, start and next functionality to any object in arma 3.


## Installation

1. Place all files and folders in you mission directory
2. Add the following to the init of the object you want to use as the radio
```sqf
[this]execVM "Scripts\Radio\radioStart.sqf"; 
```

### Adding sounds
1. Place the .oog file in the sounds folder
2. In description.ext add the file to the CfgSounds class list (Check the [wiki](https://community.bistudio.com/wiki/Description.ext#CfgSounds) if unsure how)
3. In \Scripts\Radio\radioStart.sqf change the value _numberOfSoungs on line 2
4. In \Scripts\Radio\radioStart.sqf add 
  ```

## License
[MIT](https://choosealicense.com/licenses/mit/)
