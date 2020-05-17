/*______________________________________________________________________________

					OnPlayerRapidFire - OPRF.inc
					    By Lordz AKA Lordzy
						- 2014

						Version : 3
	
	"OPRF" AKA OnPlayerRapidFire is an include which provides a callback called
	"OnPlayerRapidFire" which is called when a player does rapid fire cheat.
	Rapid shots, especially on DM servers with lagcompmode 'On' can be very -
	harmful because quick kills are possible with rapid fires. This include
	detects if a player does rapid fire or not for the following weapons :
	
	    Colt,
	    Desert Eagle,
	    Silenced Pistol,
	    Shotgun,
	    Sawnoff Shotgun,
	    Combat Shotgun,
		Uzi,
		MP5,
		Tec9,
		AK47,
		M4,
		Country Rifle,
		Sniper Rifle.

      This Source Code Form is subject to the
      terms of the Mozilla Public License, v.
      2.0. If a copy of the MPL was not
      distributed with this file, You can
      obtain one at
      http://mozilla.org/MPL/2.0/.

Author : Lordz AKA Lordzy.

Callbacks:
OnPlayerRapidFire(playerid, weaponid, intervals);
 playerid - returns the player who does rapid shots.
 weaponid - returns the weapon's ID which is being used for rapid shots.
 intervals - returns the difference between the last shot and the current one.

Changelogs:

23-02-2014
 - Initial Release.
 - Fixed some issues with arrays.
 - Fixed the problem for sub-machine guns like Tec9 (ID:32) and uzi (ID:28)

24-02-2014 (v2 Released)
 - Added support for Sniper Rifle and Country Rifle.
 (Thanks to 'West X' for reporting about it)

26-8-2014

 - Improved the way of detection.
 - Added : GetPlayerLastShotTick which returns the last shot tick of the player.
 
    Usage : GetPlayerLastShotTick(playerid);
    
    

native GetPlayerLastShotTick(playerid);
______________________________________________________________________________*/


#tryinclude <a_samp>

static
	LR_LastShotTick[MAX_PLAYERS] = {0, ...};

public OnPlayerConnect(playerid) {

	LR_LastShotTick[playerid] = 0;
	#if defined _ALS_OnPlayerConnect
	return LRAPID_OnPlayerConnect(playerid);
	#else
	return 1;
	#endif
}

#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif

#define OnPlayerConnect LRAPID_OnPlayerConnect

#if defined LRAPID_OnPlayerConnect
forward LRAPID_OnPlayerConnect(playerid);
#endif




public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
	new
	    tick = GetTickCount(),
		checkRet = 1;

	if((weaponid >= 22 && weaponid <= 27) || (weaponid >= 29 && weaponid <= 31)) {
	
	    if((tick - LR_LastShotTick[playerid]) < 35) {
	    
	        checkRet = CallLocalFunction("OnPlayerRapidFire", "iii", playerid, weaponid, tick - LR_LastShotTick[playerid]);
	    }
	}
	else if(weaponid == 28 || weaponid == 32) {
	
	    if((tick - LR_LastShotTick[playerid]) < 30) {
	    
	        checkRet = CallLocalFunction("OnPlayerRapidFire", "iii", playerid, weaponid, tick - LR_LastShotTick[playerid]);
		}
	}
	else if(weaponid == 33 || weaponid == 34) {

		if((tick - LR_LastShotTick[playerid]) < 500) {
		
		    checkRet = CallLocalFunction("OnPlayerRapidFire", "iii", playerid, weaponid, tick - LR_LastShotTick[playerid]);
		}
	}
	LR_LastShotTick[playerid] = tick;
	if(!checkRet)
	    return 0;
	else
	#if defined _ALS_OnPlayerWeaponShot
		return LRAPID_OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ);
	#else
 		return 1;
	#endif
}


#if defined _ALS_OnPlayerWeaponShot
	#undef OnPlayerWeaponShot
#else
	#define _ALS_OnPlayerWeaponShot
#endif

#define OnPlayerWeaponShot LRAPID_OnPlayerWeaponShot


#if defined LRAPID_OnPlayerWeaponShot
forward LRAPID_OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ);
#endif


stock GetPlayerLastShotTick(playerid) return LR_LastShotTick[playerid];

public OnGameModeInit() {

	for(new i, j = GetMaxPlayers(); i< j; i++) {
	
	    if(!IsPlayerConnected(i)) continue;
		LR_LastShotTick[i] = 0;
	}
	#if defined _ALS_OnGameModeInit
 	return LRAPID_OnGameModeInit();
	#else
 	return 1;
 	#endif
}

#if defined _ALS_OnGameModeInit
	#undef OnGameModeInit
#else
	#define _ALS_OnGameModeInit
#endif

#define OnGameModeInit LRAPID_OnGameModeInit

#if defined LRAPID_OnGameModeInit
forward LRAPID_OnGameModeInit();
#endif


forward OnPlayerRapidFire(playerid, weaponid, intervals);
/*
	playerid - the player who shoots rapid fires.
	weaponid - the weapon which did rapid shots.
	intervals - the difference between last shot time and the current one.
	Return : 0 will stop sending the shot data sync to others, 1 will send the shot data sync to others.
*/


