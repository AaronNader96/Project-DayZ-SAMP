/*
	OnPlayerAirbreak(playerid);

	This include is one of the only accurate airbreak detecting
	methods developed in SA-MP.

	Created by Emmet on Wednesday, November 6, 2013.
*/
static stock
	g_AB_LastTick[MAX_PLAYERS],
	Float:g_AB_LastPosition[MAX_PLAYERS][3]
;

public OnFilterScriptInit()
{
	for (new i = 0, j = GetMaxPlayers(); i != j; i ++)
	{
		if (!IsPlayerConnected(i) || GetPlayerState(i) != PLAYER_STATE_ONFOOT)
			continue;

		AB_SetImmunity(i);
	}
	#if defined AB_OnFilterScriptInit
	    AB_OnFilterScriptInit();
	#endif
	return 1;
}

public OnPlayerConnect(playerid)
{
	AB_SetImmunity(playerid, 3);

	#if defined AB_OnPlayerConnect
	    AB_OnPlayerConnect(playerid);
	#endif
	return 1;
}

public OnPlayerSpawn(playerid)
{
	AB_SetImmunity(playerid, 3);

	#if defined AB_OnPlayerSpawn
	    AB_OnPlayerSpawn(playerid);
	#endif
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	AB_SetImmunity(playerid, 3);

	#if defined AB_OnPlayerDeath
	    AB_OnPlayerDeath(playerid, killerid, reason);
	#endif
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	AB_SetImmunity(playerid, 3);

	#if defined AB_OnPlayerStateChange
	    AB_OnPlayerStateChange(playerid, newstate, oldstate);
	#endif
	return 1;
}

public OnPlayerUpdate(playerid)
{
	AB_Detect(playerid);

	#if defined AB_OnPlayerUpdate
	    AB_OnPlayerUpdate(playerid);
	#endif
	return 1;
}

stock static AB_Detect(playerid)
{
	static playerState;
	
	playerState = GetPlayerState(playerid);

	if ((playerState == 0 || playerState == 2 || playerState == 3 || playerState == 7 || playerState == 9))
		return AB_SetImmunity(playerid, 1);

	else if (IsPlayerConnected(playerid) && !IsPlayerInAnyVehicle(playerid) && !IsPlayerNPC(playerid))
	{
		if ((gettime() - g_AB_LastTick[playerid]) >= 1)
		{
			static
				Float:x,
				Float:y,
				Float:z,
				Float:distance;

			GetPlayerPos(playerid, x, y, z);

		    if (floatabs(g_AB_LastPosition[playerid][2] - z) < 1.0)
		    {
				distance = GetPlayerDistanceFromPoint(playerid, g_AB_LastPosition[playerid][0], g_AB_LastPosition[playerid][1], g_AB_LastPosition[playerid][2]);

				if (floatabs(distance) >= 65.0 && (floatabs(g_AB_LastPosition[playerid][1] - y) >= 45.0 || floatabs(g_AB_LastPosition[playerid][0] - x) >= 45.0)) {
					CallLocalFunction("OnPlayerAirbreak", "d", playerid);
				}
		    }
			AB_SetImmunity(playerid);
		}
	}
	return 1;
}

stock static AB_SetImmunity(playerid, extra = 0)
{
 	if (GetPlayerState(playerid) != PLAYER_STATE_SPECTATING)
	{
	 	GetPlayerPos(playerid, g_AB_LastPosition[playerid][0], g_AB_LastPosition[playerid][1], g_AB_LastPosition[playerid][2]);
	}
	g_AB_LastTick[playerid] = gettime() + extra;
	return 1;
}

stock AB_SetPlayerPos(playerid, Float:x, Float:y, Float:z)
{
	AB_SetImmunity(playerid, 3);
	return SetPlayerPos(playerid, x, y, z);
}

stock AB_PutPlayerInVehicle(playerid, vehicleid, seatid)
{
	AB_SetImmunity(playerid, 3);
	return PutPlayerInVehicle(playerid, vehicleid, seatid);
}

stock AB_SetPlayerPosFindZ(playerid, Float:x, Float:y, Float:z)
{
    AB_SetImmunity(playerid, 3);
	return SetPlayerPosFindZ(playerid, x, y, z);
}

#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif

#if defined _ALS_OnPlayerSpawn
	#undef OnPlayerSpawn
#else
	#define _ALS_OnPlayerSpawn
#endif

#if defined _ALS_OnPlayerDeath
	#undef OnPlayerDeath
#else
	#define _ALS_OnPlayerDeath
#endif

#if defined _ALS_OnPlayerUpdate
	#undef OnPlayerUpdate
#else
	#define _ALS_OnPlayerUpdate
#endif

#if defined _ALS_OnFilterScriptInit
	#undef OnFilterScriptInit
#else
	#define _ALS_OnFilterScriptInit
#endif

#if defined _ALS_SetPlayerPos
	#undef SetPlayerPos
#else
	#define _ALS_SetPlayerPos
#endif

#if defined _ALS_SetPlayerPosFindZ
	#undef SetPlayerPosFindZ
#else
	#define _ALS_SetPlayerPosFindZ
#endif

#if defined _ALS_PutPlayerInVehicle
	#undef PutPlayerInVehicle
#else
	#define _ALS_PutPlayerInVehicle
#endif

#if defined _ALS_OnPlayerStateChange
	#undef OnPlayerStateChange
#else
	#define _ALS_OnPlayerStateChange
#endif

#define OnPlayerConnect 	AB_OnPlayerConnect
#define OnPlayerSpawn 		AB_OnPlayerSpawn
#define OnPlayerDeath 		AB_OnPlayerDeath
#define OnPlayerUpdate 		AB_OnPlayerUpdate
#define OnFilterScriptInit  AB_OnFilterScriptInit
#define OnPlayerStateChange	AB_OnPlayerStateChange

#define SetPlayerPos        AB_SetPlayerPos
#define SetPlayerPosFindZ   AB_SetPlayerPosFindZ
#define PutPlayerInVehicle  AB_PutPlayerInVehicle

#if defined AB_OnFilterScriptInit
	forward AB_OnFilterScriptInit();
#endif

#if defined AB_OnPlayerConnect
	forward AB_OnPlayerConnect(playerid);
#endif

#if defined AB_OnPlayerSpawn
	forward AB_OnPlayerSpawn(playerid);
#endif

#if defined AB_OnPlayerUpdate
	forward AB_OnPlayerUpdate(playerid);
#endif

#if defined AB_OnPlayerDeath
	forward AB_OnPlayerDeath(playerid, killerid, reason);
#endif

#if defined AB_OnPlayerStateChange
	forward AB_OnPlayerStateChange(playerid, newstate, oldstate);
#endif

forward OnPlayerAirbreak(playerid);