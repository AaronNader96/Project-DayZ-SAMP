/*
 *  Extended actor functions by Emmet
 *
 *  Features:
 *    Many useful functions for more actor control
 *    Automatically preloads animations for an actor
 *    Damage is automatically deducted
 *    Attach 3D labels to an actor
 *    Lots more!
 *
 *  Creation date: May 8, 2015
*/

// Resynchronize an actor.
forward ResyncActor(actorid);
// Respawns an actor.
forward RespawnActor(actorid);
// Checks if the actor is dead.
forward IsActorDead(actorid);
// Sets an actor's respawn time (after death).
forward SetActorRespawnTime(actorid, time);
// Checks if a player is in range of an actor.
forward IsPlayerInRangeOfActor(playerid, actorid, Float:radius = 5.0);
// Attaches a 3D text label to an actor.
forward Text3D:Attach3DTextLabelToActor(actorid, text[], color, Float:fOffsetX, Float:fOffsetY, Float:fOffsetZ, Float:distance = 10.0, worldid = 0, testlos = 0);

// Called when an actor dies.
forward OnActorDeath(actorid, killerid, reason);
// Called when an actor spawns.
forward OnActorSpawn(actorid);
// Called when a player aims at an actor.
forward OnPlayerTargetActor(playerid, newtarget, oldtarget);

// List of animation libraries used for preloading.
static s_AnimationLibraries[][] = {
	!"AIRPORT",    !"ATTRACTORS",   !"BAR", 		!"BASEBALL",
	!"BD_FIRE",    !"BEACH", 	    !"BENCHPRESS",  !"BF_INJECTION",
	!"BIKED", 	   !"BIKEH", 	    !"BIKELEAP", 	!"BIKES",
	!"BIKEV", 	   !"BIKE_DBZ",     !"BMX", 		!"BOMBER",
	!"BOX", 	   !"BSKTBALL",     !"BUDDY", 		!"BUS",
	!"CAMERA", 	   !"CAR",          !"CARRY", 		!"CAR_CHAT",
	!"CASINO",	   !"CHAINSAW",     !"CHOPPA", 		!"CLOTHES",
	!"COACH", 	   !"COLT45",       !"COP_AMBIENT", !"COP_DVBYZ",
	!"CRACK", 	   !"CRIB",         !"DAM_JUMP", 	 !"DANCING",
	!"DEALER", 	   !"DILDO",        !"DODGE", 	 	 !"DOZER",
	!"DRIVEBYS",   !"FAT",          !"FIGHT_B", 	 !"FIGHT_C",
	!"FIGHT_D",    !"FIGHT_E",      !"FINALE", 		 !"FINALE2",
	!"FLAME",      !"FLOWERS",      !"FOOD", 	 	 !"FREEWEIGHTS",
	!"GANGS",      !"GHANDS",       !"GHETTO_DB", 	 !"GOGGLES",
	!"GRAFFITI",   !"GRAVEYARD",    !"GRENADE", 	 !"GYMNASIUM",
	!"HAIRCUTS",   !"HEIST9",       !"INT_HOUSE", 	 !"INT_OFFICE",
	!"INT_SHOP",   !"JST_BUISNESS", !"KART", 		 !"KISSING",
	!"KNIFE",      !"LAPDAN1", 		!"LAPDAN2", 	 !"LAPDAN3",
	!"LOWRIDER",   !"MD_CHASE", 	!"MD_END", 	 	 !"MEDIC",
	!"MISC",       !"MTB", 			!"MUSCULAR", 	 !"NEVADA",
	!"ON_LOOKERS", !"OTB", 			!"PARACHUTE", 	 !"PARK",
	!"PAULNMAC",   !"PED", 			!"PLAYER_DVBYS", !"PLAYIDLES",
	!"POLICE",     !"POOL", 		!"POOR", 		 !"PYTHON",
	!"QUAD",       !"QUAD_DBZ", 	!"RAPPING", 	 !"RIFLE",
	!"RIOT",       !"ROB_BANK", 	!"ROCKET",	 	 !"RUSTLER",
	!"RYDER",      !"SCRATCHING", 	!"SHAMAL", 		 !"SHOP",
	!"SHOTGUN",    !"SILENCED", 	!"SKATE", 		 !"SMOKING",
	!"SNIPER",     !"SPRAYCAN", 	!"STRIP", 		 !"SUNBATHE",
	!"SWAT",       !"SWEET", 		!"SWIM", 		 !"SWORD",
	!"TANK",       !"TATTOOS",	 	!"TEC", 		 !"TRAIN",
	!"TRUCK",      !"UZI", 			!"VAN", 		 !"VENDING",
	!"VORTEX",     !"WAYFARER", 	!"WEAPONS", 	 !"WUZI",
	!"WOP",        !"GFUNK", 		!"RUNNINGMAN"
};

static s_ActorRespawnTimer[MAX_ACTORS] = {-1, ...};
static s_TargetActor[MAX_PLAYERS] = {INVALID_ACTOR_ID, ...};
static s_3DTextActorID[MAX_3DTEXT_GLOBAL] = {INVALID_ACTOR_ID, ...};

stock static PreloadActorAnimations(actorid)
{
	for(new i = 0; i < sizeof(s_AnimationLibraries); i ++)
	{
	    ApplyActorAnimation(actorid, s_AnimationLibraries[i], "null", 0.0, 0, 0, 0, 0, 0);
	}
}

stock ResyncActor(actorid)
{
	if(IsValidActor(actorid))
	{
	    new
	        Float:x,
	        Float:y,
	        Float:z,
			worldid = GetActorVirtualWorld(actorid);
	        
		// Get the actor's position.
		GetActorPos(actorid, x, y, z);
		// Set their position and world to some arbitrary values.
		SetActorPos(actorid, 1000.0, -2000.0, 500.0);
		SetActorVirtualWorld(actorid, random(cellmax));
		// We need a timer to defer the actions. Doing it right away doesn't seem to work.
		SetTimerEx("RestoreActor", 850, 0, "iifff", actorid, worldid, x, y, z);
		return 1;
	}
	return 0;
}

forward RestoreActor(actorid, worldid, Float:x, Float:y, Float:z);
public RestoreActor(actorid, worldid, Float:x, Float:y, Float:z)
{
	SetActorVirtualWorld(actorid, worldid);
	SetActorPos(actorid, x, y, z);
}

// That's right, a public function. See "SetActorRespawnTime" for details.
forward RespawnActor(actorid);
public RespawnActor(actorid)
{
	if(IsValidActor(actorid))
	{
	    // Reset the timer variable if set.
	    s_ActorRespawnTimer[actorid] = -1;
	    // Restore the actor's health.
	    SetActorHealth(actorid, 100.0);
	    // Clear the death animation.
	    ClearActorAnimations(actorid);
	    // Resync the actor.
		ResyncActor(actorid);
		// Call "OnActorSpawn".
		CallLocalFunction("OnActorSpawn", "i", actorid);
		return 1;
	}
	return 0;
}

stock IsActorDead(actorid)
{
	if(IsValidActor(actorid))
	{
	    new
	        Float:health;
	
	    // Get the actor's health.
	    GetActorHealth(actorid, health);
	    return (health <= 0.0);
	}
	return 0;
}

stock SetActorRespawnTime(actorid, time)
{
	if(IsValidActor(actorid))
	{
	    if(s_ActorRespawnTimer[actorid] != -1)
	    {
	        // Kill any previously created timer.
	        KillTimer(s_ActorRespawnTimer[actorid]);
		}
		s_ActorRespawnTimer[actorid] = SetTimerEx("RespawnActor", time, 0, "i", actorid);
		return 1;
	}
	return 0;
}

stock IsPlayerInRangeOfActor(playerid, actorid, Float:radius = 5.0)
{
	new
	    Float:x,
	    Float:y,
	    Float:z;

	if (GetActorPos(actorid, x, y, z))
	{
	    return IsPlayerInRangeOfPoint(playerid, radius, x, y, z) && GetPlayerVirtualWorld(playerid) == GetActorVirtualWorld(actorid);
	}
	return 0;
}

stock Text3D:Attach3DTextLabelToActor(actorid, text[], color, Float:fOffsetX, Float:fOffsetY, Float:fOffsetZ, Float:distance = 10.0, worldid = 0, testlos = 0)
{
	new Text3D:textid = Text3D:INVALID_3DTEXT_ID;

	if(IsValidActor(actorid))
	{
	    new
			Float:x,
			Float:y,
			Float:z;

		GetActorPos(actorid, x, y, z);

		textid = Create3DTextLabel(text, color, x + fOffsetX, y + fOffsetY, (z + 0.8) + fOffsetZ, distance, worldid, testlos);
		
		if(textid != Text3D:INVALID_3DTEXT_ID)
		{
			s_3DTextActorID[_:textid] = actorid;
		}
	}
	return textid;
}

stock AC_CreateActor(modelid, Float:x, Float:y, Float:z, Float:rotation)
{
	new
	    actorid = INVALID_ACTOR_ID;

	if(0 <= modelid <= 311)
	{
		actorid = CreateActor(modelid, x, y, z, rotation);

		if (actorid != INVALID_ACTOR_ID)
		{
		    // Reset the timer variable.
		    s_ActorRespawnTimer[actorid] = -1;
		    // Preload their animations.
		    PreloadActorAnimations(actorid);
		    // Let them know that they've spawned.
		    CallLocalFunction("OnActorSpawn", "i", actorid);
		}
	}
	return actorid;
}

stock AC_DestroyActor(actorid)
{
	if(IsValidActor(actorid))
	{
	    for(new i = 0; i < MAX_3DTEXT_GLOBAL; i ++)
	    {
	        if(s_3DTextActorID[i] == actorid)
	        {
	            // Destroy the 3D text label.
	            Delete3DTextLabel(Text3D:i);
	            // Reset the variable.
	            s_3DTextActorID[i] = INVALID_ACTOR_ID;
			}
		}
		return DestroyActor(actorid);
	}
	return 0;
}

stock AC_Delete3DTextLabel(Text3D:textid)
{
	if(textid != Text3D:INVALID_3DTEXT_ID)
	{
	    // Reset the variable.
	    s_3DTextActorID[_:textid] = INVALID_ACTOR_ID;
		return Delete3DTextLabel(textid);
	}
	return 0;
}

public OnPlayerUpdate(playerid)
{
	new target_actor = GetPlayerTargetActor(playerid);
	
	if (s_TargetActor[playerid] != target_actor)
	{
	    CallLocalFunction("OnPlayerTargetActor", "iii", playerid, target_actor, s_TargetActor[playerid]);
	
	    s_TargetActor[playerid] = target_actor;
	}
	#if defined AC_OnPlayerUpdate
	    return AC_OnPlayerUpdate(playerid);
	#else
	    return 1;
	#endif
}

public OnPlayerGiveDamageActor(playerid, damaged_actorid, Float:amount, weaponid, bodypart)
{
	// Sanity checks for safety. Players can easily manipulate this data.
	if(!IsValidActor(damaged_actorid) || (!(0 <= amount <= 500.0)) || (!(0 <= weaponid <= 42)))
	{
	    return 0;
	}
	else if(!IsActorInvulnerable(damaged_actorid))
	{
	    new
	        Float:health;
	        
		// Deduct the damage from the actor, since it has to be done manually.
		GetActorHealth(damaged_actorid, health);		
		SetActorHealth(damaged_actorid, health - amount);
		
		if(health - amount < 1.0)
		{
		    // There's a bug where animations aren't cleared when an actor dies.
		    ClearActorAnimations(damaged_actorid);
		    // Call the function to let them know they're dead.
		    CallLocalFunction("OnActorDeath", "iii", damaged_actorid, playerid, weaponid);
		}
	}
	#if defined AC_OnPlayerGiveDamageActor
	    return AC_OnPlayerGiveDamageActor(playerid, damaged_actorid, amount, weaponid, bodypart);
	#else
	    return 1;
	#endif
}

#if defined _ALS_CreateActor
	#undef CreateActor
#else
	#define _ALS_CreateActor
#endif

#define CreateActor AC_CreateActor

#if defined _ALS_DestroyActor
	#undef DestroyActor
#else
	#define _ALS_DestroyActor
#endif

#define DestroyActor AC_DestroyActor

#if defined _ALS_Delete3DTextLabel
	#undef Delete3DTextLabel
#else
	#define _ALS_Delete3DTextLabel
#endif

#define Delete3DTextLabel AC_Delete3DTextLabel

#if defined _ALS_OnPlayerUpdate
	#undef OnPlayerUpdate
#else
	#define _ALS_OnPlayerUpdate
#endif

#define OnPlayerUpdate AC_OnPlayerUpdate

#if defined AC_OnPlayerUpdate
	forward AC_OnPlayerUpdate(playerid);
#endif

#if defined _ALS_OnPlayerGiveDamageActor
	#undef OnPlayerGiveDamageActor
#else
	#define _ALS_OnPlayerGiveDamageActor
#endif

#define OnPlayerGiveDamageActor AC_OnPlayerGiveDamageActor

#if defined AC_OnPlayerGiveDamageActor
	forward AC_OnPlayerGiveDamageActor(playerid, damaged_actorid, Float:amount, weaponid, bodypart);
#endif