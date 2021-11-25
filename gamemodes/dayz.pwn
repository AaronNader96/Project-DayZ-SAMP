/*
	Created for Pro Gaming Arena Gaming Community

	Created by: Kitten aka AldenJ aka AaronN
	Created date: 1/1/12
	Created time: 3:41 PM
	Name: GTA SA: DayZ Version
	Saving: MySQL
	Version: 15.0
	Website: www.pgagaming.net
*/

#include <a_samp>
#include <em_actors>
#include <aox>
#include <fcnpc>
#include <YSI\y_timers>
#include <a_mysql>
#include <foreach>
#include <sscanf2>
#include <streamer>
#include <TWD_Map>
#include <dayzmap>
#include <dayzmap2>
#include <OPA>
#include <OPRF>
#include <zcmd>
#include <em_callbacks>
#include <DayZ_AntiG>
#include <mapandreas>
#define ACTION_ANIMATION 0
#define ACTION_SPECIAL 1

// **** DEFINES **** //


#define mysql_host "127.0.0.1"
#define mysql_user  "root"
#define mysql_password ""
#define mysql_database  "pgadata"

//achievements
#define SAN_ANDREAS
#define function%0(%1) forward%0(%1);public%0(%1)
#define Web "www.pgagaming.net"
#define Country "[EUROPE]"
#define Version "v15.0"
#define Creator "Kitten aka AldenJ" // Please be kind and don't remove this.
#define Name "GTA SA: DayZ Survival [ZOMBIE AI]"
#define CName "Pro Gaming Arena"
#define MAX_ZONE_NAME 28
#define MAX_GROUPS 750
#define chat "*"COL_GREY""
#define COLOR_GREY 0xAFAFAFAA
#define PUB:%1(%2) forward %1(%2); public %1(%2)
#define FREEZE_SECONDS 4

// ZOMBIES DEFINES/VARS

/*new Float:ZombieSpawns[143][4] = {
    {-825.9671,2729.4717,45.1012,255.4783},
    {-1064.4177,2707.2148,45.3792,99.6452},
    {-1281.9844,2664.5693,48.7234,107.0047},
    {-1332.7228,2678.5522,49.5744,79.7324},
    {-1386.1951,2666.0359,53.8773,119.1012},
    {-1418.6554,2641.1406,55.2006,136.6854},
    {-1404.1969,2602.4937,55.6236,269.5939},
    {-1484.5090,2602.1516,55.7732,89.5286},
    {-1548.7303,2633.4802,55.7724,6.9467},
    {-1609.1580,2674.0217,54.7038,91.9435},
    {-1633.7620,2718.4294,57.8753,328.5281},
    {-1437.9374,2724.3000,63.8427,260.5851},
    {-897.9666,2724.8330,45.9516,277.4561},
    {-732.2018,2609.6226,68.2760,186.0247},
    {-612.5167,2449.9124,73.1783,229.4343},
    {-387.8448,2707.5139,63.0170,227.4447},
    {-280.7452,2702.7449,62.6244,268.0680},
    {-181.6376,2661.2927,62.8136,178.3579},
    {-142.6441,2633.9231,63.8693,276.9792},
    {11.8275,2648.9990,59.8386,284.3040},
    {106.5839,2702.2649,52.3880,303.6599},
    {350.9331,2547.2456,16.6709,228.0592},
    {403.6035,2498.2578,16.5691,238.4742},
    {421.3118,2378.6580,25.8638,131.1519},
    {323.5224,2296.4941,25.2488,127.4648},
    {227.9996,2145.5991,20.7631,144.1763},
    {93.5090,2131.4270,17.3128,85.8210},
    {-17.5732,2080.4194,17.9191,148.4809},
    {-44.8997,2002.0903,17.7312,160.3588},
    {-61.9454,1948.4142,17.4222,167.0028},
    {-64.3600,1880.8741,17.3127,180.1051},
    {-66.0477,1809.0233,17.3111,176.8593},
    {-63.8027,1726.6300,17.4493,185.7672},
    {12.1235,1648.1473,17.3121,273.0060},
    {79.6323,1699.8873,17.6939,321.5863},
    {192.4249,1773.6979,17.7254,274.8007},
    {299.8374,1772.4604,17.7252,273.6678},
    {366.7431,1818.0957,17.3861,332.5170},
    {312.4559,1822.5929,17.7258,57.0566},
    {305.0099,1931.6914,17.7260,359.5454},
    {307.8422,2003.8018,17.7246,332.9029},
    {331.6662,2053.1255,17.7344,335.8513},
    {307.1968,2074.6235,17.7254,87.5569},
    {244.7239,2066.2439,17.7255,106.1071},
    {215.7333,2047.5599,17.7255,129.5582},
    {209.2242,1988.6121,17.7259,179.7318},
    {220.9723,1949.0236,17.7249,290.2694},
    {255.4149,2011.5507,17.7254,340.1191},
    {287.2681,2024.5989,17.7248,254.2962},
    {312.3928,1973.8531,17.7254,188.8846},
    {307.7942,1913.7115,17.7254,166.8202},
    {305.2443,1844.3384,17.7256,181.5950},
    {2.9293,1888.1553,17.7251,269.7042},
    {60.4884,1902.7981,17.6603,290.3565},
    {-113.3255,1618.0692,18.3429,153.7179},
    {-79.7020,1435.0593,9.4466,194.5962},
    {-66.2380,1296.5500,11.6157,176.2811},
    {-116.2800,1183.2864,19.6830,182.5854},
    {-168.7235,1149.2656,19.6827,84.2942},
    {-267.6342,1094.5884,19.6763,97.6338},
    {-313.9167,1068.3419,19.6772,200.7931},
    {-109.8445,793.3681,20.9345,199.5566},
    {45.4236,639.6939,6.8497,289.5939},
    {580.1889,687.4570,3.8185,255.8286},
    {1163.2378,900.5487,10.8857,322.2430},
    {1369.6564,1194.3245,10.7565,269.1237},
    {1750.2537,1134.5574,11.7063,270.5624},
    {1968.8763,1088.2845,10.8254,276.7326},
    {2062.7903,1073.6366,10.7186,240.2277},
    {2069.3289,1374.2085,10.7565,0.9520},
    {2066.0344,1592.4197,10.7607,7.0786},
    {2105.3040,1823.8339,10.7571,341.0135},
    {2121.6692,2061.9719,10.7563,358.1887},
    {2227.1355,2412.6240,10.9357,356.5257},
    {2233.7454,2461.5527,10.8365,342.0970},
    {2254.4287,2514.8271,10.7572,271.9628},
    {2428.2219,2298.1392,10.7569,180.0636},
    {2150.2727,969.8882,10.9144,91.3486},
    {2065.0317,892.7457,7.6404,176.5178},
    {1421.7560,296.5798,19.5035,166.6350},
    {1370.3341,290.5706,19.4909,56.3984},
    {1307.0540,290.8315,19.4914,157.9823},
    {1268.5134,212.3048,19.5800,150.8178},
    {1291.8079,-72.3747,36.4015,244.6055},
    {2085.5391,40.0099,26.4164,274.3421},
    {2209.0066,38.7059,26.4207,261.7877},
    {2293.8479,74.4090,26.4211,6.3681},
    {2349.7334,96.1799,26.4136,268.5847},
    {2440.3789,38.2783,26.4053,276.4113},
    {2591.5740,42.4622,26.4204,266.4754},
    {2717.6479,-224.8930,30.0294,194.3474},
    {2870.8792,-1508.3734,10.9427,172.8629},
    {2647.0232,-1665.8752,10.9216,131.8898},
    {2529.6157,-1731.7549,13.4673,84.9150},
    {2431.7737,-1701.9934,16.6253,2.9919},
    {2457.3210,-1653.1631,13.4200,248.2415},
    {2473.4971,-1668.2030,13.3169,248.2415},
    {2261.4873,-1657.1636,15.1994,85.4946},
    {2216.8958,-1649.5994,15.2587,63.2233},
    {2019.0723,-1613.7993,12.8948,86.0465},
    {1717.7722,-1596.7198,12.8710,83.0621},
    {1566.3196,-1595.4735,12.8948,89.7098},
    {1516.4716,-1624.5345,13.3088,178.9028},
    {1311.2418,-1706.3357,12.8948,16.5181},
    {1354.1589,-1412.2457,12.8752,355.1088},
    {1296.7242,-1283.9805,12.8955,81.1459},
    {1231.3910,-1288.2087,13.0147,85.5856},
    {-2929.5059,-1283.1632,10.5081,353.7692},
    {-2607.9150,-89.3578,3.6916,3.2219},
    {-2706.5994,278.9375,3.6998,359.5922},
    {-2639.4771,594.6860,13.9651,65.1610},
    {-2639.8350,614.7553,13.9650,342.4626},
    {-2575.2488,604.0474,13.9696,250.9091},
    {-2533.5469,567.5513,13.9807,226.1202},
    {-2014.6189,566.2373,34.5311,272.9274},
    {-1903.5126,460.3619,34.6838,257.3239},
    {-1805.9987,375.7469,16.5365,229.6055},
    {-1598.6996,445.7244,6.5432,313.7778},
    {-1527.3728,477.1425,6.6994,226.2294},
    {-1472.5105,469.3613,6.6994,263.5919},
    {-1293.9309,455.7596,6.6994,271.4634},
    {-1055.6493,-538.9343,32.0001,276.1132},
    {-945.8435,-507.5698,25.9502,308.3602},
    {-761.9507,-441.1248,16.1705,285.5455},
    {-440.6606,-429.4647,16.1983,235.4044},
    {-649.1995,-1321.5248,19.3019,160.3392},
    {-297.7698,-1722.5636,14.8063,195.5044},
    {-81.3262,-2506.2874,39.1291,220.5768},
    {-27.6791,-2683.3855,42.2794,182.7604},
    {-1590.1791,-2732.1890,48.5307,40.1697},
    {-1782.9069,-2564.7991,54.1537,43.4236},
    {-2056.6599,-2482.0725,30.2256,35.7778},
    {-2080.9487,-2458.4880,30.4611,42.0361},
    {-2137.0193,-2414.2598,30.4616,36.8217},
    {-2138.8340,-2332.2114,30.5142,60.9669},
    {-2172.1958,-2152.7178,49.9064,309.3747},
    {-94.4465,-1135.6042,1.1928,175.0969},
    {186.5159,-1594.7524,14.0066,224.3897},
    {409.9994,-1706.0356,9.1069,264.0287},
    {628.8046,-1548.6526,15.2074,349.9023},
    {756.2557,-1399.4371,13.3608,273.0606},
    {1286.3766,-1408.9264,13.1295,251.5307},
    {1294.7103,-1657.8138,13.3745,179.1254}
};*/

PlayAnim(playerid, animlib[], animname[], Float:fDelta, loop, lockx, locky, freeze, time, forcesync)
{
	ApplyAnimation(playerid, animlib, animname, fDelta, loop, lockx, locky, freeze, time, forcesync);
}


#define MAX_ZOMBIES 400
new SpawnedZombies = 0;
new ZombiesTimer;
new IsAZombie[MAX_PLAYERS];
new Timer:ZombieTimer[MAX_PLAYERS];
new ZombieAttackPlayer[MAX_PLAYERS];


//END OF ZOMBIES


new weapons[13][2];


new
    bool:OPRF_Processed[MAX_PLAYERS];


#define SAN_ANDREAS
#define ACCURACY 0.5

#define J_TABLE samp_ban
#define J_LOGGING 1
#define COLOR_RED 0xFF0000FF

#define MAX_PLAYER_IP 15
#define MAX_QUERY_LENGTH 400
#define MAX_RESULT_LENGTH 74
#define MAX_MESSAGE_LENGTH 128
#define MAX_REASON_LENGTH 90

#define QUERY_INITIALIZE 100
#define QUERY_BAN 101
#define QUERY_CHECKNAME 102
#define QUERY_UNBAN_NAME 103
#define QUERY_UNBAN_IP 104

#define NIGHT 1
#define DAY 2
#define DRANGEZ 20
// ACH
new globalStatus[MAX_PLAYERS];
new globalChat[MAX_PLAYERS];
new giveWeaponAllow[MAX_PLAYERS];
new timeMode;
new isPlayerInMenu[MAX_PLAYERS] = 0;
new gotBanned[MAX_PLAYERS] = 0;
new jNames[MAX_PLAYERS][MAX_PLAYER_NAME], jIP[MAX_PLAYERS][MAX_PLAYER_IP];
new gRegistred[MAX_PLAYERS];
new handle;
new jQuery[MAX_QUERY_LENGTH];
new ban_reason[MAX_REASON_LENGTH], ban_target, ban_time;

#define DIALOG_REGISTER 0
#define DIALOG_LOGIN 1
#define DIALOG_BANNED 2
#define DIALOG_LOOT_ZOMBIE 3
#define DIALOG_TENT_2 4
#define DIALOG_LOOTING 5
#define DIALOG_ADMINS 6
#define DIALOG_VIPS 7
#define DIALOG_WARN 8
#define DIALOG_SELECT_SKIN 9
#define DIALOG_LOOTING_DROP 10
#define DIALOG_GLOBAL_CHAT 11
#define DIALOG_LOOTING_DROPZ 12
#define DIALOG_LOOTING_DEAD 13
#define DIALOG_VEHICLE_STORAGE 14
#define DIALOG_VEHICLE_STORAGE_S 15
#define DIALOG_VEHICLE_STORAGE_S2 16
#define DIALOG_TENT_VIEW 17
#define DIALOG_TENT_VIEW_S 18
#define DIALOG_TENT_VIEW_S2 19
#define DIALOG_HOSPITAL 20
#define DIALOG_RADIO 21
#define DIALOG_AMBIENT 22
#define DIALOG_LOOT_HUMAN 23
#define DIALOG_LOOT_BODY_TEST 24
#define DIALOG_CAMPFIRE 25
#define DIALOG_OPTIONS 26
#define DIALOG_GENDEROPTION 27
#define DIALOG_AMBIENTOPTION 28
#define DIALOG_AMBIENTOPTION_2 29
#define DIALOG_GENDEROPTION_2 30
#define DIALOG_COIN 31
#define DIALOG_PLAYERITEMS 32
#define DIALOG_ITEMS 33
#define DIALOG_AIRDROP 1337
#define INV_DIALOG_ID 1000
#define DIALOG_INV_EDIT 2444
#define INV_DIALOG_LOOT_ID 3000
#define MAX_ITEMS 64
#define MAX_ITEM_STACK 99
#define MAX_ITEM_NAME 64
#define ITEM_PATH "/DayZSA/Inv"

#define BANDIT 33
#define NORMAL 299
#define HERO 294
#define FEMALE 56
#define CIV 287
#define SNIP 285
#define CIVSKIN 179

#define MALE_ID 1
#define FEMALE_ID 2

#define TWO_TIRE_VEHICLE GetVehicleModel(GetPlayerVehicleID(playerid)) == 468
#define SIX_TIRE_VEHICLE GetVehicleModel(GetPlayerVehicleID(playerid)) == 431 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 455 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 433
#define NO_TIRE_VEHICLE GetVehicleModel(GetPlayerVehicleID(playerid)) == 509 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 510
#define ENGINE_ONLY_VEHICLE GetVehicleModel(GetPlayerVehicleID(playerid)) == 487 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 453 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 473 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 484 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 511 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 417

#define TWO_TIRE_VEHICLE_ADD GetVehicleModel(GetVehicleNearID(playerid)) == 468
#define SIX_TIRE_VEHICLE_ADD GetVehicleModel(GetVehicleNearID(playerid)) == 431 || GetVehicleModel(GetVehicleNearID(playerid)) == 455 || GetVehicleModel(GetVehicleNearID(playerid)) == 433
#define NO_TIRE_VEHICLE_ADD GetVehicleModel(GetVehicleNearID(playerid)) == 509 || GetVehicleModel(GetVehicleNearID(playerid)) == 510
#define ENGINE_ONLY_VEHICLE_ADD GetVehicleModel(GetVehicleNearID(playerid)) == 487 || GetVehicleModel(GetVehicleNearID(playerid)) == 453 || GetVehicleModel(GetVehicleNearID(playerid)) == 473 || GetVehicleModel(GetVehicleNearID(playerid)) == 484 || GetVehicleModel(GetVehicleNearID(playerid)) == 511 || GetVehicleModel(GetVehicleNearID(playerid)) == 417

#define ARMEDBODY_USE_HEAVY_WEAPON	(true)
static armedbody_pTick[MAX_PLAYERS];

#define BODY_PART_HEAD (1)
#define BODY_PART_TORSO (2)
#define BODY_PART_LEGS (3)
#define MAX_SPEED (198)

#define ITEM_TYPE_LOOT 0
#define ITEM_TYPE_TENT 1
#define ITEM_TYPE_HUMANBODY 2
#define ITEM_TYPE_ZOMBIEBODY 3
#define ITEM_TYPE_COMMAND 4

#define MAX_LOOTING 20000
#define MAX_TENTS 500
#define MAX_CAMPS 1000
#define ZOMBIE_PREFIX "DayZSA_Zombie_"

#define IsAlphaNum(%0)((%0 >= 0x41 && %0 <= 0x5A) || (%0 >= 0x61 && %0 <= 0x7A) || (%0 >= '0' && %0 <= '9'))
#define FormattedMessage(%1)(format(szFormat, 128, %1), szFormat)


#define PRESSED(%0) (((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))
#define HOLDING(%0) ((newkeys & (%0)) == (%0))
#define RELEASED(%0) (((newkeys & (%0)) != (%0)) && ((oldkeys & (%0)) == (%0)))

#define COL_WHITE          "{FFFFFF}"
#define COL_GREY           "{C3C3C3}"
#define COL_GREEN          "{37DB45}"
#define COL_RED            "{F81414}"
#define COL_YELLOW         "{F3FF02}"
#define COL_ORANGE         "{F9B857}"
#define COL_BLUE           "{0049FF}"
#define COL_PINK           "{FF00EA}"
#define COL_LIGHTBLUE      "{00C0FF}"
#define COL_LGREEN         "{C9FFAB}"
#define RED 0xFF0000FF
#define COLOR_BLUE 0x33CCFF00
#define COLOR_WHITE 0xFFFFFF00
#define COLOR_PINK 0xFFC0CB00
#define COLOR_BROWN 0xA9A9A900

// **** VARIABLES **** //
new abWarn[MAX_PLAYERS];
new abAllow[MAX_PLAYERS];
new gItemList[(MAX_ITEMS+1)*(MAX_ITEM_NAME+3)];
new ScreenStatus[MAX_PLAYERS] = 0;
new FadeTDTimer[MAX_PLAYERS] = -1;
new BlockMap;
new Float:x2d, Float:y2d, Float:z2d;
new PlayersAlive;
new RoadFlare[MAX_PLAYERS];
new p_CarWarpTime[MAX_PLAYERS];
new p_CarWarpVehicleID[MAX_PLAYERS];
new player_Handsup[MAX_PLAYERS];
new engine,lights,alarm,doors,bonnet,boot,objective;
//new Float:LastPosition[MAX_PLAYERS][3];
//new TeleportWarnings[MAX_PLAYERS];
new TeleportAllowed[MAX_PLAYERS];
new firstperson[MAX_PLAYERS];
new LastDeath[MAX_PLAYERS];
new DeathSpam[MAX_PLAYERS char];
new DLlast[MAX_PLAYERS] = 0;
new FPS2[MAX_PLAYERS] = 0;
new bool:PlayerWeapons[MAX_PLAYERS][47],bool:Spawned[MAX_PLAYERS];
new strwep[128];
new strupdate[285];
new lootCount;
new tentCount;
new groupCount;
new campCount;
new CurrentWeather;
new Handup[MAX_PLAYERS] = 0;
new Float:p_PlayerBuggerX[MAX_PLAYERS], Float:p_PlayerBuggerY[MAX_PLAYERS], Float:p_PlayerBuggerZ[MAX_PLAYERS];
new Text:Clock;
new Text:Date;
new Text:Announcement;
new Text:WholeScreen;
new Text:DebugBox;
new Text:DebugText;
new Text:DayZSA_Web;
new PlayerText:VehicleBG[MAX_PLAYERS];
new PlayerText:EngineIcon[MAX_PLAYERS];
new PlayerText:SpeedIcon[MAX_PLAYERS];
new PlayerText:TireIcon[MAX_PLAYERS];
new PlayerText:FuelIcon[MAX_PLAYERS];
new PlayerText:PlayerVehicleName[MAX_PLAYERS];
new PlayerText:WebsiteLogo[MAX_PLAYERS];
new PlayerText:GeneralInfo[MAX_PLAYERS];
new PlayerText:blockMap[MAX_PLAYERS];
new PlayerText:HudBG_1[MAX_PLAYERS];
new PlayerText:DebugMonitor_Text[MAX_PLAYERS];
new PlayerText:Debug_GunIcon[MAX_PLAYERS];
new PlayerText:Debug_GunInfo[MAX_PLAYERS];
new PlayerText:MenuLogo[MAX_PLAYERS];
new PlayerText:MenuBG[MAX_PLAYERS];
new PlayerText:MenuPlay[MAX_PLAYERS];
new PlayerText:MenuOptions[MAX_PLAYERS];
new PlayerText:MenuPremium[MAX_PLAYERS];
new PlayerText:MenuCredits[MAX_PLAYERS];
new PlayerText:MenuURL[MAX_PLAYERS];
new PlayerText:MenuBlackLayer1[MAX_PLAYERS];
new PlayerText:MenuBlackLayer2[MAX_PLAYERS];
new PlayerText:PlayerFade[MAX_PLAYERS];
new PlayerText:Map[MAX_PLAYERS];
new PlayerText:PlayerBlood[MAX_PLAYERS];
new PlayerText:PlayerHunger[MAX_PLAYERS];
new PlayerText:PlayerThirst[MAX_PLAYERS];
new PlayerText:PlayerNoise[MAX_PLAYERS];
new PlayerText:PlayerEye[MAX_PLAYERS];
new PlayerText:DebugInfo[MAX_PLAYERS];
new PlayerText:LegBroken[MAX_PLAYERS];
new PlayerText:vehicleInfo[MAX_PLAYERS];
new PlayerText:playerBandit[MAX_PLAYERS];
new PlayerText:PlayerTemp[MAX_PLAYERS];
new PlayerText:NoiseLevel1[MAX_PLAYERS];
new PlayerText:NoiseLevel2[MAX_PLAYERS];
new PlayerText:NoiseLevel3[MAX_PLAYERS];
new PlayerText:NoiseLevel4[MAX_PLAYERS];
new PlayerText:EyeLevel1[MAX_PLAYERS];
new PlayerText:EyeLevel2[MAX_PLAYERS];
new PlayerText:EyeLevel3[MAX_PLAYERS];
new PlayerText:EyeLevel4[MAX_PLAYERS];
new PlayerText:PlayerIntroBox[MAX_PLAYERS];
new PlayerText:PlayerIntroVersion[MAX_PLAYERS];
new PlayerText:PlayerIntroNote[MAX_PLAYERS];
new ZombiesAlive = MAX_ZOMBIES;
new Text3D:PlayerLabel[MAX_PLAYERS];
new Float:SpecX[MAX_PLAYERS];
new Float:SpecY[MAX_PLAYERS];
new Float:SpecZ[MAX_PLAYERS];
new vWorld[MAX_PLAYERS];
new Inter[MAX_PLAYERS];
new IsSpecing[MAX_PLAYERS];
new IsBeingSpeced[MAX_PLAYERS];
new spectatorid[MAX_PLAYERS];
new zonegps[MAX_ZONE_NAME], stringgps[30];
new hit[MAX_PLAYERS];
new hit1[MAX_PLAYERS];
new Float:damage2[MAX_PLAYERS];
new Float:damage1[MAX_PLAYERS];
new timerdamage[MAX_PLAYERS];
new timerdamage1[MAX_PLAYERS];
new PlayerText:Indicator[MAX_PLAYERS];
new PlayerText:IndicatorBox[MAX_PLAYERS];
new PlayerText:Indicator1[MAX_PLAYERS];
new PlayerText:IndicatorBox1[MAX_PLAYERS];

// **** FORWARDS ***** //
forward Kick_Load(playerid);
forward KickEx(playerid);
forward WhenAccountCheck(playerid, password[]);
forward OnPlayerRegister(playerid, password[]);
forward OnPlayerAccountLogin(playerid, enteredPassword[]);
forward WhenPlayerLogin(playerid);
forward OnPlayerUseItem(playerid,ItemName[]);
forward ab_OnEnterExitModShop();
forward OnPlayerKillZombie(playerid,zombieid,weaponid);
forward OnZombieKillPlayer(zombieid,playerid);

WasteDeAMXersTime()
{
    new b;
    #emit load.pri b
    #emit stor.pri b
}

AntiDeAMX()
{
    new a[][] =
    {
        "Unarmed (Fist)",
        "Brass K"
    };
    #pragma unused a
}

// **** ENUMERATORS **** //
new randomMessages[][] =
{
	"*"COL_LIGHTBLUE" Buy Premium/V.I.P at www.pgagaming.net",
 	"*"COL_LIGHTBLUE" Join our forums today! "Web"",
  	"*"COL_LIGHTBLUE" Use global chat to talk to others via /o or /ooc",
  	"*"COL_LIGHTBLUE" Remember to report hackers and rule breakers at /report [id] [reason]",
  	"*"COL_LIGHTBLUE" Join our discord server! More information on our forums!",
  	"*"COL_LIGHTBLUE" Remember to read the rules to prevent you from getting banned /rules"
};

enum pinfo
{
	firstspawn,
	pname23[MAX_PLAYER_NAME],
	hacker
};
new gpInfo[MAX_PLAYERS][pinfo];

enum lootinfo
{
	LootID,
	ModelID,
	LootName[64],
	Float:xLoot,
	Float:yLoot,
	Float:zLoot,
	Text3D:TextID,
	lootDrop[64],
	Float:xLootdrop,
	Float:yLootdrop,
	Float:zLootdrop,
	Float:xLootdropZ,
	Float:yLootdropZ,
	Float:zLootdropZ,
	Float:zLootDeadBodyX,
	Float:zLootDeadBodyY,
	Float:zLootDeadBodyZ,
	HospitalID,
	Float:xHos,
	Float:yHos,
	Float:zHos,
	AirID,
	Float:xAir,
	Float:yAir,
	Float:zAir,
	HosSlot1[64],
	HosSlot2[64],
	HosSlot3[64],
	HosSlot4[64],
	HosSlot5[64],
	HosSlot6[64],
	AirSlot1[64],
	AirSlot2[64],
	AirSlot3[64],
	AirSlot4[64],
	AirSlot5[64],
	AirSlot6[64],
	AirSlot7[64],
	AirSlot8[64],
	AirSlot9[64],
	AirSlot10[64],
	AirSlot11[64],
	AirSlot12[64],
	Float:LootRotX,
	Float:LootRotY,
	Float:LootRotZ,
	dropID,
	Float:dLootRotX,
	Float:dLootRotY,
	Float:dLootRotZ,
	AntiDup,
	DropGunID,
	DropGunAmmo,
	Float:DropGunX,
	Float:DropGunY,
	Float:DropGunZ,
	Float:DropGunXR,
	Float:DropGunYR,
	Float:DropGunZR
};
new Loot[MAX_LOOTING][lootinfo];

enum groupstats
{
	GroupOwner[24],
	GroupMembers,
	GroupName[16],
	GroupID
}
new Groups[MAX_GROUPS][groupstats];

enum vehicleinfo
{
	vehicleTires,
	vehicleFuel,
	vehicleEngine,
	vSlot1[64],
	vSlot2[64],
	vSlot3[64],
	vSlot4[64],
	vSlot5[64],
	vSlot6[64],
	Float:vX,
	Float:vY,
	Float:vZ,
	vehicleSlots,
	Text3D:vehicleText
}
new vInfo[MAX_VEHICLES][vehicleinfo];

enum tentinfo
{
	tentSlot1[64],
	tentSlot2[64],
	tentSlot3[64],
	tentSlot4[64],
	tentSlot5[64],
	tentSlot6[64],
	tentSlot7[64],
	tentSlot8[64],
	tentSlot9[64],
	tentSlot10[64],
	tentSlot11[64],
	tentSlot12[64],
	tentSlot13[64],
	tentSlot14[64],
	tentSlot15[64],
	tentSlot16[64],
	Float:xTent,
	Float:yTent,
	Float:zTent,
	Text3D:tentText,
	TentID
}
new Tent[MAX_TENTS][tentinfo];

enum campinfo
{
	Float:xTent,
	Float:yTent,
	Float:zTent,
	Text3D:tentText,
}
new CampFire[MAX_CAMPS][campinfo];

enum playerinfo
{
	Username[24],
	Password[128],
	Headshots,
	Murders,
	BanditsKilled,
	ZombiesKilled,
	Backpack,
	BackpackSlots,
	BackpackSlotsUsed,
	pAdminLevel,
	pPremium,
 	Float:pX,
	Float:pY,
	Float:pZ,
	pWeap1,
	pAmmo1,
	pWeap2,
	pAmmo2,
	pWeap3,
	pAmmo3,
	pWeap4,
	pAmmo4,
	pWeap5,
	pAmmo5,
	pWeap6,
	pAmmo6,
	pWeap7,
	pAmmo7,
	pWeap8,
	pAmmo8,
	pWeap9,
	pAmmo9,
	pHour,
	pMin,
	pSec,
	pBlood,
	pThrist,
	pHunger,
	Humanity,
	pFirstSpawn,
	pAliveTime,
	pIsMapOpened,
	pSkin,
	Helper,
	IsPlayerBleeding,
	IsPlayerLegBroken,
	pAmbientEnable,
	DefaultGender,
	IsPlayerBandit,
	IsPlayerHero,
	IsPlayerMakingNoise,
	IsPlayerVisual,
	IsPlayerSpawned,
	Bleeding,
	FirstPerson,
	IsViewingTentID,
	IsPlayerMuted,
	pPM,
	pWarnings,
	pUserID,
	pSpamDrop,
	pSpamAsk,
	pAirbreakWarning,
	pCleoFlyWarning,
	pStorageLink,
	pTentLink,
	pTentCreated,
	pItemLink[64],
	Float:pRadioFreq,
	IsPlayerInGroup,
	IsPlayerGroupOwner,
	IsPlayerInGroupID,
	IsPlayerInvited,
	IsPlayerInvitedGroupID,
	IsPlayerCleoFly,
	IsPlayerDrunk,
	IsPlayerDrunkTimer,
	Float:pTemp,
	pInfection,
	pProne,
	pFade,
	pGroupSpam,
	pSaveSpam,
	pProneSpam,
	pLogged,
 	pFlashlight,
 	pKidnapped,
 	ZombiesWarn
};
new pInfo[MAX_PLAYERS][playerinfo];


new VehicleNames[212][] =
{
	{"Landstalker"},{"Bravura"},{"Buffalo"},{"Linerunner"},{"Perrenial"},{"Sentinel"},{"Dumper"},
	{"Firetruck"},{"Trashmaster"},{"Stretch"},{"Manana"},{"Infernus"},{"Voodoo"},{"Pony"},{"Mule"},
	{"Cheetah"},{"Ambulance"},{"Leviathan"},{"Moonbeam"},{"Esperanto"},{"Taxi"},{"Washington"},
	{"Bobcat"},{"Mr Whoopee"},{"BF Injection"},{"Hunter"},{"Premier"},{"Enforcer"},{"Securicar"},
	{"Banshee"},{"Predator"},{"Bus"},{"Rhino"},{"Barracks"},{"Hotknife"},{"Trailer 1"},{"Previon"},
	{"Coach"},{"Cabbie"},{"Stallion"},{"Rumpo"},{"RC Bandit"},{"Romero"},{"Packer"},{"Monster"},
	{"Admiral"},{"Squalo"},{"Seasparrow"},{"Pizzaboy"},{"Tram"},{"Trailer 2"},{"Turismo"},
	{"Speeder"},{"Reefer"},{"Tropic"},{"Flatbed"},{"Yankee"},{"Caddy"},{"Solair"},{"Berkley's RC Van"},
	{"Skimmer"},{"PCJ-600"},{"Faggio"},{"Freeway"},{"RC Baron"},{"RC Raider"},{"Glendale"},{"Oceanic"},
	{"Sanchez"},{"Sparrow"},{"Patriot"},{"Quad"},{"Coastguard"},{"Dinghy"},{"Hermes"},{"Sabre"},
	{"Rustler"},{"ZR-350"},{"Walton"},{"Regina"},{"Comet"},{"BMX"},{"Burrito"},{"Camper"},{"Marquis"},
	{"Baggage"},{"Dozer"},{"Maverick"},{"News Chopper"},{"Rancher"},{"FBI Rancher"},{"Virgo"},{"Greenwood"},
	{"Jetmax"},{"Hotring"},{"Sandking"},{"Blista Compact"},{"Police Maverick"},{"Boxville"},{"Benson"},
	{"Mesa"},{"RC Goblin"},{"Hotring Racer A"},{"Hotring Racer B"},{"Bloodring Banger"},{"Rancher"},
	{"Super GT"},{"Elegant"},{"Journey"},{"Bike"},{"Mountain Bike"},{"Beagle"},{"Cropdust"},{"Stunt"},
	{"Tanker"}, {"Roadtrain"},{"Nebula"},{"Majestic"},{"Buccaneer"},{"Shamal"},{"Hydra"},{"FCR-900"},
	{"NRG-500"},{"HPV1000"},{"Cement Truck"},{"Tow Truck"},{"Fortune"},{"Cadrona"},{"FBI Truck"},
	{"Willard"},{"Forklift"},{"Tractor"},{"Combine"},{"Feltzer"},{"Remington"},{"Slamvan"},
	{"Blade"},{"Freight"},{"Streak"},{"Vortex"},{"Vincent"},{"Bullet"},{"Clover"},{"Sadler"},
	{"Firetruck LA"},{"Hustler"},{"Intruder"},{"Primo"},{"Cargobob"},{"Tampa"},{"Sunrise"},{"Merit"},
	{"Utility"},{"Nevada"},{"Yosemite"},{"Windsor"},{"Monster A"},{"Monster B"},{"Uranus"},{"Jester"},
	{"Sultan"},{"Stratum"},{"Elegy"},{"Raindance"},{"RC Tiger"},{"Flash"},{"Tahoma"},{"Savanna"},
	{"Bandito"},{"Freight Flat"},{"Streak Carriage"},{"Kart"},{"Mower"},{"Duneride"},{"Sweeper"},
	{"Broadway"},{"Tornado"},{"AT-400"},{"DFT-30"},{"Huntley"},{"Stafford"},{"BF-400"},{"Newsvan"},
	{"Tug"},{"Trailer 3"},{"Emperor"},{"Wayfarer"},{"Euros"},{"Hotdog"},{"Club"},{"Freight Carriage"},
	{"Trailer 3"},{"Andromada"},{"Dodo"},{"RC Cam"},{"Launch"},{"Police Car (LSPD)"},{"Police Car (SFPD)"},
	{"Police Car (LVPD)"},{"Police Ranger"},{"Picador"},{"S.W.A.T. Van"},{"Alpha"},{"Phoenix"},{"Glendale"},
	{"Sadler"},{"Luggage Trailer A"},{"Luggage Trailer B"},{"Stair Trailer"},{"Boxville"},{"Farm Plow"},
	{"Utility Trailer"}
};

new Float:randomSpawns_DayZSA_Part1[17][3] =
{
	{2860.7 ,-218.39999 ,11.3},
	{1655.7 ,-2752.0 ,5.4},
	{522.59998 ,-1896.6 , 2.0},
	{-149.89999 ,-2350.0 ,27.6},
	{-2401.1001 ,-2826.3 ,3.0},
	{-2957.2 ,-1355.9 ,7.6},
	{-2904.3999 ,86.6 ,4.0},
	{-2767.2 ,2787.6001 ,223.7},
	{-1121.4 ,2839.6001 ,53.7},
	{114.5 ,2915.1001 ,48.5},
	{1048.0 ,2909.1001 ,47.8},
	{2963.8999 ,1147.3 ,30.2},
	{1624.4 ,423.29999 ,14.9},
	{182.0 ,150.10001 ,1.7},
	{-770.09998 ,208.2 ,2.1},
	{-339.39999 ,-421.29999 ,5.2},
	{-586.09998 ,-1503.5 ,10.1}
};

enum gas_Coords
{
	Float:xGas,
	Float:yGas,
	Float:zGas
}

new DayZSA_GasStations[][gas_Coords] =
{
	{ 1595.5406, 2198.0520, 10.3863 },
	{ 2202.0649, 2472.6697, 10.5677 },
	{ 2115.1929, 919.9908, 10.5266 },
	{ 2640.7209, 1105.9565, 10.5274 },
	{ 608.5971, 1699.6238, 6.9922 },
	{ 618.4878, 1684.5792, 6.9922 },
	{ 2146.3467, 2748.2893, 10.5245 },
	{ -1679.4595, 412.5129, 6.9973 },
	{ -1327.5607, 2677.4316, 49.8093 },
	{ -1470.0050, 1863.2375, 32.3521 },
	{ -2409.2200, 976.2798, 45.2969 },
	{ -2244.1396, -2560.5833, 31.9219 },
	{ -1606.0544, -2714.3083, 48.5335 },
	{ 1937.4293, -1773.1865, 13.3828 },
	{ -91.3854, -1169.9175, 2.4213 },
	{ 1383.4221, 462.5385, 20.1506 },
	{ 660.4590, -565.0394, 16.3359 },
	{ 1381.7206, 459.1907, 20.3452 },
	{ -1605.7156, -2714.4573, 48.5335 },
	{ 1008.1107, -937.3372, 42.6493 },
	{ -2029.4047, 157.2388, 28.5722 },
	{-4007.7195,2145.5837,7.8092}
};

enum SAZONE_MAIN
{
	SAZONE_NAME[28],
	Float:SAZONE_AREA[6]
};

static const gSAZones[][SAZONE_MAIN] =
{
	//	NAME                            AREA (Xmin,Ymin,Zmin,Xmax,Ymax,Zmax)
	{"The Big Ear",	                {-410.00,1403.30,-3.00,-137.90,1681.20,200.00}},
	{"Aldea Malvada",               {-1372.10,2498.50,0.00,-1277.50,2615.30,200.00}},
	{"Angel Pine",                  {-2324.90,-2584.20,-6.10,-1964.20,-2212.10,200.00}},
	{"Arco del Oeste",              {-901.10,2221.80,0.00,-592.00,2571.90,200.00}},
	{"Avispa Country Club",         {-2646.40,-355.40,0.00,-2270.00,-222.50,200.00}},
	{"Avispa Country Club",         {-2831.80,-430.20,-6.10,-2646.40,-222.50,200.00}},
	{"Avispa Country Club",         {-2361.50,-417.10,0.00,-2270.00,-355.40,200.00}},
	{"Avispa Country Club",         {-2667.80,-302.10,-28.80,-2646.40,-262.30,71.10}},
	{"Avispa Country Club",         {-2470.00,-355.40,0.00,-2270.00,-318.40,46.10}},
	{"Avispa Country Club",         {-2550.00,-355.40,0.00,-2470.00,-318.40,39.70}},
	{"Back o Beyond",               {-1166.90,-2641.10,0.00,-321.70,-1856.00,200.00}},
	{"Battery Point",               {-2741.00,1268.40,-4.50,-2533.00,1490.40,200.00}},
	{"Bayside",                     {-2741.00,2175.10,0.00,-2353.10,2722.70,200.00}},
	{"Bayside Marina",              {-2353.10,2275.70,0.00,-2153.10,2475.70,200.00}},
	{"Beacon Hill",                 {-399.60,-1075.50,-1.40,-319.00,-977.50,198.50}},
	{"Blackfield",                  {964.30,1203.20,-89.00,1197.30,1403.20,110.90}},
	{"Blackfield",                  {964.30,1403.20,-89.00,1197.30,1726.20,110.90}},
	{"Blackfield Chapel",           {1375.60,596.30,-89.00,1558.00,823.20,110.90}},
	{"Blackfield Chapel",           {1325.60,596.30,-89.00,1375.60,795.00,110.90}},
	{"Blackfield Intersection",     {1197.30,1044.60,-89.00,1277.00,1163.30,110.90}},
	{"Blackfield Intersection",     {1166.50,795.00,-89.00,1375.60,1044.60,110.90}},
	{"Blackfield Intersection",     {1277.00,1044.60,-89.00,1315.30,1087.60,110.90}},
	{"Blackfield Intersection",     {1375.60,823.20,-89.00,1457.30,919.40,110.90}},
	{"Blueberry",                   {104.50,-220.10,2.30,349.60,152.20,200.00}},
	{"Blueberry",                   {19.60,-404.10,3.80,349.60,-220.10,200.00}},
	{"Blueberry Acres",             {-319.60,-220.10,0.00,104.50,293.30,200.00}},
	{"Caligula's Palace",           {2087.30,1543.20,-89.00,2437.30,1703.20,110.90}},
	{"Caligula's Palace",           {2137.40,1703.20,-89.00,2437.30,1783.20,110.90}},
	{"Calton Heights",              {-2274.10,744.10,-6.10,-1982.30,1358.90,200.00}},
	{"Chinatown",                   {-2274.10,578.30,-7.60,-2078.60,744.10,200.00}},
	{"City Hall",                   {-2867.80,277.40,-9.10,-2593.40,458.40,200.00}},
	{"Come-A-Lot",                  {2087.30,943.20,-89.00,2623.10,1203.20,110.90}},
	{"Commerce",                    {1323.90,-1842.20,-89.00,1701.90,-1722.20,110.90}},
	{"Commerce",                    {1323.90,-1722.20,-89.00,1440.90,-1577.50,110.90}},
	{"Commerce",                    {1370.80,-1577.50,-89.00,1463.90,-1384.90,110.90}},
	{"Commerce",                    {1463.90,-1577.50,-89.00,1667.90,-1430.80,110.90}},
	{"Commerce",                    {1583.50,-1722.20,-89.00,1758.90,-1577.50,110.90}},
	{"Commerce",                    {1667.90,-1577.50,-89.00,1812.60,-1430.80,110.90}},
	{"Conference Center",           {1046.10,-1804.20,-89.00,1323.90,-1722.20,110.90}},
	{"Conference Center",           {1073.20,-1842.20,-89.00,1323.90,-1804.20,110.90}},
	{"Cranberry Station",           {-2007.80,56.30,0.00,-1922.00,224.70,100.00}},
	{"Creek",                       {2749.90,1937.20,-89.00,2921.60,2669.70,110.90}},
	{"Dillimore",                   {580.70,-674.80,-9.50,861.00,-404.70,200.00}},
	{"Doherty",                     {-2270.00,-324.10,-0.00,-1794.90,-222.50,200.00}},
	{"Doherty",                     {-2173.00,-222.50,-0.00,-1794.90,265.20,200.00}},
	{"Downtown",                    {-1982.30,744.10,-6.10,-1871.70,1274.20,200.00}},
	{"Downtown",                    {-1871.70,1176.40,-4.50,-1620.30,1274.20,200.00}},
	{"Downtown",                    {-1700.00,744.20,-6.10,-1580.00,1176.50,200.00}},
	{"Downtown",                    {-1580.00,744.20,-6.10,-1499.80,1025.90,200.00}},
	{"Downtown",                    {-2078.60,578.30,-7.60,-1499.80,744.20,200.00}},
	{"Downtown",                    {-1993.20,265.20,-9.10,-1794.90,578.30,200.00}},
	{"Downtown Los Santos",         {1463.90,-1430.80,-89.00,1724.70,-1290.80,110.90}},
	{"Downtown Los Santos",         {1724.70,-1430.80,-89.00,1812.60,-1250.90,110.90}},
	{"Downtown Los Santos",         {1463.90,-1290.80,-89.00,1724.70,-1150.80,110.90}},
	{"Downtown Los Santos",         {1370.80,-1384.90,-89.00,1463.90,-1170.80,110.90}},
	{"Downtown Los Santos",         {1724.70,-1250.90,-89.00,1812.60,-1150.80,110.90}},
	{"Downtown Los Santos",         {1370.80,-1170.80,-89.00,1463.90,-1130.80,110.90}},
	{"Downtown Los Santos",         {1378.30,-1130.80,-89.00,1463.90,-1026.30,110.90}},
	{"Downtown Los Santos",         {1391.00,-1026.30,-89.00,1463.90,-926.90,110.90}},
	{"Downtown Los Santos",         {1507.50,-1385.20,110.90,1582.50,-1325.30,335.90}},
	{"East Beach",                  {2632.80,-1852.80,-89.00,2959.30,-1668.10,110.90}},
	{"East Beach",                  {2632.80,-1668.10,-89.00,2747.70,-1393.40,110.90}},
	{"East Beach",                  {2747.70,-1668.10,-89.00,2959.30,-1498.60,110.90}},
	{"East Beach",                  {2747.70,-1498.60,-89.00,2959.30,-1120.00,110.90}},
	{"East Los Santos",             {2421.00,-1628.50,-89.00,2632.80,-1454.30,110.90}},
	{"East Los Santos",             {2222.50,-1628.50,-89.00,2421.00,-1494.00,110.90}},
	{"East Los Santos",             {2266.20,-1494.00,-89.00,2381.60,-1372.00,110.90}},
	{"East Los Santos",             {2381.60,-1494.00,-89.00,2421.00,-1454.30,110.90}},
	{"East Los Santos",             {2281.40,-1372.00,-89.00,2381.60,-1135.00,110.90}},
	{"East Los Santos",             {2381.60,-1454.30,-89.00,2462.10,-1135.00,110.90}},
	{"East Los Santos",             {2462.10,-1454.30,-89.00,2581.70,-1135.00,110.90}},
	{"Easter Basin",                {-1794.90,249.90,-9.10,-1242.90,578.30,200.00}},
	{"Easter Basin",                {-1794.90,-50.00,-0.00,-1499.80,249.90,200.00}},
	{"Easter Bay Airport",          {-1499.80,-50.00,-0.00,-1242.90,249.90,200.00}},
	{"Easter Bay Airport",          {-1794.90,-730.10,-3.00,-1213.90,-50.00,200.00}},
	{"Easter Bay Airport",          {-1213.90,-730.10,0.00,-1132.80,-50.00,200.00}},
	{"Easter Bay Airport",          {-1242.90,-50.00,0.00,-1213.90,578.30,200.00}},
	{"Easter Bay Airport",          {-1213.90,-50.00,-4.50,-947.90,578.30,200.00}},
	{"Easter Bay Airport",          {-1315.40,-405.30,15.40,-1264.40,-209.50,25.40}},
	{"Easter Bay Airport",          {-1354.30,-287.30,15.40,-1315.40,-209.50,25.40}},
	{"Easter Bay Airport",          {-1490.30,-209.50,15.40,-1264.40,-148.30,25.40}},
	{"Easter Bay Chemicals",        {-1132.80,-768.00,0.00,-956.40,-578.10,200.00}},
	{"Easter Bay Chemicals",        {-1132.80,-787.30,0.00,-956.40,-768.00,200.00}},
	{"El Castillo del Diablo",      {-464.50,2217.60,0.00,-208.50,2580.30,200.00}},
	{"El Castillo del Diablo",      {-208.50,2123.00,-7.60,114.00,2337.10,200.00}},
	{"El Castillo del Diablo",      {-208.50,2337.10,0.00,8.40,2487.10,200.00}},
	{"El Corona",                   {1812.60,-2179.20,-89.00,1970.60,-1852.80,110.90}},
	{"El Corona",                   {1692.60,-2179.20,-89.00,1812.60,-1842.20,110.90}},
	{"El Quebrados",                {-1645.20,2498.50,0.00,-1372.10,2777.80,200.00}},
	{"Esplanade East",              {-1620.30,1176.50,-4.50,-1580.00,1274.20,200.00}},
	{"Esplanade East",              {-1580.00,1025.90,-6.10,-1499.80,1274.20,200.00}},
	{"Esplanade East",              {-1499.80,578.30,-79.60,-1339.80,1274.20,20.30}},
	{"Esplanade North",             {-2533.00,1358.90,-4.50,-1996.60,1501.20,200.00}},
	{"Esplanade North",             {-1996.60,1358.90,-4.50,-1524.20,1592.50,200.00}},
	{"Esplanade North",             {-1982.30,1274.20,-4.50,-1524.20,1358.90,200.00}},
	{"Fallen Tree",                 {-792.20,-698.50,-5.30,-452.40,-380.00,200.00}},
	{"Fallow Bridge",               {434.30,366.50,0.00,603.00,555.60,200.00}},
	{"Fern Ridge",                  {508.10,-139.20,0.00,1306.60,119.50,200.00}},
	{"Financial",                   {-1871.70,744.10,-6.10,-1701.30,1176.40,300.00}},
	{"Fisher's Lagoon",             {1916.90,-233.30,-100.00,2131.70,13.80,200.00}},
	{"Flint Intersection",          {-187.70,-1596.70,-89.00,17.00,-1276.60,110.90}},
	{"Flint Range",                 {-594.10,-1648.50,0.00,-187.70,-1276.60,200.00}},
	{"Fort Carson",                 {-376.20,826.30,-3.00,123.70,1220.40,200.00}},
	{"Foster Valley",               {-2270.00,-430.20,-0.00,-2178.60,-324.10,200.00}},
	{"Foster Valley",               {-2178.60,-599.80,-0.00,-1794.90,-324.10,200.00}},
	{"Foster Valley",               {-2178.60,-1115.50,0.00,-1794.90,-599.80,200.00}},
	{"Foster Valley",               {-2178.60,-1250.90,0.00,-1794.90,-1115.50,200.00}},
	{"Frederick Bridge",            {2759.20,296.50,0.00,2774.20,594.70,200.00}},
	{"Gant Bridge",                 {-2741.40,1659.60,-6.10,-2616.40,2175.10,200.00}},
	{"Gant Bridge",                 {-2741.00,1490.40,-6.10,-2616.40,1659.60,200.00}},
	{"Ganton",                      {2222.50,-1852.80,-89.00,2632.80,-1722.30,110.90}},
	{"Ganton",                      {2222.50,-1722.30,-89.00,2632.80,-1628.50,110.90}},
	{"Garcia",                      {-2411.20,-222.50,-0.00,-2173.00,265.20,200.00}},
	{"Garcia",                      {-2395.10,-222.50,-5.30,-2354.00,-204.70,200.00}},
	{"Garver Bridge",               {-1339.80,828.10,-89.00,-1213.90,1057.00,110.90}},
	{"Garver Bridge",               {-1213.90,950.00,-89.00,-1087.90,1178.90,110.90}},
	{"Garver Bridge",               {-1499.80,696.40,-179.60,-1339.80,925.30,20.30}},
	{"Glen Park",                   {1812.60,-1449.60,-89.00,1996.90,-1350.70,110.90}},
	{"Glen Park",                   {1812.60,-1100.80,-89.00,1994.30,-973.30,110.90}},
	{"Glen Park",                   {1812.60,-1350.70,-89.00,2056.80,-1100.80,110.90}},
	{"Green Palms",                 {176.50,1305.40,-3.00,338.60,1520.70,200.00}},
	{"Greenglass College",          {964.30,1044.60,-89.00,1197.30,1203.20,110.90}},
	{"Greenglass College",          {964.30,930.80,-89.00,1166.50,1044.60,110.90}},
	{"Hampton Barns",               {603.00,264.30,0.00,761.90,366.50,200.00}},
	{"Hankypanky Point",            {2576.90,62.10,0.00,2759.20,385.50,200.00}},
	{"Harry Gold Parkway",          {1777.30,863.20,-89.00,1817.30,2342.80,110.90}},
	{"Hashbury",                    {-2593.40,-222.50,-0.00,-2411.20,54.70,200.00}},
	{"Hilltop Farm",                {967.30,-450.30,-3.00,1176.70,-217.90,200.00}},
	{"Hunter Quarry",               {337.20,710.80,-115.20,860.50,1031.70,203.70}},
	{"Idlewood",                    {1812.60,-1852.80,-89.00,1971.60,-1742.30,110.90}},
	{"Idlewood",                    {1812.60,-1742.30,-89.00,1951.60,-1602.30,110.90}},
	{"Idlewood",                    {1951.60,-1742.30,-89.00,2124.60,-1602.30,110.90}},
	{"Idlewood",                    {1812.60,-1602.30,-89.00,2124.60,-1449.60,110.90}},
	{"Idlewood",                    {2124.60,-1742.30,-89.00,2222.50,-1494.00,110.90}},
	{"Idlewood",                    {1971.60,-1852.80,-89.00,2222.50,-1742.30,110.90}},
	{"Jefferson",                   {1996.90,-1449.60,-89.00,2056.80,-1350.70,110.90}},
	{"Jefferson",                   {2124.60,-1494.00,-89.00,2266.20,-1449.60,110.90}},
	{"Jefferson",                   {2056.80,-1372.00,-89.00,2281.40,-1210.70,110.90}},
	{"Jefferson",                   {2056.80,-1210.70,-89.00,2185.30,-1126.30,110.90}},
	{"Jefferson",                   {2185.30,-1210.70,-89.00,2281.40,-1154.50,110.90}},
	{"Jefferson",                   {2056.80,-1449.60,-89.00,2266.20,-1372.00,110.90}},
	{"Julius Thruway East",         {2623.10,943.20,-89.00,2749.90,1055.90,110.90}},
	{"Julius Thruway East",         {2685.10,1055.90,-89.00,2749.90,2626.50,110.90}},
	{"Julius Thruway East",         {2536.40,2442.50,-89.00,2685.10,2542.50,110.90}},
	{"Julius Thruway East",         {2625.10,2202.70,-89.00,2685.10,2442.50,110.90}},
	{"Julius Thruway North",        {2498.20,2542.50,-89.00,2685.10,2626.50,110.90}},
	{"Julius Thruway North",        {2237.40,2542.50,-89.00,2498.20,2663.10,110.90}},
	{"Julius Thruway North",        {2121.40,2508.20,-89.00,2237.40,2663.10,110.90}},
	{"Julius Thruway North",        {1938.80,2508.20,-89.00,2121.40,2624.20,110.90}},
	{"Julius Thruway North",        {1534.50,2433.20,-89.00,1848.40,2583.20,110.90}},
	{"Julius Thruway North",        {1848.40,2478.40,-89.00,1938.80,2553.40,110.90}},
	{"Julius Thruway North",        {1704.50,2342.80,-89.00,1848.40,2433.20,110.90}},
	{"Julius Thruway North",        {1377.30,2433.20,-89.00,1534.50,2507.20,110.90}},
	{"Julius Thruway South",        {1457.30,823.20,-89.00,2377.30,863.20,110.90}},
	{"Julius Thruway South",        {2377.30,788.80,-89.00,2537.30,897.90,110.90}},
	{"Julius Thruway West",         {1197.30,1163.30,-89.00,1236.60,2243.20,110.90}},
	{"Julius Thruway West",         {1236.60,2142.80,-89.00,1297.40,2243.20,110.90}},
	{"Juniper Hill",                {-2533.00,578.30,-7.60,-2274.10,968.30,200.00}},
	{"Juniper Hollow",              {-2533.00,968.30,-6.10,-2274.10,1358.90,200.00}},
	{"K.A.C.C. Military Fuels",     {2498.20,2626.50,-89.00,2749.90,2861.50,110.90}},
	{"Kincaid Bridge",              {-1339.80,599.20,-89.00,-1213.90,828.10,110.90}},
	{"Kincaid Bridge",              {-1213.90,721.10,-89.00,-1087.90,950.00,110.90}},
	{"Kincaid Bridge",              {-1087.90,855.30,-89.00,-961.90,986.20,110.90}},
	{"King's",                      {-2329.30,458.40,-7.60,-1993.20,578.30,200.00}},
	{"King's",                      {-2411.20,265.20,-9.10,-1993.20,373.50,200.00}},
	{"King's",                      {-2253.50,373.50,-9.10,-1993.20,458.40,200.00}},
	{"LVA Freight Depot",           {1457.30,863.20,-89.00,1777.40,1143.20,110.90}},
	{"LVA Freight Depot",           {1375.60,919.40,-89.00,1457.30,1203.20,110.90}},
	{"LVA Freight Depot",           {1277.00,1087.60,-89.00,1375.60,1203.20,110.90}},
	{"LVA Freight Depot",           {1315.30,1044.60,-89.00,1375.60,1087.60,110.90}},
	{"LVA Freight Depot",           {1236.60,1163.40,-89.00,1277.00,1203.20,110.90}},
	{"Las Barrancas",               {-926.10,1398.70,-3.00,-719.20,1634.60,200.00}},
	{"Las Brujas",                  {-365.10,2123.00,-3.00,-208.50,2217.60,200.00}},
	{"Las Colinas",                 {1994.30,-1100.80,-89.00,2056.80,-920.80,110.90}},
	{"Las Colinas",                 {2056.80,-1126.30,-89.00,2126.80,-920.80,110.90}},
	{"Las Colinas",                 {2185.30,-1154.50,-89.00,2281.40,-934.40,110.90}},
	{"Las Colinas",                 {2126.80,-1126.30,-89.00,2185.30,-934.40,110.90}},
	{"Las Colinas",                 {2747.70,-1120.00,-89.00,2959.30,-945.00,110.90}},
	{"Las Colinas",                 {2632.70,-1135.00,-89.00,2747.70,-945.00,110.90}},
	{"Las Colinas",                 {2281.40,-1135.00,-89.00,2632.70,-945.00,110.90}},
	{"Las Payasadas",               {-354.30,2580.30,2.00,-133.60,2816.80,200.00}},
	{"Las Venturas Airport",        {1236.60,1203.20,-89.00,1457.30,1883.10,110.90}},
	{"Las Venturas Airport",        {1457.30,1203.20,-89.00,1777.30,1883.10,110.90}},
	{"Las Venturas Airport",        {1457.30,1143.20,-89.00,1777.40,1203.20,110.90}},
	{"Las Venturas Airport",        {1515.80,1586.40,-12.50,1729.90,1714.50,87.50}},
	{"Last Dime Motel",             {1823.00,596.30,-89.00,1997.20,823.20,110.90}},
	{"Leafy Hollow",                {-1166.90,-1856.00,0.00,-815.60,-1602.00,200.00}},
	{"Liberty City",                {-1000.00,400.00,1300.00,-700.00,600.00,1400.00}},
	{"Lil' Probe Inn",              {-90.20,1286.80,-3.00,153.80,1554.10,200.00}},
	{"Linden Side",                 {2749.90,943.20,-89.00,2923.30,1198.90,110.90}},
	{"Linden Station",              {2749.90,1198.90,-89.00,2923.30,1548.90,110.90}},
	{"Linden Station",              {2811.20,1229.50,-39.50,2861.20,1407.50,60.40}},
	{"Little Mexico",               {1701.90,-1842.20,-89.00,1812.60,-1722.20,110.90}},
	{"Little Mexico",               {1758.90,-1722.20,-89.00,1812.60,-1577.50,110.90}},
	{"Los Flores",                  {2581.70,-1454.30,-89.00,2632.80,-1393.40,110.90}},
	{"Los Flores",                  {2581.70,-1393.40,-89.00,2747.70,-1135.00,110.90}},
	{"Los Santos International",    {1249.60,-2394.30,-89.00,1852.00,-2179.20,110.90}},
	{"Los Santos International",    {1852.00,-2394.30,-89.00,2089.00,-2179.20,110.90}},
	{"Los Santos International",    {1382.70,-2730.80,-89.00,2201.80,-2394.30,110.90}},
	{"Los Santos International",    {1974.60,-2394.30,-39.00,2089.00,-2256.50,60.90}},
	{"Los Santos International",    {1400.90,-2669.20,-39.00,2189.80,-2597.20,60.90}},
	{"Los Santos International",    {2051.60,-2597.20,-39.00,2152.40,-2394.30,60.90}},
	{"Marina",                      {647.70,-1804.20,-89.00,851.40,-1577.50,110.90}},
	{"Marina",                      {647.70,-1577.50,-89.00,807.90,-1416.20,110.90}},
	{"Marina",                      {807.90,-1577.50,-89.00,926.90,-1416.20,110.90}},
	{"Market",                      {787.40,-1416.20,-89.00,1072.60,-1310.20,110.90}},
	{"Market",                      {952.60,-1310.20,-89.00,1072.60,-1130.80,110.90}},
	{"Market",                      {1072.60,-1416.20,-89.00,1370.80,-1130.80,110.90}},
	{"Market",                      {926.90,-1577.50,-89.00,1370.80,-1416.20,110.90}},
	{"Market Station",              {787.40,-1410.90,-34.10,866.00,-1310.20,65.80}},
	{"Martin Bridge",               {-222.10,293.30,0.00,-122.10,476.40,200.00}},
	{"Missionary Hill",             {-2994.40,-811.20,0.00,-2178.60,-430.20,200.00}},
	{"Montgomery",                  {1119.50,119.50,-3.00,1451.40,493.30,200.00}},
	{"Montgomery",                  {1451.40,347.40,-6.10,1582.40,420.80,200.00}},
	{"Montgomery Intersection",     {1546.60,208.10,0.00,1745.80,347.40,200.00}},
	{"Montgomery Intersection",     {1582.40,347.40,0.00,1664.60,401.70,200.00}},
	{"Mulholland",                  {1414.00,-768.00,-89.00,1667.60,-452.40,110.90}},
	{"Mulholland",                  {1281.10,-452.40,-89.00,1641.10,-290.90,110.90}},
	{"Mulholland",                  {1269.10,-768.00,-89.00,1414.00,-452.40,110.90}},
	{"Mulholland",                  {1357.00,-926.90,-89.00,1463.90,-768.00,110.90}},
	{"Mulholland",                  {1318.10,-910.10,-89.00,1357.00,-768.00,110.90}},
	{"Mulholland",                  {1169.10,-910.10,-89.00,1318.10,-768.00,110.90}},
	{"Mulholland",                  {768.60,-954.60,-89.00,952.60,-860.60,110.90}},
	{"Mulholland",                  {687.80,-860.60,-89.00,911.80,-768.00,110.90}},
	{"Mulholland",                  {737.50,-768.00,-89.00,1142.20,-674.80,110.90}},
	{"Mulholland",                  {1096.40,-910.10,-89.00,1169.10,-768.00,110.90}},
	{"Mulholland",                  {952.60,-937.10,-89.00,1096.40,-860.60,110.90}},
	{"Mulholland",                  {911.80,-860.60,-89.00,1096.40,-768.00,110.90}},
	{"Mulholland",                  {861.00,-674.80,-89.00,1156.50,-600.80,110.90}},
	{"Mulholland Intersection",     {1463.90,-1150.80,-89.00,1812.60,-768.00,110.90}},
	{"North Rock",                  {2285.30,-768.00,0.00,2770.50,-269.70,200.00}},
	{"Ocean Docks",                 {2373.70,-2697.00,-89.00,2809.20,-2330.40,110.90}},
	{"Ocean Docks",                 {2201.80,-2418.30,-89.00,2324.00,-2095.00,110.90}},
	{"Ocean Docks",                 {2324.00,-2302.30,-89.00,2703.50,-2145.10,110.90}},
	{"Ocean Docks",                 {2089.00,-2394.30,-89.00,2201.80,-2235.80,110.90}},
	{"Ocean Docks",                 {2201.80,-2730.80,-89.00,2324.00,-2418.30,110.90}},
	{"Ocean Docks",                 {2703.50,-2302.30,-89.00,2959.30,-2126.90,110.90}},
	{"Ocean Docks",                 {2324.00,-2145.10,-89.00,2703.50,-2059.20,110.90}},
	{"Ocean Flats",                 {-2994.40,277.40,-9.10,-2867.80,458.40,200.00}},
	{"Ocean Flats",                 {-2994.40,-222.50,-0.00,-2593.40,277.40,200.00}},
	{"Ocean Flats",                 {-2994.40,-430.20,-0.00,-2831.80,-222.50,200.00}},
	{"Octane Springs",              {338.60,1228.50,0.00,664.30,1655.00,200.00}},
	{"Old Venturas Strip",          {2162.30,2012.10,-89.00,2685.10,2202.70,110.90}},
	{"Palisades",                   {-2994.40,458.40,-6.10,-2741.00,1339.60,200.00}},
	{"Palomino Creek",              {2160.20,-149.00,0.00,2576.90,228.30,200.00}},
	{"Paradiso",                    {-2741.00,793.40,-6.10,-2533.00,1268.40,200.00}},
	{"Pershing Square",             {1440.90,-1722.20,-89.00,1583.50,-1577.50,110.90}},
	{"Pilgrim",                     {2437.30,1383.20,-89.00,2624.40,1783.20,110.90}},
	{"Pilgrim",                     {2624.40,1383.20,-89.00,2685.10,1783.20,110.90}},
	{"Pilson Intersection",         {1098.30,2243.20,-89.00,1377.30,2507.20,110.90}},
	{"Pirates in Men's Pants",      {1817.30,1469.20,-89.00,2027.40,1703.20,110.90}},
	{"Playa del Seville",           {2703.50,-2126.90,-89.00,2959.30,-1852.80,110.90}},
	{"Prickle Pine",                {1534.50,2583.20,-89.00,1848.40,2863.20,110.90}},
	{"Prickle Pine",                {1117.40,2507.20,-89.00,1534.50,2723.20,110.90}},
	{"Prickle Pine",                {1848.40,2553.40,-89.00,1938.80,2863.20,110.90}},
	{"Prickle Pine",                {1938.80,2624.20,-89.00,2121.40,2861.50,110.90}},
	{"Queens",                      {-2533.00,458.40,0.00,-2329.30,578.30,200.00}},
	{"Queens",                      {-2593.40,54.70,0.00,-2411.20,458.40,200.00}},
	{"Queens",                      {-2411.20,373.50,0.00,-2253.50,458.40,200.00}},
	{"Randolph Industrial Estate",  {1558.00,596.30,-89.00,1823.00,823.20,110.90}},
	{"Redsands East",               {1817.30,2011.80,-89.00,2106.70,2202.70,110.90}},
	{"Redsands East",               {1817.30,2202.70,-89.00,2011.90,2342.80,110.90}},
	{"Redsands East",               {1848.40,2342.80,-89.00,2011.90,2478.40,110.90}},
	{"Redsands West",               {1236.60,1883.10,-89.00,1777.30,2142.80,110.90}},
	{"Redsands West",               {1297.40,2142.80,-89.00,1777.30,2243.20,110.90}},
	{"Redsands West",               {1377.30,2243.20,-89.00,1704.50,2433.20,110.90}},
	{"Redsands West",               {1704.50,2243.20,-89.00,1777.30,2342.80,110.90}},
	{"Regular Tom",                 {-405.70,1712.80,-3.00,-276.70,1892.70,200.00}},
	{"Richman",                     {647.50,-1118.20,-89.00,787.40,-954.60,110.90}},
	{"Richman",                     {647.50,-954.60,-89.00,768.60,-860.60,110.90}},
	{"Richman",                     {225.10,-1369.60,-89.00,334.50,-1292.00,110.90}},
	{"Richman",                     {225.10,-1292.00,-89.00,466.20,-1235.00,110.90}},
	{"Richman",                     {72.60,-1404.90,-89.00,225.10,-1235.00,110.90}},
	{"Richman",                     {72.60,-1235.00,-89.00,321.30,-1008.10,110.90}},
	{"Richman",                     {321.30,-1235.00,-89.00,647.50,-1044.00,110.90}},
	{"Richman",                     {321.30,-1044.00,-89.00,647.50,-860.60,110.90}},
	{"Richman",                     {321.30,-860.60,-89.00,687.80,-768.00,110.90}},
	{"Richman",                     {321.30,-768.00,-89.00,700.70,-674.80,110.90}},
	{"Robada Intersection",         {-1119.00,1178.90,-89.00,-862.00,1351.40,110.90}},
	{"Roca Escalante",              {2237.40,2202.70,-89.00,2536.40,2542.50,110.90}},
	{"Roca Escalante",              {2536.40,2202.70,-89.00,2625.10,2442.50,110.90}},
	{"Rockshore East",              {2537.30,676.50,-89.00,2902.30,943.20,110.90}},
	{"Rockshore West",              {1997.20,596.30,-89.00,2377.30,823.20,110.90}},
	{"Rockshore West",              {2377.30,596.30,-89.00,2537.30,788.80,110.90}},
	{"Rodeo",                       {72.60,-1684.60,-89.00,225.10,-1544.10,110.90}},
	{"Rodeo",                       {72.60,-1544.10,-89.00,225.10,-1404.90,110.90}},
	{"Rodeo",                       {225.10,-1684.60,-89.00,312.80,-1501.90,110.90}},
	{"Rodeo",                       {225.10,-1501.90,-89.00,334.50,-1369.60,110.90}},
	{"Rodeo",                       {334.50,-1501.90,-89.00,422.60,-1406.00,110.90}},
	{"Rodeo",                       {312.80,-1684.60,-89.00,422.60,-1501.90,110.90}},
	{"Rodeo",                       {422.60,-1684.60,-89.00,558.00,-1570.20,110.90}},
	{"Rodeo",                       {558.00,-1684.60,-89.00,647.50,-1384.90,110.90}},
	{"Rodeo",                       {466.20,-1570.20,-89.00,558.00,-1385.00,110.90}},
	{"Rodeo",                       {422.60,-1570.20,-89.00,466.20,-1406.00,110.90}},
	{"Rodeo",                       {466.20,-1385.00,-89.00,647.50,-1235.00,110.90}},
	{"Rodeo",                       {334.50,-1406.00,-89.00,466.20,-1292.00,110.90}},
	{"Royal Casino",                {2087.30,1383.20,-89.00,2437.30,1543.20,110.90}},
	{"San Andreas Sound",           {2450.30,385.50,-100.00,2759.20,562.30,200.00}},
	{"Santa Flora",                 {-2741.00,458.40,-7.60,-2533.00,793.40,200.00}},
	{"Santa Maria Beach",           {342.60,-2173.20,-89.00,647.70,-1684.60,110.90}},
	{"Santa Maria Beach",           {72.60,-2173.20,-89.00,342.60,-1684.60,110.90}},
	{"Shady Cabin",                 {-1632.80,-2263.40,-3.00,-1601.30,-2231.70,200.00}},
	{"Shady Creeks",                {-1820.60,-2643.60,-8.00,-1226.70,-1771.60,200.00}},
	{"Shady Creeks",                {-2030.10,-2174.80,-6.10,-1820.60,-1771.60,200.00}},
	{"Sobell Rail Yards",           {2749.90,1548.90,-89.00,2923.30,1937.20,110.90}},
	{"Spinybed",                    {2121.40,2663.10,-89.00,2498.20,2861.50,110.90}},
	{"Starfish Casino",             {2437.30,1783.20,-89.00,2685.10,2012.10,110.90}},
	{"Starfish Casino",             {2437.30,1858.10,-39.00,2495.00,1970.80,60.90}},
	{"Starfish Casino",             {2162.30,1883.20,-89.00,2437.30,2012.10,110.90}},
	{"Temple",                      {1252.30,-1130.80,-89.00,1378.30,-1026.30,110.90}},
	{"Temple",                      {1252.30,-1026.30,-89.00,1391.00,-926.90,110.90}},
	{"Temple",                      {1252.30,-926.90,-89.00,1357.00,-910.10,110.90}},
	{"Temple",                      {952.60,-1130.80,-89.00,1096.40,-937.10,110.90}},
	{"Temple",                      {1096.40,-1130.80,-89.00,1252.30,-1026.30,110.90}},
	{"Temple",                      {1096.40,-1026.30,-89.00,1252.30,-910.10,110.90}},
	{"The Camel's Toe",             {2087.30,1203.20,-89.00,2640.40,1383.20,110.90}},
	{"The Clown's Pocket",          {2162.30,1783.20,-89.00,2437.30,1883.20,110.90}},
	{"The Emerald Isle",            {2011.90,2202.70,-89.00,2237.40,2508.20,110.90}},
	{"The Farm",                    {-1209.60,-1317.10,114.90,-908.10,-787.30,251.90}},
	{"The Four Dragons Casino",     {1817.30,863.20,-89.00,2027.30,1083.20,110.90}},
	{"The High Roller",             {1817.30,1283.20,-89.00,2027.30,1469.20,110.90}},
	{"The Mako Span",               {1664.60,401.70,0.00,1785.10,567.20,200.00}},
	{"The Panopticon",              {-947.90,-304.30,-1.10,-319.60,327.00,200.00}},
	{"The Pink Swan",               {1817.30,1083.20,-89.00,2027.30,1283.20,110.90}},
	{"The Sherman Dam",             {-968.70,1929.40,-3.00,-481.10,2155.20,200.00}},
	{"The Strip",                   {2027.40,863.20,-89.00,2087.30,1703.20,110.90}},
	{"The Strip",                   {2106.70,1863.20,-89.00,2162.30,2202.70,110.90}},
	{"The Strip",                   {2027.40,1783.20,-89.00,2162.30,1863.20,110.90}},
	{"The Strip",                   {2027.40,1703.20,-89.00,2137.40,1783.20,110.90}},
	{"The Visage",                  {1817.30,1863.20,-89.00,2106.70,2011.80,110.90}},
	{"The Visage",                  {1817.30,1703.20,-89.00,2027.40,1863.20,110.90}},
	{"Unity Station",               {1692.60,-1971.80,-20.40,1812.60,-1932.80,79.50}},
	{"Valle Ocultado",              {-936.60,2611.40,2.00,-715.90,2847.90,200.00}},
	{"Verdant Bluffs",              {930.20,-2488.40,-89.00,1249.60,-2006.70,110.90}},
	{"Verdant Bluffs",              {1073.20,-2006.70,-89.00,1249.60,-1842.20,110.90}},
	{"Verdant Bluffs",              {1249.60,-2179.20,-89.00,1692.60,-1842.20,110.90}},
	{"Verdant Meadows",             {37.00,2337.10,-3.00,435.90,2677.90,200.00}},
	{"Verona Beach",                {647.70,-2173.20,-89.00,930.20,-1804.20,110.90}},
	{"Verona Beach",                {930.20,-2006.70,-89.00,1073.20,-1804.20,110.90}},
	{"Verona Beach",                {851.40,-1804.20,-89.00,1046.10,-1577.50,110.90}},
	{"Verona Beach",                {1161.50,-1722.20,-89.00,1323.90,-1577.50,110.90}},
	{"Verona Beach",                {1046.10,-1722.20,-89.00,1161.50,-1577.50,110.90}},
	{"Vinewood",                    {787.40,-1310.20,-89.00,952.60,-1130.80,110.90}},
	{"Vinewood",                    {787.40,-1130.80,-89.00,952.60,-954.60,110.90}},
	{"Vinewood",                    {647.50,-1227.20,-89.00,787.40,-1118.20,110.90}},
	{"Vinewood",                    {647.70,-1416.20,-89.00,787.40,-1227.20,110.90}},
	{"Whitewood Estates",           {883.30,1726.20,-89.00,1098.30,2507.20,110.90}},
	{"Whitewood Estates",           {1098.30,1726.20,-89.00,1197.30,2243.20,110.90}},
	{"Willowfield",                 {1970.60,-2179.20,-89.00,2089.00,-1852.80,110.90}},
	{"Willowfield",                 {2089.00,-2235.80,-89.00,2201.80,-1989.90,110.90}},
	{"Willowfield",                 {2089.00,-1989.90,-89.00,2324.00,-1852.80,110.90}},
	{"Willowfield",                 {2201.80,-2095.00,-89.00,2324.00,-1989.90,110.90}},
	{"Willowfield",                 {2541.70,-1941.40,-89.00,2703.50,-1852.80,110.90}},
	{"Willowfield",                 {2324.00,-2059.20,-89.00,2541.70,-1852.80,110.90}},
	{"Willowfield",                 {2541.70,-2059.20,-89.00,2703.50,-1941.40,110.90}},
	{"Yellow Bell Station",         {1377.40,2600.40,-21.90,1492.40,2687.30,78.00}},
	// Main Zones
	{"Los Santos",                  {44.60,-2892.90,-242.90,2997.00,-768.00,900.00}},
	{"Las Venturas",                {869.40,596.30,-242.90,2997.00,2993.80,900.00}},
	{"Bone County",                 {-480.50,596.30,-242.90,869.40,2993.80,900.00}},
	{"Tierra Robada",               {-2997.40,1659.60,-242.90,-480.50,2993.80,900.00}},
	{"Tierra Robada",               {-1213.90,596.30,-242.90,-480.50,1659.60,900.00}},
	{"San Fierro",                  {-2997.40,-1115.50,-242.90,-1213.90,1659.60,900.00}},
	{"Red County",                  {-1213.90,-768.00,-242.90,2997.00,596.30,900.00}},
	{"Flint County",                {-1213.90,-2892.90,-242.90,44.60,-768.00,900.00}},
	{"Whetstone",                   {-2997.40,-2892.90,-242.90,-1213.90,-1115.50,900.00}}
};

enum lootVars
{
    Float:xLoo,
    Float:yLoo,
    Float:zLoo
}

static const DayZSA_Market[][lootVars] =
{
    {-2442.3359375,754.7587890625,35.171875},
	{2205.326171875,-2508.48828125,13.76850605011},
	{-2671.720703125,257.9287109375,4.6328125},
	{2136.4296875,-2290.13671875,20.664632797241},
	{-2520.8330078125,-36.458984375,25.6171875},
	{1923.390625,-2128.73046875,13.578104019165},
	{1975.5244140625,-2013.361328125,13.546875},
	{-2529.3408203125,-1.025390625,25.6171875},
	{-2323.716796875,-158.8447265625,35.5546875},
	{1765.7021484375,-2020.013671875,14.140814781189},
	{1950.662109375,-1985.2998046875,13.546875},
	{2403.4306640625,-1899.1259765625,13.546875},
	{2517.2373046875,-1957.5498046875,16.79335975647},
	{2461.3701171875,-1943.20703125,16.887882232666},
	{2483.2880859375,-1958.69921875,13.581447601318},
	{-2336.8671875,-166.53125,35.5546875},
	{2046.83984375,-1900.123046875,13.553800582886},
	{-1816.5380859375,618.6845703125,35.171875},
	{1579.89453125,-1800.193359375,13.24654006958},
	{1568.623046875,-1898.0087890625,13.560886383057},
	{-2191.6728515625,636.6650390625,49.442939758301},
	{822.326171875,-1756.5634765625,13.654552459717},
	{501.1884765625,-1757.45703125,14.176206588745},
	{353.2783203125,-2034.671875,7.8359375},
	{352.927734375,-2030.24609375,7.8359375},
	{-2767.8701171875,788.8642578125,52.78125},
	{-1912.4794921875,827.966796875,35.234931945801},
	{-2355.81640625,1008.0888671875,50.8984375},
	{-2524.49609375,1216.2236328125,37.668563842773},
	{-2491.9248046875,2363.158203125,10.272946357727},
	{1048.5634765625,-1584.5595703125,13.523545265198},
	{1066.6240234375,-1605.919921875,13.613391876221},
	{1113.6767578125,-1605.8408203125,13.647103309631},
	{1123.29296875,-1609.0283203125,13.60457611084},
	{1123.662109375,-1633.3466796875,13.669480323792},
	{1104.9833984375,-1632.740234375,13.605573654175},
	{1079.0,-1632.494140625,13.58229637146},
	{1069.4130859375,-1632.072265625,13.594591140747},
	{1074.9169921875,-1604.5244140625,20.494478225708},
	{1081.3330078125,-1633.19140625,20.4938621521},
	{1111.6103515625,-1634.0859375,20.561660766602},
	{1162.0361328125,-1585.29296875,13.546875},
	{1162.076171875,-1602.0419921875,13.546875},
	{-1808.5185546875,946.10546875,24.890625},
	{-1321.904296875,2703.63671875,50.26628112793},
	{-1272.349609375,2712.6669921875,50.26628112793},
	{-1450.51171875,2593.8076171875,55.8359375},
	{-1440.2353515625,2609.853515625,55.8359375},
	{-1720.9404296875,1360.052734375,7.1853160858154},
	{-1509.32421875,2609.998046875,55.8359375},
	{2711.244140625,-1497.6298828125,30.553512573242},
	{2633.6201171875,-1342.5322265625,36.192161560059},
	{2710.8974609375,-1288.3837890625,58.9453125},
	{2711.1044921875,-1310.6787109375,58.9453125},
	{2153.3876953125,-1013.435546875,62.928932189941},
	{2014.298828125,-1078.955078125,24.841756820679},
	{2353.107421875,-1358.89453125,24.3984375},
	{2000.6201171875,-1282.7119140625,23.971115112305},
	{1982.6611328125,-1282.6025390625,23.971883773804},
	{2007.140625,-1282.2138671875,23.974639892578},
	{1974.5302734375,-1285.033203125,28.491893768311},
	{2001.1806640625,-1285.1396484375,28.488073348999},
	{1929.509765625,-1775.4658203125,13.546875},
	{-1212.65625,1830.96875,41.9296875},
	{-1226.5849609375,1834.5458984375,41.653701782227},
	{-856.6572265625,1536.330078125,22.587043762207},
	{-745.498046875,1590.0,26.9821434021},
	{2105.4404296875,-1808.6201171875,13.5546875},
	{2101.9228515625,-1807.626953125,13.5546875},
	{-552.03515625,2595.7861328125,53.93478012085},
	{-553.451171875,2592.08984375,53.93478012085},
	{-550.0869140625,2582.2275390625,53.93478012085},
	{-550.2685546875,2609.255859375,53.93478012085},
	{-315.140625,1773.8125,43.640625},
	{2324.4580078125,-1645.021484375,14.827047348022},
	{-310.9453125,1305.6240234375,53.664344787598},
	{2472.3798828125,-1530.3017578125,24.186376571655},
	{-289.3818359375,2691.306640625,62.6875},
	{-254.7392578125,2603.1591796875,62.858154296875},
	{-89.0263671875,1378.2607421875,10.469839096069},
	{-102.7587890625,1373.509765625,10.2734375},
	{662.833984375,1716.7861328125,7.1875},
	{673.2060546875,1706.1298828125,7.1875},
	{638.552734375,1684.0107421875,7.1875},
	{642.9814453125,1678.396484375,7.1875},
	{175.666015625,1174.2470703125,14.7578125},
	{-168.9990234375,1032.6728515625,19.734413146973},
	{982.8994140625,2563.0966796875,10.739549636841},
	{1151.955078125,2072.2470703125,11.0625},
	{1164.1435546875,2086.056640625,10.8203125},
	{1156.6396484375,2100.333984375,11.0625},
	{2150.5400390625,2734.6796875,11.176349639893},
	{2170.517578125,2795.2265625,10.8203125},
	{2812.8134765625,2588.619140625,10.081407546997},
	{2825.5654296875,2604.57421875,10.8203125},
	{2787.6826171875,2560.68359375,9.9147701263428},
	{2756.58203125,2475.91796875,11.0625},
	{2793.6455078125,2438.8818359375,11.0625},
	{2801.7109375,2430.205078125,11.0625},
	{2844.5390625,2412.0615234375,11.068956375122},
	{2860.123046875,2428.44140625,11.068956375122},
	{2883.734375,2450.9794921875,11.068956375122},
	{2898.8232421875,2466.232421875,11.068956375122},
	{2781.7880859375,1455.0029296875,10.771492004395},
	{-2155.1611328125,-2460.2734375,30.8515625},
	{1685.08984375,-2238.333984375,13.546875},
	{251.3271484375,-57.4375,1.5703125},
	{245.1015625,-60.158203125,1.5703125},
	{255.708984375,-53.201171875,1.5703125},
	{244.8916015625,-55.5947265625,1.5776442289352},
	{248.775390625,-54.8583984375,1.5776442289352},
	{872.1162109375,-26.212890625,63.884567260742},
	{1367.564453125,248.1337890625,19.566932678223},
	{1415.71484375,261.328125,19.552904129028},
	{2331.833984375,75.078125,26.620975494385},
	{1153.7890625,-1458.7431640625,15.796875},
	{1199.3037109375,-919.005859375,43.116374969482},
	{1314.509765625,-898.5380859375,39.578125},
	{1306.6376953125,-898.564453125,39.578125},
	{1557.8095703125,953.7001953125,10.812507629395},
	{1552.1123046875,1044.982421875,10.8203125},
	{1367.08984375,2223.5634765625,11.0234375},
	{1377.6796875,2329.3935546875,10.8203125},
	{1378.431640625,2366.939453125,10.818092346191},
	{1693.8310546875,2208.4697265625,11.069177627563},
	{1601.0966796875,2222.0966796875,11.0625},
	{1886.0283203125,2080.9326171875,11.0625},
	{1873.67578125,2072.310546875,11.0625},
	{1961.6787109375,2445.6435546875,11.178249359131},
	{1923.7177734375,2447.1787109375,11.368927955627},
	{2052.4091796875,2044.4716796875,11.057899475098},
	{2086.9853515625,2065.0859375,11.057899475098},
	{2070.6796875,2097.708984375,11.057899475098},
	{1966.67578125,2147.0322265625,10.8203125},
	{1967.2861328125,2160.1875,10.8203125},
	{2055.4130859375,2292.490234375,10.8203125},
	{2103.365234375,2255.12109375,11.0234375},
	{2103.427734375,2237.3427734375,11.0234375},
	{2090.6962890625,2223.4677734375,11.0234375},
	{2187.916015625,2474.2587890625,11.2421875},
	{2070.8896484375,2439.0380859375,49.522216796875},
	{2213.2841796875,2525.1650390625,10.8203125},
	{2116.734375,897.189453125,11.1796875},
	{2638.0927734375,1129.04296875,11.1796875},
	{2217.1220703125,1432.0537109375,11.0546875},
	{2198.0234375,1476.30859375,11.0546875},
	{2193.53125,1678.6162109375,12.3671875},
	{2637.6904296875,1672.421875,11.0234375},
	{2623.0458984375,1716.439453125,11.0234375},
	{2638.578125,1751.240234375,11.228747367859},
	{2553.8359375,1845.1494140625,11.0234375},
	{2572.3037109375,1903.2744140625,11.0234375},
	{2598.5732421875,1888.44921875,11.0234375},
	{2388.126953125,2022.107421875,10.8203125},
	{2438.7197265625,2064.361328125,10.8203125},
	{2491.0048828125,2065.0380859375,10.8203125},
	{2482.8291015625,2003.43359375,10.8203125},
	{2540.6533203125,2149.2666015625,10.8203125},
	{2596.8427734375,2381.171875,17.8203125},
	{2516.2470703125,2299.21484375,10.8203125},
	{2423.166015625,2547.6044921875,10.8203125},
	{2478.041015625,2529.080078125,10.830163002014},
	{2470.125,2544.7138671875,22.078125},
	{2283.6826171875,2547.439453125,10.8203125},
	{1009.1875,-930.05078125,42.328125},
	{823.54296875,-1024.171875,25.147163391113},
	{812.2626953125,-1030.015625,24.830501556396},
	{974.177734375,-1257.70703125,16.887786865234},
	{996.978515625,-1296.158203125,13.546875},
	{999.58984375,-1295.748046875,13.546875},
	{928.103515625,-1352.8330078125,13.34375}
};

static const DayZSA_Farms[][lootVars] =
{
	{-1115.7578125,-1638.9384765625,76.3671875},
	{-2635.875,714.337890625,27.943759918213},
	{-1976.5029296875,427.15625,24.657264709473},
	{-1354.087890625,2058.705078125,53.1171875},
	{-1513.001953125,1978.2646484375,48.421875},
	{-1513.3935546875,1971.8173828125,48.421875},
	{-1504.04296875,1972.1533203125,48.421875},
	{-1052.4267578125,1547.734375,33.437610626221},
	{-641.3017578125,2715.2802734375,72.375},
	{-624.716796875,2709.775390625,72.375},
	{-604.4365234375,2715.7958984375,72.72306060791},
	{-439.6220703125,2228.0205078125,43.109375},
	{-377.25390625,2242.3759765625,42.618461608887},
	{-375.56640625,2257.8310546875,43.06192779541},
	{-400.951171875,2200.44140625,42.4296875},
	{-392.611328125,2486.23828125,41.372394561768},
	{-12.3974609375,2346.7666015625,24.140625},
	{578.787109375,1224.7607421875,11.711267471313},
	{572.88671875,1221.32421875,11.711267471313},
	{639.8046875,1236.189453125,11.701827049255},
	{418.4423828125,1165.1923828125,7.887414932251},
	{407.7529296875,1162.9384765625,7.9095220565796},
	{300.62890625,1141.271484375,9.1374855041504},
	{-1078.2314453125,-1154.40625,129.21875},
	{-1065.3251953125,-1157.4287109375,129.21875},
	{-1036.728515625,-1185.537109375,129.21875},
	{-1061.1689453125,-1205.46875,129.75645446777},
	{-951.060546875,-530.763671875,25.953638076782},
	{-914.5185546875,-533.6328125,25.953638076782},
	{-923.6982421875,-497.7255859375,26.765625},
	{-347.9560546875,-1045.6669921875,59.8125},
	{-350.033203125,-1036.1044921875,59.6640625},
	{-382.6474609375,-1040.46484375,58.928451538086},
	{-385.662109375,-1153.30859375,69.518951416016},
	{-382.6884765625,-1438.8076171875,26.14489364624},
	{-382.8759765625,-1426.30078125,26.293727874756},
	{-401.7822265625,-1419.7373046875,26.328125},
	{-78.4384765625,-1169.9111328125,2.1367826461792},
	{-68.74609375,-1545.6875,3.0043075084686},
	{-102.8818359375,-1575.30859375,2.6171875},
	{-91.2294921875,-1592.5517578125,3.0043075084686},
	{-418.8896484375,-1759.2001953125,6.21875},
	{-282.98046875,-2174.5419921875,28.661544799805},
	{-265.767578125,-2213.1220703125,29.041954040527},
	{-39.7099609375,-2493.8671875,36.6484375},
	{-27.7490234375,-2485.369140625,36.6484375},
	{-13.517578125,-2500.9833984375,36.655464172363},
	{-17.583984375,-2527.06640625,36.655464172363},
	{24.4990234375,-2646.6298828125,40.464256286621},
	{33.4814453125,-2649.908203125,40.728469848633},
	{-1562.140625,-2733.275390625,48.743457794189},
	{-1623.455078125,-2693.2626953125,48.742660522461},
	{-2070.529296875,-2317.3115234375,30.731250762939},
	{-2075.9306640625,-2312.3330078125,31.13125038147},
	{-2191.921875,-2255.1806640625,33.3203125},
	{-2198.93359375,-2243.5791015625,33.3203125},
	{-2409.8232421875,-2189.9716796875,34.0390625},
	{-2816.1865234375,-1530.6953125,140.84375},
	{-1864.6572265625,-1559.265625,22.2109375},
	{-1424.2744140625,-1478.6591796875,105.03207397461},
	{-1438.732421875,-1544.6201171875,102.18502807617},
	{-1462.2158203125,-1582.9296875,101.7578125},
	{-1449.9501953125,-1459.2919921875,101.7578125},
	{-607.5927734375,-1073.896484375,23.499340057373},
	{-594.6728515625,-1057.0361328125,23.355651855469},
	{-576.5341796875,-1032.095703125,23.832122802734},
	{-574.740234375,-1484.22265625,14.34375},
	{-1634.10546875,-2232.53515625,31.4765625},
	{-1115.6142578125,-1637.23828125,76.3671875},
	{-568.48046875,-1482.4150390625,10.008075714111},
	{-746.8447265625,-131.2373046875,65.835411071777},
	{-758.3359375,-131.5419921875,65.835411071777},
	{-548.3115234375,-75.208984375,62.859375},
	{-542.7138671875,-60.947265625,62.9921875},
	{-545.4716796875,-196.5,78.413536071777},
	{-561.58984375,-176.9716796875,78.413543701172},
	{-487.962890625,-168.33984375,78.2109375},
	{-473.134765625,-168.4306640625,78.2109375},
	{-59.7998046875,84.2744140625,3.1171875},
	{-48.4873046875,27.51953125,6.484375},
	{-20.6171875,81.9970703125,3.1096496582031},
	{-89.615234375,-54.6318359375,3.1171875},
	{-120.4091796875,-102.11328125,3.1180820465088},
	{-70.751953125,-98.4501953125,3.1180820465088},
	{-59.31640625,48.4609375,6.4765625},
	{-66.6845703125,38.744140625,6.4760594367981},
	{-144.732421875,-50.1650390625,3.1171875},
	{-61.4541015625,32.8349609375,3.1102695465088},
	{-109.1025390625,-3.560546875,3.1171875},
	{-70.8857421875,37.3623046875,3.1102695465088},
	{-52.908203125,56.3974609375,3.1102695465088},
	{-35.3310546875,52.841796875,3.109375},
	{-91.349609375,-24.6943359375,3.1171875},
	{-74.087890625,-109.162109375,3.1180820465088},
	{-144.634765625,-96.06640625,3.1180820465088},
	{-144.7724609375,-86.36328125,3.1180820465088},
	{374.4228515625,-116.408203125,1.2477531433105},
	{357.5263671875,-116.6533203125,1.2581691741943},
	{354.2265625,-116.6494140625,1.260570526123},
	{867.8134765625,-24.603515625,64.0390625},
	{869.24609375,-16.4560546875,63.1953125},
	{1918.212890625,173.666015625,37.269790649414},
	{1914.94140625,152.7763671875,37.230663299561},
	{1932.447265625,146.6201171875,37.28125},
	{1568.1416015625,29.9248046875,24.1640625},
	{1566.48828125,23.4306640625,24.1640625},
	{1549.2861328125,13.6142578125,24.143926620483},
	{1540.6923828125,12.3232421875,24.136585235596},
	{1539.20703125,18.298828125,24.140625},
	{1547.556640625,21.19140625,24.140625},
	{1513.83203125,19.08984375,24.140625},
	{1512.51171875,9.712890625,24.140625},
	{1519.1669921875,14.900390625,24.140625},
	{1546.9169921875,-34.158203125,21.302310943604},
	{1553.822265625,-24.1748046875,21.377689361572},
	{1050.8388671875,-313.5302734375,73.99308013916},
	{1040.072265625,-299.3740234375,73.99308013916},
	{1051.3291015625,-287.40234375,73.99308013916},
	{1024.8525390625,-313.1611328125,73.99308013916},
	{1012.921875,-298.2265625,73.99308013916},
	{1013.6298828125,-286.1455078125,73.99308013916}
};

static const DayZSA_Military[][lootVars] =
{
	{-2554.7705078125,-13.7060546875,12.671875},
	{-1716.439453125,-43.021484375,3.5546875},
	{-1670.8447265625,705.4541015625,30.6015625},
	{-2176.123046875,718.9609375,53.890956878662},
	{-1389.716796875,2637.3203125,55.984375},
	{-1380.51171875,2641.134765625,55.625045776367},
	{-345.6181640625,1535.7685546875,75.5625},
	{-346.1875,1547.19140625,75.5625},
	{-340.5126953125,1543.2158203125,75.5625},
	{-347.9462890625,1607.69140625,75.882217407227},
	{-308.9384765625,1541.392578125,75.5625},
	{404.9765625,2478.1826171875,16.484375},
	{154.5009765625,2412.947265625,17.55677986145},
	{197.982421875,2434.8388671875,16.986110687256},
	{314.771484375,2411.30859375,17.745491027832},
	{331.2509765625,2591.3115234375,17.471616744995},
	{279.2216796875,2641.8974609375,16.936672210693},
	{324.6072,1937.5347,17.6406},
	{338.8560,1936.4545,17.6406},
	{339.9987,1959.2100,17.6406},
	{324.7736,1973.0422,17.6406},
	{339.4502,1972.1008,17.6406},
	{324.3599,1996.2249,17.6406},
	{130.1083984375,2583.8837890625,17.186950683594},
	{209.400390625,2609.2880859375,17.347387313843},
	{141.1826171875,1875.015625,17.843418121338},
	{155.865234375,1903.4921875,18.6650390625},
	{232.822265625,1841.21484375,17.640625},
	{285.6748046875,1966.7314453125,17.640625},
	{268.568359375,1954.2724609375,17.640625},
	{282.6669921875,1943.1591796875,17.640625},
	{285.3740234375,1979.07421875,17.640625},
	{269.49609375,1986.1474609375,17.640625},
	{282.0595703125,2000.0634765625,17.640625},
	{284.240234375,2013.51953125,17.640625},
	{268.6796875,2018.572265625,17.640625},
	{280.6923828125,2033.57421875,17.640625},
	{353.73828125,2030.513671875,23.867307662964},
	{215.8583984375,1819.9404296875,6.4140625},
	{250.48046875,1797.2734375,7.4140625},
	{244.7841796875,1825.1845703125,7.5546875},
	{260.3115234375,1815.8583984375,1.0078125},
	{287.1142578125,1816.2734375,1.0078125},
	{280.2822265625,1820.791015625,4.7176899909973},
	{329.984375,1839.3076171875,7.828125},
	{296.86328125,1846.36328125,7.7265625},
	{273.1826171875,1873.0068359375,8.7578125},
	{274.6279296875,1855.9345703125,8.7648944854736},
	{266.8427734375,1891.8330078125,8.4375},
	{269.0341796875,1876.6123046875,-3.471396446228},
	{268.5,1891.5048828125,-12.860445022583},
	{268.6533203125,1876.896484375,-22.242134094238},
	{268.9384765625,1883.416015625,-30.09375},
	{265.0361328125,1881.3916015625,-30.390625},
	{266.6064453125,1894.2109375,33.8984375},
	{-217.2509765625,978.083984375,19.498880386353},
	{-315.3505859375,830.384765625,14.2421875},
	{795.162109375,1686.50390625,5.28125},
	{813.080078125,1673.8876953125,5.28125},
	{777.697265625,1871.5849609375,4.9077544212341},
	{1054.2607421875,2269.8408203125,10.8203125},
	{2595.4658203125,2790.1005859375,10.8203125},
	{-1422.9892578125,512.4384765625,3.0390625},
	{-1376.5263671875,511.8603515625,3.0390625},
	{-1368.65234375,496.662109375,3.0444478988647},
	{-1340.92578125,491.7978515625,11.1953125},
	{-1288.083984375,490.724609375,11.1953125},
	{-1291.515625,512.4990234375,11.1953125},
	{616.7314453125,-611.7666015625,17.2265625},
	{1524.501953125,-1677.99609375,6.21875},
	{1368.712890625,-1280.0537109375,13.546875},
	{1752.4580078125,2080.4111328125,10.8203125},
	{1767.5576171875,2080.3896484375,10.8203125},
	{2158.8330078125,942.259765625,10.8203125},
	{2200.185546875,1393.439453125,10.8203125},
	{2346.017578125,1518.05078125,42.81559753418},
	{2458.677734375,1922.0908203125,10.86473274231},
	{2477.2314453125,1956.134765625,10.546496391296},
	{2576.9140625,2081.4833984375,10.812986373901},
	{2538.52734375,2084.9775390625,10.8203125},
	{2238.0517578125,2231.6865234375,10.809753417969},
	{2238.900390625,2236.65625,10.803951263428},
	{2301.5126953125,2454.03515625,10.8203125},
	{2339.0712890625,2457.0361328125,14.96875},
	{2388.7509765625,2469.291015625,10.8203125},
	{2294.79296875,2486.5478515625,3.2734375},
	{2233.494140625,2467.16796875,-7.4475412368774},
	{2233.9970703125,2448.5634765625,-7.453125},
	// 2k island
 	{777.9775,-2853.8333,5.6078},
    {772.4682,-2853.8972,5.6078},
    {772.2394,-2842.2400,5.5843},
    {771.3828,-2835.7249,4.2331},
    {784.1740,-2835.7568,4.2272},
    {804.0578,-2842.3098,4.2253},
    {780.5759,-2902.0693,6.3367},
    {771.1031,-2909.1729,6.3367},
    {759.8653,-2896.6062,6.3367},
    {744.8954,-2898.1096,6.3367},
    {759.9103,-2918.4077,6.3080},
    {763.4586,-2933.1753,8.9159},
    {839.8438,-2943.7688,7.7542},
    {833.1843,-2946.5300,4.3606},
    {823.8573,-2959.2200,2.9542},
    {828.6514,-2963.0303,4.2542},
    {840.4807,-2960.4021,3.7433},
    {848.2685,-2952.7253,4.2542},
    {850.0618,-2947.5376,3.6430},
    {841.6868,-2942.0144,4.0610},
    {974.6116,-2865.7935,1.9788},
    {929.3654,-2776.2595,1.7531},
    {927.9824,-2752.8550,3.4003},
    {807.3971,-2747.5007,2.7291},
    {791.1901,-2738.6211,2.7351},
    {797.8240,-2739.9517,4.6103},
    {791.2281,-2749.4932,1.9121},
    {786.8776,-2757.0645,1.7531},
   	{2776.3916015625,-2445.9912109375,13.63644695282}, // industrial
	{2776.302734375,-2465.4873046875,13.636467933655},
	{2794.921875,-2483.4482421875,13.641567230225},
	{2776.123046875,-2504.1513671875,13.633953094482},
	{2743.7646484375,-2452.8408203125,13.86225605011},
	{2799.1015625,-2393.4853515625,13.95600605011},
	{-2457.4091796875,777.58203125,35.171875},
	{2776.4013671875,-2408.6435546875,13.648777008057},
	{2786.978515625,-2428.1826171875,13.633860588074},
	{2505.9169921875,-2454.0302734375,17.882808685303},
	{2513.732421875,-2417.6318359375,17.882808685303},
	{2430.7978515625,-2467.2958984375,13.632326126099},
	{2503.6875,-2640.958984375,13.86225605011},
	{2156.107421875,-2667.9794921875,17.882808685303},
	{2522.244140625,-2207.9345703125,17.357162475586},
	{2582.486328125,-2207.126953125,17.357162475586},
	{2707.0185546875,-2188.779296875,13.546875},
	{2588.0048828125,-2192.29296875,13.546875},
	{2198.08984375,-2412.8046875,13.546875},
	{-2717.859375,197.87109375,4.3418498039246},
	{-2729.1767578125,72.939453125,4.3359375},
	{-2742.349609375,129.5283203125,4.5390625},
	{2210.150390625,-2205.2861328125,15.171091079712},
	{2160.1572265625,-2232.23828125,13.305326461792},
	{2167.23046875,-2264.46875,13.309000968933},
	{2222.744140625,-2273.068359375,14.764669418335},
	{2272.5087890625,-2264.4091796875,14.764669418335},
	{-2528.4912109375,-20.396484375,16.421875},
	{2094.72265625,-2155.9580078125,13.6328125},
	{-2492.84375,155.6650390625,8.4730567932129},
	{-2489.359375,94.734375,25.6171875},
	{1984.5498046875,-2155.3212890625,13.546875},
	{2163.51953125,-1988.986328125,14.133599281311},
	{2228.294921875,-2060.638671875,13.546875},
	{2201.482421875,-1969.498046875,13.78413105011},
	{2225.234375,-2040.5390625,17.271224975586},
	{-2562.443359375,323.0859375,10.5625},
	{2371.6875,-2114.6640625,27.1796875},
	{-2498.576171875,315.3271484375,29.1328125},
	{2512.251953125,-2073.181640625,26.5546875},
	{1856.962890625,-2336.6005859375,13.546875},
	{1840.83203125,-2638.27734375,13.546875},
	{2133.15234375,-2410.599609375,13.546875},
	{1683.9970703125,-2006.8037109375,14.129119873047},
	{-2312.7890625,-81.3466796875,35.3203125},
	{-2151.6669921875,-147.22265625,36.467098236084},
	{-2138.875,-247.572265625,36.515625},
	{-2181.48828125,-205.2939453125,36.515625},
	{-2109.4970703125,1.3935546875,35.3203125},
	{-2026.8974609375,67.322265625,28.691593170166},
	{-2102.4658203125,-16.56640625,35.3203125},
	{2014.154296875,-2142.572265625,13.546875},
	{-2135.8994140625,260.365234375,35.416137695312},
	{-2060.3955078125,254.4658203125,37.178237915039},
	{-2038.4873046875,171.05078125,28.8359375},
	{2517.330078125,-1975.669921875,15.806817054749},
	{2490.5400390625,-1975.6357421875,15.806816101074},
	{2440.1650390625,-1970.5771484375,13.546875},
	{-2054.3291015625,309.2421875,41.864288330078},
	{-1942.6982421875,271.9892578125,41.047080993652},
	{-1905.5556640625,220.7880859375,35.15625},
	{2440.7470703125,-1899.701171875,13.553356170654},
	{-1811.0859375,-228.443359375,18.375},
	{-1890.5712890625,-205.8447265625,14.304314613342},
	{-1812.966796875,-136.107421875,6.1635961532593},
	{-1864.2919921875,-145.5126953125,11.8984375},
	{-1723.8125,-115.4794921875,3.5489187240601},
	{-1577.10546875,25.8125,17.328125},
	{-1699.376953125,76.025390625,3.5546875},
	{-1639.8642578125,-35.89453125,3.8062529563904},
	{-2094.9404296875,-104.001953125,35.3203125},
	{-1979.365234375,426.9423828125,24.620567321777},
	{2107.96484375,-1876.0947265625,13.546875},
	{-1959.6044921875,620.4697265625,35.15119934082},
	{1918.2236328125,-1864.302734375,13.561338424683},
	{1851.8330078125,-1854.669921875,13.3828125},
	{1855.572265625,-1857.4453125,13.3828125},
	{-1606.2333984375,672.068359375,-4.90625},
	{-1614.291015625,687.51171875,7.1875},
	{1659.78515625,-1802.490234375,13.551996231079},
	{1600.4599609375,-1842.94140625,13.500748634338},
	{1610.8515625,-1897.546875,13.547914505005},
	{-2277.353515625,528.3818359375,35.171875},
	{-2567.2490234375,552.7353515625,14.560428619385},
	{-2447.671875,522.552734375,30.3671875},
	{1180.7099609375,-1877.30078125,13.558115959167},
	{867.7431640625,-1799.00390625,13.815788269043},
	{534.6474609375,-1819.181640625,6.5712623596191},
	{403.716796875,-1729.150390625,9.3225193023682},
	{-2661.3984375,780.7861328125,49.984375},
	{477.9423828125,-1745.3037109375,9.3753871917725},
	{-2569.2197265625,850.6640625,54.728054046631},
	{-2473.40625,1065.9775390625,55.7265625},
	{-1951.9853515625,305.5302734375,41.047080993652},
	{-1952.626953125,306.1337890625,35.46875},
	{-1942.427734375,276.8486328125,35.473926544189},
	{-1924.1845703125,307.748046875,41.046875},
	{-1828.5634765625,49.87890625,15.122790336609},
	{-1706.7421875,-4.7578125,3.5489187240601},
	{-1720.9599609375,11.4248046875,3.6017475128174},
	{-1253.5400390625,48.671875,14.136159896851},
	{-1478.693359375,-43.5625,6.0},
	{-1477.609375,-42.32421875,6.0},
	{-1476.90234375,-58.015625,6.0},
	{-1386.990234375,-128.1787109375,6.0},
	{-1388.478515625,-284.5263671875,6.0},
	{-1448.7568359375,-564.4248046875,14.171875},
	{-1472.970703125,-518.5029296875,14.171875},
	{-1405.8056640625,-536.5751953125,14.171875},
	{-1333.8408203125,-504.0439453125,14.171875},
	{-1391.2783203125,-481.28515625,14.17760848999},
	{-1373.59765625,-523.1064453125,14.387755393982},
	{-2254.005859375,2384.23828125,4.8753604888916},
	{-2283.8837890625,2286.287109375,5.0520958900452},
	{-2292.5751953125,2288.9736328125,4.9279627799988},
	{-1827.052734375,673.751953125,30.43127822876},
	{2642.6103515625,-1954.4521484375,13.546875},
	{-2438.6748046875,1028.6884765625,50.390625},
	{988.9541015625,-1751.853515625,13.501810073853},
	{-2385.6103515625,2216.5029296875,4.984375},
	{-2434.7314453125,2259.6591796875,4.984375},
	{-2434.7138671875,2313.1669921875,4.984375},
	{-2277.4765625,541.400390625,35.171875},
	{-2237.4697265625,2353.96875,4.9795379638672},
	{-2237.6259765625,2328.5283203125,4.9917659759521},
	{-2186.2587890625,2417.8935546875,5.1900615692139},
	{-1976.796875,1222.302734375,31.804220199585},
	{1059.9755859375,-1607.0107421875,20.486064910889},
	{-2163.0830078125,1232.802734375,33.9296875},
	{-1389.384765625,2631.7880859375,55.984375},
	{1217.2373046875,-1694.0810546875,19.734375},
	{-2232.9521484375,1108.0458984375,80.000846862793},
	{1275.37109375,-1693.55859375,19.734375},
	{1271.240234375,-1663.734375,19.734375},
	{-1695.42578125,1035.39453125,45.2109375},
	{-1477.6123046875,2641.919921875,58.787948608398},
	{-1484.66796875,2613.5341796875,58.787948608398},
	{-1477.1865234375,2612.6484375,58.78125},
	{-1484.5830078125,2641.2255859375,58.78125},
	{-1421.85546875,2592.2119140625,55.805564880371},
	{-1512.234375,1277.25390625,7.1793155670166},
	{-1581.439453125,1277.2626953125,7.1793193817139},
	{-1505.345703125,2625.1787109375,55.8359375},
	{-1740.6875,1429.1533203125,7.1875},
	{-1734.6669921875,1480.083984375,7.1875},
	{-1734.6396484375,1526.626953125,7.1875},
	{-1459.62109375,2616.5546875,55.8359375},
	{-1783.3955078125,1479.1494140625,7.1875},
	{-1834.2744140625,1429.4599609375,7.1875},
	{-1828.0693359375,1503.068359375,7.1841449737549},
	{-1936.0712890625,1492.87109375,7.1846542358398},
	{-1904.830078125,1461.33984375,7.1784248352051},
	{-1976.72265625,1272.982421875,7.6033039093018},
	{-1788.0654296875,1209.064453125,25.125},
	{-1784.8193359375,1209.0751953125,25.125},
	{2728.212890625,-2381.5576171875,17.340341567993},
	{2649.189453125,-2380.65625,17.340341567993},
	{2771.345703125,-1628.1552734375,12.177460670471},
	{2767.8173828125,-1606.0390625,10.921875},
	{2662.1533203125,-1591.6259765625,13.733552932739},
	{2657.189453125,-1589.662109375,13.975473403931},
	{2686.1572265625,-1472.4228515625,30.562562942505},
	{2786.0751953125,-1436.072265625,30.453125},
	{2784.5732421875,-1466.1904296875,30.453125},
	{2779.732421875,-1415.9208984375,24.745338439941},
	{2052.8408203125,-1093.19140625,24.60772895813},
	{1988.037109375,-1083.453125,24.847997665405},
	{2128.4111328125,-1153.3740234375,23.999715805054},
	{2209.7900390625,-1183.6982421875,33.53125},
	{2195.6474609375,-1153.080078125,33.524044036865},
	{2413.5537109375,-1433.1435546875,24.002767562866},
	{2410.8359375,-1410.435546875,24.116115570068},
	{1880.806640625,-1312.376953125,14.500373840332},
	{1888.21875,-1320.0537109375,14.500373840332},
	{1863.4541015625,-1305.39453125,13.564666748047},
	{1912.0556640625,-1777.8564453125,13.3828125},
	{2195.7939453125,-1506.9921875,23.942268371582},
	{2188.78125,-1506.7568359375,23.934396743774},
	{2182.078125,-1503.638671875,23.953277587891},
	{2174.5849609375,-1502.818359375,23.956878662109},
	{2482.080078125,-1464.7060546875,24.016670227051},
	{2507.96875,-1470.78125,24.035413742065},
	{-1438.2265625,1491.7197265625,1.8671875},
	{-1393.9892578125,1482.345703125,1.8671875},
	{-1384.146484375,1485.1513671875,8.90625},
	{-1375.58203125,1488.880859375,11.203125},
	{-1477.5126953125,1491.2021484375,8.2578125},
	{-2472.4375,1551.5849609375,33.227333068848},
	{-2474.591796875,1554.1279296875,33.234375},
	{-2473.9599609375,1533.3359375,28.828125},
	{-2388.375,1547.650390625,2.1171875},
	{-2366.5205078125,1535.642578125,2.1171875},
	{-769.458984375,1483.8896484375,24.552076339722},
	{-897.0498046875,1970.2177734375,60.635875701904},
	{2442.919921875,-1759.125,13.591394424438},
	{-911.96875,2686.4091796875,42.370262145996},
	{-738.3603515625,2755.755859375,47.2265625},
	{-226.3466796875,1407.875,69.9375},
	{-317.9130859375,2659.14453125,63.869228363037},
	{388.6513671875,2603.099609375,16.484375},
	{377.728515625,2590.71484375,16.484375},
	{315.5087890625,2543.5087890625,16.812480926514},
	{335.2490234375,2548.2568359375,16.802839279175},
	{301.111328125,2543.0947265625,16.819511413574},
	{280.3330078125,2542.486328125,16.817897796631},
	{212.16796875,1811.8154296875,21.8671875},
	{210.9345703125,1834.892578125,17.640625},
	{237.46875,1857.9521484375,17.856994628906},
	{246.6162109375,1859.0380859375,14.084012985229},
	{245.3564453125,1876.9365234375,8.7578125},
	{240.4501953125,1861.759765625,8.7578125},
	{266.8359375,1839.326171875,6.4769406318665},
	{248.4287109375,1816.5673828125,7.5546875},
	{214.4873046875,1826.7333984375,6.4140625},
	{187.6884765625,1371.734375,23.734375},
	{1576.45703125,-1474.689453125,14.220542907715},
	{215.294921875,1467.6572265625,23.734375},
	{246.6611328125,1436.59375,23.37028503418},
	{247.2685546875,1386.244140625,23.37028503418},
	{153.4189453125,1392.3291015625,10.5859375},
	{152.869140625,1427.5263671875,10.591223716736},
	{120.7529296875,1457.1083984375,10.62112903595},
	{353.9873046875,1304.2353515625,13.362517356873},
	{434.228515625,1271.048828125,10.023582458496},
	{625.8408203125,1358.8427734375,13.182829856873},
	{577.0146484375,1427.8330078125,12.331267356873},
	{538.203125,1472.2490234375,5.6047048568726},
	{486.564453125,1529.7919921875,1.4532699584961},
	{436.458984375,1566.5390625,12.784392356873},
	{-99.3193359375,1085.2294921875,19.7421875},
	{321.30859375,872.3779296875,20.399021148682},
	{322.3681640625,857.4912109375,20.40625},
	{565.2353515625,824.109375,-22.127143859863},
	{680.2529296875,827.109375,-38.992092132568},
	{691.91796875,847.9931640625,-39.007717132568},
	{587.9296875,871.0205078125,-42.497318267822},
	{816.4755859375,856.998046875,12.7890625},
	{565.2099609375,1311.640625,11.268767356873},
	{801.9951171875,1669.6689453125,5.28125},
	{769.88671875,2053.193359375,6.7109375},
	{782.0654296875,2067.880859375,6.7109375},
	{756.97265625,2075.8623046875,6.7109375},
	{1049.11328125,2908.890625,47.82311630249},
	{1065.9228515625,2914.05859375,47.82311630249},
	{2006.623046875,2908.3876953125,47.82311630249},
	{2024.85546875,2914.5341796875,47.82311630249},
	{2810.7294921875,2918.40234375,36.5046043396},
	{2918.853515625,2119.3095703125,17.895481109619},
	{2818.671875,854.90234375,10.016822814941},
	{2856.1015625,855.2392578125,9.9886856079102},
	{2845.658203125,953.3330078125,10.75},
	{2816.5166015625,971.9853515625,10.75},
	{2699.150390625,876.2041015625,10.457724571228},
	{2686.73828125,835.8828125,19.081390380859},
	{2560.8037109375,786.283203125,5.3157968521118},
	{2571.9599609375,786.2587890625,10.954463005066},
	{2559.4072265625,787.1552734375,10.954463005066},
	{1727.9169921875,733.181640625,10.8203125},
	{1723.525390625,707.7177734375,10.8203125},
	{1664.3408203125,733.4111328125,10.8203125},
	{1606.748046875,708.228515625,10.8203125},
	{1606.783203125,729.6123046875,10.8203125},
	{1038.689453125,1015.6962890625,11.0},
	{1059.0615234375,1239.1982421875,10.827476501465},
	{1060.6962890625,1277.2705078125,10.8203125},
	{1042.611328125,1305.5810546875,10.8203125},
	{939.115234375,1739.154296875,8.8515625},
	{952.1171875,1769.9970703125,8.8515625},
	{976.6630859375,2081.0,10.8203125},
	{925.6767578125,2083.236328125,10.8203125},
	{926.4384765625,2057.66796875,10.8203125},
	{967.640625,2159.4072265625,10.8203125},
	{1091.0048828125,2116.341796875,15.350400924683},
	{1079.990234375,2132.2490234375,10.8203125},
	{1085.25390625,2119.986328125,10.8203125},
	{1063.5029296875,2079.5068359375,10.8203125},
	{1125.619140625,2008.794921875,10.8203125},
	{1125.2802734375,1985.640625,10.8203125},
	{1085.5263671875,1911.3779296875,10.8203125},
	{1111.28125,1914.15234375,10.8203125},
	{1053.90234375,2252.34375,10.8203125},
	{1025.453125,2268.9248046875,10.8203125},
	{1103.5712890625,2326.3046875,10.8203125},
	{1121.9013671875,2342.8671875,10.8203125},
	{1153.9189453125,2341.7431640625,10.8203125},
	{1070.7001953125,2170.1552734375,16.71875},
	{2103.4658203125,2677.0498046875,10.812969207764},
	{2108.1220703125,2652.4365234375,10.812969207764},
	{2120.177734375,2655.0498046875,10.812969207764},
	{2142.5478515625,2718.3193359375,10.8203125},
	{2193.6806640625,2791.447265625,10.8203125},
	{2198.767578125,2791.92578125,10.8203125},
	{2214.35546875,2792.78515625,10.8203125},
	{2207.486328125,2725.767578125,10.8203125},
	{2263.376953125,2753.75,10.8203125},
	{2263.515625,2778.1767578125,10.8203125},
	{2289.6416015625,2783.9775390625,10.8203125},
	{2291.798828125,2755.451171875,10.8203125},
	{2291.7548828125,2739.0244140625,10.8203125},
	{2315.318359375,2768.935546875,10.8203125},
	{2335.0419921875,2786.3701171875,10.8203125},
	{2343.5244140625,2766.2724609375,10.8203125},
	{2358.9091796875,2774.96875,10.8203125},
	{2420.7333984375,2780.388671875,10.8203125},
	{2502.482421875,2777.712890625,10.8203125},
	{2551.6826171875,2815.7275390625,10.8203125},
	{2596.8330078125,2808.8125,11.015830993652},
	{2613.2099609375,2810.5712890625,10.8203125},
	{2608.689453125,2839.23046875,10.8203125},
	{2624.767578125,2840.0634765625,10.8203125},
	{2598.2841796875,2799.8720703125,10.8203125},
	{2717.3310546875,2849.201171875,10.8203125},
	{2737.30859375,2753.4443359375,10.8203125},
	{2714.6796875,2673.611328125,10.8203125},
	{2622.2392578125,2715.6875,36.538642883301},
	{2662.0908203125,2676.90234375,10.8203125},
	{2681.4990234375,2667.1689453125,10.8203125},
	{2793.83984375,2530.25390625,11.0625},
	{2905.978515625,2491.16796875,11.0625},
	{2808.833984375,2019.7890625,10.8203125},
	{2800.5009765625,2020.421875,10.812992095947},
	{2808.4169921875,1986.646484375,10.8203125},
	{2807.7001953125,1634.1181640625,10.8203125},
	{2816.5810546875,1687.5234375,10.8203125},
	{2823.9375,1634.9892578125,10.8203125},
	{2832.07421875,1689.4052734375,10.8203125},
	{2839.3994140625,1634.103515625,10.8203125},
	{2847.9248046875,1689.35546875,10.8203125},
	{2868.0625,1588.8525390625,10.8203125},
	{2867.9873046875,1621.4189453125,10.8203125},
	{2874.4990234375,1587.3759765625,10.8203125},
	{2882.8896484375,1621.7314453125,10.8203125},
	{2889.8212890625,1590.45703125,10.8203125},
	{2899.5361328125,1620.791015625,10.8203125},
	{2781.5419921875,1444.8740234375,10.696803092957},
	{2856.9775390625,1284.5283203125,11.390625},
	{2857.044921875,1308.8486328125,11.390625},
	{2815.3505859375,1244.990234375,11.3125},
	{2774.4541015625,1243.3193359375,11.3125},
	{-1951.3173828125,1000.6396484375,35.175628662109},
	{-1320.685546875,493.205078125,18.234375},
	{-1479.3505859375,430.0,7.1875},
	{-1422.6416015625,372.73046875,7.1875},
	{-1465.4599609375,337.732421875,7.1875},
	{-1728.029296875,181.03515625,3.5546875},
	{-1691.2890625,-87.5361328125,3.5715780258179},
	{-1197.2041015625,-130.8515625,14.1484375},
	{-1233.2412109375,-86.5556640625,14.29193687439},
	{-1816.6513671875,-180.69140625,9.3984375},
	{-2084.64453125,-743.4033203125,32.171875},
	{-2096.4130859375,-809.65234375,32.171875},
	{-2067.6474609375,-860.0107421875,32.171875},
	{-2079.0458984375,-925.1484375,32.171875},
	{-2095.75390625,-966.0205078125,32.171875},
	{-1964.25,-755.33984375,35.890884399414},
	{-1945.4501953125,-806.0654296875,35.93962097168},
	{-1964.26171875,-879.8671875,36.262706756592},
	{-1945.1962890625,-911.0498046875,35.890884399414},
	{-1963.6259765625,-959.3974609375,36.290878295898},
	{-2520.646484375,-624.9404296875,132.78553771973},
	{-2521.90625,-624.951171875,132.78158569336},
	{-2535.2138671875,-688.673828125,139.3203125},
	{-2505.955078125,-666.00390625,139.3203125},
	{-1940.962890625,-1091.6123046875,32.175434112549},
	{-1948.9638671875,-1091.5654296875,32.175434112549},
	{-1437.4697265625,-964.10546875,201.05328369141},
	{-1424.443359375,-967.3876953125,200.81311035156},
	{-1181.90234375,-1133.8779296875,129.21875},
	{-1184.7333984375,-1143.9267578125,129.21875},
	{-993.9638671875,-700.7119140625,32.0078125},
	{-1053.3310546875,-694.8388671875,32.3515625},
	{-1103.5712890625,-752.294921875,32.0078125},
	{-1115.271484375,-667.0048828125,32.0078125},
	{-1067.7939453125,-597.3525390625,32.0078125},
	{-576.1923828125,-538.9931640625,25.5234375},
	{-529.0849609375,-539.048828125,25.5234375},
	{-520.630859375,-506.4384765625,24.515340805054},
	{-619.578125,-490.775390625,25.5234375},
	{-395.06640625,-1148.8955078125,69.414436340332},
	{-58.3115234375,-1112.5966796875,1.3712005615234},
	{-69.4423828125,-1104.060546875,1.078125},
	{-87.0576171875,-1212.1640625,2.890625},
	{-90.9384765625,-1576.271484375,2.6171875},
	{-263.8203125,-2183.5810546875,28.937950134277},
	{-1971.6767578125,-2431.595703125,30.625},
	{-1992.8837890625,-2388.359375,30.625},
	{-2091.8896484375,-2260.0693359375,30.625},
	{-2120.6064453125,-2296.5361328125,30.631944656372},
	{-2198.0224609375,-2329.6279296875,30.625},
	{-2183.4765625,-2430.1669921875,35.5234375},
	{-2156.3916015625,-2552.9521484375,30.6171875},
	{-2241.3623046875,-2479.634765625,31.216468811035},
	{-2226.1494140625,-2400.462890625,31.984375},
	{-2191.7451171875,-2432.1484375,31.484375},
	{-2015.0400390625,-2395.818359375,30.625},
	{-2816.2548828125,-1515.603515625,140.84375},
	{-1830.9814453125,-1603.1318359375,23.015625},
	{-1805.3876953125,-1602.94140625,23.015625},
	{-1920.52734375,-1671.5361328125,23.015625},
	{-1849.0419921875,-1604.025390625,21.7578125},
	{-1846.5400390625,-1708.5849609375,41.113433837891},
	{-1425.5751953125,-1553.6083984375,102.359375},
	{-1467.59375,-1522.412109375,101.75132751465},
	{-1632.8955078125,-2247.5673828125,31.4765625},
	{-1119.7041015625,-1626.40234375,76.37393951416},
	{-1112.24609375,-1677.064453125,76.3671875},
	{-1079.4052734375,-1296.880859375,129.21875},
	{-489.4853515625,-716.05078125,25.248840332031},
	{-77.2392578125,-1136.3759765625,1.078125},
	{1636.1298828125,-2237.677734375,13.506058692932},
	{1572.5693359375,-2242.9287109375,-2.7005190849304},
	{1568.48046875,-2333.177734375,-2.6844439506531},
	{1792.9951171875,-2334.0615234375,-2.6847453117371},
	{1806.4775390625,-2303.0615234375,-2.5784506797791},
	{1598.80078125,-2639.578125,13.546875},
	{1685.734375,-2638.685546875,13.601192474365},
	{1757.38671875,-2640.12890625,13.624307632446},
	{1898.04296875,-2640.3408203125,13.634287834167},
	{-726.4716796875,-104.1103515625,68.285224914551},
	{-435.5908203125,-59.4892578125,58.875},
	{-107.7705078125,-219.7900390625,1.9970067739487},
	{-121.533203125,-232.7431640625,1.421875},
	{-155.19921875,-293.9130859375,3.9053149223328},
	{-132.642578125,-313.8212890625,2.7646160125732},
	{-114.1904296875,-314.3271484375,2.7646160125732},
	{-84.361328125,-301.16015625,2.7646157741547},
	{-49.3046875,-269.6494140625,6.633186340332},
	{-11.07421875,-269.5751953125,5.4296875},
	{32.3818359375,-290.8232421875,2.195987701416},
	{84.34375,-314.5419921875,1.578125},
	{93.677734375,-308.94921875,1.578125},
	{90.53515625,-185.2373046875,1.484375},
	{121.9404296875,-294.06640625,1.578125},
	{79.8994140625,-179.513671875,1.5788015127182},
	{151.1376953125,-300.646484375,1.578125},
	{194.771484375,-225.9521484375,1.778618812561},
	{220.5595703125,-233.78515625,1.778618812561},
	{243.986328125,-47.2861328125,1.578125},
	{321.0517578125,-44.62890625,1.5699377059937},
	{331.26171875,-39.9609375,2.2255229949951},
	{344.6259765625,-71.193359375,2.4308085441589},
	{374.6015625,-76.740234375,1.3828125},
	{105.8173828125,-189.13671875,1.5086135864258},
	{312.5322265625,-153.5458984375,1.578125},
	{308.158203125,-191.17578125,1.578125},
	{303.169921875,-238.26953125,1.578125},
	{162.3916015625,-43.6484375,1.578125},
	{155.21484375,-21.7392578125,1.578125},
	{159.08203125,-22.6591796875,1.578125},
	{277.880859375,5.529296875,2.4217844009399},
	{209.603515625,26.099609375,2.57080078125},
	{214.177734375,22.1083984375,2.57080078125},
	{202.302734375,-182.6708984375,1.578125},
	{1206.623046875,174.1494140625,20.466976165771},
	{1243.7236328125,216.51953125,19.5546875},
	{1268.3505859375,232.5703125,25.048685073853},
	{1254.826171875,241.130859375,19.5546875},
	{1357.919921875,361.603515625,20.499504089355},
	{1323.5478515625,286.693359375,20.045194625854},
	{1199.2802734375,243.4189453125,19.5546875},
	{1427.1650390625,270.5390625,19.5546875},
	{1418.296875,221.408203125,19.561782836914},
	{2321.544921875,-62.4482421875,26.484375},
	{2318.248046875,-51.705078125,26.484375},
	{2315.5703125,33.6708984375,27.473955154419},
	{2324.9736328125,12.3369140625,26.484375},
	{2315.2060546875,56.0517578125,26.481512069702},
	{636.0791015625,-499.974609375,16.3359375},
	{710.0751953125,-569.740234375,16.3359375},
	{812.3603515625,-562.751953125,16.3359375},
	{843.13671875,-603.37109375,18.421875},
	{797.4208984375,-620.9560546875,16.3359375},
	{725.626953125,-469.60546875,16.3359375},
	{684.79296875,-444.8583984375,16.3359375},
	{1579.150390625,-1413.5146484375,13.546875},
	{1702.2421875,-1469.3564453125,13.546875},
	{1580.3486328125,-1634.7626953125,13.561421394348},
	{1611.162109375,-1720.8974609375,6.21875},
	{1291.7822265625,-1253.8310546875,13.546875},
	{1297.7333984375,-1254.0087890625,13.546875},
	{1319.7333984375,-1241.2666015625,13.546875},
	{1122.3857421875,-1334.6923828125,12.765430450439},
	{1112.900390625,-1334.5439453125,12.777824401855},
	{1095.501953125,-1333.6240234375,12.854690551758},
	{1084.4580078125,-1223.2919921875,15.8203125},
	{1107.0908203125,-1180.970703125,18.788990020752},
	{1702.1064453125,913.7470703125,10.8203125},
	{1732.7607421875,987.923828125,10.8203125},
	{1629.96875,962.341796875,10.808609962463},
	{1630.2109375,976.7177734375,10.8203125},
	{1624.7265625,1039.009765625,10.8203125},
	{1641.337890625,1074.083984375,10.8203125},
	{1707.5380859375,1074.3359375,10.8203125},
	{1612.294921875,915.7236328125,10.694253921509},
	{1524.279296875,1009.5546875,10.8203125},
	{1466.189453125,1067.859375,10.007030487061},
	{1468.21875,1039.86328125,10.176633834839},
	{1451.1953125,972.626953125,10.113735198975},
	{1407.1533203125,969.900390625,10.812976837158},
	{1404.8310546875,1147.681640625,10.8203125},
	{1354.0390625,1153.826171875,10.8203125},
	{1357.412109375,1043.3046875,10.8203125},
	{1317.8544921875,1252.9453125,14.273136138916},
	{1267.9306640625,1335.9736328125,10.812978744507},
	{1269.349609375,1372.19140625,10.8203125},
	{1304.330078125,1612.9052734375,10.8203125},
	{1340.673828125,1701.0634765625,10.8203125},
	{1345.853515625,1751.7734375,10.8203125},
	{1595.265625,1449.966796875,10.828193664551},
	{1567.91796875,1152.4404296875,10.8125},
	{1588.4033203125,1152.64453125,10.805154800415},
	{1667.9609375,1327.03515625,10.76210975647},
	{1653.267578125,1687.5673828125,10.8203125},
	{1661.232421875,1699.3662109375,10.8203125},
	{1716.154296875,1616.421875,10.04080581665},
	{1734.1572265625,1168.533203125,10.8203125},
	{1714.0908203125,1161.8291015625,10.785179138184},
	{1679.5263671875,1165.91796875,10.8203125},
	{1715.9091796875,1314.2109375,10.8203125},
	{1684.2109375,1849.6982421875,10.8203125},
	{1723.640625,2026.0478515625,10.8203125},
	{1311.5478515625,2085.80859375,10.8203125},
	{1490.9951171875,2364.2392578125,10.8203125},
	{1515.6279296875,2364.55078125,10.8203125},
	{1642.16015625,2338.59765625,9.9275417327881},
	{1678.6640625,2340.228515625,10.005611419678},
	{1677.1953125,2312.1484375,9.8829164505005},
	{1658.9814453125,2200.345703125,10.8203125},
	{1751.7412109375,2233.44140625,10.8203125},
	{1751.6025390625,2202.806640625,10.8203125},
	{1914.9599609375,1988.7490234375,7.5945882797241},
	{1856.3515625,1979.90234375,7.5950384140015},
	{1913.951171875,1931.6240234375,13.784772872925},
	{1932.2236328125,1816.25390625,12.714401245117},
	{1915.0048828125,1727.3134765625,12.714403152466},
	{2016.1767578125,1751.3125,12.77968120575},
	{1947.13671875,2070.68359375,10.8203125},
	{2008.15234375,2224.7578125,11.185302734375},
	{1983.005859375,2262.955078125,20.525520324707},
	{2063.337890625,2239.943359375,10.114772796631},
	{2185.8486328125,2503.96484375,10.8203125},
	{2117.591796875,2416.0634765625,36.6171875},
	{2098.9580078125,2420.9765625,74.578598022461},
	{2174.9921875,961.966796875,10.8203125},
	{2379.8017578125,1041.314453125,10.8203125},
	{2497.515625,1213.3046875,10.8203125},
	{2588.2197265625,1202.5556640625,10.8203125},
	{2599.9150390625,1267.041015625,10.8203125},
	{2230.4013671875,1431.62109375,11.0546875},
	{2297.9111328125,1458.0966796875,36.421875},
	{2609.7099609375,1437.61328125,10.8203125},
	{2609.2578125,1437.6875,10.8203125},
	{2407.87890625,1723.3291015625,10.8203125},
	{2477.8564453125,1761.0068359375,10.8203125},
	{2466.38671875,1762.009765625,10.8203125},
	{2454.20703125,1761.912109375,10.8203125},
	{2351.79296875,1882.0380859375,10.671875},
	{2220.0244140625,1979.2744140625,9.8671274185181},
	{2277.4658203125,1969.9189453125,15.5703125},
	{2297.9990234375,1981.5712890625,20.822093963623},
	{2298.341796875,1980.94140625,26.299333572388},
	{2277.263671875,1944.7265625,32.0078125},
	{2515.4912109375,2321.9970703125,10.8203125},
	{2295.2236328125,2440.34765625,10.8203125},
	{2295.6240234375,2477.6123046875,10.8203125},
	{1033.5419921875,-1116.2109375,23.893451690674},
	{1011.9638671875,-1116.595703125,23.898933410645},
	{901.11328125,-1202.6923828125,16.983215332031},
	{836.623046875,-1203.15625,16.9765625},
	{861.3544921875,-1256.3896484375,14.760587692261},
	{846.0087890625,-1292.974609375,13.652151107788},
	{910.306640625,-1235.380859375,17.218402862549},
	{915.8447265625,-1235.5244140625,17.2109375},
	{979.2724609375,-1254.681640625,16.946468353271},
	{1031.8544921875,-1448.833984375,13.554634094238},
	{1005.0517578125,-1463.7822265625,13.555473327637},
	{855.6826171875,-1360.052734375,13.745624542236},
	{858.552734375,-1422.9619140625,12.336584091187},
	{992.896484375,-1521.701171875,13.552418708801},
	{733.05078125,-1359.1865234375,23.579231262207},
	{732.6806640625,-1335.3681640625,13.538493156433},
	{435.0791015625,-1361.904296875,14.809816360474},
	{438.4423828125,-1360.453125,14.816032409668},
	{442.7666015625,-1355.5517578125,14.82363986969},
	{564.359375,-1293.5673828125,17.248237609863}, // end of industrial
	{-4734.4189,-2909.8511,33.6087}, // START OF COLD ISLAND
 	{-5078.0059,-2819.7085,53.3284},
    {-5075.1079,-2816.9480,51.6410},
    {-5128.1470,-2801.9077,47.6671},
    {-5128.5933,-2808.6584,50.7087},
    {-5121.6108,-2816.3315,52.7136},
    {-5105.8271,-2819.4258,52.9792},
    {-4742.4922,-2911.5706,33.6087},
    {-4743.8516,-2901.8198,33.6087},
    {-4718.2534,-2895.9500,33.6087},
    {-4738.3101,-2966.8889,34.2499},
    {-4747.9937,-2967.9919,34.2427},
    {-4747.4507,-2974.2021,34.3244},
    {-4740.3906,-2993.2993,34.5847},
    {-4744.2578,-2970.1682,37.5750},
    {-4735.9429,-2992.7395,37.6887},
    {-4741.5107,-2904.5168,36.9750},
    {-4717.6118,-2902.9336,37.0675},
    {-4683.5269,-2898.7290,33.9219},
    {-4698.3926,-2920.4736,33.7740},
    {-4665.8960,-2912.6919,33.7683},
    {-4647.0347,-2931.6321,34.0677},
    {-4643.2217,-2940.9321,34.1989},
    {-4632.2969,-2930.1409,34.0914},
    {-4685.5601,-2949.1616,34.1817},
    {-4710.2275,-2959.9319,34.2488},
    {-4677.2754,-2983.6267,34.6506},
    {-4686.5522,-2983.6501,34.6239},
    {-4685.6465,-2979.8149,34.5770},
    {-4790.4307,-2992.9004,51.3263},
    {-4792.8984,-2983.8269,51.3236},
    {-4783.2749,-2980.5691,51.3201},
    {-4775.9067,-2960.5308,33.9812},
    {-4794.4780,-2973.3926,34.1078},
    {-4798.2910,-2974.4575,34.1078},
    {-4778.8384,-2958.1052,33.9414},
    {-4788.3096,-2933.0457,33.5903},
    {-4788.7207,-2938.8186,33.6637},
    {-4810.6680,-2933.4739,33.5307},
    {-4809.4233,-2932.0886,33.5164},
    {-4845.9761,-2928.4045,33.3623},
    {-4857.0200,-2930.6682,33.3594},
    {-4871.7852,-2945.6216,33.5093},
    {-4875.8066,-2951.1436,33.5689},
    {-4876.1802,-2969.9883,33.9078},
    {-4877.5215,-2965.7229,33.9078},
    {-4844.3091,-2990.9438,34.3537},
    {-4837.6948,-2987.9272,34.2745},
    {-4840.7134,-2960.6990,33.7945},
    {-4930.6602,-3028.8401,34.4117},
    {-4933.4424,-3042.3484,34.5780},
    {-5011.4287,-2980.3694,59.7004},
    {-5013.8081,-2962.3613,60.4006},
    {-5002.9937,-2902.1147,48.4543},
    {-4997.1592,-2900.1604,47.4468},
    {-4957.8511,-2748.7319,18.9554},
    {-4953.9556,-2750.4075,18.9554},
    {-4936.3799,-2725.2043,6.3548},
    {-5060.2202,-2759.8779,28.3469},
    {-5060.5161,-2764.1592,33.4782},
    {-5060.2744,-2764.2283,41.8781},
    {-5072.8491,-2727.8462,13.3054},
    {-5068.5781,-2730.5305,13.8691},
    {-5059.8452,-2704.3799,3.6984},
    {-5051.0249,-2694.5464,3.6984},
    {-5001.3081,-2670.9429,26.1782},
    {-4999.5093,-2671.1841,34.5781},
    {-4513.2822,-2852.0918,20.1661},
    {-4510.0952,-2840.4958,17.7957},
    {-4506.9980,-2835.5808,17.1682},
    {-4592.2085,-2973.8840,37.3516},
    {-4597.9858,-2974.1760,37.8444},
    {-4600.5752,-2967.0759,36.0090},
    {-4602.3340,-2959.1824,34.8755},
    {-4598.3472,-2936.2058,33.2008},
    {-4607.3745,-2935.3784,33.7286},
    {-4607.9043,-2927.0261,32.7219},// END OF COLD
   	{414.7119,-3296.3953,4.7855},
    {407.4610,-3300.5620,5.5920},
    {410.5316,-3313.2559,6.3774},
    {414.6100,-3318.1563,6.5750},
    {391.6071,-3359.4958,11.3152},
    {384.4986,-3359.3015,12.3729},
    {376.9888,-3359.7449,12.2452},
    {409.1035,-3374.6235,10.5094},
    {452.8504,-3425.1726,4.3511},
    {472.0038,-3440.4158,3.9414},
    {447.1546,-3683.5754,19.6440},
    {453.9521,-3676.5195,20.1140},
    {461.9095,-3679.4248,23.9534},
    {455.8982,-3691.0408,23.9105},
    {448.7321,-3696.9783,23.8360},
    {451.3527,-3711.2971,25.9468},
    {455.1996,-3716.6350,27.4099},
    {450.1326,-3717.9929,26.4542},
    {440.5056,-3718.8718,24.4618},
    {436.2605,-3717.9795,25.6463},
    {430.5428,-3722.7346,24.4719},
    {433.8222,-3728.2805,23.9901},
    {424.2554,-3725.6892,23.5785},
    {423.7076,-3728.9595,21.9053},
    {403.9844,-3736.1487,19.7183},
    {287.4912,-3684.6199,45.1853},
    {305.7474,-3666.9343,41.4322},
    {311.3778,-3655.0464,40.6176},
    {295.1956,-3662.5378,42.7106},
    {289.3443,-3655.2734,43.4491},
    {293.3673,-3641.7261,43.0676},
    {295.4311,-3635.6328,42.5237}
};

static const DayZSA_Loots[][lootVars] =
{
	{-2105.1796875,659.5048828125,52.476016998291},
	{-2122.7890625,660.1171875,52.494960784912},
	{-2161.1806640625,660.69140625,52.440773010254},
	{-2156.9794921875,715.134765625,69.5625},
	{-2540.779296875,831.962890625,52.09375},
	{-2543.5556640625,922.765625,67.09375},
	{-2553.427734375,985.7685546875,78.2734375},
	{-2719.1953125,-318.9580078125,7.84375},
	{-2791.75,-160.4765625,10.0546875},
	{-2784.1376953125,-99.5029296875,10.0546875},
	{-2730.771484375,-174.17578125,7.203125},
	{-2677.7392578125,-179.662109375,4.328125},
	{-2689.53125,-141.2802734375,7.203125},
	{-2723.15234375,-113.3740234375,7.203125},
	{-2632.52734375,-108.0048828125,4.328125},
	{-2679.94140625,-155.75,4.328125},
	{-2632.181640625,-191.0283203125,7.203125},
	{-2619.455078125,-153.2880859375,4.3359375},
	{-2590.529296875,-106.01953125,4.3296241760254},
	{-2733.2177734375,-109.572265625,4.328125},
	{-2782.1259765625,-148.6162109375,7.1872329711914},
	{-2791.7412109375,-24.3642578125,10.0546875},
	{2416.958984375,-2454.0576171875,13.640612602234},
	{-2781.07421875,-26.6162109375,7.3766598701477},
	{-2734.8994140625,-53.6279296875,4.3354206085205},
	{-2731.0927734375,-12.6806640625,7.203125},
	{-2725.55078125,-36.1650390625,7.1953125},
	{-2724.6787109375,-57.98828125,4.3425788879395},
	{-2781.7265625,21.095703125,7.1796875},
	{-2734.1474609375,25.7275390625,4.3353595733643},
	{-2790.44921875,7.244140625,7.1953125},
	{-2723.0166015625,21.908203125,7.203125},
	{-2664.251953125,-8.732421875,6.1328125},
	{-2718.8681640625,52.302734375,4.3359375},
	{-2689.376953125,74.5224609375,7.203125},
	{2273.20703125,-2371.5419921875,17.421871185303},
	{-2686.9892578125,115.25,7.1953125},
	{-2677.7412109375,132.431640625,4.335750579834},
	{-2681.5703125,91.333984375,7.203125},
	{-2679.9130859375,68.3857421875,4.328125},
	{2447.8544921875,-2209.4921875,26.6328125},
	{-2631.6923828125,57.8232421875,4.328125},
	{-2631.8662109375,105.4345703125,4.5250973701477},
	{-2620.9384765625,120.8359375,7.203125},
	{-2622.375,71.7958984375,4.3359375},
	{-2619.466796875,57.779296875,4.3359375},
	{-2620.7958984375,103.37890625,7.203125},
	{-2791.6767578125,77.447265625,10.0546875},
	{-2791.6845703125,103.6552734375,10.0546875},
	{-2791.6201171875,130.3515625,7.859375},
	{-2783.59765625,138.4697265625,10.0546875},
	{-2781.361328125,91.9453125,7.1796875},
	{-2783.810546875,189.72265625,10.0546875},
	{-2780.9443359375,210.013671875,7.3766598701477},
	{-2791.7958984375,212.0029296875,10.0546875},
	{-2789.4150390625,183.896484375,10.0625},
	{-2720.626953125,127.52734375,7.0390625},
	{-2689.21484375,96.3095703125,7.203125},
	{-2760.80078125,142.8271484375,7.03125},
	{-2632.37890625,274.76953125,4.3347663879395},
	{-2624.2607421875,250.9365234375,4.5094723701477},
	{-2654.486328125,200.240234375,5.0},
	{-2678.177734375,200.3193359375,7.1953125},
	{-2683.3466796875,192.1875,7.1953125},
	{-2654.3681640625,190.7880859375,4.328125},
	{-2627.869140625,179.1484375,4.3401975631714},
	{-2621.79296875,168.8271484375,7.1953125},
	{2529.234375,-2250.3193359375,3.0},
	{-2649.146484375,376.1025390625,6.1592502593994},
	{-2766.4765625,375.21875,6.3346824645996},
	{-2729.5869140625,351.921875,4.7109375},
	{-2620.99609375,-185.7578125,7.203125},
	{-2558.9501953125,-199.0283203125,10.887868881226},
	{-2515.1201171875,-172.2314453125,25.078411102295},
	{-2541.33203125,-145.84765625,15.688335418701},
	{-2524.0888671875,-79.9541015625,21.780969619751},
	{2138.8505859375,-2292.7666015625,14.780059814453},
	{2122.322265625,-2268.7783203125,20.671875},
	{2229.953125,-2286.5478515625,14.375131607056},
	{-2538.826171875,44.474609375,8.608250617981},
	{2226.75,-2262.5888671875,13.554685592651},
	{-2507.6923828125,51.005859375,25.623983383179},
	{-2588.2236328125,59.15625,4.3359375},
	{-2591.5322265625,170.0634765625,4.6730613708496},
	{-2577.947265625,104.255859375,4.3359375},
	{-2545.4833984375,193.333984375,13.0390625},
	{2021.88671875,-2067.1806640625,17.357158660889},
	{2043.19140625,-2124.6103515625,13.6328125},
	{-2454.6328125,-135.880859375,26.191104888916},
	{1926.3515625,-2127.6796875,13.579386711121},
	{-2432.1279296875,-182.7470703125,35.3125},
	{-2431.5146484375,-109.6416015625,35.3203125},
	{-2430.8583984375,9.8046875,35.318264007568},
	{1990.486328125,-1998.98046875,13.546875},
	{1940.0703125,-2038.7099609375,13.546875},
	{1936.3857421875,-1983.3828125,13.546875},
	{-2545.384765625,118.939453125,22.140625},
	{-2488.7578125,130.7890625,25.8671875},
	{-2463.4296875,131.7529296875,35.171875},
	{2201.9130859375,-1971.7041015625,13.78413105011},
	{-2548.392578125,194.8271484375,6.2325587272644},
	{-2579.7734375,309.8671875,5.1796875},
	{2280.111328125,-2046.1591796875,13.546875},
	{-2571.2275390625,246.6923828125,10.380719184875},
	{-2622.861328125,375.8916015625,6.1592502593994},
	{-2594.951171875,458.486328125,14.609375},
	{2431.83203125,-2137.091796875,13.546875},
	{2527.3076171875,-2129.2861328125,13.546875},
	{-2425.6650390625,338.533203125,36.99991607666},
	{-2228.8994140625,253.7900390625,35.3203125},
	{-2183.375,199.9150390625,35.3203125},
	{-2219.51171875,100.3720703125,35.3203125},
	{1951.85546875,-2187.693359375,13.546875},
	{-2200.306640625,-79.642578125,35.3203125},
	{-2218.875,-180.6923828125,35.365856170654},
	{-2270.1845703125,-156.142578125,35.3203125},
	{1083.7578125,-2033.1240234375,69.0078125},
	{1122.390625,-2043.921875,74.4296875},
	{1121.125,-2007.8056640625,74.4296875},
	{1815.701171875,-1976.759765625,13.546875},
	{1831.8251953125,-1996.826171875,13.546875},
	{1731.6982421875,-2055.0126953125,13.572721481323},
	{1673.8896484375,-2122.5712890625,14.146014213562},
	{1694.28515625,-2082.1337890625,13.546875},
	{1714.8828125,-2125.41015625,14.056648254395},
	{1762.29296875,-2102.0341796875,13.856951713562},
	{1804.908203125,-2141.689453125,13.546875},
	{1846.451171875,-2021.099609375,13.546875},
	{1863.1640625,-2019.9775390625,13.546875},
	{1858.8203125,-2080.7197265625,15.03125},
	{1870.9697265625,-2020.482421875,13.546875},
	{1899.0322265625,-1997.6650390625,13.546875},
	{1920.576171875,-2086.7236328125,13.577843666077},
	{-2177.2421875,10.7216796875,35.3203125},
	{-2027.69140625,-40.7685546875,38.8046875},
	{1846.9462890625,-2116.369140625,15.170427322388},
	{1894.630859375,-2133.23046875,15.466326713562},
	{-2171.7919921875,250.6259765625,35.336006164551},
	{2333.375,-1943.3095703125,14.96875},
	{-2242.1787109375,122.328125,35.3203125},
	{2387.0634765625,-1941.490234375,13.546875},
	{-2265.8994140625,33.01953125,35.3203125},
	{-2287.04296875,-79.845703125,35.3203125},
	{-2313.0947265625,-11.6533203125,35.3203125},
	{2437.9951171875,-2020.248046875,13.902541160583},
	{2515.3583984375,-2027.7763671875,13.546875},
	{2526.203125,-2000.7529296875,13.78261089325},
	{-1968.5322265625,110.001953125,27.6875},
	{-2025.8759765625,-101.044921875,35.1640625},
	{2635.2255859375,-1993.6181640625,13.993547439575},
	{2660.84375,-1984.49609375,13.550971984863},
	{2673.8603515625,-2020.2509765625,14.168166160583},
	{-2080.7451171875,-407.314453125,38.734375},
	{-1993.1416015625,-443.4228515625,38.734375},
	{2786.7822265625,-1922.8232421875,17.3203125},
	{2751.5166015625,-1950.9462890625,13.546875},
	{2736.0234375,-1974.9482421875,13.546034812927},
	{2728.2529296875,-1919.462890625,13.539363861084},
	{-1709.1103515625,406.3779296875,7.4189829826355},
	{-1923.2841796875,433.2978515625,35.254241943359},
	{2333.525390625,-1883.5400390625,15.0},
	{2332.294921875,-1922.615234375,12.300741195679},
	{-2054.3359375,457.095703125,35.300045013428},
	{2296.49609375,-1883.05078125,14.234375},
	{2261.166015625,-1906.74609375,14.9375},
	{-2106.7265625,338.134765625,35.171875},
	{-2214.21875,493.427734375,35.171875},
	{-2093.103515625,513.841796875,35.171875},
	{-1940.0380859375,555.080078125,35.171875},
	{-1807.3115234375,531.25390625,35.539566040039},
	{-1605.6103515625,710.2880859375,13.8671875},
	{1869.5263671875,-1913.0859375,15.256797790527},
	{1850.52734375,-1914.865234375,15.256797790527},
	{1847.662109375,-1870.5869140625,13.578125},
	{1789.375,-1871.720703125,13.564960479736},
	{-1729.24609375,650.0126953125,25.110088348389},
	{-1929.267578125,639.1357421875,46.5625},
	{-1619.111328125,867.921875,7.6953125},
	{-1493.103515625,886.2890625,7.1875},
	{-1447.17578125,919.0634765625,7.1875},
	{-1703.9638671875,785.5986328125,25.736047744751},
	{-1749.3125,873.0576171875,25.0859375},
	{1488.2373046875,-1911.6669921875,24.190805435181},
	{1438.9794921875,-1918.8115234375,24.416709899902},
	{-1786.2587890625,772.7470703125,24.890625},
	{1453.3564453125,-1885.36328125,23.1484375},
	{-1967.392578125,743.8095703125,45.4453125},
	{-2099.3818359375,602.53125,45.096294403076},
	{1489.544921875,-1847.30078125,13.546875},
	{1450.00390625,-1848.8515625,13.96875},
	{1470.18359375,-1770.9287109375,18.795755386353},
	{1493.5146484375,-1772.1767578125,18.795755386353},
	{-2208.333984375,695.2158203125,49.4375},
	{1338.7646484375,-1777.2900390625,13.538893699646},
	{1378.732421875,-1753.1376953125,14.140625},
	{1352.4580078125,-1758.0810546875,13.5078125},
	{1337.400390625,-1819.83203125,13.550866127014},
	{1213.8720703125,-1815.3349609375,16.59375},
	{1212.9775390625,-1811.822265625,16.59375},
	{1209.6083984375,-1751.4228515625,13.593654632568},
	{-2800.16015625,374.880859375,6.3359375},
	{1144.279296875,-1765.66796875,13.612593650818},
	{1170.3505859375,-1862.4501953125,13.772918701172},
	{-2456.1337890625,504.0732421875,30.078125},
	{-2347.4150390625,495.97265625,30.641031265259},
	{1020.33984375,-1901.1484375,12.666422843933},
	{-2280.0615234375,654.4853515625,49.4453125},
	{984.8310546875,-1830.962890625,13.333910942078},
	{-2368.8896484375,711.55078125,35.17308807373},
	{960.322265625,-1823.7724609375,13.328245162964},
	{-2213.8408203125,720.77734375,49.40625},
	{-2168.5458984375,821.1298828125,64.973213195801},
	{791.4951171875,-1753.921875,13.443346977234},
	{768.275390625,-1745.72265625,13.077295303345},
	{718.2763671875,-1783.91015625,13.6328125},
	{572.25,-1765.8583984375,14.398722648621},
	{-2340.1103515625,796.7646484375,41.989013671875},
	{568.712890625,-1762.2470703125,5.8157567977905},
	{-2447.6240234375,821.5927734375,35.1796875},
	{-2541.2744140625,733.4091796875,28.056119918823},
	{-2661.5478515625,722.1953125,27.961761474609},
	{499.326171875,-1870.8916015625,4.6769704818726},
	{-2864.9677734375,681.51953125,23.460912704468},
	{674.787109375,-1867.716796875,5.4609375},
	{-2888.5,794.6943359375,35.03125},
	{-2868.1318359375,836.2431640625,39.5078125},
	{-2840.15234375,884.6396484375,44.0546875},
	{-2844.4931640625,921.5751953125,44.0546875},
	{399.6533203125,-2068.6455078125,10.745077133179},
	{-2866.0341796875,957.32421875,44.0546875},
	{400.513671875,-2065.7412109375,10.748622894287},
	{361.294921875,-2072.01171875,10.6953125},
	{-2907.2626953125,1026.990234375,36.828125},
	{-2900.716796875,1080.826171875,32.1328125},
	{-2905.2587890625,1171.9189453125,13.6640625},
	{314.0048828125,-1771.341796875,4.6501817703247},
	{290.4140625,-1764.025390625,4.546875},
	{171.2255859375,-1769.328125,4.4670028686523},
	{160.7001953125,-1766.35546875,6.796875},
	{-2738.3203125,746.625,49.189296722412},
	{-2738.578125,801.5126953125,53.0625},
	{-2651.9990234375,826.8935546875,49.984375},
	{-2687.60546875,803.1123046875,49.9765625},
	{-2652.7548828125,731.8720703125,27.957878112793},
	{-2656.0595703125,695.287109375,27.935955047607},
	{-2638.3505859375,728.234375,27.965827941895},
	{-2640.048828125,730.693359375,30.075717926025},
	{-2622.501953125,783.1640625,44.859375},
	{1780.7333984375,-1705.94140625,13.5234375},
	{1699.734375,-1665.74609375,20.205995559692},
	{-2620.67578125,855.5283203125,53.568695068359},
	{-2657.369140625,848.6103515625,64.0078125},
	{-2653.2548828125,851.5947265625,64.014892578125},
	{2018.19921875,-1703.623046875,14.234375},
	{-2580.666015625,920.36328125,64.984375},
	{-2542.490234375,943.21875,64.0},
	{-2511.763671875,1020.671875,77.212951660156},
	{-2572.8955078125,1155.013671875,55.734909057617},
	{-2523.896484375,1142.6962890625,55.7265625},
	{-2486.3193359375,1141.9541015625,55.7265625},
	{-2430.7255859375,1140.1650390625,55.7265625},
	{-2385.4306640625,1135.0029296875,55.7265625},
	{-2534.14453125,1150.4560546875,55.606960296631},
	{-2512.5712890625,1046.0087890625,65.512168884277},
	{-2576.6865234375,992.35546875,78.2734375},
	{-2648.087890625,952.1796875,71.959915161133},
	{-2641.10546875,935.6025390625,72.445816040039},
	{-2670.79296875,927.869140625,79.703125},
	{-2719.208984375,917.32421875,67.600875854492},
	{-2711.130859375,968.6748046875,54.4609375},
	{-2737.0263671875,846.4697265625,59.27278137207},
	{-2620.1806640625,833.017578125,52.09375},
	{-2593.2373046875,883.4677734375,63.25},
	{-2413.0849609375,920.875,45.495388031006},
	{-2369.90625,846.65234375,43.7890625},
	{-2370.494140625,770.8046875,35.045497894287},
	{-2309.7568359375,720.7900390625,49.4140625},
	{-1706.255859375,29.8837890625,3.5546875},
	{-2017.7783203125,331.3955078125,35.171875},
	{-2627.091796875,2319.1240234375,8.3104915618896},
	{-2627.53125,2310.21484375,8.3140296936035},
	{-2639.546875,2349.1591796875,8.4840850830078},
	{-2159.2314453125,753.7568359375,69.514846801758},
	{-2118.1787109375,795.80078125,69.568389892578},
	{-2056.2685546875,820.6025390625,60.074989318848},
	{-1947.0849609375,790.0537109375,55.724136352539},
	{-1956.5302734375,766.6357421875,55.725494384766},
	{-1986.2353515625,660.1337890625,46.568286895752},
	{-1917.0634765625,671.431640625,46.5625},
	{-2291.9345703125,2282.28125,4.9792766571045},
	{-1880.5390625,822.62890625,35.177783966064},
	{-1951.2939453125,883.7041015625,38.50732421875},
	{-1953.09765625,824.728515625,42.5234375},
	{-2046.8876953125,896.4609375,53.115028381348},
	{-2099.5439453125,897.380859375,76.7109375},
	{-2116.9609375,927.802734375,86.079063415527},
	{-2159.5185546875,983.771484375,80.0},
	{-2041.9365234375,1020.5859375,54.677085876465},
	{-2017.599609375,984.314453125,47.962516784668},
	{-2126.052734375,832.546875,69.5625},
	{-2223.42578125,795.779296875,49.434646606445},
	{-2285.2978515625,829.1748046875,57.170230865479},
	{-2234.142578125,888.5244140625,66.652717590332},
	{-2294.791015625,969.9736328125,65.334289550781},
	{-2333.3525390625,943.3544921875,53.981349945068},
	{-2448.248046875,972.8310546875,45.296875},
	{1097.2744140625,-1829.2568359375,16.59375},
	{-2351.78125,1226.12109375,33.065242767334},
	{-2383.1181640625,1262.92578125,26.330062866211},
	{-2383.13671875,1337.3291015625,12.704105377197},
	{-2433.76171875,1247.7568359375,33.543380737305},
	{-2477.1708984375,1287.291015625,22.71538734436},
	{-2433.0810546875,1338.123046875,8.5078125},
	{-2598.787109375,2357.36328125,9.8829956054688},
	{-2597.97265625,2364.6982421875,9.8829956054688},
	{-2624.841796875,1412.529296875,7.09375},
	{-2582.083984375,2300.3154296875,7.0028858184814},
	{-2582.58984375,2306.712890625,7.0028858184814},
	{945.75,-1742.5810546875,13.554628372192},
	{-2662.4541015625,1423.625,23.8984375},
	{-2473.466796875,2404.85546875,16.666370391846},
	{-2467.2998046875,2409.001953125,16.666431427002},
	{-2660.6474609375,1423.822265625,23.8984375},
	{-2558.138671875,2261.3583984375,5.0616064071655},
	{-2518.8916015625,2236.94140625,5.1875},
	{-2510.9248046875,1053.482421875,65.184410095215},
	{-2564.291015625,992.2587890625,78.2734375},
	{-2503.2177734375,2366.169921875,4.9801826477051},
	{-2655.0634765625,985.83203125,64.991287231445},
	{952.8359375,-1750.529296875,16.09974861145},
	{-2707.033203125,864.4609375,70.703125},
	{-2708.3837890625,852.9736328125,70.703125},
	{-2737.572265625,866.14453125,64.6328125},
	{1083.5673828125,-1697.2802734375,13.546875},
	{-2706.9921875,722.8583984375,37.5390625},
	{793.9755859375,-1700.279296875,14.033567428589},
	{-2428.388671875,2368.30078125,5.4436712265015},
	{794.951171875,-1687.7119140625,14.463310241699},
	{-2372.560546875,614.0341796875,30.939836502075},
	{782.015625,-1661.9453125,13.43461894989},
	{-2325.4052734375,579.8740234375,30.298212051392},
	{-2386.3583984375,2398.0888671875,8.8520927429199},
	{768.0849609375,-1702.7763671875,5.1507549285889},
	{-2217.0009765625,577.939453125,35.171875},
	{-2379.6025390625,2443.66796875,10.169355392456},
	{-2386.43359375,2446.5810546875,10.169355392456},
	{-2188.6455078125,602.9736328125,35.1640625},
	{-2193.0634765625,647.4208984375,49.4375},
	{-2472.556640625,2450.2431640625,17.323022842407},
	{-2478.9404296875,2449.1982421875,17.323022842407},
	{-2479.0146484375,2488.603515625,18.229986190796},
	{-2128.3837890625,619.0263671875,51.888767242432},
	{693.546875,-1698.849609375,3.8148174285889},
	{-2446.072265625,2513.0029296875,15.700329780579},
	{694.7978515625,-1686.05859375,4.3461227416992},
	{-2093.90234375,746.4248046875,69.5625},
	{-2066.4052734375,755.412109375,71.890625},
	{-2048.7001953125,755.439453125,64.15625},
	{653.0830078125,-1719.681640625,14.760129928589},
	{-2047.9453125,786.7783203125,64.15625},
	{-2066.3515625,786.7685546875,71.890625},
	{850.7080078125,-1688.8798828125,14.9397315979},
	{851.0283203125,-1718.9765625,14.945223808289},
	{-2018.3974609375,784.58203125,45.4453125},
	{-2188.8427734375,2412.421875,5.15625},
	{-2016.20703125,897.4267578125,45.4453125},
	{890.72265625,-1637.328125,14.9296875},
	{862.80078125,-1637.8037109375,14.942176818848},
	{-1851.595703125,988.52734375,35.373413085938},
	{936.6318359375,-1613.9462890625,14.951719284058},
	{961.986328125,-1612.642578125,14.942341804504},
	{-1874.517578125,1002.9794921875,37.778400421143},
	{986.544921875,-1623.6884765625,14.9296875},
	{-1589.71875,2706.115234375,56.176181793213},
	{-1988.4599609375,1038.865234375,55.7265625},
	{-1603.8671875,2689.3701171875,55.285556793213},
	{982.1689453125,-1702.234375,14.964391708374},
	{-1550.9228515625,2699.6728515625,56.269931793213},
	{-2113.25390625,1042.162109375,71.52188873291},
	{-1569.30078125,2629.9853515625,55.840278625488},
	{954.8623046875,-1586.669921875,13.546875},
	{982.9990234375,-1613.4287109375,13.517053604126},
	{-2140.29296875,1190.37890625,55.7265625},
	{-1670.7763671875,2545.4189453125,85.322410583496},
	{-2065.986328125,1159.828125,46.6484375},
	{-1667.3193359375,2486.291015625,87.172271728516},
	{-2036.5498046875,1197.66015625,46.234375},
	{-1939.35546875,1227.6513671875,31.647394180298},
	{-2061.77734375,1232.759765625,31.436279296875},
	{-1482.40625,2702.3271484375,56.254306793213},
	{-1466.345703125,2692.7568359375,56.269931793213},
	{-1450.88671875,2690.876953125,56.176181793213},
	{-2152.6787109375,1248.7138671875,25.723867416382},
	{-2280.8388671875,1149.1005859375,61.609375},
	{-2238.50390625,1135.62890625,67.244506835938},
	{-2282.4140625,1070.03515625,81.70255279541},
	{-2239.7451171875,1037.275390625,83.849937438965},
	{-2238.796875,962.17578125,66.652183532715},
	{1182.35546875,-1635.0908203125,13.953125},
	{1165.14453125,-1648.408203125,14.0},
	{1208.0810546875,-1644.49609375,13.551703453064},
	{1230.158203125,-1610.78125,13.546875},
	{1286.142578125,-1583.453125,13.546875},
	{-2282.498046875,916.9443359375,66.6484375},
	{1258.1455078125,-1583.8603515625,13.546875},
	{1241.8994140625,-1582.005859375,13.487106323242},
	{-2210.7080078125,934.3779296875,69.044372558594},
	{1216.8056640625,-1582.8935546875,13.546875},
	{1184.6748046875,-1583.1826171875,13.553085327148},
	{-2174.1484375,902.669921875,80.0078125},
	{-2126.4375,1050.2275390625,80.0078125},
	{-2190.4404296875,1080.2470703125,80.0078125},
	{-2197.0576171875,1065.8515625,55.851322174072},
	{-1989.88671875,1118.2568359375,54.46875},
	{-1992.2333984375,1109.5595703125,53.215702056885},
	{1286.8515625,-1625.6796875,13.546875},
	{-1848.119140625,1082.5380859375,46.082084655762},
	{1213.7568359375,-1638.6787109375,11.796875},
	{-1836.1298828125,1054.5283203125,46.078125},
	{1215.1533203125,-1676.26953125,11.796875},
	{1215.4697265625,-1671.5966796875,11.796875},
	{1265.119140625,-1676.375,13.546875},
	{-1780.2353515625,1025.720703125,25.313758850098},
	{-1806.322265625,979.560546875,24.890625},
	{-1715.82421875,1017.95703125,17.917835235596},
	{-1707.888671875,1018.419921875,17.917835235596},
	{-1758.0185546875,963.916015625,24.897708892822},
	{-1750.4970703125,964.119140625,24.890625},
	{-1749.173828125,900.390625,25.0859375},
	{-1810.5966796875,902.7138671875,24.996131896973},
	{-1319.9130859375,2704.384765625,50.26628112793},
	{-1697.5947265625,885.3671875,25.085273742676},
	{-1694.443359375,951.7783203125,24.890625},
	{-1701.66015625,1083.7275390625,45.364379882812},
	{-1445.013671875,2652.4765625,56.269931793213},
	{-1685.2197265625,1042.7490234375,54.703125},
	{-1692.5009765625,1041.966796875,56.90625},
	{-1459.5888671875,2653.4716796875,55.8359375},
	{-1445.625,2636.2998046875,56.254306793213},
	{-1429.990234375,2583.6455078125,56.887584686279},
	{-1728.296875,1138.4921875,38.603340148926},
	{-1658.23046875,1208.2958984375,7.25},
	{-1657.8486328125,1206.876953125,13.671875},
	{-1683.8203125,1209.6943359375,21.15625},
	{-1651.9228515625,1203.73046875,13.671875},
	{-1549.92578125,1169.955078125,7.1875},
	{-1518.9580078125,1143.3271484375,7.1875},
	{-1519.568359375,2609.55859375,55.8359375},
	{-1466.28125,2610.453125,55.8359375},
	{-1681.125,1350.302734375,7.1721897125244},
	{-1677.6015625,1353.677734375,9.8046875},
	{-1663.9833984375,1406.296875,7.1796875},
	{-1629.1533203125,1388.310546875,7.1875},
	{-1670.7919921875,1339.8427734375,7.1875},
	{-1653.3564453125,1354.69921875,7.1859359741211},
	{-1513.2900390625,2645.880859375,56.176181793213},
	{-1783.3994140625,1537.8251953125,7.1875},
	{-1891.443359375,1447.9384765625,7.1848773956299},
	{-1956.7509765625,1345.25390625,7.1875},
	{-1929.7412109375,1374.978515625,7.1875},
	{-2043.798828125,1261.5126953125,9.1895523071289},
	{-1294.099609375,2524.6044921875,87.476791381836},
	{-1292.0693359375,2514.833984375,87.092361450195},
	{-1321.5791015625,2506.8232421875,89.5703125},
	{-1883.720703125,1299.7607421875,7.1796875},
	{-1844.009765625,1332.70703125,7.1796875},
	{-1798.103515625,1341.697265625,7.1796875},
	{-1756.755859375,1320.3828125,7.1875},
	{-1305.3330078125,2547.935546875,90.328125},
	{-1739.32421875,1304.216796875,7.1875},
	{-1711.357421875,1231.705078125,17.923469543457},
	{-1901.9736328125,1239.8623046875,26.131290435791},
	{-1643.0888671875,1172.935546875,7.1875},
	{-1774.6650390625,1113.638671875,45.4453125},
	{-1799.974609375,1206.595703125,25.125},
	{-1852.4931640625,1162.2333984375,40.940418243408},
	{-1901.9619140625,1222.646484375,33.744285583496},
	{-1929.982421875,1190.52734375,45.4453125},
	{-1997.3837890625,1190.546875,45.4453125},
	{-2189.0498046875,1163.9794921875,55.7265625},
	{-2238.091796875,1190.7646484375,55.725227355957},
	{-2238.314453125,1154.1728515625,59.692321777344},
	{-2297.9453125,1096.3759765625,79.853385925293},
	{-2281.9619140625,979.47265625,70.926986694336},
	{-2238.888671875,944.02734375,66.652183532715},
	{-2168.71875,743.857421875,64.96125793457},
	{-2128.3828125,690.29296875,65.523544311523},
	{-2279.830078125,587.888671875,37.236404418945},
	{-2339.8828125,679.787109375,38.392864227295},
	{-2158.6142578125,888.83203125,80.0078125},
	{-2129.673828125,943.015625,80.0},
	{-2124.7880859375,1104.759765625,79.541061401367},
	{-2054.5107421875,1194.177734375,45.457427978516},
	{-1828.90234375,1338.880859375,7.1796875},
	{-1693.0576171875,1249.966796875,7.189022064209},
	{2744.8359375,-2014.96875,13.5546875},
	{2801.4306640625,-1947.8447265625,17.3203125},
	{2763.845703125,-1823.1318359375,11.846822738647},
	{2804.529296875,-1774.9765625,11.84375},
	{2795.94140625,-1723.66796875,11.84375},
	{2674.6962890625,-1787.2060546875,11.84375},
	{2813.078125,-1644.232421875,10.883123397827},
	{2811.95703125,-1637.833984375,10.94800567627},
	{2821.515625,-1603.890625,11.084532737732},
	{2852.095703125,-1523.9375,11.153960227966},
	{2795.5498046875,-1539.826171875,10.921875},
	{2757.943359375,-1515.923828125,28.598701477051},
	{2683.8037109375,-1540.4609375,26.087358474731},
	{2668.0068359375,-1457.427734375,30.540340423584},
	{2764.3232421875,-1476.1640625,30.453125},
	{2751.1396484375,-1421.7392578125,32.046253204346},
	{2753.732421875,-1419.1005859375,39.3664894104},
	{2754.2275390625,-1384.1318359375,39.372711181641},
	{2773.6650390625,-1402.2998046875,24.7421875},
	{2710.2939453125,-1421.623046875,16.25},
	{2862.7451171875,-1441.4228515625,10.942241668701},
	{2792.15625,-1465.6298828125,40.0625},
	{2818.7421875,-1466.765625,32.125},
	{2794.216796875,-1427.798828125,20.21875},
	{2613.7705078125,-1394.43359375,34.931190490723},
	{2592.8203125,-1324.166015625,39.12483215332},
	{2590.294921875,-1321.5458984375,39.894317626953},
	{2752.2744140625,-1324.013671875,50.0},
	{2755.447265625,-1301.8134765625,53.09375},
	{2812.46875,-1287.7197265625,42.216262817383},
	{2780.1640625,-1289.623046875,42.632743835449},
	{2783.5634765625,-1333.5498046875,32.258140563965},
	{2812.142578125,-1332.0810546875,32.207908630371},
	{2778.802734375,-1365.7109375,24.604793548584},
	{2807.5556640625,-1369.9189453125,23.417491912842},
	{2853.2119140625,-1366.115234375,14.1640625},
	{2842.33984375,-1336.2236328125,14.742118835449},
	{2847.8857421875,-1309.1572265625,14.790662765503},
	{2809.2177734375,-1189.091796875,25.317050933838},
	{2807.9443359375,-1177.3212890625,25.378120422363},
	{2820.58203125,-1160.361328125,25.341686248779},
	{2793.703125,-1082.28125,30.71875},
	{2666.2001953125,-1107.6357421875,69.400970458984},
	{2629.4951171875,-1068.3662109375,69.617057800293},
	{2612.2919921875,-1081.6611328125,69.597839355469},
	{2610.4111328125,-1096.9375,69.514892578125},
	{2626.513671875,-1098.6513671875,69.367218017578},
	{2621.3955078125,-1119.2119140625,67.545845031738},
	{2614.283203125,-1202.2919921875,60.0},
	{2608.5859375,-1207.875,59.0703125},
	{2608.1591796875,-1216.6357421875,56.762214660645},
	{2614.6767578125,-1239.6708984375,49.786777496338},
	{2698.8125,-1202.8974609375,67.981636047363},
	{2692.04296875,-1224.041015625,61.467155456543},
	{2672.2861328125,-1237.6181640625,55.769592285156},
	{2661.802734375,-1216.6318359375,62.057613372803},
	{2588.4580078125,-975.6484375,81.391235351562},
	{2582.697265625,-953.837890625,81.387008666992},
	{2529.14453125,-963.65234375,82.363723754883},
	{2499.455078125,-948.7939453125,82.267784118652},
	{2472.3134765625,-964.630859375,80.138618469238},
	{2454.17578125,-964.7099609375,80.073120117188},
	{2579.7705078125,-1033.521484375,69.580101013184},
	{2561.263671875,-1034.2744140625,69.575614929199},
	{2527.078125,-1060.8125,69.567825317383},
	{2513.33984375,-1027.87890625,70.0859375},
	{2505.1318359375,-1020.552734375,70.0859375},
	{2478.220703125,-1062.4609375,66.8359375},
	{2468.0244140625,-1011.853515625,59.7734375},
	{2433.9296875,-1012.8134765625,54.34375},
	{2389.9501953125,-1037.375,53.564434051514},
	{2370.0009765625,-1035.58984375,54.410556793213},
	{2335.3798828125,-1045.0556640625,52.358196258545},
	{2298.2197265625,-1054.1796875,49.933994293213},
	{2256.8583984375,-1069.4482421875,49.4765625},
	{2258.994140625,-1029.8837890625,52.679298400879},
	{2267.07421875,-1031.421875,59.294151306152},
	{2219.318359375,-1046.7607421875,57.662059783936},
	{2249.68359375,-1059.6806640625,55.96875},
	{2206.556640625,-988.3662109375,63.9296875},
	{2188.3203125,-998.0244140625,62.840515136719},
	{2185.7216796875,-997.8642578125,66.46875},
	{2176.5703125,-982.5595703125,64.46875},
	{2142.8916015625,-978.728515625,61.379306793213},
	{2121.9423828125,-971.0498046875,58.207431793213},
	{2109.0263671875,-1000.4287109375,60.5078125},
	{2066.3505859375,-991.0703125,48.799369812012},
	{2056.2587890625,-967.2822265625,46.027828216553},
	{2040.896484375,-1014.2470703125,39.7421875},
	{2571.443359375,-1091.830078125,67.225723266602},
	{2519.7060546875,-1114.5751953125,56.207511901855},
	{2453.134765625,-1107.65234375,43.388641357422},
	{2438.5380859375,-1104.8828125,42.751155853271},
	{2374.568359375,-1138.94921875,29.058792114258},
	{2396.5009765625,-1133.5830078125,30.71875},
	{2510.5693359375,-1129.529296875,41.127861022949},
	{2285.7451171875,-1102.5478515625,37.9765625},
	{2249.259765625,-1103.6142578125,41.6015625},
	{2187.4267578125,-1082.453125,43.842967987061},
	{2219.8798828125,-1082.4580078125,41.630508422852},
	{2202.345703125,-1056.236328125,47.107879638672},
	{2157.119140625,-1070.9384765625,39.950454711914},
	{2138.20703125,-1072.9228515625,27.270616531372},
	{2116.7734375,-1049.60546875,26.367670059204},
	{2054.30859375,-1067.548828125,25.783622741699},
	{2039.37109375,-1061.7158203125,25.650810241699},
	{1892.412109375,-1068.2373046875,23.9375},
	{1916.2900390625,-1072.822265625,24.253681182861},
	{1938.0576171875,-1068.0625,24.418003082275},
	{1958.0791015625,-1076.9267578125,24.796701431274},
	{1958.7119140625,-1116.0625,27.830497741699},
	{1945.291015625,-1116.25,27.447629928589},
	{1925.37890625,-1114.482421875,27.088310241699},
	{1888.9873046875,-1112.984375,26.275810241699},
	{1998.02734375,-1114.7236328125,26.773735046387},
	{2004.1845703125,-1115.0048828125,27.125},
	{2029.408203125,-1121.5654296875,26.416379928589},
	{2045.119140625,-1111.8828125,26.361747741699},
	{2094.2353515625,-1125.69921875,27.689872741699},
	{2090.580078125,-1163.9970703125,26.588254928589},
	{2090.44921875,-1233.9052734375,25.477380752563},
	{2107.2646484375,-1250.5537109375,25.48588180542},
	{2133.24609375,-1232.818359375,24.421875},
	{2151.2109375,-1285.6005859375,24.19647026062},
	{2094.416015625,-1275.6552734375,25.497339248657},
	{2096.490234375,-1277.3701171875,25.49262046814},
	{2100.8515625,-1321.87109375,25.953125},
	{2122.5712890625,-1321.7568359375,26.626171112061},
	{2113.5283203125,-1358.5498046875,23.984375},
	{2130.3740234375,-1362.748046875,25.546340942383},
	{2146.8779296875,-1366.91015625,25.64178276062},
	{2187.9775390625,-1364.3330078125,25.82928276062},
	{2206.30078125,-1364.052734375,25.672866821289},
	{2253.5390625,-1364.14453125,24.53125},
	{2232.71484375,-1280.1455078125,25.3671875},
	{2191.7138671875,-1275.6845703125,25.15625},
	{2191.189453125,-1238.0439453125,23.9765625},
	{2229.7109375,-1241.53125,25.65625},
	{2250.3671875,-1238.8798828125,25.8984375},
	{2232.4921875,-1177.318359375,29.804386138916},
	{2352.0947265625,-1180.208984375,27.975339889526},
	{2337.216796875,-1234.009765625,27.9765625},
	{2349.7744140625,-1281.587890625,27.9765625},
	{2383.3935546875,-1367.8515625,24.491352081299},
	{2402.79296875,-1329.9208984375,25.403764724731},
	{2388.138671875,-1279.7783203125,25.129104614258},
	{2420.884765625,-1220.4638671875,25.485147476196},
	{2435.2666015625,-1289.1884765625,25.347854614258},
	{2435.7802734375,-1321.3994140625,24.779174804688},
	{2467.21484375,-1412.640625,23.75},
	{2466.9775390625,-1425.2802734375,23.75},
	{2464.0390625,-1317.8935546875,27.390625},
	{2480.41015625,-1329.8525390625,28.292972564697},
	{2469.0625,-1277.4130859375,30.366352081299},
	{2502.1044921875,-1324.89453125,33.429763793945},
	{2496.0166015625,-1390.96875,28.839567184448},
	{2475.9150390625,-1400.0908203125,28.834657669067},
	{2495.916015625,-1431.7099609375,29.016227722168},
	{2492.173828125,-1240.556640625,37.361846923828},
	{2515.2861328125,-1242.2958984375,39.022338867188},
	{2529.9462890625,-1244.068359375,43.65625},
	{2550.12890625,-1234.271484375,49.001361846924},
	{2557.572265625,-1210.79296875,54.53125},
	{2528.0341796875,-1209.48828125,50.28125},
	{2537.396484375,-1362.9814453125,30.457332611084},
	{2015.623046875,-1289.8779296875,23.984375},
	{2002.3154296875,-1309.7451171875,25.222122192383},
	{2158.673828125,-1489.306640625,26.654174804688},
	{2148.6591796875,-1485.41015625,26.623416900635},
	{2149.6455078125,-1432.9677734375,26.018363952637},
	{2150.353515625,-1419.4072265625,25.921875},
	{2151.1083984375,-1400.7060546875,26.128503799438},
	{2188.5517578125,-1417.90234375,26.15625},
	{2191.66015625,-1455.3330078125,25.740631103516},
	{2190.3427734375,-1488.7939453125,25.77459526062},
	{2232.7568359375,-1469.3779296875,24.581628799438},
	{2248.591796875,-1469.337890625,24.149597167969},
	{-1371.396484375,2053.23046875,52.515625},
	{-1426.8818359375,2171.048828125,50.625},
	{2245.6708984375,-1396.880859375,24.0},
	{-1503.2607421875,1978.3623046875,48.421875},
	{2352.00390625,-1412.2373046875,23.992404937744},
	{-1500.2109375,1960.158203125,49.0234375},
	{2414.0576171875,-1424.5029296875,23.982444763184},
	{2508.5029296875,-1493.6025390625,23.998546600342},
	{1797.8603515625,-1578.8251953125,14.090040206909},
	{-2471.451171875,1537.7080078125,33.234375},
	{-2477.275390625,1550.2998046875,33.234375},
	{1787.0849609375,-1638.8837890625,14.469971656799},
	{1772.720703125,-1658.798828125,14.42511177063},
	{1739.966796875,-1562.626953125,14.162391662598},
	{1771.6943359375,-1548.0390625,9.9088573455811},
	{1910.2412109375,-1911.9130859375,15.256797790527},
	{1937.435546875,-1907.333984375,15.256797790527},
	{-1049.486328125,1550.572265625,33.437610626221},
	{-782.046875,1557.677734375,27.1171875},
	{-797.072265625,1557.283203125,27.124444961548},
	{-734.2724609375,1547.3525390625,38.979309082031},
	{-732.8095703125,1539.7578125,40.473579406738},
	{-731.419921875,1535.5341796875,40.236835479736},
	{-771.595703125,1447.5087890625,13.9453125},
	{-811.673828125,1420.900390625,13.9453125},
	{-810.2216796875,1469.8037109375,19.22875213623},
	{-828.146484375,1463.216796875,14.657393455505},
	{-792.99609375,1627.375,27.15625},
	{-636.259765625,1445.943359375,13.996495246887},
	{-692.5068359375,960.24609375,12.220783233643},
	{-671.8203125,960.7392578125,12.1328125},
	{-671.74609375,970.9345703125,12.1328125},
	{-690.490234375,970.71484375,12.201937675476},
	{-690.787109375,939.44921875,13.6328125},
	{-685.3828125,941.7919921875,13.6328125},
	{-683.9716796875,932.15234375,13.6328125},
	{2139.546875,-1733.9208984375,17.2890625},
	{2155.958984375,-1733.3662109375,17.281345367432},
	{-825.3759765625,1823.8203125,7.0000076293945},
	{-608.0703125,1831.8974609375,7.0},
	{2147.3056640625,-1819.6796875,16.140625},
	{2149.7861328125,-1803.84375,16.153861999512},
	{2247.59375,-1795.16015625,13.546875},
	{2275.5673828125,-1788.400390625,13.546875},
	{-782.9736328125,2147.8447265625,60.3828125},
	{2345.359375,-1786.2158203125,13.546875},
	{-651.427734375,2153.4443359375,60.3828125},
	{2379.650390625,-1784.9951171875,13.546875},
	{-793.5537109375,2264.93359375,59.100883483887},
	{2466.4453125,-1753.0693359375,13.546875},
	{-663.0322265625,2306.0810546875,136.09428405762},
	{-662.6083984375,2313.619140625,138.81950378418},
	{2500.8662109375,-1759.8662109375,13.546875},
	{-774.6181640625,2424.9140625,157.10360717773},
	{2538.751953125,-1719.2490234375,13.526076316833},
	{-808.076171875,2430.5830078125,156.99356079102},
	{2522.9404296875,-1682.7685546875,15.496999740601},
	{-911.59375,2672.43359375,42.370262145996},
	{-902.7744140625,2695.4619140625,42.370262145996},
	{2524.705078125,-1656.3564453125,15.493547439575},
	{-853.1787109375,2760.3349609375,46.0},
	{2514.1962890625,-1650.8193359375,14.355666160583},
	{-766.888671875,2765.2216796875,48.255599975586},
	{-782.57421875,2748.8935546875,45.659553527832},
	{-672.880859375,2706.0185546875,70.663284301758},
	{2487.62890625,-1697.6142578125,14.765625},
	{2491.6435546875,-1693.2373046875,14.765625},
	{2531.4970703125,-1665.455078125,15.16725730896},
	{2468.0302734375,-1646.470703125,13.780097007751},
	{2451.390625,-1641.7041015625,13.735734939575},
	{2412.51953125,-1647.005859375,14.011916160583},
	{2384.474609375,-1675.0712890625,14.712868690491},
	{2361.5029296875,-1644.130859375,13.523147583008},
	{-429.1455078125,2240.5068359375,42.983383178711},
	{2327.875,-1682.1748046875,14.917343139648},
	{2386.7802734375,-1711.8505859375,14.2421875},
	{2307.36328125,-1714.5009765625,14.64959526062},
	{-325.0166015625,1852.556640625,42.5078125},
	{2228.5361328125,-1721.3740234375,13.561138153076},
	{2246.7861328125,-1638.5419921875,15.90740776062},
	{2282.8603515625,-1642.0654296875,15.627917289734},
	{2305.06640625,-1678.7060546875,14.00115776062},
	{2383.8291015625,-1547.9697265625,24.156600952148},
	{-310.302734375,1303.041015625,53.664344787598},
	{2420.89453125,-1508.4912109375,24.0},
	{2459.216796875,-1491.982421875,24.0},
	{2451.615234375,-1492.8115234375,24.0},
	{-323.1240234375,2676.1044921875,63.6796875},
	{-227.2724609375,2711.2919921875,62.9765625},
	{-155.6328125,2759.0146484375,62.635894775391},
	{-160.4794921875,2727.9775390625,62.177940368652},
	{-169.2509765625,2707.455078125,62.540195465088},
	{-254.1103515625,2604.5302734375,62.858154296875},
	{-258.181640625,2781.6416015625,62.6875},
	{-36.5,2349.927734375,24.302555084229},
	{81.0498046875,2451.48828125,16.484375},
	{263.4287109375,2895.767578125,10.531394958496},
	{382.361328125,2607.267578125,16.484375},
	{2179.9990234375,-1661.2490234375,14.909368515015},
	{2127.7861328125,-1687.8515625,15.0859375},
	{153.814453125,-1958.794921875,3.7734375},
	{2066.8984375,-1657.2578125,14.096161842346},
	{2067.7373046875,-1642.2138671875,13.805846214294},
	{2068.134765625,-1628.8974609375,13.87615776062},
	{2068.2138671875,-1588.6298828125,13.490336418152},
	{2079.0244140625,-1554.759765625,13.402491569519},
	{2064.576171875,-1558.9169921875,13.439072608948},
	{415.11328125,2531.3271484375,19.168476104736},
	{428.2197265625,2545.3662109375,16.249221801758},
	{424.1630859375,2536.3037109375,16.1484375},
	{2017.533203125,-1630.0791015625,13.712096214294},
	{2016.3212890625,-1643.41796875,13.78240776062},
	{2018.220703125,-1704.8896484375,14.234375},
	{2015.3154296875,-1734.177734375,14.234375},
	{1977.828125,-1714.75390625,17.037658691406},
	{1973.5517578125,-1705.60546875,15.96875},
	{1975.056640625,-1678.78125,17.071880340576},
	{1973.3056640625,-1654.69140625,15.96875},
	{1974.6650390625,-1635.400390625,15.96875},
	{1974.9912109375,-1633.9052734375,18.568988800049},
	{1965.04296875,-1592.8447265625,13.572462081909},
	{394.4560546875,2680.8642578125,59.156536102295},
	{1973.955078125,-1561.2412109375,13.637348175049},
	{91.025390625,2707.1669921875,53.903339385986},
	{537.755859375,2364.4638671875,30.674282073975},
	{546.197265625,2277.400390625,34.860118865967},
	{-126.1220703125,2255.048828125,28.151527404785},
	{202.328125,1873.291015625,13.140625},
	{-85.0,1516.830078125,15.561989784241},
	{20.6728515625,1344.7451171875,9.171875},
	{7.41015625,1382.4853515625,9.1781387329102},
	{-21.0107421875,1389.525390625,9.171875},
	{1863.1865234375,-1597.7900390625,14.306245803833},
	{1866.560546875,-1598.0615234375,14.26363658905},
	{1752.416015625,-1473.1533203125,13.509583473206},
	{1739.8955078125,-1460.642578125,13.504856109619},
	{4.1708984375,1346.287109375,9.171875},
	{1594.4052734375,-1560.1611328125,14.165175437927},
	{1576.7822265625,-1470.3623046875,14.23811340332},
	{541.8642578125,1556.9052734375,1.0},
	{613.3564453125,1548.4521484375,4.7992935180664},
	{708.8984375,1600.005859375,4.0251665115356},
	{666.9912109375,1701.642578125,7.1948890686035},
	{693.7490234375,1966.4921875,5.5390625},
	{700.498046875,1992.796875,5.53125},
	{710.4248046875,1983.1796875,3.468513250351},
	{709.40625,1208.09765625,13.848057746887},
	{710.3564453125,1192.966796875,13.396438598633},
	{501.6162109375,1116.044921875,15.035557746887},
	{397.8681640625,1159.357421875,8.3480567932129},
	{110.7041015625,1105.08203125,13.609375},
	{23.259765625,969.015625,19.800422668457},
	{-2.3349609375,953.7919921875,19.638710021973},
	{-54.3759765625,894.7314453125,22.387119293213},
	{-124.6806640625,918.572265625,19.909372329712},
	{17.3505859375,910.84375,23.849599838257},
	{32.33984375,921.3662109375,23.600179672241},
	{69.9091796875,973.13671875,15.86469078064},
	{-93.052734375,971.3857421875,19.942081451416},
	{-220.8310546875,988.787109375,19.638097763062},
	{-180.0888671875,1087.79296875,19.7421875},
	{-206.7109375,1087.46875,19.7421875},
	{-186.92578125,1210.0517578125,19.687629699707},
	{-143.953125,1224.33984375,19.899219512939},
	{-66.1025390625,1210.26171875,22.436527252197},
	{-28.69921875,1215.2255859375,22.464834213257},
	{14.1279296875,1181.6396484375,19.430858612061},
	{-19.083984375,1176.1220703125,19.563381195068},
	{-93.0234375,1159.0849609375,19.7421875},
	{-107.236328125,1138.9287109375,19.7421875},
	{-101.1640625,1109.240234375,19.7421875},
	{8.625,1069.8984375,20.939865112305},
	{-30.1484375,1045.8837890625,20.939867019653},
	{-251.4169921875,1050.0458984375,20.939863204956},
	{-304.2783203125,1120.6806640625,19.7421875},
	{-328.810546875,1119.837890625,20.939863204956},
	{-362.8330078125,1110.7998046875,20.939865112305},
	{-360.1904296875,1139.310546875,20.939867019653},
	{-369.44140625,1168.9306640625,20.27187538147},
	{-362.171875,1191.5791015625,19.7421875},
	{-220.6748046875,1173.96875,19.7421875},
	{-207.5810546875,1118.9912109375,20.4296875},
	{-319.3681640625,818.01171875,14.421697616577},
	{-453.0341796875,616.1943359375,16.815383911133},
	{322.958984375,854.0498046875,20.40625},
	{585.5908203125,875.73046875,-42.497318267822},
	{713.50390625,908.9951171875,-18.846324920654},
	{771.978515625,1883.607421875,4.9840874671936},
	{754.4326171875,1972.8193359375,5.69961977005},
	{792.923828125,1991.4208984375,5.79336977005},
	{765.0244140625,2006.4072265625,6.06680727005},
	{2680.8095703125,868.7412109375,10.939546585083},
	{2678.880859375,826.673828125,10.954463005066},
	{2660.4013671875,748.0615234375,14.739588737488},
	{2654.783203125,717.2900390625,14.739588737488},
	{2576.2353515625,714.0361328125,14.739588737488},
	{2534.853515625,747.3837890625,10.8203125},
	{2463.8046875,735.083984375,11.4609375},
	{2465.0029296875,658.095703125,11.359375},
	{2398.5517578125,672.3798828125,11.359375},
	{2370.3544921875,676.943359375,11.460479736328},
	{2328.849609375,663.1591796875,11.453125},
	{2308.1220703125,676.271484375,11.3836145401},
	{2350.1416015625,734.55078125,11.468292236328},
	{2369.521484375,749.2099609375,11.4609375},
	{2386.4169921875,741.9736328125,11.359375},
	{2260.9580078125,733.603515625,11.4609375},
	{2226.6640625,748.1552734375,11.4609375},
	{2200.6630859375,751.095703125,11.183270454407},
	{2178.9306640625,758.9052734375,11.4609375},
	{2181.12109375,695.744140625,11.27140045166},
	{2227.818359375,654.0703125,11.4609375},
	{2320.6142578125,654.0341796875,11.453125},
	{2247.3857421875,584.5341796875,7.78125},
	{2179.01953125,654.4892578125,11.4609375},
	{2131.1708984375,650.080078125,11.4609375},
	{2106.2626953125,698.9853515625,11.366704940796},
	{2086.5830078125,715.8388671875,11.789765357971},
	{2047.3916015625,772.5830078125,11.453125},
	{2128.9189453125,789.8076171875,11.34375},
	{2010.998046875,707.5966796875,11.4609375},
	{2013.3037109375,652.1025390625,11.4609375},
	{2043.3115234375,638.1796875,11.4609375},
	{1955.9228515625,737.7890625,14.281055450439},
	{1898.140625,736.6279296875,14.2734375},
	{1899.2177734375,679.806640625,14.2734375},
	{1924.142578125,665.4296875,10.8203125},
	{1936.244140625,663.978515625,10.8203125},
	{1951.5908203125,671.6162109375,10.8203125},
	{1846.5576171875,691.26171875,11.453125},
	{1844.888671875,654.7294921875,11.4609375},
	{1453.822265625,749.66796875,11.0234375},
	{1532.0380859375,752.9267578125,11.0234375},
	{1544.1845703125,676.5625,11.328125},
	{1093.51953125,996.80078125,11.0},
	{1020.4912109375,1056.2265625,11.0},
	{1163.0771484375,1342.119140625,10.812517166138},
	{1165.5888671875,1348.1884765625,10.921875},
	{1174.2158203125,1349.439453125,10.921875},
	{1123.162109375,1463.23046875,5.8203125},
	{1090.80078125,1456.6982421875,5.8203125},
	{1070.638671875,1594.9052734375,5.8203125},
	{1105.337890625,1601.8115234375,5.8203125},
	{1110.5263671875,1598.626953125,12.546875},
	{1087.4208984375,1597.8759765625,12.546875},
	{963.994140625,1792.7421875,8.8515625},
	{1034.919921875,1840.5966796875,11.468292236328},
	{971.103515625,1887.0078125,11.468292236328},
	{937.068359375,1920.517578125,11.468292236328},
	{971.0712890625,1977.146484375,11.468292236328},
	{1027.81640625,1926.576171875,11.468292236328},
	{1021.2802734375,1972.55078125,11.163819313049},
	{1025.3779296875,2026.5234375,11.347480773926},
	{957.7919921875,2256.5654296875,11.3671875},
	{986.890625,2272.4775390625,11.4609375},
	{987.044921875,2312.845703125,11.4609375},
	{970.8828125,2350.4130859375,11.46875},
	{1225.7939453125,2616.9736328125,10.8203125},
	{1265.474609375,2608.0849609375,10.8203125},
	{1276.072265625,2522.248046875,10.8203125},
	{1328.9736328125,2521.4775390625,10.826429367065},
	{1325.2548828125,2568.6103515625,10.8203125},
	{1344.6630859375,2608.3330078125,10.8203125},
	{1412.0693359375,2577.4931640625,10.826509475708},
	{1451.1142578125,2567.16796875,10.8203125},
	{1503.6923828125,2570.044921875,10.8203125},
	{1515.609375,2607.4580078125,10.8203125},
	{1551.619140625,2567.365234375,10.8203125},
	{1596.6640625,2568.2353515625,10.8203125},
	{1623.4375,2570.0888671875,10.8203125},
	{1556.6337890625,2661.298828125,10.8203125},
	{1573.2255859375,2661.7197265625,10.8203125},
	{1457.4462890625,2771.947265625,10.8203125},
	{1448.9794921875,2774.0263671875,18.8203125},
	{1442.6376953125,2796.767578125,19.5234375},
	{1426.5166015625,2780.7314453125,14.8203125},
	{1426.21875,2799.0908203125,14.8203125},
	{1388.9599609375,2656.1787109375,11.392612457275},
	{1478.05859375,2651.5498046875,11.392612457275},
	{1437.7451171875,2646.77734375,11.392612457275},
	{1431.771484375,2622.7216796875,11.392614364624},
	{1570.548828125,2715.2548828125,10.8203125},
	{1576.6708984375,2751.9453125,11.343775749207},
	{1561.107421875,2794.79296875,10.8203125},
	{1575.3896484375,2840.87890625,10.8203125},
	{1601.5283203125,2805.9091796875,10.8203125},
	{1638.8935546875,2834.953125,10.8203125},
	{1655.4033203125,2805.14453125,10.8203125},
	{1675.59765625,2800.6513671875,10.8203125},
	{1671.92578125,2744.462890625,10.8203125},
	{1634.5390625,2745.3359375,10.8203125},
	{1609.2421875,2718.5244140625,10.8203125},
	{1626.7646484375,2714.0478515625,10.8203125},
	{1676.8466796875,2695.7880859375,10.8203125},
	{1703.9306640625,2693.53125,10.8203125},
	{1736.3994140625,2694.12109375,10.8203125},
	{1741.6904296875,2859.5185546875,11.3359375},
	{1761.609375,2866.7099609375,11.3359375},
	{1772.1669921875,2867.37890625,11.3359375},
	{1794.0322265625,2858.716796875,14.257873535156},
	{1772.7841796875,2866.625,14.265625},
	{1734.9638671875,2827.7783203125,11.350912094116},
	{1736.9287109375,2815.4765625,11.34375},
	{1747.41015625,2769.404296875,11.34375},
	{1752.3359375,2760.3232421875,11.350912094116},
	{1776.591796875,2747.908203125,11.34375},
	{1782.15625,2767.41796875,11.350912094116},
	{1792.1376953125,2802.7001953125,11.34375},
	{1795.0126953125,2813.4033203125,11.34375},
	{1802.619140625,2835.9482421875,14.273517608643},
	{1795.212890625,2815.33984375,14.273517608643},
	{1756.2978515625,2746.171875,14.273517608643},
	{1751.9404296875,2757.822265625,14.273517608643},
	{1747.5029296875,2770.5400390625,14.273517608643},
	{1836.4345703125,2838.580078125,10.8359375},
	{1835.65625,2827.3056640625,10.8359375},
	{1852.9501953125,2857.572265625,11.902812957764},
	{1884.30859375,2877.162109375,10.8359375},
	{1887.5224609375,2802.2216796875,11.34375},
	{1878.9052734375,2793.6416015625,11.34375},
	{1863.0244140625,2777.3564453125,14.265686035156},
	{1879.77734375,2793.5341796875,14.2734375},
	{1855.607421875,2766.4091796875,14.265686035156},
	{1837.75,2751.4873046875,14.2734375},
	{1825.97265625,2648.955078125,10.8203125},
	{1844.521484375,2648.0107421875,10.8203125},
	{1863.384765625,2648.13671875,10.8203125},
	{1880.474609375,2646.9970703125,10.8203125},
	{1869.1171875,2584.466796875,10.8203125},
	{1887.80078125,2585.03515625,10.8203125},
	{1925.587890625,2606.3720703125,10.8203125},
	{1944.2724609375,2605.9501953125,10.8203125},
	{1949.5625,2661.6376953125,10.8203125},
	{1947.16796875,2707.3603515625,10.8203125},
	{2010.0546875,2707.474609375,11.20196056366},
	{2011.0693359375,2728.6357421875,10.827390670776},
	{2017.3642578125,2754.951171875,10.8203125},
	{1961.4599609375,2756.41796875,10.8203125},
	{1919.3740234375,2768.7958984375,10.826509475708},
	{2009.8427734375,2680.1689453125,10.8203125},
	{2143.6982421875,2835.0341796875,10.8203125},
	{2618.861328125,2724.796875,36.538642883301},
	{2823.466796875,2268.119140625,14.661463737488},
	{2817.1748046875,2275.263671875,14.661463737488},
	{2793.5400390625,2222.580078125,10.8203125},
	{2794.3525390625,2228.98046875,14.661463737488},
	{2824.0146484375,2206.849609375,10.812986373901},
	{2819.1474609375,2140.6875,14.661464691162},
	{2826.0498046875,2125.791015625,10.8203125},
	{2809.8876953125,2067.072265625,10.735213279724},
	{2809.7685546875,2049.3828125,10.790351867676},
	{2834.6787109375,2049.7626953125,10.8203125},
	{2836.0009765625,2083.8603515625,10.8203125},
	{-2229.0498046875,252.37890625,35.3203125},
	{-2547.072265625,392.6298828125,22.015625},
	{-2513.5068359375,849.2216796875,52.6953125},
	{-2513.9052734375,885.67578125,62.764999389648},
	{-2502.8212890625,921.3798828125,65.241363525391},
	{-2449.8701171875,921.41796875,58.144382476807},
	{-2374.1484375,931.5830078125,45.414939880371},
	{-2113.2744140625,978.0263671875,71.515625},
	{-2041.939453125,979.51171875,54.677085876465},
	{-1625.783203125,944.388671875,10.6484375},
	{-1582.0908203125,955.869140625,7.1875},
	{-1594.775390625,975.8095703125,7.1875},
	{-1614.9228515625,1002.02734375,7.1875},
	{-1616.353515625,1097.9267578125,7.1875},
	{-1617.5341796875,1155.9814453125,7.1875},
	{-1492.1396484375,920.0009765625,7.1875},
	{-1606.1083984375,773.2783203125,7.1875},
	{-1422.5283203125,-285.8115234375,14.1484375},
	{-1388.7177734375,-328.6025390625,14.280866622925},
	{-2051.763671875,-480.5322265625,38.734375},
	{-1971.513671875,-1019.2958984375,32.171875},
	{-2002.3720703125,-1020.7861328125,32.171875},
	{-2209.978515625,-2288.8974609375,30.625},
	{-2223.248046875,-2293.5615234375,31.671875},
	{-2188.8271484375,-2344.521484375,30.625},
	{-2157.787109375,-2337.0458984375,30.625},
	{-2103.9794921875,-2341.955078125,30.625},
	{-2129.5556640625,-2375.3505859375,30.625},
	{-2144.109375,-2425.78515625,30.625},
	{-2105.984375,-2480.7490234375,30.625},
	{-2057.5341796875,-2464.5439453125,31.1796875},
	{-2079.3056640625,-2448.56640625,30.625},
	{-2093.65625,-2464.8388671875,30.625},
	{-2132.513671875,-2511.123046875,31.816272735596},
	{-2161.455078125,-2535.5439453125,31.816270828247},
	{-2199.8115234375,-2512.4248046875,31.816270828247},
	{-2189.3662109375,-2533.4150390625,31.1171875},
	{-2227.697265625,-2489.3681640625,31.816272735596},
	{-2214.03125,-2451.876953125,31.816270828247},
	{-2239.0341796875,-2423.8388671875,32.70726776123},
	{-2161.333984375,-2384.7919921875,30.895784378052},
	{-2087.3359375,-2510.623046875,31.066806793213},
	{-2058.1669921875,-2503.5595703125,31.066806793213},
	{-2075.21484375,-2526.1865234375,31.066806793213},
	{-2068.947265625,-2561.501953125,31.066806793213},
	{-2031.2890625,-2538.904296875,31.066806793213},
	{-1855.173828125,-1560.04296875,22.453125},
	{-2242.337890625,191.2001953125,35.3203125},
	{1722.68359375,-2334.0068359375,13.546875},
	{-2197.4892578125,1190.759765625,55.69548034668},
	{1632.326171875,-2335.2197265625,13.539954185486},
	{-2351.1376953125,1299.45703125,19.584844589233},
	{1682.185546875,-2240.4375,-2.6991682052612},
	{1640.166015625,-2333.09765625,-2.6796875},
	{-2312.478515625,848.5205078125,71.382347106934},
	{-2231.46875,-2558.251953125,31.921875},
	{-2663.8955078125,552.2001953125,14.609375},
	{-2890.9560546875,738.5390625,29.171875},
	{-2477.83984375,1338.0986328125,8.5038833618164},
	{-890.25,20.0693359375,31.13649559021},
	{-877.8994140625,25.2763671875,30.586343765259},
	{-100.333984375,-104.8505859375,3.1180820465088},
	{148.2802734375,-159.6787109375,1.578125},
	{178.220703125,-120.2314453125,1.5490583181381},
	{160.6337890625,-102.615234375,4.8964710235596},
	{207.0751953125,-102.7646484375,4.8964710235596},
	{209.0244140625,-112.3701171875,1.5508496761322},
	{252.8828125,-121.212890625,3.5353934764862},
	{267.8115234375,-54.5546875,2.7772099971771},
	{295.1337890625,-54.587890625,2.7772107124329},
	{196.82421875,-119.9599609375,1.5502977371216},
	{175.7138671875,-95.23828125,1.5502822399139},
	{158.568359375,-106.9755859375,4.8964710235596},
	{312.7353515625,-92.474609375,3.5353934764862},
	{312.7373046875,-121.0869140625,3.5353941917419},
	{259.4619140625,-302.591796875,1.9183698892593},
	{254.9072265625,-191.6904296875,1.578125},
	{301.017578125,-188.7138671875,1.578125},
	{262.0185546875,-270.0517578125,1.6404900550842},
	{263.06640625,21.927734375,3.4331963062286},
	{252.3095703125,-91.1962890625,3.5353941917419},
	{202.7607421875,-202.33984375,1.578125},
	{214.5166015625,-183.0888671875,1.578125},
	{1224.6318359375,249.9892578125,19.546894073486},
	{1256.712890625,274.861328125,19.5546875},
	{1294.9140625,235.7802734375,19.5546875},
	{1244.341796875,205.4287109375,19.645431518555},
	{1317.69140625,224.4599609375,19.56298828125},
	{1386.556640625,293.2529296875,19.54688835144},
	{1273.4189453125,238.228515625,19.610862731934},
	{1356.849609375,308.119140625,19.747299194336},
	{1310.93359375,330.0146484375,19.9140625},
	{1323.8916015625,375.58203125,19.562463760376},
	{1276.9384765625,370.6611328125,19.5546875},
	{1297.0400390625,353.3994140625,19.5546875},
	{1292.4677734375,311.6064453125,19.5546875},
	{1264.4326171875,285.201171875,19.5546875},
	{1272.0859375,309.3125,19.5546875},
	{1235.0078125,360.2578125,19.5546875},
	{1253.2470703125,352.0009765625,19.5546875},
	{1295.0400390625,175.3095703125,20.910556793213},
	{1312.7119140625,170.0556640625,20.4609375},
	{1340.1689453125,216.1025390625,19.5546875},
	{1363.908203125,192.3173828125,24.227144241333},
	{2203.8583984375,62.23046875,28.441644668579},
	{2161.8505859375,-104.626953125,2.7078378200531},
	{2160.43359375,-101.869140625,2.75},
	{2186.98828125,-89.583984375,28.153547286987},
	{2198.1689453125,-57.9453125,28.153549194336},
	{2202.744140625,-38.5810546875,28.153547286987},
	{2250.765625,-2.5986328125,28.153551101685},
	{2247.2744140625,-121.373046875,28.153547286987},
	{2267.1982421875,-139.845703125,27.4765625},
	{2293.5185546875,-134.3857421875,28.153959274292},
	{2321.2763671875,-124.15625,28.153551101685},
	{2256.138671875,-44.03125,26.683433532715},
	{2266.3125,-76.5771484375,24.5859375},
	{2368.3134765625,-64.7060546875,28.153547286987},
	{2387.15234375,-53.431640625,28.153551101685},
	{2436.2548828125,-54.2744140625,28.153549194336},
	{2439.45703125,-71.5087890625,28.153959274292},
	{2203.8623046875,106.1181640625,28.44164276123},
	{2249.404296875,111.759765625,28.44164276123},
	{2251.763671875,80.04296875,26.703674316406},
	{2445.021484375,-13.126953125,27.683458328247},
	{2269.6240234375,111.7685546875,28.441644668579},
	{2432.73046875,-0.875,26.484375},
	{2273.1865234375,82.1259765625,26.484375},
	{2285.7744140625,161.7666015625,28.44164276123},
	{2410.328125,-7.28515625,27.683460235596},
	{2258.0439453125,168.3134765625,28.153551101685},
	{2416.19921875,17.8681640625,27.683458328247},
	{2236.404296875,168.302734375,28.153549194336},
	{2374.3173828125,22.654296875,28.44164276123},
	{2323.8896484375,116.1103515625,28.44164276123},
	{2373.865234375,49.236328125,28.441644668579},
	{2363.9697265625,116.05859375,28.441644668579},
	{2323.8759765625,136.4765625,28.44164276123},
	{2366.390625,40.341796875,28.44164276123},
	{2363.9970703125,141.7978515625,28.44164276123},
	{2323.8486328125,162.4755859375,28.441644668579},
	{2363.986328125,165.8994140625,28.441644668579},
	{2323.875,191.03515625,28.44164276123},
	{2363.9931640625,187.1484375,28.44164276123},
	{2307.013671875,-4.8701171875,26.7421875},
	{2310.9267578125,-9.912109375,26.7421875},
	{2333.611328125,51.7109375,26.627893447876},
	{2324.1884765625,-3.5205078125,26.557140350342},
	{2332.97265625,-4.00390625,26.560916900635},
	{2327.888671875,8.4453125,26.531627655029},
	{2484.3359375,-28.353515625,28.44164276123},
	{2488.328125,11.7509765625,28.44164276123},
	{2513.419921875,-28.375,28.441644668579},
	{2558.2197265625,-11.2705078125,27.675647735596},
	{2549.19921875,25.4013671875,27.675647735596},
	{2398.416015625,110.73046875,28.44164276123},
	{2551.20703125,57.1240234375,27.675645828247},
	{2444.046875,97.8427734375,28.441644668579},
	{2556.9736328125,87.7666015625,27.675645828247},
	{2494.595703125,88.2958984375,26.484375},
	{2561.78125,72.1796875,26.4765625},
	{2537.916015625,128.3974609375,27.683460235596},
	{2513.9208984375,94.4111328125,27.683460235596},
	{2504.732421875,134.0849609375,26.4765625},
	{2462.7822265625,134.2802734375,27.675645828247},
	{2481.0791015625,125.8642578125,27.675647735596},
	{2456.7744140625,127.2626953125,27.675647735596},
	{2412.8662109375,70.7548828125,28.44164276123},
	{1547.08984375,32.642578125,24.140625},
	{1105.8349609375,-301.82421875,74.5390625},
	{1106.46875,-316.521484375,74.7421875},
	{614.388671875,-518.3642578125,16.353294372559},
	{624.8662109375,-506.2568359375,16.352542877197},
	{654.810546875,-503.103515625,16.3359375},
	{695.048828125,-500.1318359375,16.3359375},
	{818.771484375,-495.69140625,18.012922286987},
	{742.337890625,-495.80078125,18.012922286987},
	{795.482421875,-497.193359375,18.013332366943},
	{768.375,-503.7763671875,18.012926101685},
	{766.5439453125,-556.5673828125,18.012924194336},
	{745.232421875,-556.7734375,18.012926101685},
	{800.810546875,-574.1591796875,16.3359375},
	{691.248046875,-621.69140625,16.3359375},
	{820.1103515625,-575.345703125,16.536296844482},
	{673.2314453125,-634.4541015625,16.3359375},
	{857.2412109375,-602.9853515625,18.421875},
	{691.84765625,-546.6572265625,16.3359375},
	{849.98828125,-604.048828125,18.421875},
	{745.349609375,-591.0302734375,18.012922286987},
	{716.541015625,-468.16796875,16.343704223633},
	{673.0771484375,-460.72265625,16.536296844482},
	{609.509765625,-611.48828125,17.2265625},
	{609.5478515625,-595.8916015625,17.233013153076},
	{606.294921875,-581.365234375,16.636558532715},
	{2095.3544921875,-1145.32421875,26.592920303345},
	{1852.3740234375,-1144.9921875,23.834211349487},
	{1852.3232421875,-1092.921875,23.828125},
	{1831.0498046875,-1092.1767578125,23.838096618652},
	{1833.751953125,-1125.6044921875,24.672080993652},
	{1796.8720703125,-1149.1142578125,23.749704360962},
	{1700.3095703125,-1171.275390625,23.843555450439},
	{1730.1767578125,-1181.998046875,23.838611602783},
	{1792.90625,-1163.4306640625,23.828125},
	{1830.556640625,-1172.0546875,24.265625},
	{1808.1728515625,-1436.2373046875,13.4296875},
	{1764.3583984375,-1398.005859375,15.7578125},
	{1789.0791015625,-1383.9853515625,15.7578125},
	{1765.7978515625,-1341.994140625,15.758672714233},
	{1684.4501953125,-1345.8330078125,17.433988571167},
	{1734.76953125,-1265.439453125,13.542039871216},
	{1691.03515625,-1200.0849609375,19.8984375},
	{1650.560546875,-1199.1298828125,19.781862258911},
	{1569.3662109375,-1198.900390625,19.7890625},
	{1528.875,-1151.2177734375,24.078125},
	{1566.1611328125,-1171.3837890625,24.095048904419},
	{1631.830078125,-1172.927734375,24.084280014038},
	{1673.3291015625,-1171.041015625,23.972120285034},
	{1658.5478515625,-1342.62890625,17.438894271851},
	{1570.64453125,-1337.533203125,16.484375},
	{1500.3759765625,-1337.107421875,14.021427154541},
	{1516.646484375,-1399.5546875,14.011289596558},
	{1667.8896484375,-1533.5478515625,13.546875},
	{1648.3720703125,-1469.2060546875,13.546875},
	{1689.66015625,-1518.0146484375,13.546875},
	{1670.46875,-1581.7578125,13.546875},
	{1555.7529296875,-1634.4580078125,6.21875},
	{1568.6025390625,-1689.9833984375,6.21875},
	{1419.185546875,-1607.17578125,13.546875},
	{1419.1826171875,-1640.2978515625,13.546875},
	{1410.2939453125,-1701.4365234375,13.539485931396},
	{1341.330078125,-1675.177734375,17.71573638916},
	{1341.3544921875,-1648.96875,17.719120025635},
	{1327.890625,-1556.087890625,13.546875},
	{1347.8154296875,-1501.3310546875,13.546875},
	{1333.091796875,-1522.33984375,13.546875},
	{1360.2177734375,-1469.576171875,13.546875},
	{1368.3525390625,-1432.541015625,14.0546875},
	{1387.353515625,-1438.6533203125,13.5546875},
	{1408.470703125,-1385.607421875,13.572636604309},
	{1370.8134765625,-1365.4697265625,13.546875},
	{1370.6337890625,-1320.107421875,13.546875},
	{1424.6103515625,-1086.5908203125,17.550863265991},
	{1440.609375,-1095.6064453125,17.62438583374},
	{1386.91015625,-1168.6650390625,23.8203125},
	{1465.8994140625,-1010.4609375,26.84375},
	{1448.890625,-1010.728515625,26.84375},
	{1330.3232421875,-985.314453125,33.896629333496},
	{1300.2353515625,-992.048828125,35.280891418457},
	{1290.7939453125,-1075.2197265625,29.27294921875},
	{1285.21484375,-1066.130859375,31.678918838501},
	{1284.6728515625,-1089.58203125,28.2578125},
	{1320.392578125,-1076.6240234375,29.1796875},
	{1291.37890625,-1131.5009765625,23.828125},
	{1243.310546875,-1076.3720703125,31.5546875},
	{1296.7802734375,-991.564453125,32.6953125},
	{1234.81640625,-1437.94921875,13.615178108215},
	{1232.875,-1459.0751953125,13.546875},
	{1284.8671875,-1464.080078125,10.046875},
	{1247.3681640625,-1528.0390625,13.561420440674},
	{1148.23828125,-1344.2822265625,13.655700683594},
	{1180.0244140625,-1260.689453125,18.8984375},
	{1187.322265625,-1254.587890625,18.890762329102},
	{1180.595703125,-1255.048828125,15.1796875},
	{1186.6298828125,-1226.7841796875,18.5546875},
	{1180.81640625,-1227.34765625,22.132949829102},
	{1180.0126953125,-1233.4072265625,22.140625},
	{1170.3720703125,-1490.9453125,22.755535125732},
	{1062.6298828125,-1499.9287109375,22.752643585205},
	{1112.4912109375,-1520.8896484375,15.796875},
	{1153.83984375,-1181.85546875,32.818702697754},
	{1161.640625,-1162.3193359375,32.027549743652},
	{1102.423828125,-1092.8701171875,28.46875},
	{1142.8388671875,-1069.4052734375,31.765625},
	{1102.75,-1069.3359375,31.8828125},
	{1069.2041015625,-1080.9345703125,27.532295227051},
	{1246.2529296875,-908.962890625,46.6015625},
	{1252.869140625,-902.53515625,46.593887329102},
	{1248.9677734375,-877.4228515625,42.8828125},
	{1242.1826171875,-872.0380859375,46.632949829102},
	{1287.1630859375,-867.5517578125,46.836074829102},
	{1281.7578125,-874.931640625,46.84375},
	{1290.984375,-896.9892578125,42.8828125},
	{1439.6669921875,-926.4306640625,39.647666931152},
	{1411.228515625,-920.8828125,38.421875},
	{1467.9072265625,-917.0048828125,54.839092254639},
	{1469.384765625,-904.7822265625,54.8359375},
	{1420.697265625,-885.1396484375,50.645557403564},
	{1527.41796875,-892.8388671875,57.657482147217},
	{1539.822265625,-851.0029296875,64.336059570312},
	{1563.318359375,-855.5576171875,61.365352630615},
	{1534.9189453125,-800.1513671875,72.849456787109},
	{1549.11328125,-803.66015625,72.217529296875},
	{1535.44140625,-762.0888671875,79.9453125},
	{1497.2705078125,-666.6865234375,95.601257324219},
	{1442.8671875,-630.9267578125,95.718566894531},
	{1333.8984375,-630.0361328125,109.1349029541},
	{1258.3154296875,-785.7998046875,92.030181884766},
	{1302.1123046875,-786.5693359375,88.3125},
	{1134.892578125,-748.40234375,97.162223815918},
	{1111.27734375,-742.2744140625,100.13292694092},
	{1095.0439453125,-646.50390625,113.6484375},
	{1094.6015625,-661.0712890625,113.6484375},
	{1045.3935546875,-641.359375,120.1171875},
	{980.0400390625,-677.3671875,121.97625732422},
	{992.154296875,-695.625,121.77093505859},
	{897.7158203125,-677.494140625,116.89044189453},
	{945.8369140625,-710.2158203125,122.61987304688},
	{868.3251953125,-715.86328125,105.6796875},
	{848.931640625,-745.384765625,94.969268798828},
	{808.51953125,-759.94140625,76.531364440918},
	{784.984375,-761.169921875,73.560661315918},
	{909.6806640625,-816.8798828125,103.12602996826},
	{977.6484375,-771.376953125,112.20262908936},
	{1017.0146484375,-763.0830078125,112.56301879883},
	{1034.3251953125,-811.2109375,101.8515625},
	{990.0791015625,-828.50390625,95.468574523926},
	{1093.455078125,-805.79296875,107.42092895508},
	{937.982421875,-848.236328125,93.632316589355},
	{828.65625,-858.4248046875,70.330810546875},
	{786.333984375,-827.677734375,70.289581298828},
	{835.875,-893.609375,68.768898010254},
	{725.0361328125,-997.859375,52.734375},
	{730.9892578125,-1013.015625,52.737854003906},
	{672.921875,-1020.2392578125,55.759605407715},
	{699.2705078125,-1058.7177734375,49.421691894531},
	{645.47265625,-1117.919921875,44.207038879395},
	{565.7802734375,-1098.4677734375,69.951286315918},
	{497.560546875,-1094.9091796875,82.359191894531},
	{416.6953125,-1154.544921875,76.687614440918},
	{471.3603515625,-1164.3671875,67.170478820801},
	{534.728515625,-1173.6796875,58.809711456299},
	{580.3369140625,-1149.345703125,53.180084228516},
	{358.3115234375,-1207.4990234375,76.518783569336},
	{316.11328125,-1139.5576171875,81.593444824219},
	{299.66796875,-1154.400390625,81.224769592285},
	{350.3330078125,-1197.0029296875,76.515625},
	{250.9892578125,-1220.583984375,76.10237121582},
	{252.931640625,-1270.10546875,74.399215698242},
	{272.65234375,-1281.828125,74.632507324219},
	{256.2763671875,-1297.99609375,74.632507324219},
	{220.125,-1250.248046875,78.330360412598},
	{167.1376953125,-1297.1552734375,70.351257324219},
	{168.4248046875,-1321.5234375,70.351257324219},
	{255.20703125,-1365.712890625,53.109375},
	{298.3076171875,-1338.287109375,53.441452026367},
	{228.75,-1403.7080078125,51.60758972168},
	{335.8173828125,-1303.744140625,50.759044647217},
	{398.68359375,-1271.0029296875,50.019790649414},
	{432.056640625,-1253.8876953125,51.580940246582},
	{549.4267578125,-1215.0986328125,44.86026763916},
	{552.109375,-1200.5830078125,44.831535339355},
	{598.68359375,-1194.3447265625,41.784606933594},
	{608.8759765625,-1187.1806640625,41.784606933594},
	{152.6962890625,-1449.6953125,32.844982147217},
	{140.6455078125,-1479.787109375,25.2109375},
	{1674.4541015625,1447.390625,10.790289878845},
	{1682.275390625,1755.2529296875,10.827277183533},
	{1653.578125,1732.27734375,10.8203125},
	{1643.8818359375,1912.6865234375,10.8203125},
	{1663.1279296875,1912.267578125,10.8203125},
	{1671.646484375,1967.9560546875,10.8203125},
	{1648.52734375,1977.759765625,10.8203125},
	{1611.9306640625,1978.109375,10.8203125},
	{1530.740234375,1936.2431640625,10.8203125},
	{1511.0576171875,1911.4580078125,10.8203125},
	{1735.013671875,2111.724609375,12.2890625},
	{1686.2880859375,2046.1767578125,11.46875},
	{1673.447265625,2090.677734375,11.4609375},
	{1672.0517578125,2130.0087890625,11.4609375},
	{1645.0537109375,2128.7568359375,11.203125},
	{1639.6298828125,2149.41015625,11.3125},
	{1638.119140625,2103.275390625,11.3125},
	{1644.87109375,2080.9677734375,11.3125},
	{1618.1064453125,2076.033203125,30.529462814331},
	{1596.4287109375,2038.126953125,11.46875},
	{1597.4423828125,2092.88671875,11.3125},
	{1584.388671875,2147.537109375,11.4609375},
	{1536.3486328125,2032.8720703125,14.739588737488},
	{1542.66796875,2003.1279296875,10.8203125},
	{1501.3984375,2027.3271484375,14.739588737488},
	{1481.15234375,1998.68359375,10.8203125},
	{1473.8974609375,2002.4560546875,10.8203125},
	{1456.1259765625,2030.458984375,14.739588737488},
	{1416.98828125,2036.68359375,10.8203125},
	{1417.9794921875,1999.42578125,10.8203125},
	{1422.6806640625,1915.28515625,11.46875},
	{1453.978515625,1944.6875,11.468292236328},
	{1445.365234375,1949.2958984375,11.4609375},
	{1365.646484375,1932.775390625,11.468292236328},
	{1335.9306640625,1919.6494140625,11.4609375},
	{1319.794921875,1975.5244140625,11.46875},
	{1352.830078125,2027.876953125,11.4609375},
	{1370.0166015625,1989.18359375,11.308856964111},
	{1547.447265625,2125.7880859375,11.4609375},
	{1477.5693359375,2194.6318359375,11.0234375},
	{1407.4580078125,2221.41796875,11.0234375},
	{1369.73828125,2195.5634765625,9.7578125},
	{1393.2724609375,2171.2744140625,9.7578125},
	{1409.5810546875,2141.7421875,12.015625},
	{1413.6455078125,2105.537109375,12.015625},
	{1360.4912109375,2213.3759765625,12.015625},
	{1442.3857421875,2361.904296875,10.8203125},
	{1656.9853515625,2251.1826171875,11.07010269165},
	{1838.0458984375,2157.4013671875,10.8203125},
	{1855.751953125,2157.0712890625,10.8203125},
	{1837.61328125,2093.943359375,10.8203125},
	{1892.7275390625,2235.4423828125,11.125},
	{1879.2236328125,2235.25,11.125},
	{1857.625,2351.8291015625,10.979915618896},
	{1856.248046875,2383.25,10.979915618896},
	{2023.5849609375,1900.0634765625,12.267676353455},
	{2018.970703125,1917.529296875,12.341463088989},
	{1968.7294921875,1623.48828125,12.860266685486},
	{2001.49609375,1541.267578125,13.5859375},
	{1999.31640625,1530.21875,14.622252464294},
	{1890.0166015625,1596.4658203125,10.538269996643},
	{1868.1669921875,1308.9814453125,16.922344207764},
	{1931.69921875,1336.7529296875,9.96875},
	{1947.2333984375,1397.4990234375,9.2578125},
	{1910.7255859375,1401.818359375,9.2578125},
	{1953.0556640625,1343.958984375,15.3671875},
	{1993.6875,1241.4521484375,10.8203125},
	{2008.46875,1169.8330078125,10.8203125},
	{1966.9130859375,1102.0322265625,10.8203125},
	{1952.001953125,1101.9404296875,10.8203125},
	{1896.0146484375,1142.3056640625,10.8203125},
	{1862.666015625,1190.12109375,10.836782455444},
	{1859.01171875,1112.12890625,10.8203125},
	{1858.84765625,1079.8623046875,10.8203125},
	{1859.0625,1050.431640625,10.8203125},
	{1858.92578125,994.1474609375,10.8203125},
	{1859.4013671875,937.771484375,10.8203125},
	{1877.474609375,925.0947265625,10.8203125},
	{1927.7822265625,924.265625,10.831217765808},
	{1916.3369140625,970.4931640625,10.8203125},
	{1909.0107421875,1017.82421875,10.8203125},
	{1920.2158203125,964.525390625,10.8203125},
	{1960.115234375,953.115234375,10.8203125},
	{1999.6953125,991.48046875,10.8203125},
	{2021.9443359375,1003.3857421875,10.8203125},
	{2021.2001953125,1009.5908203125,10.8203125},
	{1946.427734375,2050.9853515625,10.8203125},
	{1968.236328125,2294.9638671875,16.455863952637},
	{1998.7578125,2302.7958984375,10.8203125},
	{2004.5810546875,2309.9541015625,10.8203125},
	{2127.40625,2377.3232421875,10.8203125},
	{2189.416015625,2399.2802734375,10.8203125},
	{2189.416015625,2399.2802734375,10.8203125},
	{2166.443359375,2478.806640625,10.8203125},
	{2159.64453125,2465.7568359375,10.8203125},
	{2114.9013671875,2498.763671875,14.83895111084},
	{2099.5068359375,2492.00390625,11.078125},
	{2057.7861328125,2483.947265625,11.078125},
	{2176.8447265625,2419.779296875,73.03385925293},
	{2119.2587890625,884.3779296875,11.186832427979},
	{2159.072265625,956.1904296875,11.1015625},
	{2249.9599609375,960.7021484375,10.812986373901},
	{2491.2060546875,918.8837890625,11.0234375},
	{2502.2255859375,926.1259765625,11.0234375},
	{2196.83203125,1062.1728515625,10.8203125},
	{2182.6611328125,1114.8740234375,12.6484375},
	{2413.5078125,1122.8271484375,10.8203125},
	{2478.779296875,1063.951171875,10.812517166138},
	{2499.1787109375,1149.474609375,22.023197174072},
	{2625.6640625,1191.623046875,10.794861793518},
	{2633.263671875,1192.841796875,26.918153762817},
	{2581.3623046875,1062.3056640625,11.157404899597},
	{2546.0205078125,1106.1640625,10.8203125},
	{2540.919921875,1232.1962890625,10.958621025085},
	{2477.7119140625,1276.30859375,10.8125},
	{2448.529296875,1300.859375,10.8203125},
	{2178.7080078125,1292.08203125,10.8203125},
	{2178.1796875,1285.7978515625,10.8203125},
	{2237.60546875,1284.345703125,10.8203125},
	{2180.833984375,1448.6962890625,10.8203125},
	{2178.2666015625,1516.650390625,10.8203125},
	{2153.0166015625,1490.373046875,10.8203125},
	{2272.4833984375,1518.0166015625,30.031227111816},
	{2297.7109375,1469.025390625,36.421875},
	{2418.9482421875,1431.9580078125,10.8203125},
	{2465.544921875,1405.8095703125,10.90625},
	{2533.041015625,1398.083984375,10.90625},
	{2567.5322265625,1402.701171875,11.066242218018},
	{2557.7509765625,1363.9140625,10.8203125},
	{2511.9814453125,1360.2021484375,10.827831268311},
	{2533.5537109375,1507.3662109375,11.621562004089},
	{2567.30078125,1552.279296875,13.40625},
	{2460.572265625,1558.572265625,11.78125},
	{2340.6484375,1576.1884765625,10.8203125},
	{2299.3759765625,1564.9033203125,10.8203125},
	{2308.8681640625,1648.3955078125,10.8203125},
	{2284.109375,1722.8798828125,11.046875},
	{2160.9697265625,1640.72265625,11.141441345215},
	{2154.6376953125,1742.34375,11.107455253601},
	{2337.4521484375,1758.85546875,12.453807830811},
	{2436.3916015625,1672.55859375,10.8203125},
	{2391.0537109375,1682.572265625,14.281055450439},
	{2378.78515625,1681.8125,14.281055450439},
	{2359.9970703125,1677.62109375,14.281055450439},
	{2359.4423828125,1669.43359375,14.281055450439},
	{2359.2080078125,1662.583984375,14.281055450439},
	{2515.3623046875,1657.0458984375,11.0234375},
	{2510.2685546875,1680.44921875,11.0234375},
	{2491.578125,1680.6865234375,11.0234375},
	{2480.6259765625,1681.3154296875,11.0234375},
	{2399.8466796875,1838.314453125,11.65625},
	{2277.68359375,1865.5302734375,10.8203125},
	{2224.6591796875,1843.017578125,10.8203125},
	{2204.5087890625,1899.7978515625,10.8203125},
	{2375.44921875,2044.087890625,10.8203125},
	{2545.6455078125,1972.0263671875,10.8203125},
	{2634.0810546875,1979.8349609375,14.116060256958},
	{2654.6181640625,1979.4892578125,14.116060256958},
	{2646.3984375,2015.9638671875,10.81704044342},
	{2637.265625,2017.2587890625,10.8203125},
	{2613.2822265625,2050.720703125,14.116060256958},
	{2470.232421875,2124.7041015625,10.8203125},
	{2406.3818359375,2125.59765625,10.9314661026},
	{2326.208984375,2118.970703125,10.828125},
	{2220.5615234375,2124.310546875,10.8203125},
	{2166.064453125,2162.904296875,10.8203125},
	{2257.6494140625,2161.7294921875,10.8203125},
	{2371.5078125,2166.208984375,10.826242446899},
	{2446.927734375,2162.4189453125,10.8203125},
	{2609.2236328125,2144.65625,14.116060256958},
	{2636.4287109375,2183.9091796875,10.8203125},
	{2611.072265625,2183.228515625,10.812986373901},
	{2601.9326171875,2190.22265625,14.116060256958},
	{2602.3974609375,2202.5283203125,14.116060256958},
	{2624.9462890625,2200.6953125,10.8203125},
	{2619.8818359375,2199.4599609375,10.8203125},
	{2605.30859375,2208.388671875,10.8203125},
	{2604.0712890625,2212.0478515625,10.8203125},
	{2636.3720703125,2351.666015625,10.8203125},
	{2628.2978515625,2347.75390625,10.8203125},
	{2572.455078125,2331.640625,17.822208404541},
	{2583.091796875,2366.2529296875,17.8203125},
	{2610.43359375,2417.9580078125,10.8203125},
	{2622.5302734375,2417.6943359375,10.8203125},
	{2516.173828125,2225.677734375,10.8203125},
	{2453.9091796875,2226.2451171875,10.866273880005},
	{2429.359375,2226.2294921875,10.948439598083},
	{2345.5625,2273.11328125,8.1477851867676},
	{2352.953125,2307.685546875,8.1477851867676},
	{2393.275390625,2307.5244140625,8.140625},
	{2363.90625,2377.080078125,10.8203125},
	{2445.9287109375,2376.3408203125,12.163512229919},
	{2448.240234375,2257.0556640625,10.8203125},
	{2488.9228515625,2397.712890625,10.8203125},
	{2484.8642578125,2356.818359375,4.2109375},
	{2491.443359375,2397.615234375,4.2109375},
	{2248.23828125,2397.7373046875,10.8203125},
	{2212.654296875,2341.794921875,10.8203125},
	{2180.888671875,2292.33984375,10.8203125},
	{2243.9453125,2522.1337890625,10.8203125},
	{2271.673828125,2537.2412109375,10.8203125},
	{2321.2998046875,2531.94140625,10.8203125},
	{2331.1904296875,2531.1513671875,10.8203125},
	{952.1337890625,-910.8427734375,45.765625},
	{813.654296875,-1005.595703125,27.943950653076},
	{766.28515625,-1011.6015625,24.109375},
	{976.5546875,-1070.9052734375,26.988595962524},
	{976.326171875,-1091.7255859375,23.934619903564},
	{972.2578125,-1122.3212890625,23.846771240234},
	{982.3046875,-1162.3857421875,25.0859375},
	{921.6982421875,-1299.1845703125,14.09375},
	{922.126953125,-1287.5625,14.40625},
	{919.2177734375,-1266.0234375,15.171875},
	{919.419921875,-1252.0859375,16.380939483643},
	{726.51953125,-1275.85546875,13.6484375},
	{954.126953125,-1336.431640625,13.538691520691},
	{875.08984375,-1504.677734375,12.657918930054},
	{851.09375,-1519.935546875,13.691524505615},
	{878.4921875,-1514.6591796875,14.352069854736},
	{762.6962890625,-1563.6318359375,13.553644180298},
	{732.2548828125,-1477.767578125,5.46875},
	{719.1220703125,-1476.7841796875,5.46875},
	{789.1220703125,-1324.5078125,-0.5078125},
	{852.841796875,-1391.2421875,-0.50146150588989},
	{843.9853515625,-1390.5986328125,-1.3003606796265},
	{726.6962890625,-1450.935546875,17.6953125},
	{608.0302734375,-1475.2041015625,14.644786834717},
	{652.9443359375,-1618.94921875,15.0},
	{655.5556640625,-1640.4521484375,15.861747741699},
	{655.876953125,-1650.0732421875,15.408567428589},
	{487.3505859375,-1639.61328125,23.703125},
	{299.43359375,-1611.5322265625,33.120010375977},
	{279.83984375,-1615.5439453125,33.253612518311},
	{277.546875,-1599.9365234375,33.069110870361},
	{357.3642578125,-1394.314453125,14.438846588135},
	{374.984375,-1384.0029296875,14.462802886963},
	{391.921875,-1374.3095703125,14.819017410278},
	{595.61328125,-1250.6875,18.295663833618},
	{617.681640625,-1331.0546875,13.644295692444},
	{297.146484375,-1490.69140625,24.59375},
	{288.357421875,-1544.0625,24.59375},
	{364.099609375,-1557.318359375,32.909343719482},
	{409.57421875,-1601.76171875,27.14465713501},
	{478.35546875,-1537.6982421875,19.478967666626},
	{476.6376953125,-1497.7607421875,20.458106994629},
	{660.5947265625,-1525.875,14.8515625},
	{657.7060546875,-1480.9951171875,14.8515625},
	{684.3662109375,-1435.517578125,14.8515625},
	{598.333984375,-1285.1640625,15.859577178955},
	{895.5986328125,-1116.953125,24.197673797607},
	{899.21875,-1068.703125,24.479953765869},
	{811.0830078125,-1092.8251953125,25.78458404541},
	{820.0927734375,-1092.373046875,25.795583724976},
	{820.4970703125,-1109.12109375,25.796077728271},
	{810.7294921875,-1109.046875,25.784152984619},
	{811.0224609375,-1101.0810546875,25.784509658813}
};

enum supdate
{
	RandomMessage,
	TimeCheck,
	WeatherCheck,
	TentRespawn,
};
new ServerLimit[supdate];

main()
{
	print("\n----------------------------------");
	print(""CName" - "Name" "Version" Loaded");
	print("----------------------------------\n");
	WasteDeAMXersTime();
}


public OnGameModeInit()
{
    WasteDeAMXersTime();
    AntiDeAMX();
    TWD_CreateServerMap();
    DayZ_CreateServerMap();
    DayZ_CreateServerMap1();

	MySQLConnect();
	mysql_log(LOG_DEBUG);
	MapAndreas_Init(MAP_ANDREAS_MODE_FULL);

	for (new i = 0; i < FCNPC_MAX_NODES; i++)
	{
		if (!FCNPC_IsNodeOpen(i) && !FCNPC_OpenNode(i))
		{
			printf("Error: Failed to open node %d from (scriptfiles/FCNPC/nodes/NODES%d.DAT)", i, i);
			return 0;
		}
	}
	

	ZombiesTimer = SetTimer("CreateZombies", 50, true);
	new querystr[1700];

	strcat(querystr,"CREATE TABLE IF NOT EXISTS `users` (`Username` varchar(24) NOT NULL,`Password` varchar(128) NOT NULL,`Headshots` int(11) NOT NULL,`Murders` int(11) NOT NULL,`BanditsKilled` int(11) NOT NULL,`ZombiesKilled` int(11) NOT NULL, `Backpack` int(11) NOT NULL,`BackpackSlots` int(11) NOT NULL,");
	strcat(querystr,"`BackpackSlotsUsed` int(11) NOT NULL,`pAdminLevel` int(11) NOT NULL,`pPremium` int(11) NOT NULL,`pX` float NOT NULL,`pY` float NOT NULL,`pZ` float NOT NULL,`pWeap1` int(11) NOT NULL,`pAmmo1` int(11) NOT NULL,`pWeap2` int(11) NOT NULL,");
	strcat(querystr,"`pAmmo2` int(11) NOT NULL,`pWeap3` int(11) NOT NULL,`pAmmo3` int(11) NOT NULL,`pWeap4` int(11) NOT NULL,`pAmmo4` int(11) NOT NULL,`pWeap5` int(11) NOT NULL,`pAmmo5` int(11) NOT NULL,`pWeap6` int(11) NOT NULL,`pAmmo6` int(11) NOT NULL,`pWeap7` int(11) NOT NULL,");
	strcat(querystr,"`pAmmo7` int(11) NOT NULL,`pWeap8` int(11) NOT NULL,`pAmmo8` int(11) NOT NULL,`pWeap9` int(11) NOT NULL,`pAmmo9` int(11) NOT NULL,`pHour` int(11) NOT NULL,`pMin` int(11) NOT NULL,`pSec` int(11) NOT NULL,`pBlood` int(11) NOT NULL,`pThrist` int(11) NOT NULL,");
	strcat(querystr,"`pHunger` int(11) NOT NULL,`Humanity` int(11) NOT NULL,`pFirstSpawn` int(11) NOT NULL,`pAliveTime` int(11) NOT NULL,`pIsMapOpened` int(11) NOT NULL,`pSkin` int(11) NOT NULL,`Helper` int(11) NOT NULL,`IsPlayerBleeding` int(11) NOT NULL,");
  	strcat(querystr,"`IsPlayerLegBroken` int(11) NOT NULL,`pAmbientEnable` int(11) NOT NULL,`DefaultGender` int(11) NOT NULL, `IP` varchar(16) NOT NULL,`ID` int(11) NOT NULL)");

	mysql_tquery(handle, querystr, "", "");

	new querystr2[600];
	strcat(querystr2,"CREATE TABLE IF NOT EXISTS `statsglobal` (`gStatsID` int(11) NOT NULL,`gZombiesKilled` int(11) NOT NULL,`gBanditsKilled` int(11) NOT NULL,`gSurvivorsKilled` int(11) NOT NULL,");
	strcat(querystr2,"`gHerosKilled` int(11) NOT NULL,`gDeaths` int(11) NOT NULL,`gBulletsFired` int(11) NOT NULL,`gHoursPlayed` int(11) NOT NULL,`gAccounts` int(11) NOT NULL)");
	mysql_tquery(handle, querystr2, "", "");

	new querystr3[340];
	strcat(querystr3,"CREATE TABLE IF NOT EXISTS `samp_ban` (`BanID` int(6) NOT NULL,`user_banned` varchar(24) NOT NULL,`user_banned_ip` varchar(15) NOT NULL,`user_banner` varchar(24) NOT NULL,`ban_reason` varchar(40) NOT NULL,`ban_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,`ban_time` int(10) NOT NULL)");
    mysql_tquery(handle, querystr3, "", "");
	//CreateDynamicObject(18688, -2820.2588,-1530.7047,144.9823-1.47, 0.0, 0.0, 0.0, -1, -1, -1, 1000.0);
	//CreateDynamicObject(841, -2820.2588,-1530.7047,144.9823-0.7, 0.0, 0.0, 0.0, -1, -1, -1, 1000.0);

	new Zskins[] = {
	162,
 	78,
 	79,
  	230
	};

	CreateActor(Zskins[random(4)],198.9749,1891.7914,17.6481,85.7816);
	CreateActor(Zskins[random(4)],202.7016,1876.6431,17.6406,223.7221);
	CreateActor(Zskins[random(4)],227.6428,1875.3048,17.6406,303.6228);
	CreateActor(Zskins[random(4)],239.3173,1926.8015,17.6481,353.7566);
	CreateActor(Zskins[random(4)],212.8972,1921.6523,17.6406,94.0242);
	CreateActor(Zskins[random(4)],212.0003,1871.6669,13.1406,177.9983);
	CreateActor(Zskins[random(4)],162.8060,1917.6990,18.5509,62.0639);
	CreateActor(Zskins[random(4)],116.0383,1904.4347,18.6374,167.6582);
	CreateActor(Zskins[random(4)],93.4290,1925.2581,18.0490,35.7436);
	CreateActor(Zskins[random(4)],88.5337,1904.6166,17.7788,159.8248);
	CreateActor(Zskins[random(4)],53.4174,1892.1516,17.6406,94.0242);
	CreateActor(Zskins[random(4)],56.4878,1961.3083,17.6406,267.2759);
	CreateActor(Zskins[random(4)],132.1463,1948.3929,19.3742,251.6091);
	CreateActor(Zskins[random(4)],127.9250,1995.8269,19.4873,13.8102);
	CreateActor(Zskins[random(4)],158.0960,2036.4771,18.0470,346.2366);
	CreateActor(Zskins[random(4)],165.4146,2086.2070,21.8027,304.0088);
	CreateActor(Zskins[random(4)],215.6034,2039.2439,17.6406,251.6089);
	CreateActor(Zskins[random(4)],222.3624,1986.5726,17.6406,197.7152);
	CreateActor(Zskins[random(4)],273.4265,1972.4921,17.6406,274.7958);
	CreateActor(Zskins[random(4)],283.9616,1954.4507,17.6406,103.0875);
	CreateActor(Zskins[random(4)],295.0269,1925.9137,17.6406,213.3819);
	CreateActor(Zskins[random(4)],319.0655,1884.5758,17.6406,200.2218);
	CreateActor(Zskins[random(4)],314.4778,1816.7428,17.6406,234.0621);

    SetTimer("Airdrop", 480000, true);
	SetGameModeText(""Version" Loading");
	SendRconCommand("hostname "Name" Loading Variables!");
	SendRconCommand("language Zombies: 100");
	SendRconCommand("weburl "Web"");
	AddPlayerClass(29, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);

	startServer();
    Streamer_MaxItems(STREAMER_TYPE_OBJECT,100000);
	repeat CheckPlayerStatusZ();
	repeat UpdatePlayer();
	repeat UpdateServer();
	repeat FuelCheck();
	repeat RespawnGeneral();
	repeat UpdateWeather();
	SetWeatherEx(5);
	SetWorldTime(21);
    UsePlayerPedAnims();
   	ShowPlayerMarkers(0);
	ShowNameTags(0);
	SetNameTagDrawDistance(25.0);
	DisableInteriorEnterExits();
	EnableStuntBonusForAll(0);
	EnableStuntBonusForAll(0);
 	CreateBases();
 	DayZSA_CreateObject();
    CreateTDS();
	WeatherUpdate();
    GlobalResetVars();
    DisableNameTagLOS();
	return 1;
}

public OnActorSpawn(actorid)
{
    for(new i; i < actorid; i++)
	{
	    ApplyActorAnimation(actorid, "WUZI", "CS_Dead_Guy", 4.1, 0, 1, 1, 1, 0);
	    SetActorInvulnerable(actorid, true);
	}
	return 1;
}

function startServer()
{
	SetGameModeText("DayZ Zombie "Version"");
	SendRconCommand("hostname "Name"");
	SendRconCommand("weburl "Web"");
	SendRconCommand("password 0");
	printf("+---------------------------------+");
    printf("+---------------------------------+");
    printf("+---------------------------------+");
    printf("DayZSA "Version" Sucessfully Loaded!");
    printf("+---------------------------------+");
    printf("+---------------------------------+");
    printf("+---------------------------------+");
    DayZSA_CreateAllVehicles();
    DayZSA_CreateAllLoots();
    DayZSA_CreateVehicleStorage();
	return 1;
 	}

timer FuelCheck[30000]()
{
	foreach(Player,i)
	{
	    CheckVehicleStatusGlobal(i);
	}
	return 1;
}

timer RespawnGeneral[2700000]()
{
    DayZSA_RespawnItems();
    return 1;
}

timer UpdateWeather[1200000]()
{
	switch(random(5))
    {
        case 0: SetWeatherEx(3); // Sunny
        case 1: SetWeatherEx(7); // Cloudy
        case 2: SetWeatherEx(15); // Cloudy 2
        case 3: SetWeatherEx(8); // Rainy
        case 4: SetWeatherEx(9); // Foggy
    }
	return 1;
}

timer UpdateServer[1000]()
{
	if(PlayersAlive >= 1)
	{
		if(gettime() - 180 > ServerLimit[RandomMessage])
		{
			new randomMsg = random(sizeof(randomMessages));
			SendClientMessageToAll(-1, randomMessages[randomMsg]);
			ServerLimit[RandomMessage] = gettime();
		}

		if(gettime() - 60 > ServerLimit[TimeCheck])
		{
			ChangeServerTime();
			ServerLimit[TimeCheck] = gettime();
		}

/*		if(gettime() - 1800 > ServerLimit[WeatherCheck])
		{
			WeatherUpdate();
			ServerLimit[WeatherCheck] = gettime();
		}
*/

		if(gettime() - 108000 > ServerLimit[TentRespawn])
		{
			for(new iv2 = 0; iv2 < 500; iv2++)
		 	{
			    DestroyDynamicObject(Tent[iv2][TentID]);
			    DestroyDynamic3DTextLabel(Tent[iv2][tentText]);
   				Tent[iv2][xTent] = 0.0;
				Tent[iv2][yTent] = 0.0;
				Tent[iv2][zTent] = 0.0;
				tentCount = 0;
			}

			foreach(Player,i)
			{
			   	if(!IsPlayerNPC(i))
   				{
					PlayerLabel[i] = CreateDynamic3DTextLabel("" , 0xADFF2FAA, 0.0, 0.0, 0.2, 15.0, i, INVALID_VEHICLE_ID, 1, -1, -1, -1, 100.0);
				}
			}

			ServerLimit[TentRespawn] = gettime();
		}

  		for(new iv = 0; iv < MAX_VEHICLES; iv++)
	    {
	        GetVehiclePos(iv, x2d, y2d, z2d);

	        vInfo[iv][vX] = x2d;
	        vInfo[iv][vY] = y2d;
	        vInfo[iv][vZ] = z2d;
		}
	}
	return 1;
}

timer UpdatePlayer[1000]()
{
	if(PlayersAlive >= 1)
	{
		foreach(Player,i)
		{
		    if(!IsPlayerNPC(i))
		    {
		        if(isPlayerInMenu[i] == 0)
		        {
				    if(pInfo[i][pLogged] == 1)
				    {
				        if(pInfo[i][IsPlayerSpawned] == 1)
				        {
				            SetPlayerHealth(i,100.0);
				    		CheckBars(i);
				    		DecreaseBars(i);
				            pInfo[i][pAliveTime]++;
				            UpdatePlayer3DName(i);

		                    if(IsSpecing[i] == 0)
		                    {
								format(strupdate,sizeof(strupdate),"Zombies Killed: %i~n~Headshots: %i~n~Murders: %i~n~Bandits Killed: %i~n~Blood: %i~n~Zombies: %i~n~Temperature: %0.2f F~n~Alive Time: %s~n~Name: %s",
								pInfo[i][ZombiesKilled],pInfo[i][Headshots],pInfo[i][Murders],pInfo[i][BanditsKilled],pInfo[i][pBlood],ZombiesAlive,pInfo[i][pTemp],TimeConvert(pInfo[i][pAliveTime]),PlayerName(i));
		                        format(strwep, sizeof(strwep), "%s / %i Ammo", DayZSA_GetWeaponName(i),GetPlayerAmmo(i));
								PlayerTextDrawSetString(i,DebugInfo[i],strupdate);
								PlayerTextDrawSetString(i,Debug_GunInfo[i],strwep);
							}
							else
							{
								format(strupdate,sizeof(strupdate),"Zombies Killed: %i~n~Headshots: %i~n~Murders: %i~n~Bandits Killed: %i~n~Zombies: %i~n~Temperature: %0.2f F~n~Alive Time: %s~n~Name: %s",
								pInfo[spectatorid[i]][ZombiesKilled],pInfo[spectatorid[i]][Headshots],pInfo[spectatorid[i]][Murders],pInfo[spectatorid[i]][BanditsKilled],ZombiesAlive,pInfo[spectatorid[i]][pTemp],TimeConvert(pInfo[spectatorid[i]][pAliveTime]),PlayerName(spectatorid[i]));
								format(strwep, sizeof(strwep), "%s / %i Ammo", DayZSA_GetWeaponName(spectatorid[i]),GetPlayerAmmo(spectatorid[i]));
								PlayerTextDrawSetString(i,DebugInfo[i],strupdate);
								PlayerTextDrawSetString(i,Debug_GunInfo[i],strwep);
								//format(strupdate,sizeof(strupdate),"Zombies Killed: %i~n~Headshots: %i~n~Murders: %i~n~Bandits Killed: %i~n~Blood: %i~n~Zombies Alive: %i(%i)~n~Temperature: %0.2f F~n~Alive Time: %s~n~Wep: %s / %i AMMO~n~Name: %s",
								//pInfo[spectatorid[i]][ZombiesKilled], pInfo[spectatorid[i]][Headshots],pInfo[spectatorid[i]][Murders],pInfo[spectatorid[i]][BanditsKilled],pInfo[spectatorid[i]][pBlood],ZombiesAlive,ZombieMax,pInfo[spectatorid[i]][pTemp],TimeConvert(pInfo[spectatorid[i]][pAliveTime]),DayZSA_GetWeaponName(i),GetPlayerAmmo(i),PlayerName(i));
							}


			                UpdateVehicleStatus(i);
		   					ChangeTextdrawColor(i);
			                UpdateVehicleParts(i);
			                StartVehicle(i);
			                CheckPlayerColor(i);

			                if(GetPlayerPing(i) >= 850)
			                {
			                    SendClientMessage(i, -1, ""chat""COL_RED" You have been kicked. Reason: High Ping Over 850");
			                    KickEx(i);
							}

			                if(pInfo[i][pTemp] >= 87.0)
			                {
			                    pInfo[i][pTemp] = 87.0;
							}

							if(IsPlayerInWater(i))
							{
								pInfo[i][pTemp] -= 0.9;
							}

		     				if(IsPlayerInRangeOfPoint(i,3.5,CampFire[GetCampID(i)][xTent],CampFire[GetCampID(i)][yTent],CampFire[GetCampID(i)][zTent]))
							{
							    if(!IsPlayerMoving(i))
							    {
							    	switch(random(20))
							    	{
										case 2: pInfo[i][pTemp] += 4.0;
										case 8: pInfo[i][pTemp] += 2.1;
									}
								}
							}

							if(pInfo[i][pTemp] <= -00.0)
							{
							    new str2[180];
		     					pInfo[i][pInfection] = 0;
		     					pInfo[i][pTemp] = 100.0;
								format(str2,sizeof(str2),"*"COL_RED" %s(%i) has freezed to death!",PlayerName(i),i);
								ProxDetector(60.0, i, str2, COLOR_GREY);
								SendClientMessage(i,-1,"*"COL_RED" You freezed to death!");
							    SetPlayerHealth(i, 0.0);
							}

							if(IsPlayerInAnyVehicle(i))
							{
								switch(random(40))
		   						{
		    						case 5: pInfo[i][pTemp] += 0.2;
		    						case 10: pInfo[i][pTemp] += 0.3;
		   							case 15: pInfo[i][pTemp] += 0.1;
								}
							}

							if(GetPlayerAnimationIndex(i))
							{
							    new animname[32], animlib[32];
								GetAnimationName(GetPlayerAnimationIndex(i), animlib, sizeof(animlib), animname, sizeof(animname));
			                    if(!strcmp(animname, "IDLE_stance", true) || !strcmp(animname, "IDLE_armed", true) || !strcmp(animname, "IDLE_tired", true))
			                    {
			                        // N / A
								}
								else
								{
									new hour,minute,second;
									gettime(hour,minute,second);
									if(hour < 8 || hour > 21)
									{
										if(IsPlayerMoving(i))
										{
										    switch(random(600))
										    {
					                        	case 50: pInfo[i][pTemp] += 0.1;
					                        	case 12: pInfo[i][pTemp] += 0.4;
					                        	case 16: pInfo[i][pTemp] += 0.6;
					                        	case 200: pInfo[i][pTemp] += 0.5;
					                        	case 1: pInfo[i][pTemp] += 0.6;
					                        	case 7: pInfo[i][pTemp] += 0.7;
					                        	case 170: pInfo[i][pTemp] += 0.5;
											}
										}
									}

									if(hour < 0 || hour > 7)
									{
										if(IsPlayerMoving(i))
										{
										    switch(random(200))
										    {
					                        	case 50: pInfo[i][pTemp] -= 0.9;
					                        	case 12: pInfo[i][pTemp] -= 2.1;
					                        	case 16: pInfo[i][pTemp] -= 5.1;
					                        	case 200: pInfo[i][pTemp] -= 1.3;
					                        	case 1: pInfo[i][pTemp] -= 0.9;
					                        	case 7: pInfo[i][pTemp] -= 3.1;
					                        	case 170: pInfo[i][pTemp] -= 2.1;
											}
										}
									}

									if(GetWeather() == 8 || GetWeather() == 16 || GetWeather() == 9 || GetWeather() == 32)
									{
										if(IsPlayerMoving(i))
										{
										    switch(random(250))
										    {
					                        	case 50: pInfo[i][pTemp] -= 0.9;
					                        	case 12: pInfo[i][pTemp] -= 1.2;
					                        	case 16: pInfo[i][pTemp] -= 1.8;
					                        	case 80: pInfo[i][pTemp] -= 1.2;
											}
										}
									}
									else
									{
										if(IsPlayerMoving(i))
										{
										    switch(random(49))
										    {
					                        	case 3: pInfo[i][pTemp] += 0.4;
					                        	case 9: pInfo[i][pTemp] += 0.2;
					                        	case 10: pInfo[i][pTemp] += 0.2;
					                        	case 26: pInfo[i][pTemp] += 0.3;
					                        	case 48: pInfo[i][pTemp] += 0.5;
											}
										}
									}
								}
							}

							if(pInfo[i][pBlood] <= 8000)
							{
								if(pInfo[i][pFade] == 0)
								{
							    	PlayerTextDrawShow(i, PlayerFade[i]);
									pInfo[i][pFade] = 1;
								}
							}

			                if(PlayerHasItem(i,"None"))
							{
			    				RemoveSlotToInventory(i,"None",1);
							}

							if(PlayerHasItem(i,"Empty Slot"))
							{
								RemoveSlotToInventory(i,"Empty Slot",1);
							}

							if(PlayerHasItem(i,"0\tEmpty Slot"))
							{
								RemoveSlotToInventory(i,"0\tEmpty Slot",1);
							}

							if(PlayerHasItem(i,"mpty Slot"))
							{
								RemoveSlotToInventory(i,"mpty Slot",1);
							}

			  				if(GetPlayerMoney(i) >= 1)
			  				{
								jBan(i, -1, "Money Hack", 0);
							}

							if(GetPlayerSpecialAction(i) == SPECIAL_ACTION_USEJETPACK)
							{
								jBan(i, -1, "Jetpack Hack", 0);
							}

							new Float:armor;
							GetPlayerArmour(i,armor);
							if(armor > 1)
							{
								jBan(i, -1, "Armour Hack", 0);
							}

							if(PlayerHasItem(i,"Coyote Patrol Pack"))
							{
								SendClientMessage(i,-1,"*"COL_RED" You already have an larger backpack!");
								RemoveSlotToInventory(i,"Coyote Patrol Pack",1);
							}

					        if(PlayerHasItem(i,"Czech Vest Pouch"))
							{
							    if(pInfo[i][BackpackSlots] >= 28)
							    {
									SendClientMessage(i,-1,"*"COL_RED" You already have an larger backpack!");
									RemoveSlotToInventory(i,"Czech Vest Pouch",1);
								}
								else
								{
							    	RemovePlayerAttachedObject(i, 1);
							    	pInfo[i][Backpack] = 1;
							    	pInfo[i][BackpackSlots] = 16;
							    	SetPlayerAttachedObject( i, 1, 371, 1, 0.000000, -0.100000, 0.000000, 3.000000, 90.000000, 1.000000, 1.000000, 1.000000, 1.000000);
							    	RemoveSlotToInventory(i,"Czech Vest Pouch",1);
		   							if(!IsPlayerInAnyVehicle(i))
									{
										ApplyAnimation(i, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
										defer ResetAction(i, ACTION_ANIMATION);
									}
								}
							}

							if(PlayerHasItem(i,"Alice Pack"))
							{
							    if(pInfo[i][BackpackSlots] >= 38)
							    {
									SendClientMessage(i,-1,"*"COL_RED" You already have an larger backpack!");
									RemoveSlotToInventory(i,"Alice Pack",1);
								}
								else
								{
									RemovePlayerAttachedObject(i, 1);
									pInfo[i][Backpack] = 2;
									pInfo[i][BackpackSlots] = 28;
									SetPlayerAttachedObject( i, 1, 1310, 1, 0.000000, -0.100000, 0.000000, 3.000000, 90.000000, 1.000000, 1.000000, 1.000000, 1.000000 );
									RemoveSlotToInventory(i,"Alice Pack",1);
	 								if(!IsPlayerInAnyVehicle(i))
									{
										ApplyAnimation(i, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
										defer ResetAction(i, ACTION_ANIMATION);
									}
								}
							}

							if(PlayerHasItem(i,"Coyote Backpack"))
							{
								RemovePlayerAttachedObject(i, 1);
								pInfo[i][Backpack] = 3;
								pInfo[i][BackpackSlots] = 38;
								SetPlayerAttachedObject( i, 1, 1550, 1, 0.200000, -0.200000, 0.000000, 0.000000, 85.000000, 0.000000, 1.000000, 1.000000, 1.000000 );
								RemoveSlotToInventory(i,"Coyote Backpack",1);
			    				if(!IsPlayerInAnyVehicle(i))
								{
									ApplyAnimation(i, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
									defer ResetAction(i, ACTION_ANIMATION);
								}
							}

							if(IsPlayerInWater(i))
							{
								pInfo[i][pHunger]--;
								pInfo[i][pThrist]--;

								if(PlayerHasItem(i,"Empty Water Bottle"))
								{
									RemoveSlotToInventory(i,"Empty Water Bottle",1);
									AddSlotToInventoryWorld(i,"Full Water Bottle",1);
								}

								DayZSA_SetPlayerNoiseLevel(i,4);
								DayZSA_SetPlayerEyeLevel(i,2);
							}

						    new animname[32], animlib[32];

						    GetAnimationName(GetPlayerAnimationIndex(i), animlib, sizeof(animlib), animname, sizeof(animname));
						    if (!strcmp(animname, "SWIM_CRAWL", true) && !IsPlayerInAnyVehicle(i))
						    {
						        new Float:velocityX, Float:velocityY, Float:velocityZ, Float:speed;
						        GetPlayerVelocity(i, velocityX, velocityY, velocityZ);
						        speed = floatsqroot((velocityX * velocityX) + (velocityY * velocityY) + (velocityZ * velocityZ) * 100);
						        if (floatround(speed, floatround_round) >= 3)
						        {
								jBan(i, -1, "Fly Hack", 0);
						        }
					    	}

							if(GetPlayerAnimationIndex(i))
							{
						    	GetAnimationName(GetPlayerAnimationIndex(i), animlib, sizeof(animlib), animname, sizeof(animname));
						    	if(!strcmp(animlib, "PARACHUTE", true) && !strcmp(animname, "FALL_SkyDive_Accel", true))
						    	{
						    	    if(GetPlayerWeapon(i) != 46)
						    	    {
										jBan(i, -1, "Fly Hack", 0);
									}
								}
							}

							if(GetPlayerState(i) == PLAYER_STATE_DRIVER)
					  		{
					    		new vehicleid = GetPlayerVehicleID(i);
								if(DayZSA_GetVehicleSpeed(vehicleid) > MAX_SPEED)
					   			{
					      			if(GetVehicleModel(vehicleid) != 487)
					         		{
					           			new Float:vehicleVelocity[3];
					              		GetVehicleVelocity(vehicleid, vehicleVelocity[0], vehicleVelocity[1], vehicleVelocity[2]);
					                	if(vehicleVelocity[2] > -0.5)
					                 	{
											jBan(i, -1, "Veicle Speed Hack", 0);
										}
									}
								}
							}

							if(GetPlayerState(i) == PLAYER_STATE_PASSENGER || GetPlayerState(i) == PLAYER_STATE_DRIVER)
							{
							    SetPlayerArmedWeapon(i,0);
							}

							if(pInfo[i][pTemp] <= 36.0)
							{
							    if(pInfo[i][pInfection] == 0)
							    {
									switch(random(800))
									{
									    case 257: pInfo[i][pInfection] = 1;
									    case 183: pInfo[i][pInfection] = 1;
									    case 751: pInfo[i][pInfection] = 1;
									    case 521: pInfo[i][pInfection] = 1;
									}
								}
							}
						}
					}
				}
			}
		}
	}
	return 1;
}

public OnGameModeExit()
{
    DeleteTDS();

    for(new i; i < MAX_PLAYERS; i ++)
    {
    	if(IsPlayerAttachedObjectSlotUsed(i, 1)) RemovePlayerAttachedObject(i, 1);
	}

	for (new i = 0; i < FCNPC_MAX_NODES; i++) {
		if (FCNPC_IsNodeOpen(i)) {
			FCNPC_CloseNode(i);
		}
	}

    for(new i = 0; i < MAX_LOOTING; i++)
    {
        DestroyAllDynamicObjects();
   		DestroyDynamicObject(Loot[i][LootID]);
		DestroyDynamic3DTextLabel(Loot[i][TextID]);
	 	Loot[i][LootID] = 0;
		Loot[i][xLoot] = 0.0;
		Loot[i][yLoot] = 0.0;
		Loot[i][zLoot] = 0.0;
		Loot[i][xLootdrop] = 0.0;
		Loot[i][yLootdrop] = 0.0;
		Loot[i][zLootdrop] = 0.0;
		Loot[i][zLootDeadBodyX] = 0.0;
		Loot[i][zLootDeadBodyY] = 0.0;
		Loot[i][zLootDeadBodyZ] = 0.0;
		DestroyDynamic3DTextLabel(PlayerLabel[i]);

	}
	return 1;
}

public OnPlayerTakeDamage(playerid, issuerid, Float: amount, weaponid)
{
    if(issuerid != INVALID_PLAYER_ID && IsPlayerNPC(issuerid))
    {
        if(weaponid == 1)
        {
			pInfo[playerid][pBlood] -= random(3500);
        }
    }

    if(issuerid != INVALID_PLAYER_ID)
    {
	    if(timerdamage[playerid] != 0) KillTimer(timerdamage[playerid]);

	    hit[playerid]++;
	    damage2[playerid] += amount;

	    timerdamage[playerid] = SetTimerEx("DamageReset", 3000, 0, "i", playerid);

	    PlayerTextDrawShow(playerid, IndicatorBox[playerid]);
	    PlayerTextDrawShow(playerid, Indicator[playerid]);

	    new str[50];
	    format(str,sizeof(str),"HIT: %d hit(s) %.0f dmg", hit[playerid], damage2[playerid]);
	    PlayerTextDrawSetString(playerid, Indicator[playerid], str);
	}
	{
	new Float:hp;GetPlayerHealth(playerid,hp);
	if(IsPlayerNPC(issuerid))
	{
		SetPlayerHealth(playerid,hp-random(30));
	}

    if(issuerid != INVALID_PLAYER_ID)
    {
    	if(weaponid != 0)
		{
			FadePlayerScreen(playerid);

			if(IsPlayerAimingTargetBodyPart(issuerid, playerid, BODY_PART_LEGS) || IsPlayerAimingTargetBodyPart(playerid, playerid, BODY_PART_LEGS))
			{
			    if(pInfo[playerid][IsPlayerLegBroken] == 0)
			    {
			        pInfo[playerid][IsPlayerLegBroken] = 1;
			        PlayerTextDrawShow(playerid, LegBroken[playerid]);
				}
			}

			if(pInfo[issuerid][pPremium] >= 4)
			{
				if(weaponid == 25)
				{
			  		new Float:px, Float:py,Float:pz,Float:ix,Float:iy,Float:iz;
				    GetPlayerPos(playerid, px, py, pz);
				    GetPlayerPos(issuerid, ix, iy, iz);
				    new Float:h = GetPlayerDistanceFromPoint(issuerid, px, py, pz),Float:c1 = py - iy,Float:c2 = px - ix;
					new Float:vx = c2 / h,Float:vy = c1 / h;
				    SetPlayerVelocity(playerid, 0.35 * vx, 0.35 * vy, 0.1);
				    ApplyAnimation(playerid, "PED", "FALL_back", 4.0, 0, 1, 1, 1, 0, 1);
				    defer GetUp(playerid);
				}
			}
		}
	}

	if(issuerid == INVALID_PLAYER_ID)
	{
	    FadePlayerScreen(playerid);
		if(pInfo[playerid][pPremium] >= 3)
		{
		    switch(random(3))
		    {
		        case 1:
		        {
      				switch(random(14))
					{
						case 0: pInfo[playerid][pBlood] -= random(4000);
						case 1: if(pInfo[playerid][IsPlayerBleeding] == 0) { pInfo[playerid][pBlood] -= random(4000), KillTimer(pInfo[playerid][Bleeding]), RemovePlayerAttachedObject(playerid, 2),pInfo[playerid][Bleeding] = SetTimerEx("LoosingBlood",2500,1,"i",playerid),pInfo[playerid][IsPlayerBleeding] = 1; } // Loosing blood ever 2.5 seconds!
						case 2: pInfo[playerid][pBlood] -= random(4000);
						case 3: if(pInfo[playerid][IsPlayerBleeding] == 0) { pInfo[playerid][pBlood] -= random(4000), KillTimer(pInfo[playerid][Bleeding]), RemovePlayerAttachedObject(playerid, 2),pInfo[playerid][Bleeding] = SetTimerEx("LoosingBlood",1000,1,"i",playerid),pInfo[playerid][IsPlayerBleeding] = 1; } // Loosing blood ever 1 second!
						case 4: pInfo[playerid][pBlood] -= random(4000);
						case 5: pInfo[playerid][pBlood] -= random(4000);
						case 6: if(pInfo[playerid][IsPlayerBleeding] == 0) { pInfo[playerid][pBlood] -= random(4000), KillTimer(pInfo[playerid][Bleeding]), RemovePlayerAttachedObject(playerid, 2),pInfo[playerid][Bleeding] = SetTimerEx("LoosingBlood",5000,1,"i",playerid),pInfo[playerid][IsPlayerBleeding] = 1; } // Loosing blood ever 5 seconds!
						case 7: pInfo[playerid][pBlood] -= random(4000);
						case 8: if(pInfo[playerid][IsPlayerBleeding] == 0) { pInfo[playerid][pBlood] -= random(4000), KillTimer(pInfo[playerid][Bleeding]), RemovePlayerAttachedObject(playerid, 2),pInfo[playerid][Bleeding] = SetTimerEx("LoosingBlood",10000,1,"i",playerid),pInfo[playerid][IsPlayerBleeding] = 1; } // Loosing blood ever 10 seconds!
						case 9: pInfo[playerid][pBlood] -= random(4000);
						case 10: if(pInfo[playerid][IsPlayerBleeding] == 0) { pInfo[playerid][pBlood] -= random(4000), KillTimer(pInfo[playerid][Bleeding]), RemovePlayerAttachedObject(playerid, 2),pInfo[playerid][Bleeding] = SetTimerEx("LoosingBlood",5500,1,"i",playerid),pInfo[playerid][IsPlayerBleeding] = 1; } // Loosing blood ever 5.5 seconds!
						case 11: pInfo[playerid][pBlood] -= random(4000);
						case 12: if(pInfo[playerid][IsPlayerBleeding] == 0) { pInfo[playerid][pBlood] -= random(4000), KillTimer(pInfo[playerid][Bleeding]), RemovePlayerAttachedObject(playerid, 2),pInfo[playerid][Bleeding] = SetTimerEx("LoosingBlood",25000,1,"i",playerid),pInfo[playerid][IsPlayerBleeding] = 1; } // Loosing blood ever 25 seconds!
						case 13: pInfo[playerid][pBlood] -= random(4000);
					}
				}
			}
		}
		else
		{
			switch(random(14))
			{
				case 0: pInfo[playerid][pBlood] -= random(4000);
				case 1: if(pInfo[playerid][IsPlayerBleeding] == 0) { pInfo[playerid][pBlood] -= random(4000), KillTimer(pInfo[playerid][Bleeding]), RemovePlayerAttachedObject(playerid, 2),pInfo[playerid][Bleeding] = SetTimerEx("LoosingBlood",2500,1,"i",playerid),pInfo[playerid][IsPlayerBleeding] = 1; } // Loosing blood ever 2.5 seconds!
				case 2: pInfo[playerid][pBlood] -= random(4000);
				case 3: if(pInfo[playerid][IsPlayerBleeding] == 0) { pInfo[playerid][pBlood] -= random(4000), KillTimer(pInfo[playerid][Bleeding]), RemovePlayerAttachedObject(playerid, 2),pInfo[playerid][Bleeding] = SetTimerEx("LoosingBlood",1000,1,"i",playerid),pInfo[playerid][IsPlayerBleeding] = 1; } // Loosing blood ever 1 second!
				case 4: pInfo[playerid][pBlood] -= random(4000);
				case 5: pInfo[playerid][pBlood] -= random(4000);
				case 6: if(pInfo[playerid][IsPlayerBleeding] == 0) { pInfo[playerid][pBlood] -= random(4000), KillTimer(pInfo[playerid][Bleeding]), RemovePlayerAttachedObject(playerid, 2),pInfo[playerid][Bleeding] = SetTimerEx("LoosingBlood",5000,1,"i",playerid),pInfo[playerid][IsPlayerBleeding] = 1; } // Loosing blood ever 5 seconds!
				case 7: pInfo[playerid][pBlood] -= random(4000);
				case 8: if(pInfo[playerid][IsPlayerBleeding] == 0) { pInfo[playerid][pBlood] -= random(4000), KillTimer(pInfo[playerid][Bleeding]), RemovePlayerAttachedObject(playerid, 2),pInfo[playerid][Bleeding] = SetTimerEx("LoosingBlood",10000,1,"i",playerid),pInfo[playerid][IsPlayerBleeding] = 1; } // Loosing blood ever 10 seconds!
				case 9: pInfo[playerid][pBlood] -= random(4000);
				case 10: if(pInfo[playerid][IsPlayerBleeding] == 0) { pInfo[playerid][pBlood] -= random(4000), KillTimer(pInfo[playerid][Bleeding]), RemovePlayerAttachedObject(playerid, 2),pInfo[playerid][Bleeding] = SetTimerEx("LoosingBlood",5500,1,"i",playerid),pInfo[playerid][IsPlayerBleeding] = 1; } // Loosing blood ever 5.5 seconds!
				case 11: pInfo[playerid][pBlood] -= random(4000);
				case 12: if(pInfo[playerid][IsPlayerBleeding] == 0) { pInfo[playerid][pBlood] -= random(4000), KillTimer(pInfo[playerid][Bleeding]), RemovePlayerAttachedObject(playerid, 2),pInfo[playerid][Bleeding] = SetTimerEx("LoosingBlood",25000,1,"i",playerid),pInfo[playerid][IsPlayerBleeding] = 1; } // Loosing blood ever 25 seconds!
				case 13: pInfo[playerid][pBlood] -= random(4000);
			}
		}
	}
}
	return 1;
}

public OnPlayerGiveDamage(playerid, damagedid, Float: amount, weaponid, bodypart)
{
	if(timerdamage1[playerid] != 0) KillTimer(timerdamage1[playerid]);

	hit1[playerid]++;
	damage1[playerid] += amount;

	timerdamage1[playerid] = SetTimerEx("DamageReset1", 3000, 0, "i", playerid);

	PlayerTextDrawShow(playerid, IndicatorBox1[playerid]);
	PlayerTextDrawShow(playerid, Indicator1[playerid]);

	new str[50];
	format(str,sizeof(str)," DAMAGE: %d hit(s) %.0f dmg", hit1[playerid], damage1[playerid]);
	PlayerTextDrawSetString(playerid, Indicator1[playerid], str);


    if(damagedid != INVALID_PLAYER_ID)
	{
	    if(weaponid != 0)
		{
			if(weaponid == 25)
			{
				pInfo[damagedid][pBlood] -= 4500;
				pInfo[damagedid][pTemp] -= 5.0;
			}

			if(weaponid == 30)
			{
				pInfo[damagedid][pBlood] -= 2722;
				pInfo[damagedid][pTemp] -= 6.0;
			}

			if(weaponid == 31)
			{
				pInfo[damagedid][pBlood] -= 3555;
				pInfo[damagedid][pTemp] -= 6.0;
			}

			if(weaponid == 34)
			{
				pInfo[damagedid][pBlood] -= 8000;
				pInfo[damagedid][pTemp] -= 11.0;
			}

			if(weaponid == 33)
			{
				pInfo[damagedid][pBlood] -= 4500;
				pInfo[damagedid][pTemp] -= 7.0;
			}

			if(weaponid == 22)
			{
    			if(pInfo[playerid][pPremium] >= 3)
			    {
                    pInfo[damagedid][pBlood] -= 889;
				}
				else if(pInfo[playerid][pPremium] == 0)
				{
					pInfo[damagedid][pBlood] -= 1500;
				}
				pInfo[damagedid][pTemp] -= 3.0;
			}

			if(weaponid == 27)
			{
				pInfo[damagedid][pBlood] -= 4500;
                pInfo[damagedid][pTemp] -= 3.0;
			}

			if(weaponid == 29)
			{
				pInfo[damagedid][pBlood] -= 889;
				pInfo[damagedid][pTemp] -= 2.0;
			}

			if(weaponid == 5)
			{
				pInfo[damagedid][pBlood] -= 560;
				pInfo[damagedid][pTemp] -= 5.0;
			}

			if(weaponid == 8)
			{
			    if(pInfo[playerid][pPremium] >= 3)
			    {
                    pInfo[damagedid][pBlood] -= 1650;
				}
				else if(pInfo[playerid][pPremium] == 0)
				{
					pInfo[damagedid][pBlood] -= 800;
				}
				pInfo[damagedid][pTemp] -= 8.0;
			}

			if(weaponid == 23)
			{
				pInfo[damagedid][pBlood] -= 1500;
				pInfo[damagedid][pTemp] -= 6.0;
			}
			if(IsPlayerConnected(playerid)) PlayerPlaySound(playerid, 17802, 0.0, 0.0, 0.0);
		}
	}
	return 1;
}

timer GetUp[1000](playerid)
{
    ApplyAnimation(playerid, "PED", "getup", 4.0, 0, 1, 1, 0, 0, 1);
}

public OnPlayerRequestClass(playerid, classid)
{
    if(IsPlayerNPC(playerid)) {
        return 1;
    }
    TogglePlayerSpectating(playerid,1);
	SetPlayerPos_Allow(playerid, 2372.0027,2243.0608,10.8203);
	SetPlayerFacingAngle(playerid,119.5071);
	SetPlayerCameraPos(playerid, 2365.5837,2238.2991,12.9480);
	SetPlayerCameraLookAt(playerid, 2372.0027,2243.0608,10.8203);
	return 1;
}
public OnPlayerRequestSpawn(playerid)
{
    if(IsPlayerNPC(playerid))
    {
        return 1;
	}
	return 1;
}
forward DamageReset(playerid);
public DamageReset(playerid)
{
    hit[playerid] = 0;
    damage2[playerid] = 0;
    PlayerTextDrawHide(playerid, IndicatorBox[playerid]);
    PlayerTextDrawHide(playerid, Indicator[playerid]);
    KillTimer(timerdamage[playerid]);
    return 1;
}
forward DamageReset1(playerid);
public DamageReset1(playerid)
{
    hit1[playerid] = 0;
    damage1[playerid] = 0;
    PlayerTextDrawHide(playerid, IndicatorBox1[playerid]);
    PlayerTextDrawHide(playerid, Indicator1[playerid]);
    KillTimer(timerdamage1[playerid]);
    return 1;
}
forward OnNPCSpawn();
public OnNPCSpawn()
{
	print("NPC spawned");
	return 1;
}
public OnPlayerAirbreak(playerid)
{
	if(abAllow[playerid] == 0)
	{
	    if(!IsPlayerNPC(playerid))
	    {
			abWarn[playerid]++;
			new strab[250];
			format(strab, sizeof(strab), ""chat""COL_RED" *** WARNING: Player %s(%i) might be airbraking please spectate him! /spec %i", PlayerName(playerid), playerid, playerid);
			SendMessageToAllAdmins(strab, -1);
		}
	}
    return 1;
}

public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
	if(hittype != BULLET_HIT_TYPE_NONE)
  	{
		if(!(-200.0 <= fX <= 200.0 ) || !(-200.0 <= fY <= 200.0) || !(-200.0 <= fZ <= 200.0))
   		{
			return 0;
    	}
  	}

   	if( hittype != BULLET_HIT_TYPE_NONE )
	{
        if( !( -1000.0 <= fX <= 1000.0 ) || !( -1000.0 <= fY <= 1000.0 ) || !( -1000.0 <= fZ <= 1000.0 ) )
		{
		    new str[128];
			format(str, sizeof(str), "** "COL_RED"Possible Bullet Crasher: %s(%i) PLEASE /spec %i",PlayerName(playerid), playerid, playerid);
			SendMessageToAllAdmins(str, -1);
			return 0;
		}
	}
	return 1;
}
public OnPlayerWeaponEmpty(playerid, weaponid)
{
	new wepname[64];
	new Float:fPos[3];
	GetPlayerPos(playerid,fPos[0],fPos[1],fPos[2]);
	switch(GetPlayerWeapon(playerid))
	{
	    case 25: wepname = "Shotgun", SendClientMessage(playerid, -1, ""chat" You ran out ammo! Your weapon has been dropped"), DayZSA_CreateLootsFunction("Shotgun",fPos[0],fPos[1],fPos[2]);
	    case 30: wepname = "AK-47", SendClientMessage(playerid, -1, ""chat" You ran out ammo! Your weapon has been dropped"), DayZSA_CreateLootsFunction("AK-47",fPos[0],fPos[1],fPos[2]);
	    case 31: wepname = "M4", SendClientMessage(playerid, -1, ""chat" You ran out ammo! Your weapon has been dropped"), DayZSA_CreateLootsFunction("M4",fPos[0],fPos[1],fPos[2]);
	    case 34: wepname = "Sniper Rifle", SendClientMessage(playerid, -1, ""chat" You ran out ammo! Your weapon has been dropped"), DayZSA_CreateLootsFunction("Sniper Rifle",fPos[0],fPos[1],fPos[2]);
	    case 33: wepname = "Country Rifle", SendClientMessage(playerid, -1, ""chat" You ran out ammo! Your weapon has been dropped"), DayZSA_CreateLootsFunction("Country Rifle",fPos[0],fPos[1],fPos[2]);
	    case 22: wepname = "Pistol", SendClientMessage(playerid, -1, ""chat" You ran out ammo! Your weapon has been dropped"), DayZSA_CreateLootsFunction("Pistol",fPos[0],fPos[1],fPos[2]);
	    case 27: wepname = "SPAZ-12 Shotgun", SendClientMessage(playerid, -1, ""chat" You ran out ammo! Your weapon has been dropped"), DayZSA_CreateLootsFunction("SPAZ-12 Shotgun",fPos[0],fPos[1],fPos[2]);
	    case 29: wepname = "MP5", SendClientMessage(playerid, -1, ""chat" You ran out ammo! Your weapon has been dropped"), DayZSA_CreateLootsFunction("MP5",fPos[0],fPos[1],fPos[2]);
	    case 23: wepname = "Silenced Pistol", SendClientMessage(playerid, -1, ""chat" You ran out ammo! Your weapon has been dropped"), DayZSA_CreateLootsFunction("Silenced Pistol",fPos[0],fPos[1],fPos[2]);
	    case 43: wepname = "Binoculars", SendClientMessage(playerid, -1, ""chat" You ran out ammo! Your weapon has been dropped"), DayZSA_CreateLootsFunction("Binoculars",fPos[0],fPos[1],fPos[2]);
	}
	return 1;
}

public OnPlayerResume(playerid, time)
{
    new str[48];
    format(str, sizeof(str), ""chat" You've been paused for %d milliseconds.", time);
    return SendClientMessage(playerid, -1, str);
}

public OnPlayerConnect(playerid)
{
   	if(IsPlayerNPC(playerid)) {
        return 1;
	}
    if(!IsPlayerNPC(playerid))
	{
/*		if(playerid <= 99)
		{
		    SendClientMessage(playerid, -1, ""COL_RED" CONNECTION ERROR OCCURED CONNECTING TO DayZ Link to pGA PLEASE RECONNECT!");
		    Kick(playerid);
		}
		else
		{*/
  		PlayerLabel[playerid] = CreateDynamic3DTextLabel("" , 0xADFF2FAA, 0.0, 0.0, 0.2, 15.0, playerid, INVALID_VEHICLE_ID, 1, -1, -1, -1, 100.0);
   		PlayersAlive++;
   		CreatePlayerTD(playerid);
   		ConnectVars(playerid);
    	ClearChatPlayer(playerid);
    	ResetVars(playerid);
    	CheckVersion(playerid);
		SetPlayerTeam(playerid, 0);
   	}
	return 1;
}

public WhenAccountCheck(playerid, password[])
{
    new rows, fields;
    cache_get_data(rows, fields, handle);

 	if(rows)
	{
		gRegistred[playerid] = 1;
  	}
  	else
  	{
  	    gRegistred[playerid] = 0;
	}

  	if(pInfo[playerid][pLogged] == 0)
	{
	    if(gRegistred[playerid] == 1)
	    {
			if(rows)
			{
			    new string[256];

	         	format(string,sizeof(string),"{BECBFC}Welcome, {95A3FF}%s{BECBFC}!\nPlease enter your password below to login to your account.",PlayerName(playerid));
				ShowPlayerDialog(playerid, DIALOG_LOGIN ,DIALOG_STYLE_PASSWORD,"DayZ Account Login",string,"Login","Exit");
   			}
     	}
     	else
     	{
     	    ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD, "DayZ Register", "DayZ Account Registration\nEnter your password below:", "Register", "Cancel");
   		}
	}

    SetPlayerCameraPos(playerid, 1500.7156,-1778.1880,80.3080);
	SetPlayerCameraLookAt(playerid, 1500.7156,-1778.1880,80.3080);
	SetPlayerPos_Allow(playerid, 1437.6957,-2266.6355,13.5469);
	return 1;
}

public OnPlayerRegister(playerid, password[])
{
    if(IsPlayerConnected(playerid))
	{
	    new Query[450],IP[16];
	    GetPlayerIp(playerid, IP, sizeof(IP));
		strcat(Query,"INSERT INTO `users` (Username,Password,IP) VALUES ('%s', sha1('%s'),'%s')");
		format(Query,sizeof(Query),Query,PlayerName(playerid),password,IP);
		mysql_tquery(handle, Query, "", "");
		printf("%s",Query);
		pInfo[playerid][pFirstSpawn] = 1;
		pInfo[playerid][pHunger] = 2500;
		pInfo[playerid][pThrist] = 1000;
		pInfo[playerid][pBlood] = 12000;
		pInfo[playerid][Humanity] = 2500;
		pInfo[playerid][Backpack] = 0;
		pInfo[playerid][BackpackSlots] = 8;
		pInfo[playerid][BackpackSlotsUsed] = 0;

		ShowPlayerDialog(playerid, DIALOG_LOGIN ,DIALOG_STYLE_PASSWORD, "DayZ Login", "Please enter your password below to login to your account.", "Login", "Exit");
	}
	return 1;
}

public OnPlayerAccountLogin(playerid, enteredPassword[])
{
    if(IsPlayerNPC(playerid)) return 1;
    {
        if(IsPlayerConnected(playerid))
        {
            new query[350];
            format(query, sizeof(query), "SELECT * FROM `users` WHERE `Username`= '%s' AND `Password` = SHA1('%s')", PlayerName(playerid), enteredPassword);
            mysql_tquery(handle, query, "WhenPlayerLogin", "i", playerid);
        }
    }
    return 1;
}
public WhenPlayerLogin(playerid)
{
    if(IsPlayerConnected(playerid))
	{
	    pInfo[playerid][pHunger] = 2500;
	 	pInfo[playerid][pThrist] = 1000;
	 	pInfo[playerid][pBlood] = 12000;
	 	pInfo[playerid][Humanity] = 2500;

	    new rows, fields;
	    new tmp[128];

	    cache_get_data(rows, fields, handle);

		if(rows != 0)
		{
		    cache_get_field_content(0, "Password", tmp),  format(pInfo[playerid][Password], 128, tmp);
		    cache_get_field_content(0, "Headshots", tmp), pInfo[playerid][Headshots] = strval(tmp);
           	cache_get_field_content(0, "Murders", tmp), pInfo[playerid][Murders] = strval(tmp);
	        cache_get_field_content(0, "BanditsKilled", tmp), pInfo[playerid][BanditsKilled] = strval(tmp);
	        cache_get_field_content(0, "ZombiesKilled", tmp), pInfo[playerid][ZombiesKilled] = strval(tmp);
		    cache_get_field_content(0, "Backpack", tmp), pInfo[playerid][Backpack] = strval(tmp);
           	cache_get_field_content(0, "BackpackSlots", tmp), pInfo[playerid][BackpackSlots] = strval(tmp);
	        cache_get_field_content(0, "BackpackSlotsUsed", tmp), pInfo[playerid][BackpackSlotsUsed] = strval(tmp);
	        cache_get_field_content(0, "pAdminLevel", tmp), pInfo[playerid][pAdminLevel] = strval(tmp);
	        cache_get_field_content(0, "pPremium", tmp), pInfo[playerid][pPremium] = strval(tmp);
	        cache_get_field_content(0, "pX", tmp), pInfo[playerid][pX] = strval(tmp);
	        cache_get_field_content(0, "pY", tmp), pInfo[playerid][pY] = strval(tmp);
	        cache_get_field_content(0, "pZ", tmp), pInfo[playerid][pZ] = strval(tmp);
	        cache_get_field_content(0, "pWeap1", tmp), pInfo[playerid][pWeap1] = strval(tmp);
	        cache_get_field_content(0, "pAmmo1", tmp), pInfo[playerid][pAmmo1] = strval(tmp);
	        cache_get_field_content(0, "pWeap2", tmp), pInfo[playerid][pWeap2] = strval(tmp);
	        cache_get_field_content(0, "pAmmo2", tmp), pInfo[playerid][pAmmo2] = strval(tmp);
	        cache_get_field_content(0, "pWeap3", tmp), pInfo[playerid][pWeap3] = strval(tmp);
	        cache_get_field_content(0, "pAmmo3", tmp), pInfo[playerid][pAmmo3] = strval(tmp);
	        cache_get_field_content(0, "pWeap4", tmp), pInfo[playerid][pWeap4] = strval(tmp);
	        cache_get_field_content(0, "pAmmo4", tmp), pInfo[playerid][pAmmo4] = strval(tmp);
	        cache_get_field_content(0, "pWeap5", tmp), pInfo[playerid][pWeap5] = strval(tmp);
	        cache_get_field_content(0, "pAmmo5", tmp), pInfo[playerid][pAmmo5] = strval(tmp);
	        cache_get_field_content(0, "pWeap6", tmp), pInfo[playerid][pWeap6] = strval(tmp);
	        cache_get_field_content(0, "pAmmo6", tmp), pInfo[playerid][pAmmo6] = strval(tmp);
	        cache_get_field_content(0, "pWeap7", tmp), pInfo[playerid][pWeap7] = strval(tmp);
	        cache_get_field_content(0, "pAmmo7", tmp), pInfo[playerid][pAmmo7] = strval(tmp);
	        cache_get_field_content(0, "pWeap8", tmp), pInfo[playerid][pWeap8] = strval(tmp);
	        cache_get_field_content(0, "pAmmo8", tmp), pInfo[playerid][pAmmo8] = strval(tmp);
	        cache_get_field_content(0, "pWeap9", tmp), pInfo[playerid][pWeap9] = strval(tmp);
	        cache_get_field_content(0, "pAmmo9", tmp), pInfo[playerid][pAmmo9] = strval(tmp);
			cache_get_field_content(0, "pHour", tmp), pInfo[playerid][pHour] = strval(tmp);
	        cache_get_field_content(0, "pMin", tmp), pInfo[playerid][pMin] = strval(tmp);
	        cache_get_field_content(0, "pSec", tmp), pInfo[playerid][pSec] = strval(tmp);
	        cache_get_field_content(0, "pBlood", tmp), pInfo[playerid][pBlood] = strval(tmp);
	        cache_get_field_content(0, "pThrist", tmp), pInfo[playerid][pThrist] = strval(tmp);
	        cache_get_field_content(0, "pHunger", tmp), pInfo[playerid][pHunger] = strval(tmp);
	        cache_get_field_content(0, "Humanity", tmp), pInfo[playerid][Humanity] = strval(tmp);
	        cache_get_field_content(0, "pFirstSpawn", tmp), pInfo[playerid][pFirstSpawn] = strval(tmp);
	        cache_get_field_content(0, "pAliveTime", tmp), pInfo[playerid][pAliveTime] = strval(tmp);
	        cache_get_field_content(0, "pIsMapOpened", tmp), pInfo[playerid][pIsMapOpened] = strval(tmp);
	        cache_get_field_content(0, "pSkin", tmp), pInfo[playerid][pSkin] = strval(tmp);
	        cache_get_field_content(0, "Helper", tmp), pInfo[playerid][Helper] = strval(tmp);
	        cache_get_field_content(0, "IsPlayerBleeding", tmp), pInfo[playerid][IsPlayerBleeding] = strval(tmp);
	        cache_get_field_content(0, "IsPlayerLegBroken", tmp), pInfo[playerid][IsPlayerLegBroken] = strval(tmp);
	        cache_get_field_content(0, "pAmbientEnable", tmp), pInfo[playerid][pAmbientEnable] = strval(tmp);
	        cache_get_field_content(0, "DefaultGender", tmp), pInfo[playerid][DefaultGender] = strval(tmp);
	        cache_get_field_content(0, "ID", tmp), pInfo[playerid][pUserID] = strval(tmp);

		}
		else
		{
			ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "DayZ Login", "The passwords don't match!\nType your account's password below:", "Login", "Exit");
	        return 1;
		}

		if(pInfo[playerid][pAmbientEnable] == 0)
		{
		    pInfo[playerid][pAmbientEnable] = 1;
		    SendClientMessage(playerid, -1, ""chat" The ambient has been enabled, you can change this by default in the GAME OPTIONS menu!");
		}

		printf("%s has logged in.", PlayerName(playerid));

		if(pInfo[playerid][pFirstSpawn] == 0)
		{
		    pInfo[playerid][pFirstSpawn] = 1;
		}

	    pInfo[playerid][pLogged] = 1;
	    ClearChatPlayer(playerid);

		LoadInventory(playerid);
		SetPlayerScore(playerid,pInfo[playerid][pHour]);
		DayZSA_ShowMenuForPlayer(playerid);
	}

	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{

	if(!IsPlayerNPC(playerid))
	{
	    if(pInfo[playerid][pLogged] == 1) { SaveStats(playerid); }
        DestroyDynamic3DTextLabel(PlayerLabel[playerid]);
 		PlayersAlive--;

 		/*if(pInfo[playerid][IsPlayerBleeding] == 1)
 		{
 		    jBan(playerid, -1, "Bleeding (Ban 5 Minutes)", 5);
 		}*/

  		ResetVars(playerid);
	    DisconnectVars(playerid);
        DeletePlayerTD(playerid);

  		new log[128];
	    format(log,sizeof(log),"~w~%s~b~ has disconnected",PlayerName(playerid));
	    UpdateAnnouncement(log);

		new str[256];
	  	switch(reason)
	    {
	        case 0: format(str,sizeof(str),"*"COL_GREEN" Player %s(%i) has left the server Reason: Timed Out",PlayerName(playerid),playerid);
	        case 1: format(str,sizeof(str),"*"COL_GREEN" Player %s(%i) has left the server Reason: Leaving",PlayerName(playerid),playerid);
	        case 2: format(str,sizeof(str),"*"COL_GREEN" Player %s(%i) has left the server Reason: Kicked/Banned",PlayerName(playerid),playerid);
	    }
		SendMessageToAllAdmins(str,-1);

     	if(IsBeingSpeced[playerid] == 1)
	    {
	        foreach(Player,i)
	        {
	            if(spectatorid[i] == playerid)
	            {
	                TogglePlayerSpectating(i,false);
	                giveWeaponAllow[i] = 1;
	            }
	        }
	    }
    }

	return 1;
}
public OnPlayerRapidFire(playerid, weaponid, intervals)
{
    if(OPRF_Processed[playerid] == true) return 0;
    new
    string[128],
    Lname[MAX_PLAYER_NAME];
    GetPlayerName(playerid, Lname, sizeof(Lname));
    format(string, sizeof(string), "AntiCheat : %s (ID:%d) is suspicious , please look! (Reason : Rapid Fire with weapon ID %d in %d milli seconds)", Lname, playerid, weaponid, intervals);
    SendMessageToAllAdmins(string, -1);
    OPRF_Processed[playerid] = true;
	return 0;
}
public OnPlayerEnterCheckpoint(playerid)
{
    return 1;
}

public OnPlayerSpawn(playerid)
{
	if(IsPlayerNPC(playerid))
	{

	    return 1;
	}
	else
	{

		PreloadAnimLib(playerid,"BOMBER"); PreloadAnimLib(playerid,"RAPPING");
		PreloadAnimLib(playerid,"SHOP"); PreloadAnimLib(playerid,"BEACH");
		PreloadAnimLib(playerid,"SMOKING"); PreloadAnimLib(playerid,"FOOD");
		PreloadAnimLib(playerid,"ON_LOOKERS"); PreloadAnimLib(playerid,"DEALER");
		PreloadAnimLib(playerid,"CRACK"); PreloadAnimLib(playerid,"CARRY");
		PreloadAnimLib(playerid,"COP_AMBIENT"); PreloadAnimLib(playerid,"PARK");
		PreloadAnimLib(playerid,"INT_HOUSE"); PreloadAnimLib(playerid,"PED");
		PreloadAnimLib(playerid,"MISC"); PreloadAnimLib(playerid,"OTB");
		PreloadAnimLib(playerid,"BD_Fire"); PreloadAnimLib(playerid,"BENCHPRESS");
		PreloadAnimLib(playerid,"KISSING"); PreloadAnimLib(playerid,"BSKTBALL");
		PreloadAnimLib(playerid,"MEDIC"); PreloadAnimLib(playerid,"SWORD");
		PreloadAnimLib(playerid,"POLICE"); PreloadAnimLib(playerid,"SUNBATHE");
		PreloadAnimLib(playerid,"FAT"); PreloadAnimLib(playerid,"WUZI");
		PreloadAnimLib(playerid,"SWEET"); PreloadAnimLib(playerid,"ROB_BANK");
		PreloadAnimLib(playerid,"GANGS"); PreloadAnimLib(playerid,"RIOT");
		PreloadAnimLib(playerid,"GYMNASIUM"); PreloadAnimLib(playerid,"CAR");
		PreloadAnimLib(playerid,"CAR_CHAT"); PreloadAnimLib(playerid,"GRAVEYARD");
		PreloadAnimLib(playerid,"POOL");

		if(isPlayerInMenu[playerid] == 0)
	 	{
	  		if(pInfo[playerid][pLogged] == 1)
	    	{
		    	SpawnVars(playerid);
	   			SendClientMessage(playerid, -1, ""chat" Zombies are now enabled");
				SetCameraBehindPlayer(playerid);
	 			GameTextForPlayer(playerid, "~w~loading spawn...", 2800, 4);
				SetPlayerColor(playerid,0xFFFFFF00);
				PlayerTextDrawHide(playerid, MenuLogo[playerid]);
				if(pInfo[playerid][pAmbientEnable] == 1)
				if(pInfo[playerid][pKidnapped] == 1)
	{
	    TogglePlayerControllable(playerid,0);
	    SendClientMessage(playerid,COLOR_RED,"WARNING: You are still tied with rope!");
	}
	  			{
					if(timeMode == DAY)
	  				{
	   					PlayAudioStreamForPlayer(playerid, "http://pgagaming.net/samp/dayz/dayz_ambient_day.mp3");
					}

					if(timeMode == NIGHT)
	  				{
	   					PlayAudioStreamForPlayer(playerid, "http://pgagaming.net/samp/dayz/dayz_ambient_night.mp3");
					}
				}
			}
		}
	}
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	if(killerid != INVALID_PLAYER_ID)
	{
	    if(!IsPlayerNPC(playerid))
	    {
			new name[24], kname[30], string[64];
			GetPlayerName(playerid, name, 24);
			GetPlayerName(killerid, kname, 30);
			format(string, sizeof(string), "%s Has been killed by %s", name,kname,reason);
			SendMessageToAllAdmins(string, -1);
		}
	}

    if(IsPlayerNPC(playerid))
	{

    }


	if(!IsPlayerNPC(killerid))
    {
	    if(killerid != INVALID_PLAYER_ID)
	    {
		    if(GetPlayerSkin(playerid) == BANDIT)
		    {
				pInfo[killerid][BanditsKilled]++;
				pInfo[killerid][Murders]++;
				pInfo[killerid][Humanity] += random(1000);

				if(pInfo[killerid][Humanity] >= 3000)
				{
				    if(pInfo[killerid][IsPlayerHero] == 0)
				    {
				 		SetPlayerSkin(killerid,HERO);
					    SendClientMessage(killerid,-1,""COL_GREY" You are a hero now!");
					    ClearAnimations(killerid);
		                pInfo[killerid][IsPlayerHero] = 1;
					}
				}
			}

		 	if(GetPlayerSkin(playerid) == NORMAL)
		    {
				pInfo[killerid][Murders]++;
				pInfo[killerid][Humanity] -= 650;

				if(pInfo[killerid][Humanity] <= 1500)
				{
				    if(pInfo[killerid][IsPlayerBandit] == 0)
				    {
			 			SetPlayerSkin(killerid,BANDIT);
				    	SendClientMessage(killerid,-1,""COL_GREY" You are a bandit now!");
				    	ClearAnimations(killerid);
						pInfo[killerid][IsPlayerBandit] = 1;
					}
				}
			}

			if(GetPlayerSkin(playerid) == FEMALE)
		    {
				pInfo[killerid][Murders]++;
				pInfo[killerid][Humanity] -= random(700);

				if(pInfo[killerid][Humanity] <= 1500)
				{
				    if(pInfo[killerid][IsPlayerBandit] == 0)
				    {
			 			SetPlayerSkin(killerid,BANDIT);
				    	SendClientMessage(killerid,-1,""COL_GREY" You are a bandit now!");
				    	ClearAnimations(killerid);
						pInfo[killerid][IsPlayerBandit] = 1;
					}
				}
			}

			if(GetPlayerSkin(playerid) == HERO)
		    {
				pInfo[killerid][Murders]++;
				pInfo[killerid][Humanity] -= random(700);

				if(pInfo[killerid][Humanity] <= 1500)
				{
				    if(pInfo[killerid][IsPlayerBandit] == 0)
				    {
			 			SetPlayerSkin(killerid,BANDIT);
				    	SendClientMessage(killerid,-1,""COL_GREY" You are a bandit now!");
				    	ClearAnimations(killerid);
						pInfo[killerid][IsPlayerBandit] = 1;
					}
				}
			}

		 	if(IsPlayerAimingTargetBodyPart(killerid, playerid, BODY_PART_HEAD))
			{
		  		GameTextForPlayer(killerid, "~r~~h~Head shot!", 3000, 3);
		  		pInfo[killerid][Headshots]++;
			}
		}
	}

	if(!IsPlayerNPC(playerid))
    {
		TeleportAllowed[playerid] = 1;
		abAllow[playerid] = 1;
		new str[128];
		format(str,sizeof(str),"%s is now~r~ dead!",PlayerName(playerid));
		UpdateAnnouncement(str);

		new Float:fPos[3];
		GetPlayerPos(playerid,fPos[0],fPos[1],fPos[2]);
	    DayZSA_CreateLootsDeadBody(playerid,fPos[0],fPos[1],fPos[2]);

        PlayerTextDrawHide(playerid, vehicleInfo[playerid]);
       	PlayerTextDrawHide(playerid, vehicleInfo[playerid]);
		PlayerTextDrawHide(playerid, VehicleBG[playerid]);
		PlayerTextDrawHide(playerid, EngineIcon[playerid]);
		PlayerTextDrawHide(playerid, SpeedIcon[playerid]);
		PlayerTextDrawHide(playerid, TireIcon[playerid]);
		PlayerTextDrawHide(playerid, FuelIcon[playerid]);
		PlayerTextDrawHide(playerid, PlayerVehicleName[playerid]);
		pInfo[playerid][Headshots] = 0;
		pInfo[playerid][Murders] = 0;
		pInfo[playerid][BanditsKilled] = 0;
		pInfo[playerid][ZombiesKilled] = 0;
		pInfo[playerid][Backpack] = 0;
		pInfo[playerid][BackpackSlots] = 0;
		pInfo[playerid][pX] = 0.0;
		pInfo[playerid][pY] = 0.0;
		pInfo[playerid][pZ] = 0.0;
		pInfo[playerid][pWeap1] = 0;
		pInfo[playerid][pAmmo1] = 0;
		pInfo[playerid][pWeap2] = 0;
		pInfo[playerid][pAmmo2] = 0;
		pInfo[playerid][pWeap3] = 0;
		pInfo[playerid][pAmmo3] = 0;
		pInfo[playerid][pWeap4] = 0;
		pInfo[playerid][pAmmo4] = 0;
		pInfo[playerid][pBlood] = 9999;
		pInfo[playerid][pThrist] = 9999;
		pInfo[playerid][pHunger] = 9999;
		pInfo[playerid][Humanity] = 2500;
		pInfo[playerid][pFirstSpawn] = 1;
		pInfo[playerid][IsPlayerLegBroken] = 0;
		pInfo[playerid][IsPlayerMakingNoise] = 0;
		pInfo[playerid][IsPlayerHero] = 0;
		pInfo[playerid][IsPlayerBandit] = 0;
		pInfo[playerid][IsPlayerBleeding] = 0;
		pInfo[playerid][pIsMapOpened] = 0;
		pInfo[playerid][IsPlayerDrunk] = 0;
		pInfo[playerid][pTemp] = 100.0;
		PlayerTextDrawHide(playerid,PlayerBlood[playerid]);
		PlayerTextDrawHide(playerid,PlayerHunger[playerid]);
		PlayerTextDrawHide(playerid,PlayerThirst[playerid]);
		PlayerTextDrawHide(playerid,playerBandit[playerid]);
		PlayerTextDrawHide(playerid,PlayerTemp[playerid]);
	    PlayerTextDrawColor(playerid,PlayerBlood[playerid], 0x10F44155);
		PlayerTextDrawColor(playerid,PlayerHunger[playerid], 0x10F44155);
		PlayerTextDrawColor(playerid,PlayerThirst[playerid], 0x10F44155);
		PlayerTextDrawColor(playerid,playerBandit[playerid], 0x10F44155);
		PlayerTextDrawColor(playerid,PlayerTemp[playerid], 0x10F44155);
		PlayerTextDrawShow(playerid,PlayerBlood[playerid]);
		PlayerTextDrawShow(playerid,PlayerHunger[playerid]);
		PlayerTextDrawShow(playerid,PlayerThirst[playerid]);
		PlayerTextDrawShow(playerid,playerBandit[playerid]);
		PlayerTextDrawShow(playerid,PlayerTemp[playerid]);
		PlayerTextDrawHide(playerid, PlayerFade[playerid]);
		pInfo[playerid][pFade] = 0;

		pInfo[playerid][pAliveTime] = 0;
		ClearChatPlayer(playerid);
		ResetPlayerInventory(playerid);
		pInfo[playerid][IsPlayerSpawned] = 0;

		RemovePlayerAttachedObject(playerid, 2);
		KillTimer(pInfo[playerid][Bleeding]);
		PlayerTextDrawHide(playerid, LegBroken[playerid]);

        if(pInfo[playerid][pInfection] == 1)
        {
            pInfo[playerid][pInfection] = 0;
            new str2[180];
			format(str2,sizeof(str2),"*"COL_RED" %s(%i) has suffered from an infection and died!",PlayerName(playerid),playerid);
			ProxDetector(60.0, playerid, str2, COLOR_GREY);
			SendClientMessage(playerid,-1,"*"COL_RED" You suffered from an infection!");
			PlayerTextDrawSetString(playerid, LegBroken[playerid], "Broken Leg");
			PlayerTextDrawHide(playerid, LegBroken[playerid]);
			SetPlayerDrunkLevel(playerid, 0);
			KillTimer(pInfo[playerid][Bleeding]);
		}

		if(IsBeingSpeced[playerid] == 1)
	    {
	        foreach(Player,i)
	        {
	            if(spectatorid[i] == playerid)
	            {
	                TogglePlayerSpectating(i,false);
	                giveWeaponAllow[i] = 1;
	            }
	        }
	    }
	    Handup[playerid] = 0;
	}

   	new time = gettime();
    switch(time - LastDeath[playerid])
    {
        case 0..3:
        {
            DeathSpam[playerid]++;
            if(DeathSpam[playerid] == 3)
            {
				jBan(playerid, -1, "Fake Kill Hack", 0);
                return 1;
            }
        }
        default: DeathSpam[playerid] = 0;
    }
    LastDeath[playerid] = time;
	return 1;
}

public OnPlayerText(playerid, text[])
{
    if(pInfo[playerid][IsPlayerMuted] == 1)
    {
        SendClientMessage(playerid,-1,"*"COL_RED" You are muted!");
	}
	else
	{
		new message[257];

		if(pInfo[playerid][pPremium] == 0)
		{
 			format(message, sizeof(message), "%s says: %s", PlayerName(playerid), text);
	    	ProxDetector(20.0, playerid, message, COLOR_GREY);
		}
		else
		{
 			format(message, sizeof(message), ""COL_WHITE"[%s]"COL_GREY" %s says: %s",GetPremiumName(playerid),PlayerName(playerid), text);
	    	ProxDetector(30.0, playerid, message, COLOR_GREY);
		}

	    if(strfind(text, ":", true) != -1)
		{
			new i_numcount, i_period, i_pos;
			while(text[i_pos])
			{
				if('0' <= text[i_pos] <= '9') i_numcount ++;
				else if(text[i_pos] == '.') i_period ++;
				i_pos++;
			}
			if(i_numcount >= 8 && i_period >= 3)
			{
				jBan(playerid, -1, "Advertisement", 60);
				return 0;
			}
		}
	}
	return 0;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
    if(oldstate == PLAYER_STATE_ONFOOT && newstate == PLAYER_STATE_DRIVER)
    {
        if(IsPlayerInAnyVehicle(playerid))
        {
			DayZSA_SetPlayerNoiseLevel(playerid,4);
			DayZSA_SetPlayerEyeLevel(playerid,3);

			new i = GetPlayerVehicleID(playerid);
			if(pInfo[playerid][pPremium] == 1)
			{
				if(vInfo[i][vehicleFuel] == 0)
				{
					if(vInfo[i][vehicleTires] == 0)
					{
						if(vInfo[i][vehicleEngine] == 0)
						{
							vInfo[i][vehicleTires] = 1;
						}
					}
				}
			}

			if(pInfo[playerid][pPremium] == 2)
			{
				if(vInfo[i][vehicleFuel] == 0)
				{
					if(vInfo[i][vehicleTires] == 0)
					{
						if(vInfo[i][vehicleEngine] == 0)
						{
							vInfo[i][vehicleTires] = 2;
							vInfo[i][vehicleEngine] = 1;
						}
					}
				}
			}

			if(pInfo[playerid][pPremium] == 3)
			{
				if(vInfo[i][vehicleFuel] == 0)
				{
					if(vInfo[i][vehicleTires] == 0)
					{
						if(vInfo[i][vehicleEngine] == 0)
						{
							vInfo[i][vehicleTires] = 2;
							vInfo[i][vehicleEngine] = 1;
							vInfo[i][vehicleFuel] = 80;
						}
					}
				}
			}

			if(pInfo[playerid][pPremium] == 4)
			{
				if(vInfo[i][vehicleFuel] == 0)
				{
					if(vInfo[i][vehicleTires] == 0)
					{
						if(vInfo[i][vehicleEngine] == 0)
						{
							vInfo[i][vehicleTires] = 3;
							vInfo[i][vehicleEngine] = 1;
							vInfo[i][vehicleFuel] += random(80);
						}
					}
				}
			}
		}
    }

    if(oldstate == PLAYER_STATE_DRIVER && newstate == PLAYER_STATE_ONFOOT)
    {
    	PlayerTextDrawHide(playerid, vehicleInfo[playerid]);
		PlayerTextDrawHide(playerid, VehicleBG[playerid]);
		PlayerTextDrawHide(playerid, EngineIcon[playerid]);
		PlayerTextDrawHide(playerid, SpeedIcon[playerid]);
		PlayerTextDrawHide(playerid, TireIcon[playerid]);
		PlayerTextDrawHide(playerid, FuelIcon[playerid]);
		PlayerTextDrawHide(playerid, PlayerVehicleName[playerid]);
        DayZSA_SetPlayerNoiseLevel(playerid,3);
        DayZSA_SetPlayerEyeLevel(playerid,2);
	}

	if(oldstate == PLAYER_STATE_PASSENGER && newstate == PLAYER_STATE_ONFOOT)
	{
    	PlayerTextDrawHide(playerid, vehicleInfo[playerid]);
		PlayerTextDrawHide(playerid, VehicleBG[playerid]);
		PlayerTextDrawHide(playerid, EngineIcon[playerid]);
		PlayerTextDrawHide(playerid, SpeedIcon[playerid]);
		PlayerTextDrawHide(playerid, TireIcon[playerid]);
		PlayerTextDrawHide(playerid, FuelIcon[playerid]);
		PlayerTextDrawHide(playerid, PlayerVehicleName[playerid]);
        DayZSA_SetPlayerNoiseLevel(playerid,3);
        DayZSA_SetPlayerEyeLevel(playerid,2);
	}

 	if(newstate == PLAYER_STATE_DRIVER || newstate == PLAYER_STATE_PASSENGER)
    {
        if(IsBeingSpeced[playerid] == 1)
        {
            foreach(Player,i)
            {
                if(spectatorid[i] == playerid)
                {
                    PlayerSpectateVehicle(i, GetPlayerVehicleID(playerid));
                }
            }
        }
    }

    if(newstate == PLAYER_STATE_ONFOOT)
    {
        if(IsBeingSpeced[playerid] == 1)
        {
            foreach(Player,i)
            {
                if(spectatorid[i] == playerid)
                {
                    PlayerSpectatePlayer(i, playerid);
                }
            }
        }
    }

    if(newstate == PLAYER_STATE_DRIVER && pInfo[playerid][pAdminLevel] <= 0)
    {
        if(GetPlayerVehicleID(playerid) != p_CarWarpVehicleID[playerid])
        {
            if(p_CarWarpTime[ playerid ] > gettime())
            {
				jBan(playerid, -1, "Vehicle Teleport Hack", 0);
                return 1;
            }
            p_CarWarpTime[playerid] = gettime() + 1;
            p_CarWarpVehicleID[playerid] = GetPlayerVehicleID(playerid);
        }
    }
	return 1;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	jBan(playerid, -1, "Vehicle Mod Hack", 0);
    return 0;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{

	if(PRESSED(KEY_WALK))
	{
		if(IsPlayerInRangeOfPoint(playerid,4,vInfo[GetVehicleNearID(playerid)][vX],vInfo[GetVehicleNearID(playerid)][vY],vInfo[GetVehicleNearID(playerid)][vZ]))
		{
			DayZSA_DisplayVehicleStorage(playerid);
		}
	}

	if(PRESSED(KEY_FIRE))
	{
		switch(GetPlayerWeapon(playerid))
		{
  			case 1,2,3,9,6,7,10,11,12,13,14,15,16,17,18,19,20,21,24,26,28,32,35,36,37,38,39,40,41,42,44,45:
		  	{
				jBan(playerid, -1, "Weapon Hack (NOT ALLOWED)", 0);
		  	}
  		}
	}

	if(PRESSED(KEY_FIRE))
	{
	    pInfo[playerid][ZombiesWarn]++;
	}

	if(PRESSED(KEY_FIRE))
	{
		if(pInfo[playerid][IsPlayerSpawned] == 1)
		{
			new weapon2 = GetPlayerWeapon(playerid);
			if(weapon2 != 0 && !PlayerWeapons[playerid][weapon2] && weapon2 != 40 && weapon2 != 46)
			{
				jBan(playerid, -1, "Weapon Hack", 0);
			}
		}
	}

	if(PRESSED(KEY_SUBMISSION))
	{
	    if(PlayerHasItem(playerid,"Map"))
	    {
			if(pInfo[playerid][pIsMapOpened] == 0)
			{
		    	PlayerTextDrawShow(playerid, Map[playerid]);
		    	SendClientMessage(playerid,-1,"*"COL_RED" Press numpad1/middle mouse button again to disabled");
		    	pInfo[playerid][pIsMapOpened] = 1;
			}
			else return pInfo[playerid][pIsMapOpened] = 0,PlayerTextDrawHide(playerid, Map[playerid]);
		}
	}

	if(HOLDING(KEY_CTRL_BACK))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
		{
		    if(pInfo[playerid][IsPlayerDrunk] == 0)
		    {
		    	if(gettime() - 5 < pInfo[playerid][pProneSpam]) return SendClientMessage(playerid,-1,"*"COL_RED" Don't prone abuse!");
				{
			    	ApplyAnimation(playerid,"WUZI","CS_Dead_Guy",4.1,1,1,1,1,0,1);
				    pInfo[playerid][pProne] = 1;
		     	 	DayZSA_SetPlayerNoiseLevel(playerid,0);
		     	 	DayZSA_SetPlayerEyeLevel(playerid,1);
		     	 	pInfo[playerid][pProneSpam] = gettime();
				}
			}
		}
	}

	if(RELEASED(KEY_CTRL_BACK))
	{
 		if(!IsPlayerInAnyVehicle(playerid))
		{
	    	ClearAnimations(playerid);
	    	pInfo[playerid][pProne] = 0;
			DayZSA_SetPlayerNoiseLevel(playerid,3);
			DayZSA_SetPlayerEyeLevel(playerid,2);
		}
	}

	if(PRESSED(KEY_ANALOG_LEFT))
	{
		if(IsPlayerInAnyVehicle(playerid))
		{
			if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
			{
				new engine_boot, lights_boot, alarm_boot, doors_boot, bonnet_boot, boot_boot, objective_boot;
				GetVehicleParamsEx(GetPlayerVehicleID(playerid), engine_boot, lights_boot, alarm_boot, doors_boot, bonnet_boot, boot_boot, objective_boot);
				if(engine == 1)
				{
				    new engine_but, lights_but, alarm_but, doors_but, bonnet_but, boot_but, objective_but;
					GetVehicleParamsEx(GetPlayerVehicleID(playerid), engine_but, lights_but, alarm_but, doors_but, bonnet_but, boot_but, objective_but);
					SetVehicleParamsEx(GetPlayerVehicleID(playerid), 0, lights_but, alarm_but, doors_but, bonnet_but, boot_but, objective_but);
					SendClientMessage(playerid, -1, ""chat" Vehicle engine has stopped!");
				}

				if(engine == 0)
				{
				    new engine_but, lights_but, alarm_but, doors_but, bonnet_but, boot_but, objective_but;
					GetVehicleParamsEx(GetPlayerVehicleID(playerid), engine_but, lights_but, alarm_but, doors_but, bonnet_but, boot_but, objective_but);
					SetVehicleParamsEx(GetPlayerVehicleID(playerid), 1, lights_but, alarm_but, doors_but, bonnet_but, boot_but, objective_but);
					SendClientMessage(playerid, -1, ""chat" Vehicle engine has started!");
				}
			}
	    }
	}

	if(PRESSED(KEY_NO))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
		{
			if(IsPlayerInRangeOfPoint(playerid,1.1,Loot[GetLootID(playerid)][xLoot],Loot[GetLootID(playerid)][yLoot],Loot[GetLootID(playerid)][zLoot]))
			{
			    DayZSA_DisplayLootForPlayer(playerid);
			}
		}
	}

	if(PRESSED(KEY_WALK))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
		{
			if(IsPlayerInRangeOfPoint(playerid,1.1,Loot[GetLootIDFunction(playerid)][xLootdrop],Loot[GetLootIDFunction(playerid)][yLootdrop],Loot[GetLootIDFunction(playerid)][zLootdrop]))
			{
			    DayZSA_DisplayLootFunction(playerid);
			}
		}
	}

	if(PRESSED(KEY_WALK))
	{
		if(IsPlayerInRangeOfPoint(playerid,3.3,Tent[GetTentID(playerid)][xTent],Tent[GetTentID(playerid)][yTent],Tent[GetTentID(playerid)][zTent]))
		{
			DayZSA_DisplayTent(playerid);
		}
	}

	if(PRESSED(KEY_WALK))
{
    if(IsPlayerInRangeOfPoint(playerid,2.1,CampFire[GetCampID(playerid)][xTent],CampFire[GetCampID(playerid)][yTent],CampFire[GetCampID(playerid)][zTent]))
    {
        if(PlayerHasItem(playerid, "Raw Meat"))
        {
            AddSlotToInventoryWorld(playerid, "Cooked Meat", 1);
            RemoveSlotToInventory(playerid, "Raw Meat", 1);
            SendClientMessage(playerid, -1, ""chat" Sucessfully cooked raw Meat! Check your inventory!");
        }
    }
}
	{
    if(IsPlayerInRangeOfPoint(playerid,2.1,CampFire[GetCampID(playerid)][xTent],CampFire[GetCampID(playerid)][yTent],CampFire[GetCampID(playerid)][zTent]))
    	{
        if(PlayerHasItem(playerid, "Dirty Water Bottle"))
       		 {
            AddSlotToInventoryWorld(playerid, "Full Water Bottle", 1);
            RemoveSlotToInventory(playerid, "Dirty Water Bottle", 1);
            SendClientMessage(playerid, -1, ""chat" Sucessfully boiled Water! Check your inventory!");
        }
        else return SendClientMessage(playerid, -1, ""chat", You have nothing to boil!");
    }
}

	if(PRESSED(KEY_NO))
	{
	    if(IsPlayerInRangeOfPoint(playerid,3.5,Tent[GetTentID(playerid)][xTent],Tent[GetTentID(playerid)][yTent],Tent[GetTentID(playerid)][zTent]))
	    {
			if(PlayerHasItem(playerid,"Toolbox"))
			{
				new Float:fPos[3];
				GetPlayerPos(playerid,fPos[0],fPos[1],fPos[2]);
				DayZSA_CreateLootsFunction("Tent",fPos[0],fPos[1],fPos[2]);
			    DestroyDynamicObject(Tent[GetTentID(playerid)][TentID]);
			    DestroyDynamic3DTextLabel(Tent[GetTentID(playerid)][tentText]);
   				Tent[GetTentID(playerid)][xTent] = 0.0;
				Tent[GetTentID(playerid)][yTent] = 0.0;
				Tent[GetTentID(playerid)][zTent] = 0.0;
				pInfo[playerid][pTentCreated] = 0;
				SendClientMessage(playerid, -1, "*"COL_RED" Tent sucessfully destroyed.");
			}
            else return SendClientMessage(playerid,-1,"*"COL_RED" You need a toolbox to destroy this tent");
		}
	}

	if(PRESSED(KEY_WALK))
	{
		if(IsPlayerInRangeOfPoint(playerid,3.5,Loot[GetHospitalID(playerid)][xHos],Loot[GetHospitalID(playerid)][yHos],Loot[GetHospitalID(playerid)][zHos]))
		{
			DayZSA_DisplayHospital(playerid);
		}
	}
	
	if(PRESSED(KEY_WALK))
	{
		if(IsPlayerInRangeOfPoint(playerid,3.5,Loot[GetAirDropID(playerid)][xAir],Loot[GetAirDropID(playerid)][yAir],Loot[GetAirDropID(playerid)][zAir]))
		{
			DayZSA_DisplayAirdrop(playerid);
		}
	}
	
	

	if(PRESSED(KEY_CROUCH))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
			if(DayZSA_IsPlayerAtGasStation(playerid))
			{
				if(PlayerHasItem(playerid,"Empty Jerry Can"))
				{
	                RemoveSlotToInventory(playerid,"Empty Jerry Can",1);
				    AddSlotToInventoryWorld(playerid,"Full Jerry Can",1);
				    SendClientMessage(playerid,-1,""chat" You filled the cainster with fuel!");
				}
				else return SendClientMessage(playerid,-1,""chat" You need to have empty Jerry Can to add fuel into your cainster!");
			}
		}
	}

	if(PRESSED(KEY_NO))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
		{
			if(IsPlayerInRangeOfPoint(playerid,2.5,Loot[GetLootIDZombie(playerid)][xLootdropZ],Loot[GetLootIDZombie(playerid)][yLootdropZ],Loot[GetLootIDZombie(playerid)][zLootdropZ]))
			{
			    DayZSA_DisplayLootZombie(playerid);
			}
		}
	}

	if(PRESSED(KEY_SPRINT) || PRESSED(KEY_JUMP))
	{
	    if(pInfo[playerid][IsPlayerLegBroken] == 1)
	    {
	        ClearAnimations(playerid);
		}
	}

	if(HOLDING(KEY_SPRINT))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
			if(pInfo[playerid][IsPlayerLegBroken] == 1)
	        {
			    ClearAnimations(playerid);
			}
		}
	}

	if(HOLDING(KEY_FIRE))
	{
 		if(!IsPlayerInAnyVehicle(playerid))
	    {
			new weap = GetPlayerWeapon(playerid);
	        if(weap == 29 || weap == 30 || weap == 31 || weap == 33 || weap == 34 || weap == 25 || weap == 22)
	        {
				DayZSA_SetPlayerNoiseLevel(playerid,4);
				DayZSA_SetPlayerEyeLevel(playerid,3);
			}
		}
	}

	if(RELEASED(KEY_FIRE))
	{
 		if(!IsPlayerInAnyVehicle(playerid))
	    {
   			new weap2 = GetPlayerWeapon(playerid);
	        if(weap2 == 29 || weap2 == 30 || weap2 == 31 || weap2 == 33 || weap2 == 34 || weap2 == 25 || weap2 == 22)
	        {
				DayZSA_SetPlayerNoiseLevel(playerid,3);
				DayZSA_SetPlayerEyeLevel(playerid,2);
			}
		}
	}

	if(PRESSED(KEY_YES))
	{
	    ShowInventory(playerid);
	}
	return 1;
}

timer CheckPlayerStatusZ[8000]()
{
	foreach(Player, i)
	{
		if(isPlayerInMenu[i] == 0)
  		{
    		if(pInfo[i][pLogged] == 1)
		    {
      			if(pInfo[i][IsPlayerSpawned] == 1)
	        	{
					if(GetPlayerAnimationIndex(i))
					{
					    new animname[32], animlib[32];
			    		static Keys,ud,lr;
						GetPlayerKeys(i,Keys,ud,lr);
						GetAnimationName(GetPlayerAnimationIndex(i), animlib, sizeof(animlib), animname, sizeof(animname));
						if(!strcmp(animname, "JUMP_glide", true))
						{
   							if(pInfo[i][ZombiesWarn] >= 8)
						    {
			       				pInfo[i][ZombiesWarn] = 8;
							}
							pInfo[i][ZombiesWarn] += 2;
						}

						if(!strcmp(animname, "run_player", true) || !strcmp(animname, "run_right", true))
						{
						    if(ud == KEY_UP)
						    {
								pInfo[i][ZombiesWarn] += 3;
				    			if(pInfo[i][ZombiesWarn] >= 8)
							    {
							        pInfo[i][ZombiesWarn] = 8;
								}
							}
							else
							{
    							if(pInfo[i][ZombiesWarn] >= 8)
							    {
							        pInfo[i][ZombiesWarn] = 8;
								}
								pInfo[i][ZombiesWarn] += 2;
							}
						}

						if(!strcmp(animname, "IDLE_stance", true) || !strcmp(animname, "IDLE_armed", true) || !strcmp(animname, "IDLE_tired", true))
						{
		    				if(pInfo[i][ZombiesWarn] <= 0)
						    {
						        pInfo[i][ZombiesWarn] = 0;
							}
							pInfo[i][ZombiesWarn] -= 2;
						}

						if(!strcmp(animname, "Run_stopR", true))
						{
		    				if(pInfo[i][ZombiesWarn] <= 0)
						    {
						        pInfo[i][ZombiesWarn] = 0;
							}
							pInfo[i][ZombiesWarn]--;
						}

						if(!strcmp(animname, "WEAPON_CROUCH", true))
						{
		    				if(pInfo[i][ZombiesWarn] <= 0)
						    {
						        pInfo[i][ZombiesWarn] = 0;
							}
							pInfo[i][ZombiesWarn]--;
						}

						if(!strcmp(animname, "GUNCROUCHFWD", true))
						{
						    if(pInfo[i][ZombiesWarn] <= 0)
						    {
						        pInfo[i][ZombiesWarn] = 0;
							}
							pInfo[i][ZombiesWarn]--;
						}
					}
				}
			}
		}
	}
	return 1;
}

public OnPlayerUpdate(playerid)
{
	if(!IsPlayerNPC(playerid))
 	{
		static Keys,ud,lr;
		GetPlayerKeys(playerid,Keys,ud,lr);
		new animname[32], animlib[32];
		if(GetPlayerAnimationIndex(playerid))
		{
			GetAnimationName(GetPlayerAnimationIndex(playerid), animlib, sizeof(animlib), animname, sizeof(animname));
			if(!strcmp(animname, "FALL_SKYDIVE", true))
			{
                pInfo[playerid][IsPlayerCleoFly]++;
				pInfo[playerid][pCleoFlyWarning]++;

			    if(pInfo[playerid][IsPlayerCleoFly] >= 300)
				{
				    if(pInfo[playerid][pCleoFlyWarning] >= 6)
				    {
						if(GetPlayerWeapon(playerid) != 46)
						{
							jBan(playerid, -1, "Fly Hack", 0);
						}
					}
				}
			}
		}

	    /*if(GetPlayerAnimationIndex(playerid))
	    {
	        new msg[128];
	        GetAnimationName(GetPlayerAnimationIndex(playerid),animlib,32,animname,32);
	        format(msg, 128, "Animation: %s %s", animlib, animname);
	        SendClientMessage(playerid, 0xFFFFFFFF, msg);
	    }*/

		if(GetPlayerAnimationIndex(playerid))
		{
			GetAnimationName(GetPlayerAnimationIndex(playerid), animlib, sizeof(animlib), animname, sizeof(animname));
			if(!strcmp(animname, "JUMP_glide", true))
			{
				DayZSA_SetPlayerNoiseLevel(playerid,3);
				DayZSA_SetPlayerEyeLevel(playerid,3);
			}

			if(!strcmp(animname, "JUMP_land", true))
			{
				DayZSA_SetPlayerNoiseLevel(playerid,2);
				DayZSA_SetPlayerEyeLevel(playerid,1);
			}

			if(!strcmp(animname, "run_player", true) || !strcmp(animname, "run_right", true))
			{
			    if(ud == KEY_UP)
			    {
					DayZSA_SetPlayerNoiseLevel(playerid,4);
					DayZSA_SetPlayerEyeLevel(playerid,3);
				}
				else
				{
					DayZSA_SetPlayerNoiseLevel(playerid,3);
					DayZSA_SetPlayerEyeLevel(playerid,3);
				}
			}

			if(!strcmp(animname, "IDLE_stance", true) || !strcmp(animname, "IDLE_armed", true) || !strcmp(animname, "IDLE_tired", true))
			{
				DayZSA_SetPlayerNoiseLevel(playerid,0);
				DayZSA_SetPlayerEyeLevel(playerid,1);
			}

			if(!strcmp(animname, "Run_stopR", true))
			{
				DayZSA_SetPlayerNoiseLevel(playerid,1);
				DayZSA_SetPlayerEyeLevel(playerid,1);
			}

			if(!strcmp(animname, "Run_stopR", true))
			{
				DayZSA_SetPlayerNoiseLevel(playerid,2);
				DayZSA_SetPlayerEyeLevel(playerid,1);
			}

			if(!strcmp(animname, "WEAPON_CROUCH", true))
			{
				DayZSA_SetPlayerNoiseLevel(playerid,2);
				DayZSA_SetPlayerEyeLevel(playerid,1);
			}

			if(!strcmp(animname, "GUNCROUCHFWD", true))
			{
				DayZSA_SetPlayerNoiseLevel(playerid,2);
				DayZSA_SetPlayerEyeLevel(playerid,2);
			}
		}

        new drunk2 = GetPlayerDrunkLevel(playerid);
        if(drunk2 < 100)
        {
            SetPlayerDrunkLevel(playerid,2000);
        }
        else
        {
            if(DLlast[playerid] != drunk2)
            {
                new fps = DLlast[playerid] - drunk2;
                if((fps > 0) && (fps < 200))
				FPS2[playerid] = fps;
				DLlast[playerid] = drunk2;
     		}
        }

  		static Float: X, Float: Y, Float: Z;
	    GetPlayerPos(playerid, X, Y, Z);


	    if(X >= 99999.0 || Y >= 99999.0 || Z >= 99999.0 || X <= -99999.0 || Y <= -99999.0 || Z <= -99999.0)
		{
	        SendClientMessage(playerid, 0xa9c4e4ff, "Warning: Excessive X, Y, Z has been breached thus last location set.");
	        SetPlayerPos_Allow(playerid, p_PlayerBuggerX[playerid], p_PlayerBuggerY[playerid], p_PlayerBuggerZ[playerid]);
	    }
	    else
	    {
	        p_PlayerBuggerX[playerid] = X;
	        p_PlayerBuggerY[playerid] = Y;
	        p_PlayerBuggerZ[playerid] = Z;
	    }

     	static Float:X2, Float:Y2, Float:Z2;
	    if(IsPlayerInAnyVehicle(playerid))
	    {
	        GetVehicleVelocity(GetPlayerVehicleID(playerid), X2, Y2, Z2);
	        if(X2 > 3.0 || Y2 > 3.0 || Z2 > 3.0 || X2 < -3.0 || Y2 < -3.0 || Z2 < -3.0)
	        {
				jBan(playerid, -1, "Vehicle Warp Hack (Spin)", 0);
	        }
	    }

		if(tickcount() - armedbody_pTick[playerid] > 113)
		{
			new
				weaponid[13],weaponammo[13],pArmedWeapon;
			pArmedWeapon = GetPlayerWeapon(playerid);
			GetPlayerWeaponData(playerid,1,weaponid[1],weaponammo[1]);
			GetPlayerWeaponData(playerid,2,weaponid[2],weaponammo[2]);
			GetPlayerWeaponData(playerid,4,weaponid[4],weaponammo[4]);
			GetPlayerWeaponData(playerid,5,weaponid[5],weaponammo[5]);
			#if ARMEDBODY_USE_HEAVY_WEAPON
			GetPlayerWeaponData(playerid,7,weaponid[7],weaponammo[7]);
			#endif
			if(weaponid[1] && weaponammo[1] > 0){
				if(pArmedWeapon != weaponid[1]){
					if(!IsPlayerAttachedObjectSlotUsed(playerid,5)){
						//SetPlayerAttachedObject(playerid,5,GetWeaponModel(weaponid[1]),1, 0.199999, -0.139999, 0.030000, 0.500007, -115.000000, 0.000000, 1.000000, 1.000000, 1.000000);
                        SetPlayerAttachedObject( playerid, 5, GetWeaponModel(weaponid[1]), 16, -0.195032, 0.120565, -0.052446, 0.000000, 20.250000, 0.000000, 0.968602, 0.904952, 1.110462 );
					}
				}
				else {
					if(IsPlayerAttachedObjectSlotUsed(playerid,5)){
						RemovePlayerAttachedObject(playerid,5);
					}
				}
			}
			else if(IsPlayerAttachedObjectSlotUsed(playerid,5)){
				RemovePlayerAttachedObject(playerid,5);
			}
			if(weaponid[2] && weaponammo[2] > 0){
				if(pArmedWeapon != weaponid[2]){
					if(!IsPlayerAttachedObjectSlotUsed(playerid,6)){
						//SetPlayerAttachedObject(playerid,6,GetWeaponModel(weaponid[2]),8, -0.079999, -0.039999, 0.109999, -90.100006, 0.000000, 0.000000, 1.000000, 1.000000, 1.000000);
						SetPlayerAttachedObject(playerid, 6, GetWeaponModel(weaponid[2]), 12, -0.050205, -0.069741, -0.080912, 20.179998, 17.460956, 354.668945, 1.150907, 1.061156, 0.884258 );
					}
				}
				else {
					if(IsPlayerAttachedObjectSlotUsed(playerid,6)){
						RemovePlayerAttachedObject(playerid,6);
					}
				}
			}
			else if(IsPlayerAttachedObjectSlotUsed(playerid,6)){
				RemovePlayerAttachedObject(playerid,6);
			}
			if(weaponid[4] && weaponammo[4] > 0){
				if(pArmedWeapon != weaponid[4]){
					if(!IsPlayerAttachedObjectSlotUsed(playerid,7)){
						SetPlayerAttachedObject(playerid,7,GetWeaponModel(weaponid[4]),7, 0.000000, -0.100000, -0.080000, -95.000000, -10.000000, 0.000000, 1.000000, 1.000000, 1.000000);
					}
				}
				else {
					if(IsPlayerAttachedObjectSlotUsed(playerid,7)){
						RemovePlayerAttachedObject(playerid,7);
					}
				}
			}
			else if(IsPlayerAttachedObjectSlotUsed(playerid,7)){
				RemovePlayerAttachedObject(playerid,7);
			}
			if(weaponid[5] && weaponammo[5] > 0){
				if(pArmedWeapon != weaponid[5]){
					if(!IsPlayerAttachedObjectSlotUsed(playerid,8)){
						SetPlayerAttachedObject(playerid,8,GetWeaponModel(weaponid[5]),1, 0.200000, -0.119999, -0.059999, 0.000000, 206.000000, 0.000000, 1.000000, 1.000000, 1.000000);
					}
				}
				else {
					if(IsPlayerAttachedObjectSlotUsed(playerid,8)){
						RemovePlayerAttachedObject(playerid,8);
					}
				}
			}
			else if(IsPlayerAttachedObjectSlotUsed(playerid,8)){
				RemovePlayerAttachedObject(playerid,8);
			}
			#if ARMEDBODY_USE_HEAVY_WEAPON
			if(weaponid[7] && weaponammo[7] > 0){
				if(pArmedWeapon != weaponid[7]){
					if(!IsPlayerAttachedObjectSlotUsed(playerid,9)){
						SetPlayerAttachedObject(playerid,9,GetWeaponModel(weaponid[7]),1,-0.100000, 0.000000, -0.100000, 84.399932, 112.000000, 10.000000, 1.099999, 1.000000, 1.000000);
					}
				}
				else {
					if(IsPlayerAttachedObjectSlotUsed(playerid,9)){
						RemovePlayerAttachedObject(playerid,9);
					}
				}
			}
			else if(IsPlayerAttachedObjectSlotUsed(playerid,9)){
				RemovePlayerAttachedObject(playerid,9);
			}
			#endif
			armedbody_pTick[playerid] = tickcount();
		}
		}
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(strfind(inputtext, "%") != -1) return SendClientMessage(playerid, -1, "*"COL_RED" Go crash another server douche!"),KickEx(playerid);
    switch(dialogid)
    {
		case DIALOG_LOGIN:
		{
			if(!response)
			{
				KickEx(playerid);
    			return 1;
       		}
         	if(strlen(inputtext) >= 3 && strlen(inputtext) <= 20)
     		{
 		    	if(strfind(inputtext, "'", true) != -1)
  		    	{
					ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "DayZ Login", "Type your account's password below:", "Login", "Exit");
				}
    			new tmppass[64];
    			mysql_real_escape_string(inputtext, tmppass);
    			if(strlen(tmppass) < 3)
 		    	{
					ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD,"DayZ Login", "Type your account's password below:", "Login", "Exit");
				}

				OnPlayerAccountLogin(playerid, tmppass);
			}
 			else
  			{
				ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "DayZ Login", "Type your account's password below:", "Login", "Exit");
  			}
		}

		case DIALOG_REGISTER:
		{
		    if(!response)
	     	{
				KickEx(playerid);
				return 1;
			}

			if(strlen(inputtext) >= 3 && strlen(inputtext) <= 128)
			{
			    new tmppass[64];
			    new string[256];

			    mysql_real_escape_string(inputtext, tmppass);

			    if(strlen(tmppass) < 3)
				{
	       			format(string,sizeof(string),"{BECBFC}Welcome, {95A3FF}%s{BECBFC}!\n\nPlease enter your password below to login to your account.",PlayerName(playerid));
					ShowPlayerDialog(playerid, DIALOG_LOGIN ,DIALOG_STYLE_PASSWORD,"DayZ Login", string, "Login", "Exit");
				}
				OnPlayerRegister(playerid,tmppass);
			}
		}

		case DIALOG_COIN:
		{
		    if(response)
		    {
		        switch(listitem)
		        {
		            case 0:
		            {
						new strlist[180];
						strcat(strlist, "Police Cap - 5 Coins\nRed Hockey Mask - 15 Coins\nArmy Helmet - 20 Coins\n");
						ShowPlayerDialog(playerid, DIALOG_PLAYERITEMS, DIALOG_STYLE_LIST, "Select one of the following Player Items", strlist, "Purchase", "Cancel");
					}
				}
			}
		}


		case 5472:
		{
			if(response)
			{
			    switch(listitem)
			    {
			        case 0:
			        {
			        	new str[700];
			        	strcat(str, "/basickeys - keys to get you started\n/savestats - save your stats\n/pickupgun - pickup dropped gun\n/dropgun - drop your current weapon\n/survival - blood, hunger, thirst etc\n\
			        	/version - SA:MP version\n/getidid - Get a persons ID\n/stopambient - turn off ambient\n/firstperson - first person view\n/ask - Use this when you need help\n");
			        	strcat(str, "/r - send a radio message\n/ooc - Global Chat (needs radio device)\n/me - self expression command\n/shout - yell :)\n/local - local chat\n\
						/pm - Private message someone\n/blockpm & /unblockpm - self explained\n/inv - show inventory\n/acmds - Admin Commands\n/rules - List of server rules\n");
		                ShowPlayerDialog(playerid,4661,DIALOG_STYLE_MSGBOX,"DayZ - General CMDSs",str,"Close","");
					}

				    case 1:
				    {
				        new str[126];
				        strcat(str, "/stopanim - Stop all animations\n/wave - Wave your hand\n/sit - three sets of sitting animation\n/handsup - Put your hands up\n");
				        ShowPlayerDialog(playerid,4662,DIALOG_STYLE_MSGBOX,"DayZ - Animations CMDs",str,"Close","");
					}

				    case 2:
				    {
				        new str[400];
		          		strcat(str, "/makegroup - Create a group\n/destroygroup - Destroy your group\n/g - group chat\n/groupinfo - Group information\n/invitegroup - invite someone to your group\n\
						/acceptgroup - Self explained\n/denygroup - Self explained\n/kickgroup - kick someone from your group\n/leavegroup - self explained\n/groupfind - find a group player\n");
				        ShowPlayerDialog(playerid,4663,DIALOG_STYLE_MSGBOX,"DayZ - Group CMDs",str,"Close","");
					}
				}
			}
		}

		case 8341:
		{
			if(response)
			{
			    switch(listitem)
			    {
			        case 0:
			        {
			            ShowPlayerDialog(playerid,5472,DIALOG_STYLE_LIST,"DayZ - Commands","General Commands\nAnimation Commands\nGroup Commands\n","Select","Close");
					}

			        case 1:
			        {
			            new str[1400];
			            strcat(str, "{FFFFFF}Basic Survival Tips:\nThe Indicators on the bottom right of the screen, notifies you when you need more blood, food, water, and heat up (temperature)\n\
		            	{C9FFAB}Light Green = {FFFFFF}Safe\n{37DB45}Dark Green  = {FFFFFF}Safe\n{F3FF02}Yellow = Normal\n{F9B857}Orange = {FFFFFF}Below Normal\n{F81414}Red = {FFFFFF}Near death\n");
						strcat(str,"{37DB45}Food/Hunger{FFFFFF}: Always maintain a balance to keep yourself hydrated with water & full with food!\n\
						{37DB45}Thirst{FFFFFF}: Running, swimming, getting shot drops, makes you get thirsty alot, make sure you have drinks with you all the time!\n");
						strcat(str,"{37DB45}Blood{FFFFFF}: Important key in survival. Low blood causes blackend screen, shaking screen, less stamnia. Visit the hospitals!\n");
						strcat(str,"{37DB45}Temperature{FFFFFF}: Your temperature decreases if you swim or jump alot. It increases if you sprint alot or use a heatpack to increase it!\n\
						{37DB45}Humanity{FFFFFF}: If the skull if green means you are a hero or a normal player which is safe for most players.\nAs for Red it means you are a bandit you may be killed on sight!\n");
						strcat(str,"{37DB45}Noise{FFFFFF}: Vision sight for zombies. Name tag showns further if you're making alot of noise!\n\
						{37DB45}Eye Sight{FFFFFF}: Name Tag seen through walls.\n");
						ShowPlayerDialog(playerid, 8343, DIALOG_STYLE_MSGBOX, "DayZ - Survival Tips", str, "Close", "");
					}

					case 2:
					{
					    ShowPlayerDialog(playerid, 8343, DIALOG_STYLE_MSGBOX, "DayZ - Zombies", "Will be added when zombies are added again!", "Close", "");
					}
				}
			}
		}

		case DIALOG_OPTIONS:
		{
			if(response)
			{
			    switch(listitem)
			    {
			        case 0: ShowPlayerDialog(playerid, DIALOG_GENDEROPTION_2, DIALOG_STYLE_MSGBOX, "DayZ - Gender Selection", "Please, select the default gender you wish to spawn with.", "Male", "Female");
			        case 1: ShowPlayerDialog(playerid, DIALOG_AMBIENTOPTION_2, DIALOG_STYLE_MSGBOX, "DayZ - Ambient Background", "Enable or disable the background ambient?", "ON", "OFF");
				}
			}
		}

		case DIALOG_GENDEROPTION_2:
		{
			if(response)
			{
				pInfo[playerid][DefaultGender] = MALE_ID;
				SendClientMessage(playerid, -1, ""chat" You have sucessfully changed your default gender to MALE this will be saved.");
			}

			if(!response)
			{
				pInfo[playerid][DefaultGender] = FEMALE_ID;
				SendClientMessage(playerid, -1, ""chat" You have sucessfully changed your default gender to FEMALE this will be saved.");
			}
		}

		case DIALOG_AMBIENTOPTION_2:
		{
			if(response)
			{
				pInfo[playerid][pAmbientEnable] = 1;
				SendClientMessage(playerid, -1, ""chat" You have sucessfully changed ambient background to ON this will be saved.");
			}

			if(!response)
			{
				pInfo[playerid][pAmbientEnable] = 2;
				SendClientMessage(playerid, -1, ""chat" You have sucessfully changed ambient background to OFF this will be saved.");
			}
		}

	    case DIALOG_RADIO:
		{
			if(response)
			{
			    switch(listitem)
			    {
			        case 0: pInfo[playerid][pRadioFreq] = 60.0, SendClientMessage(playerid,-1,""chat" You've changed your radio frequency meter to low!");
			        case 1: pInfo[playerid][pRadioFreq] = 100.0, SendClientMessage(playerid,-1,""chat" You've changed your radio frequency meter to medium!");
			        case 2: pInfo[playerid][pRadioFreq] = 160.0, SendClientMessage(playerid,-1,""chat" You've changed your radio frequency meter to normal!");
			        case 3: pInfo[playerid][pRadioFreq] = 200.0, SendClientMessage(playerid,-1,""chat" You've changed your radio frequency meter to high!");
				}
			}
		}

		case DIALOG_TENT_VIEW:
		{
			if(response)
			{
			    pInfo[playerid][pTentLink] = listitem;
				ShowPlayerDialog(playerid,DIALOG_TENT_VIEW_S,DIALOG_STYLE_MSGBOX,""COL_WHITE"Viewing Tent"COL_GREEN" (16 SLOTS)","Please select an option!","Add Item","Take Item");
			}
		}

		case DIALOG_TENT_VIEW_S:
		{
			if(response)
			{
			    ShowInventoryTent(playerid);
			}

			if(!response)
			{
			    new str[64], strv[64];
				if(pInfo[playerid][pTentLink] == 0)
				{
					AddSlotToInventoryWorld(playerid,Tent[GetTentID(playerid)][tentSlot1],1);
					format(str,sizeof(str),""chat" Taken item '%s' from tent storage slot 1",Tent[GetTentID(playerid)][tentSlot1]);
					SendClientMessage(playerid,-1,str);
					format(strv,sizeof(strv),"Empty Slot");
					Tent[GetTentID(playerid)][tentSlot1] = strv;
				}

				if(pInfo[playerid][pTentLink] == 1)
				{
					AddSlotToInventoryWorld(playerid,Tent[GetTentID(playerid)][tentSlot2],1);
					format(str,sizeof(str),""chat" Taken item '%s' from tent storage slot 2",Tent[GetTentID(playerid)][tentSlot2]);
					SendClientMessage(playerid,-1,str);
					format(strv,sizeof(strv),"Empty Slot");
					Tent[GetTentID(playerid)][tentSlot2] = strv;
				}

				if(pInfo[playerid][pTentLink] == 2)
				{
					AddSlotToInventoryWorld(playerid,Tent[GetTentID(playerid)][tentSlot3],1);
					format(str,sizeof(str),""chat" Taken item '%s' from tent storage slot 3",Tent[GetTentID(playerid)][tentSlot3]);
					SendClientMessage(playerid,-1,str);
					format(strv,sizeof(strv),"Empty Slot");
					Tent[GetTentID(playerid)][tentSlot3] = strv;
				}

				if(pInfo[playerid][pTentLink] == 3)
				{
					AddSlotToInventoryWorld(playerid,Tent[GetTentID(playerid)][tentSlot4],1);
					format(str,sizeof(str),""chat" Taken item '%s' from tent storage slot 4",Tent[GetTentID(playerid)][tentSlot4]);
					SendClientMessage(playerid,-1,str);
					format(strv,sizeof(strv),"Empty Slot");
					Tent[GetTentID(playerid)][tentSlot4] = strv;
				}

				if(pInfo[playerid][pTentLink] == 4)
				{
					AddSlotToInventoryWorld(playerid,Tent[GetTentID(playerid)][tentSlot5],1);
					format(str,sizeof(str),""chat" Taken item '%s' from tent storage slot 5",Tent[GetTentID(playerid)][tentSlot5]);
					SendClientMessage(playerid,-1,str);
					format(strv,sizeof(strv),"Empty Slot");
					Tent[GetTentID(playerid)][tentSlot5] = strv;
				}

				if(pInfo[playerid][pTentLink] == 5)
				{
					AddSlotToInventoryWorld(playerid,Tent[GetTentID(playerid)][tentSlot6],1);
					format(str,sizeof(str),""chat" Taken item '%s' from tent storage slot 6",Tent[GetTentID(playerid)][tentSlot6]);
					SendClientMessage(playerid,-1,str);
					format(strv,sizeof(strv),"Empty Slot");
					Tent[GetTentID(playerid)][tentSlot6] = strv;
				}

				if(pInfo[playerid][pTentLink] == 6)
				{
					AddSlotToInventoryWorld(playerid,Tent[GetTentID(playerid)][tentSlot7],1);
					format(str,sizeof(str),""chat" Taken item '%s' from tent storage slot 7",Tent[GetTentID(playerid)][tentSlot7]);
					SendClientMessage(playerid,-1,str);
					format(strv,sizeof(strv),"Empty Slot");
					Tent[GetTentID(playerid)][tentSlot7] = strv;
				}

				if(pInfo[playerid][pTentLink] == 7)
				{
					AddSlotToInventoryWorld(playerid,Tent[GetTentID(playerid)][tentSlot8],1);
					format(str,sizeof(str),""chat" Taken item '%s' from tent storage slot 8",Tent[GetTentID(playerid)][tentSlot8]);
					SendClientMessage(playerid,-1,str);
					format(strv,sizeof(strv),"Empty Slot");
					Tent[GetTentID(playerid)][tentSlot8] = strv;
				}

				if(pInfo[playerid][pTentLink] == 8)
				{
					AddSlotToInventoryWorld(playerid,Tent[GetTentID(playerid)][tentSlot9],1);
					format(str,sizeof(str),""chat" Taken item '%s' from tent storage slot 9",Tent[GetTentID(playerid)][tentSlot9]);
					SendClientMessage(playerid,-1,str);
					format(strv,sizeof(strv),"Empty Slot");
					Tent[GetTentID(playerid)][tentSlot9] = strv;
				}

				if(pInfo[playerid][pTentLink] == 9)
				{
					AddSlotToInventoryWorld(playerid,Tent[GetTentID(playerid)][tentSlot10],1);
					format(str,sizeof(str),""chat" Taken item '%s' from tent storage slot 10",Tent[GetTentID(playerid)][tentSlot10]);
					SendClientMessage(playerid,-1,str);
					format(strv,sizeof(strv),"Empty Slot");
					Tent[GetTentID(playerid)][tentSlot10] = strv;
				}

				if(pInfo[playerid][pTentLink] == 10)
				{
					AddSlotToInventoryWorld(playerid,Tent[GetTentID(playerid)][tentSlot11],1);
					format(str,sizeof(str),""chat" Taken item '%s' from tent storage slot 11",Tent[GetTentID(playerid)][tentSlot11]);
					SendClientMessage(playerid,-1,str);
					format(strv,sizeof(strv),"Empty Slot");
					Tent[GetTentID(playerid)][tentSlot11] = strv;
				}

				if(pInfo[playerid][pTentLink] == 11)
				{
					AddSlotToInventoryWorld(playerid,Tent[GetTentID(playerid)][tentSlot12],1);
					format(str,sizeof(str),""chat" Taken item '%s' from tent storage slot 12",Tent[GetTentID(playerid)][tentSlot12]);
					SendClientMessage(playerid,-1,str);
					format(strv,sizeof(strv),"Empty Slot");
					Tent[GetTentID(playerid)][tentSlot12] = strv;
				}

				if(pInfo[playerid][pTentLink] == 12)
				{
					AddSlotToInventoryWorld(playerid,Tent[GetTentID(playerid)][tentSlot13],1);
					format(str,sizeof(str),""chat" Taken item '%s' from tent storage slot 13",Tent[GetTentID(playerid)][tentSlot13]);
					SendClientMessage(playerid,-1,str);
					format(strv,sizeof(strv),"Empty Slot");
					Tent[GetTentID(playerid)][tentSlot13] = strv;
				}

				if(pInfo[playerid][pTentLink] == 13)
				{
					AddSlotToInventoryWorld(playerid,Tent[GetTentID(playerid)][tentSlot14],1);
					format(str,sizeof(str),""chat" Taken item '%s' from tent storage slot 14",Tent[GetTentID(playerid)][tentSlot14]);
					SendClientMessage(playerid,-1,str);
					format(strv,sizeof(strv),"Empty Slot");
					Tent[GetTentID(playerid)][tentSlot14] = strv;
				}

				if(pInfo[playerid][pTentLink] == 14)
				{
					AddSlotToInventoryWorld(playerid,Tent[GetTentID(playerid)][tentSlot15],1);
					format(str,sizeof(str),""chat" Taken item '%s' from tent storage slot 15",Tent[GetTentID(playerid)][tentSlot15]);
					SendClientMessage(playerid,-1,str);
					format(strv,sizeof(strv),"Empty Slot");
					Tent[GetTentID(playerid)][tentSlot15] = strv;
				}

				if(pInfo[playerid][pTentLink] == 15)
				{
					AddSlotToInventoryWorld(playerid,Tent[GetTentID(playerid)][tentSlot16],1);
					format(str,sizeof(str),""chat" Taken item '%s' from tent storage slot 16",Tent[GetTentID(playerid)][tentSlot16]);
					SendClientMessage(playerid,-1,str);
					format(strv,sizeof(strv),"Empty Slot");
					Tent[GetTentID(playerid)][tentSlot16] = strv;
				}
			}
		}


		case DIALOG_TENT_VIEW_S2:
		{
			if(response)
			{
			    new str[64],str2[128];
				if(pInfo[playerid][pTentLink] == 0)
				{
				    format(gItemList,MAX_ITEM_NAME,inputtext[strfind(inputtext,"\t")+2]);
					RemoveSlotToInventory(playerid,gItemList,1);
					format(str,sizeof(str),"%s",gItemList);
					Tent[GetTentID(playerid)][tentSlot1] = str;
					format(str2,sizeof(str2),""chat" Added the item '%s' to slot 1!",inputtext);
					SendClientMessage(playerid,-1,str2);
				}

				if(pInfo[playerid][pTentLink] == 1)
				{
				    format(gItemList,MAX_ITEM_NAME,inputtext[strfind(inputtext,"\t")+2]);
					RemoveSlotToInventory(playerid,gItemList,1);
					format(str,sizeof(str),"%s",gItemList);
					Tent[GetTentID(playerid)][tentSlot2] = str;
					format(str2,sizeof(str2),""chat" Added the item '%s' to slot 2!",inputtext);
					SendClientMessage(playerid,-1,str2);
				}

				if(pInfo[playerid][pTentLink] == 2)
				{
				    format(gItemList,MAX_ITEM_NAME,inputtext[strfind(inputtext,"\t")+2]);
					RemoveSlotToInventory(playerid,gItemList,1);
					format(str,sizeof(str),"%s",gItemList);
                    Tent[GetTentID(playerid)][tentSlot3] = str;
					format(str2,sizeof(str2),""chat" Added the item '%s' to slot 3!",inputtext);
					SendClientMessage(playerid,-1,str2);
				}

				if(pInfo[playerid][pTentLink] == 3)
				{
				    format(gItemList,MAX_ITEM_NAME,inputtext[strfind(inputtext,"\t")+2]);
					RemoveSlotToInventory(playerid,gItemList,1);
					format(str,sizeof(str),"%s",gItemList);
					Tent[GetTentID(playerid)][tentSlot4] = str;
					format(str2,sizeof(str2),""chat" Added the item '%s' to slot 4!",inputtext);
					SendClientMessage(playerid,-1,str2);
				}

				if(pInfo[playerid][pTentLink] == 4)
				{
				    format(gItemList,MAX_ITEM_NAME,inputtext[strfind(inputtext,"\t")+2]);
					RemoveSlotToInventory(playerid,gItemList,1);
					format(str,sizeof(str),"%s",gItemList);
					Tent[GetTentID(playerid)][tentSlot5] = str;
					format(str2,sizeof(str2),""chat" Added the item '%s' to slot 5!",inputtext);
					SendClientMessage(playerid,-1,str2);
				}

				if(pInfo[playerid][pTentLink] == 5)
				{
				    format(gItemList,MAX_ITEM_NAME,inputtext[strfind(inputtext,"\t")+2]);
					RemoveSlotToInventory(playerid,gItemList,1);
					format(str,sizeof(str),"%s",gItemList);
					Tent[GetTentID(playerid)][tentSlot6] = str;
					format(str2,sizeof(str2),""chat" Added the item '%s' to slot 6!",inputtext);
					SendClientMessage(playerid,-1,str2);
				}

				if(pInfo[playerid][pTentLink] == 6)
				{
				    format(gItemList,MAX_ITEM_NAME,inputtext[strfind(inputtext,"\t")+2]);
					RemoveSlotToInventory(playerid,gItemList,1);
					format(str,sizeof(str),"%s",gItemList);
					Tent[GetTentID(playerid)][tentSlot7] = str;
					format(str2,sizeof(str2),""chat" Added the item '%s' to slot 7!",inputtext);
					SendClientMessage(playerid,-1,str2);
				}

				if(pInfo[playerid][pTentLink] == 7)
				{
				    format(gItemList,MAX_ITEM_NAME,inputtext[strfind(inputtext,"\t")+2]);
					RemoveSlotToInventory(playerid,gItemList,1);
					format(str,sizeof(str),"%s",gItemList);
					Tent[GetTentID(playerid)][tentSlot8] = str;
					format(str2,sizeof(str2),""chat" Added the item '%s' to slot 8!",inputtext);
					SendClientMessage(playerid,-1,str2);
				}

				if(pInfo[playerid][pTentLink] == 8)
				{
				    format(gItemList,MAX_ITEM_NAME,inputtext[strfind(inputtext,"\t")+2]);
					RemoveSlotToInventory(playerid,gItemList,1);
					format(str,sizeof(str),"%s",gItemList);
					Tent[GetTentID(playerid)][tentSlot9] = str;
					format(str2,sizeof(str2),""chat" Added the item '%s' to slot 9!",inputtext);
					SendClientMessage(playerid,-1,str2);
				}

				if(pInfo[playerid][pTentLink] == 9)
				{
				    format(gItemList,MAX_ITEM_NAME,inputtext[strfind(inputtext,"\t")+2]);
					RemoveSlotToInventory(playerid,gItemList,1);
					format(str,sizeof(str),"%s",gItemList);
					Tent[GetTentID(playerid)][tentSlot10] = str;
					format(str2,sizeof(str2),""chat" Added the item '%s' to slot 10!",inputtext);
					SendClientMessage(playerid,-1,str2);
				}

				if(pInfo[playerid][pTentLink] == 10)
				{
				    format(gItemList,MAX_ITEM_NAME,inputtext[strfind(inputtext,"\t")+2]);
					RemoveSlotToInventory(playerid,gItemList,1);
					format(str,sizeof(str),"%s",gItemList);
					Tent[GetTentID(playerid)][tentSlot11] = str;
					format(str2,sizeof(str2),""chat" Added the item '%s' to slot 11!",inputtext);
					SendClientMessage(playerid,-1,str2);
				}

				if(pInfo[playerid][pTentLink] == 11)
				{
				    format(gItemList,MAX_ITEM_NAME,inputtext[strfind(inputtext,"\t")+2]);
					RemoveSlotToInventory(playerid,gItemList,1);
					format(str,sizeof(str),"%s",gItemList);
					Tent[GetTentID(playerid)][tentSlot12] = str;
					format(str2,sizeof(str2),""chat" Added the item '%s' to slot 12!",inputtext);
					SendClientMessage(playerid,-1,str2);
				}

				if(pInfo[playerid][pTentLink] == 12)
				{
				    format(gItemList,MAX_ITEM_NAME,inputtext[strfind(inputtext,"\t")+2]);
					RemoveSlotToInventory(playerid,gItemList,1);
					format(str,sizeof(str),"%s",gItemList);
					Tent[GetTentID(playerid)][tentSlot13] = str;
					format(str2,sizeof(str2),""chat" Added the item '%s' to slot 13!",inputtext);
					SendClientMessage(playerid,-1,str2);
				}

				if(pInfo[playerid][pTentLink] == 13)
				{
				    format(gItemList,MAX_ITEM_NAME,inputtext[strfind(inputtext,"\t")+2]);
					RemoveSlotToInventory(playerid,gItemList,1);
					format(str,sizeof(str),"%s",gItemList);
					Tent[GetTentID(playerid)][tentSlot14] = str;
					format(str2,sizeof(str2),""chat" Added the item '%s' to slot 14!",inputtext);
					SendClientMessage(playerid,-1,str2);
				}

				if(pInfo[playerid][pTentLink] == 14)
				{
				    format(gItemList,MAX_ITEM_NAME,inputtext[strfind(inputtext,"\t")+2]);
					RemoveSlotToInventory(playerid,gItemList,1);
					format(str,sizeof(str),"%s",gItemList);
					Tent[GetTentID(playerid)][tentSlot15] = str;
					format(str2,sizeof(str2),""chat" Added the item '%s' to slot 15!",inputtext);
					SendClientMessage(playerid,-1,str2);
				}

				if(pInfo[playerid][pTentLink] == 15)
				{
				    format(gItemList,MAX_ITEM_NAME,inputtext[strfind(inputtext,"\t")+2]);
					RemoveSlotToInventory(playerid,gItemList,1);
					format(str,sizeof(str),"%s",gItemList);
					Tent[GetTentID(playerid)][tentSlot16] = str;
					format(str2,sizeof(str2),""chat" Added the item '%s' to slot 16!",inputtext);
					SendClientMessage(playerid,-1,str2);
				}
			}
		}

		case DIALOG_VEHICLE_STORAGE:
		{
			if(response)
			{
			    pInfo[playerid][pStorageLink] = listitem;
				ShowPlayerDialog(playerid,DIALOG_VEHICLE_STORAGE_S,DIALOG_STYLE_MSGBOX,""COL_WHITE"Vehicle Storage"COL_GREEN" (4 SLOTS)","Please select an option!","Add Item","Take Item");
			}
		}

		case DIALOG_VEHICLE_STORAGE_S:
		{
			if(response)
			{
			    ShowInventoryStorage(playerid);
			}

			if(!response)
			{
			    new str[64], strv[64];
				if(pInfo[playerid][pStorageLink] == 0)
				{
					AddSlotToInventoryWorld(playerid,vInfo[GetVehicleNearID(playerid)][vSlot1],1);
					format(str,sizeof(str),""chat" Taken item '%s' from vehicle storage slot 1",vInfo[GetVehicleNearID(playerid)][vSlot1]);
					SendClientMessage(playerid,-1,str);
					format(strv,sizeof(strv),"Empty Slot");
					vInfo[GetVehicleNearID(playerid)][vSlot1] = strv;
					if(!IsPlayerInAnyVehicle(playerid))
		  			{
						ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
						defer ResetAction(playerid, ACTION_ANIMATION);
					}
				}

				if(pInfo[playerid][pStorageLink] == 1)
				{
					AddSlotToInventoryWorld(playerid,vInfo[GetVehicleNearID(playerid)][vSlot2],1);
					format(str,sizeof(str),""chat" Taken item '%s' from vehicle storage slot 2",vInfo[GetVehicleNearID(playerid)][vSlot2]);
					SendClientMessage(playerid,-1,str);
					format(strv,sizeof(strv),"Empty Slot");
					vInfo[GetVehicleNearID(playerid)][vSlot2] = strv;
					if(!IsPlayerInAnyVehicle(playerid))
		  			{
						ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
						defer ResetAction(playerid, ACTION_ANIMATION);
					}
				}

				if(pInfo[playerid][pStorageLink] == 2)
				{
					AddSlotToInventoryWorld(playerid,vInfo[GetVehicleNearID(playerid)][vSlot3],1);
					format(str,sizeof(str),""chat" Taken item '%s' from vehicle storage slot 3",vInfo[GetVehicleNearID(playerid)][vSlot3]);
					SendClientMessage(playerid,-1,str);
					format(strv,sizeof(strv),"Empty Slot");
					vInfo[GetVehicleNearID(playerid)][vSlot3] = strv;
					if(!IsPlayerInAnyVehicle(playerid))
		  			{
						ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
						defer ResetAction(playerid, ACTION_ANIMATION);
					}
				}

				if(pInfo[playerid][pStorageLink] == 3)
				{
					AddSlotToInventoryWorld(playerid,vInfo[GetVehicleNearID(playerid)][vSlot4],1);
					format(str,sizeof(str),""chat" Taken item '%s' from vehicle storage slot 4",vInfo[GetVehicleNearID(playerid)][vSlot4]);
					SendClientMessage(playerid,-1,str);
					format(strv,sizeof(strv),"Empty Slot");
					vInfo[GetVehicleNearID(playerid)][vSlot4] = strv;
					if(!IsPlayerInAnyVehicle(playerid))
		  			{
						ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
						defer ResetAction(playerid, ACTION_ANIMATION);
					}
				}

				if(pInfo[playerid][pStorageLink] == 4)
				{
					AddSlotToInventoryWorld(playerid,vInfo[GetVehicleNearID(playerid)][vSlot6],1);
					format(str,sizeof(str),""chat" Taken item '%s' from vehicle storage slot 5",vInfo[GetVehicleNearID(playerid)][vSlot6]);
					SendClientMessage(playerid,-1,str);
					format(strv,sizeof(strv),"Empty Slot");
					vInfo[GetVehicleNearID(playerid)][vSlot6] = strv;
					if(!IsPlayerInAnyVehicle(playerid))
		  			{
						ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
						defer ResetAction(playerid, ACTION_ANIMATION);
					}
				}

				if(pInfo[playerid][pStorageLink] == 5)
				{
					AddSlotToInventoryWorld(playerid,vInfo[GetVehicleNearID(playerid)][vSlot6],1);
					format(str,sizeof(str),""chat" Taken item '%s' from vehicle storage slot 6",vInfo[GetVehicleNearID(playerid)][vSlot6]);
					SendClientMessage(playerid,-1,str);
					format(strv,sizeof(strv),"Empty Slot");
					vInfo[GetVehicleNearID(playerid)][vSlot6] = strv;
					if(!IsPlayerInAnyVehicle(playerid))
		  			{
						ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
						defer ResetAction(playerid, ACTION_ANIMATION);
					}
				}
			}
		}


		case DIALOG_VEHICLE_STORAGE_S2:
		{
			if(response)
			{
			    new str[64],str2[128],strv[64];
			    //format(reset,sizeof(reset),"Empty Slot");
				if(pInfo[playerid][pStorageLink] == 0)
				{
				    format(gItemList,MAX_ITEM_NAME,inputtext[strfind(inputtext,"\t")+2]);
					RemoveSlotToInventory(playerid,gItemList,1);
					format(str,sizeof(str),"%s",gItemList);
					vInfo[GetVehicleNearID(playerid)][vSlot1] = str;
					format(str2,sizeof(str2),""chat" Added the item '%s' to slot 1!",inputtext);
					SendClientMessage(playerid,-1,str2);
	    			if(strfind(str, "Engine", true) != -1)
				    {
    					if(vInfo[GetVehicleNearID(playerid)][vehicleEngine] == 1) return SendClientMessage(playerid,-1,""chat" This vehicle already has an engine the engine has been put back into your backpack!"),AddSlotToInventoryWorld(playerid,"Engine",1);
						vInfo[GetVehicleNearID(playerid)][vehicleEngine] = 1;
      					format(strv,sizeof(strv),"Empty Slot");
						vInfo[GetVehicleNearID(playerid)][vSlot1] = strv;
						if(!IsPlayerInAnyVehicle(playerid))
			  			{
							ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
							defer ResetAction(playerid, ACTION_ANIMATION);
						}
					}

					if(strfind(str, "Tire", true) != -1)
					{
           				if(FOUR_TIRE_ADD1(playerid) || FOUR_TIRE_ADD2(playerid))
						{
							if(vInfo[GetVehicleNearID(playerid)][vehicleTires] == 4) return SendClientMessage(playerid,-1,""chat" Vehicle already has enough tires the tire has been put back into your backpack!!"),AddSlotToInventoryWorld(playerid,"Tire",1),format(strv,sizeof(strv),"Empty Slot"),vInfo[GetVehicleNearID(playerid)][vSlot1] = strv;
							vInfo[GetVehicleNearID(playerid)][vehicleTires] += 1;
							format(strv,sizeof(strv),"Empty Slot");
							vInfo[GetVehicleNearID(playerid)][vSlot1] = strv;
							if(!IsPlayerInAnyVehicle(playerid))
				  			{
								ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
								defer ResetAction(playerid, ACTION_ANIMATION);
							}
						}

						if(TWO_TIRE_VEHICLE_ADD)
						{
							if(vInfo[GetVehicleNearID(playerid)][vehicleTires] == 2) return SendClientMessage(playerid,-1,""chat" Vehicle already has enough tires the tire has been put back into your backpack!!"),AddSlotToInventoryWorld(playerid,"Tire",1),format(strv,sizeof(strv),"Empty Slot"),vInfo[GetVehicleNearID(playerid)][vSlot1] = strv;
							vInfo[GetVehicleNearID(playerid)][vehicleTires] += 1;
							format(strv,sizeof(strv),"Empty Slot");
							vInfo[GetVehicleNearID(playerid)][vSlot1] = strv;
							if(!IsPlayerInAnyVehicle(playerid))
				  			{
								ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
								defer ResetAction(playerid, ACTION_ANIMATION);
							}
						}

						if(SIX_TIRE_VEHICLE_ADD)
						{
							if(vInfo[GetVehicleNearID(playerid)][vehicleTires] == 6) return SendClientMessage(playerid,-1,""chat" Vehicle already has enough tires the tire has been put back into your backpack!!"),AddSlotToInventoryWorld(playerid,"Tire",1),format(strv,sizeof(strv),"Empty Slot"),vInfo[GetVehicleNearID(playerid)][vSlot1] = strv;
							vInfo[GetVehicleNearID(playerid)][vehicleTires] += 1;
							format(strv,sizeof(strv),"Empty Slot");
							vInfo[GetVehicleNearID(playerid)][vSlot1] = strv;
							if(!IsPlayerInAnyVehicle(playerid))
				  			{
								ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
								defer ResetAction(playerid, ACTION_ANIMATION);
							}
						}

						if(NO_TIRE_VEHICLE_ADD || ENGINE_ONLY_VEHICLE_ADD)
						{
						    SendClientMessage(playerid,-1,""chat" This vehicle does not require any tires the tire has been put back into your inventory!"), AddSlotToInventoryWorld(playerid,"Tire",1);
							format(strv,sizeof(strv),"Empty Slot");
							vInfo[GetVehicleNearID(playerid)][vSlot1] = strv;
							if(!IsPlayerInAnyVehicle(playerid))
				  			{
								ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
								defer ResetAction(playerid, ACTION_ANIMATION);
							}
						}
					}

					if(strfind(str, "Full Jerry Can", true) != -1)
					{
    					if(vInfo[GetVehicleNearID(playerid)][vehicleFuel] == 100) return SendClientMessage(playerid,-1,""chat" Vehicle already has enough fuel, full Jerry Can has been added to your backpack!");
			  	    	vInfo[GetVehicleNearID(playerid)][vehicleFuel] += random(75);
			  	    	AddSlotToInventoryWorld(playerid,"Empty Jerry Can",1);
						format(strv,sizeof(strv),"Empty Slot");
						vInfo[GetVehicleNearID(playerid)][vSlot1] = strv;
						if(!IsPlayerInAnyVehicle(playerid))
	  					{
							ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
							defer ResetAction(playerid, ACTION_ANIMATION);
						}
					}
				}

				if(pInfo[playerid][pStorageLink] == 1)
				{
				    format(gItemList,MAX_ITEM_NAME,inputtext[strfind(inputtext,"\t")+2]);
					RemoveSlotToInventory(playerid,gItemList,1);
					format(str,sizeof(str),"%s",gItemList);
					vInfo[GetVehicleNearID(playerid)][vSlot2] = str;
					format(str2,sizeof(str2),""chat" Added the item '%s' to slot 2!",inputtext);
					SendClientMessage(playerid,-1,str2);
	    			if(strfind(str, "Engine", true) != -1)
				    {
    					if(vInfo[GetVehicleNearID(playerid)][vehicleEngine] == 1) return SendClientMessage(playerid,-1,""chat" This vehicle already has an engine the engine has been put back into your backpack!"),AddSlotToInventoryWorld(playerid,"Engine",1);
						vInfo[GetVehicleNearID(playerid)][vehicleEngine] = 1;
						format(strv,sizeof(strv),"Empty Slot");
						vInfo[GetVehicleNearID(playerid)][vSlot2] = strv;
						if(!IsPlayerInAnyVehicle(playerid))
  						{
							ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
							defer ResetAction(playerid, ACTION_ANIMATION);
						}
					}

					if(strfind(str, "Tire", true) != -1)
					{
           				if(FOUR_TIRE_ADD1(playerid) || FOUR_TIRE_ADD2(playerid))
						{
							if(vInfo[GetVehicleNearID(playerid)][vehicleTires] == 4) return SendClientMessage(playerid,-1,""chat" Vehicle already has enough tires the tire has been put back into your backpack!!"),AddSlotToInventoryWorld(playerid,"Tire",1),format(strv,sizeof(strv),"Empty Slot"),vInfo[GetVehicleNearID(playerid)][vSlot1] = strv;
							vInfo[GetVehicleNearID(playerid)][vehicleTires] += 1;
							format(strv,sizeof(strv),"Empty Slot");
							vInfo[GetVehicleNearID(playerid)][vSlot2] = strv;
							if(!IsPlayerInAnyVehicle(playerid))
	  						{
								ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
								defer ResetAction(playerid, ACTION_ANIMATION);
							}
						}

						if(TWO_TIRE_VEHICLE_ADD)
						{
							if(vInfo[GetVehicleNearID(playerid)][vehicleTires] == 2) return SendClientMessage(playerid,-1,""chat" Vehicle already has enough tires the tire has been put back into your backpack!!"),AddSlotToInventoryWorld(playerid,"Tire",1),format(strv,sizeof(strv),"Empty Slot"),vInfo[GetVehicleNearID(playerid)][vSlot1] = strv;
							vInfo[GetVehicleNearID(playerid)][vehicleTires] += 1;
							format(strv,sizeof(strv),"Empty Slot");
							vInfo[GetVehicleNearID(playerid)][vSlot2] = strv;
							if(!IsPlayerInAnyVehicle(playerid))
	  						{
								ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
								defer ResetAction(playerid, ACTION_ANIMATION);
							}
						}

						if(SIX_TIRE_VEHICLE_ADD)
						{
							if(vInfo[GetVehicleNearID(playerid)][vehicleTires] == 6) return SendClientMessage(playerid,-1,""chat" Vehicle already has enough tires the tire has been put back into your backpack!!"),AddSlotToInventoryWorld(playerid,"Tire",1),format(strv,sizeof(strv),"Empty Slot"),vInfo[GetVehicleNearID(playerid)][vSlot1] = strv;
							vInfo[GetVehicleNearID(playerid)][vehicleTires] += 1;
							format(strv,sizeof(strv),"Empty Slot");
							vInfo[GetVehicleNearID(playerid)][vSlot2] = strv;
							if(!IsPlayerInAnyVehicle(playerid))
	  						{
								ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
								defer ResetAction(playerid, ACTION_ANIMATION);
							}
						}

						if(NO_TIRE_VEHICLE_ADD || ENGINE_ONLY_VEHICLE_ADD)
						{
						    SendClientMessage(playerid,-1,""chat" This vehicle does not require any tires the tire has been put back into your inventory!"), AddSlotToInventoryWorld(playerid,"Tire",1);
							format(strv,sizeof(strv),"Empty Slot");
							vInfo[GetVehicleNearID(playerid)][vSlot2] = strv;
							if(!IsPlayerInAnyVehicle(playerid))
	  						{
								ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
								defer ResetAction(playerid, ACTION_ANIMATION);
							}
						}
					}

					if(strfind(str, "Full Jerry Can", true) != -1)
					{
    					if(vInfo[GetVehicleNearID(playerid)][vehicleFuel] == 100) return SendClientMessage(playerid,-1,""chat" Vehicle already has enough fuel, full Jerry Can has been added to your backpack!");
			  	    	vInfo[GetVehicleNearID(playerid)][vehicleFuel] += random(75);
			  	    	AddSlotToInventoryWorld(playerid,"Empty Jerry Can",1);
						format(strv,sizeof(strv),"Empty Slot");
						vInfo[GetVehicleNearID(playerid)][vSlot2] = strv;
						if(!IsPlayerInAnyVehicle(playerid))
  						{
							ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
							defer ResetAction(playerid, ACTION_ANIMATION);
						}
					}
				}

				if(pInfo[playerid][pStorageLink] == 2)
				{
				    format(gItemList,MAX_ITEM_NAME,inputtext[strfind(inputtext,"\t")+2]);
					RemoveSlotToInventory(playerid,gItemList,1);
					format(str,sizeof(str),"%s",gItemList);
					vInfo[GetVehicleNearID(playerid)][vSlot3] = str;
					format(str2,sizeof(str2),""chat" Added the item '%s' to slot 3!",inputtext);
					SendClientMessage(playerid,-1,str2);
	    			if(strfind(str, "Engine", true) != -1)
				    {
    					if(vInfo[GetVehicleNearID(playerid)][vehicleEngine] == 1) return SendClientMessage(playerid,-1,""chat" This vehicle already has an engine the engine has been put back into your backpack!"),AddSlotToInventoryWorld(playerid,"Engine",1);
						vInfo[GetVehicleNearID(playerid)][vehicleEngine] = 1;
						format(strv,sizeof(strv),"Empty Slot");
						vInfo[GetVehicleNearID(playerid)][vSlot3] = strv;
						if(!IsPlayerInAnyVehicle(playerid))
  						{
							ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
							defer ResetAction(playerid, ACTION_ANIMATION);
						}
					}

					if(strfind(str, "Tire", true) != -1)
					{
           				if(FOUR_TIRE_ADD1(playerid) || FOUR_TIRE_ADD2(playerid))
						{
							if(vInfo[GetVehicleNearID(playerid)][vehicleTires] == 4) return SendClientMessage(playerid,-1,""chat" Vehicle already has enough tires the tire has been put back into your backpack!!"),AddSlotToInventoryWorld(playerid,"Tire",1),format(strv,sizeof(strv),"Empty Slot"),vInfo[GetVehicleNearID(playerid)][vSlot1] = strv;
							vInfo[GetVehicleNearID(playerid)][vehicleTires] += 1;
							format(strv,sizeof(strv),"Empty Slot");
							vInfo[GetVehicleNearID(playerid)][vSlot3] = strv;
							if(!IsPlayerInAnyVehicle(playerid))
	  						{
								ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
								defer ResetAction(playerid, ACTION_ANIMATION);
							}
						}

						if(TWO_TIRE_VEHICLE_ADD)
						{
							if(vInfo[GetVehicleNearID(playerid)][vehicleTires] == 2) return SendClientMessage(playerid,-1,""chat" Vehicle already has enough tires the tire has been put back into your backpack!!"),AddSlotToInventoryWorld(playerid,"Tire",1),format(strv,sizeof(strv),"Empty Slot"),vInfo[GetVehicleNearID(playerid)][vSlot1] = strv;
							vInfo[GetVehicleNearID(playerid)][vehicleTires] += 1;
							format(strv,sizeof(strv),"Empty Slot");
							vInfo[GetVehicleNearID(playerid)][vSlot3] = strv;
							if(!IsPlayerInAnyVehicle(playerid))
	  						{
								ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
								defer ResetAction(playerid, ACTION_ANIMATION);
							}
						}

						if(SIX_TIRE_VEHICLE_ADD)
						{
							if(vInfo[GetVehicleNearID(playerid)][vehicleTires] == 6) return SendClientMessage(playerid,-1,""chat" Vehicle already has enough tires the tire has been put back into your backpack!!"),AddSlotToInventoryWorld(playerid,"Tire",1),format(strv,sizeof(strv),"Empty Slot"),vInfo[GetVehicleNearID(playerid)][vSlot1] = strv;
							vInfo[GetVehicleNearID(playerid)][vehicleTires] += 1;
							format(strv,sizeof(strv),"Empty Slot");
							vInfo[GetVehicleNearID(playerid)][vSlot3] = strv;
							if(!IsPlayerInAnyVehicle(playerid))
	  						{
								ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
								defer ResetAction(playerid, ACTION_ANIMATION);
							}
						}

						if(NO_TIRE_VEHICLE_ADD || ENGINE_ONLY_VEHICLE_ADD)
						{
						    SendClientMessage(playerid,-1,""chat" This vehicle does not require any tires the tire has been put back into your inventory!"), AddSlotToInventoryWorld(playerid,"Tire",1);
							format(strv,sizeof(strv),"Empty Slot");
							vInfo[GetVehicleNearID(playerid)][vSlot3] = strv;
							if(!IsPlayerInAnyVehicle(playerid))
	  						{
								ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
								defer ResetAction(playerid, ACTION_ANIMATION);
							}
						}
					}

					if(strfind(str, "Full Jerry Can", true) != -1)
					{
    					if(vInfo[GetVehicleNearID(playerid)][vehicleFuel] == 100) return SendClientMessage(playerid,-1,""chat" Vehicle already has enough fuel, full Jerry Can has been added to your backpack!");
			  	    	vInfo[GetVehicleNearID(playerid)][vehicleFuel] += random(75);
			  	    	AddSlotToInventoryWorld(playerid,"Empty Jerry Can",1);
						format(strv,sizeof(strv),"Empty Slot");
						vInfo[GetVehicleNearID(playerid)][vSlot3] = strv;
						if(!IsPlayerInAnyVehicle(playerid))
  						{
							ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
							defer ResetAction(playerid, ACTION_ANIMATION);
						}
					}
				}

				if(pInfo[playerid][pStorageLink] == 3)
				{
				    format(gItemList,MAX_ITEM_NAME,inputtext[strfind(inputtext,"\t")+2]);
					RemoveSlotToInventory(playerid,gItemList,1);
					format(str,sizeof(str),"%s",gItemList);
					vInfo[GetVehicleNearID(playerid)][vSlot4] = str;
					format(str2,sizeof(str2),""chat" Added the item '%s' to slot 4!",inputtext);
					SendClientMessage(playerid,-1,str2);
	    			if(strfind(str, "Engine", true) != -1)
				    {
    					if(vInfo[GetVehicleNearID(playerid)][vehicleEngine] == 1) return SendClientMessage(playerid,-1,""chat" This vehicle already has an engine the engine has been put back into your backpack!"),AddSlotToInventoryWorld(playerid,"Engine",1);
						vInfo[GetVehicleNearID(playerid)][vehicleEngine] = 1;
						format(strv,sizeof(strv),"Empty Slot");
						vInfo[GetVehicleNearID(playerid)][vSlot4] = strv;
						if(!IsPlayerInAnyVehicle(playerid))
  						{
							ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
							defer ResetAction(playerid, ACTION_ANIMATION);
						}
					}

					if(strfind(str, "Tire", true) != -1)
					{
           				if(FOUR_TIRE_ADD1(playerid) || FOUR_TIRE_ADD2(playerid))
						{
							if(vInfo[GetVehicleNearID(playerid)][vehicleTires] == 4) return SendClientMessage(playerid,-1,""chat" Vehicle already has enough tires the tire has been put back into your backpack!!"),AddSlotToInventoryWorld(playerid,"Tire",1),format(strv,sizeof(strv),"Empty Slot"),vInfo[GetVehicleNearID(playerid)][vSlot1] = strv;
							vInfo[GetVehicleNearID(playerid)][vehicleTires] += 1;
							format(strv,sizeof(strv),"Empty Slot");
							vInfo[GetVehicleNearID(playerid)][vSlot4] = strv;
							if(!IsPlayerInAnyVehicle(playerid))
	  						{
								ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
								defer ResetAction(playerid, ACTION_ANIMATION);
							}
						}

						if(TWO_TIRE_VEHICLE_ADD)
						{
							if(vInfo[GetVehicleNearID(playerid)][vehicleTires] == 2) return SendClientMessage(playerid,-1,""chat" Vehicle already has enough tires the tire has been put back into your backpack!!"),AddSlotToInventoryWorld(playerid,"Tire",1),format(strv,sizeof(strv),"Empty Slot"),vInfo[GetVehicleNearID(playerid)][vSlot1] = strv;
							vInfo[GetVehicleNearID(playerid)][vehicleTires] += 1;
							format(strv,sizeof(strv),"Empty Slot");
							vInfo[GetVehicleNearID(playerid)][vSlot4] = strv;
							if(!IsPlayerInAnyVehicle(playerid))
	  						{
								ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
								defer ResetAction(playerid, ACTION_ANIMATION);
							}
						}

						if(SIX_TIRE_VEHICLE_ADD)
						{
							if(vInfo[GetVehicleNearID(playerid)][vehicleTires] == 6) return SendClientMessage(playerid,-1,""chat" Vehicle already has enough tires the tire has been put back into your backpack!!"),AddSlotToInventoryWorld(playerid,"Tire",1),format(strv,sizeof(strv),"Empty Slot"),vInfo[GetVehicleNearID(playerid)][vSlot1] = strv;
							vInfo[GetVehicleNearID(playerid)][vehicleTires] += 1;
							format(strv,sizeof(strv),"Empty Slot");
							vInfo[GetVehicleNearID(playerid)][vSlot4] = strv;
							if(!IsPlayerInAnyVehicle(playerid))
	  						{
								ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
								defer ResetAction(playerid, ACTION_ANIMATION);
							}
						}

						if(NO_TIRE_VEHICLE_ADD || ENGINE_ONLY_VEHICLE_ADD)
						{
						    SendClientMessage(playerid,-1,""chat" This vehicle does not require any tires the tire has been put back into your inventory!"), AddSlotToInventoryWorld(playerid,"Tire",1);
							format(strv,sizeof(strv),"Empty Slot");
							vInfo[GetVehicleNearID(playerid)][vSlot4] = strv;
							if(!IsPlayerInAnyVehicle(playerid))
	  						{
								ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
								defer ResetAction(playerid, ACTION_ANIMATION);
							}
						}
					}

					if(strfind(str, "Full Jerry Can", true) != -1)
					{
    					if(vInfo[GetVehicleNearID(playerid)][vehicleFuel] == 100) return SendClientMessage(playerid,-1,""chat" Vehicle already has enough fuel, full Jerry Can has been added to your backpack!");
			  	    	vInfo[GetVehicleNearID(playerid)][vehicleFuel] += random(75);
			  	    	AddSlotToInventoryWorld(playerid,"Empty Jerry Can",1);
						format(strv,sizeof(strv),"Empty Slot");
						vInfo[GetVehicleNearID(playerid)][vSlot4] = strv;
						if(!IsPlayerInAnyVehicle(playerid))
  						{
							ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
							defer ResetAction(playerid, ACTION_ANIMATION);
						}
					}
				}

				if(pInfo[playerid][pStorageLink] == 4)
				{
				    format(gItemList,MAX_ITEM_NAME,inputtext[strfind(inputtext,"\t")+2]);
					RemoveSlotToInventory(playerid,gItemList,1);
					format(str,sizeof(str),"%s",gItemList);
					vInfo[GetVehicleNearID(playerid)][vSlot5] = str;
					format(str2,sizeof(str2),""chat" Added the item '%s' to slot 5!",inputtext);
					SendClientMessage(playerid,-1,str2);
	    			if(strfind(str, "Engine", true) != -1)
				    {
    					if(vInfo[GetVehicleNearID(playerid)][vehicleEngine] == 1) return SendClientMessage(playerid,-1,""chat" This vehicle already has an engine the engine has been put back into your backpack!"),AddSlotToInventoryWorld(playerid,"Engine",1);
						vInfo[GetVehicleNearID(playerid)][vehicleEngine] = 1;
						format(strv,sizeof(strv),"Empty Slot");
						vInfo[GetVehicleNearID(playerid)][vSlot5] = strv;
						if(!IsPlayerInAnyVehicle(playerid))
  						{
							ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
							defer ResetAction(playerid, ACTION_ANIMATION);
						}
					}

					if(strfind(str, "Tire", true) != -1)
					{
           				if(FOUR_TIRE_ADD1(playerid) || FOUR_TIRE_ADD2(playerid))
						{
							if(vInfo[GetVehicleNearID(playerid)][vehicleTires] == 4) return SendClientMessage(playerid,-1,""chat" Vehicle already has enough tires the tire has been put back into your backpack!!"),AddSlotToInventoryWorld(playerid,"Tire",1),format(strv,sizeof(strv),"Empty Slot"),vInfo[GetVehicleNearID(playerid)][vSlot1] = strv;
							vInfo[GetVehicleNearID(playerid)][vehicleTires] += 1;
							format(strv,sizeof(strv),"Empty Slot");
							vInfo[GetVehicleNearID(playerid)][vSlot5] = strv;
							if(!IsPlayerInAnyVehicle(playerid))
	  						{
								ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
								defer ResetAction(playerid, ACTION_ANIMATION);
							}
						}

						if(TWO_TIRE_VEHICLE_ADD)
						{
							if(vInfo[GetVehicleNearID(playerid)][vehicleTires] == 2) return SendClientMessage(playerid,-1,""chat" Vehicle already has enough tires the tire has been put back into your backpack!!"),AddSlotToInventoryWorld(playerid,"Tire",1),format(strv,sizeof(strv),"Empty Slot"),vInfo[GetVehicleNearID(playerid)][vSlot1] = strv;
							vInfo[GetVehicleNearID(playerid)][vehicleTires] += 1;
							format(strv,sizeof(strv),"Empty Slot");
							vInfo[GetVehicleNearID(playerid)][vSlot5] = strv;
							if(!IsPlayerInAnyVehicle(playerid))
	  						{
								ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
								defer ResetAction(playerid, ACTION_ANIMATION);
							}
						}

						if(SIX_TIRE_VEHICLE_ADD)
						{
							if(vInfo[GetVehicleNearID(playerid)][vehicleTires] == 6) return SendClientMessage(playerid,-1,""chat" Vehicle already has enough tires the tire has been put back into your backpack!!"),AddSlotToInventoryWorld(playerid,"Tire",1),format(strv,sizeof(strv),"Empty Slot"),vInfo[GetVehicleNearID(playerid)][vSlot1] = strv;
							vInfo[GetVehicleNearID(playerid)][vehicleTires] += 1;
							format(strv,sizeof(strv),"Empty Slot");
							vInfo[GetVehicleNearID(playerid)][vSlot5] = strv;
							if(!IsPlayerInAnyVehicle(playerid))
	  						{
								ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
								defer ResetAction(playerid, ACTION_ANIMATION);
							}
						}

						if(NO_TIRE_VEHICLE_ADD || ENGINE_ONLY_VEHICLE_ADD)
						{
						    SendClientMessage(playerid,-1,""chat" This vehicle does not require any tires the tire has been put back into your inventory!"), AddSlotToInventoryWorld(playerid,"Tire",1);
							format(strv,sizeof(strv),"Empty Slot");
							vInfo[GetVehicleNearID(playerid)][vSlot5] = strv;
							if(!IsPlayerInAnyVehicle(playerid))
	  						{
								ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
								defer ResetAction(playerid, ACTION_ANIMATION);
							}
						}
					}

					if(strfind(str, "Full Jerry Can", true) != -1)
					{
    					if(vInfo[GetVehicleNearID(playerid)][vehicleFuel] == 100) return SendClientMessage(playerid,-1,""chat" Vehicle already has enough fuel, full Jerry Can has been added to your backpack!");
			  	    	vInfo[GetVehicleNearID(playerid)][vehicleFuel] += random(75);
			  	    	AddSlotToInventoryWorld(playerid,"Empty Jerry Can",1);
						format(strv,sizeof(strv),"Empty Slot");
						vInfo[GetVehicleNearID(playerid)][vSlot5] = strv;
						if(!IsPlayerInAnyVehicle(playerid))
  						{
							ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
							defer ResetAction(playerid, ACTION_ANIMATION);
						}
					}
				}

				if(pInfo[playerid][pStorageLink] == 5)
				{
				    format(gItemList,MAX_ITEM_NAME,inputtext[strfind(inputtext,"\t")+2]);
					RemoveSlotToInventory(playerid,gItemList,1);
					format(str,sizeof(str),"%s",gItemList);
					vInfo[GetVehicleNearID(playerid)][vSlot6] = str;
					format(str2,sizeof(str2),""chat" Added the item '%s' to slot 6!",inputtext);
					SendClientMessage(playerid,-1,str2);
	    			if(strfind(str, "Engine", true) != -1)
				    {
    					if(vInfo[GetVehicleNearID(playerid)][vehicleEngine] == 1) return SendClientMessage(playerid,-1,""chat" This vehicle already has an engine the engine has been put back into your backpack!"),AddSlotToInventoryWorld(playerid,"Engine",1);
						vInfo[GetVehicleNearID(playerid)][vehicleEngine] = 1;
						format(strv,sizeof(strv),"Empty Slot");
						vInfo[GetVehicleNearID(playerid)][vSlot6] = strv;
						if(!IsPlayerInAnyVehicle(playerid))
  						{
							ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
							defer ResetAction(playerid, ACTION_ANIMATION);
						}
					}

					if(strfind(str, "Tire", true) != -1)
					{
           				if(FOUR_TIRE_ADD1(playerid) || FOUR_TIRE_ADD2(playerid))
						{
							if(vInfo[GetVehicleNearID(playerid)][vehicleTires] == 4) return SendClientMessage(playerid,-1,""chat" Vehicle already has enough tires the tire has been put back into your backpack!!"),AddSlotToInventoryWorld(playerid,"Tire",1),format(strv,sizeof(strv),"Empty Slot"),vInfo[GetVehicleNearID(playerid)][vSlot1] = strv;
							vInfo[GetVehicleNearID(playerid)][vehicleTires] += 1;
							format(strv,sizeof(strv),"Empty Slot");
							vInfo[GetVehicleNearID(playerid)][vSlot6] = strv;
							if(!IsPlayerInAnyVehicle(playerid))
	  						{
								ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
								defer ResetAction(playerid, ACTION_ANIMATION);
							}
						}

						if(TWO_TIRE_VEHICLE_ADD)
						{
							if(vInfo[GetVehicleNearID(playerid)][vehicleTires] == 2) return SendClientMessage(playerid,-1,""chat" Vehicle already has enough tires the tire has been put back into your backpack!!"),AddSlotToInventoryWorld(playerid,"Tire",1),format(strv,sizeof(strv),"Empty Slot"),vInfo[GetVehicleNearID(playerid)][vSlot1] = strv;
							vInfo[GetVehicleNearID(playerid)][vehicleTires] += 1;
							format(strv,sizeof(strv),"Empty Slot");
							vInfo[GetVehicleNearID(playerid)][vSlot6] = strv;
							if(!IsPlayerInAnyVehicle(playerid))
	  						{
								ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
								defer ResetAction(playerid, ACTION_ANIMATION);
							}
						}

						if(SIX_TIRE_VEHICLE_ADD)
						{
							if(vInfo[GetVehicleNearID(playerid)][vehicleTires] == 6) return SendClientMessage(playerid,-1,""chat" Vehicle already has enough tires the tire has been put back into your backpack!!"),AddSlotToInventoryWorld(playerid,"Tire",1),format(strv,sizeof(strv),"Empty Slot"),vInfo[GetVehicleNearID(playerid)][vSlot1] = strv;
							vInfo[GetVehicleNearID(playerid)][vehicleTires] += 1;
							format(strv,sizeof(strv),"Empty Slot");
							vInfo[GetVehicleNearID(playerid)][vSlot6] = strv;
							if(!IsPlayerInAnyVehicle(playerid))
	  						{
								ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
								defer ResetAction(playerid, ACTION_ANIMATION);
							}
						}

						if(NO_TIRE_VEHICLE_ADD || ENGINE_ONLY_VEHICLE_ADD)
						{
						    SendClientMessage(playerid,-1,""chat" This vehicle does not require any tires the tire has been put back into your inventory!"), AddSlotToInventoryWorld(playerid,"Tire",1);
							format(strv,sizeof(strv),"Empty Slot");
							vInfo[GetVehicleNearID(playerid)][vSlot6] = strv;
							if(!IsPlayerInAnyVehicle(playerid))
	  						{
								ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
								defer ResetAction(playerid, ACTION_ANIMATION);
							}
						}
					}

					if(strfind(str, "Full Jerry Can", true) != -1)
					{
    					if(vInfo[GetVehicleNearID(playerid)][vehicleFuel] == 100) return SendClientMessage(playerid,-1,""chat" Vehicle already has enough fuel, full Jerry Can has been added to your backpack!");
			  	    	vInfo[GetVehicleNearID(playerid)][vehicleFuel] += random(75);
			  	    	AddSlotToInventoryWorld(playerid,"Empty Jerry Can",1);
						format(strv,sizeof(strv),"Empty Slot");
						vInfo[GetVehicleNearID(playerid)][vSlot6] = strv;
						if(!IsPlayerInAnyVehicle(playerid))
  						{
							ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
							defer ResetAction(playerid, ACTION_ANIMATION);
						}
					}
				}
			}
		}

		case DIALOG_SELECT_SKIN:
		{
		    if(response)
		    {
		        SetPlayerSkin(playerid,NORMAL);
          		ShowPlayerDialog(playerid,DIALOG_AMBIENT,DIALOG_STYLE_MSGBOX,""COL_LGREEN"DayZ Background Ambient",""COL_WHITE"Enabling the ambient gives more aspect of survival to the gamemode!\n"COL_LGREEN"Enabling ambient requires A average of 2mb Download speed!","Enable","Disable");

			}

			if(!response)
			{
			    SetPlayerSkin(playerid,FEMALE);
				ShowPlayerDialog(playerid,DIALOG_AMBIENT,DIALOG_STYLE_MSGBOX,""COL_LGREEN"DayZ Background Ambient",""COL_WHITE"Enabling the ambient gives more aspect of survival to the gamemode!\n"COL_LGREEN"Enabling ambient requires A average of 2mb Download speed!","Enable","Disable");
			}
		}

		case DIALOG_AMBIENT:
		{
			if(response)
			{
			    PlayAudioStreamForPlayer(playerid,"http://k007.kiwi6.com/hotlink/w3111dmsph/dayz_ost_-_ambient_music_hq_.mp3");
			    PlayerTextDrawHide(playerid, PlayerIntroBox[playerid]);
			}

			if(!response)
			{
			    PlayerTextDrawHide(playerid, PlayerIntroBox[playerid]);
			}
		}


		case 9921:
		{
		    if(response)
			{
		        ShowRulesToPlayer(playerid);
		    }
		}

		case 8618:
		{
			if(response)
			{
			    SendClientMessage(playerid,-1,"*"COL_LGREEN" Thank you for accepting our rules!");
			}

			if(!response)
			{
			    SendClientMessage(playerid,-1,"*"COL_RED" You have been kicked (Reason: Denying rules)");
				KickEx(playerid);
			}
		}

		case DIALOG_LOOTING:
		{
			if(response)
			{
				if(IsPlayerInRangeOfPoint(playerid,2.3,Loot[GetLootID(playerid)][xLoot],Loot[GetLootID(playerid)][yLoot],Loot[GetLootID(playerid)][zLoot]))
				{
	  				if(pInfo[playerid][Backpack] == 0)
					{
					    if(pInfo[playerid][BackpackSlots] == 8)
					    {
					    	if(pInfo[playerid][BackpackSlotsUsed] == 8)
					    	{
								SendClientMessage(playerid,-1,""chat" Your backpack is full");
							}
							else
							{
							    if(Loot[GetLootID(playerid)][AntiDup] == 1)
							    {
						        	AddSlotToInventoryLoot(playerid,inputtext[strfind(inputtext,"\t")+1],1);
						        	DayZSA_DestroyLoot(GetLootID(playerid));
									Loot[GetLootID(playerid)][AntiDup] = 0;
								}
								else
								{
								    DayZSA_DestroyLoot(GetLootID(playerid));
								}
							}
						}
					}

					if(pInfo[playerid][Backpack] == 1)
					{
					    if(pInfo[playerid][BackpackSlots] == 16)
					    {
					    	if(pInfo[playerid][BackpackSlotsUsed] == 16)
					    	{
								SendClientMessage(playerid,-1,""chat" Your backpack is full");
							}
							else
							{
							    if(Loot[GetLootID(playerid)][AntiDup] == 1)
							    {
						        	AddSlotToInventoryLoot(playerid,inputtext[strfind(inputtext,"\t")+1],1);
						        	DayZSA_DestroyLoot(GetLootID(playerid));
									Loot[GetLootID(playerid)][AntiDup] = 0;
								}
								else
								{
								    DayZSA_DestroyLoot(GetLootID(playerid));
								}
							}
						}
					}

					if(pInfo[playerid][Backpack] == 2)
					{
					    if(pInfo[playerid][BackpackSlots] == 28)
					    {
					    	if(pInfo[playerid][BackpackSlotsUsed] == 28)
					    	{
								SendClientMessage(playerid,-1,""chat" Your backpack is full");
							}
							else
							{
							    if(Loot[GetLootID(playerid)][AntiDup] == 1)
							    {
						        	AddSlotToInventoryLoot(playerid,inputtext[strfind(inputtext,"\t")+1],1);
						        	DayZSA_DestroyLoot(GetLootID(playerid));
									Loot[GetLootID(playerid)][AntiDup] = 0;
								}
								else
								{
								    DayZSA_DestroyLoot(GetLootID(playerid));
								}
							}
						}
					}

					if(pInfo[playerid][Backpack] == 3)
					{
					    if(pInfo[playerid][BackpackSlots] == 38)
					    {
					    	if(pInfo[playerid][BackpackSlotsUsed] == 38)
					    	{
								SendClientMessage(playerid,-1,""chat" Your backpack is full");
							}
							else
							{
							    if(Loot[GetLootID(playerid)][AntiDup] == 1)
							    {
						        	AddSlotToInventoryLoot(playerid,inputtext[strfind(inputtext,"\t")+1],1);
						        	DayZSA_DestroyLoot(GetLootID(playerid));
									Loot[GetLootID(playerid)][AntiDup] = 0;
								}
								else
								{
								    DayZSA_DestroyLoot(GetLootID(playerid));
								}
							}
						}
					}
				}
				else return SendClientMessage(playerid, -1, "*"COL_RED" Read the rules! The server have prevented you to duplicate an item!");
			}
		}

		case DIALOG_LOOTING_DROP:
		{
			if(response)
			{
				if(IsPlayerInRangeOfPoint(playerid, 2.3,Loot[GetLootIDFunction(playerid)][xLootdrop],Loot[GetLootIDFunction(playerid)][yLootdrop],Loot[GetLootIDFunction(playerid)][zLootdrop]))
				{
					if(pInfo[playerid][Backpack] == 0)
					{
					    if(pInfo[playerid][BackpackSlots] == 8)
					    {
					    	if(pInfo[playerid][BackpackSlotsUsed] == 8)
					    	{
								SendClientMessage(playerid,-1,""chat" Your backpack is full");
							}
							else
							{
			    				if(Loot[GetLootIDFunction(playerid)][AntiDup] == 1)
							    {
									AddSlotToInventoryLoot(playerid,inputtext[strfind(inputtext,"\t")+1],1);
									DayZSA_DestroyLootDroped(GetLootIDFunction(playerid));
									Loot[GetLootIDFunction(playerid)][AntiDup] = 0;
								}
								else
								{
								    DayZSA_DestroyLootDroped(GetLootIDFunction(playerid));
								    AddSlotToInventoryLoot(playerid,inputtext[strfind(inputtext,"\t")+1],1);
								}
							}
						}
					}

					if(pInfo[playerid][Backpack] == 1)
					{
					    if(pInfo[playerid][BackpackSlots] == 16)
					    {
					    	if(pInfo[playerid][BackpackSlotsUsed] == 16)
					    	{
								SendClientMessage(playerid,-1,""chat" Your backpack is full");
							}
							else
							{
			    				if(Loot[GetLootIDFunction(playerid)][AntiDup] == 1)
							    {
									AddSlotToInventoryLoot(playerid,inputtext[strfind(inputtext,"\t")+1],1);
									DayZSA_DestroyLootDroped(GetLootIDFunction(playerid));
									Loot[GetLootIDFunction(playerid)][AntiDup] = 0;
								}
								else
								{
								    DayZSA_DestroyLootDroped(GetLootIDFunction(playerid));
								    AddSlotToInventoryLoot(playerid,inputtext[strfind(inputtext,"\t")+1],1);
								}
							}
						}
					}

					if(pInfo[playerid][Backpack] == 2)
					{
					    if(pInfo[playerid][BackpackSlots] == 28)
					    {
					    	if(pInfo[playerid][BackpackSlotsUsed] == 28)
					    	{
								SendClientMessage(playerid,-1,""chat" Your backpack is full");
							}
							else
							{
			    				if(Loot[GetLootIDFunction(playerid)][AntiDup] == 1)
							    {
									AddSlotToInventoryLoot(playerid,inputtext[strfind(inputtext,"\t")+1],1);
									DayZSA_DestroyLootDroped(GetLootIDFunction(playerid));
									Loot[GetLootIDFunction(playerid)][AntiDup] = 0;
								}
								else
								{
								    DayZSA_DestroyLootDroped(GetLootIDFunction(playerid));
								    AddSlotToInventoryLoot(playerid,inputtext[strfind(inputtext,"\t")+1],1);
								}
							}
						}
					}

					if(pInfo[playerid][Backpack] == 3)
					{
					    if(pInfo[playerid][BackpackSlots] == 38)
					    {
					    	if(pInfo[playerid][BackpackSlotsUsed] == 38)
					    	{
								SendClientMessage(playerid,-1,""chat" Your backpack is full");
							}
							else
							{
			    				if(Loot[GetLootIDFunction(playerid)][AntiDup] == 1)
							    {
									AddSlotToInventoryLoot(playerid,inputtext[strfind(inputtext,"\t")+1],1);
									DayZSA_DestroyLootDroped(GetLootIDFunction(playerid));
									Loot[GetLootIDFunction(playerid)][AntiDup] = 0;
								}
								else
								{
								    DayZSA_DestroyLootDroped(GetLootIDFunction(playerid));
								    AddSlotToInventoryLoot(playerid,inputtext[strfind(inputtext,"\t")+1],1);
								}
							}
						}
					}
				}
				else return SendClientMessage(playerid, -1, "*"COL_RED" Read the rules! The server have prevented you to duplicate an item!");
			}
		}

		case DIALOG_LOOTING_DROPZ:
		{
			if(response)
			{
				AddSlotToInventoryLoot(playerid,inputtext[strfind(inputtext,"\t")+1],1);
				DayZSA_DestroyLootZombie(GetLootIDZombie(playerid));
			}
		}

		case INV_DIALOG_ID:
		{
		    if(response)
		    {
		        new invString[64];
		        ShowPlayerDialog(playerid,DIALOG_INV_EDIT,DIALOG_STYLE_MSGBOX,""COL_GREEN"GEAR","Please select an option","Use","Drop");
		        format(gItemList,MAX_ITEM_NAME,inputtext[strfind(inputtext,"\t")+2]);
		        format(invString,sizeof(invString),"%s",gItemList);
		        pInfo[playerid][pItemLink] = invString;
			}
		}

		case DIALOG_INV_EDIT:
		{
		    if(response)
		    {
		        OnPlayerUseItem(playerid,pInfo[playerid][pItemLink]);
				GameTextForPlayer(playerid,"~n~~n~~n~~n~~n~~g~please wait......",800,5);
			}

			if(!response)
			{
   				if(gettime() - 3 < pInfo[playerid][pSpamDrop]) return SendClientMessage(playerid,-1,"*"COL_RED" Wait 3 seconds to drop your item!");
		    	{
					RemoveSlotToInventory(playerid,pInfo[playerid][pItemLink],1);
					new Float:fPos[3];
					GetPlayerPos(playerid,fPos[0],fPos[1],fPos[2]);
					DayZSA_CreateLootsFunction(pInfo[playerid][pItemLink],fPos[0]+random(2),fPos[1]+random(2),fPos[2]);
					pInfo[playerid][pSpamDrop] = gettime();
				}
			}
		}
		
		case DIALOG_AIRDROP:
		{
			if(response)
			{
			    new str[64];
			    format(str,sizeof(str),"0\tEmpty Slot");
				switch(listitem)
				{
				    case 0:
				    {
						AddSlotToInventoryWorld(playerid,inputtext[strfind(inputtext,"\t")+1],1);
				        Loot[GetAirDropID(playerid)][AirSlot1] = str;
					}

		   			case 1:
				    {
						AddSlotToInventoryWorld(playerid,inputtext[strfind(inputtext,"\t")+1],1);
				        Loot[GetAirDropID(playerid)][AirSlot2] = str;
					}

		   			case 2:
				    {
						AddSlotToInventoryWorld(playerid,inputtext[strfind(inputtext,"\t")+1],1);
				        Loot[GetAirDropID(playerid)][AirSlot3] = str;
					}

		   			case 3:
				    {
						AddSlotToInventoryWorld(playerid,inputtext[strfind(inputtext,"\t")+1],1);
				        Loot[GetAirDropID(playerid)][AirSlot4] = str;
					}

		   			case 4:
				    {
						AddSlotToInventoryWorld(playerid,inputtext[strfind(inputtext,"\t")+1],1);
      					Loot[GetAirDropID(playerid)][AirSlot5] = str;
					}

					case 5:
				    {
						AddSlotToInventoryWorld(playerid,inputtext[strfind(inputtext,"\t")+1],1);
      					Loot[GetAirDropID(playerid)][AirSlot6] = str;
					}
	    			case 6:
				    {
						AddSlotToInventoryWorld(playerid,inputtext[strfind(inputtext,"\t")+1],1);
				        Loot[GetAirDropID(playerid)][AirSlot7] = str;
					}

		   			case 7:
				    {
						AddSlotToInventoryWorld(playerid,inputtext[strfind(inputtext,"\t")+1],1);
				        Loot[GetAirDropID(playerid)][AirSlot8] = str;
					}

		   			case 8:
				    {
						AddSlotToInventoryWorld(playerid,inputtext[strfind(inputtext,"\t")+1],1);
				        Loot[GetAirDropID(playerid)][AirSlot9] = str;
					}

		   			case 9:
				    {
						AddSlotToInventoryWorld(playerid,inputtext[strfind(inputtext,"\t")+1],1);
				        Loot[GetAirDropID(playerid)][AirSlot10] = str;
					}

		   			case 10:
				    {
						AddSlotToInventoryWorld(playerid,inputtext[strfind(inputtext,"\t")+1],1);
      					Loot[GetAirDropID(playerid)][AirSlot11] = str;
					}

					case 11:
				    {
						AddSlotToInventoryWorld(playerid,inputtext[strfind(inputtext,"\t")+1],1);
      					Loot[GetAirDropID(playerid)][AirSlot12] = str;
					}
				}
			}
		}

		case DIALOG_HOSPITAL:
		{
			if(response)
			{
			    new str[64];
			    format(str,sizeof(str),"0\tEmpty Slot");
				switch(listitem)
				{
				    case 0:
				    {
						AddSlotToInventoryWorld(playerid,inputtext[strfind(inputtext,"\t")+1],1);
				        Loot[GetHospitalID(playerid)][HosSlot1] = str;
					}

		   			case 1:
				    {
						AddSlotToInventoryWorld(playerid,inputtext[strfind(inputtext,"\t")+1],1);
				        Loot[GetHospitalID(playerid)][HosSlot2] = str;
					}

		   			case 2:
				    {
						AddSlotToInventoryWorld(playerid,inputtext[strfind(inputtext,"\t")+1],1);
				        Loot[GetHospitalID(playerid)][HosSlot3] = str;
					}

		   			case 3:
				    {
						AddSlotToInventoryWorld(playerid,inputtext[strfind(inputtext,"\t")+1],1);
				        Loot[GetHospitalID(playerid)][HosSlot4] = str;
					}

		   			case 4:
				    {
						AddSlotToInventoryWorld(playerid,inputtext[strfind(inputtext,"\t")+1],1);
      					Loot[GetHospitalID(playerid)][HosSlot5] = str;
					}

					case 5:
				    {
						AddSlotToInventoryWorld(playerid,inputtext[strfind(inputtext,"\t")+1],1);
      					Loot[GetHospitalID(playerid)][HosSlot6] = str;
					}
				}
			}
		}
	}
	return 1;
}
CMD:flashoff(playerid)
{
	if(PlayerHasItem(playerid, "Flashlight"))
	{
		if(IsPlayerAttachedObjectSlotUsed(playerid,3)) RemovePlayerAttachedObject(playerid,3);
		if(IsPlayerAttachedObjectSlotUsed(playerid,4)) RemovePlayerAttachedObject(playerid,4);
	}
	else return SendClientMessage(playerid, -1, "*"COL_RED" You do not have a flashlight in your inventory");
	return 1;
}

CMD:resetinv(playerid,params[])
{
    if(pInfo[playerid][pAdminLevel] >= 5)
    {
		new targetid,string[128];
		if(sscanf(params, "u", targetid)) return SendClientMessage(playerid,-1,""chat" /resetinv [playerid]");
		if(!IsPlayerConnected(targetid)) return SendClientMessage(playerid,-1,""chat" Player is not online");

		if(!IsPlayerNPC(targetid))
		{
			format(string, sizeof(string), "*"COL_RED" %s %s has reset %s"COL_WHITE" 's Inventory",GetAdminName(playerid),PlayerName(playerid),PlayerName(targetid));
		//	print("string passed");
			SendMessageToAllAdmins(string,-1);
		//	print("message passed");
			ResetPlayerWeapons(targetid);
		//	print("resetwepaons passed");
			ResetPlayerInventory(targetid);
		//	print("reset inv passed");
			AddSlotToInventoryWorld(targetid,"Bandage",1);
		//	print("bandage passed");
			pInfo[targetid][BackpackSlotsUsed] = 1;
		//	print("info passed");
			SendClientMessage(targetid,-1,"*"COL_RED" Your inventory has been reset!");
		//	print("message passed");
		}
		else return SendClientMessage(playerid,-1,"*"COL_RED" You cannot do this to an NPC, this has been logged and sent to the server emergency log list!");
	}
	else {
		SendClientMessage(playerid,-1,"*"COL_RED" You do not have the right admin permissions for this command!");
	}
	return 1;
}


CMD:setscore(playerid, params[])
{
    if(pInfo[playerid][pAdminLevel] >= 5 || IsPlayerAdmin(playerid))
    {
        new string[128], pName[MAX_PLAYER_NAME], name[MAX_PLAYER_NAME], targetid, score;
        if(sscanf(params, "ud", targetid, score)) return SendClientMessage(playerid, -1, " /setscore [playerid] [score]");
        if(targetid == INVALID_PLAYER_ID) return SendClientMessage(playerid, -1, "player is not connected");
        GetPlayerName(playerid, name, sizeof(name));
        GetPlayerName(targetid, pName, sizeof(pName));
        pInfo[targetid][pHour] = score;
        format(string, 128, "%s %s has set your score to %i",GetAdminName(playerid),PlayerName(playerid),score);
        SendClientMessage(targetid, -1, string);
        new str[256];
        format(str, sizeof(str), "*"COL_WHITE"* %s %s has set %s score to %i",GetAdminName(playerid),PlayerName(playerid),PlayerName(targetid),score);
        SendMessageToAllAdmins(str,-1);
        SetPlayerScore(targetid, score);
	}
    return 1;
}

CMD:weaps(playerid, params[])
{
    if(pInfo[playerid][pAdminLevel] >= 1 || IsPlayerAdmin(playerid))
    {
        new count = 0;
        new ammo, weaponid, weapon[24], string[128], id;
        if(!sscanf(params, "u", id))
        {
                for (new c = 0; c < 13; c++)
                {
                    GetPlayerWeaponData(id, c, weaponid, ammo);
                    if (weaponid != 0 && ammo != 0)
                    {
                        count++;
                    }
                }
                SendClientMessage(playerid,-1,"*"COL_ORANGE" ||=============WEAPONS AND AMMO===========||");
                if(count > 0)
                {
                    for (new c = 0; c < 13; c++)
                    {
                        GetPlayerWeaponData(id, c, weaponid, ammo);
                        if (weaponid != 0 && ammo != 0)
                        {
                            GetWeaponName(weaponid, weapon, 24);
                            format(string, sizeof(string), "Weapon: %s  Ammo: %d", weapon, ammo);
                            SendClientMessage(playerid,0x37DB45, string);
                        }
                    }
                }
                else
                {
                    SendClientMessage(playerid,-1,"*"COL_GREY" This player has no weapons!");
                }
                return 1;
        }
        else return SendClientMessage(playerid,-1,"*"COL_WHITE" USAGE: /weaps [ID]");
    }
    else return SendClientMessage(playerid,-1,"*"COL_RED" You do not have the right admin permissions for this command");
}

CMD:h(playerid,params[])
{
    new helperstring[257];
	if(pInfo[playerid][Helper] >= 1)
	{
	    if(!strlen(params))
	    {
	        SendClientMessage(playerid, -1, ""chat" /h [message]");
	        return 1;
		}
		format(helperstring, sizeof(helperstring), ""COL_ORANGE"[Helper Chat] %s %s[%d]: %s",GetHelperName(playerid),PlayerName(playerid), playerid, params);
		SendMessageToAllHelpers(helperstring, -1);
	}
	else {
		SendClientMessage(playerid,-1,"*"COL_RED" You do not have the right helper permissions for this command!");
	}
	return 1;
}
CMD:dropgun(playerid)
{
	if(GetPlayerWeapon(playerid) >= 1)
	{
		new wepname[64];
		new Float:fPos[3];
		GetPlayerPos(playerid,fPos[0],fPos[1],fPos[2]);

		switch(GetPlayerWeapon(playerid))
		{
		    case 25: wepname = "Shotgun", SendClientMessage(playerid, -1, ""chat" You dropped your current weapon/tool!"), DayZSA_DropWeapon("Shotgun", GetPlayerAmmo(playerid), fPos[0],fPos[1],fPos[2]);
		    case 30: wepname = "AK-47", SendClientMessage(playerid, -1, ""chat" You dropped your current weapon/tool!"), DayZSA_DropWeapon("AK-47", GetPlayerAmmo(playerid),fPos[0],fPos[1],fPos[2]);
		    case 31: wepname = "M4", SendClientMessage(playerid, -1, ""chat" You dropped your current weapon/tool!"), DayZSA_DropWeapon("M4", GetPlayerAmmo(playerid), fPos[0],fPos[1],fPos[2]);
		    case 34: wepname = "Sniper Rifle", SendClientMessage(playerid, -1, ""chat" You dropped your current weapon/tool!"), DayZSA_DropWeapon("Sniper Rifle", GetPlayerAmmo(playerid),fPos[0],fPos[1],fPos[2]);
		    case 33: wepname = "Country Rifle", SendClientMessage(playerid, -1, ""chat" You dropped your current weapon/tool!"), DayZSA_DropWeapon("Country Rifle", GetPlayerAmmo(playerid),fPos[0],fPos[1],fPos[2]);
		    case 22: wepname = "Pistol", SendClientMessage(playerid, -1, ""chat" You dropped your current weapon/tool!"), DayZSA_DropWeapon("Pistol", GetPlayerAmmo(playerid), fPos[0],fPos[1],fPos[2]);
		    case 27: wepname = "SPAZ-12 Shotgun", SendClientMessage(playerid, -1, ""chat" You dropped your current weapon/tool!"), DayZSA_DropWeapon("SPAZ-12 Shotgun", GetPlayerAmmo(playerid),fPos[0],fPos[1],fPos[2]);
		    case 29: wepname = "MP5", SendClientMessage(playerid, -1, ""chat" You dropped your current weapon/tool!"), DayZSA_DropWeapon("MP5", GetPlayerAmmo(playerid),fPos[0],fPos[1],fPos[2]);
		    case 23: wepname = "Silenced Pistol", SendClientMessage(playerid, -1, ""chat" You dropped your current weapon/tool!"), DayZSA_DropWeapon("Silenced Pistol", GetPlayerAmmo(playerid),fPos[0],fPos[1],fPos[2]);
		    case 43: wepname = "Binoculars", SendClientMessage(playerid, -1, ""chat" You dropped your current weapon/tool!"), DayZSA_DropWeapon("Binoculars", GetPlayerAmmo(playerid),fPos[0],fPos[1],fPos[2]);
		    case 8: wepname = "Katana", SendClientMessage(playerid, -1, ""chat" You dropped your current weapon/tool!"), DayZSA_DropWeapon("Katana", GetPlayerAmmo(playerid),fPos[0],fPos[1],fPos[2]);
		    case 5: wepname = "Baseball Bat", SendClientMessage(playerid, -1, ""chat" You dropped your current weapon/tool!"), DayZSA_DropWeapon("Baseball Bat", GetPlayerAmmo(playerid),fPos[0],fPos[1],fPos[2]);
		}

		new strdropped[128];
		format(strdropped, sizeof(strdropped), ""chat" You have dropped %s with %i ammo!", wepname, GetPlayerAmmo(playerid));
		SendClientMessage(playerid, -1, strdropped);
		SetPlayerAmmo(playerid, GetPlayerWeapon(playerid), 0);
	}
	else return SendClientMessage(playerid, -1, ""chat" You have no weapon equipped");
	return 1;
}

CMD:pickupgun(playerid)
{
	if(!IsPlayerInAnyVehicle(playerid))
	{
		if(IsPlayerInRangeOfPoint(playerid,1.1,Loot[GetLootW_ID(playerid)][DropGunX],Loot[GetLootW_ID(playerid)][DropGunY],Loot[GetLootW_ID(playerid)][DropGunZ]))
		{
			if(pInfo[playerid][Backpack] == 0)
			{
				if(pInfo[playerid][BackpackSlots] == 8)
				{
					if(pInfo[playerid][BackpackSlotsUsed] == 8)
					{
						SendClientMessage(playerid,-1,""chat" Your backpack is full");
					}
					else
					{
						if(Loot[GetLootW_ID(playerid)][AntiDup] == 1)
						{
							switch(Loot[GetLootW_ID(playerid)][DropGunID])
							{
								case 355: AddSlotToInventoryWorld(playerid, "AK-47", 1), GivePlayerWeaponEx(playerid, 30, Loot[GetLootW_ID(playerid)][DropGunAmmo]), DayZSA_DestroyLoot(GetLootW_ID(playerid)), Loot[GetLootW_ID(playerid)][AntiDup] = 0;
								case 356: AddSlotToInventoryWorld(playerid, "M4", 1),GivePlayerWeaponEx(playerid, 31, Loot[GetLootW_ID(playerid)][DropGunAmmo]), DayZSA_DestroyLoot(GetLootW_ID(playerid)), Loot[GetLootW_ID(playerid)][AntiDup] = 0;
								case 347: AddSlotToInventoryWorld(playerid, "Silenced Pistol", 1),GivePlayerWeaponEx(playerid, 23, Loot[GetLootW_ID(playerid)][DropGunAmmo]), DayZSA_DestroyLoot(GetLootW_ID(playerid)), Loot[GetLootW_ID(playerid)][AntiDup] = 0;
								case 346: AddSlotToInventoryWorld(playerid, "Pistol", 1),GivePlayerWeaponEx(playerid, 22, Loot[GetLootW_ID(playerid)][DropGunAmmo]), DayZSA_DestroyLoot(GetLootW_ID(playerid)), Loot[GetLootW_ID(playerid)][AntiDup] = 0;
								case 349: AddSlotToInventoryWorld(playerid, "Shotgun", 1),GivePlayerWeaponEx(playerid, 25, Loot[GetLootW_ID(playerid)][DropGunAmmo]), DayZSA_DestroyLoot(GetLootW_ID(playerid)), Loot[GetLootW_ID(playerid)][AntiDup] = 0;
								case 351: AddSlotToInventoryWorld(playerid, "SPAZ-12 Shotgun", 1),GivePlayerWeaponEx(playerid, 27, Loot[GetLootW_ID(playerid)][DropGunAmmo]), DayZSA_DestroyLoot(GetLootW_ID(playerid)), Loot[GetLootW_ID(playerid)][AntiDup] = 0;
								case 357: AddSlotToInventoryWorld(playerid, "Country Rifle", 1),GivePlayerWeaponEx(playerid, 33, Loot[GetLootW_ID(playerid)][DropGunAmmo]), DayZSA_DestroyLoot(GetLootW_ID(playerid)), Loot[GetLootW_ID(playerid)][AntiDup] = 0;
								case 358: AddSlotToInventoryWorld(playerid, "Sniper Rifle", 1),GivePlayerWeaponEx(playerid, 34, Loot[GetLootW_ID(playerid)][DropGunAmmo]), DayZSA_DestroyLoot(GetLootW_ID(playerid)), Loot[GetLootW_ID(playerid)][AntiDup] = 0;
								case 353: AddSlotToInventoryWorld(playerid, "MP5", 1),GivePlayerWeaponEx(playerid, 29, Loot[GetLootW_ID(playerid)][DropGunAmmo]), DayZSA_DestroyLoot(GetLootW_ID(playerid)), Loot[GetLootW_ID(playerid)][AntiDup] = 0;
								case 339: AddSlotToInventoryWorld(playerid, "Katana", 1),GivePlayerWeaponEx(playerid, 8, Loot[GetLootW_ID(playerid)][DropGunAmmo]), DayZSA_DestroyLoot(GetLootW_ID(playerid)), Loot[GetLootW_ID(playerid)][AntiDup] = 0;
								case 336: AddSlotToInventoryWorld(playerid, "Baseball Bat", 1),GivePlayerWeaponEx(playerid, 5, Loot[GetLootW_ID(playerid)][DropGunAmmo]), DayZSA_DestroyLoot(GetLootW_ID(playerid)), Loot[GetLootW_ID(playerid)][AntiDup] = 0;
								case 3070: AddSlotToInventoryWorld(playerid, "Binoculars", 1),GivePlayerWeaponEx(playerid, 43, Loot[GetLootW_ID(playerid)][DropGunAmmo]), DayZSA_DestroyLoot(GetLootW_ID(playerid)), Loot[GetLootW_ID(playerid)][AntiDup] = 0;
							}
						}
						else
						{
							DayZSA_DestroyLoot(GetLootW_ID(playerid));
						}
					}
				}
			}

			if(pInfo[playerid][Backpack] == 1)
			{
				if(pInfo[playerid][BackpackSlots] == 16)
				{
					if(pInfo[playerid][BackpackSlotsUsed] == 16)
					{
						SendClientMessage(playerid,-1,""chat" Your backpack is full");
					}
					else
					{
						if(Loot[GetLootW_ID(playerid)][AntiDup] == 1)
						{
							switch(Loot[GetLootW_ID(playerid)][DropGunID])
							{
								case 355: AddSlotToInventoryWorld(playerid, "AK-47", 1), GivePlayerWeaponEx(playerid, 30, Loot[GetLootW_ID(playerid)][DropGunAmmo]), DayZSA_DestroyLoot(GetLootW_ID(playerid)), Loot[GetLootW_ID(playerid)][AntiDup] = 0;
								case 356: AddSlotToInventoryWorld(playerid, "M4", 1),GivePlayerWeaponEx(playerid, 31, Loot[GetLootW_ID(playerid)][DropGunAmmo]), DayZSA_DestroyLoot(GetLootW_ID(playerid)), Loot[GetLootW_ID(playerid)][AntiDup] = 0;
								case 347: AddSlotToInventoryWorld(playerid, "Silenced Pistol", 1),GivePlayerWeaponEx(playerid, 23, Loot[GetLootW_ID(playerid)][DropGunAmmo]), DayZSA_DestroyLoot(GetLootW_ID(playerid)), Loot[GetLootW_ID(playerid)][AntiDup] = 0;
								case 346: AddSlotToInventoryWorld(playerid, "Pistol", 1),GivePlayerWeaponEx(playerid, 22, Loot[GetLootW_ID(playerid)][DropGunAmmo]), DayZSA_DestroyLoot(GetLootW_ID(playerid)), Loot[GetLootW_ID(playerid)][AntiDup] = 0;
								case 349: AddSlotToInventoryWorld(playerid, "Shotgun", 1),GivePlayerWeaponEx(playerid, 25, Loot[GetLootW_ID(playerid)][DropGunAmmo]), DayZSA_DestroyLoot(GetLootW_ID(playerid)), Loot[GetLootW_ID(playerid)][AntiDup] = 0;
								case 351: AddSlotToInventoryWorld(playerid, "SPAZ-12 Shotgun", 1),GivePlayerWeaponEx(playerid, 27, Loot[GetLootW_ID(playerid)][DropGunAmmo]), DayZSA_DestroyLoot(GetLootW_ID(playerid)), Loot[GetLootW_ID(playerid)][AntiDup] = 0;
								case 357: AddSlotToInventoryWorld(playerid, "Country Rifle", 1),GivePlayerWeaponEx(playerid, 33, Loot[GetLootW_ID(playerid)][DropGunAmmo]), DayZSA_DestroyLoot(GetLootW_ID(playerid)), Loot[GetLootW_ID(playerid)][AntiDup] = 0;
								case 358: AddSlotToInventoryWorld(playerid, "Sniper Rifle", 1),GivePlayerWeaponEx(playerid, 34, Loot[GetLootW_ID(playerid)][DropGunAmmo]), DayZSA_DestroyLoot(GetLootW_ID(playerid)), Loot[GetLootW_ID(playerid)][AntiDup] = 0;
								case 353: AddSlotToInventoryWorld(playerid, "MP5", 1),GivePlayerWeaponEx(playerid, 29, Loot[GetLootW_ID(playerid)][DropGunAmmo]), DayZSA_DestroyLoot(GetLootW_ID(playerid)), Loot[GetLootW_ID(playerid)][AntiDup] = 0;
								case 339: AddSlotToInventoryWorld(playerid, "Katana", 1),GivePlayerWeaponEx(playerid, 8, Loot[GetLootW_ID(playerid)][DropGunAmmo]), DayZSA_DestroyLoot(GetLootW_ID(playerid)), Loot[GetLootW_ID(playerid)][AntiDup] = 0;
								case 336: AddSlotToInventoryWorld(playerid, "Baseball Bat", 1),GivePlayerWeaponEx(playerid, 5, Loot[GetLootW_ID(playerid)][DropGunAmmo]), DayZSA_DestroyLoot(GetLootW_ID(playerid)), Loot[GetLootW_ID(playerid)][AntiDup] = 0;
								case 3070: AddSlotToInventoryWorld(playerid, "Binoculars", 1),GivePlayerWeaponEx(playerid, 43, Loot[GetLootW_ID(playerid)][DropGunAmmo]), DayZSA_DestroyLoot(GetLootW_ID(playerid)), Loot[GetLootW_ID(playerid)][AntiDup] = 0;
							}
						}
						else
						{
							DayZSA_DestroyLoot(GetLootW_ID(playerid));
						}
					}
				}
			}

			if(pInfo[playerid][Backpack] == 2)
			{
				if(pInfo[playerid][BackpackSlots] == 28)
				{
					if(pInfo[playerid][BackpackSlotsUsed] == 28)
					{
						SendClientMessage(playerid,-1,""chat" Your backpack is full");
					}
					else
					{
						if(Loot[GetLootW_ID(playerid)][AntiDup] == 1)
						{
							switch(Loot[GetLootW_ID(playerid)][DropGunID])
							{
								case 355: AddSlotToInventoryWorld(playerid, "AK-47", 1), GivePlayerWeaponEx(playerid, 30, Loot[GetLootW_ID(playerid)][DropGunAmmo]), DayZSA_DestroyLoot(GetLootW_ID(playerid)), Loot[GetLootW_ID(playerid)][AntiDup] = 0;
								case 356: AddSlotToInventoryWorld(playerid, "M4", 1),GivePlayerWeaponEx(playerid, 31, Loot[GetLootW_ID(playerid)][DropGunAmmo]), DayZSA_DestroyLoot(GetLootW_ID(playerid)), Loot[GetLootW_ID(playerid)][AntiDup] = 0;
								case 347: AddSlotToInventoryWorld(playerid, "Silenced Pistol", 1),GivePlayerWeaponEx(playerid, 23, Loot[GetLootW_ID(playerid)][DropGunAmmo]), DayZSA_DestroyLoot(GetLootW_ID(playerid)), Loot[GetLootW_ID(playerid)][AntiDup] = 0;
								case 346: AddSlotToInventoryWorld(playerid, "Pistol", 1),GivePlayerWeaponEx(playerid, 22, Loot[GetLootW_ID(playerid)][DropGunAmmo]), DayZSA_DestroyLoot(GetLootW_ID(playerid)), Loot[GetLootW_ID(playerid)][AntiDup] = 0;
								case 349: AddSlotToInventoryWorld(playerid, "Shotgun", 1),GivePlayerWeaponEx(playerid, 25, Loot[GetLootW_ID(playerid)][DropGunAmmo]), DayZSA_DestroyLoot(GetLootW_ID(playerid)), Loot[GetLootW_ID(playerid)][AntiDup] = 0;
								case 351: AddSlotToInventoryWorld(playerid, "SPAZ-12 Shotgun", 1),GivePlayerWeaponEx(playerid, 27, Loot[GetLootW_ID(playerid)][DropGunAmmo]), DayZSA_DestroyLoot(GetLootW_ID(playerid)), Loot[GetLootW_ID(playerid)][AntiDup] = 0;
								case 357: AddSlotToInventoryWorld(playerid, "Country Rifle", 1),GivePlayerWeaponEx(playerid, 33, Loot[GetLootW_ID(playerid)][DropGunAmmo]), DayZSA_DestroyLoot(GetLootW_ID(playerid)), Loot[GetLootW_ID(playerid)][AntiDup] = 0;
								case 358: AddSlotToInventoryWorld(playerid, "Sniper Rifle", 1),GivePlayerWeaponEx(playerid, 34, Loot[GetLootW_ID(playerid)][DropGunAmmo]), DayZSA_DestroyLoot(GetLootW_ID(playerid)), Loot[GetLootW_ID(playerid)][AntiDup] = 0;
								case 353: AddSlotToInventoryWorld(playerid, "MP5", 1),GivePlayerWeaponEx(playerid, 29, Loot[GetLootW_ID(playerid)][DropGunAmmo]), DayZSA_DestroyLoot(GetLootW_ID(playerid)), Loot[GetLootW_ID(playerid)][AntiDup] = 0;
								case 339: AddSlotToInventoryWorld(playerid, "Katana", 1),GivePlayerWeaponEx(playerid, 8, Loot[GetLootW_ID(playerid)][DropGunAmmo]), DayZSA_DestroyLoot(GetLootW_ID(playerid)), Loot[GetLootW_ID(playerid)][AntiDup] = 0;
								case 336: AddSlotToInventoryWorld(playerid, "Baseball Bat", 1),GivePlayerWeaponEx(playerid, 5, Loot[GetLootW_ID(playerid)][DropGunAmmo]), DayZSA_DestroyLoot(GetLootW_ID(playerid)), Loot[GetLootW_ID(playerid)][AntiDup] = 0;
								case 3070: AddSlotToInventoryWorld(playerid, "Binoculars", 1),GivePlayerWeaponEx(playerid, 43, Loot[GetLootW_ID(playerid)][DropGunAmmo]), DayZSA_DestroyLoot(GetLootW_ID(playerid)), Loot[GetLootW_ID(playerid)][AntiDup] = 0;
							}
						}
						else
						{
							DayZSA_DestroyLoot(GetLootW_ID(playerid));
						}
					}
				}
			}

			if(pInfo[playerid][Backpack] == 3)
			{
				if(pInfo[playerid][BackpackSlots] == 38)
				{
					if(pInfo[playerid][BackpackSlotsUsed] == 38)
					{
						SendClientMessage(playerid,-1,""chat" Your backpack is full");
					}
					else
					{
						if(Loot[GetLootW_ID(playerid)][AntiDup] == 1)
						{
							switch(Loot[GetLootW_ID(playerid)][DropGunID])
							{
								case 355: AddSlotToInventoryWorld(playerid, "AK-47", 1), GivePlayerWeaponEx(playerid, 30, Loot[GetLootW_ID(playerid)][DropGunAmmo]), DayZSA_DestroyLoot(GetLootW_ID(playerid)), Loot[GetLootW_ID(playerid)][AntiDup] = 0;
								case 356: AddSlotToInventoryWorld(playerid, "M4", 1),GivePlayerWeaponEx(playerid, 31, Loot[GetLootW_ID(playerid)][DropGunAmmo]), DayZSA_DestroyLoot(GetLootW_ID(playerid)), Loot[GetLootW_ID(playerid)][AntiDup] = 0;
								case 347: AddSlotToInventoryWorld(playerid, "Silenced Pistol", 1),GivePlayerWeaponEx(playerid, 23, Loot[GetLootW_ID(playerid)][DropGunAmmo]), DayZSA_DestroyLoot(GetLootW_ID(playerid)), Loot[GetLootW_ID(playerid)][AntiDup] = 0;
								case 346: AddSlotToInventoryWorld(playerid, "Pistol", 1),GivePlayerWeaponEx(playerid, 22, Loot[GetLootW_ID(playerid)][DropGunAmmo]), DayZSA_DestroyLoot(GetLootW_ID(playerid)), Loot[GetLootW_ID(playerid)][AntiDup] = 0;
								case 349: AddSlotToInventoryWorld(playerid, "Shotgun", 1),GivePlayerWeaponEx(playerid, 25, Loot[GetLootW_ID(playerid)][DropGunAmmo]), DayZSA_DestroyLoot(GetLootW_ID(playerid)), Loot[GetLootW_ID(playerid)][AntiDup] = 0;
								case 351: AddSlotToInventoryWorld(playerid, "SPAZ-12 Shotgun", 1),GivePlayerWeaponEx(playerid, 27, Loot[GetLootW_ID(playerid)][DropGunAmmo]), DayZSA_DestroyLoot(GetLootW_ID(playerid)), Loot[GetLootW_ID(playerid)][AntiDup] = 0;
								case 357: AddSlotToInventoryWorld(playerid, "Country Rifle", 1),GivePlayerWeaponEx(playerid, 33, Loot[GetLootW_ID(playerid)][DropGunAmmo]), DayZSA_DestroyLoot(GetLootW_ID(playerid)), Loot[GetLootW_ID(playerid)][AntiDup] = 0;
								case 358: AddSlotToInventoryWorld(playerid, "Sniper Rifle", 1),GivePlayerWeaponEx(playerid, 34, Loot[GetLootW_ID(playerid)][DropGunAmmo]), DayZSA_DestroyLoot(GetLootW_ID(playerid)), Loot[GetLootW_ID(playerid)][AntiDup] = 0;
								case 353: AddSlotToInventoryWorld(playerid, "MP5", 1),GivePlayerWeaponEx(playerid, 29, Loot[GetLootW_ID(playerid)][DropGunAmmo]), DayZSA_DestroyLoot(GetLootW_ID(playerid)), Loot[GetLootW_ID(playerid)][AntiDup] = 0;
								case 339: AddSlotToInventoryWorld(playerid, "Katana", 1),GivePlayerWeaponEx(playerid, 8, Loot[GetLootW_ID(playerid)][DropGunAmmo]), DayZSA_DestroyLoot(GetLootW_ID(playerid)), Loot[GetLootW_ID(playerid)][AntiDup] = 0;
								case 336: AddSlotToInventoryWorld(playerid, "Baseball Bat", 1),GivePlayerWeaponEx(playerid, 5, Loot[GetLootW_ID(playerid)][DropGunAmmo]), DayZSA_DestroyLoot(GetLootW_ID(playerid)), Loot[GetLootW_ID(playerid)][AntiDup] = 0;
								case 3070: AddSlotToInventoryWorld(playerid, "Binoculars", 1),GivePlayerWeaponEx(playerid, 43, Loot[GetLootW_ID(playerid)][DropGunAmmo]), DayZSA_DestroyLoot(GetLootW_ID(playerid)), Loot[GetLootW_ID(playerid)][AntiDup] = 0;
							}
						}
						else
						{
							DayZSA_DestroyLoot(GetLootW_ID(playerid));
						}
					}
				}
			}
		}
		else return SendClientMessage(playerid, -1, "*"COL_RED" Read the rules! The server have prevented you to duplicate an item!");
	}
	return 1;
}

CMD:groupinfo(playerid,params[])
{
	new groupid;
	if(sscanf(params, "i", groupid)) return SendClientMessage(playerid,-1,"*"COL_RED" /groupinfo [groupid]");

	new str[480];
	format(str,sizeof(str),""COL_WHITE"Viewing group:"COL_GREEN" %s\n"COL_WHITE"Group ID: %i\nGroup Members: %i\nGroup Owner: %s",
	Groups[groupid][GroupName],Groups[groupid][GroupID],Groups[groupid][GroupMembers],Groups[groupid][GroupOwner]);
	ShowPlayerDialog(playerid,5472,DIALOG_STYLE_MSGBOX,"DayZ - Viewing Group Info",str,"Close",""); //it's edited here
	return 1;
}

CMD:makegroup(playerid,params[])
{
	new groupnamecmd[16];
	if(sscanf(params, "s[16]", groupnamecmd)) return SendClientMessage(playerid,-1,"*"COL_RED" /makegroup [group name] [16 Characters]");

	if(gettime() - 480 < pInfo[playerid][pGroupSpam]) return SendClientMessage(playerid,-1,"*"COL_RED" Wait eight minutes to create an group again!");
	{
		if(pInfo[playerid][pHour] >= 2)
		{
		    if(pInfo[playerid][IsPlayerInGroup] == 0)
		    {
				if(strlen(params) > 16)
				{
					SendClientMessage(playerid,-1,"*"COL_RED" Group name is to long (MAX CHARACTERS 16)");
				}
				else
				{
					DayZSA_CreateGroup(playerid,groupnamecmd,PlayerName(playerid));
					pInfo[playerid][pGroupSpam] = gettime();
				}
			}
			else return SendClientMessage(playerid,-1,"*"COL_RED" You are already in a group/made one!");
		}
		else return SendClientMessage(playerid,-1,"*"COL_RED" You need +2 hours played!");
	}
	return 1;
}

CMD:invitegroup(playerid,params[])
{
	new targetid;
	if(sscanf(params, "u", targetid)) return SendClientMessage(playerid,-1,"*"COL_RED" /invitegroup [playerid]");

	if(pInfo[targetid][IsPlayerInGroup] == 0)
	{
		if(pInfo[playerid][IsPlayerInGroup] == 1)
		{
		    if(pInfo[playerid][IsPlayerGroupOwner] == 1)
		    {
				new str[256],str2[128];
				format(str,sizeof(str),"*"COL_YELLOW" %s(%i) has invited you to group %s(%i) /acceptgroup, to join the group to deny /denygroup!",PlayerName(playerid),playerid,GetPlayerGroupName(playerid),pInfo[playerid][IsPlayerInGroupID]);
				SendClientMessage(targetid,-1,str);
				format(str2,sizeof(str2),"*"COL_YELLOW" You have sent an invite to %s(%i) to join your group!",PlayerName(targetid),targetid);
				SendClientMessage(playerid,-1,str2);
				pInfo[targetid][IsPlayerInvitedGroupID] = pInfo[playerid][IsPlayerInGroupID];
				pInfo[targetid][IsPlayerInvited] = 1;
			}
			else return SendClientMessage(playerid,-1,"*"COL_RED" You must be the group owner to use this command!");
		}
		else return SendClientMessage(playerid,-1,"*"COL_RED" You must be in a group to use this command!");
	}
	else return SendClientMessage(playerid,-1,"*"COL_RED" The player you are trying to invite is already in a group.");
	return 1;
}

CMD:acceptgroup(playerid)
{
	if(pInfo[playerid][IsPlayerInvited] == 1)
	{
		new str[230];
		pInfo[playerid][IsPlayerInvited] = 0;
		pInfo[playerid][IsPlayerInGroup] = 1;
		pInfo[playerid][IsPlayerInGroupID] = pInfo[playerid][IsPlayerInvitedGroupID];
		pInfo[playerid][IsPlayerInvitedGroupID] = 0;
		Groups[pInfo[playerid][IsPlayerInGroupID]][GroupMembers]++;

		format(str,sizeof(str),"*"COL_YELLOW" Player %s(%i) has joined the group %s(%i)",PlayerName(playerid), playerid, Groups[pInfo[playerid][IsPlayerInGroupID]][GroupName], pInfo[playerid][IsPlayerInGroupID]);
		SendMessageToAllGroups(Groups[pInfo[playerid][IsPlayerInGroupID]][GroupID], str, -1);
	}
	else return SendClientMessage(playerid,-1,"*"COL_RED" You have not been invited to join any groups!");
	return 1;
}


CMD:denygroup(playerid)
{
	if(pInfo[playerid][IsPlayerInvited] == 1)
	{
		pInfo[playerid][IsPlayerInvited] = 0;
		pInfo[playerid][IsPlayerInGroup] = -1;
		pInfo[playerid][IsPlayerInvitedGroupID] = 0;
		SendClientMessage(playerid,-1,"*"COL_YELLOW" You denied to join the group!");
	}
	else return SendClientMessage(playerid,-1,"*"COL_RED" You have not been invited to join any groups!");
	return 1;
}

CMD:version(playerid,params[])
{
	new targetid;
	if(sscanf(params, "u", targetid)) return SendClientMessage(playerid,-1,"*"COL_RED" /version [playerid]");

 	new string[128];
    GetPlayerVersion(targetid, string, sizeof(string));
    format(string, sizeof(string), "*"COL_RED"Player %s SA-MP version"COL_WHITE" %s",PlayerName(targetid),string);
    SendClientMessage(playerid, -1, string);
	return 1;
}

CMD:kickgroup(playerid,params[])
{
	new targetid;
	if(sscanf(params, "u", targetid)) return SendClientMessage(playerid,-1,"*"COL_RED" /kickgroup [playerid]");

	if(pInfo[playerid][IsPlayerInGroup] == 1)
	{
	    if(pInfo[playerid][IsPlayerGroupOwner] == 1)
	    {
			if(pInfo[targetid][IsPlayerInGroupID] == pInfo[playerid][IsPlayerInGroupID])
			{
				new str[180],str2[128];
				format(str,sizeof(str),"*"COL_RED" You were kicked from group %s(%i)",GetPlayerGroupName(targetid),pInfo[targetid][IsPlayerInGroupID]);
				SendClientMessage(targetid,-1,str);
				format(str2,sizeof(str2),"*"COL_RED" You have kicked %s(%i) from your group!",PlayerName(targetid),targetid);
				SendClientMessage(playerid,-1,str2);
			    Groups[pInfo[targetid][IsPlayerInGroupID]][GroupMembers]--;

			    pInfo[targetid][IsPlayerInGroup] = 0;
			    pInfo[targetid][IsPlayerInGroupID] = 0;
			}
			else return SendClientMessage(playerid,-1,"*"COL_RED" That player is not in your group!");
		}
		else return SendClientMessage(playerid,-1,"*"COL_RED" You must be the group owner to use this command!");
	}
	else return SendClientMessage(playerid,-1,"*"COL_RED" You must be in a group to use this command!");
	return 1;
}

CMD:groupfind(playerid,params[])
{
	new targetid;
	if(sscanf(params, "u", targetid)) return SendClientMessage(playerid,-1,"*"COL_RED" /groupfind [playerid]");

	if(pInfo[playerid][IsPlayerInGroup] == 1)
	{
		if(pInfo[targetid][IsPlayerInGroupID] == pInfo[playerid][IsPlayerInGroupID])
		{
			new str[250];
			GetPlayer2DZone(targetid, zonegps, MAX_ZONE_NAME);
			format(stringgps,sizeof(stringgps),"%s", zonegps);
			format(str,sizeof(str),"*"COL_YELLOW" Group member %s(%i) is at %s",PlayerName(targetid),targetid,stringgps);
			SendClientMessage(playerid,-1,str);
		}
		else return SendClientMessage(playerid,-1,"*"COL_RED" The player you are trying to find isn't in your group!");
	}
	else return SendClientMessage(playerid,-1,"*"COL_RED" You must be in a group to use this command!");
	return 1;
}

CMD:leavegroup(playerid)
{
	if(pInfo[playerid][IsPlayerInGroup] == 1)
	{
	    new str[180];
	    format(str,sizeof(str),"*"COL_YELLOW" %s(%i) has left the group!",PlayerName(playerid),playerid);
	    SendMessageToAllGroups(Groups[pInfo[playerid][IsPlayerInGroupID]][GroupID], str, -1);
	    Groups[pInfo[playerid][IsPlayerInGroupID]][GroupMembers]--;
	    pInfo[playerid][IsPlayerInGroup] = 0;
	    pInfo[playerid][IsPlayerInGroupID] = 0;
	}
	else return SendClientMessage(playerid,-1,"*"COL_RED" You must be in a group to use this command!");
	return 1;
}

CMD:destroygroup(playerid,params[])
{
	new reason[105];
	if(sscanf(params, "s[105]", reason)) return SendClientMessage(playerid,-1,"*"COL_RED" /destroygroup [reason]");

	if(pInfo[playerid][IsPlayerInGroup] == 1)
	{
	    if(pInfo[playerid][IsPlayerGroupOwner] == 1)
	    {
			new str[24],gname[16],msg[280];

			format(str,sizeof(str),"Destroyed");
			format(gname,sizeof(gname),"Destroyed");
			format(msg,sizeof(msg),"*"COL_YELLOW" %s(%i) has dis-banded the group %s [Reason: %s]",PlayerName(playerid),playerid, GetPlayerGroupName(playerid), reason);
			SendClientMessageToAll(-1,msg);

			Groups[pInfo[playerid][IsPlayerInGroupID]][GroupOwner] = str;
			Groups[pInfo[playerid][IsPlayerInGroupID]][GroupName] = gname;
			Groups[pInfo[playerid][IsPlayerInGroupID]][GroupMembers] = 0;

			foreach(Player,i)
			{
			    if(pInfo[i][IsPlayerInGroupID] == pInfo[playerid][IsPlayerInGroupID])
			    {
    				pInfo[i][IsPlayerInGroup] = 0;
					pInfo[i][IsPlayerInGroupID] = 0;

				}
			}

			pInfo[playerid][IsPlayerInGroup] = 0;
			pInfo[playerid][IsPlayerGroupOwner] = 0;
			pInfo[playerid][IsPlayerInGroupID] = 0;

		}
		else return SendClientMessage(playerid,-1,"*"COL_RED" That player is not in your group!");
	}
	else return SendClientMessage(playerid,-1,"*"COL_RED" You must be the group owner to use this command!");
	return 1;
}

CMD:g(playerid,params[])
{
	new adminstring[280];
	if(pInfo[playerid][IsPlayerInGroup] == 1)
	{
	    if(!strlen(params))
	    {
	        SendClientMessage(playerid, -1, "*"COL_GREEN" /g [message]");
	        return 1;
		}
		format(adminstring, sizeof(adminstring), ""COL_LIGHTBLUE"[Group Chat] %s(%d)"COL_WHITE": %s",PlayerName(playerid), playerid, params);
		SendMessageToAllGroups(Groups[pInfo[playerid][IsPlayerInGroupID]][GroupID], adminstring, -1);
	}
	else {
		SendClientMessage(playerid,-1,"*"COL_RED" You need to be in a group to use this command!");
	}
	return 1;
}

CMD:firstperson(playerid)
{
	if(pInfo[playerid][FirstPerson] == 0)
	{
		firstperson[playerid] = CreateObject(19300, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
		AttachObjectToPlayer(firstperson[playerid],playerid, 0.0, 0.12, 0.7, 0.0, 0.0, 0.0);
		AttachCameraToObject(playerid, firstperson[playerid]);
		pInfo[playerid][FirstPerson] = 1;
		SendClientMessage(playerid,-1,""chat" First person enabled type /firstperson again to disable it!");
	}

	else if(pInfo[playerid][FirstPerson] == 1)
	{
		SetCameraBehindPlayer(playerid);
		DestroyObject(firstperson[playerid]);
		pInfo[playerid][FirstPerson] = 0;
		SendClientMessage(playerid,-1,""chat" First person enabled type /firstperson again to disable it!");
	}
	return 1;
}

CMD:map(playerid)
{
	if(PlayerHasItem(playerid,"Map"))
 	{
		if(pInfo[playerid][pIsMapOpened] == 0)
		{
 			PlayerTextDrawShow(playerid, Map[playerid]);
   			SendClientMessage(playerid,-1,"*"COL_RED" Type /map again to disable it.");
	    	pInfo[playerid][pIsMapOpened] = 1;
		}
		else return pInfo[playerid][pIsMapOpened] = 0,PlayerTextDrawHide(playerid, Map[playerid]);
	}
	return 1;
}

CMD:stopambient(playerid)
{
	StopAudioStreamForPlayer(playerid);
	SendClientMessage(playerid,-1,"*"COL_GREEN" You've stop playing the ambient!");
	return 1;
}

CMD:handsup(playerid)
{
	if(Handup[playerid] == 0)
	{
    	SetPlayerSpecialAction(playerid,SPECIAL_ACTION_HANDSUP);
		Handup[playerid] = 1;
		SendClientMessage(playerid,-1,"*"COL_RED" To disable /handsup!");
	}
	else
	{
	    SetPlayerSpecialAction(playerid,0);
	    ClearAnimations(playerid);
	    Handup[playerid] = 0;
	}
	return 1;
}

CMD:rules(playerid)
{
	new str[600];
	strcat(str,"1. Respect your fellow Players, Administrators, and Moderators.\n2. No offensive language!\n3. Do not use any third party mod!\n\
	4. Do not argue with any staff members!\n5. Do not duplicate loots!\n6. Use common sense. If you are being an ass you will be treated like one.\n7. No Advertising\n");
	strcat(str,"8. Do not abuse or exploit any bugs!\n9. No pausing during playing!\n10. Do not spam or flood the chat\n11. Do not C-Bug or any other SA-MP glitches!");
	ShowPlayerDialog(playerid,2657,DIALOG_STYLE_MSGBOX,"DayZ - Rules",str,"Close","");
	return 1;
}

CMD:stopanim(playerid, params[])
{
	if(GetPVarInt(playerid, "UsingAnim") == 1)
	{
		SendClientMessage(playerid, COLOR_WHITE, ""chat" Your animations were cleared!");
		ClearAnimations(playerid);
		SetPlayerSkin(playerid, GetPlayerSkin(playerid));
		DeletePVar(playerid,"UsingAnim");
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	}
	else SendClientMessage(playerid, COLOR_WHITE, ""chat" You are currently not using any animation");
	return 1;
}

CMD:sit(playerid, params[])
{
	new choice[32];
	if(sscanf(params, "s[32]", choice))
	{
		SendClientMessage(playerid, -1, ""chat" /sit [1-3]");
		return 1;
	}
	if(strcmp(choice, "1", true) == 0)
	{
		ApplyAnimation(playerid,"INT_OFFICE","OFF_Sit_Type_Loop", 4.0, 1, 0, 0, 0, 0);
		SetPVarInt(playerid, "UsingAnim", 1);
		SendClientMessage(playerid, -1, ""chat" To stop the animation type in /stopanim");
	}
	if(strcmp(choice, "2", true) == 0)
	{
		ApplyAnimation(playerid,"BEACH", "ParkSit_M_loop", 4.0, 1, 0, 0, 0, 0);
		SetPVarInt(playerid, "UsingAnim", 1);
		SendClientMessage(playerid, -1, ""chat" To stop the animation type in /stopanim");
	}
	if(strcmp(choice, "3", true) == 0)
	{
		ApplyAnimation(playerid,"BEACH", "ParkSit_W_loop", 4.0, 1, 0, 0, 0, 0);
		SetPVarInt(playerid, "UsingAnim", 1);
		SendClientMessage(playerid, -1, ""chat" To stop the animation type in /stopanim");
	}
	if(strcmp(choice, "4", true) == 0)
	{
		ApplyAnimation(playerid,"BAR","dnk_stndF_loop", 4.0, 1, 0, 0, 0, 0);
		SetPVarInt(playerid, "UsingAnim", 1);
		SendClientMessage(playerid, -1, ""chat" To stop the animation type in /stopanim");
	}
	return 1;
}

CMD:smoke(playerid, params[])
{
	new choice[32];
	if(sscanf(params, "s[32]", choice))
	{
		SendClientMessage(playerid, -1, ""chat" /smoke [1-2]");
		return 1;
	}
	if(strcmp(choice, "1", true) == 0)
	{
		ApplyAnimation(playerid, "SMOKING", "F_smklean_loop", 4.0, 1, 0, 0, 0, 0);
		SendClientMessage(playerid, -1, ""chat" To stop the animation type in /stopanim");
		SetPVarInt(playerid, "UsingAnim", 1);
	}
	if(strcmp(choice, "2", true) == 0)
	{
		ApplyAnimation(playerid,"SMOKING", "M_smklean_loop", 4.0, 1, 0, 0, 0, 0);
		SendClientMessage(playerid, -1, ""chat" To stop the animation type in /stopanim");
		SetPVarInt(playerid, "UsingAnim", 1);
	}
	return 1;
}

CMD:wave(playerid, params[])
{
	ApplyAnimation(playerid, "ON_LOOKERS", "wave_loop", 4.0, 1, 0, 0, 0, 0);
	SendClientMessage(playerid, -1, ""chat" To stop the animation type in /stopanim");
	SetPVarInt(playerid, "UsingAnim", 1);
	return 1;
}

CMD:commands(playerid)
{
    ShowPlayerDialog(playerid,5472,DIALOG_STYLE_LIST,"DayZ - Commands","General Commands\nAnimation Commands\nGroup Commands\n","Select","Close");
	return 1;
}

CMD:acmds(playerid)
{
	if(pInfo[playerid][pAdminLevel] >= 1)
	{
		new str[480];
	    strcat(str,"Level 1: /info, /spec, /specoff, /clearanim, /kick, /mute, /unmute, /warn, /a, /wslap, /getid\n");
		strcat(str,"Level 2: /setweather, /slap, /cc, /unban, /ban, /tban\n");
		strcat(str,"Level 3: /akill, /ann2\n");
		strcat(str,"Level 4: /ip, /ann, /sethelper\n");
		strcat(str,"Level 5: /get, /respawnallcars, /respawncars, /sethumanity\n");
		strcat(str,"Level 6: /setadmin, /setpremium, /nuke, /changename, /giveallitems");
        ShowPlayerDialog(playerid,8348,DIALOG_STYLE_MSGBOX,"DayZ - Admin Commands",str,"Close","");
	}
	else return SendClientMessage(playerid,-1,"*"COL_RED" You do not have the right admin permissions for this command!");
	return 1;
}

CMD:basickeys(playerid)
{
	new str[480];
	strcat(str,"Press ' Y ' To open inventory\nPress ' N ' To loot\nPress ' LALT (LEFT ALT) ' To loot drop items!\nPress ' C ' To refill cainster\nPress ' N ' to loot dead bodys!\n\
	Hold ' H ' To go prone!\nPress ' NUMPAD 1 ' to view map or use it from inventory!");
	ShowPlayerDialog(playerid,8741,DIALOG_STYLE_MSGBOX,"DayZ - Keys",str,"Close","");
	return 1;
}

CMD:s(playerid, params[]) return cmd_shout(playerid, params);
CMD:l(playerid, params[]) return cmd_local(playerid, params);
CMD:b(playerid, params[]) return cmd_local(playerid, params);
CMD:o(playerid, params[]) return cmd_ooc(playerid, params);
CMD:cmds(playerid, params[]) return cmd_commands(playerid);
CMD:hu(playerid, params[]) return cmd_handsup(playerid);
CMD:inv(playerid) return ShowInventory(playerid);


CMD:help(playerid)
{
    ShowPlayerDialog(playerid, 8341, DIALOG_STYLE_LIST, "DayZ - Help", "General Commands\nSurvival Tips\nZombies & Avoidance\n", "Select", "Close");
	return 1;
}

CMD:me(playerid, params[])
{
    new string[128], action[100];
    if(sscanf(params, "s[100]", action))
    {
        SendClientMessage(playerid, -1, ""chat" /me [action]");
        return 1;
    }
    else
    {
        format(string, sizeof(string), "* %s %s", PlayerName(playerid), action);
        ProxDetector(30, playerid, string, COLOR_GREY);
    }
    return 1;
}

CMD:shout(playerid, params[])
{
    new string[128],shout[100];
    if(sscanf(params, "s[100]", shout))
    {
        SendClientMessage(playerid, -1, ""chat" /(s)hout [message]");
        return 1;
    }
    else
    {
        format(string, sizeof(string), "%s shouts: %s!",PlayerName(playerid),shout);
        ProxDetector(80.0, playerid, string, COLOR_GREY);
    }
    return 1;
}

CMD:local(playerid,params[])
{
    if(isnull(params)) return SendClientMessage(playerid, -1,""chat" /l(ocal) [local ooc chat]");
    new string[128];

    format(string, sizeof(string), "((LOCAL)) %s Says: (( %s ))", PlayerName(playerid), params);
    ProxDetector(20.0, playerid, string, COLOR_GREY);
    return 1;
}

CMD:r(playerid,params[])
{
	if(PlayerHasItem(playerid,"Radio Device"))
	{
	    if(isnull(params)) return SendClientMessage(playerid, -1,""chat" /r [radio chat]");
	    new string[128];

	    format(string, sizeof(string), ""COL_YELLOW"((RADIO TRANSMITTER))"COL_GREY" %s Says: (( %s ))", PlayerName(playerid), params);
	    ProxDetector(pInfo[playerid][pRadioFreq], playerid, string, COLOR_GREY);
	}
	else return SendClientMessage(playerid,-1,""chat" You don't have an radio!");
    return 1;
}

CMD:goff(playerid, params[])
{
	if(globalStatus[playerid] == 0)
	{
	    globalStatus[playerid] = 1;
	    SendClientMessage(playerid, -1, ""chat" Global chat has been disabled to enable, /gon");
	}
	return 1;
}

CMD:gon(playerid, params[])
{
	if(globalStatus[playerid] == 1)
	{
	    globalStatus[playerid] = 0;
	    SendClientMessage(playerid, -1, ""chat" Global chat has been enabled to disable, /goff");
	}
	return 1;
}

CMD:ooc(playerid, params[])
{
	if(PlayerHasItem(playerid,"Radio Device"))
	{
	    if(gettime() - 7 < globalChat[playerid]) return GameTextForPlayer(playerid,"~w~WAIT BEFORE USING GLOBAL CHAT AGAIN!",1000,5);
	    {
	        if(globalStatus[playerid] == 0)
			{
				if(isnull(params)) return SendClientMessage(playerid, -1,""chat" /o(oc) [global chat]");
	    		new string[128];

			    format(string, sizeof(string), "((GLOBAL CHAT)) %s Says: (( %s ))", PlayerName(playerid), params);
			    SendGlobal(9999.0, playerid, string, COLOR_GREY);
			    globalChat[playerid] = gettime();
			}
			else return SendClientMessage(playerid, -1, ""chat" You must have global chat enabled to do this, /gon");
		}
	}
	else return SendClientMessage(playerid,-1,""chat" You don't have an radio!");
	return 1;
}

CMD:report(playerid,params[])
{
	new targetid,reason[105],reportstring[128];
	if(sscanf(params, "us[105]", targetid,reason)) return SendClientMessage(playerid,-1,""chat" /report [playerid] [reason]");
	if(!IsPlayerConnected(targetid)) return SendClientMessage(playerid,-1,"*"COL_RED" Player is not online");
	if(targetid == playerid) return SendClientMessage(playerid,-1,"*"COL_RED" You cannot report yourself!");

	if(!IsPlayerNPC(targetid))
	{
		if(pInfo[playerid][IsPlayerMuted] == 0)
		{
			SendClientMessage(playerid,-1,"*"COL_LGREEN" Your report has been sent to the online admins!");

			format(reportstring,sizeof(reportstring), ""chat""COL_YELLOW" Player %s(%d) reported %s(%d)"COL_WHITE" (Reason: %s)", PlayerName(playerid),playerid,PlayerName(targetid),targetid,reason);
			SendMessageToAllAdmins(reportstring,-1);
		}
		else {
			SendClientMessage(playerid,-1,"*"COL_RED" You cannot report a player while be muted");
		}
	}
	else return SendClientMessage(playerid,-1,"*"COL_RED" You cannot report an NPC");
	return 1;
}

CMD:ask(playerid,params[])
{
	new askstr[256],sendtohelpers[256],helpstr[128];
	if(sscanf(params, "s[128]", askstr)) return SendClientMessage(playerid,-1,"*"COL_LGREEN" /ask [question]");

	if(gettime() - 180 < pInfo[playerid][pSpamAsk]) return SendClientMessage(playerid,-1,"*"COL_RED" Wait three minutes to ask a question again!");
	{
		if(pInfo[playerid][IsPlayerMuted] == 0)
		{
			SendClientMessage(playerid,-1,"*"COL_LGREEN" Your question has been sent to the online helpers!");
			format(sendtohelpers,sizeof(sendtohelpers),"*"COL_YELLOW" Player %s(%i) has asked a question use /respond [id] [answer]",PlayerName(playerid),playerid);
			format(helpstr,sizeof(helpstr),"* [QUESTION] %s",askstr);
			SendMessageToAllHelpers(sendtohelpers,-1);
			SendMessageToAllHelpers(helpstr,-1);
			pInfo[playerid][pSpamAsk] = gettime();
		}
		else {
			SendClientMessage(playerid,-1,"*"COL_RED" You cannot report a player while be muted");
		}
	}
	return 1;
}

CMD:respond(playerid,params[])
{
    if(pInfo[playerid][Helper] >= 1)
    {
		new sendanswer[256],targetid;
		if(sscanf(params, "us[256]",targetid, sendanswer)) return SendClientMessage(playerid,-1,"*"COL_LGREEN" /respond [playerid] [question]");

		new str[256],str2[256],str3[128];
		format(str,sizeof(str),"*"COL_YELLOW" Helper %s(%i) has responded to your question!",PlayerName(playerid), playerid);
		SendClientMessage(targetid,-1,str);
		format(str2,sizeof(str2),"* [ANSWER] %s",sendanswer);
		SendClientMessage(targetid,-1,str2);
		format(str3,sizeof(str3),"*"COL_LGREEN" Helper %s(%i) has responded to %s(%i) question!",PlayerName(playerid), playerid, PlayerName(targetid), targetid);
		SendMessageToAllHelpers(str3,-1);
	}
	else return SendClientMessage(playerid,-1,"*"COL_RED" You are not an helper to use this command!");
	return 1;
}

CMD:admins(playerid, params[])
{
	if(pInfo[playerid][pHour] >= 25)
	{
	    new adminstring[128];
	    if(IsPlayerConnected(playerid))
	    {
	        for (new i = 0; i < MAX_PLAYERS; i++)
	        {
	            if(IsPlayerConnected(i))
	            {
	                if(pInfo[i][pAdminLevel] > 0)
	                {
	                    format(adminstring, sizeof(adminstring),"%s%s: %s\n", adminstring, GetAdminName(i), PlayerName(i));
	                }
	            }
	        }
	        ShowPlayerDialog(playerid,DIALOG_ADMINS,DIALOG_STYLE_MSGBOX,"Online admins",adminstring,"Close","");
		}
 		else return SendClientMessage(playerid,-1,"*"COL_LGREEN" No admins online");
	}
	else return SendClientMessage(playerid,-1,"*"COL_LGREEN" You cannot view admins online (You need 25 hours IG time)");
    return 1;
}

CMD:premiums(playerid, params[])
{
	if(pInfo[playerid][pHour] >= 1)
	{
	    new adminstring[128];
	    if(IsPlayerConnected(playerid))
	    {
	        for (new i = 0; i < MAX_PLAYERS; i++)
	        {
	            if(IsPlayerConnected(i))
	            {
	                if(pInfo[i][pPremium] > 0)
	                {
	                    format(adminstring, sizeof(adminstring),"%sLevel %d: %s\n", adminstring, pInfo[i][pPremium], PlayerName(i));
	                }
	            }
	        }
	        ShowPlayerDialog(playerid,DIALOG_VIPS,DIALOG_STYLE_MSGBOX,"Online Premiums",adminstring,"Close","");
		}
 		else return SendClientMessage(playerid,-1,"*"COL_LGREEN" No premium members online");
	}
	else return SendClientMessage(playerid,-1,"*"COL_LGREEN" You cannot view vips online (You need 1 Hour IG time)");
    return 1;
}

CMD:helpers(playerid, params[])
{
	if(pInfo[playerid][pHour] >= 1)
	{
	    new adminstring[128];
	    if(IsPlayerConnected(playerid))
	    {
	        for (new i = 0; i < MAX_PLAYERS; i++)
	        {
	            if(IsPlayerConnected(i))
	            {
	                if(pInfo[i][Helper] > 0)
	                {
	                    format(adminstring, sizeof(adminstring),"%s %s\n", adminstring, PlayerName(i));
	                }
	            }
	        }
	        ShowPlayerDialog(playerid,DIALOG_VIPS,DIALOG_STYLE_MSGBOX,"Online Helpers",adminstring,"Close","");
		}
 		else return SendClientMessage(playerid,-1,"*"COL_LGREEN" No helpers online at the moment!");
	}
	else return SendClientMessage(playerid,-1,"*"COL_LGREEN" You cannot view helpers online (You need 1 Hour IG time)");
    return 1;
}

CMD:stats(playerid) return cmd_survival(playerid);

CMD:survival(playerid)
{
	new str[128];
	format(str, sizeof(str), "*"COL_WHITE" Blood: %i | Hunger: %i | Thirst: %i", pInfo[playerid][pBlood], pInfo[playerid][pHunger], pInfo[playerid][pThrist]);
	SendClientMessage(playerid, -1, str);
	return 1;
}

CMD:info(playerid,params[])
{
    if(pInfo[playerid][pAdminLevel] >= 1)
    {
        if(IsPlayerConnected(playerid))
        {
            new targetid;
            if(sscanf(params, "u", targetid)) return SendClientMessage(playerid,-1,"*"COL_RED" /info [playerid]");
            if(!IsPlayerConnected(targetid)) return SendClientMessage(playerid,-1,"*"COL_RED" Player is not online");

			new str[1200],Float:fPos[3];
   			new Float:vehhp;
            GetVehicleHealth(GetPlayerVehicleID(targetid),vehhp);
			GetPlayerPos(targetid,fPos[0],fPos[1],fPos[2]);
 			GetPlayer2DZone(targetid, zonegps, MAX_ZONE_NAME);
			format(stringgps,sizeof(stringgps),"%s", zonegps);

			format(str,sizeof(str),""COL_WHITE"Player"COL_GREEN" %s"COL_WHITE"(%i) information!\nPlayer Ping: %i\nPlayer FPS: %d\nX: %f Y: %f Z: %f\nBackpack: %s\nLocation: %s\nAirbreak Warnings: %i\n\
			Admin Warnings: %i\nMuted: %i\nAdmin Status: %s\nPremium Status: %i\nAlive Time: %s\nMurders: %i\nBlood: %i\nHumanity: %i\nSkin: %i\nCurrent Weapon: %s\nCurrent Ammo: %i\nVehicle ID: %i\nVehicle Tires: %i\nVehicle Fuel: %i\nVehicle Engine: %i\nVehicle Health: %0.f",
			PlayerName(targetid),targetid,GetPlayerPing(targetid),FPS2[targetid]-1,fPos[0],fPos[1],fPos[2],GetBackpackName(targetid),stringgps,pInfo[targetid][pAirbreakWarning],
			pInfo[targetid][pWarnings],pInfo[targetid][IsPlayerMuted],GetAdminName(targetid),pInfo[targetid][pPremium],TimeConvert(pInfo[targetid][pAliveTime]),pInfo[targetid][Murders],
			pInfo[targetid][pBlood],pInfo[targetid][Humanity],GetPlayerSkin(targetid),DayZSA_GetWeaponName(targetid),GetPlayerAmmo(targetid),GetPlayerVehicleID(targetid),vInfo[GetPlayerVehicleID(targetid)][vehicleTires],
			vInfo[GetPlayerVehicleID(targetid)][vehicleFuel],vInfo[GetPlayerVehicleID(targetid)][vehicleEngine],vehhp);
			ShowPlayerDialog(playerid,6365,DIALOG_STYLE_MSGBOX,"Viewing player info",str,"Close","");
		}
	}
	else {
		SendClientMessage(playerid,-1,"*"COL_RED" You do not have the right admin permissions for this command!");
	}
	return 1;
}

CMD:ban(playerid, params[])
{
    if(pInfo[playerid][pAdminLevel] >= 2)
    {
		if(sscanf(params, "us[128]", ban_target, ban_reason)) return SendClientMessage(playerid, -1, ""chat" Correct usage -> /ban <player> <reason>");
		if(!IsPlayerConnected(ban_target)) return SendClientMessage(playerid, -1, ""chat" Player was not found!");
		new string[220];
		format(string, sizeof(string), ""chat" %s %s has banned %s PERM [Reason: %s]",GetAdminName(playerid),PlayerName(playerid),PlayerName(ban_target), ban_reason);
		SendMessageToAllAdmins(string, -1);
		jBan(ban_target, playerid, ban_reason, 0, 1);
	}
	else {
		SendClientMessage(playerid,-1,""chat" You do not have the right admin permissions for this command!");
	}
	return 1;
}

CMD:tban(playerid, params[])
{
    if(pInfo[playerid][pAdminLevel] >= 2)
    {
		if(sscanf(params, "uis[128]", ban_target, ban_time, ban_reason)) return SendClientMessage(playerid, -1, ""chat" Correct usage -> /ban <player> <time (minutes)> <reason>");
		if(!IsPlayerConnected(ban_target)) return SendClientMessage(playerid, -1, ""chat" Player was not found!");
		if(ban_time < 0) SendClientMessage(playerid, -1, ""chat" Please input a valid ban time!");
		new string[220];
		format(string, sizeof(string), ""chat" %s %s has banned %s for %i minutes [Reason: %s]",GetAdminName(playerid),PlayerName(playerid),PlayerName(ban_target), ban_time, ban_reason);
		SendMessageToAllAdmins(string, -1);
		jBan(ban_target, playerid, ban_reason, ban_time, 1);
	}
	else {
		SendClientMessage(playerid,-1,""chat" You do not have the right admin permissions for this command!");
	}
	return 1;
}

CMD:unbanip(playerid, params[])
{
	if(pInfo[playerid][pAdminLevel] >= 2)
    {
        new unban_ip[24];
		if(sscanf(params, "s[24]", unban_ip)) return SendClientMessage(playerid, -1, ""chat" Correct usage -> /unbanip <name>");
		jUnbanIP(unban_ip);
		format(ban_reason, MAX_REASON_LENGTH, ""chat" You have un-banned %s", unban_ip);
		SendClientMessage(playerid, -1, ban_reason);
 	}
	else {
		SendClientMessage(playerid,-1,""chat" You do not have the right admin permissions for this command!");
	}
	return 1;
}

CMD:unbanname(playerid, params[])
{
	if(pInfo[playerid][pAdminLevel] >= 2)
    {
        new unban_name[24];
		if(sscanf(params, "s[24]", unban_name)) return SendClientMessage(playerid, -1, ""chat" Correct usage -> /unbanname <name>");
		jUnbanName(unban_name);
		format(ban_reason, MAX_REASON_LENGTH, ""chat" You have un-banned %s", unban_name);
		SendClientMessage(playerid, -1, ban_reason);
	}
	else {
		SendClientMessage(playerid,-1,""chat" You do not have the right admin permissions for this command!");
	}
	return 1;
}

CMD:getid(playerid,params[])
{
	new found, string[128], playername[MAX_PLAYER_NAME];
	if(isnull(params)) return SendClientMessage(playerid, -1, ""chat" /getid [PartOfName] ");
	format(string,sizeof(string),""chat" Searched for: \"%s\"",params);
	SendClientMessage(playerid, -1,string);
	for(new i=0; i <= MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			GetPlayerName(i, playername, MAX_PLAYER_NAME);
			new namelen = strlen(playername);
			new bool:searched=false;
			for(new pos=0; pos <= namelen; pos++)
			{
				if(searched != true)
				{
					if(strfind(playername,params,true) == pos)
					{
						found++;
						format(string,sizeof(string),"*"COL_LGREEN" %d. %s (ID: %d)",found,playername,i);
						SendClientMessage(playerid, -1 ,string);
						searched = true;
					}
				}
			}
		}
	}
	if(found == 0)
		SendClientMessage(playerid, -1, "*"COL_RED" No Players Localized!");
	return 1;
}

CMD:cc(playerid,params[])
{
	if(pInfo[playerid][pAdminLevel] >= 2)
	{
		new reason[105], string[128];
	    if(sscanf(params, "s[105]", reason)) return SendClientMessage(playerid,-1,""chat" /cc [reason]");

		ClearChat();
		format(string,sizeof(string), "*"COL_RED" %s %s cleared the chat"COL_WHITE" [Reason: %s]",GetAdminName(playerid),PlayerName(playerid),reason);
		SendClientMessageToAll(-1,string);
	}
	else {
	    SendClientMessage(playerid,-1,"*"COL_RED" You do not have the right admin permissions for this command!");
	}
	return 1;
}

CMD:giveallitems(playerid,params[])
{
	if(pInfo[playerid][pAdminLevel] >= 6)
	{
		new string[64], amount;
	    if(sscanf(params, "is[64]", amount,string)) return SendClientMessage(playerid,-1,""chat" /giveallitem [amount] [item name] (MAKE SURE IT'S NOT INVALID!)");

		foreach(Player,i)
		{
		    AddSlotToInventoryWorld(i,string,amount);
		}

		new str[230];
		format(str,sizeof(str),"*"COL_YELLOW" %s %s has given everyone "COL_WHITE"%i"COL_GREEN" %s",GetAdminName(playerid),PlayerName(playerid), amount, string);
		SendClientMessageToAll(-1,str);
	}
	return 1;
}

CMD:setadmin(playerid,params[])
{
    if(pInfo[playerid][pAdminLevel] >= 5)
	{
		new targetid,level,string[180];
		if(sscanf(params, "ud", targetid, level)) return  SendClientMessage(playerid,-1,""chat" /setadmin [playerid] [level]");
		if(!IsPlayerConnected(targetid)) return SendClientMessage(playerid,-1,""chat" Player is not online");
		if(level < 0 || level > 6) return SendClientMessage(playerid,-1,""chat"  Admin levels are ONLY between 1-5");

        pInfo[targetid][pAdminLevel] = level;

		format(string, sizeof(string), "*"COL_RED" %s %s have given admin status of %d to %s",GetAdminName(playerid),PlayerName(playerid),level,PlayerName(targetid));
		SendClientMessageToAll(-1,string);
	}
	else {
		SendClientMessage(playerid,-1,"*"COL_RED" You do not have the right admin permissions for this command!");
	}
	return 1;
}

CMD:setpremium(playerid,params[])
{
    if(pInfo[playerid][pAdminLevel] >= 5)
	{
		new targetid,level,string[200];
		if(sscanf(params, "ud", targetid, level)) return  SendClientMessage(playerid,-1,""chat" /setpremium [playerid] [level]");
		if(!IsPlayerConnected(targetid)) return SendClientMessage(playerid,-1,""chat" Player is not online");
		if(level < 0 || level > 4) return SendClientMessage(playerid,-1,""chat" Premium levels are ONLY between 1-4");

        pInfo[targetid][pPremium] = level;

		format(string, sizeof(string), "*"COL_RED" %s %s have given premium status of %d to %s",GetAdminName(playerid),PlayerName(playerid),level,PlayerName(targetid));
		SendClientMessageToAll(-1,string);
	}
	else {
		SendClientMessage(playerid,-1,"*"COL_RED" You do not have the right admin permissions for this command!");
	}
	return 1;
}

CMD:sethelper(playerid,params[])
{
    if(pInfo[playerid][pAdminLevel] >= 4)
	{
		new targetid,level,string[200];
		if(sscanf(params, "ud", targetid, level)) return  SendClientMessage(playerid,-1,""chat" /sethelper [playerid] [level]");
		if(!IsPlayerConnected(targetid)) return SendClientMessage(playerid,-1,""chat" Player is not online");
		if(level < 0 || level > 1) return SendClientMessage(playerid,-1,""chat" Helper levels are ONLY between 0-1");

        pInfo[targetid][Helper] = level;

		format(string, sizeof(string), "*"COL_RED" %s %s have given helper status of %d to %s",GetAdminName(playerid),PlayerName(playerid),level,PlayerName(targetid));
		SendClientMessageToAll(-1,string);
	}
	else {
		SendClientMessage(playerid,-1,"*"COL_RED" You do not have the right admin permissions for this command!");
	}
	return 1;
}

CMD:slap(playerid,params[])
{
	if(pInfo[playerid][pAdminLevel] >= 2 || IsPlayerAdmin(playerid))
	{
	    new targetid,string[128];
		if(sscanf(params, "u", targetid)) return  SendClientMessage(playerid,-1,""chat" /slap [playerid]");
		if(!IsPlayerConnected(targetid)) return SendClientMessage(playerid,-1,""chat" Player is not online");

		new Float:posxx[3];
		GetPlayerPos(targetid, posxx[0], posxx[1], posxx[2]);
		SetPlayerPos_Allow(targetid, posxx[0], posxx[1], posxx[2]+40);

		if(IsPlayerAdmin(playerid))
		{
	   		format(string, sizeof(string), "*"COL_RED" RCON Admin has slapped %s",PlayerName(targetid));
			SendClientMessageToAll(-1,string);
		}
		else
		{
			format(string, sizeof(string), "*"COL_RED" %s %s has slapped %s",GetAdminName(playerid),PlayerName(playerid),PlayerName(targetid));
			SendClientMessageToAll(-1,string);
		}
	}
	else {
		SendClientMessage(playerid,-1,"*"COL_RED" You do not have the right admin permissions for this command!");
	}
	return 1;
}


CMD:spawncratem(playerid,params[])
{
    if(pInfo[playerid][pAdminLevel] >= 3)
    {
        new Float:posAir[3],adminstring[180];
        GetPlayerPos(playerid, posAir[0], posAir[1], posAir[2]);
		DayZSA_CreateAirdrop(posAir[0],posAir[1],posAir[2]);
		format(adminstring, sizeof(adminstring), ""COL_RED"[Admin] %s %s[%d] spawned a military crate at his location!",GetAdminName(playerid),PlayerName(playerid), playerid);
		SendMessageToAllAdmins(adminstring, -1);
		return 1;
	}
	else {
		SendClientMessage(playerid,-1,"*"COL_RED" You do not have the right admin permissions for this command!");
	}
	return 1;
}
CMD:wslap(playerid,params[])
{
	if(pInfo[playerid][pAdminLevel] >= 1)
	{
	    new targetid,string[128];
		if(sscanf(params, "u", targetid)) return  SendClientMessage(playerid,-1,""chat" /wslap [playerid]");
		if(!IsPlayerConnected(targetid)) return SendClientMessage(playerid,-1,""chat" Player is not online");

		new Float:posxx[3];

		GetPlayerPos(targetid, posxx[0], posxx[1], posxx[2]);
		SetPlayerPos_Allow(targetid, posxx[0], posxx[1], posxx[2]+4);

		format(string, sizeof(string), "*"COL_RED" %s %s has warned slapped %s",GetAdminName(playerid),PlayerName(playerid),PlayerName(targetid));
		SendClientMessageToAll(-1,string);
	}
	else {
		SendClientMessage(playerid,-1,"*"COL_RED" You do not have the right admin permissions for this command!");
	}
	return 1;
}

CMD:a(playerid,params[])
{
	new adminstring[257];
	if(pInfo[playerid][pAdminLevel] >= 1)
	{
	    if(!strlen(params))
	    {
	        SendClientMessage(playerid, -1, ""chat" /a [message]");
	        return 1;
		}
		format(adminstring, sizeof(adminstring), ""COL_LIGHTBLUE"[Admin Chat] %s %s[%d]: %s",GetAdminName(playerid),PlayerName(playerid), playerid, params);
		SendMessageToAllAdmins(adminstring, -1);
	}
	else {
		SendClientMessage(playerid,-1,"*"COL_RED" You do not have the right admin permissions for this command!");
	}
	return 1;
}

CMD:pchat(playerid,params[])
{
	new adminstring[257];
	if(pInfo[playerid][pPremium] >= 1)
	{
	    if(!strlen(params))
	    {
	        SendClientMessage(playerid, -1, ""chat" /pchat [text]");
	        return 1;
		}
		format(adminstring, sizeof(adminstring), ""COL_LIGHTBLUE"[Premium Chat] %s %s(%d): %s",GetPremiumName(playerid),PlayerName(playerid), playerid, params);
		SendMessageToAllPremium(adminstring, -1);
	}
	else {
		SendClientMessage(playerid,-1,"*"COL_RED" You do not have the right premium permissions for this command!");
	}
	return 1;
}

CMD:pm(playerid,params[])
{
	new targetid,pmstring[257],string[128],str2[256];

 	if(sscanf(params,"us[257]", targetid, pmstring)) return SendClientMessage(playerid,-1,"*"COL_GREEN" /pm [playerid] [message]");
	if(pInfo[playerid][pLogged] == 1)
	{
	    if(pInfo[playerid][IsPlayerMuted] == 0)
		{
			if(pInfo[targetid][pPM] == 0)
			{
				format(string,sizeof(string),"*"COL_LIGHTBLUE" PM From %s(%d) Message: %s",PlayerName(playerid),playerid,pmstring);
				SendClientMessage(targetid,-1,string);
				format(str2,sizeof(str2),"*"COL_GREEN" Sent PM to %s(%i) Text: %s",PlayerName(targetid),targetid, pmstring);
				SendClientMessage(playerid,-1,str2);
			}
			else {
				SendClientMessage(playerid,-1,"*"COL_RED" This player is not accepting any personal messages");
			}
		}
		else return SendClientMessage(playerid,-1,"*"COL_RED" You are muted you cannot send a personal message!");
	}
	return 1;
}

CMD:blockpm(playerid) return pInfo[playerid][pPM] = 1, SendClientMessage(playerid,-1,"*"COL_LGREEN" You are now blocking personal messages");
CMD:unblockpm(playerid) return pInfo[playerid][pPM] = 0, SendClientMessage(playerid,-1,"*"COL_LGREEN" You are not blocking any more personal messages");

CMD:ann(playerid,params[])
{
	if(pInfo[playerid][pAdminLevel] >= 4 || IsPlayerAdmin(playerid))
	{
	    if(isnull(params)) return SendClientMessage(playerid, -1, ""chat" /ann [Text]");
    	GameTextForAll(params,5000,3);
	}
	else {
		SendClientMessage(playerid,-1,"*"COL_LGREEN" You must be a level 4 admin");
	}
	return 1;
}

CMD:ann2(playerid,params[])
{
	if(pInfo[playerid][pAdminLevel] >= 3 || IsPlayerAdmin(playerid))
	{
	    if(isnull(params)) return SendClientMessage(playerid, -1, ""chat" /ann2 [Text]");
    	UpdateAnnouncement(params);
	}
	else {
		SendClientMessage(playerid,-1,"*"COL_LGREEN" You must be a level 3 admin");
	}
	return 1;
}

CMD:warn(playerid,params[])
{
	if(pInfo[playerid][pAdminLevel] >= 1 || IsPlayerAdmin(playerid))
	{
	    new targetid,reason[105],string[128];
	    if(sscanf(params, "us[105]", targetid, reason)) return SendClientMessage(playerid,-1,""chat" /warn [playerid] [reason]");
	    if(!IsPlayerConnected(targetid)) return SendClientMessage(playerid,-1,""chat" Player is not online");

		new sentstring[128];

        pInfo[targetid][pWarnings]++;

	    format(string,sizeof(string), "%s %s warned you\nReason: %s\nWarning Number: %i",GetAdminName(playerid),PlayerName(playerid), reason, pInfo[targetid][pWarnings]);
		ShowPlayerDialog(targetid,DIALOG_WARN,DIALOG_STYLE_MSGBOX,"Warning",string,"I Understand","");
		format(sentstring,sizeof(sentstring), "*"COL_RED" %s %s has warned %s"COL_WHITE" Reason: %s (%i / 3)",GetAdminName(playerid),PlayerName(playerid),PlayerName(targetid),reason,pInfo[targetid][pWarnings]);
		SendClientMessageToAll(-1,sentstring);

		if(pInfo[targetid][pWarnings] >= 3)
		{
			format(string, sizeof(string), "*"COL_RED" %s %s has kicked %s"COL_WHITE" [Reason: %s][Three Warning Have Exceeded!]",GetAdminName(playerid),PlayerName(playerid),PlayerName(targetid),reason);
			SendClientMessageToAll(-1,string);
			Kick(targetid);
		}
	}
	else {
		SendClientMessage(playerid,-1,"*"COL_RED" You do not have the right admin permissions for this command!");
	}
	return 1;
}
CMD:saveall(playerid)
{
	if(pInfo[playerid][pLogged] == 1)
    {
		if(pInfo[playerid][pAdminLevel] >= 5)
		{
		    foreach(Player, i)
		    {
		        if(pInfo[i][IsPlayerSpawned] == 1)
				{
					SaveStats(i);
					SendClientMessage(playerid,-1,"*"COL_GREEN" Saving everyone stats.");
					SendClientMessageToAll(-1, "*"COL_RED" The Developer of the server has initialized a save stat (globally) This will cause lag. Please stand by");
				}
			}
		}
    }
    return 1;
}
CMD:savestats(playerid)
{
	if(pInfo[playerid][pLogged] == 1)
    {
    	if(gettime() - 180 < pInfo[playerid][pSaveSpam]) return SendClientMessage(playerid,-1,"*"COL_RED" Wait three minutes to save stats!");
		{
		    if(pInfo[playerid][IsPlayerSpawned] == 1)
		    {
				SaveStats(playerid);
				SendClientMessage(playerid,-1,"*"COL_GREEN" You have saved your stats");
				pInfo[playerid][pSaveSpam] = gettime();
			}
		}
    }
    return 1;
}

CMD:ss(playerid) return cmd_savestats(playerid);

CMD:setweather(playerid,params[])
{
    if(pInfo[playerid][pAdminLevel] >= 2 || IsPlayerAdmin(playerid))
    {
		new weather,string[128];
		if(sscanf(params, "i", weather)) return SendClientMessage(playerid,-1,""chat" /setweather [weather id]");

		SetWeatherEx(weather);

		if(IsPlayerAdmin(playerid))
		{
			format(string, sizeof(string), "*"COL_RED" Weather Changed to %d",weather);
			SendClientMessageToAll(-1,string);
		}
		else
		{
			format(string, sizeof(string), "*"COL_RED" %s %s has changed the weather to %d",GetAdminName(playerid),PlayerName(playerid),weather);
			SendClientMessageToAll(-1,string);
		}
	}
	else {
		SendClientMessage(playerid,-1,"*"COL_RED" You do not have the right admin permissions for this command!");
	}
	return 1;
}

CMD:ip(playerid, params[])
{
    if(pInfo[playerid][pAdminLevel] >= 4)
    {
		new targetid,playerip[16],string[64];
		if(sscanf(params, "u", targetid, playerip)) return SendClientMessage(playerid,-1,""chat" /ip [playerid]");
		if(!IsPlayerConnected(targetid)) return SendClientMessage(playerid,-1,""chat" Player is not online");

		GetPlayerIp(targetid, playerip, sizeof(playerip));
		format(string, sizeof(string), "*"COL_RED" IP of %s %s", PlayerName(targetid), playerip);
		SendClientMessage(playerid, -1, string);
	}
	else {
		SendClientMessage(playerid,-1,"*"COL_RED" You do not have the right admin permissions for this command!");
	}
	return 1;
}

CMD:akill(playerid,params[])
{
    if(pInfo[playerid][pAdminLevel] >= 3)
    {
		new targetid,string[128];
		if(sscanf(params, "u", targetid)) return SendClientMessage(playerid,-1,""chat" /akill [playerid]");
		if(!IsPlayerConnected(targetid)) return SendClientMessage(playerid,-1,""chat" Player is not online");

		SetPlayerHealth(targetid,0.0);

		format(string, sizeof(string), "*"COL_RED" %s %s has killed %s",GetAdminName(playerid),PlayerName(playerid),PlayerName(targetid));
		SendClientMessageToAll(-1,string);
	}
	else {
		SendClientMessage(playerid,-1,"*"COL_RED" You do not have the right admin permissions for this command!");
	}
	return 1;
}

CMD:nuke(playerid,params[])
{
    if(pInfo[playerid][pAdminLevel] >= 6)
    {
		new targetid,string[128];
		if(sscanf(params, "u", targetid)) SendClientMessage(playerid,-1,""chat" /nuke [playerid]");
		if(!IsPlayerConnected(targetid)) return SendClientMessage(playerid,-1,""chat" Player is not online");

		new Float:x,Float:y,Float:z;
		GetPlayerPos(targetid,Float:x,Float:y,Float:z);
		CreateExplosion(Float:x,Float:y,Float:z,0,5.0);

		format(string, sizeof(string), "*"COL_RED" %s %s has blown up %s",GetAdminName(playerid),PlayerName(playerid),PlayerName(targetid));
		SendClientMessageToAll(-1,string);
	}
	else {
		SendClientMessage(playerid,-1,"*"COL_RED" You do not have the right admin permissions for this command!");
	}
	return 1;
}

CMD:get(playerid,params[])
{
    if(pInfo[playerid][pAdminLevel] >= 5)
    {
		new targetid;
		if(sscanf(params, "u", targetid)) SendClientMessage(playerid,-1,""chat" /get [playerid]");
		if(!IsPlayerConnected(targetid)) return SendClientMessage(playerid,-1,""chat" Player is not online");

        new Float:x, Float:y, Float:z;
		GetPlayerPos(playerid, x, y, z);
        SetPlayerPos_Allow(targetid, x, y, z+1);

        new str[256];
        format(str,sizeof(str),"*"COL_RED" %s %s has teleported %s to his location!",GetAdminName(playerid),PlayerName(playerid),PlayerName(targetid));
		SendMessageToAllAdmins(str,-1);

		if(IsPlayerInAnyVehicle(targetid))
  		{
  		    SetVehiclePos(GetPlayerVehicleID(targetid),x,y,z);
		}
	}
	else {
		SendClientMessage(playerid,-1,"*"COL_RED" You do not have the right admin permissions for this command!");
	}
	return 1;
}
CMD:spec(playerid, params[])
{
    if(pInfo[playerid][IsPlayerSpawned] == 1)
    {
        if(pInfo[playerid][pAdminLevel] >= 1)
        {
            new id2;
            new targetid;
            if(sscanf(params,"u", id2)) return SendClientMessage(playerid,-1, "*"COL_GREEN" /spec [playerid]");
            if(id2 == playerid) return SendClientMessage(playerid,-1, "*"COL_GREEN" You cannot spec yourself.");
            if(id2 == INVALID_PLAYER_ID) return SendClientMessage(playerid, -1, "*"COL_GREEN" Player not found!");
            if(IsPlayerNPC(id2)) return SendClientMessage(playerid, -1, "Sir you cannot spectate a zombie!");
            if(IsSpecing[playerid] == 1) return SendClientMessage(playerid,-1, "*"COL_GREEN" You are already spectating someone.");
            GetPlayerPos(playerid,SpecX[playerid],SpecY[playerid],SpecZ[playerid]);
            Inter[playerid] = GetPlayerInterior(playerid);
            vWorld[playerid] = GetPlayerVirtualWorld(playerid);
            TogglePlayerSpectating(playerid, true);
            if(IsPlayerInAnyVehicle(id2))
            {
                if(GetPlayerInterior(id2) > 0)
                {
                    SetPlayerInterior(playerid,GetPlayerInterior(id2));
                }
                if(GetPlayerVirtualWorld(id2) > 0)
                {
                    SetPlayerVirtualWorld(playerid,GetPlayerVirtualWorld(id2));
                }
                PlayerSpectateVehicle(playerid,GetPlayerVehicleID(id2));
            }
            else
            {
                if(GetPlayerInterior(id2) > 0)
                {
                    SetPlayerInterior(playerid,GetPlayerInterior(id2));
                }
                if(GetPlayerVirtualWorld(id2) > 0)
                {
                    SetPlayerVirtualWorld(playerid,GetPlayerVirtualWorld(id2));
                }
                PlayerSpectatePlayer(playerid,id2);
            }

            new mustbelocal[160];
            format(mustbelocal, sizeof(mustbelocal), "*"COL_LIGHTBLUE" Admin %s started spectating player %s", PlayerName(playerid), PlayerName(id2), PlayerName(targetid));
            SendMessageToAllAdmins(mustbelocal,-1);
            IsSpecing[playerid] = 1;
            IsBeingSpeced[id2] = 1;
            for (new i = 0; i < 13; i++)
            {
                GetPlayerWeaponData(playerid, i, weapons[i][0], weapons[i][1]);
            }
            spectatorid[playerid] = id2;
            SaveStats(playerid);
        }
   		else
		{
        	SendClientMessage(playerid,-1,"*"COL_RED" You do not have the right admin permissions for this command!");
    	}
	}
	else return SendClientMessage(playerid,-1,"*"COL_RED" You cannot spectate while dead, noob!");
	return 1;
}


CMD:specoff(playerid, params[])
{
    if(pInfo[playerid][pAdminLevel] >= 1)
    {
        if(IsSpecing[playerid] == 0) return SendClientMessage(playerid,-1,"*"COL_RED" You are not spectating anyone.");
        TogglePlayerSpectating(playerid, 0);
        for (new i = 0; i < 13; i++)
        {
            GivePlayerWeapon(playerid, weapons[i][0], weapons[i][1]);
        }
    }
    else {
    SendClientMessage(playerid,-1,"*"COL_RED" You do not have the right admin permissions for this command!");
}
	return 1;
}

CMD:gotop(playerid,params[])
{
    if(pInfo[playerid][pAdminLevel] >= 6)
    {
		new targetid;
		if(sscanf(params, "u", targetid)) SendClientMessage(playerid,-1,""chat" /gotop [playerid]");
		if(!IsPlayerConnected(targetid)) return SendClientMessage(playerid,-1,""chat" Player is not online");

		new Float:x,Float:y,Float:z;
		GetPlayerPos(targetid,Float:x,Float:y,Float:z);
        SetPlayerPos_Allow(playerid, Float:x, Float:y, Float:z);
	}
	else {
		SendClientMessage(playerid,-1,"*"COL_RED" You do not have the right admin permissions for this command!");
	}
	return 1;
}

CMD:sethumanity(playerid,params[])
{
	if(pInfo[playerid][pAdminLevel] >= 5)
	{
	    new targetid,humanity,string[128];
	    if(sscanf(params, "ui", targetid,humanity)) return SendClientMessage(playerid,-1,""chat" /sethumanity [id] [humanity]");
   		if(!IsPlayerConnected(targetid)) return SendClientMessage(playerid,-1,""chat" Player is not online");

		format(string,sizeof(string),"*"COL_RED" %s %s has set player %s humanity to %i", GetAdminName(playerid),PlayerName(playerid),PlayerName(targetid),humanity);
		SendMessageToAllAdmins(string,-1);

		format(string,sizeof(string),"*"COL_RED" %s %s has set your humanity to %i",GetAdminName(playerid), PlayerName(playerid), humanity);
		SendClientMessage(targetid,-1,string);

		pInfo[targetid][Humanity] = humanity;
	}
	else {
		SendClientMessage(playerid,-1,"*"COL_RED" You do not have the right admin permissions for this command!");
	}
	return 1;
}

CMD:mute(playerid,params[])
{
	if(pInfo[playerid][pAdminLevel] >= 1)
	{
	    new targetid,reason[105],string[128];
	    if(sscanf(params, "us[105]", targetid,reason)) return SendClientMessage(playerid,-1,""chat" /mute [playerid] [reason]");
   		if(!IsPlayerConnected(targetid)) return SendClientMessage(playerid,-1,""chat" Player is not online");

		pInfo[targetid][IsPlayerMuted] = 1;

		format(string,sizeof(string),"*"COL_RED" %s %s muted %s [Reason: %s]", GetAdminName(playerid),PlayerName(playerid),PlayerName(targetid),reason);
		SendMessageToAllAdmins(string,-1);

		format(string,sizeof(string),"*"COL_RED" %s %s muted you for [Reason %s]",GetAdminName(playerid), PlayerName(playerid),reason);
		SendClientMessage(targetid,-1,string);
	}
	else {
		SendClientMessage(playerid,-1,"*"COL_RED" You do not have the right admin permissions for this command!");
	}
	return 1;
}

CMD:unmute(playerid,params[])
{
	if(pInfo[playerid][pAdminLevel] >= 1)
	{
	    new targetid,string[128];
	    if(sscanf(params, "u", targetid)) return SendClientMessage(playerid,-1,""chat" /unmute [playerid]");
   		if(!IsPlayerConnected(targetid)) return SendClientMessage(playerid,-1,""chat" Player is not online");

		if(pInfo[targetid][IsPlayerMuted] == 1)
		{
			format(string,sizeof(string),"*"COL_RED" %s %s unmuted you",GetAdminName(playerid),PlayerName(playerid));
			SendClientMessage(targetid,-1,string);
			format(string,sizeof(string),"*"COL_RED" You unmuted %s",PlayerName(targetid));
			SendClientMessage(playerid,-1,string);
			pInfo[targetid][IsPlayerMuted] = 0;
		}
		else
		{
		    SendClientMessage(playerid,-1,"*"COL_RED" Player isn't muted");
		}
	}
	else {
		SendClientMessage(playerid,-1,"*"COL_RED" You do not have the right admin permissions for this command!");
	}
	return 1;
}

CMD:respawnallcars(playerid,params[])
{
	if(pInfo[playerid][pAdminLevel] >= 5)
	{
		for(new i=0;i<MAX_VEHICLES;i++)
		{
	        if(IsVehicleOccupied(i) == 0)
			{
	            SetVehicleToRespawn(i);
            	vInfo[i][vehicleFuel] = 0;
				vInfo[i][vehicleEngine] = random(1);
				vInfo[i][vehicleTires] = random(4);
				SetVehicleHealth(i,800.0);
	        }
	    }

		new str[256];
		format(str,sizeof(str),""chat""COL_LGREEN" %s %s have respawned all unoccupied vehicles!",GetAdminName(playerid),PlayerName(playerid));
		SendMessageToAllAdmins(str,-1);
	}
	else {
		SendClientMessage(playerid,-1,""chat""COL_RED" You do not meet the requirements of the admin level");
	}
	return 1;
}

CMD:respawncars(playerid,params[])
{
	if(pInfo[playerid][pAdminLevel] >= 4)
	{
		new Float:range;
		if(sscanf(params, "f", range)) return SendClientMessage(playerid,-1,""chat" /respawncars [range]");

		for(new i=0;i<MAX_VEHICLES;i++)
		{
		    if(IsPlayerNearVehicle(playerid, i, range))
		    {
		        if(IsVehicleOccupied(i) == 0)
				{
		            SetVehicleToRespawn(i);
	            	vInfo[i][vehicleFuel] = 0;
					vInfo[i][vehicleEngine] = 0;
					vInfo[i][vehicleTires] = 0;
					SetVehicleHealth(i,800.0);
				}
			}
	    }

		new str[256];
		format(str,sizeof(str),""chat""COL_LGREEN" %s %s have respawned all unoccupied vehicles in range of %.2f!",GetAdminName(playerid),PlayerName(playerid),range);
		SendMessageToAllAdmins(str,-1);
	}
	else {
		SendClientMessage(playerid,-1,""chat""COL_RED" You do not meet the requirements of the admin level");
	}
	return 1;
}

CMD:kick(playerid,params[])
{
    if(pInfo[playerid][pAdminLevel] >= 1)
    {
		new targetid,reason[105],string[180];
		if(sscanf(params, "us[105]", targetid,reason)) return SendClientMessage(playerid,-1,""chat" /kick [playerid] [reason]");
		if(!IsPlayerConnected(targetid)) return SendClientMessage(playerid,-1,""chat" Player is not online");

		if(!IsPlayerNPC(targetid))
		{
			format(string, sizeof(string), "*"COL_RED" %s %s has kicked %s"COL_WHITE" [Reason: %s]",GetAdminName(playerid),PlayerName(playerid),PlayerName(targetid),reason);
			SendMessageToAllAdmins(string,-1);
			Kick(targetid);
		}
		else return SendClientMessage(playerid,-1,"*"COL_RED" You cannot kick an NPC, this has been logged and sent to the server emergency log list!");
	}
	else {
		SendClientMessage(playerid,-1,"*"COL_RED" You do not have the right admin permissions for this command!");
	}
	return 1;
}

CMD:clearanim(playerid,params[])
{
    if(pInfo[playerid][pAdminLevel] >= 1)
    {
		new targetid,reason[105],string[180];
		if(sscanf(params, "us[105]", targetid,reason)) return SendClientMessage(playerid,-1,""chat" /clearanim [playerid] [reason]");
		if(!IsPlayerConnected(targetid)) return SendClientMessage(playerid,-1,""chat" Player is not online");

		format(string, sizeof(string), "*"COL_RED" %s %s has cleared %s animations"COL_WHITE" [Reason: %s]",GetAdminName(playerid),PlayerName(playerid),PlayerName(targetid),reason);
		SendClientMessageToAll(-1,string);

		ClearAnimations(targetid);
	}
	else {
		SendClientMessage(playerid,-1,"*"COL_RED" You do not have the right admin permissions for this command!");
	}
	return 1;
}

task TimeOnServer[1000]()
{
	foreach(Player, i)
	{
		if(pInfo[i][pLogged] == 1)
 		{
   			if(pInfo[i][IsPlayerSpawned] == 1)
      		{
				pInfo[i][pSec] ++;
				if(pInfo[i][pSec] >= 60)
			 	{
			  		pInfo[i][pMin]++;
			    	pInfo[i][pSec]=0;

			    }
				if(pInfo[i][pMin] >= 60)
			 	{
			  		pInfo[i][pMin]=0;
			    	pInfo[i][pHour]++;
					SetPlayerScore(i,pInfo[i][pHour]);
			    }
			}
		}
	}
    return 1;
}

stock GetHelperName(playerid)
{
	new helpername[128];
	switch(pInfo[playerid][Helper])
	{
		case 0: helpername = "Not Helper";
		case 1: helpername = "Helper";
	}
	return helpername;
}
stock PlayerName(playerid)
{
	new ppName[24];
	GetPlayerName(playerid, ppName, 24);
 	return ppName;
}

stock SaveStats(playerid)
{
	new Float:x,Float:y,Float:z;
	GetPlayerPos(playerid,Float:x,Float:y,Float:z);

	if(isPlayerInMenu[playerid] == 0)
	{
		pInfo[playerid][pX] = x;
		pInfo[playerid][pY] = y;
		pInfo[playerid][pZ] = z;
	}

	GetPlayerWeaponData(playerid, 1, pInfo[playerid][pWeap1], pInfo[playerid][pAmmo1]);
	GetPlayerWeaponData(playerid, 2, pInfo[playerid][pWeap2], pInfo[playerid][pAmmo2]);
	GetPlayerWeaponData(playerid, 3, pInfo[playerid][pWeap3], pInfo[playerid][pAmmo3]);
	GetPlayerWeaponData(playerid, 4, pInfo[playerid][pWeap4], pInfo[playerid][pAmmo4]);
	GetPlayerWeaponData(playerid, 5, pInfo[playerid][pWeap5], pInfo[playerid][pAmmo5]);
	GetPlayerWeaponData(playerid, 6, pInfo[playerid][pWeap6], pInfo[playerid][pAmmo6]);
	GetPlayerWeaponData(playerid, 7, pInfo[playerid][pWeap7], pInfo[playerid][pAmmo7]);
	GetPlayerWeaponData(playerid, 8, pInfo[playerid][pWeap8], pInfo[playerid][pAmmo8]);
	GetPlayerWeaponData(playerid, 9, pInfo[playerid][pWeap9], pInfo[playerid][pAmmo9]);

	new Query[1100];
	strcat(Query,"UPDATE `users` SET `Headshots` = '%i', `Murders` = '%i', `BanditsKilled` = '%i', `ZombiesKilled` = '%i', `Backpack` = '%i', `BackpackSlots` = '%i', `BackpackSlotsUsed` = '%i', `pAdminLevel` = '%i',");
	strcat(Query,"`pPremium` = '%i', `pX` = '%f', `pY` = '%f', `pZ` = '%f', `pWeap1` = '%i', `pAmmo1` = '%i', `pWeap2` = '%i', `pAmmo2` = '%i', `pWeap3` = '%i', `pAmmo3` = '%i', `pWeap4` = '%i', `pAmmo4` = '%i',");
	strcat(Query,"`pWeap5` = '%i', `pAmmo5` = '%i', `pWeap6` = '%i', `pAmmo6` = '%i', `pWeap7` = '%i', `pAmmo7` = '%i', `pWeap8` = '%i', `pAmmo8` = '%i', `pWeap9` = '%i', `pAmmo9` = '%i', `pHour` = '%i', `pMin` = '%i', `pSec` = '%i',");
	strcat(Query,"`pBlood` = '%i', `pThrist` = '%i', `pHunger` = '%i', `Humanity` = '%i', `pFirstSpawn` = '%i', `pAliveTime` = '%i', `pIsMapOpened` = '%i', `pSkin` = '%i',");
	strcat(Query,"`Helper` = '%i', `IsPlayerBleeding` = '%i', `IsPlayerLegBroken` = '%i', `pAmbientEnable` = '%i', `DefaultGender` = '%i' WHERE `Username` = '%s'");
	format(Query,sizeof(Query),Query,pInfo[playerid][Headshots],
	pInfo[playerid][Murders],
	pInfo[playerid][BanditsKilled],
	pInfo[playerid][ZombiesKilled],
	pInfo[playerid][Backpack],
	pInfo[playerid][BackpackSlots],
	pInfo[playerid][BackpackSlotsUsed],
	pInfo[playerid][pAdminLevel],
	pInfo[playerid][pPremium],
	pInfo[playerid][pX],
	pInfo[playerid][pY],
	pInfo[playerid][pZ],
	pInfo[playerid][pWeap1],
	pInfo[playerid][pAmmo1],
	pInfo[playerid][pWeap2],
	pInfo[playerid][pAmmo2],
	pInfo[playerid][pWeap3],
	pInfo[playerid][pAmmo3],
	pInfo[playerid][pWeap4],
	pInfo[playerid][pAmmo4],
	pInfo[playerid][pWeap5],
	pInfo[playerid][pAmmo5],
	pInfo[playerid][pWeap6],
	pInfo[playerid][pAmmo6],
	pInfo[playerid][pWeap7],
	pInfo[playerid][pAmmo7],
	pInfo[playerid][pWeap8],
	pInfo[playerid][pAmmo8],
	pInfo[playerid][pWeap9],
	pInfo[playerid][pAmmo9],
	pInfo[playerid][pHour],
	pInfo[playerid][pMin],
	pInfo[playerid][pSec],
	pInfo[playerid][pBlood],
	pInfo[playerid][pThrist],
	pInfo[playerid][pHunger],
	pInfo[playerid][Humanity],
	pInfo[playerid][pFirstSpawn],
	pInfo[playerid][pAliveTime],
	pInfo[playerid][pIsMapOpened],
	GetPlayerSkin(playerid),
	pInfo[playerid][Helper],
	pInfo[playerid][IsPlayerBleeding],
	pInfo[playerid][IsPlayerLegBroken],
	pInfo[playerid][pAmbientEnable],
	pInfo[playerid][DefaultGender],
	PlayerName(playerid));
	mysql_tquery(handle, Query, "", "");
	SaveInventory(playerid);
	printf("%s", Query);
	return 1;
}

stock CheckVersion(playerid)
{
	GetPlayerName(playerid, jNames[playerid], MAX_PLAYER_NAME);
	GetPlayerIp(playerid, jIP[playerid], MAX_PLAYER_IP);
	jBanCheck(playerid);
	return 1;
}

stock GivePlayerWeaponEx(playerid,weaponid,ammo)
{
    PlayerWeapons[playerid][weaponid]=true;
    GivePlayerWeapon(playerid,weaponid,ammo);
}

stock KickPlayer(playerid, reason[])
{
	if(gotBanned[playerid] == 0)
    {
        gotBanned[playerid] = 1;
		new strkick[180];
		format(strkick, sizeof(strkick), ""chat" System has kicked %s (%i) for: %s", PlayerName(playerid), playerid, reason);
		SendClientMessageToAll(-1, strkick);
		KickEx(playerid);
	}
	return 1;
}

public Kick_Load(playerid)
{
    if(IsPlayerNPC(playerid)) return 1;
    if(!IsPlayerNPC(playerid))
    {
		Kick(playerid);
	}
	return 1;
}
public KickEx(playerid)
{
    SetTimerEx("Kick_Load", 1500, 0, "d", playerid);
    return 1;
}

stock ClearChat()
{
	for(new a = 0; a < 20; a++) SendClientMessageToAll(-1, " ");
	return 1;
}

stock ResetVars(playerid)
{
    pInfo[playerid][pTentCreated] = 0;
	IsSpecing[playerid] = 0;
    gotBanned[playerid] = 0;
    globalChat[playerid] = 0;
    giveWeaponAllow[playerid] = 1;
	pInfo[playerid][Username] = 0;
	pInfo[playerid][Password] = 0;
	pInfo[playerid][Headshots] = 0;
	pInfo[playerid][Murders] = 0;
	pInfo[playerid][BanditsKilled] = 0;
	pInfo[playerid][ZombiesKilled] = 0;
	pInfo[playerid][Backpack] = 0;
	pInfo[playerid][BackpackSlots] = 0;
	pInfo[playerid][BackpackSlotsUsed] = 0;
	pInfo[playerid][pAdminLevel] = 0;
	pInfo[playerid][pPremium] = 0;
	pInfo[playerid][pX] = 0.0;
	pInfo[playerid][pY] = 0.0;
	pInfo[playerid][pZ] = 0.0;
	pInfo[playerid][pWeap1] = 0;
	pInfo[playerid][pAmmo1] = 0;
	pInfo[playerid][pWeap2] = 0;
	pInfo[playerid][pAmmo2] = 0;
	pInfo[playerid][pWeap3] = 0;
	pInfo[playerid][pAmmo3] = 0;
	pInfo[playerid][pWeap4] = 0;
	pInfo[playerid][pAmmo4] = 0;
	pInfo[playerid][pWeap5] = 0;
	pInfo[playerid][pAmmo5] = 0;
	pInfo[playerid][pWeap6] = 0;
	pInfo[playerid][pAmmo6] = 0;
	pInfo[playerid][pWeap7] = 0;
	pInfo[playerid][pAmmo7] = 0;
	pInfo[playerid][pWeap8] = 0;
	pInfo[playerid][pAmmo8] = 0;
	pInfo[playerid][pWeap9] = 0;
	pInfo[playerid][pAmmo9] = 0;
	pInfo[playerid][pHour] = 0;
	pInfo[playerid][pMin] = 0;
	pInfo[playerid][pSec] = 0;
	pInfo[playerid][Helper] = 0;
	pInfo[playerid][pBlood] = 0;
	pInfo[playerid][pThrist] = 0;
	pInfo[playerid][pHunger] = 0;
	pInfo[playerid][Humanity] = 0;
	pInfo[playerid][pFirstSpawn] = 0;
	pInfo[playerid][pIsMapOpened] = 0;
	pInfo[playerid][IsPlayerBleeding] = 0;
	pInfo[playerid][pLogged] = 0;
	pInfo[playerid][pInfection] = 0;
	pInfo[playerid][IsPlayerLegBroken] = 0;
	pInfo[playerid][IsPlayerBandit] = 0;
	pInfo[playerid][IsPlayerHero] = 0;
	pInfo[playerid][IsPlayerDrunk] = 0;
	pInfo[playerid][IsPlayerMakingNoise] = 0;
	pInfo[playerid][IsPlayerSpawned] = 0;
	pInfo[playerid][pAliveTime] = 0;
	pInfo[playerid][pProne] = 0;
	pInfo[playerid][pTemp] = 100.0;
	pInfo[playerid][pSpamDrop] = 0;
	pInfo[playerid][pGroupSpam] = 0;
	pInfo[playerid][pSaveSpam] = 0;
	pInfo[playerid][pProneSpam] = 0;
	pInfo[playerid][pSpamAsk] = 0;
	pInfo[playerid][pFade] = 0;
	pInfo[playerid][pAirbreakWarning] = 0;
	pInfo[playerid][pCleoFlyWarning] = 0;
	pInfo[playerid][pSkin] = 0;
	TeleportAllowed[playerid] = 0;
	pInfo[playerid][FirstPerson] = 0;
	pInfo[playerid][pStorageLink] = 0;
	pInfo[playerid][pTentLink] = 0;
	pInfo[playerid][pRadioFreq] = 60.0;
	pInfo[playerid][IsPlayerInGroup] = 0;
	pInfo[playerid][IsPlayerCleoFly] = 0;
	pInfo[playerid][IsPlayerInGroupID] = 0;
 	IsSpecing[playerid] = 0;
	KillTimer(pInfo[playerid][Bleeding]);
	KillTimer(pInfo[playerid][IsPlayerDrunkTimer]);
	PlayerTextDrawHide(playerid, LegBroken[playerid]);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_PISTOL, 1);
	player_Handsup[playerid] = 0;
	return 1;
}

stock ClearChatPlayer(playerid)
{
	for(new a = 0; a < 20; a++) SendClientMessage(playerid,-1, " ");
	return 1;
}

stock UpdateAnnouncement(text[])
{
	new str[256];
	format(str,sizeof(str),"%s",text);
	TextDrawSetString(Announcement,str);
	TextDrawShowForAll(Announcement);
	SetTimer("HideAnnouncement", 6000, false);
    return 1;
}

function HideAnnouncement() return TextDrawHideForAll(Announcement);

stock DeleteTDS()
{
	TextDrawHideForAll(DebugBox);
	TextDrawDestroy(DebugBox);
	TextDrawHideForAll(DebugText);
	TextDrawDestroy(DebugText);
	TextDrawHideForAll(Announcement);
	TextDrawDestroy(Announcement);
	TextDrawHideForAll(DayZSA_Web);
	TextDrawDestroy(DayZSA_Web);
	GangZoneDestroy(BlockMap);
	return 1;
}

stock FadePlayerScreen(playerid)
{
	if(ScreenStatus[playerid] == 0)
    {
        KillTimer( FadeTDTimer [ playerid ] );
        ScreenStatus [ playerid ] = 1;
        TextDrawShowForPlayer( playerid, WholeScreen );
        FadeTDTimer [ playerid ] = SetTimerEx( "FadeTextdraw", 50, true, "i", playerid );
    }
	return 1;
}

function FadeTextdraw ( playerid )
{
	switch( ScreenStatus [ playerid ] )
	{
		case 1:
		{
			TextDrawBoxColor( WholeScreen, 0x000000EE );
		}
		case 2:
		{
			TextDrawBoxColor( WholeScreen, 0x000000DD );
		}
		case 3:
		{
			TextDrawBoxColor( WholeScreen, 0x000000CC );
		}
		case 4:
		{
			TextDrawBoxColor( WholeScreen, 0x000000BB );
		}
		case 5:
		{
			TextDrawBoxColor( WholeScreen, 0x000000AA );
		}
		case 6:
		{
			TextDrawBoxColor( WholeScreen, 0x00000099 );
		}
		case 7:
		{
			TextDrawBoxColor( WholeScreen, 0x00000088 );
		}
		case 8:
		{
			TextDrawBoxColor( WholeScreen, 0x00000077 );
		}
		case 9:
		{
			TextDrawBoxColor( WholeScreen, 0x00000066 );
		}
		case 10:
		{
			TextDrawBoxColor( WholeScreen, 0x00000055 );
		}
		case 11:
		{
			TextDrawBoxColor( WholeScreen, 0x00000044 );
		}
		case 12:
		{
			TextDrawBoxColor( WholeScreen, 0x00000033 );
		}
		case 13:
		{
			TextDrawBoxColor( WholeScreen, 0x00000022 );
		}
		case 14:
		{
			TextDrawBoxColor( WholeScreen, 0x00000011 );
		}
		case 15:
		{
			TextDrawBoxColor( WholeScreen, 0x00000000 );
			KillTimer( FadeTDTimer [ playerid ] );
			TextDrawHideForPlayer( playerid, WholeScreen );
			ScreenStatus [ playerid ] = 0;
			return true;
		}
	}

	TextDrawHideForPlayer( playerid, WholeScreen );
	TextDrawShowForPlayer( playerid, WholeScreen );
	return ScreenStatus [ playerid ] ++;
}

stock CreatePlayerTD(playerid)
{
    if(!IsPlayerNPC(playerid))
	{
		WebsiteLogo[playerid] = CreatePlayerTextDraw(playerid,509.000000, 4.000000, ""Web" / "Version"");
		PlayerTextDrawBackgroundColor(playerid,WebsiteLogo[playerid], 255);
		PlayerTextDrawFont(playerid,WebsiteLogo[playerid], 2);
		PlayerTextDrawLetterSize(playerid,WebsiteLogo[playerid], 0.200000, 0.799999);
		PlayerTextDrawColor(playerid,WebsiteLogo[playerid], -16776961);
		PlayerTextDrawSetOutline(playerid,WebsiteLogo[playerid], 1);
		PlayerTextDrawSetProportional(playerid,WebsiteLogo[playerid], 1);
		PlayerTextDrawSetSelectable(playerid,WebsiteLogo[playerid], 0);

		MenuLogo[playerid] = CreatePlayerTextDraw(playerid,236.000000, 158.000000, "Project DayZ SA:MP");
		PlayerTextDrawBackgroundColor(playerid,MenuLogo[playerid], 255);
		PlayerTextDrawFont(playerid,MenuLogo[playerid], 1);
		PlayerTextDrawLetterSize(playerid,MenuLogo[playerid], 0.489999, 2.399999);
		PlayerTextDrawColor(playerid,MenuLogo[playerid], 16711935);
		PlayerTextDrawSetOutline(playerid,MenuLogo[playerid], 1);
		PlayerTextDrawSetProportional(playerid,MenuLogo[playerid], 1);
		PlayerTextDrawSetSelectable(playerid,MenuLogo[playerid], 0);

		MenuPlay[playerid] = CreatePlayerTextDraw(playerid,251.000000, 187.000000, "     CONTINUE YOUR STORY");
		PlayerTextDrawBackgroundColor(playerid,MenuPlay[playerid], 255);
		PlayerTextDrawFont(playerid,MenuPlay[playerid], 2);
		PlayerTextDrawLetterSize(playerid,MenuPlay[playerid], 0.229999, 1.100000);
		PlayerTextDrawColor(playerid,MenuPlay[playerid], -1);
		PlayerTextDrawSetOutline(playerid,MenuPlay[playerid], 1);
		PlayerTextDrawSetProportional(playerid,MenuPlay[playerid], 1);
		PlayerTextDrawUseBox(playerid,MenuPlay[playerid], 1);
		PlayerTextDrawBoxColor(playerid,MenuPlay[playerid], 3932250);
		PlayerTextDrawTextSize(playerid,MenuPlay[playerid], 389.000000, 10.0);
		PlayerTextDrawSetSelectable(playerid,MenuPlay[playerid], 1);

		MenuBG[playerid] = CreatePlayerTextDraw(playerid,258.000000, 184.000000, "~n~");
		PlayerTextDrawBackgroundColor(playerid,MenuBG[playerid], 255);
		PlayerTextDrawFont(playerid,MenuBG[playerid], 1);
		PlayerTextDrawLetterSize(playerid,MenuBG[playerid], 0.200000, 8.699995);
		PlayerTextDrawColor(playerid,MenuBG[playerid], -1);
		PlayerTextDrawSetOutline(playerid,MenuBG[playerid], 0);
		PlayerTextDrawSetProportional(playerid,MenuBG[playerid], 1);
		PlayerTextDrawSetShadow(playerid,MenuBG[playerid], 1);
		PlayerTextDrawUseBox(playerid,MenuBG[playerid], 1);
		PlayerTextDrawBoxColor(playerid,MenuBG[playerid], 110);
		PlayerTextDrawTextSize(playerid,MenuBG[playerid], 383.000000, 40.000000);
		PlayerTextDrawSetSelectable(playerid,MenuBG[playerid], 0);

		MenuOptions[playerid] = CreatePlayerTextDraw(playerid,251.000000, 205.000000, "           CLIENT OPTIONS");
		PlayerTextDrawBackgroundColor(playerid,MenuOptions[playerid], 255);
		PlayerTextDrawFont(playerid,MenuOptions[playerid], 2);
		PlayerTextDrawLetterSize(playerid,MenuOptions[playerid], 0.229999, 1.100000);
		PlayerTextDrawColor(playerid,MenuOptions[playerid], -1);
		PlayerTextDrawSetOutline(playerid,MenuOptions[playerid], 1);
		PlayerTextDrawSetProportional(playerid,MenuOptions[playerid], 1);
		PlayerTextDrawUseBox(playerid,MenuOptions[playerid], 1);
		PlayerTextDrawBoxColor(playerid,MenuOptions[playerid], 3932250);
		PlayerTextDrawTextSize(playerid,MenuOptions[playerid], 389.000000, 10.0);
		PlayerTextDrawSetSelectable(playerid,MenuOptions[playerid], 1);

		MenuPremium[playerid] = CreatePlayerTextDraw(playerid,251.000000, 224.000000, "        PREMIUM PACKAGES");
		PlayerTextDrawBackgroundColor(playerid,MenuPremium[playerid], 255);
		PlayerTextDrawFont(playerid,MenuPremium[playerid], 2);
		PlayerTextDrawLetterSize(playerid,MenuPremium[playerid], 0.229999, 1.100000);
		PlayerTextDrawColor(playerid,MenuPremium[playerid], -1);
		PlayerTextDrawSetOutline(playerid,MenuPremium[playerid], 1);
		PlayerTextDrawSetProportional(playerid,MenuPremium[playerid], 1);
		PlayerTextDrawUseBox(playerid,MenuPremium[playerid], 1);
		PlayerTextDrawBoxColor(playerid,MenuPremium[playerid], 3932250);
		PlayerTextDrawTextSize(playerid,MenuPremium[playerid], 389.000000, 10.0);
		PlayerTextDrawSetSelectable(playerid,MenuPremium[playerid], 1);

		GeneralInfo[playerid] = CreatePlayerTextDraw(playerid,251.000000, 243.000000, "     GENERAL INFORMATION");
		PlayerTextDrawBackgroundColor(playerid,GeneralInfo[playerid], 255);
		PlayerTextDrawFont(playerid,GeneralInfo[playerid], 2);
		PlayerTextDrawLetterSize(playerid,GeneralInfo[playerid], 0.229999, 1.100000);
		PlayerTextDrawColor(playerid,GeneralInfo[playerid], -1);
		PlayerTextDrawSetOutline(playerid,GeneralInfo[playerid], 1);
		PlayerTextDrawSetProportional(playerid,GeneralInfo[playerid], 1);
		PlayerTextDrawUseBox(playerid,GeneralInfo[playerid], 1);
		PlayerTextDrawBoxColor(playerid,GeneralInfo[playerid], 3932250);
		PlayerTextDrawTextSize(playerid,GeneralInfo[playerid], 389.000000, 10.0);
		PlayerTextDrawSetSelectable(playerid,GeneralInfo[playerid], 1);

		MenuCredits[playerid] = CreatePlayerTextDraw(playerid,320.000000, 269.000000, "~w~Created by~g~ [pGA]AldenJ~w~~n~www.pgagaming.net to download!");
		PlayerTextDrawAlignment(playerid,MenuCredits[playerid], 2);
		PlayerTextDrawBackgroundColor(playerid,MenuCredits[playerid], 255);
		PlayerTextDrawFont(playerid,MenuCredits[playerid], 1);
		PlayerTextDrawLetterSize(playerid,MenuCredits[playerid], 0.350000, 0.699999);
		PlayerTextDrawColor(playerid,MenuCredits[playerid], -1);
		PlayerTextDrawSetOutline(playerid,MenuCredits[playerid], 1);
		PlayerTextDrawSetProportional(playerid,MenuCredits[playerid], 1);
		PlayerTextDrawSetSelectable(playerid,MenuCredits[playerid], 0);

		MenuBlackLayer1[playerid] = CreatePlayerTextDraw(playerid,642.000000, 1.000000, "~n~");
		PlayerTextDrawBackgroundColor(playerid,MenuBlackLayer1[playerid], 255);
		PlayerTextDrawFont(playerid,MenuBlackLayer1[playerid], 1);
		PlayerTextDrawLetterSize(playerid,MenuBlackLayer1[playerid], 0.500000, 12.000000);
		PlayerTextDrawColor(playerid,MenuBlackLayer1[playerid], -1);
		PlayerTextDrawSetOutline(playerid,MenuBlackLayer1[playerid], 0);
		PlayerTextDrawSetProportional(playerid,MenuBlackLayer1[playerid], 1);
		PlayerTextDrawSetShadow(playerid,MenuBlackLayer1[playerid], 1);
		PlayerTextDrawUseBox(playerid,MenuBlackLayer1[playerid], 1);
		PlayerTextDrawBoxColor(playerid,MenuBlackLayer1[playerid], 255);
		PlayerTextDrawTextSize(playerid,MenuBlackLayer1[playerid], -10.000000, 40.000000);
		PlayerTextDrawSetSelectable(playerid,MenuBlackLayer1[playerid], 0);

		MenuBlackLayer2[playerid] = CreatePlayerTextDraw(playerid,642.000000, 341.000000, "~n~");
		PlayerTextDrawBackgroundColor(playerid,MenuBlackLayer2[playerid], 255);
		PlayerTextDrawFont(playerid,MenuBlackLayer2[playerid], 1);
		PlayerTextDrawLetterSize(playerid,MenuBlackLayer2[playerid], 0.500000, 12.000000);
		PlayerTextDrawColor(playerid,MenuBlackLayer2[playerid], -1);
		PlayerTextDrawSetOutline(playerid,MenuBlackLayer2[playerid], 0);
		PlayerTextDrawSetProportional(playerid,MenuBlackLayer2[playerid], 1);
		PlayerTextDrawSetShadow(playerid,MenuBlackLayer2[playerid], 1);
		PlayerTextDrawUseBox(playerid,MenuBlackLayer2[playerid], 1);
		PlayerTextDrawBoxColor(playerid,MenuBlackLayer2[playerid], 255);
		PlayerTextDrawTextSize(playerid,MenuBlackLayer2[playerid], -10.000000, 40.000000);
		PlayerTextDrawSetSelectable(playerid,MenuBlackLayer2[playerid], 0);

		PlayerIntroBox[playerid] = CreatePlayerTextDraw(playerid,-39.000000, 1.000000, "~n~");
		PlayerTextDrawBackgroundColor(playerid,PlayerIntroBox[playerid], 255);
		PlayerTextDrawFont(playerid,PlayerIntroBox[playerid], 1);
		PlayerTextDrawLetterSize(playerid,PlayerIntroBox[playerid], 0.500000, 50.000000);
		PlayerTextDrawColor(playerid,PlayerIntroBox[playerid], -1);
		PlayerTextDrawSetOutline(playerid,PlayerIntroBox[playerid], 0);
		PlayerTextDrawSetProportional(playerid,PlayerIntroBox[playerid], 1);
		PlayerTextDrawSetShadow(playerid,PlayerIntroBox[playerid], 1);
		PlayerTextDrawUseBox(playerid,PlayerIntroBox[playerid], 1);
		PlayerTextDrawBoxColor(playerid,PlayerIntroBox[playerid], 255);
		PlayerTextDrawTextSize(playerid,PlayerIntroBox[playerid], 647.000000, 10.000000);
		PlayerTextDrawSetSelectable(playerid,PlayerIntroBox[playerid], 0);

		PlayerIntroVersion[playerid] = CreatePlayerTextDraw(playerid,389.000000, 50.000000, "DayZSA "Version"");
		PlayerTextDrawAlignment(playerid,PlayerIntroVersion[playerid], 2);
		PlayerTextDrawBackgroundColor(playerid,PlayerIntroVersion[playerid], 255);
		PlayerTextDrawFont(playerid,PlayerIntroVersion[playerid], 1);
		PlayerTextDrawLetterSize(playerid,PlayerIntroVersion[playerid], 0.899999, 6.000000);
		PlayerTextDrawColor(playerid,PlayerIntroVersion[playerid], -1);
		PlayerTextDrawSetOutline(playerid,PlayerIntroVersion[playerid], 1);
		PlayerTextDrawSetProportional(playerid,PlayerIntroVersion[playerid], 1);
		PlayerTextDrawSetSelectable(playerid,PlayerIntroVersion[playerid], 0);

		PlayerIntroNote[playerid] = CreatePlayerTextDraw(playerid,353.000000, 109.000000, "Welcome AldenJ~n~Please login");
		PlayerTextDrawAlignment(playerid,PlayerIntroNote[playerid], 2);
		PlayerTextDrawBackgroundColor(playerid,PlayerIntroNote[playerid], 255);
		PlayerTextDrawFont(playerid,PlayerIntroNote[playerid], 1);
		PlayerTextDrawLetterSize(playerid,PlayerIntroNote[playerid], 0.500000, 1.000000);
		PlayerTextDrawColor(playerid,PlayerIntroNote[playerid], -65281);
		PlayerTextDrawSetOutline(playerid,PlayerIntroNote[playerid], 1);
		PlayerTextDrawSetProportional(playerid,PlayerIntroNote[playerid], 1);
		PlayerTextDrawSetSelectable(playerid,PlayerIntroNote[playerid], 0);

	    PlayerFade[playerid] = CreatePlayerTextDraw(playerid,0.000000, 2.000000, "~n~");
		PlayerTextDrawBackgroundColor(playerid,PlayerFade[playerid], 255);
		PlayerTextDrawFont(playerid,PlayerFade[playerid], 1);
		PlayerTextDrawLetterSize(playerid,PlayerFade[playerid], 0.500000, 50.000000);
		PlayerTextDrawColor(playerid,PlayerFade[playerid], -1);
		PlayerTextDrawSetOutline(playerid,PlayerFade[playerid], 0);
		PlayerTextDrawSetProportional(playerid,PlayerFade[playerid], 1);
		PlayerTextDrawSetShadow(playerid,PlayerFade[playerid], 1);
		PlayerTextDrawUseBox(playerid,PlayerFade[playerid], 1);
		PlayerTextDrawBoxColor(playerid,PlayerFade[playerid], 135);
		PlayerTextDrawTextSize(playerid,PlayerFade[playerid], 641.000000, -2.000000);
		PlayerTextDrawSetSelectable(playerid,PlayerFade[playerid], 0);

		Map[playerid] = CreatePlayerTextDraw(playerid,89.000000, 13.000000, "samaps:map");
		PlayerTextDrawBackgroundColor(playerid,Map[playerid], 255);
		PlayerTextDrawFont(playerid,Map[playerid], 4);
		PlayerTextDrawLetterSize(playerid,Map[playerid], 0.500000, 1.000000);
		PlayerTextDrawColor(playerid,Map[playerid], -1);
		PlayerTextDrawSetOutline(playerid,Map[playerid], 0);
		PlayerTextDrawSetProportional(playerid,Map[playerid], 1);
		PlayerTextDrawSetShadow(playerid,Map[playerid], 1);
		PlayerTextDrawUseBox(playerid,Map[playerid], 1);
		PlayerTextDrawBoxColor(playerid,Map[playerid], 255);
		PlayerTextDrawTextSize(playerid,Map[playerid], 470.000000, 410.000000);

		LegBroken[playerid] = CreatePlayerTextDraw(playerid,532.000000, 325.000000, "Broken Leg");
		PlayerTextDrawBackgroundColor(playerid,LegBroken[playerid], 255);
		PlayerTextDrawFont(playerid,LegBroken[playerid], 2);
		PlayerTextDrawLetterSize(playerid,LegBroken[playerid], 0.200000, 0.899999);
		PlayerTextDrawColor(playerid,LegBroken[playerid], -16776961);
		PlayerTextDrawSetOutline(playerid,LegBroken[playerid], 0);
		PlayerTextDrawSetProportional(playerid,LegBroken[playerid], 1);
		PlayerTextDrawSetShadow(playerid,LegBroken[playerid], 1);
		
		playerBandit[playerid] = CreatePlayerTextDraw(playerid,611.000000, 315.000000, "hud:radar_locosyndicate");
		PlayerTextDrawBackgroundColor(playerid,playerBandit[playerid], 255);
		PlayerTextDrawFont(playerid,playerBandit[playerid], 4);
		PlayerTextDrawLetterSize(playerid,playerBandit[playerid], 0.600000, 2.000000);
		PlayerTextDrawColor(playerid,playerBandit[playerid], 866792277);
		PlayerTextDrawSetOutline(playerid,playerBandit[playerid], 0);
		PlayerTextDrawSetProportional(playerid,playerBandit[playerid], 1);
		PlayerTextDrawSetShadow(playerid,playerBandit[playerid], 1);
		PlayerTextDrawUseBox(playerid,playerBandit[playerid], 1);
		PlayerTextDrawBoxColor(playerid,playerBandit[playerid], 5243060);
		PlayerTextDrawTextSize(playerid,playerBandit[playerid], 15.000000, 16.000000);
		PlayerTextDrawSetSelectable(playerid,playerBandit[playerid], 0);

		PlayerTemp[playerid] = CreatePlayerTextDraw(playerid,611.000000, 334.000000, "hud:radar_toreno");
		PlayerTextDrawBackgroundColor(playerid,PlayerTemp[playerid], 255);
		PlayerTextDrawFont(playerid,PlayerTemp[playerid], 4);
		PlayerTextDrawLetterSize(playerid,PlayerTemp[playerid], 0.600000, 2.000000);
		PlayerTextDrawColor(playerid,PlayerTemp[playerid], 866792277);
		PlayerTextDrawSetOutline(playerid,PlayerTemp[playerid], 0);
		PlayerTextDrawSetProportional(playerid,PlayerTemp[playerid], 1);
		PlayerTextDrawSetShadow(playerid,PlayerTemp[playerid], 1);
		PlayerTextDrawUseBox(playerid,PlayerTemp[playerid], 1);
		PlayerTextDrawBoxColor(playerid,PlayerTemp[playerid], 5243060);
		PlayerTextDrawTextSize(playerid,PlayerTemp[playerid], 15.000000, 16.000000);
		PlayerTextDrawSetSelectable(playerid,PlayerTemp[playerid], 0);

		/*PlayerTemp[playerid] = CreatePlayerTextDraw(playerid,606.000000, 330.000000, "temperature");
		PlayerTextDrawBackgroundColor(playerid,PlayerTemp[playerid], -256);
		PlayerTextDrawFont(playerid,PlayerTemp[playerid], 5);
		PlayerTextDrawLetterSize(playerid,PlayerTemp[playerid], 0.500000, 1.000000);
		PlayerTextDrawColor(playerid,PlayerTemp[playerid], 866792277);
		PlayerTextDrawSetOutline(playerid,PlayerTemp[playerid], 0);
		PlayerTextDrawSetProportional(playerid,PlayerTemp[playerid], 1);
		PlayerTextDrawSetShadow(playerid,PlayerTemp[playerid], 1);
		PlayerTextDrawUseBox(playerid,PlayerTemp[playerid], 1);
		PlayerTextDrawBoxColor(playerid,PlayerTemp[playerid], 16711935);
		PlayerTextDrawTextSize(playerid,PlayerTemp[playerid], 26.000000, 29.000000);
		PlayerTextDrawSetPreviewModel(playerid, PlayerTemp[playerid], 19131);
		PlayerTextDrawSetPreviewRot(playerid, PlayerTemp[playerid], -16.000000, 95.000000, -55.000000, 1.000000);
		PlayerTextDrawSetSelectable(playerid,PlayerTemp[playerid], 0);*/

		PlayerThirst[playerid] = CreatePlayerTextDraw(playerid,612.000000, 359.000000, "hud:radar_diner");
		PlayerTextDrawBackgroundColor(playerid,PlayerThirst[playerid], 255);
		PlayerTextDrawFont(playerid,PlayerThirst[playerid], 4);
		PlayerTextDrawLetterSize(playerid,PlayerThirst[playerid], 0.600000, 2.000000);
		PlayerTextDrawColor(playerid,PlayerThirst[playerid], 866792277);
		PlayerTextDrawSetOutline(playerid,PlayerThirst[playerid], 0);
		PlayerTextDrawSetProportional(playerid,PlayerThirst[playerid], 1);
		PlayerTextDrawSetShadow(playerid,PlayerThirst[playerid], 1);
		PlayerTextDrawUseBox(playerid,PlayerThirst[playerid], 1);
		PlayerTextDrawBoxColor(playerid,PlayerThirst[playerid], 5243060);
		PlayerTextDrawTextSize(playerid,PlayerThirst[playerid], 15.000000, 16.000000);
		PlayerTextDrawSetSelectable(playerid,PlayerThirst[playerid], 0);

		PlayerBlood[playerid] = CreatePlayerTextDraw(playerid,612.000000, 381.000000, "hud:radar_hostpital");
		PlayerTextDrawBackgroundColor(playerid,PlayerBlood[playerid], 255);
		PlayerTextDrawFont(playerid,PlayerBlood[playerid], 4);
		PlayerTextDrawLetterSize(playerid,PlayerBlood[playerid], 0.600000, 2.000000);
		PlayerTextDrawColor(playerid,PlayerBlood[playerid], 866792277);
		PlayerTextDrawSetOutline(playerid,PlayerBlood[playerid], 0);
		PlayerTextDrawSetProportional(playerid,PlayerBlood[playerid], 1);
		PlayerTextDrawSetShadow(playerid,PlayerBlood[playerid], 1);
		PlayerTextDrawUseBox(playerid,PlayerBlood[playerid], 1);
		PlayerTextDrawBoxColor(playerid,PlayerBlood[playerid], 5243060);
		PlayerTextDrawTextSize(playerid,PlayerBlood[playerid], 15.000000, 16.000000);
		PlayerTextDrawSetSelectable(playerid,PlayerBlood[playerid], 0);

		PlayerHunger[playerid] = CreatePlayerTextDraw(playerid,612.000000, 404.000000, "hud:radar_datefood");
		PlayerTextDrawBackgroundColor(playerid,PlayerHunger[playerid], 255);
		PlayerTextDrawFont(playerid,PlayerHunger[playerid], 4);
		PlayerTextDrawLetterSize(playerid,PlayerHunger[playerid], 0.600000, 2.000000);
		PlayerTextDrawColor(playerid,PlayerHunger[playerid], 866792277);
		PlayerTextDrawSetOutline(playerid,PlayerHunger[playerid], 0);
		PlayerTextDrawSetProportional(playerid,PlayerHunger[playerid], 1);
		PlayerTextDrawSetShadow(playerid,PlayerHunger[playerid], 1);
		PlayerTextDrawUseBox(playerid,PlayerHunger[playerid], 1);
		PlayerTextDrawBoxColor(playerid,PlayerHunger[playerid], 5243060);
		PlayerTextDrawTextSize(playerid,PlayerHunger[playerid], 15.000000, 16.000000);
		PlayerTextDrawSetSelectable(playerid,PlayerHunger[playerid], 0);
		
		PlayerVehicleName[playerid] = CreatePlayerTextDraw(playerid,54.000000, 238.000000, "Clover");
		PlayerTextDrawAlignment(playerid,PlayerVehicleName[playerid], 2);
		PlayerTextDrawBackgroundColor(playerid,PlayerVehicleName[playerid], 255);
		PlayerTextDrawFont(playerid,PlayerVehicleName[playerid], 1);
		PlayerTextDrawLetterSize(playerid,PlayerVehicleName[playerid], 0.460000, 0.899999);
		PlayerTextDrawColor(playerid,PlayerVehicleName[playerid], -1);
		PlayerTextDrawSetOutline(playerid,PlayerVehicleName[playerid], 1);
		PlayerTextDrawSetProportional(playerid,PlayerVehicleName[playerid], 1);
		PlayerTextDrawSetSelectable(playerid,PlayerVehicleName[playerid], 0);
		

		vehicleInfo[playerid] = CreatePlayerTextDraw(playerid,46.000000, 256.000000, "0 / 0~n~~n~0 / 0~n~~n~0 / 0~n~~n~22 KM/H");
		PlayerTextDrawAlignment(playerid,vehicleInfo[playerid], 2);
		PlayerTextDrawBackgroundColor(playerid,vehicleInfo[playerid], 255);
		PlayerTextDrawFont(playerid,vehicleInfo[playerid], 2);
		PlayerTextDrawLetterSize(playerid,vehicleInfo[playerid], 0.390000, 0.799998);
		PlayerTextDrawColor(playerid,vehicleInfo[playerid], -1);
		PlayerTextDrawSetOutline(playerid,vehicleInfo[playerid], 0);
		PlayerTextDrawSetProportional(playerid,vehicleInfo[playerid], 1);
		PlayerTextDrawSetShadow(playerid,vehicleInfo[playerid], 1);
		PlayerTextDrawSetSelectable(playerid,vehicleInfo[playerid], 0);

		
		EngineIcon[playerid] = CreatePlayerTextDraw(playerid,66.000000, 247.000000, "Engine");
		PlayerTextDrawBackgroundColor(playerid,EngineIcon[playerid], 0);
		PlayerTextDrawFont(playerid,EngineIcon[playerid], 5);
		PlayerTextDrawLetterSize(playerid,EngineIcon[playerid], 0.300000, 3.300000);
		PlayerTextDrawColor(playerid,EngineIcon[playerid], -1);
		PlayerTextDrawSetOutline(playerid,EngineIcon[playerid], 0);
		PlayerTextDrawSetProportional(playerid,EngineIcon[playerid], 1);
		PlayerTextDrawSetShadow(playerid,EngineIcon[playerid], 1);
		PlayerTextDrawUseBox(playerid,EngineIcon[playerid], 1);
		PlayerTextDrawBoxColor(playerid,EngineIcon[playerid], -16776961);
		PlayerTextDrawTextSize(playerid,EngineIcon[playerid], 23.000000, 22.000000);
		PlayerTextDrawSetPreviewModel(playerid, EngineIcon[playerid], 19917);
		PlayerTextDrawSetPreviewRot(playerid, EngineIcon[playerid], -16.000000, 0.000000, -55.000000, 1.000000);
		PlayerTextDrawSetSelectable(playerid,EngineIcon[playerid], 0);

		SpeedIcon[playerid] = CreatePlayerTextDraw(playerid,72.000000, 293.000000, "SpeedIcon");
		PlayerTextDrawBackgroundColor(playerid,SpeedIcon[playerid], 0);
		PlayerTextDrawFont(playerid,SpeedIcon[playerid], 5);
		PlayerTextDrawLetterSize(playerid,SpeedIcon[playerid], 0.319999, 3.300000);
		PlayerTextDrawColor(playerid,SpeedIcon[playerid], -1);
		PlayerTextDrawSetOutline(playerid,SpeedIcon[playerid], 0);
		PlayerTextDrawSetProportional(playerid,SpeedIcon[playerid], 1);
		PlayerTextDrawSetShadow(playerid,SpeedIcon[playerid], 1);
		PlayerTextDrawUseBox(playerid,SpeedIcon[playerid], 1);
		PlayerTextDrawBoxColor(playerid,SpeedIcon[playerid], -16776961);
		PlayerTextDrawTextSize(playerid,SpeedIcon[playerid], 38.000000, 21.000000);
		PlayerTextDrawSetPreviewModel(playerid, SpeedIcon[playerid], 471);
		PlayerTextDrawSetPreviewRot(playerid, SpeedIcon[playerid], -16.000000, 0.000000, -55.000000, 1.000000);
		PlayerTextDrawSetSelectable(playerid,SpeedIcon[playerid], 0);

		TireIcon[playerid] = CreatePlayerTextDraw(playerid,71.000000, 269.000000, "Tire");
		PlayerTextDrawBackgroundColor(playerid,TireIcon[playerid], 0);
		PlayerTextDrawFont(playerid,TireIcon[playerid], 5);
		PlayerTextDrawLetterSize(playerid,TireIcon[playerid], 0.319999, 3.300000);
		PlayerTextDrawColor(playerid,TireIcon[playerid], -1);
		PlayerTextDrawSetOutline(playerid,TireIcon[playerid], 0);
		PlayerTextDrawSetProportional(playerid,TireIcon[playerid], 1);
		PlayerTextDrawSetShadow(playerid,TireIcon[playerid], 1);
		PlayerTextDrawUseBox(playerid,TireIcon[playerid], 1);
		PlayerTextDrawBoxColor(playerid,TireIcon[playerid], -16776961);
		PlayerTextDrawTextSize(playerid,TireIcon[playerid], 15.000000, 11.000000);
		PlayerTextDrawSetPreviewModel(playerid, TireIcon[playerid], 1327);
		PlayerTextDrawSetPreviewRot(playerid, TireIcon[playerid], -16.000000, 0.000000, -55.000000, 1.000000);
		PlayerTextDrawSetSelectable(playerid,TireIcon[playerid], 0);

		FuelIcon[playerid] = CreatePlayerTextDraw(playerid,60.000000, 281.000000, "Fuel");
		PlayerTextDrawBackgroundColor(playerid,FuelIcon[playerid], 0);
		PlayerTextDrawFont(playerid,FuelIcon[playerid], 5);
		PlayerTextDrawLetterSize(playerid,FuelIcon[playerid], 0.319999, 3.300000);
		PlayerTextDrawColor(playerid,FuelIcon[playerid], -1);
		PlayerTextDrawSetOutline(playerid,FuelIcon[playerid], 0);
		PlayerTextDrawSetProportional(playerid,FuelIcon[playerid], 1);
		PlayerTextDrawSetShadow(playerid,FuelIcon[playerid], 1);
		PlayerTextDrawUseBox(playerid,FuelIcon[playerid], 1);
		PlayerTextDrawBoxColor(playerid,FuelIcon[playerid], -16776961);
		PlayerTextDrawTextSize(playerid,FuelIcon[playerid], 33.000000, 18.000000);
		PlayerTextDrawSetPreviewModel(playerid, FuelIcon[playerid], 1650);
		PlayerTextDrawSetPreviewRot(playerid, FuelIcon[playerid], -16.000000, 0.000000, -55.000000, 1.000000);
		PlayerTextDrawSetSelectable(playerid,FuelIcon[playerid], 0);

		HudBG_1[playerid] = CreatePlayerTextDraw(playerid,496.000000, 10.000000, "~n~");
		PlayerTextDrawBackgroundColor(playerid,HudBG_1[playerid], 255);
		PlayerTextDrawFont(playerid,HudBG_1[playerid], 1);
		PlayerTextDrawLetterSize(playerid,HudBG_1[playerid], 0.500000, 10.000000);
		PlayerTextDrawColor(playerid,HudBG_1[playerid], -1);
		PlayerTextDrawSetOutline(playerid,HudBG_1[playerid], 0);
		PlayerTextDrawSetProportional(playerid,HudBG_1[playerid], 1);
		PlayerTextDrawSetShadow(playerid,HudBG_1[playerid], 1);
		PlayerTextDrawUseBox(playerid,HudBG_1[playerid], 1);
		PlayerTextDrawBoxColor(playerid,HudBG_1[playerid], 1077159679);
		PlayerTextDrawTextSize(playerid,HudBG_1[playerid], 615.000000, 0.000000);
		PlayerTextDrawSetSelectable(playerid,HudBG_1[playerid], 0);

		DebugMonitor_Text[playerid] = CreatePlayerTextDraw(playerid,558.000000, 17.000000, "Debug Monitor");
		PlayerTextDrawAlignment(playerid,DebugMonitor_Text[playerid], 2);
		PlayerTextDrawBackgroundColor(playerid,DebugMonitor_Text[playerid], 255);
		PlayerTextDrawFont(playerid,DebugMonitor_Text[playerid], 2);
		PlayerTextDrawLetterSize(playerid,DebugMonitor_Text[playerid], 0.339999, 1.000000);
		PlayerTextDrawColor(playerid,DebugMonitor_Text[playerid], -16776961);
		PlayerTextDrawSetOutline(playerid,DebugMonitor_Text[playerid], 1);
		PlayerTextDrawSetProportional(playerid,DebugMonitor_Text[playerid], 1);
		PlayerTextDrawSetSelectable(playerid,DebugMonitor_Text[playerid], 0);

		DebugInfo[playerid]  = CreatePlayerTextDraw(playerid,554.000000, 29.000000, "Zombies Killed: %i~n~Headshots: %i~n~Murders: %i~n~Bandits Killed: %i~n~Blood: %i~n~Zombies: %i~n~Temperature: %0.2f F~n~Alive T");
		PlayerTextDrawAlignment(playerid,DebugInfo[playerid] , 2);
		PlayerTextDrawBackgroundColor(playerid,DebugInfo[playerid] , 255);
		PlayerTextDrawFont(playerid,DebugInfo[playerid] , 2);
		PlayerTextDrawLetterSize(playerid,DebugInfo[playerid] , 0.240000, 0.899999);
		PlayerTextDrawColor(playerid,DebugInfo[playerid] , -1);
		PlayerTextDrawSetOutline(playerid,DebugInfo[playerid] , 0);
		PlayerTextDrawSetProportional(playerid,DebugInfo[playerid] , 1);
		PlayerTextDrawSetShadow(playerid,DebugInfo[playerid] , 1);
		PlayerTextDrawSetSelectable(playerid,DebugInfo[playerid] , 0);

		Debug_GunIcon[playerid] = CreatePlayerTextDraw(playerid,491.000000, 110.000000, "hud:radar_emmetgun");
		PlayerTextDrawAlignment(playerid,Debug_GunIcon[playerid], 2);
		PlayerTextDrawBackgroundColor(playerid,Debug_GunIcon[playerid], 255);
		PlayerTextDrawFont(playerid,Debug_GunIcon[playerid], 4);
		PlayerTextDrawLetterSize(playerid,Debug_GunIcon[playerid], 0.339999, -1.100000);
		PlayerTextDrawColor(playerid,Debug_GunIcon[playerid], -1);
		PlayerTextDrawSetOutline(playerid,Debug_GunIcon[playerid], 0);
		PlayerTextDrawSetProportional(playerid,Debug_GunIcon[playerid], 1);
		PlayerTextDrawSetShadow(playerid,Debug_GunIcon[playerid], 1);
		PlayerTextDrawUseBox(playerid,Debug_GunIcon[playerid], 1);
		PlayerTextDrawBoxColor(playerid,Debug_GunIcon[playerid], 16711935);
		PlayerTextDrawTextSize(playerid,Debug_GunIcon[playerid], 15.000000, 7.000000);
		PlayerTextDrawSetSelectable(playerid,Debug_GunIcon[playerid], 0);

		Debug_GunInfo[playerid]  = CreatePlayerTextDraw(playerid,511.000000, 110.000000, "Sniper Rifle / 10 Ammo");
		PlayerTextDrawBackgroundColor(playerid,Debug_GunInfo[playerid] , 255);
		PlayerTextDrawFont(playerid,Debug_GunInfo[playerid] , 2);
		PlayerTextDrawLetterSize(playerid,Debug_GunInfo[playerid] , 0.190000, 0.799999);
		PlayerTextDrawColor(playerid,Debug_GunInfo[playerid] , -1);
		PlayerTextDrawSetOutline(playerid,Debug_GunInfo[playerid] , 1);
		PlayerTextDrawSetProportional(playerid,Debug_GunInfo[playerid] , 1);
		PlayerTextDrawSetSelectable(playerid,Debug_GunInfo[playerid] , 0);


		PlayerEye[playerid] = CreatePlayerTextDraw(playerid,610.000000, 164.000000, "hud:radar_light");
		PlayerTextDrawBackgroundColor(playerid,PlayerEye[playerid], 255);
		PlayerTextDrawFont(playerid,PlayerEye[playerid], 4);
		PlayerTextDrawLetterSize(playerid,PlayerEye[playerid], 0.600000, 2.000000);
		PlayerTextDrawColor(playerid,PlayerEye[playerid], 866792277);
		PlayerTextDrawSetOutline(playerid,PlayerEye[playerid], 0);
		PlayerTextDrawSetProportional(playerid,PlayerEye[playerid], 1);
		PlayerTextDrawSetShadow(playerid,PlayerEye[playerid], 1);
		PlayerTextDrawUseBox(playerid,PlayerEye[playerid], 1);
		PlayerTextDrawBoxColor(playerid,PlayerEye[playerid], 5243060);
		PlayerTextDrawTextSize(playerid,PlayerEye[playerid], 15.000000, 16.000000);
		PlayerTextDrawSetSelectable(playerid,PlayerEye[playerid], 0);

		PlayerNoise[playerid] = CreatePlayerTextDraw(playerid,626.000000, 205.000000, "hud:radar_spray");
		PlayerTextDrawBackgroundColor(playerid,PlayerNoise[playerid], 255);
		PlayerTextDrawFont(playerid,PlayerNoise[playerid], 4);
		PlayerTextDrawLetterSize(playerid,PlayerNoise[playerid], 0.750000, 9.299999);
		PlayerTextDrawColor(playerid,PlayerNoise[playerid], 866792277);
		PlayerTextDrawSetOutline(playerid,PlayerNoise[playerid], 0);
		PlayerTextDrawSetProportional(playerid,PlayerNoise[playerid], 1);
		PlayerTextDrawSetShadow(playerid,PlayerNoise[playerid], 1);
		PlayerTextDrawUseBox(playerid,PlayerNoise[playerid], 1);
		PlayerTextDrawBoxColor(playerid,PlayerNoise[playerid], 5243060);
		PlayerTextDrawTextSize(playerid,PlayerNoise[playerid], -15.000000, 17.000000);
		PlayerTextDrawSetSelectable(playerid,PlayerNoise[playerid], 0);

		EyeLevel1[playerid] = CreatePlayerTextDraw(playerid,605.000000, 159.000000, "(");
		PlayerTextDrawBackgroundColor(playerid,EyeLevel1[playerid], -256);
		PlayerTextDrawFont(playerid,EyeLevel1[playerid], 1);
		PlayerTextDrawLetterSize(playerid,EyeLevel1[playerid], 0.800000, 2.400000);
		PlayerTextDrawColor(playerid,EyeLevel1[playerid], 85);
		PlayerTextDrawSetOutline(playerid,EyeLevel1[playerid], 0);
		PlayerTextDrawSetProportional(playerid,EyeLevel1[playerid], 1);
		PlayerTextDrawSetShadow(playerid,EyeLevel1[playerid], 1);
		PlayerTextDrawSetPreviewModel(playerid, EyeLevel1[playerid], 18843);
		PlayerTextDrawSetPreviewRot(playerid, EyeLevel1[playerid], -16.000000, 0.000000, -55.000000, 1.000000);
		PlayerTextDrawSetSelectable(playerid,EyeLevel1[playerid], 0);

		EyeLevel2[playerid] = CreatePlayerTextDraw(playerid,600.000000, 155.000000, "(");
		PlayerTextDrawBackgroundColor(playerid,EyeLevel2[playerid], -256);
		PlayerTextDrawFont(playerid,EyeLevel2[playerid], 1);
		PlayerTextDrawLetterSize(playerid,EyeLevel2[playerid], 0.810000, 3.199999);
		PlayerTextDrawColor(playerid,EyeLevel2[playerid], 85);
		PlayerTextDrawSetOutline(playerid,EyeLevel2[playerid], 0);
		PlayerTextDrawSetProportional(playerid,EyeLevel2[playerid], 1);
		PlayerTextDrawSetShadow(playerid,EyeLevel2[playerid], 1);
		PlayerTextDrawSetPreviewModel(playerid, EyeLevel2[playerid], 18843);
		PlayerTextDrawSetPreviewRot(playerid, EyeLevel2[playerid], -16.000000, 0.000000, -55.000000, 1.000000);
		PlayerTextDrawSetSelectable(playerid,EyeLevel2[playerid], 0);

		EyeLevel3[playerid] = CreatePlayerTextDraw(playerid,595.000000, 151.000000, "(");
		PlayerTextDrawBackgroundColor(playerid,EyeLevel3[playerid], -256);
		PlayerTextDrawFont(playerid,EyeLevel3[playerid], 1);
		PlayerTextDrawLetterSize(playerid,EyeLevel3[playerid], 0.800000, 3.799998);
		PlayerTextDrawColor(playerid,EyeLevel3[playerid], 85);
		PlayerTextDrawSetOutline(playerid,EyeLevel3[playerid], 0);
		PlayerTextDrawSetProportional(playerid,EyeLevel3[playerid], 1);
		PlayerTextDrawSetShadow(playerid,EyeLevel3[playerid], 1);
		PlayerTextDrawSetPreviewModel(playerid, EyeLevel3[playerid], 18843);
		PlayerTextDrawSetPreviewRot(playerid, EyeLevel3[playerid], -16.000000, 0.000000, -55.000000, 1.000000);
		PlayerTextDrawSetSelectable(playerid,EyeLevel3[playerid], 0);

		EyeLevel4[playerid] = CreatePlayerTextDraw(playerid,590.000000, 148.000000, "(");
		PlayerTextDrawBackgroundColor(playerid,EyeLevel4[playerid], -256);
		PlayerTextDrawFont(playerid,EyeLevel4[playerid], 1);
		PlayerTextDrawLetterSize(playerid,EyeLevel4[playerid], 0.800000, 4.499999);
		PlayerTextDrawColor(playerid,EyeLevel4[playerid], 85);
		PlayerTextDrawSetOutline(playerid,EyeLevel4[playerid], 0);
		PlayerTextDrawSetProportional(playerid,EyeLevel4[playerid], 1);
		PlayerTextDrawSetShadow(playerid,EyeLevel4[playerid], 1);
		PlayerTextDrawSetPreviewModel(playerid, EyeLevel4[playerid], 18843);
		PlayerTextDrawSetPreviewRot(playerid, EyeLevel4[playerid], -16.000000, 0.000000, -55.000000, 1.000000);
		PlayerTextDrawSetSelectable(playerid,EyeLevel4[playerid], 0);

		NoiseLevel1[playerid] = CreatePlayerTextDraw(playerid,605.000000, 196.000000, "(");
		PlayerTextDrawBackgroundColor(playerid,NoiseLevel1[playerid], -256);
		PlayerTextDrawFont(playerid,NoiseLevel1[playerid], 1);
		PlayerTextDrawLetterSize(playerid,NoiseLevel1[playerid], 0.800000, 2.400000);
		PlayerTextDrawColor(playerid,NoiseLevel1[playerid], 85);
		PlayerTextDrawSetOutline(playerid,NoiseLevel1[playerid], 0);
		PlayerTextDrawSetProportional(playerid,NoiseLevel1[playerid], 1);
		PlayerTextDrawSetShadow(playerid,NoiseLevel1[playerid], 1);
		PlayerTextDrawSetPreviewModel(playerid, NoiseLevel1[playerid], 18843);
		PlayerTextDrawSetPreviewRot(playerid, NoiseLevel1[playerid], -16.000000, 0.000000, -55.000000, 1.000000);
		PlayerTextDrawSetSelectable(playerid,NoiseLevel1[playerid], 0);

		NoiseLevel2[playerid] = CreatePlayerTextDraw(playerid,600.000000, 191.000000, "(");
		PlayerTextDrawBackgroundColor(playerid,NoiseLevel2[playerid], -256);
		PlayerTextDrawFont(playerid,NoiseLevel2[playerid], 1);
		PlayerTextDrawLetterSize(playerid,NoiseLevel2[playerid], 0.810000, 3.199999);
		PlayerTextDrawColor(playerid,NoiseLevel2[playerid], 85);
		PlayerTextDrawSetOutline(playerid,NoiseLevel2[playerid], 0);
		PlayerTextDrawSetProportional(playerid,NoiseLevel2[playerid], 1);
		PlayerTextDrawSetShadow(playerid,NoiseLevel2[playerid], 1);
		PlayerTextDrawSetPreviewModel(playerid, NoiseLevel2[playerid], 18843);
		PlayerTextDrawSetPreviewRot(playerid, NoiseLevel2[playerid], -16.000000, 0.000000, -55.000000, 1.000000);
		PlayerTextDrawSetSelectable(playerid,NoiseLevel2[playerid], 0);

		NoiseLevel3[playerid] = CreatePlayerTextDraw(playerid,595.000000, 187.000000, "(");
		PlayerTextDrawBackgroundColor(playerid,NoiseLevel3[playerid], -256);
		PlayerTextDrawFont(playerid,NoiseLevel3[playerid], 1);
		PlayerTextDrawLetterSize(playerid,NoiseLevel3[playerid], 0.800000, 3.799998);
		PlayerTextDrawColor(playerid,NoiseLevel3[playerid], 85);
		PlayerTextDrawSetOutline(playerid,NoiseLevel3[playerid], 0);
		PlayerTextDrawSetProportional(playerid,NoiseLevel3[playerid], 1);
		PlayerTextDrawSetShadow(playerid,NoiseLevel3[playerid], 1);
		PlayerTextDrawSetPreviewModel(playerid, NoiseLevel3[playerid], 18843);
		PlayerTextDrawSetPreviewRot(playerid, NoiseLevel3[playerid], -16.000000, 0.000000, -55.000000, 1.000000);
		PlayerTextDrawSetSelectable(playerid,NoiseLevel3[playerid], 0);

		NoiseLevel4[playerid] = CreatePlayerTextDraw(playerid,590.000000, 182.000000, "(");
		PlayerTextDrawBackgroundColor(playerid,NoiseLevel4[playerid], -256);
		PlayerTextDrawFont(playerid,NoiseLevel4[playerid], 1);
		PlayerTextDrawLetterSize(playerid,NoiseLevel4[playerid], 0.800000, 4.499999);
		PlayerTextDrawColor(playerid,NoiseLevel4[playerid], 85);
		PlayerTextDrawSetOutline(playerid,NoiseLevel4[playerid], 0);
		PlayerTextDrawSetProportional(playerid,NoiseLevel4[playerid], 1);
		PlayerTextDrawSetShadow(playerid,NoiseLevel4[playerid], 1);
		PlayerTextDrawSetPreviewModel(playerid, NoiseLevel4[playerid], 18843);
		PlayerTextDrawSetPreviewRot(playerid, NoiseLevel4[playerid], -16.000000, 0.000000, -55.000000, 1.000000);
		PlayerTextDrawSetSelectable(playerid,NoiseLevel4[playerid], 0);

		IndicatorBox[playerid] = CreatePlayerTextDraw(playerid, 428.444458, 398.753326, "usebox");
		PlayerTextDrawLetterSize(playerid, IndicatorBox[playerid], 0.000000, -2.584319);
		PlayerTextDrawTextSize(playerid, IndicatorBox[playerid], 622.444458, 0.000000);
		PlayerTextDrawAlignment(playerid, IndicatorBox[playerid], 1);
		PlayerTextDrawColor(playerid, IndicatorBox[playerid], 0);
		PlayerTextDrawUseBox(playerid, IndicatorBox[playerid], true);
		PlayerTextDrawBoxColor(playerid, IndicatorBox[playerid], 102);
		PlayerTextDrawSetShadow(playerid, IndicatorBox[playerid], 0);
		PlayerTextDrawFont(playerid, IndicatorBox[playerid], 0);
		
		VehicleBG[playerid] = CreatePlayerTextDraw(playerid,12.000000, 238.000000, "~n~");
		PlayerTextDrawBackgroundColor(playerid,VehicleBG[playerid], 255);
		PlayerTextDrawFont(playerid,VehicleBG[playerid], 1);
		PlayerTextDrawLetterSize(playerid,VehicleBG[playerid], 0.460000, 8.899999);
		PlayerTextDrawColor(playerid,VehicleBG[playerid], -1);
		PlayerTextDrawSetOutline(playerid,VehicleBG[playerid], 0);
		PlayerTextDrawSetProportional(playerid,VehicleBG[playerid], 1);
		PlayerTextDrawSetShadow(playerid,VehicleBG[playerid], 1);
		PlayerTextDrawUseBox(playerid,VehicleBG[playerid], 1);
		PlayerTextDrawBoxColor(playerid,VehicleBG[playerid], 225);
		PlayerTextDrawTextSize(playerid,VehicleBG[playerid], 105.000000, -235.000000);
		PlayerTextDrawSetSelectable(playerid,VehicleBG[playerid], 0);


		Indicator[playerid] = CreatePlayerTextDraw(playerid, 540.000183, 380.826660, "Hit: 4 - 150 dmg");
		PlayerTextDrawLetterSize(playerid, Indicator[playerid], 0.227333, 1.346132);
		PlayerTextDrawAlignment(playerid, Indicator[playerid], 1);
		PlayerTextDrawColor(playerid, Indicator[playerid], -1);
		PlayerTextDrawSetShadow(playerid, Indicator[playerid], 0);
		PlayerTextDrawSetOutline(playerid, Indicator[playerid], 1);
		PlayerTextDrawBackgroundColor(playerid, Indicator[playerid], 51);
		PlayerTextDrawFont(playerid, Indicator[playerid], 1);
		PlayerTextDrawSetProportional(playerid, Indicator[playerid], 1);

		IndicatorBox1[playerid] = CreatePlayerTextDraw(playerid, 428.444458, 382.753326, "usebox");
		PlayerTextDrawLetterSize(playerid, IndicatorBox1[playerid], 0.000000, -2.584319);
		PlayerTextDrawTextSize(playerid, IndicatorBox1[playerid], 622.444458, 0.000000);
		PlayerTextDrawAlignment(playerid, IndicatorBox1[playerid], 1);
		PlayerTextDrawColor(playerid, IndicatorBox1[playerid], 0);
		PlayerTextDrawUseBox(playerid, IndicatorBox1[playerid], true);
		PlayerTextDrawBoxColor(playerid, IndicatorBox1[playerid], 102);
		PlayerTextDrawSetShadow(playerid, IndicatorBox1[playerid], 0);
		PlayerTextDrawFont(playerid, IndicatorBox1[playerid], 0);

		Indicator1[playerid] = CreatePlayerTextDraw(playerid, 430.000183, 363.826660, "Hit: 4 - 150 dmg");
		PlayerTextDrawLetterSize(playerid, Indicator1[playerid], 0.227333, 1.346132);
		PlayerTextDrawAlignment(playerid, Indicator1[playerid], 1);
		PlayerTextDrawColor(playerid, Indicator1[playerid], -1);
		PlayerTextDrawSetShadow(playerid, Indicator1[playerid], 0);
		PlayerTextDrawSetOutline(playerid, Indicator1[playerid], 1);
		PlayerTextDrawBackgroundColor(playerid, Indicator1[playerid], 51);
		PlayerTextDrawFont(playerid, Indicator1[playerid], 1);
		PlayerTextDrawSetProportional(playerid, Indicator1[playerid], 1);
	}
	return 1;
}

stock DeletePlayerTD(playerid)
{
	PlayerTextDrawHide(playerid,DebugInfo[playerid]);
	PlayerTextDrawDestroy(playerid,DebugInfo[playerid]);
	PlayerTextDrawHide(playerid,Indicator1[playerid]);
	PlayerTextDrawDestroy(playerid,IndicatorBox1[playerid]);
	PlayerTextDrawHide(playerid,Indicator[playerid]);
	PlayerTextDrawDestroy(playerid,IndicatorBox[playerid]);
	PlayerTextDrawHide(playerid,LegBroken[playerid]);
	PlayerTextDrawDestroy(playerid,LegBroken[playerid]);
	PlayerTextDrawHide(playerid,vehicleInfo[playerid]);
	PlayerTextDrawDestroy(playerid,vehicleInfo[playerid]);
	PlayerTextDrawHide(playerid,PlayerBlood[playerid]);
	PlayerTextDrawDestroy(playerid,PlayerBlood[playerid]);
	PlayerTextDrawHide(playerid,PlayerHunger[playerid]);
	PlayerTextDrawDestroy(playerid,PlayerHunger[playerid]);
	PlayerTextDrawHide(playerid,PlayerThirst[playerid]);
	PlayerTextDrawDestroy(playerid,PlayerThirst[playerid]);
	PlayerTextDrawHide(playerid,PlayerNoise[playerid]);
	PlayerTextDrawDestroy(playerid,PlayerNoise[playerid]);
	PlayerTextDrawHide(playerid,Map[playerid]);
	PlayerTextDrawDestroy(playerid,Map[playerid]);
	PlayerTextDrawHide(playerid,PlayerEye[playerid]);
	PlayerTextDrawDestroy(playerid,PlayerEye[playerid]);
	PlayerTextDrawHide(playerid,playerBandit[playerid]);
	PlayerTextDrawDestroy(playerid,playerBandit[playerid]);
	PlayerTextDrawHide(playerid,PlayerTemp[playerid]);
	PlayerTextDrawDestroy(playerid,PlayerTemp[playerid]);
	PlayerTextDrawHide(playerid,NoiseLevel1[playerid]);
	PlayerTextDrawDestroy(playerid,NoiseLevel1[playerid]);
	PlayerTextDrawHide(playerid,NoiseLevel2[playerid]);
	PlayerTextDrawDestroy(playerid,NoiseLevel2[playerid]);
	PlayerTextDrawHide(playerid,NoiseLevel3[playerid]);
	PlayerTextDrawDestroy(playerid,NoiseLevel3[playerid]);
	PlayerTextDrawHide(playerid,NoiseLevel4[playerid]);
	PlayerTextDrawDestroy(playerid,NoiseLevel4[playerid]);
	PlayerTextDrawHide(playerid,EyeLevel1[playerid]);
	PlayerTextDrawDestroy(playerid,EyeLevel1[playerid]);
	PlayerTextDrawHide(playerid,EyeLevel2[playerid]);
	PlayerTextDrawDestroy(playerid,EyeLevel2[playerid]);
	PlayerTextDrawHide(playerid,EyeLevel3[playerid]);
	PlayerTextDrawDestroy(playerid,EyeLevel3[playerid]);
	PlayerTextDrawHide(playerid,EyeLevel4[playerid]);
	PlayerTextDrawDestroy(playerid,EyeLevel4[playerid]);
	return 1;
}

stock CreateTDS()
{

	Clock = TextDrawCreate(549,24, "00:00");
    TextDrawLetterSize(Clock,0.55,2);
    TextDrawFont(Clock,3);
    TextDrawBackgroundColor(Clock,0x000000AA);
    TextDrawSetOutline(Clock,2);

	Date = TextDrawCreate(500,3, "01.01.2008");
	TextDrawLetterSize(Date,0.55,2);
	TextDrawFont(Date,3);
	TextDrawBackgroundColor(Date,0x000000AA);
	TextDrawSetOutline(Date,2);

    BlockMap = GangZoneCreate(-2994,-2994,3000,3006);

	WholeScreen = TextDrawCreate(-20.000000, 0.000000, "_");
    TextDrawUseBox(WholeScreen, 1);
    TextDrawBoxColor(WholeScreen, 0x000000FF);
    TextDrawAlignment(WholeScreen, 0);
    TextDrawBackgroundColor(WholeScreen, 0x000000FF);
    TextDrawFont(WholeScreen, 3);
    TextDrawLetterSize(WholeScreen, 1.000000, 52.200000);
    TextDrawColor(WholeScreen, 0x000000FF);

	Announcement = TextDrawCreate(260.000000, 426.000000, "DAYZSATEST IS NOW~r~ DEAD");
	TextDrawBackgroundColor(Announcement, 255);
	TextDrawFont(Announcement, 2);
	TextDrawLetterSize(Announcement, 0.230000, 1.500000);
	TextDrawColor(Announcement, -1);
	TextDrawSetOutline(Announcement, 0);
	TextDrawSetProportional(Announcement, 1);
	TextDrawSetShadow(Announcement, 1);

	DebugBox = TextDrawCreate(491.000000, 10.000000, "ld_drv:ribbw");
	TextDrawAlignment(DebugBox, 2);
	TextDrawBackgroundColor(DebugBox, 255);
	TextDrawFont(DebugBox, 4);
	TextDrawLetterSize(DebugBox, 0.339999, -1.100000);
	TextDrawColor(DebugBox, 255);
	TextDrawSetOutline(DebugBox, 0);
	TextDrawSetProportional(DebugBox, 1);
	TextDrawSetShadow(DebugBox, 1);
	TextDrawUseBox(DebugBox, 1);
	TextDrawBoxColor(DebugBox, 16711935);
	TextDrawTextSize(DebugBox, 150.000000, 100.000000);
	TextDrawSetSelectable(DebugBox, 0);
	
	DebugText = TextDrawCreate(558.000000, 17.000000, "Debug Monitor");
	TextDrawAlignment(DebugText, 2);
	TextDrawBackgroundColor(DebugText, 255);
	TextDrawFont(DebugText, 2);
	TextDrawLetterSize(DebugText, 0.339999, 1.000000);
	TextDrawColor(DebugText, -16776961);
	TextDrawSetOutline(DebugText, 1);
	TextDrawSetProportional(DebugText, 1);
	TextDrawSetSelectable(DebugText, 0);

	DayZSA_Web = TextDrawCreate(509.000000, 4.000000, "pgagaming.net / v15.0");
	TextDrawBackgroundColor(DayZSA_Web, 255);
	TextDrawFont(DayZSA_Web, 2);
	TextDrawLetterSize(DayZSA_Web, 0.200000, 0.799999);
	TextDrawColor(DayZSA_Web, -16776961);
	TextDrawSetOutline(DayZSA_Web, 1);
	TextDrawSetProportional(DayZSA_Web, 1);
	TextDrawSetSelectable(DayZSA_Web, 0);

	return 1;
}

stock ConnectVars(playerid)
{
	pInfo[playerid][pHunger] = 2500;
	pInfo[playerid][pThrist] = 1000;
	pInfo[playerid][pBlood] = 12000;
	pInfo[playerid][Humanity] = 2500;

	RemoveVends(playerid);
	DayZSA_RemoveLights(playerid);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_PISTOL, 1);
	pGABase_RemoveObjects(playerid);

    TeleportAllowed[playerid] = 1;
	gpInfo[playerid][hacker] = 0;
	gpInfo[playerid][firstspawn] = 1;
	GetPlayerName(playerid, gpInfo[playerid][pname23], MAX_PLAYER_NAME);

	for(new i=0;i<47;i++)
	{
		PlayerWeapons[playerid][i]=false;
 		Spawned[playerid]=false;
	}
	return 1;
}

stock DecreaseBars(playerid)
{
    if(IsSpecing[playerid] == 0)
    {
		pInfo[playerid][pHunger] -= random(3);
		pInfo[playerid][pThrist] -= random(3);
	}
	return 1;
}

stock CheckBars(playerid)
{
	if(pInfo[playerid][IsPlayerSpawned] == 1)
	{
	    if(isPlayerInMenu[playerid] == 0)
	    {
			if(pInfo[playerid][pHunger] <= 0)
			{
				new str2[128];
				SetPlayerHealth(playerid, 0);
				format(str2,sizeof(str2),"*"COL_RED" %s(%i) has starved to death!",PlayerName(playerid),playerid);
				ProxDetector(60.0, playerid, str2, COLOR_GREY);
				pInfo[playerid][pHunger] = 2500;
				SendClientMessage(playerid,-1,"*"COL_RED" You starved to death!");
			}

			if(pInfo[playerid][pThrist] <= 0)
			{
				new str2[128];
				SetPlayerHealth(playerid, 0);
				format(str2,sizeof(str2),"*"COL_RED" %s(%i) has died of thirst!",PlayerName(playerid),playerid);
				ProxDetector(60.0, playerid, str2, COLOR_GREY);
				pInfo[playerid][pThrist] = 1000;
				SendClientMessage(playerid,-1,"*"COL_RED" You died of thirst!");
			}

			if(pInfo[playerid][pBlood] <= 0)
			{
				new str2[128];
				SetPlayerHealth(playerid, 0);
				format(str2,sizeof(str2),"*"COL_RED" %s(%i) has died of blood loss!",PlayerName(playerid),playerid);
				ProxDetector(60.0, playerid, str2, COLOR_GREY);
				pInfo[playerid][pBlood] = 12000;
				SendClientMessage(playerid,-1,"*"COL_RED" You died of blood loss!");
			}
		}
	}
	return 1;
}

stock DisconnectVars(playerid)
{
 	SaveInventory(playerid);
   	if(IsPlayerAttachedObjectSlotUsed(playerid, 1)) RemovePlayerAttachedObject(playerid, 0);

    if(pInfo[playerid][IsPlayerGroupOwner] == 1)
    {
		new str[24],gname[16];

		format(str,sizeof(str),"Destroyed");
		format(gname,sizeof(gname),"Destroyed");

		Groups[pInfo[playerid][IsPlayerInGroupID]][GroupID] = 0;
		Groups[pInfo[playerid][IsPlayerInGroupID]][GroupOwner] = str;
		Groups[pInfo[playerid][IsPlayerInGroupID]][GroupName] = gname;
		Groups[pInfo[playerid][IsPlayerInGroupID]][GroupMembers] = 0;

		foreach(Player,i)
		{
			if(pInfo[i][IsPlayerInGroupID] == pInfo[playerid][IsPlayerInGroupID])
			{
				pInfo[i][IsPlayerInGroup] = 0;
				pInfo[i][IsPlayerInGroupID] = 0;

			}
		}

		pInfo[playerid][IsPlayerInGroup] = 0;
		pInfo[playerid][IsPlayerGroupOwner] = 0;
		pInfo[playerid][IsPlayerInGroupID] = 0;
	}
    return 1;
}

stock SendGlobal(Float:radi, playerid, string[],color)
{
    new Float:x,Float:y,Float:z;
    GetPlayerPos(playerid,x,y,z);
    foreach(Player,i)
    {
        if(globalStatus[i] == 0)
        {
        	if(IsPlayerInRangeOfPoint(i,radi,x,y,z))
        	{
        	    SendClientMessage(i,color,string);
        	}
		}
	}
}

stock ProxDetector(Float:radi, playerid, string[],color)
{
    new Float:x,Float:y,Float:z;
    GetPlayerPos(playerid,x,y,z);
    foreach(Player,i)
    {
        if(IsPlayerInRangeOfPoint(i,radi,x,y,z))
        {
            SendClientMessage(i,color,string);
        }
    }
}

function IsPlayerAimingTargetBodyPart(playerid, targetid, bodypart)
{
	new Float:x, Float:y, Float:z;
	new Float:vx, Float:vy, Float:vz;
	new Float:cx, Float:cy, Float:cz;
	GetPlayerCameraFrontVector(playerid, vx, vy, vz);
	GetPlayerCameraPos(playerid, cx, cy, cz);
	new Float:px, Float:py, Float:pz;
	GetPlayerPos(targetid, px, py, pz);
	new Float:dist = floatsqroot(((cx-px)*(cx-px)) + ((cy-py)*(cy-py)) + ((cz-pz)*(cz-pz)));
    x = vx*dist+cx;
    y = vy*dist+cy;
    z = vz*dist+cz;
    new Float:offset;
	switch (GetPlayerWeapon(playerid))
	{
	    case 24, 29, 22, 23, 25, 26, 27, 28, 32: offset = 0.1122047500310059125919013005129;
	    case 30, 31: offset = 0.07867820613690007867820613690008;
	    case 33, 34: offset = 0.0;
	}
	new Float:height;
	if (z > cz) height = z-cz;
	else height = cz-z;
	offset *= dist;
	height /= dist;
	new Float:part;
	if (bodypart == BODY_PART_HEAD) part = -0.4;
	else if (bodypart == BODY_PART_TORSO) part = 0.3;
	else if (bodypart == BODY_PART_LEGS) part = 1.0;
	z = z+offset-height+part;
    if (IsPlayerInRangeOfPoint(targetid, 0.5, x, y, z-0.5)) return 1;
	return 0;
}


function ShowGroupMarkers(playerid)
{
	foreach(Player,i)
	{
		if(pInfo[playerid][IsPlayerInGroupID] == pInfo[i][IsPlayerInGroupID])
		{
		    if(pInfo[playerid][IsPlayerInGroupID] != 0)
			{
				if(pInfo[i][IsPlayerInGroupID] != 0)
				{
					SetPlayerMarkerForPlayer( playerid, i, 0x9900FFFF);
					SetPlayerMarkerForPlayer( i, playerid, 0x9900FFFF);
				}
			}
		}
		else
		{
			SetPlayerMarkerForPlayer( playerid, i, ( GetPlayerColor( i ) & 0xFFFFFF00 ) );
			SetPlayerMarkerForPlayer( i, playerid, ( GetPlayerColor( playerid ) & 0xFFFFFF00 ) );
		}
	}
}

function SpawnVars(playerid)
{
	// If First spawn is 2 means he's already spawned and been around!
	// If First spawn is 1 means he's new and hasn't spawned yet or died!

	if(!IsPlayerNPC(playerid))
	{
		SetPlayerVirtualWorld(playerid,0);
		SetPlayerHealth(playerid,100.0);
		RemovePlayerAttachedObject(playerid, 2);
		KillTimer(pInfo[playerid][Bleeding]);
		pInfo[playerid][IsPlayerSpawned] = 1;
		SetPlayerSkillLevel(playerid, WEAPONSKILL_PISTOL, 1);

		if(pInfo[playerid][pIsMapOpened] == 0)
		{
			GangZoneShowForPlayer(playerid,BlockMap,0x000000FF);
			PlayerTextDrawShow(playerid, blockMap[playerid]);
		}

		PlayerTextDrawHide(playerid, PlayerIntroBox[playerid]);

		//TextDrawShowForPlayer(playerid,Clock);
		//TextDrawShowForPlayer(playerid,Date);
		PlayerTextDrawHide(playerid, LegBroken[playerid]);
		pInfo[playerid][IsPlayerLegBroken] = 0;

		if(pInfo[playerid][pFirstSpawn] == 1)
		{
			new randSpawn = random(sizeof(randomSpawns_DayZSA_Part1));
			SetPlayerPos_Allow(playerid,randomSpawns_DayZSA_Part1[randSpawn][0],randomSpawns_DayZSA_Part1[randSpawn][1],randomSpawns_DayZSA_Part1[randSpawn][2]);
			//SetPlayerFacingAngle(playerid,randomSpawns_DayZSA_Part1[randSpawn][3]);

            if(pInfo[playerid][DefaultGender] == MALE_ID)
            {
				SetPlayerSkin(playerid,NORMAL);
			}
			else
			{
			    SetPlayerSkin(playerid,FEMALE);
			}

			ResetPlayerWeapons(playerid);

			if(pInfo[playerid][pPremium] == 0)
			{
				pInfo[playerid][pHunger] = 2500;
				pInfo[playerid][pThrist] = 1000;
				pInfo[playerid][pBlood] = 12000;
				pInfo[playerid][Humanity] = 2500;
				pInfo[playerid][Backpack] = 0;
				pInfo[playerid][BackpackSlots] = 8;
				pInfo[playerid][BackpackSlotsUsed] = 0;
			}

			if(pInfo[playerid][pPremium] == 1)
			{
				pInfo[playerid][pHunger] = 2500;
				pInfo[playerid][pThrist] = 1000;
				pInfo[playerid][pBlood] = 16000;
				pInfo[playerid][Humanity] = 2980;
				pInfo[playerid][Backpack] = 1;
				pInfo[playerid][BackpackSlots] = 16;
				pInfo[playerid][BackpackSlotsUsed] = 0;
			}

			if(pInfo[playerid][pPremium] == 2)
			{
				pInfo[playerid][pHunger] = 2500;
				pInfo[playerid][pThrist] = 1000;
				pInfo[playerid][pBlood] = 18000;
				pInfo[playerid][Humanity] = 3200;
				pInfo[playerid][Backpack] = 2;
				pInfo[playerid][BackpackSlots] = 28;
				pInfo[playerid][BackpackSlotsUsed] = 0;
			}

			if(pInfo[playerid][pPremium] >= 3)
			{
				pInfo[playerid][pHunger] = 3000;
				pInfo[playerid][pThrist] = 1000;
				pInfo[playerid][pBlood] = 21000;
				pInfo[playerid][Humanity] = 3500;
				pInfo[playerid][Backpack] = 3;
				pInfo[playerid][BackpackSlots] = 38;
				pInfo[playerid][BackpackSlotsUsed] = 0;
				AddSlotToInventoryWorld(playerid,"Blood Bag",1);
				AddSlotToInventoryWorld(playerid,"Pistol",1);
				AddSlotToInventoryWorld(playerid,"Pistol Ammo",1);
			}

			if(pInfo[playerid][pPremium] >= 4)
			{
				pInfo[playerid][pHunger] = 3800;
				pInfo[playerid][pThrist] = 1800;
				pInfo[playerid][pBlood] = 26000;
				pInfo[playerid][Humanity] = 4500;
				AddSlotToInventoryWorld(playerid,"Blood Bag",2);
				AddSlotToInventoryWorld(playerid,"M4",1);
				AddSlotToInventoryWorld(playerid,"Assault Ammo",1);
				AddSlotToInventoryWorld(playerid,"Sniper Skin",1);
				AddSlotToInventoryWorld(playerid,"Full Water Bottle",1);
				AddSlotToInventoryWorld(playerid,"Shotgun",1);
			}

			AddSlotToInventoryWorld(playerid,"Bandage",1);
			AddSlotToInventoryWorld(playerid,"Full Water Bottle",1);
			AddSlotToInventoryWorld(playerid,"Painkiller",1);
			AddSlotToInventoryWorld(playerid,"Heat Pack Basic", 1);
			switch(random(5))
			{
				case 3: AddSlotToInventoryWorld(playerid,"Radio Device",1);
			}

			pInfo[playerid][pFirstSpawn] = 2;
		}

		else if(pInfo[playerid][pFirstSpawn] == 2)
		{
			PlayerTextDrawHide(playerid, PlayerIntroBox[playerid]);
			SetPlayerSkin(playerid,pInfo[playerid][pSkin]);
			if(giveWeaponAllow[playerid] == 1)
			{
				GivePlayerWeaponEx(playerid,pInfo[playerid][pWeap1],pInfo[playerid][pAmmo1]);
				GivePlayerWeaponEx(playerid,pInfo[playerid][pWeap2],pInfo[playerid][pAmmo2]);
				GivePlayerWeaponEx(playerid,pInfo[playerid][pWeap3],pInfo[playerid][pAmmo3]);
				GivePlayerWeaponEx(playerid,pInfo[playerid][pWeap4],pInfo[playerid][pAmmo4]);
				GivePlayerWeaponEx(playerid,pInfo[playerid][pWeap5],pInfo[playerid][pAmmo5]);
				GivePlayerWeaponEx(playerid,pInfo[playerid][pWeap6],pInfo[playerid][pAmmo6]);
				GivePlayerWeaponEx(playerid,pInfo[playerid][pWeap7],pInfo[playerid][pAmmo7]);
				GivePlayerWeaponEx(playerid,pInfo[playerid][pWeap8],pInfo[playerid][pAmmo8]);
				GivePlayerWeaponEx(playerid,pInfo[playerid][pWeap9],pInfo[playerid][pAmmo9]);
				giveWeaponAllow[playerid] = 0;
			}
			SetPlayerPos_Allow(playerid,pInfo[playerid][pX],pInfo[playerid][pY],pInfo[playerid][pZ]+0.7);

			if(pInfo[playerid][Humanity] <= 2000)
			{
				if(pInfo[playerid][IsPlayerBandit] == 0)
				{
					SetPlayerSkin(playerid,BANDIT);
					SendClientMessage(playerid,-1,""COL_GREY" You are an bandit now!");
					pInfo[playerid][IsPlayerBandit] = 1;
					RemovePlayerAttachedObject(playerid, 4);
					SetPlayerAttachedObject(playerid,4,19033,2,0.094999,0.076999,-0.012000,2.900000,83.200004,94.900001,1.000000,1.000000,1.000000);
				}
			}

			if(pInfo[playerid][Humanity] >= 3000)
			{
				if(pInfo[playerid][IsPlayerHero] == 0)
				{
					SetPlayerSkin(playerid,HERO);
					SendClientMessage(playerid,-1,""COL_GREY" You are an hero now!");
					pInfo[playerid][IsPlayerHero] = 1;
				}
			}
		}

		if(GetPlayerSkin(playerid) == 0)
		{
			SetPlayerSkin(playerid,NORMAL);
		}

		RemovePlayerAttachedObject(playerid, 1);

		if(pInfo[playerid][Backpack] == 0) { pInfo[playerid][BackpackSlots] = 8; }
		if(pInfo[playerid][Backpack] == 1) { pInfo[playerid][BackpackSlots] = 16; }
		if(pInfo[playerid][Backpack] == 2) { pInfo[playerid][BackpackSlots] = 28; }
		if(pInfo[playerid][Backpack] == 3) { pInfo[playerid][BackpackSlots] = 38; }

		if(pInfo[playerid][Backpack] == 0) { SetPlayerAttachedObject(playerid, 1, 3026, 1, -0.160000, -0.116000, 0.000000, 0.000000, 0.000000, 0.000000, 1.141000, 1.279999, 1.176001); } /*SetPlayerAttachedObject( playerid, 1, 1580, 1, 0.200000, -0.019999, 0.000000, 90.000000, 0.000000, 1.000000, 1.000000, 1.000000, 1.000000 );*/  // drug_red - Normal Backpack
		if(pInfo[playerid][Backpack] == 1) { SetPlayerAttachedObject( playerid, 1, 371, 1, 0.000000, -0.100000, 0.000000, 3.000000, 90.000000, 1.000000, 1.000000, 1.000000, 1.000000 );  } // Small backpack
		if(pInfo[playerid][Backpack] == 2) { SetPlayerAttachedObject( playerid, 1, 1310, 1, 0.000000, -0.100000, 0.000000, 3.000000, 90.000000, 1.000000, 1.000000, 1.000000, 1.000000 ); } // pikupparachute -
		if(pInfo[playerid][Backpack] == 3) { SetPlayerAttachedObject( playerid, 1, 1550, 1, 0.000000, -0.100000, 0.000000, 3.000000, 90.000000, 1.000000, 1.000000, 1.000000, 1.000000 ); } // CJ_MONEY_BAG - Coyote Back pack

		if(pInfo[playerid][pIsMapOpened] == 1)
		{
			PlayerTextDrawHide(playerid, blockMap[playerid]);
			GangZoneHideForPlayer(playerid,BlockMap);
		}

		if(IsSpecing[playerid] == 1)
		{
			SetPlayerPos_Allow(playerid,SpecX[playerid],SpecY[playerid],SpecZ[playerid]);
			SetPlayerInterior(playerid,Inter[playerid]);
			SetPlayerVirtualWorld(playerid,vWorld[playerid]);
			IsSpecing[playerid] = 0;
			IsBeingSpeced[spectatorid[playerid]] = 0;
		}




		if(GetPlayerSkin(playerid) == 29)
		{
			SetPlayerSkin(playerid,NORMAL);
		}

	}
	return 1;
}

stock RemoveSlotToInventory(playerid,addItem[],amount)
{
    pInfo[playerid][BackpackSlotsUsed]--;
	RemoveItem(playerid,addItem,amount);
	return 1;
}

stock AddSlotToInventoryWorld(playerid,addItem[],amount)
{
	if(pInfo[playerid][Backpack] == 0)
	{
	    if(pInfo[playerid][BackpackSlots] == 8)
	    {
	    	if(pInfo[playerid][BackpackSlotsUsed] == 8)
	    	{
				SendClientMessage(playerid,-1,""chat" Your backpack is full");
			}
			else
			{
				pInfo[playerid][BackpackSlotsUsed] += amount;
				AddItem(playerid,addItem,amount);
			}
		}
	}

	if(pInfo[playerid][Backpack] == 1)
	{
	    if(pInfo[playerid][BackpackSlots] == 16)
	    {
	    	if(pInfo[playerid][BackpackSlotsUsed] == 16)
	    	{
				SendClientMessage(playerid,-1,""chat" Your backpack is full");
			}
			else
			{
				pInfo[playerid][BackpackSlotsUsed] += amount;
				AddItem(playerid,addItem,amount);
			}
		}
	}

	if(pInfo[playerid][Backpack] == 2)
	{
	    if(pInfo[playerid][BackpackSlots] == 28)
	    {
	    	if(pInfo[playerid][BackpackSlotsUsed] == 28)
	    	{
				SendClientMessage(playerid,-1,""chat" Your backpack is full");
			}
			else
			{
				pInfo[playerid][BackpackSlotsUsed] += amount;
				AddItem(playerid,addItem,amount);
			}
		}
	}

	if(pInfo[playerid][Backpack] == 3)
	{
	    if(pInfo[playerid][BackpackSlots] == 38)
	    {
	    	if(pInfo[playerid][BackpackSlotsUsed] == 38)
	    	{
				SendClientMessage(playerid,-1,""chat" Your backpack is full");
			}
			else
			{
				pInfo[playerid][BackpackSlotsUsed] += amount;
				AddItem(playerid,addItem,amount);
			}
		}
	}
	return 1;
}

stock AddSlotToInventoryLoot(playerid,addItem[],amount)
{
	if(pInfo[playerid][Backpack] == 0)
	{
	    if(pInfo[playerid][BackpackSlots] == 8)
	    {
	    	if(pInfo[playerid][BackpackSlotsUsed] == 8)
	    	{
				SendClientMessage(playerid,-1,""chat" Your backpack is full");
			}
			else
			{
				pInfo[playerid][BackpackSlotsUsed]++;
				AddItem(playerid,addItem,amount);
			}
		}
	}

	if(pInfo[playerid][Backpack] == 1)
	{
	    if(pInfo[playerid][BackpackSlots] == 16)
	    {
	    	if(pInfo[playerid][BackpackSlotsUsed] == 16)
	    	{
				SendClientMessage(playerid,-1,""chat" Your backpack is full");
			}
			else
			{
				pInfo[playerid][BackpackSlotsUsed]++;
				AddItem(playerid,addItem,amount);
			}
		}
	}

	if(pInfo[playerid][Backpack] == 2)
	{
	    if(pInfo[playerid][BackpackSlots] == 28)
	    {
	    	if(pInfo[playerid][BackpackSlotsUsed] == 28)
	    	{
				SendClientMessage(playerid,-1,""chat" Your backpack is full");
			}
			else
			{
				pInfo[playerid][BackpackSlotsUsed]++;
				AddItem(playerid,addItem,amount);
			}
		}
	}

	if(pInfo[playerid][Backpack] == 3)
	{
	    if(pInfo[playerid][BackpackSlots] == 38)
	    {
	    	if(pInfo[playerid][BackpackSlotsUsed] == 38)
	    	{
				SendClientMessage(playerid,-1,""chat" Your backpack is full");
			}
			else
			{
				pInfo[playerid][BackpackSlotsUsed]++;
				AddItem(playerid,addItem,amount);
			}
		}
	}
	return 1;
}

function StopAnim(playerid) return ClearAnimations(playerid);

function LoosingBlood(playerid)
{
	pInfo[playerid][pBlood] -= random(450);
    SetPlayerAttachedObject(playerid, 2, 18668/*18706*/, 1, 0.000000, 0.000000, -1.500000, 0.000000, 0.000000, 0.000000, 1.000000, 1.000000, 1.000000 ); // prt_blood - Bleeding
	return 1;
}

stock GetPlayerStyle(playerid)
{
	new styleString[128];
	switch(GetPlayerSkin(playerid))
	{
	    case BANDIT: styleString = ""COL_RED"Bandit";
	    case NORMAL: styleString = ""COL_GREY"Civilian";
	    case HERO: styleString = ""COL_GREEN"Hero";
	    case CIV: styleString = ""COL_GREY"Army";
	    case FEMALE: styleString = ""COL_PINK"Civilian";
	    case CIVSKIN: styleString = ""COL_GREY"Civilian";
	    case SNIP: styleString = ""COL_RED"Sniper";
	}
	return styleString;
}

stock IsPlayerInWater(playerid)
{
    new lib[16], anim[32];
    GetAnimationName(GetPlayerAnimationIndex(playerid), lib, sizeof(lib), anim, sizeof(anim));
    if(!strcmp(lib, "SWIM", true) && !isnull(lib)) return 1;
    return 0;
}

TimeConvert(time)
{
    new minutes;
    new seconds;
    new string[128];
    if(time > 59){
        minutes = floatround(time/60);
        seconds = floatround(time - minutes*60);
        if(seconds>9)format(string,sizeof(string),"%d:%d",minutes,seconds);
        else format(string,sizeof(string),"%d:0%d",minutes,seconds);
    }
    else{
        seconds = floatround(time);
        if(seconds>9)format(string,sizeof(string),"0:%d",seconds);
        else format(string,sizeof(string),"0:0%d",seconds);
    }
    return string;
}

// **** INVENTORY **** //

stock _GetItemNamePVar(playerid,item)
{
	new tmp[32];
	new tmp2[MAX_ITEM_NAME];
	format(tmp,32,"PITEMNAME%d",item);
	GetPVarString(playerid,tmp,tmp2,MAX_ITEM_NAME);
	return tmp2;
}

stock _SetItemNamePVar(playerid,item,ItemName[])
{
	new tmp[MAX_ITEM_NAME];
	format(tmp,MAX_ITEM_NAME,"PITEMNAME%d",item);
 	SetPVarString(playerid,tmp,ItemName);
}

stock _GetItemAmountPVar(playerid,item)
{
	new tmp[16];
	format(tmp,16,"PITEMAMOUNT%d",item);
	return GetPVarInt(playerid,tmp);
}

stock _SetItemAmountPVar(playerid,item,Amount)
{
	new tmp[16];
	format(tmp,16,"PITEMAMOUNT%d",item);
	SetPVarInt(playerid,tmp,Amount);
}

stock AddItem(playerid,ItemName[],Amount)
{
    if(!IsPlayerNPC(playerid))
    {
		new slot=-1;
		for(new item;item<MAX_ITEMS;item++)
		{
			if(!_GetItemAmountPVar(playerid,item))
			{
				if(slot==-1)slot=item;
				continue;
			}
			if(!strcmp(_GetItemNamePVar(playerid,item),ItemName,true))
			{
				_SetItemAmountPVar(playerid,item,_GetItemAmountPVar(playerid,item)+Amount);
				if(_GetItemAmountPVar(playerid,item)<=0)_SetItemAmountPVar(playerid,item,0);
				if(_GetItemAmountPVar(playerid,item)>MAX_ITEM_STACK)
				{
					_SetItemAmountPVar(playerid,item,MAX_ITEM_STACK);
					return 2;
				}
				return 1;
			}
		}
		if(slot>-1)
		{
			_SetItemNamePVar(playerid,slot,ItemName);
			_SetItemAmountPVar(playerid,slot,Amount);
			if(_GetItemAmountPVar(playerid,slot)>MAX_ITEM_STACK)
			{
				_SetItemAmountPVar(playerid,slot,MAX_ITEM_STACK);
				return 2;
			}
			return 1;
		}
	}
	return 0;
}

stock RemoveItem(playerid,ItemName[],Amount)
{
    if(!IsPlayerNPC(playerid))
    {
		for(new item;item<MAX_ITEMS;item++)
		{
			if(!_GetItemAmountPVar(playerid,item))continue;
			if(!strcmp(_GetItemNamePVar(playerid,item),ItemName,true))
			{
				_SetItemAmountPVar(playerid,item,_GetItemAmountPVar(playerid,item)-Amount);
				if(_GetItemAmountPVar(playerid,item)<=0)_SetItemAmountPVar(playerid,item,0);
				if(_GetItemAmountPVar(playerid,item)>MAX_ITEM_STACK)
				{
					_SetItemAmountPVar(playerid,item,MAX_ITEM_STACK);
					return 2;
				}
				return 1;
			}
		}
	}
	return 0;
}

stock PlayerHasItem(playerid,ItemName[])
{
	for(new item;item<MAX_ITEMS;item++)
	{
		if(!_GetItemAmountPVar(playerid,item))continue;
		if(!strcmp(_GetItemNamePVar(playerid,item),ItemName,false))return _GetItemAmountPVar(playerid,item);
	}
	return 0;
}

stock GetPlayerItemInfo(playerid,&idx,ItemName[],len=sizeof(ItemName),&Amount)
{
	if(idx>=MAX_ITEMS)return 0;
	format(ItemName,len,_GetItemNamePVar(playerid,idx));
	Amount=_GetItemAmountPVar(playerid,idx);
	idx++;
	return 1;
}

stock ResetPlayerInventory(playerid)
{
	for(new item;item<MAX_ITEMS;item++)_SetItemAmountPVar(playerid,item,0);
}

stock GetBackpackName(playerid)
{
	new str[128];
	switch(pInfo[playerid][Backpack])
	{
		case 0: str = "Coyote Patrol Pack";
		case 1: str = "Czech Vest Pouch";
		case 2: str = "Alice Pack";
		case 3: str = "Coyote Backpack";
	}
	return str;
}

stock ShowInventory(playerid)
{
	new str[180];
    if(!IsPlayerNPC(playerid))
    {
		gItemList="";
		for(new item;item<MAX_ITEMS;item++)
		{
			if(!strlen(_GetItemNamePVar(playerid,item))||!_GetItemAmountPVar(playerid,item))continue;
			format(gItemList,sizeof(gItemList),"%s\n%d\t\t%s",gItemList,_GetItemAmountPVar(playerid,item),_GetItemNamePVar(playerid,item));
		}
		format(gItemList,sizeof(gItemList),"%s",gItemList);

		format(str,sizeof(str),""COL_WHITE"%s "COL_GREEN"%i |"COL_WHITE" %i",GetBackpackName(playerid),pInfo[playerid][BackpackSlotsUsed],pInfo[playerid][BackpackSlots]);
		ShowPlayerDialog(playerid,INV_DIALOG_ID,DIALOG_STYLE_LIST,str,gItemList,"Select","Close");
	}
	return 1;
}

stock SaveInventory(playerid)
{
    if(!IsPlayerNPC(playerid))
    {
		gItemList="";
		new filename[64];
		GetPlayerName(playerid,filename,24);
		format(filename,64,""ITEM_PATH"/%s.inv",filename);
		new File:file=fopen(filename,io_write);
		for(new item;item<MAX_ITEMS;item++)
		{
			if(!strlen(_GetItemNamePVar(playerid,item))||!_GetItemAmountPVar(playerid,item))continue;
			format(gItemList,sizeof(gItemList),"%s%s\n%d\n",gItemList,_GetItemNamePVar(playerid,item),_GetItemAmountPVar(playerid,item));
		}
		fwrite(file,gItemList);
		fclose(file);
		GetPlayerName(playerid,filename,24);
		printf("[INV] %s[%d]'s inventory saved.",filename,playerid);
	}
	return 1;
}

stock LoadInventory(playerid)
{
    if(!IsPlayerNPC(playerid))
    {
		new tstring[64];
		new tstring2[24];
		GetPlayerName(playerid,tstring,48);
		format(tstring,64,""ITEM_PATH"/%s.inv",tstring);
		if(!fexist(tstring))return 0;
		new File:file=fopen(tstring,io_read);
		fread(file,tstring);
		while(tstring[0])
		{
			format(tstring,strlen(tstring),"%s",tstring); //Delete last character
			fread(file,tstring2);
			AddItem(playerid,tstring,strval(tstring2));
			fread(file,tstring);
		}
		fclose(file);
		GetPlayerName(playerid,tstring,24);
		printf("[INV] %s[%d]'s inventory loaded.",tstring,playerid);
	}
	return 1;
}

GetXYInFrontOfPlayer(playerid, &Float:x, &Float:y, Float:distance)
{
	new Float:a;
	GetPlayerPos(playerid, x, y, a);
	GetPlayerFacingAngle(playerid, a);
	if (GetPlayerVehicleID(playerid)) {
	    GetVehicleZAngle(GetPlayerVehicleID(playerid), a);
	}
	x += (distance * floatsin(-a, degrees));
	y += (distance * floatcos(-a, degrees));
}

function DestroyRoadFlare(playerid)
{
	DestroyDynamicObject(RoadFlare[playerid]);
}

public OnPlayerUseItem(playerid,ItemName[])
{
    if(!IsPlayerNPC(playerid))
    {
        if(!strcmp(ItemName,"Empty Water Bottle",true))
        {
            SendClientMessage(playerid,-1,"*"COL_RED" This item is not useable enter an area that is swimmable to refill the water bottle!");
		}
  		if(!strcmp(ItemName,"Rope",true))
        {
            SendClientMessage(playerid,-1,"*"COL_RED" Write /kidnap when you're near a player.");
		}

        if(!strcmp(ItemName,"Raw Meat",true))
        {
			SendClientMessage(playerid, -1, ""chat" You cannot eat raw food. Find some wood and Lighter to cook this!");
		}

		if(!strcmp(ItemName, "Cooked Meat",true))
		{
	 	    if(pInfo[playerid][pHunger] >= 2350) return SendClientMessage(playerid,-1,""chat" You are not hungry!");
			pInfo[playerid][pHunger] += 1250;
			pInfo[playerid][pBlood] += 2500;
			RemoveSlotToInventory(playerid,"Cooked Meat",1);
			if(!IsPlayerInAnyVehicle(playerid))
			{
				ApplyAnimation(playerid, "FOOD", "EAT_Chicken",4.1,0,1,0,1000,1);
				defer ResetAction(playerid, ACTION_ANIMATION);
			}
		}
		if(!strcmp(ItemName,"Dirty Water Bottle",true))
	 	{
	 	    if(pInfo[playerid][pThrist] >= 98) return SendClientMessage(playerid,-1,"*"COL_GREY" You are not thirsty!");
			pInfo[playerid][pThrist] -= 30;

			RemoveSlotToInventory(playerid,"Dirty Water Bottle",1);
			SendClientMessage(playerid, COLOR_RED, "You lost thirst while drinking dirty water");
			AddSlotToInventoryWorld(playerid,"Empty Water Bottle",1);
			if(!IsPlayerInAnyVehicle(playerid))
	    	{
				ApplyAnimation(playerid, "VENDING", "VEND_Drink_P",4.1,0,1,0,1000,1);
				defer ResetAction(playerid, ACTION_ANIMATION);
			}
	  	}
        if(!strcmp(ItemName,"Antibiotics",true))
        {
            if(pInfo[playerid][pInfection] == 0)
            {
				SendClientMessage(playerid, -1, "*"COL_RED" You are not infected of any sort!");
			}
			else
			{
				PlayerTextDrawSetString(playerid, LegBroken[playerid], "Broken Leg");
				PlayerTextDrawHide(playerid, LegBroken[playerid]);
				SetPlayerDrunkLevel(playerid, 0);
				KillTimer(pInfo[playerid][Bleeding]);
			    SendClientMessage(playerid, -1, ""chat" You have sucessfully used antibiotics. You have been cured. If screen still dark use painkiller!");
			}
		}

        if(!strcmp(ItemName,"Wood",true))
        {
        	if(PlayerHasItem(playerid, "Lighter"))
         	{
                DayZSA_CreateCampFire(playerid);
				if(!IsPlayerInAnyVehicle(playerid))
				{
					ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
					defer ResetAction(playerid, ACTION_ANIMATION);
				}
			}
			else SendClientMessage(playerid, -1, ""chat" You need Lighter to start a camp fire!");
		}

        if(!strcmp(ItemName,"Lighter",true))
		{
        	if(PlayerHasItem(playerid, "Wood"))
         	{
                DayZSA_CreateCampFire(playerid);
       			if(!IsPlayerInAnyVehicle(playerid))
				{
					ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
					defer ResetAction(playerid, ACTION_ANIMATION);
				}
			}
			else SendClientMessage(playerid, -1, ""chat" You need some wood to start a camp fire!");
		}

		if(!strcmp(ItemName,"Bandage",true))
	 	{
	 	    if(pInfo[playerid][IsPlayerBleeding] == 0) return SendClientMessage(playerid,-1,""chat" You are not bleeding!");
			RemovePlayerAttachedObject(playerid, 2);
	 		KillTimer(pInfo[playerid][Bleeding]);
	 		pInfo[playerid][IsPlayerBleeding] = 0;
			RemoveSlotToInventory(playerid,"Bandage",1);
			if(!IsPlayerInAnyVehicle(playerid))
			{
				ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
				defer ResetAction(playerid, ACTION_ANIMATION);
			}
	  	}

		if(!strcmp(ItemName,"Morphine",true))
	 	{
	 	    if(pInfo[playerid][IsPlayerLegBroken] == 0) return SendClientMessage(playerid,-1,""chat" Your leg is not broken!");
			PlayerTextDrawHide(playerid, LegBroken[playerid]);
	    	pInfo[playerid][IsPlayerLegBroken] = 0;
			RemoveSlotToInventory(playerid,"Morphine",1);
			if(!IsPlayerInAnyVehicle(playerid))
			{
				ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
				defer ResetAction(playerid, ACTION_ANIMATION);
			}
	  	}

		if(!strcmp(ItemName,"Can of Beans",true))
	 	{
	 	    if(pInfo[playerid][pHunger] >= 2350) return SendClientMessage(playerid,-1,""chat" You are not hungry!");
			pInfo[playerid][pHunger] += 750;
			pInfo[playerid][pBlood] += random(350);
			RemoveSlotToInventory(playerid,"Can of Beans",1);
			if(!IsPlayerInAnyVehicle(playerid))
	    	{
				ApplyAnimation(playerid, "FOOD", "EAT_Burger",4.1,0,0,0,1000,1);
				defer ResetAction(playerid, ACTION_ANIMATION);
			}
	  	}

		if(!strcmp(ItemName,"Dirty Pizza Slice",true))
	 	{
	 	    if(pInfo[playerid][pHunger] >= 2350) return SendClientMessage(playerid,-1,""chat" You are not hungry!");
			pInfo[playerid][pHunger] += 950;
			pInfo[playerid][pBlood] += random(350);
			RemoveSlotToInventory(playerid,"Dirty Pizza Slice",1);
  			if(!IsPlayerInAnyVehicle(playerid))
	    	{
				ApplyAnimation(playerid, "FOOD", "EAT_Burger",4.1,0,0,0,1000,1);
				defer ResetAction(playerid, ACTION_ANIMATION);
			}
	  	}
  		if(!strcmp(ItemName,"Flashlight",true))
        {
			if(pInfo[playerid][pFlashlight] == 0)
			{
	   			if(IsPlayerAttachedObjectSlotUsed(playerid,3)) RemovePlayerAttachedObject(playerid,3);
				if(IsPlayerAttachedObjectSlotUsed(playerid,4)) RemovePlayerAttachedObject(playerid,4);
				SetPlayerAttachedObject(playerid, 3,18656, 5, 0.1, 0.038, -0.1, -90, 180, 0, 0.03, 0.03, 0.03);
				SetPlayerAttachedObject(playerid, 4,18641, 5, 0.1, 0.02, -0.05, 0, 0, 0, 1, 1, 1);
				SendClientMessage(playerid, -1, "*"COL_GREEN" Flashlight sucessfully equipped, to turn it off /flashoff");
				pInfo[playerid][pFlashlight] = 1;
			}
			else
			{
			    SendClientMessage(playerid, -1, "*"COL_RED" Flashlight is currently on to turn it off, /flashoff");
			}
		}


        if(!strcmp(ItemName,"Orange",true))
	 	{
	 	    if(pInfo[playerid][pHunger] >= 2350) return SendClientMessage(playerid,-1,""chat" You are not hungry!");
			pInfo[playerid][pHunger] += 400;
			pInfo[playerid][pBlood] += random(350);
			RemoveSlotToInventory(playerid,"Orange",1);
  			if(!IsPlayerInAnyVehicle(playerid))
	    	{
				ApplyAnimation(playerid, "FOOD", "EAT_Burger",4.1,0,0,0,1000,1);
				defer ResetAction(playerid, ACTION_ANIMATION);
			}
	  	}
 		if(!strcmp(ItemName,"Banana",true))
	 	{
	 	    if(pInfo[playerid][pHunger] >= 2350) return SendClientMessage(playerid,-1,""chat" You are not hungry!");
			pInfo[playerid][pHunger] += 300;
			pInfo[playerid][pBlood] += random(350);
			RemoveSlotToInventory(playerid,"Banana",1);
  			if(!IsPlayerInAnyVehicle(playerid))
	    	{
				ApplyAnimation(playerid, "FOOD", "EAT_Burger",4.1,0,0,0,1000,1);
				defer ResetAction(playerid, ACTION_ANIMATION);
			}
	  	}
  		if(!strcmp(ItemName,"Tomato",true))
	 	{
	 	    if(pInfo[playerid][pHunger] >= 2350) return SendClientMessage(playerid,-1,""chat" You are not hungry!");
			pInfo[playerid][pHunger] += 400;
			pInfo[playerid][pBlood] += random(350);
			RemoveSlotToInventory(playerid,"Tomato",1);
  			if(!IsPlayerInAnyVehicle(playerid))
	    	{
				ApplyAnimation(playerid, "FOOD", "EAT_Burger",4.1,0,0,0,1000,1);
				defer ResetAction(playerid, ACTION_ANIMATION);
			}
	  	}
	  	if(!strcmp(ItemName,"Apple",true))
	 	{
	 	    if(pInfo[playerid][pHunger] >= 2350) return SendClientMessage(playerid,-1,""chat" You are not hungry!");
			pInfo[playerid][pHunger] += 400;
			pInfo[playerid][pBlood] += random(350);
			RemoveSlotToInventory(playerid,"Apple",1);
  			if(!IsPlayerInAnyVehicle(playerid))
	    	{
				ApplyAnimation(playerid, "FOOD", "EAT_Burger",4.1,0,0,0,1000,1);
				defer ResetAction(playerid, ACTION_ANIMATION);
			}
	  	}
	  	if(!strcmp(ItemName,"Packet Of Cereals",true))
	 	{
	 	    if(pInfo[playerid][pHunger] >= 2350) return SendClientMessage(playerid,-1,""chat" You are not hungry!");
			pInfo[playerid][pHunger] += 290;
			pInfo[playerid][pBlood] += random(350);
			RemoveSlotToInventory(playerid,"Packet Of Cereals",1);
  			if(!IsPlayerInAnyVehicle(playerid))
	    	{
				ApplyAnimation(playerid, "FOOD", "EAT_Burger",4.1,0,0,0,1000,1);
				defer ResetAction(playerid, ACTION_ANIMATION);
			}
	  	}
		if(!strcmp(ItemName,"Burger",true))
	 	{
	 	    if(pInfo[playerid][pHunger] >= 2350) return SendClientMessage(playerid,-1,""chat" You are not hungry!");
			pInfo[playerid][pHunger] += 600;
			pInfo[playerid][pBlood] += random(350);
			RemoveSlotToInventory(playerid,"Burger",1);
			if(!IsPlayerInAnyVehicle(playerid))
	    	{
				ApplyAnimation(playerid, "FOOD", "EAT_Burger",4.1,0,0,0,1000,1);
				defer ResetAction(playerid, ACTION_ANIMATION);
			}
	  	}

		if(!strcmp(ItemName,"Blood Bag",true))
	 	{
	 	    if(pInfo[playerid][pBlood] == 12000) return SendClientMessage(playerid,-1,""chat" You already have enough blood injected!");
			pInfo[playerid][pBlood] = 12000;
			RemoveSlotToInventory(playerid,"Blood Bag",1);
			if(!IsPlayerInAnyVehicle(playerid))
			{
				ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
				defer ResetAction(playerid, ACTION_ANIMATION);
			}
	  	}

		if(!strcmp(ItemName,"Painkiller",true))
	 	{
	 	    if(pInfo[playerid][IsPlayerDrunk] == 1)
	 	    {
				SetPlayerDrunkLevel(playerid,0);
			}

			if(pInfo[playerid][pFade] == 1)
			{
  				PlayerTextDrawHide(playerid, PlayerFade[playerid]);
				pInfo[playerid][pFade] = -1;
			}
			RemoveSlotToInventory(playerid,"Painkiller",1);
			if(!IsPlayerInAnyVehicle(playerid))
			{
				ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
				defer ResetAction(playerid, ACTION_ANIMATION);
			}
	  	}

		if(!strcmp(ItemName,"Medical Kit",true))
	 	{
			pInfo[playerid][pBlood] = 12000;
			SetPlayerDrunkLevel(playerid,0);
			if(pInfo[playerid][IsPlayerLegBroken] == 1)
			{
				PlayerTextDrawHide(playerid, LegBroken[playerid]);
	    		pInfo[playerid][IsPlayerLegBroken] = 0;
			}

			if(pInfo[playerid][IsPlayerBleeding] == 1)
			{
				RemovePlayerAttachedObject(playerid, 2);
		 		KillTimer(pInfo[playerid][Bleeding]);
		 		pInfo[playerid][IsPlayerBleeding] = 0;
			}
			RemoveSlotToInventory(playerid,"Medical Kit",1);
			if(!IsPlayerInAnyVehicle(playerid))
			{
				ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
				defer ResetAction(playerid, ACTION_ANIMATION);
			}
	  	}

	  	if(!strcmp(ItemName,"Road Flare",true))
	  	{
			//ApplyAnimation(playerid,"GRENADE","WEAPON_throwu",4.0,0,1,1,0,1,1);
			ApplyAnimation(playerid, "GRENADE", "WEAPON_throw", 4.5, 0, 1, 1, 1, 1, 1);
			SetTimerEx("ThrowFlare",4000,false,"i",playerid);
			SetTimerEx("DestroyRoadFlare",480000,false,"i",playerid);
			RemoveSlotToInventory(playerid,"Road Flare",1);
		}

		if(!strcmp(ItemName,"Whiskey Bottle",true))
		{
		    if(pInfo[playerid][IsPlayerDrunk] == 0)
		    {
		    	KillTimer(pInfo[playerid][IsPlayerDrunkTimer]);
		    	pInfo[playerid][IsPlayerDrunkTimer] = SetTimerEx("VodkaStop",60000,false,"i",playerid);
				SetPlayerDrunkLevel(playerid,8000);
				pInfo[playerid][IsPlayerDrunk] = 1;
            	//ApplyAnimation(playerid,"PED","WALK_DRUNK",4.0,1,1,1,1,1);
            	ApplyAnimation(playerid, "PED", "WALK_DRUNK", 4.0, 1, 1, 1, 1, 1, 1);
            	pInfo[playerid][pThrist] += 800;
            	pInfo[playerid][pBlood] += 800;
            	RemoveSlotToInventory(playerid,"Whiskey Bottle",1);
			}
			else return SendClientMessage(playerid,-1,"*"COL_RED" No just no.");
		}

		if(!strcmp(ItemName,"Soda Bottle",true))
	 	{
	 	    if(pInfo[playerid][pThrist] >= 980) return SendClientMessage(playerid,-1,""chat" You are not thirsty!");
			pInfo[playerid][pThrist] += 580;
			RemoveSlotToInventory(playerid,"Soda Bottle",1);
			if(!IsPlayerInAnyVehicle(playerid))
	    	{
				ApplyAnimation(playerid, "VENDING", "VEND_Drink_P",4.1,0,1,0,1000,1);
				defer ResetAction(playerid, ACTION_ANIMATION);
			}
	  	}

		if(!strcmp(ItemName,"Milk",true))
	 	{
	 	    if(pInfo[playerid][pThrist] >= 980) return SendClientMessage(playerid,-1,""chat" You are not thirsty!");
			pInfo[playerid][pThrist] += 780;
			RemoveSlotToInventory(playerid,"Milk",1);
	  	}

		if(!strcmp(ItemName,"Full Water Bottle",true))
	 	{
	 	    if(pInfo[playerid][pThrist] >= 980) return SendClientMessage(playerid,-1,""chat" You are not thirsty!");
			pInfo[playerid][pThrist] += 850;
			RemoveSlotToInventory(playerid,"Full Water Bottle",1);
			AddSlotToInventoryWorld(playerid,"Empty Water Bottle",1);
			if(!IsPlayerInAnyVehicle(playerid))
	    	{
				ApplyAnimation(playerid, "VENDING", "VEND_Drink_P",4.1,0,1,0,1000,1);
				defer ResetAction(playerid, ACTION_ANIMATION);
			}
	  	}
	    if(!strcmp(ItemName,"Fresh Juice",true))
	 	{
	 	    if(pInfo[playerid][pThrist] >= 980) return SendClientMessage(playerid,-1,""chat" You are not thirsty!");
			pInfo[playerid][pThrist] += 850;
			RemoveSlotToInventory(playerid,"Fresh Juice",1);
			if(!IsPlayerInAnyVehicle(playerid))
	    	{
				ApplyAnimation(playerid, "VENDING", "VEND_Drink_P",4.1,0,1,0,1000,1);
				defer ResetAction(playerid, ACTION_ANIMATION);
			}
	  	}
		if(!strcmp(ItemName,"Rum",true))
	 	{
	 	    if(pInfo[playerid][pThrist] >= 980) return SendClientMessage(playerid,-1,""chat" You are not thirsty!");
			pInfo[playerid][pThrist] += 850;
			RemoveSlotToInventory(playerid,"Rum",1);
			if(!IsPlayerInAnyVehicle(playerid))
	    	{
				ApplyAnimation(playerid, "VENDING", "VEND_Drink_P",4.1,0,1,0,1000,1);
				defer ResetAction(playerid, ACTION_ANIMATION);
			}
	  	}
		if(!strcmp(ItemName,"Gin",true))
	 	{
	 	    if(pInfo[playerid][pThrist] >= 980) return SendClientMessage(playerid,-1,""chat" You are not thirsty!");
			pInfo[playerid][pThrist] += 850;
			RemoveSlotToInventory(playerid,"Gin",1);
			if(!IsPlayerInAnyVehicle(playerid))
	    	{
				ApplyAnimation(playerid, "VENDING", "VEND_Drink_P",4.1,0,1,0,1000,1);
				defer ResetAction(playerid, ACTION_ANIMATION);
			}
	  	}

	  	if(!strcmp(ItemName,"SPAZ-12 Shotgun",true))
	 	{
			if(PlayerHasItem(playerid,"Shotgun Ammo"))
			{
				GivePlayerWeaponEx(playerid, 27, 15);
				RemoveSlotToInventory(playerid,"SPAZ-12 Shotgun",1);
				RemoveSlotToInventory(playerid,"Shotgun Ammo",1);
				if(!IsPlayerInAnyVehicle(playerid))
		    	{
					ApplyAnimation(playerid, "RIFLE", "RIFLE_load",4.1,0,1,0,1000,1);
					defer ResetAction(playerid, ACTION_ANIMATION);
				}
			}
			else return SendClientMessage(playerid,-1,""chat" You don't have any shotgun ammo on you!");
		}

	  	if(!strcmp(ItemName,"Pistol",true))
	 	{
	 	    if(PlayerHasItem(playerid,"Pistol Ammo"))
	 	    {
				GivePlayerWeaponEx(playerid, 22, 30);
				RemoveSlotToInventory(playerid,"Pistol",1);
				RemoveSlotToInventory(playerid,"Pistol Ammo",1);
				if(!IsPlayerInAnyVehicle(playerid))
		    	{
					ApplyAnimation(playerid, "RIFLE", "RIFLE_load",4.1,0,1,0,1000,1);
					defer ResetAction(playerid, ACTION_ANIMATION);
				}
			}
			else return SendClientMessage(playerid,-1,""chat" You don't have any pistol ammo on you!");
	  	}

		if(!strcmp(ItemName,"AK-47",true))
	 	{
			if(PlayerHasItem(playerid,"Assault Ammo"))
			{
				GivePlayerWeaponEx(playerid, 30, 35);
				RemoveSlotToInventory(playerid,"AK-47",1);
				RemoveSlotToInventory(playerid,"Assault Ammo",1);
				if(!IsPlayerInAnyVehicle(playerid))
		    	{
					ApplyAnimation(playerid, "RIFLE", "RIFLE_load",4.1,0,1,0,1000,1);
					defer ResetAction(playerid, ACTION_ANIMATION);
				}
			}
			else return SendClientMessage(playerid,-1,""chat" You don't have any assault ammo on you!");
	  	}

		if(!strcmp(ItemName,"M4",true))
	 	{
			if(PlayerHasItem(playerid,"Assault Ammo"))
			{
				GivePlayerWeaponEx(playerid, 31,60);
				RemoveSlotToInventory(playerid,"M4",1);
				RemoveSlotToInventory(playerid,"Assault Ammo",1);
				if(!IsPlayerInAnyVehicle(playerid))
		    	{
					ApplyAnimation(playerid, "RIFLE", "RIFLE_load",4.1,0,1,0,1000,1);
					defer ResetAction(playerid, ACTION_ANIMATION);
				}
			}
			else return SendClientMessage(playerid,-1,""chat" You don't have any assault ammo on you!");
		}

		if(!strcmp(ItemName,"Sniper Rifle",true))
	 	{
			if(PlayerHasItem(playerid,"Sniper Ammo"))
			{
				GivePlayerWeaponEx(playerid, 34, 15);
				RemoveSlotToInventory(playerid,"Sniper Rifle",1);
				RemoveSlotToInventory(playerid,"Sniper Ammo",1);
				if(!IsPlayerInAnyVehicle(playerid))
		    	{
					ApplyAnimation(playerid, "RIFLE", "RIFLE_load",4.1,0,1,0,1000,1);
					defer ResetAction(playerid, ACTION_ANIMATION);
				}
			}
			else return SendClientMessage(playerid,-1,""chat" You don't have any sniper ammo on you!");
		}

		if(!strcmp(ItemName,"Country Rifle",true))
	 	{
			if(PlayerHasItem(playerid,"Sniper Ammo"))
			{
				GivePlayerWeaponEx(playerid, 33, 10);
				RemoveSlotToInventory(playerid,"Country Rifle",1);
				RemoveSlotToInventory(playerid,"Sniper Ammo",1);
 				if(!IsPlayerInAnyVehicle(playerid))
		    	{
					ApplyAnimation(playerid, "RIFLE", "RIFLE_load",4.1,0,1,0,1000,1);
					defer ResetAction(playerid, ACTION_ANIMATION);
				}
			}
			else return SendClientMessage(playerid,-1,""chat" You don't have any sniper ammo on you!");
		}

		if(!strcmp(ItemName,"Shotgun",true))
	 	{
	 	    if(PlayerHasItem(playerid,"Shotgun Ammo"))
	 	    {
				GivePlayerWeaponEx(playerid, 25, 10);
				RemoveSlotToInventory(playerid,"Shotgun",1);
				RemoveSlotToInventory(playerid,"Shotgun Ammo",1);
 				if(!IsPlayerInAnyVehicle(playerid))
		    	{
					ApplyAnimation(playerid, "RIFLE", "RIFLE_load",4.1,0,1,0,1000,1);
					defer ResetAction(playerid, ACTION_ANIMATION);
				}
			}
			else return SendClientMessage(playerid,-1,""chat" You don't have any shotgun ammo on you!");
	  	}

		if(!strcmp(ItemName,"MP5",true))
	 	{
			if(PlayerHasItem(playerid,"SMG Ammo"))
			{
				GivePlayerWeaponEx(playerid, 29, 35);
				RemoveSlotToInventory(playerid,"MP5",1);
				RemoveSlotToInventory(playerid,"SMG Ammo",1);
				if(!IsPlayerInAnyVehicle(playerid))
		    	{
					ApplyAnimation(playerid, "RIFLE", "RIFLE_load",4.1,0,1,0,1000,1);
					defer ResetAction(playerid, ACTION_ANIMATION);
				}
			}
			else return SendClientMessage(playerid,-1,""chat" You don't have any SMG ammo on you!");
	  	}

		if(!strcmp(ItemName,"Silenced Pistol",true))
		{
			if(PlayerHasItem(playerid,"Pistol Ammo"))
			{
				GivePlayerWeaponEx(playerid, 23, 15);
				RemoveSlotToInventory(playerid,"Silenced Pistol",1);
				RemoveSlotToInventory(playerid,"Pistol Ammo",1);
				if(!IsPlayerInAnyVehicle(playerid))
		    	{
					ApplyAnimation(playerid, "RIFLE", "RIFLE_load",4.1,0,1,0,1000,1);
					defer ResetAction(playerid, ACTION_ANIMATION);
				}
			}
			else return SendClientMessage(playerid,-1,""chat" You don't have any pistol ammo on you!");
		}

		if(!strcmp(ItemName,"Toolbox",true))
		{
		    if(!IsPlayerInAnyVehicle(playerid))
		    {
		        if(IsPlayerInRangeOfPoint(playerid,10.0,vInfo[GetVehicleNearID(playerid)][vX],vInfo[GetVehicleNearID(playerid)][vY],vInfo[GetVehicleNearID(playerid)][vZ]))
		        {
					RepairVehicle(GetVehicleNearID(playerid));
					SetVehicleHealth(GetVehicleNearID(playerid),800.0);
					if(!IsPlayerInAnyVehicle(playerid))
					{
						ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
						defer ResetAction(playerid, ACTION_ANIMATION);
					}
				}
				else return SendClientMessage(playerid,-1,""chat" You must be near a vehicle to repair!");
			}
			else return SendClientMessage(playerid,-1,""chat" You cannot be in a vehicle to repair!");
		}

		if(!strcmp(ItemName,"Map",true))
	 	{
	 	    SendClientMessage(playerid, -1, "*"COL_RED" Press 'middle mouse button' to open/close map. A GPS unlocks the Mini-map");
	  	}

		if(!strcmp(ItemName,"GPS",true))
	 	{
   			if(pInfo[playerid][pIsMapOpened] == 1)
   			{
   				PlayerTextDrawShow(playerid, blockMap[playerid]);
				GangZoneShowForPlayer(playerid,BlockMap,0x000000FF);
	    		pInfo[playerid][pIsMapOpened] = 0;
    		}
			else
			{
				PlayerTextDrawHide(playerid, blockMap[playerid]);
	    		GangZoneHideForPlayer(playerid,BlockMap);
	    		pInfo[playerid][pIsMapOpened] = 1;
			}
		}

	  	if(!strcmp(ItemName,"Sniper Ammo",true))
	  	{
	  	    if(GetPlayerWeapon(playerid) == 34)
	  	    {
				GivePlayerWeaponEx(playerid,34,10);
				SendClientMessage(playerid,-1,""chat" Added ammo to your 'Sniper Rifle'");
				RemoveSlotToInventory(playerid,"Sniper Ammo",1);
				if(!IsPlayerInAnyVehicle(playerid))
		    	{
					ApplyAnimation(playerid, "RIFLE", "RIFLE_load",4.1,0,1,0,1000,1);
					defer ResetAction(playerid, ACTION_ANIMATION);
				}
			}

			if(GetPlayerWeapon(playerid) == 33)
			{
			    GivePlayerWeaponEx(playerid,33,15);
				SendClientMessage(playerid,-1,""chat" Added ammo to your 'Country Rifle'");
				RemoveSlotToInventory(playerid,"Sniper Ammo",1);
				if(!IsPlayerInAnyVehicle(playerid))
		    	{
					ApplyAnimation(playerid, "RIFLE", "RIFLE_load",4.1,0,1,0,1000,1);
					defer ResetAction(playerid, ACTION_ANIMATION);
				}
			}
		}

		if(!strcmp(ItemName,"Shotgun Ammo",true))
	  	{
	  	    if(GetPlayerWeapon(playerid) == 25)
	  	    {
				GivePlayerWeaponEx(playerid,25,10);
				SendClientMessage(playerid,-1,""chat" Added ammo to your 'Shotgun'");
				RemoveSlotToInventory(playerid,"Shotgun Ammo",1);
				if(!IsPlayerInAnyVehicle(playerid))
		    	{
					ApplyAnimation(playerid, "RIFLE", "RIFLE_load",4.1,0,1,0,1000,1);
					defer ResetAction(playerid, ACTION_ANIMATION);
				}
			}

			if(GetPlayerWeapon(playerid) == 27)
			{
			    GivePlayerWeaponEx(playerid,27,15);
				SendClientMessage(playerid,-1,""chat" Added ammo to your 'SPAZ-12 Shotgun'");
				RemoveSlotToInventory(playerid,"Shotgun Ammo",1);
				if(!IsPlayerInAnyVehicle(playerid))
		    	{
					ApplyAnimation(playerid, "RIFLE", "RIFLE_load",4.1,0,1,0,1000,1);
					defer ResetAction(playerid, ACTION_ANIMATION);
				}
			}
		}

		if(!strcmp(ItemName,"Pistol Ammo",true))
	  	{
	  	    if(GetPlayerWeapon(playerid) == 22)
	  	    {
				GivePlayerWeaponEx(playerid,22,30);
				SendClientMessage(playerid,-1,""chat" Added ammo to your 'Pistol'");
				RemoveSlotToInventory(playerid,"Pistol Ammo",1);
				if(!IsPlayerInAnyVehicle(playerid))
		    	{
					ApplyAnimation(playerid, "RIFLE", "RIFLE_load",4.1,0,1,0,1000,1);
					defer ResetAction(playerid, ACTION_ANIMATION);
				}
			}

			if(GetPlayerWeapon(playerid) == 23)
			{
			    GivePlayerWeaponEx(playerid,23,10);
				SendClientMessage(playerid,-1,""chat" Added ammo to your 'Silenced Pistol'");
				RemoveSlotToInventory(playerid,"Pistol Ammo",1);
				if(!IsPlayerInAnyVehicle(playerid))
		    	{
					ApplyAnimation(playerid, "RIFLE", "RIFLE_load",4.1,0,1,0,1000,1);
					defer ResetAction(playerid, ACTION_ANIMATION);
				}
			}
		}

		if(!strcmp(ItemName,"Assault Ammo",true))
	  	{
	  	    if(GetPlayerWeapon(playerid) == 30)
	  	    {
				GivePlayerWeaponEx(playerid,30,28);
				SendClientMessage(playerid,-1,""chat" Added ammo to your 'AK-47'");
				RemoveSlotToInventory(playerid,"Assault Ammo",1);
				if(!IsPlayerInAnyVehicle(playerid))
		    	{
					ApplyAnimation(playerid, "RIFLE", "RIFLE_load",4.1,0,1,0,1000,1);
					defer ResetAction(playerid, ACTION_ANIMATION);
				}
			}

			if(GetPlayerWeapon(playerid) == 31)
			{
			    GivePlayerWeaponEx(playerid,31,25);
				SendClientMessage(playerid,-1,""chat" Added ammo to your 'M4'");
				RemoveSlotToInventory(playerid,"Assault Ammo",1);
				if(!IsPlayerInAnyVehicle(playerid))
		    	{
					ApplyAnimation(playerid, "RIFLE", "RIFLE_load",4.1,0,1,0,1000,1);
					defer ResetAction(playerid, ACTION_ANIMATION);
				}
			}
		}

		if(!strcmp(ItemName,"SMG Ammo",true))
	  	{
	  	    if(GetPlayerWeapon(playerid) == 29)
	  	    {
				GivePlayerWeaponEx(playerid,29,15);
				SendClientMessage(playerid,-1,""chat" Added ammo to your 'MP5'");
				RemoveSlotToInventory(playerid,"SMG Ammo",1);
				if(!IsPlayerInAnyVehicle(playerid))
		    	{
					ApplyAnimation(playerid, "RIFLE", "RIFLE_load",4.1,0,1,0,1000,1);
					defer ResetAction(playerid, ACTION_ANIMATION);
				}
			}
		}

		if(!strcmp(ItemName,"Tent",true))
		{
			if(pInfo[playerid][pTentCreated] == 0)
			{
		    	DayZSA_CreateTent(playerid);
		    	SendClientMessage(playerid,-1,"*"COL_GREEN" Placed a tent!");
            	RemoveSlotToInventory(playerid,"Tent",1);
   				if(!IsPlayerInAnyVehicle(playerid))
				{
					ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
					defer ResetAction(playerid, ACTION_ANIMATION);
				}
			}
			else return SendClientMessage(playerid, -1, ""chat" Cannot place tent, you've already created one please destroy your old one.");
		}

		if(!strcmp(ItemName,"Army Skin",true))
		{
		    SetPlayerSkin(playerid,CIV);
			RemoveSlotToInventory(playerid,"Army Skin",1);
			RemovePlayerAttachedObject(playerid, 4);
			if(!IsPlayerInAnyVehicle(playerid))
			{
				ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
				defer ResetAction(playerid, ACTION_ANIMATION);
			}
		}

		if(!strcmp(ItemName,"Civilian Skin",true))
		{
		    SetPlayerSkin(playerid,CIVSKIN);
			RemoveSlotToInventory(playerid,"Civilian Skin",1);
			RemovePlayerAttachedObject(playerid, 4);
			if(!IsPlayerInAnyVehicle(playerid))
			{
				ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
				defer ResetAction(playerid, ACTION_ANIMATION);
			}
		}

		if(!strcmp(ItemName,"Sniper Skin",true))
		{
		    SetPlayerSkin(playerid,SNIP);
			RemoveSlotToInventory(playerid,"Sniper Skin",1);
			RemovePlayerAttachedObject(playerid, 4);
			if(!IsPlayerInAnyVehicle(playerid))
			{
				ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
				defer ResetAction(playerid, ACTION_ANIMATION);
			}
		}

		if(!strcmp(ItemName,"Katana",true))
		{
		    GivePlayerWeaponEx(playerid,8,1);
			RemoveSlotToInventory(playerid,"Katana",1);
			if(!IsPlayerInAnyVehicle(playerid))
  			{
				ApplyAnimation(playerid, "BASEBALL", "BAT_PART",4.1,0,1,0,1000,1);
				defer ResetAction(playerid, ACTION_ANIMATION);
			}
		}

		if(!strcmp(ItemName,"Baseball Bat",true))
		{
		    GivePlayerWeaponEx(playerid,5,1);
			RemoveSlotToInventory(playerid,"Baseball Bat",1);
			if(!IsPlayerInAnyVehicle(playerid))
  			{
				ApplyAnimation(playerid, "BASEBALL", "BAT_PART",4.1,0,1,0,1000,1);
				defer ResetAction(playerid, ACTION_ANIMATION);
			}
		}

		if(!strcmp(ItemName,"Binoculars",true))
		{
  		  	GivePlayerWeaponEx(playerid,43,99);
			RemoveSlotToInventory(playerid,"Binoculars",1);
			if(!IsPlayerInAnyVehicle(playerid))
  			{
				ApplyAnimation(playerid, "BASEBALL", "BAT_PART",4.1,0,1,0,1000,1);
				defer ResetAction(playerid, ACTION_ANIMATION);
			}
		}

		if(!strcmp(ItemName,"Full Jerry Can",true))
		{
		    SendClientMessage(playerid,-1,"*"COL_RED" Add the vehicle part into the vehicle gear!");
		}

		if(!strcmp(ItemName,"Engine",true))
		{
		    SendClientMessage(playerid,-1,"*"COL_RED" Add the vehicle part into the vehicle gear!");
		}

		if(!strcmp(ItemName,"Tire",true))
		{
		    SendClientMessage(playerid,-1,"*"COL_RED" Add the vehicle part into the vehicle gear!");
		}

		if(!strcmp(ItemName,"Radio Device",true))
		{
			ShowPlayerDialog(playerid,DIALOG_RADIO,DIALOG_STYLE_LIST,"DayZ - Radio Frequency","Low Frequency\nMedium Frequency\nNormal Frequency\nHigh Frequency","Change","Cancel");
		}

  		if(!strcmp(ItemName,"Heat Pack",true))
        {
			if(pInfo[playerid][pTemp] >= 99.0)
			{
            	SendClientMessage(playerid,-1,"*"COL_RED" You don't need to use any heat packs, your body is warm!");
			}
			else
			{
			    pInfo[playerid][pTemp] = 91.0;
   				if(!IsPlayerInAnyVehicle(playerid))
				{
					ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
					RemoveSlotToInventory(playerid,"Heat Pack",1);
					defer ResetAction(playerid, ACTION_ANIMATION);
				}
			}
		}

		if(!strcmp(ItemName,"Heat Pack Basic",true))
        {
			if(pInfo[playerid][pTemp] >= 99.0)
			{
            	SendClientMessage(playerid,-1,"*"COL_RED" You don't need to use any heat packs, your body is warm!");
			}
			else
			{
			    pInfo[playerid][pTemp] = 95.0;
   				if(!IsPlayerInAnyVehicle(playerid))
				{
					ApplyAnimation(playerid, "BOMBER", "BOM_Plant",4.1,0,1,0,1000,1);
					defer ResetAction(playerid, ACTION_ANIMATION);
				}
			    RemoveSlotToInventory(playerid,"Heat Pack Basic",1);
			}
		}
	}
  	return 0;
}

stock DayZSA_CreateAllVehicles()
{
	CreateVehicle(500,-1839.6999500,-1630.5999800,22.3000000,180.0000000,88,89,0); //Mesa
	CreateVehicle(500,-1983.0000000,949.7000100,45.7000000,180.0000000,88,89,0); //Mesa
	CreateVehicle(500,-702.7000100,946.9000200,12.4000000,90.0000000,88,89,0); //Mesa
	CreateVehicle(500,2426.8999000,1957.3000500,6.2000000,90.0000000,88,89,0); //Mesa
	CreateVehicle(445,1342.0000000,1980.6999500,10.8000000,0.0000000,95,10,0); //Admiral
	CreateVehicle(445,1860.0999800,-1872.1999500,13.5000000,0.0000000,95,10,0); //Admiral
	CreateVehicle(445,-2193.8000500,-2303.8000500,30.6000000,320.0000000,95,10,0); //Admiral
	CreateVehicle(471,-1960.8000500,-1601.4000200,86.5000000,240.0000000,19,69,0); //Quad
	CreateVehicle(471,-191.5000000,-247.8999900,1.0000000,319.9960000,19,69,0); //Quad
	CreateVehicle(471,648.5000000,876.9000200,-42.5000000,319.9930000,19,69,0); //Quad
	CreateVehicle(468,-85.9000000,1078.4000200,19.5000000,0.0000000,157,152,0); //Sanchez
	CreateVehicle(468,1877.8000500,1815.0999800,12.5000000,0.0000000,157,152,0); //Sanchez
	CreateVehicle(468,2173.0000000,1390.3000500,10.6000000,80.0000000,157,152,0); //Sanchez
	CreateVehicle(468,2265.1001000,15.2000000,27.2000000,79.9970000,157,152,0); //Sanchez
	CreateVehicle(468,1278.6999500,301.3999900,19.3000000,79.9970000,157,152,0); //Sanchez
	CreateVehicle(468,1960.0999800,-1627.5000000,15.7000000,329.9970000,157,152,0); //Sanchez
	CreateVehicle(468,-1673.0999800,438.5000000,6.9000000,329.9960000,157,152,0); //Sanchez
	CreateVehicle(468,-1735.8000500,1007.5999800,17.3000000,259.9960000,157,152,0); //Sanchez
	CreateVehicle(509,-1799.3000500,770.0000000,24.5000000,0.0000000,66,31,0); //Bike
	CreateVehicle(509,-2023.3000500,-96.4000000,34.8000000,0.0000000,66,31,0); //Bike
	CreateVehicle(509,-1965.0999800,120.2000000,27.3000000,0.0000000,66,31,0); //Bike
	CreateVehicle(509,-306.3999900,1039.5000000,19.3000000,270.0000000,66,31,0); //Bike
	CreateVehicle(509,-343.0000000,1537.3000500,75.2000000,180.0000000,66,31,0); //Bike
	CreateVehicle(509,1911.6999500,2315.1001000,10.4000000,180.0000000,66,31,0); //Bike
	CreateVehicle(509,2530.3000500,1456.1999500,10.4000000,180.0000000,66,31,0); //Bike
	CreateVehicle(509,1944.1999500,165.3999900,36.9000000,260.0000000,66,31,0); //Bike
	CreateVehicle(509,1320.5999800,204.3000000,19.2000000,259.9970000,66,31,0); //Bike
	CreateVehicle(509,797.5999800,-616.5999800,15.9000000,39.9970000,66,31,0); //Bike
	CreateVehicle(509,1011.2999900,-1088.0999800,23.4000000,129.9960000,66,31,0); //Bike
	CreateVehicle(604,1085.9000200,-1340.0000000,13.6000000,180.0000000,42,119,0); //Glendale
	CreateVehicle(468,166.0000000,-1955.8000500,3.5000000,0.0000000,132,4,0); //Sanchez
	CreateVehicle(604,-1108.1999500,-1638.0000000,76.3000000,270.0000000,106,122,0); //Glendale
	CreateVehicle(487,-73.8000000,-1172.3000500,5.9000000,70.0000000,39,47,0); //Maverick
	CreateVehicle(487,-1679.0999800,704.0000000,30.9000000,89.9990000,39,47,0); //Maverick
	CreateVehicle(487,186.8999900,1835.9000200,23.5000000,359.9950000,39,47,0); //Maverick
	CreateVehicle(487,364.8999900,2533.1999500,17.0000000,177.9940000,39,47,0); //Maverick
	CreateVehicle(487,894.4000200,-1376.8000500,25.3000000,183.9900000,39,47,0); //Maverick
	CreateVehicle(554,584.0000000,-1354.4000200,14.8000000,280.0000000,93,27,0); //Yosemite
	CreateVehicle(554,-31.3000000,-297.5000000,5.6000000,271.9980000,93,27,0); //Yosemite
	CreateVehicle(554,-1446.0999800,2627.5000000,56.0000000,271.9940000,93,27,0); //Yosemite
	CreateVehicle(431,-1988.3000500,145.8000000,27.8000000,0.0000000,122,117,0); //Bus
	CreateVehicle(431,1278.0999800,-1301.0000000,13.6000000,0.0000000,122,117,0); //Bus
	CreateVehicle(431,1696.6999500,1452.3000500,11.0000000,180.0000000,122,117,0); //Bus
	CreateVehicle(531,-157.3999900,2706.5000000,62.5000000,0.0000000,37,37,0); //Tractor
	CreateVehicle(531,-98.3000000,-26.9000000,3.1000000,340.0000000,37,37,0); //Tractor
	CreateVehicle(531,1057.4000200,-305.3999900,74.0000000,173.9990000,37,37,0); //Tractor
	CreateVehicle(418,1991.9000200,-1278.5000000,24.0000000,270.0000000,145,115,0); //Moonbeam
	CreateVehicle(418,2473.5000000,-1699.8000500,13.7000000,358.0000000,145,115,0); //Moonbeam
	CreateVehicle(455,2739.6999500,-2426.8999000,14.2000000,0.0000000,170,157,0); //Flatbed
	CreateVehicle(455,93.3000000,1934.4000200,18.5000000,0.0000000,170,157,0); //Flatbed
	CreateVehicle(433,-1511.0999800,477.2999900,7.8000000,90.0000000,95,10,0); //Barracks
	CreateVehicle(433,-885.9000200,1008.7000100,21.8000000,70.0000000,95,10,0); //Barracks
	CreateVehicle(542,-1949.9000200,585.9000200,35.0000000,0.0000000,71,53,0); //Clover
	CreateVehicle(542,-1649.1999500,-2235.6999500,30.0000000,0.0000000,71,53,0); //Clover
	CreateVehicle(542,1062.3000500,-1767.0000000,13.2000000,270.0000000,88,89,0); //Clover
	CreateVehicle(542,2136.8000500,1425.9000200,10.7000000,270.0000000,88,89,0); //Clover
	CreateVehicle(453,1627.5999800,570.5999800,0.0000000,90.0000000,158,164,0); //Reefer
	CreateVehicle(453,-1632.9000200,163.1000100,2.6000000,134.0000000,158,164,0); //Reefer
	CreateVehicle(473,-279.2999900,-345.6000100,0.0000000,200.0000000,158,164,0); //Dinghy
	CreateVehicle(473,510.8999900,603.5999800,0.0000000,199.9950000,158,164,0); //Dinghy
	CreateVehicle(473,724.0999800,-1501.9000200,0.0000000,199.9950000,158,164,0); //Dinghy
	CreateVehicle(484,165.2000000,632.7000100,0.0000000,200.0000000,132,137,0); //Marquis
	CreateVehicle(484,-610.0000000,1322.3000500,0.0000000,229.9950000,132,137,0); //Marquis
	CreateVehicle(484,-1466.4000200,1096.5999800,0.0000000,269.9930000,132,137,0); //Marquis
	CreateVehicle(470,-1350.4000200,460.6000100,7.3000000,0.0000000,95,10,0); //Patriot
	CreateVehicle(470,442.7000100,2221.8000500,38.1000000,110.0000000,95,10,0); //Patriot
	CreateVehicle(470,2843.3000500,899.4000200,10.9000000,39.9950000,95,10,0); //Patriot
	CreateVehicle(470,154.5000000,-317.5000000,1.7000000,351.9900000,95,10,0); //Patriot
	CreateVehicle(470,-567.9000200,-1481.6999500,10.3000000,40.0000000,95,10,0); //Patriot
	CreateVehicle(422,-377.2999900,-1441.4000200,25.8000000,0.0000000,30,46,0); //Bobcat
	CreateVehicle(422,2411.0000000,-1239.1999500,23.9000000,180.0000000,30,46,0); //Bobcat
	CreateVehicle(422,2360.8000500,-650.2000100,128.2000000,180.0000000,30,46,0); //Bobcat
	CreateVehicle(417,275.3999900,1380.5000000,10.9000000,0.0000000,-1,-1,0); //Leviathan
	CreateVehicle(511,1477.5999800,1210.5000000,12.3000000,0.0000000,100,100,0); //Beagle
	CreateVehicle(511,-1427.6999500,-949.5999800,203.3999900,270.0000000,100,100,0); //Beagle
	CreateVehicle(510,297.5000000,1397.4000200,9.6000000,0.0000000,134,68,0); //Mountain Bike
	CreateVehicle(510,1891.5000000,1592.3000500,10.4000000,130.0000000,134,68,0); //Mountain Bike
	CreateVehicle(510,2332.6001000,1390.0999800,36.1000000,359.9960000,134,68,0); //Mountain Bike
	CreateVehicle(468,1526.0000000,949.0999800,10.6000000,0.0000000,215,142,0); //Sanchez
	return 1;
}

stock UpdateVehicleParts(playerid)
{
    if(IsPlayerInAnyVehicle(playerid))
    {
		if(FOUR_TIRE(playerid) || FOUR_TIRE2(playerid))
		{
			if(vInfo[GetPlayerVehicleID(playerid)][vehicleTires] >= 5)
			{
			    vInfo[GetPlayerVehicleID(playerid)][vehicleTires] = 4;
			}
		}

		if(TWO_TIRE_VEHICLE)
		{
			if(vInfo[GetPlayerVehicleID(playerid)][vehicleTires] >= 3)
			{
			    vInfo[GetPlayerVehicleID(playerid)][vehicleTires] = 2;
			}
		}

		if(SIX_TIRE_VEHICLE)
		{
			if(vInfo[GetPlayerVehicleID(playerid)][vehicleTires] >= 7)
			{
			    vInfo[GetPlayerVehicleID(playerid)][vehicleTires] = 6;
			}
		}

		if(vInfo[GetPlayerVehicleID(playerid)][vehicleEngine] >= 2)
		{
	 		vInfo[GetPlayerVehicleID(playerid)][vehicleEngine] = 1;
		}
	}
	return 1;
}

stock GetPlayerVehicleSpeed( playerid )
{
    new
        Float:x,
        Float:y,
        Float:z,
        vel,
        vehicleid;
    vehicleid = GetPlayerVehicleID(playerid);
    GetVehicleVelocity( vehicleid, x, y, z );
    vel = floatround( floatsqroot( x*x + y*y + z*z ) * 180 );           // KM/H
//  vel = floatround( floatsqroot( x*x + y*y + z*z ) * 180 / MPH_KMH ); // Mph
    return vel;
}
stock UpdateVehicleStatus(playerid)
{
	if(IsPlayerInAnyVehicle(playerid))
	{
	    new str[128];
	    new strv[128];
    	if(FOUR_TIRE(playerid) || FOUR_TIRE2(playerid))
		{
			format(str,sizeof(str),"%i / 1~n~~n~%i / 4~n~~n~%i ~n~~n~%i KM/H",
			vInfo[GetPlayerVehicleID(playerid)][vehicleEngine],
			vInfo[GetPlayerVehicleID(playerid)][vehicleTires],
			vInfo[GetPlayerVehicleID(playerid)][vehicleFuel],
			GetPlayerVehicleSpeed(playerid));
			PlayerTextDrawSetString(playerid,vehicleInfo[playerid],str);
			PlayerTextDrawShow(playerid, vehicleInfo[playerid]);
			//PlayerTextDrawShow(playerid, VehicleBG[playerid]);
			PlayerTextDrawShow(playerid, EngineIcon[playerid]);
			PlayerTextDrawShow(playerid, SpeedIcon[playerid]);
			PlayerTextDrawShow(playerid, TireIcon[playerid]);
			PlayerTextDrawShow(playerid, FuelIcon[playerid]);
			format(strv,sizeof(strv),"%s",DayZSA_GetVehicleName(GetPlayerVehicleID(playerid)));
			PlayerTextDrawSetString(playerid,PlayerVehicleName[playerid],strv);
			PlayerTextDrawShow(playerid, PlayerVehicleName[playerid]);
		}

		if(TWO_TIRE_VEHICLE)
		{
			format(str,sizeof(str),"%i / 1~n~~n~%i / 2~n~~n~%i ~n~~n~%i KM/H",
			vInfo[GetPlayerVehicleID(playerid)][vehicleEngine],
			vInfo[GetPlayerVehicleID(playerid)][vehicleTires],
			vInfo[GetPlayerVehicleID(playerid)][vehicleFuel],
			GetPlayerVehicleSpeed(playerid));
			PlayerTextDrawSetString(playerid,vehicleInfo[playerid],str);
			PlayerTextDrawShow(playerid, vehicleInfo[playerid]);
			//PlayerTextDrawShow(playerid, VehicleBG[playerid]);
			PlayerTextDrawShow(playerid, EngineIcon[playerid]);
			PlayerTextDrawShow(playerid, SpeedIcon[playerid]);
			PlayerTextDrawShow(playerid, TireIcon[playerid]);
			PlayerTextDrawShow(playerid, FuelIcon[playerid]);
			format(strv,sizeof(strv),"%s",DayZSA_GetVehicleName(GetPlayerVehicleID(playerid)));
			PlayerTextDrawSetString(playerid,PlayerVehicleName[playerid],strv);
			PlayerTextDrawShow(playerid, PlayerVehicleName[playerid]);
		}

		if(SIX_TIRE_VEHICLE)
		{
			
			format(str,sizeof(str),"%i / 1~n~~n~%i / 6~n~~n~%i ~n~~n~%i KM/H",
			vInfo[GetPlayerVehicleID(playerid)][vehicleEngine],
			vInfo[GetPlayerVehicleID(playerid)][vehicleTires],
			vInfo[GetPlayerVehicleID(playerid)][vehicleFuel],
			GetPlayerVehicleSpeed(playerid));
			PlayerTextDrawSetString(playerid,vehicleInfo[playerid],str);
			PlayerTextDrawShow(playerid, vehicleInfo[playerid]);
			//PlayerTextDrawShow(playerid, VehicleBG[playerid]);
			PlayerTextDrawShow(playerid, EngineIcon[playerid]);
			PlayerTextDrawShow(playerid, SpeedIcon[playerid]);
			PlayerTextDrawShow(playerid, TireIcon[playerid]);
			PlayerTextDrawShow(playerid, FuelIcon[playerid]);
			format(strv,sizeof(strv),"%s",DayZSA_GetVehicleName(GetPlayerVehicleID(playerid)));
			PlayerTextDrawSetString(playerid,PlayerVehicleName[playerid],strv);
			PlayerTextDrawShow(playerid, PlayerVehicleName[playerid]);
		}

		if(NO_TIRE_VEHICLE)
		{
			
			format(str,sizeof(str),"0 / 0~n~~n~0 / 0~n~~n~0 ~n~~n~%i KM/H",
			vInfo[GetPlayerVehicleID(playerid)][vehicleEngine],
			vInfo[GetPlayerVehicleID(playerid)][vehicleTires],
			vInfo[GetPlayerVehicleID(playerid)][vehicleFuel],
			GetPlayerVehicleSpeed(playerid));
			PlayerTextDrawSetString(playerid,vehicleInfo[playerid],str);
			PlayerTextDrawShow(playerid, vehicleInfo[playerid]);
			//PlayerTextDrawShow(playerid, VehicleBG[playerid]);
			PlayerTextDrawShow(playerid, EngineIcon[playerid]);
			PlayerTextDrawShow(playerid, SpeedIcon[playerid]);
			PlayerTextDrawShow(playerid, TireIcon[playerid]);
			PlayerTextDrawShow(playerid, FuelIcon[playerid]);
			format(strv,sizeof(strv),"%s",DayZSA_GetVehicleName(GetPlayerVehicleID(playerid)));
			PlayerTextDrawSetString(playerid,PlayerVehicleName[playerid],strv);
			PlayerTextDrawShow(playerid, PlayerVehicleName[playerid]);
		}

		if(ENGINE_ONLY_VEHICLE)
		{
			format(str,sizeof(str),"%i / 1~n~~n~0 / 0~n~~n~%i ~n~~n~%i KM/H",
			vInfo[GetPlayerVehicleID(playerid)][vehicleEngine],
			vInfo[GetPlayerVehicleID(playerid)][vehicleTires],
			vInfo[GetPlayerVehicleID(playerid)][vehicleFuel],
			GetPlayerVehicleSpeed(playerid));
			PlayerTextDrawSetString(playerid,vehicleInfo[playerid],str);
			PlayerTextDrawShow(playerid, vehicleInfo[playerid]);
			//PlayerTextDrawShow(playerid, VehicleBG[playerid]);
			PlayerTextDrawShow(playerid, EngineIcon[playerid]);
			PlayerTextDrawShow(playerid, SpeedIcon[playerid]);
			PlayerTextDrawShow(playerid, TireIcon[playerid]);
			PlayerTextDrawShow(playerid, FuelIcon[playerid]);
			format(strv,sizeof(strv),"%s",DayZSA_GetVehicleName(GetPlayerVehicleID(playerid)));
			PlayerTextDrawSetString(playerid,PlayerVehicleName[playerid],strv);
			PlayerTextDrawShow(playerid, PlayerVehicleName[playerid]);
		}
	}

	new i = GetPlayerVehicleID(playerid);
	if(vInfo[i][vehicleFuel] == 0)
	{
		SetVehicleParamsEx(GetPlayerVehicleID(playerid),0,lights,alarm,doors,bonnet,boot,objective);
	}

	if(vInfo[i][vehicleEngine] == 0)
	{
		SetVehicleParamsEx(GetPlayerVehicleID(playerid),0,lights,alarm,doors,bonnet,boot,objective);
	}


	if(vInfo[GetPlayerVehicleID(playerid)][vehicleFuel] >= 101)
	{
	    vInfo[GetPlayerVehicleID(playerid)][vehicleFuel] = 100;
	}
	return 1;
}

stock StartVehicle(playerid)
{
	new i = GetPlayerVehicleID(playerid);
	GetVehicleParamsEx(GetPlayerVehicleID(playerid),engine,lights,alarm,doors,bonnet,boot,objective);
	if(FOUR_TIRE(playerid) || FOUR_TIRE2(playerid))
	{
		if(vInfo[i][vehicleFuel] >= 1)
		{
			if(vInfo[i][vehicleTires] == 4)
			{
				if(vInfo[i][vehicleEngine] == 1)
				{
					SetVehicleParamsEx(GetPlayerVehicleID(playerid),1,lights,alarm,doors,bonnet,boot,objective);
				}
			}
		}

		if(vInfo[i][vehicleTires] <= 3)
		{
			SetVehicleParamsEx(GetPlayerVehicleID(playerid),0,lights,alarm,doors,bonnet,boot,objective);
		}
	}

	if(TWO_TIRE_VEHICLE)
	{
		if(vInfo[i][vehicleFuel] >= 1)
		{
			if(vInfo[i][vehicleTires] == 2)
			{
				if(vInfo[i][vehicleEngine] == 1)
				{
					SetVehicleParamsEx(GetPlayerVehicleID(playerid),1,lights,alarm,doors,bonnet,boot,objective);
				}
			}
		}

		if(vInfo[i][vehicleTires] <= 1)
		{
			SetVehicleParamsEx(GetPlayerVehicleID(playerid),0,lights,alarm,doors,bonnet,boot,objective);
		}
	}

	if(SIX_TIRE_VEHICLE)
	{
		if(vInfo[i][vehicleFuel] >= 1)
		{
			if(vInfo[i][vehicleTires] == 6)
			{
				if(vInfo[i][vehicleEngine] == 1)
				{
					SetVehicleParamsEx(GetPlayerVehicleID(playerid),1,lights,alarm,doors,bonnet,boot,objective);
				}
			}
		}

		if(vInfo[i][vehicleTires] <= 5)
		{
			SetVehicleParamsEx(GetPlayerVehicleID(playerid),0,lights,alarm,doors,bonnet,boot,objective);
		}
	}

	if(ENGINE_ONLY_VEHICLE)
	{
	    if(vInfo[i][vehicleFuel] >= 1)
	    {
	        if(vInfo[i][vehicleEngine] == 1)
	        {
 	           SetVehicleParamsEx(GetPlayerVehicleID(playerid),1,lights,alarm,doors,bonnet,boot,objective);
	        }
		 }
	}

	if(NO_TIRE_VEHICLE)
	{
	    SetVehicleParamsEx(GetPlayerVehicleID(playerid),1,lights,alarm,doors,bonnet,boot,objective);
	}
	return 1;
}

stock Float:GetVehicleSpeed(vehicleid,UseMPH = 0)
{
    new Float:speed_x,Float:speed_y,Float:speed_z,Float:temp_speed;
    GetVehicleVelocity(vehicleid,speed_x,speed_y,speed_z);
    if(UseMPH == 0)
    {
        temp_speed = floatsqroot(((speed_x*speed_x)+(speed_y*speed_y))+(speed_z*speed_z))*136.666667;
    } else {
        temp_speed = floatsqroot(((speed_x*speed_x)+(speed_y*speed_y))+(speed_z*speed_z))*85.4166672;
    }
    floatround(temp_speed,floatround_round);return temp_speed;
}

stock CheckVehicleStatusGlobal(playerid)
{
	if(IsPlayerInAnyVehicle(playerid))
	{
		new i = GetPlayerVehicleID(playerid);
		GetVehicleParamsEx(GetPlayerVehicleID(playerid),engine,lights,alarm,doors,bonnet,boot,objective);
		if(FOUR_TIRE(playerid) || FOUR_TIRE2(playerid))
		{
			if(vInfo[i][vehicleFuel] >= 1)
			{
				if(vInfo[i][vehicleTires] == 4)
				{
					if(vInfo[i][vehicleEngine] == 1)
					{
					    if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
					    {
					        if(GetVehicleSpeed(GetPlayerVehicleID(playerid), 1) >= 5)
					        {
								vInfo[i][vehicleFuel]--;
							}
						}
					}
				}
			}
		}

		if(TWO_TIRE_VEHICLE)
		{
			if(vInfo[i][vehicleFuel] >= 1)
			{
				if(vInfo[i][vehicleTires] == 2)
				{
					if(vInfo[i][vehicleEngine] == 1)
					{
	    				if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
					    {
					        if(GetVehicleSpeed(GetPlayerVehicleID(playerid), 1) >= 5)
					        {
								vInfo[i][vehicleFuel]--;
							}
						}
					}
				}
			}
		}

		if(SIX_TIRE_VEHICLE)
		{
			if(vInfo[i][vehicleFuel] >= 1)
			{
				if(vInfo[i][vehicleTires] == 6)
				{
					if(vInfo[i][vehicleEngine] == 1)
					{
	    				if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
					    {
					        if(GetVehicleSpeed(GetPlayerVehicleID(playerid), 1) >= 5)
					        {
								vInfo[i][vehicleFuel]--;
							}
						}
					}
				}
			}
		}

		if(ENGINE_ONLY_VEHICLE)
		{
		    if(vInfo[i][vehicleFuel] >= 1)
		    {
		        if(vInfo[i][vehicleEngine] == 1)
		        {
		    		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		    		{
        				if(GetVehicleSpeed(GetPlayerVehicleID(playerid), 1) >= 5)
        				{
							vInfo[i][vehicleFuel]--;
						}
					}
				}
			}
		}
	}
	return 1;
}

stock CreateBases()
{
	// ** ADDITONAL MAPPING BY ALDENJ ** //

	CreateDynamicObject(13591,2124.3999000,957.4000200,10.3000000,0.0000000,0.0000000,0.0000000); //object(kickcar28)(1)
	CreateDynamicObject(13591,268.2999900,2534.3000500,16.3000000,0.0000000,0.0000000,0.0000000); //object(kickcar28)(2)
	CreateDynamicObject(3399,182.7000000,1822.1999500,18.2000000,0.0000000,338.0000000,90.0000000); //object(cxrf_a51_stairs)(1)
	CreateDynamicObject(1225,-1479.0000000,454.2999900,6.6000000,0.0000000,0.0000000,0.0000000); //object(barrel4)(1)
	CreateDynamicObject(1225,-1559.1999500,538.2000100,6.4000000,0.0000000,0.0000000,0.0000000); //object(barrel4)(2)
	CreateDynamicObject(2780,-1671.5999800,451.7999900,2.7000000,0.0000000,0.0000000,0.0000000); //object(cj_smoke_mach)(1)
	CreateDynamicObject(2985,-1524.5999800,485.1000100,9.6000000,0.0000000,0.0000000,140.0000000); //object(minigun_base)(1)
	CreateDynamicObject(2921,-1525.9000200,482.7000100,9.2000000,0.0000000,0.0000000,0.0000000); //object(kmb_cam)(1)
	CreateDynamicObject(2899,-1529.6999500,481.0000000,6.3000000,0.0000000,0.0000000,90.0000000); //object(temp_stinger2)(1)
	CreateDynamicObject(3794,-1537.8000500,480.6000100,6.8000000,0.0000000,0.0000000,0.0000000); //object(missile_07_sfxr)(1)
	CreateDynamicObject(16644,-1652.5999800,434.2000100,6.3000000,0.0000000,0.0000000,0.0000000); //object(a51_ventsouth)(1)

	/*
	Objects converted: 11
	Vehicles converted: 0
	Vehicle models found: 0
	----------------------
	In the time this conversion took to finish the US national debt has risen by about $214.97!
	*/


	// ** ISLAND BY [pGA]Cold ** //
	CreateVehicle(468,-5058.1000977,-2700.8999023,3.4000001,202.0000000,-1,-1,0); //Sanchez
	CreateDynamicObject(17083,-4992.7998047,-2682.5996094,38.2000008,359.5001221,358.7365723,283.2330322); //object(cuntwland08b) (1)
	CreateDynamicObject(17090,-4879.7001953,-2948.0000000,35.4000015,0.0000000,359.2419434,282.7276611); //object(cuntwland16b) (1)
	CreateDynamicObject(17098,-4811.2001953,-3110.3994141,15.0000000,355.7427979,357.7423096,329.8205566); //object(cuntwland24b) (1)
	CreateDynamicObject(17098,-4938.3994141,-3133.0996094,12.3999996,1.2448120,354.7487793,321.6107178); //object(cuntwland24b) (2)
	CreateDynamicObject(17091,-4654.8994141,-2879.3994141,28.2999992,0.0000000,359.2419434,282.7276611); //object(cuntwland17_de) (1)
	CreateDynamicObject(17082,-4649.0000000,-2541.0000000,-13.1999998,0.0000000,358.7475586,283.2468262); //object(cuntwland07b) (2)
	CreateDynamicObject(17098,-4689.7998047,-3077.8994141,14.1999998,355.7482910,357.7423096,319.8315430); //object(cuntwland24b) (1)
	CreateDynamicObject(17098,-4555.0000000,-3040.6992188,17.3999996,355.7427979,357.7423096,319.8229980); //object(cuntwland24b) (1)
	CreateDynamicObject(17098,-4506.2001953,-2964.6992188,4.9000001,355.7427979,357.7423096,49.8284912); //object(cuntwland24b) (1)
	CreateDynamicObject(17098,-5100.7998047,-3021.8000488,13.8000002,1.2367249,352.7480469,297.6516113); //object(cuntwland24b) (2)
	CreateDynamicObject(17098,-5102.2001953,-2896.3994141,21.1000004,5.4821777,357.7368164,198.4570312); //object(cuntwland24b) (1)
	CreateDynamicObject(3418,-4875.5000000,-2948.0000000,34.5999985,0.0000000,0.0000000,59.9743652); //object(ce_oldhut02) (1)
	CreateDynamicObject(3415,-4877.0996094,-2967.3994141,32.9000015,0.0000000,0.0000000,115.9991455); //object(ce_loghut1) (1)
	CreateDynamicObject(3414,-4842.0000000,-2989.3994141,35.4000015,0.0000000,0.0000000,189.9975586); //object(ce_oldhut1) (1)
	CreateDynamicObject(1463,-4846.3999023,-2962.8999023,33.0999985,0.0000000,0.0000000,0.0000000); //object(dyn_woodpile2) (1)
	CreateDynamicObject(1463,-4848.3999023,-2962.8999023,33.0999985,0.0000000,0.0000000,0.0000000); //object(dyn_woodpile2) (2)
	CreateDynamicObject(1463,-4847.3999023,-2963.8000488,33.0999985,0.0000000,0.0000000,0.0000000); //object(dyn_woodpile2) (3)
	CreateDynamicObject(1463,-4847.2998047,-2961.8999023,33.0999985,0.0000000,0.0000000,0.0000000); //object(dyn_woodpile2) (4)
	CreateDynamicObject(1463,-4847.2001953,-2962.7998047,33.7000008,0.0000000,0.0000000,0.0000000); //object(dyn_woodpile2) (5)
	CreateDynamicObject(3461,-4847.3999023,-2962.8000488,32.2000008,0.0000000,0.0000000,0.0000000); //object(tikitorch01_lvs) (1)
	CreateDynamicObject(3461,-4847.2998047,-2963.6000977,31.7000008,0.0000000,0.0000000,0.0000000); //object(tikitorch01_lvs) (2)
	CreateDynamicObject(3461,-4847.1000977,-2962.1000977,31.7999992,0.0000000,0.0000000,0.0000000); //object(tikitorch01_lvs) (3)
	CreateDynamicObject(3461,-4846.2998047,-2962.8999023,31.3999996,0.0000000,0.0000000,0.0000000); //object(tikitorch01_lvs) (4)
	CreateDynamicObject(3461,-4848.2998047,-2963.0996094,31.2000008,0.0000000,0.0000000,0.0000000); //object(tikitorch01_lvs) (5)
	CreateDynamicObject(3414,-4726.8999023,-2651.3999023,102.1999969,0.0000000,0.0000000,327.9969482); //object(ce_oldhut1) (2)
	CreateDynamicObject(3425,-4831.8999023,-3003.8000488,44.7999992,0.0000000,0.0000000,7.7500000); //object(nt_windmill) (1)
	CreateDynamicObject(3286,-4884.7998047,-2988.5996094,38.0000000,0.0000000,0.0000000,13.2495117); //object(cxrf_watertwr) (1)
	CreateDynamicObject(3403,-4865.0000000,-2983.3994141,36.0999985,0.0000000,0.0000000,325.9973145); //object(sw_logcover) (1)
	CreateDynamicObject(13206,-4781.7001953,-2963.1999512,33.0000000,0.0000000,0.0000000,54.0000000); //object(cetruth_barn02) (1)
	CreateDynamicObject(17039,-4788.7998047,-2934.8994141,32.5999985,0.0000000,0.0000000,317.9937744); //object(cuntw_weebarn1_) (1)
	CreateDynamicObject(3415,-4809.7001953,-2932.6992188,32.5000000,0.0000000,0.0000000,11.9970703); //object(ce_loghut1) (2)
	CreateDynamicObject(3415,-4796.8994141,-2974.2998047,33.0999985,0.0000000,0.0000000,191.9970551); //object(ce_loghut1) (3)
	CreateDynamicObject(1463,-4801.2001953,-2953.3000488,33.0999985,0.0000000,0.0000000,0.0000000); //object(dyn_woodpile2) (7)
	CreateDynamicObject(1463,-4800.7998047,-2954.6000977,33.0999985,0.0000000,0.0000000,0.0000000); //object(dyn_woodpile2) (8)
	CreateDynamicObject(1463,-4802.2998047,-2953.6999512,33.0999985,0.0000000,0.0000000,0.0000000); //object(dyn_woodpile2) (9)
	CreateDynamicObject(3461,-4801.1000977,-2953.3999023,31.5000000,0.0000000,0.0000000,0.0000000); //object(tikitorch01_lvs) (6)
	CreateDynamicObject(3461,-4802.2001953,-2953.7998047,31.7000008,0.0000000,0.0000000,0.0000000); //object(tikitorch01_lvs) (7)
	CreateDynamicObject(3461,-4800.7998047,-2954.6992188,31.6000004,0.0000000,0.0000000,0.0000000); //object(tikitorch01_lvs) (8)
	CreateDynamicObject(791,-4762.1000977,-3093.8000488,30.7000008,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (1)
	CreateDynamicObject(791,-4722.6000977,-3081.6999512,35.7000008,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (2)
	CreateDynamicObject(791,-4729.8999023,-3130.1000977,34.7000008,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (3)
	CreateDynamicObject(791,-4663.8999023,-3128.6000977,35.4000015,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (4)
	CreateDynamicObject(791,-4650.0000000,-3078.3999023,35.2000008,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (5)
	CreateDynamicObject(791,-4672.2001953,-3046.6000977,34.5000000,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (6)
	CreateDynamicObject(791,-4616.7998047,-3131.8999023,25.7000008,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (7)
	CreateDynamicObject(791,-4605.8999023,-3069.3999023,26.6000004,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (8)
	CreateDynamicObject(791,-4569.8999023,-3105.8000488,33.5999985,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (9)
	CreateDynamicObject(791,-4507.5000000,-3069.6000977,33.7000008,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (10)
	CreateDynamicObject(791,-4454.8999023,-3057.3999023,34.5000000,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (11)
	CreateDynamicObject(791,-4448.7998047,-3018.8000488,20.0000000,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (12)
	CreateDynamicObject(791,-4497.3999023,-3023.6999512,34.0999985,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (13)
	CreateDynamicObject(791,-4542.8999023,-3016.0000000,47.2999992,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (14)
	CreateDynamicObject(791,-4584.2998047,-3018.6999512,40.7999992,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (15)
	CreateDynamicObject(791,-4801.5000000,-3151.3000488,40.0999985,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (16)
	CreateDynamicObject(791,-4812.2998047,-3090.3999023,39.7999992,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (17)
	CreateDynamicObject(791,-4847.6000977,-3118.6999512,36.2000008,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (18)
	CreateDynamicObject(791,-4850.5000000,-3175.8999023,32.0000000,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (19)
	CreateDynamicObject(791,-4905.5000000,-3161.1999512,29.2999992,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (20)
	CreateDynamicObject(791,-4897.2998047,-3114.1000977,34.0999985,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (21)
	CreateDynamicObject(791,-4947.2998047,-3105.5000000,48.5999985,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (22)
	CreateDynamicObject(791,-4947.6000977,-3137.6999512,31.2000008,0.0000000,0.0000000,24.0000000); //object(vbg_fir_copse) (23)
	CreateDynamicObject(791,-5061.0000000,-2999.5000000,43.4000015,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (24)
	CreateDynamicObject(791,-5026.3999023,-3037.6999512,38.7999992,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (25)
	CreateDynamicObject(791,-5000.3999023,-3101.8000488,44.7999992,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (26)
	CreateDynamicObject(791,-4986.2001953,-3058.0000000,40.7000008,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (27)
	CreateDynamicObject(791,-5034.7001953,-3080.3000488,42.4000015,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (28)
	CreateDynamicObject(791,-5109.6000977,-3000.5000000,36.5999985,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (29)
	CreateDynamicObject(791,-5082.7998047,-3034.5000000,31.5000000,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (30)
	CreateDynamicObject(791,-5066.5000000,-3069.5000000,31.3999996,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (31)
	CreateDynamicObject(791,-5136.7998047,-3013.8000488,29.6000004,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (32)
	CreateDynamicObject(791,-5179.2998047,-3012.6999512,32.4000015,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (33)
	CreateDynamicObject(791,-5214.1000977,-2988.1999512,40.4000015,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (34)
	CreateDynamicObject(791,-5077.7998047,-2935.0000000,53.0000000,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (35)
	CreateDynamicObject(791,-5083.2998047,-2886.3000488,42.7999992,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (36)
	CreateDynamicObject(791,-5127.7998047,-2928.3000488,36.2000008,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (37)
	CreateDynamicObject(791,-5153.0000000,-2960.8999023,37.7999992,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (38)
	CreateDynamicObject(791,-5198.3999023,-2951.5000000,36.0000000,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (39)
	CreateDynamicObject(791,-5175.2001953,-2916.1999512,32.9000015,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (40)
	CreateDynamicObject(791,-5130.5000000,-2884.8000488,35.7999992,0.0000000,0.0000000,358.0000000); //object(vbg_fir_copse) (41)
	CreateDynamicObject(791,-4558.8999023,-3060.1999512,38.2000008,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (42)
	CreateDynamicObject(791,-4515.1000977,-2952.3000488,27.6000004,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (43)
	CreateDynamicObject(791,-4490.7001953,-2921.8999023,20.2999992,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (44)
	CreateDynamicObject(791,-4488.8999023,-2877.3999023,24.0000000,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (45)
	CreateDynamicObject(791,-4489.2001953,-2840.1000977,21.2000008,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (46)
	CreateDynamicObject(791,-4536.6000977,-2871.3000488,16.1000004,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (47)
	CreateDynamicObject(791,-4527.8999023,-2908.6000977,21.2000008,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (48)
	CreateDynamicObject(791,-4544.1000977,-2947.5000000,33.2999992,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (49)
	CreateDynamicObject(791,-4474.1000977,-2962.1999512,13.1999998,0.0000000,0.0000000,84.0000000); //object(vbg_fir_copse) (50)
	CreateDynamicObject(791,-4456.0000000,-2898.1999512,16.7000008,0.0000000,0.0000000,83.9959717); //object(vbg_fir_copse) (51)
	CreateDynamicObject(791,-4455.2001953,-2839.3999023,23.6000004,0.0000000,0.0000000,12.0000000); //object(vbg_fir_copse) (52)
	CreateDynamicObject(791,-4872.7001953,-2844.6000977,54.5999985,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (53)
	CreateDynamicObject(791,-4828.5000000,-2844.6999512,59.7999992,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (54)
	CreateDynamicObject(791,-4787.0000000,-2832.6000977,56.9000015,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (55)
	CreateDynamicObject(791,-4744.1000977,-2828.8000488,57.9000015,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (56)
	CreateDynamicObject(791,-4704.8999023,-2826.6999512,57.7000008,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (57)
	CreateDynamicObject(791,-4722.2001953,-2846.1000977,52.4000015,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (58)
	CreateDynamicObject(791,-4674.3999023,-2835.5000000,55.0000000,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (59)
	CreateDynamicObject(791,-4636.5000000,-2822.1000977,46.2999992,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (60)
	CreateDynamicObject(791,-4625.5000000,-2788.5000000,49.2999992,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (61)
	CreateDynamicObject(791,-4634.2998047,-2741.8000488,42.2000008,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (62)
	CreateDynamicObject(791,-4664.7001953,-2774.5000000,71.6999969,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (63)
	CreateDynamicObject(791,-4711.2998047,-2767.8999023,82.0999985,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (64)
	CreateDynamicObject(791,-4751.5000000,-2781.0000000,76.6999969,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (65)
	CreateDynamicObject(791,-4792.7001953,-2787.1000977,73.4000015,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (66)
	CreateDynamicObject(791,-4852.2998047,-2793.8999023,68.1999969,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (67)
	CreateDynamicObject(791,-4864.0000000,-2740.5000000,55.4000015,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (68)
	CreateDynamicObject(791,-4812.1000977,-2737.1999512,61.0000000,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (69)
	CreateDynamicObject(791,-4766.6000977,-2712.3999023,69.4000015,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (70)
	CreateDynamicObject(791,-4705.3999023,-2715.8000488,94.5999985,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (71)
	CreateDynamicObject(791,-4705.2998047,-2678.0000000,93.4000015,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (72)
	CreateDynamicObject(791,-4846.2998047,-2694.5000000,64.1999969,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (73)
	CreateDynamicObject(791,-4841.3999023,-2650.1000977,59.9000015,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (74)
	CreateDynamicObject(791,-4792.8999023,-2674.5000000,64.5000000,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (75)
	CreateDynamicObject(791,-4757.6000977,-2614.1000977,83.4000015,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (76)
	CreateDynamicObject(791,-4713.7001953,-2604.1999512,97.0999985,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (77)
	CreateDynamicObject(791,-4691.2001953,-2628.6999512,84.4000015,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (78)
	CreateDynamicObject(791,-4700.5000000,-2574.8999023,77.4000015,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (79)
	CreateDynamicObject(791,-4722.7998047,-2535.1999512,75.5999985,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (80)
	CreateDynamicObject(791,-4753.2998047,-2579.6000977,70.4000015,0.0000000,0.0000000,0.0000000); //object(vbg_fir_copse) (81)
	CreateDynamicObject(791,-4822.6000977,-2584.1999512,40.9000015,0.0000000,0.0000000,37.9962158); //object(vbg_fir_copse) (82)
	CreateDynamicObject(3415,-4645.1000977,-2967.0000000,33.2999992,0.0000000,0.0000000,247.9970856); //object(ce_loghut1) (4)
	CreateDynamicObject(3414,-4681.5996094,-2983.5000000,35.5999985,0.0000000,0.0000000,189.9975586); //object(ce_oldhut1) (3)
	CreateDynamicObject(3415,-4664.5000000,-2912.1999512,32.5999985,0.0000000,0.0000000,11.9970703); //object(ce_loghut1) (5)
	CreateDynamicObject(3286,-4639.5000000,-2905.3000488,37.2999992,0.0000000,0.0000000,13.2495117); //object(cxrf_watertwr) (2)
	CreateDynamicObject(3286,-4638.2001953,-2911.3000488,37.4000015,0.0000000,0.0000000,13.2495117); //object(cxrf_watertwr) (3)
	CreateDynamicObject(3402,-4730.2001953,-2903.8000488,32.5999985,0.0000000,0.0000000,10.4941406); //object(sw_tempbarn01) (1)
	CreateDynamicObject(3402,-4740.2001953,-2980.1000977,33.2000008,0.0000000,0.0000000,282.7496338); //object(sw_tempbarn01) (2)
	CreateDynamicObject(3419,-4705.0996094,-2962.6992188,33.0999985,0.0000000,0.0000000,55.9973145); //object(ce_logbarn02) (1)
	CreateDynamicObject(12917,-4713.2998047,-3005.1999512,33.5999985,0.0000000,0.0000000,19.5000000); //object(sw_haypile03) (1)
	CreateDynamicObject(12917,-4698.5000000,-2999.1999512,33.5999985,0.0000000,0.0000000,19.4952393); //object(sw_haypile03) (2)
	CreateDynamicObject(12917,-4710.5000000,-2993.6992188,33.5000000,0.0000000,0.0000000,19.4952393); //object(sw_haypile03) (3)
	CreateDynamicObject(13206,-4700.6000977,-2918.1999512,32.5000000,0.0000000,0.0000000,14.0000000); //object(cetruth_barn02) (2)
	CreateDynamicObject(17324,-4637.0000000,-2934.6999512,32.9000015,0.0000000,0.0000000,280.7500000); //object(cw_combbarn) (1)
	CreateDynamicObject(3425,-4634.5000000,-2952.5000000,44.5999985,0.0000000,0.0000000,97.2453613); //object(nt_windmill) (2)
	CreateDynamicObject(3402,-4642.1000977,-2994.6999512,33.7999992,0.0000000,0.0000000,162.7496338); //object(sw_tempbarn01) (3)
	CreateDynamicObject(1463,-4742.6000977,-2994.8000488,33.7000008,0.0000000,0.0000000,0.0000000); //object(dyn_woodpile2) (18)
	CreateDynamicObject(1463,-4743.2001953,-2992.5000000,33.7000008,0.0000000,0.0000000,0.0000000); //object(dyn_woodpile2) (19)
	CreateDynamicObject(1463,-4743.7001953,-2989.6999512,33.7000008,0.0000000,0.0000000,0.0000000); //object(dyn_woodpile2) (20)
	CreateDynamicObject(1463,-4744.3999023,-2986.8999023,33.5999985,0.0000000,0.0000000,0.0000000); //object(dyn_woodpile2) (21)
	CreateDynamicObject(1463,-4745.6000977,-2982.6000977,33.5999985,0.0000000,0.0000000,0.0000000); //object(dyn_woodpile2) (22)
	CreateDynamicObject(1463,-4746.7998047,-2979.8999023,33.5000000,0.0000000,0.0000000,0.0000000); //object(dyn_woodpile2) (23)
	CreateDynamicObject(1463,-4747.2998047,-2976.8000488,33.5000000,0.0000000,0.0000000,0.0000000); //object(dyn_woodpile2) (24)
	CreateDynamicObject(13369,-4778.3999023,-3027.5000000,35.5000000,0.0000000,358.0000000,0.0000000); //object(sw_logs07) (1)
	CreateDynamicObject(13369,-4779.8999023,-3032.0000000,36.0999985,0.0000000,357.9949951,0.0000000); //object(sw_logs07) (5)
	CreateDynamicObject(13369,-4779.6000977,-3034.3000488,38.2999992,0.0000000,357.9949951,0.0000000); //object(sw_logs07) (6)
	CreateDynamicObject(13369,-4780.2998047,-3028.1992188,38.2000008,0.0000000,357.9895020,0.0000000); //object(sw_logs07) (7)
	CreateDynamicObject(1463,-4689.3999023,-2944.5000000,33.2000008,0.0000000,0.0000000,0.0000000); //object(dyn_woodpile2) (25)
	CreateDynamicObject(1463,-4687.6000977,-2943.6000977,33.2000008,0.0000000,0.0000000,0.0000000); //object(dyn_woodpile2) (26)
	CreateDynamicObject(1463,-4687.6000977,-2945.1000977,33.2000008,0.0000000,0.0000000,0.0000000); //object(dyn_woodpile2) (27)
	CreateDynamicObject(1463,-4686.2001953,-2944.3999023,33.2000008,0.0000000,0.0000000,0.0000000); //object(dyn_woodpile2) (28)
	CreateDynamicObject(1463,-4688.7001953,-2943.6000977,33.2000008,0.0000000,0.0000000,0.0000000); //object(dyn_woodpile2) (29)
	CreateDynamicObject(1463,-4688.8999023,-2945.3000488,33.5000000,0.0000000,0.0000000,0.0000000); //object(dyn_woodpile2) (30)
	CreateDynamicObject(1463,-4686.7001953,-2945.1999512,33.7999992,0.0000000,0.0000000,0.0000000); //object(dyn_woodpile2) (31)
	CreateDynamicObject(1463,-4686.8999023,-2943.5000000,33.7999992,0.0000000,0.0000000,0.0000000); //object(dyn_woodpile2) (32)
	CreateDynamicObject(1463,-4688.1000977,-2944.6000977,33.7000008,0.0000000,0.0000000,0.0000000); //object(dyn_woodpile2) (33)
	CreateDynamicObject(17026,-5032.8999023,-2839.3000488,24.5000000,340.0000000,0.0000000,281.9970703); //object(cunt_rockgp2_) (1)
	CreateDynamicObject(17026,-5068.7998047,-2849.6000977,41.2999992,0.0000000,0.0000000,83.9970703); //object(cunt_rockgp2_) (2)
	CreateDynamicObject(17026,-5068.1000977,-2868.1999512,38.9000015,0.0000000,0.0000000,83.9959717); //object(cunt_rockgp2_) (3)
	CreateDynamicObject(17026,-4856.3999023,-2608.6999512,35.5999985,15.6673584,336.5794678,292.6660156); //object(cunt_rockgp2_) (4)
	CreateDynamicObject(17026,-4609.5996094,-2857.2998047,27.8999996,358.0114746,7.9925537,4.2626953); //object(cunt_rockgp2_) (5)
	CreateDynamicObject(17026,-4585.0996094,-2899.2998047,21.3999996,358.0114746,7.9925537,354.2651367); //object(cunt_rockgp2_) (6)
	CreateDynamicObject(3279,-4906.8999023,-2934.1999512,31.3999996,0.0000000,0.0000000,97.9999695); //object(a51_spottower) (1)
	CreateDynamicObject(3279,-4864.5996094,-2903.0996094,31.3999996,0.0000000,0.0000000,179.9945068); //object(a51_spottower) (2)
	CreateDynamicObject(14875,-4733.0000000,-2991.6999512,34.2000008,0.0000000,0.0000000,0.0000000); //object(kylie_hay1) (4)
	CreateDynamicObject(14875,-4734.8999023,-2983.0000000,34.0999985,0.0000000,0.0000000,0.0000000); //object(kylie_hay1) (5)
	CreateDynamicObject(14875,-4735.7001953,-2979.3999023,34.0000000,0.0000000,0.0000000,0.0000000); //object(kylie_hay1) (6)
	CreateDynamicObject(14875,-4736.2001953,-2975.1999512,34.0000000,0.0000000,0.0000000,0.0000000); //object(kylie_hay1) (7)
	CreateDynamicObject(17026,-4573.2998047,-2942.5996094,28.0000000,357.9895020,1.9940186,332.0562744); //object(cunt_rockgp2_) (5)
	CreateDynamicObject(615,-4780.7998047,-2947.7998047,32.7999992,0.0000000,0.0000000,0.0000000); //object(veg_tree3) (1)
	CreateDynamicObject(615,-4880.7998047,-2961.0000000,32.7000008,0.0000000,0.0000000,0.0000000); //object(veg_tree3) (2)
	CreateDynamicObject(615,-4767.2998047,-3005.1000977,33.5999985,0.0000000,0.0000000,0.0000000); //object(veg_tree3) (3)
	CreateDynamicObject(829,-4770.2998047,-3000.6999512,33.7999992,0.0000000,0.0000000,0.0000000); //object(dead_tree_3) (1)
	CreateDynamicObject(829,-4781.7998047,-2950.0000000,33.2000008,0.0000000,0.0000000,0.0000000); //object(dead_tree_3) (2)
	CreateDynamicObject(829,-4783.6000977,-2946.8999023,33.0999985,0.0000000,0.0000000,0.0000000); //object(dead_tree_3) (3)
	CreateDynamicObject(829,-4836.5000000,-2897.6992188,32.2999992,0.0000000,0.0000000,0.0000000); //object(dead_tree_3) (4)
	CreateDynamicObject(829,-4900.3999023,-2949.1000977,32.7999992,0.0000000,0.0000000,0.0000000); //object(dead_tree_3) (5)
	CreateDynamicObject(669,-4799.2998047,-2921.0000000,32.4000015,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (1)
	CreateDynamicObject(669,-4806.0000000,-2907.6999512,32.2000008,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (2)
	CreateDynamicObject(669,-4812.2001953,-2917.6000977,32.2999992,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (3)
	CreateDynamicObject(669,-4678.3999023,-2878.1000977,32.2999992,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (4)
	CreateDynamicObject(669,-4699.0000000,-2883.1000977,32.2999992,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (5)
	CreateDynamicObject(669,-4722.8999023,-2887.0000000,32.2999992,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (6)
	CreateDynamicObject(669,-4652.0996094,-2874.8994141,32.2999992,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (7)
	CreateDynamicObject(669,-4989.1000977,-2647.3999023,25.3999996,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (8)
	CreateDynamicObject(669,-4973.7001953,-2631.8000488,27.5000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (9)
	CreateDynamicObject(669,-4970.0000000,-2647.6999512,23.5000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (10)
	CreateDynamicObject(669,-4985.8994141,-2663.7998047,19.0000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (11)
	CreateDynamicObject(669,-4966.7001953,-2662.6992188,16.8999996,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (12)
	CreateDynamicObject(669,-4952.2998047,-2642.0000000,23.3999996,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (13)
	CreateDynamicObject(669,-4959.6000977,-2628.6000977,26.8999996,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (14)
	CreateDynamicObject(669,-4958.7001953,-2608.3000488,31.8999996,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (15)
	CreateDynamicObject(669,-4942.3999023,-2618.1000977,28.6000004,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (16)
	CreateDynamicObject(669,-5054.2998047,-2749.1999512,15.8999996,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (17)
	CreateDynamicObject(669,-5060.5000000,-2773.1000977,30.2999992,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (18)
	CreateDynamicObject(669,-5040.2998047,-2795.0000000,33.7999992,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (19)
	CreateDynamicObject(669,-5012.7001953,-2788.8000488,21.5000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (20)
	CreateDynamicObject(669,-5036.3999023,-2776.6000977,22.2000008,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (21)
	CreateDynamicObject(669,-5078.0000000,-2759.3999023,26.3999996,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (22)
	CreateDynamicObject(16302,-5036.2001953,-2862.0000000,36.5999985,341.0000000,0.0000000,0.0000000); //object(des_gravelpile04) (1)
	CreateDynamicObject(1337,-5045.2402344,-2870.3906250,40.8367386,0.0000000,0.0000000,0.0000000); //object(binnt07_la) (1)
	CreateDynamicObject(16302,-4970.6000977,-3045.1000977,35.9000015,356.9991455,0.0000000,0.0000000); //object(des_gravelpile04) (2)
	CreateDynamicObject(3286,-4887.6000977,-2979.6999512,37.5999985,0.0000000,0.0000000,13.2495117); //object(cxrf_watertwr) (1)
	CreateDynamicObject(3279,-5000.7001953,-2671.6999512,17.5000000,0.0000000,0.0000000,77.9945068); //object(a51_spottower) (2)
	CreateDynamicObject(3279,-5060.0000000,-2764.1999512,24.7999992,0.0000000,0.0000000,221.9919434); //object(a51_spottower) (2)
	CreateDynamicObject(12912,-4748.0996094,-3025.2998047,45.5000000,0.0000000,0.0000000,11.7498779); //object(sw_silo04) (1)
	CreateDynamicObject(1337,-4916.9335938,-2535.6777344,21.3751755,0.0000000,0.0000000,0.0000000); //object(binnt07_la) (3)
	CreateDynamicObject(16134,-4939.7998047,-2823.8999023,27.2999992,0.0000000,4.4989014,39.9957275); //object(des_rockfl1_01) (1)
	CreateDynamicObject(16134,-4957.5000000,-2828.8994141,30.1000004,3.9166260,11.2664795,40.7043457); //object(des_rockfl1_01) (2)
	CreateDynamicObject(16134,-4974.0996094,-2834.1992188,31.2999992,0.0000000,8.4979248,61.9903564); //object(des_rockfl1_01) (3)
	CreateDynamicObject(16134,-4987.8994141,-2838.0000000,29.2000008,0.0000000,8.4979248,61.9903564); //object(des_rockfl1_01) (4)
	CreateDynamicObject(3364,-5132.2998047,-2803.3999023,46.5000000,341.7615051,357.8941650,21.3406677); //object(des_ruin3_) (1)
	CreateDynamicObject(3363,-5004.3999023,-3064.1999512,43.2999992,350.0000000,0.0000000,334.0000000); //object(des_ruin1_) (1)
	CreateDynamicObject(3363,-4689.3999023,-3136.0000000,37.4000015,349.9969482,0.0000000,333.9953613); //object(des_ruin1_) (2)
	CreateDynamicObject(829,-4998.3999023,-2675.1999512,17.0000000,0.0000000,0.0000000,0.0000000); //object(dead_tree_3) (6)
	CreateDynamicObject(829,-5005.1000977,-2676.3999023,16.7999992,0.0000000,0.0000000,0.0000000); //object(dead_tree_3) (7)
	CreateDynamicObject(3362,-4821.5000000,-2650.3000488,66.4000015,0.0000000,0.0000000,0.0000000); //object(des_ruin2_) (1)
	CreateDynamicObject(11428,-4509.1000977,-2842.8999023,20.7999992,0.0000000,0.0000000,330.0000000); //object(des_indruin02) (1)
	CreateDynamicObject(3095,-5071.7001953,-2723.6992188,8.6000004,87.9950562,179.9945068,17.2485352); //object(a51_jetdoor) (1)
	CreateDynamicObject(3095,-5070.5996094,-2727.3994141,15.8000002,0.0000000,0.0000000,16.9958496); //object(a51_jetdoor) (3)
	CreateDynamicObject(3095,-5066.7998047,-2726.1992188,11.8000002,89.7420654,179.9505615,287.0288086); //object(a51_jetdoor) (5)
	CreateDynamicObject(3095,-5074.8994141,-2728.7998047,11.8000002,89.7420654,179.9505615,287.0288086); //object(a51_jetdoor) (6)
	CreateDynamicObject(744,-5078.0000000,-2727.8000488,11.0000000,0.0000000,0.0000000,0.0000000); //object(sm_scrub_rock4) (1)
	CreateDynamicObject(744,-5065.2001953,-2723.8999023,7.9000001,18.0000000,0.0000000,170.0000000); //object(sm_scrub_rock4) (2)
	CreateDynamicObject(744,-5076.7001953,-2734.0000000,11.1000004,0.0000000,0.0000000,0.0000000); //object(sm_scrub_rock4) (3)
	CreateDynamicObject(744,-5063.1000977,-2727.3999023,10.3000002,17.9956055,0.0000000,169.9969482); //object(sm_scrub_rock4) (4)
	CreateDynamicObject(760,-5068.5000000,-2721.1999512,11.8000002,0.0000000,0.0000000,0.0000000); //object(sm_bush_small_1) (1)
	CreateDynamicObject(760,-5070.7998047,-2721.6999512,11.6999998,0.0000000,0.0000000,0.0000000); //object(sm_bush_small_1) (2)
	CreateDynamicObject(760,-5072.7001953,-2722.8000488,11.6999998,0.0000000,0.0000000,0.0000000); //object(sm_bush_small_1) (3)
	CreateDynamicObject(760,-5075.2998047,-2723.1999512,11.6000004,0.0000000,0.0000000,0.0000000); //object(sm_bush_small_1) (4)
	CreateDynamicObject(760,-5065.0000000,-2725.1999512,13.8999996,0.0000000,0.0000000,0.0000000); //object(sm_bush_small_1) (5)
	CreateDynamicObject(760,-5064.7998047,-2722.3999023,13.6999998,0.0000000,0.0000000,0.0000000); //object(sm_bush_small_1) (6)
	CreateDynamicObject(760,-5074.2001953,-2725.0000000,16.3999996,0.0000000,0.0000000,0.0000000); //object(sm_bush_small_1) (7)
	CreateDynamicObject(760,-5071.3999023,-2724.3000488,16.3999996,0.0000000,0.0000000,0.0000000); //object(sm_bush_small_1) (8)
	CreateDynamicObject(760,-5068.7001953,-2723.1000977,16.3999996,0.0000000,0.0000000,0.0000000); //object(sm_bush_small_1) (9)
	CreateDynamicObject(760,-5068.2998047,-2726.1000977,16.3999996,0.0000000,0.0000000,0.0000000); //object(sm_bush_small_1) (10)
	CreateDynamicObject(760,-5070.7001953,-2726.1000977,16.3999996,0.0000000,0.0000000,0.0000000); //object(sm_bush_small_1) (11)
	CreateDynamicObject(760,-5074.0000000,-2726.8000488,16.3999996,0.0000000,0.0000000,0.0000000); //object(sm_bush_small_1) (12)
	CreateDynamicObject(760,-5073.3999023,-2729.3000488,16.3999996,0.0000000,0.0000000,0.0000000); //object(sm_bush_small_1) (13)
	CreateDynamicObject(760,-5071.1000977,-2729.3000488,16.3999996,0.0000000,0.0000000,0.0000000); //object(sm_bush_small_1) (14)
	CreateDynamicObject(760,-5069.5000000,-2728.5000000,16.3999996,0.0000000,0.0000000,0.0000000); //object(sm_bush_small_1) (15)
	CreateDynamicObject(760,-5067.0000000,-2727.8999023,16.3999996,0.0000000,0.0000000,0.0000000); //object(sm_bush_small_1) (16)
	CreateDynamicObject(760,-5066.6000977,-2730.1999512,16.3999996,0.0000000,0.0000000,0.0000000); //object(sm_bush_small_1) (17)
	CreateDynamicObject(760,-5070.2998047,-2730.8999023,16.3999996,0.0000000,0.0000000,0.0000000); //object(sm_bush_small_1) (18)
	CreateDynamicObject(760,-5072.7001953,-2731.3999023,16.3999996,0.0000000,0.0000000,0.0000000); //object(sm_bush_small_1) (19)
	CreateDynamicObject(760,-5069.2998047,-2726.0000000,16.3999996,0.0000000,0.0000000,0.0000000); //object(sm_bush_small_1) (20)
	CreateDynamicObject(762,-4965.7001953,-2949.0000000,57.9000015,0.0000000,0.0000000,0.0000000); //object(new_bushtest) (1)
	CreateDynamicObject(762,-4956.5000000,-2887.0000000,39.7000008,0.0000000,0.0000000,0.0000000); //object(new_bushtest) (2)
	CreateDynamicObject(762,-4875.7998047,-2856.3000488,64.5999985,0.0000000,0.0000000,0.0000000); //object(new_bushtest) (3)
	CreateDynamicObject(762,-5028.7998047,-2812.8999023,39.0999985,0.0000000,0.0000000,0.0000000); //object(new_bushtest) (4)
	CreateDynamicObject(762,-4911.1000977,-2551.1999512,41.5000000,0.0000000,0.0000000,0.0000000); //object(new_bushtest) (5)
	CreateDynamicObject(762,-4880.7998047,-2689.5000000,60.5999985,0.0000000,0.0000000,0.0000000); //object(new_bushtest) (6)
	CreateDynamicObject(762,-4885.6000977,-3055.0000000,39.9000015,0.0000000,0.0000000,0.0000000); //object(new_bushtest) (7)
	CreateDynamicObject(762,-4916.6000977,-3056.1999512,39.7999992,0.0000000,0.0000000,0.0000000); //object(new_bushtest) (8)
	CreateDynamicObject(760,-5064.6000977,-2725.8999023,15.5000000,0.0000000,0.0000000,0.0000000); //object(sm_bush_small_1) (21)
	CreateDynamicObject(818,-5065.1000977,-2723.8000488,15.1999998,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass02) (1)
	CreateDynamicObject(818,-5077.2998047,-2725.5000000,15.6999998,0.0000000,0.0000000,0.0000000); //object(genveg_tallgrass02) (2)
	CreateDynamicObject(3886,-5059.6000977,-2703.3000488,1.8000000,0.0000000,0.0000000,314.7500000); //object(ws_jettynol_sfx) (1)
	CreateDynamicObject(3886,-5052.3999023,-2696.1999512,1.8000000,0.0000000,0.0000000,314.7473145); //object(ws_jettynol_sfx) (2)
	CreateDynamicObject(3886,-5066.7998047,-2710.6999512,1.0000000,6.8213501,335.3137207,317.8722839); //object(ws_jettynol_sfx) (3)
	CreateDynamicObject(2631,-4844.7001953,-2990.1999512,33.2999992,0.0000000,0.0000000,100.2500000); //object(gym_mat1) (1)
	CreateDynamicObject(2631,-4841.7001953,-2989.6000977,33.2999992,0.0000000,0.0000000,100.2447510); //object(gym_mat1) (2)
	CreateDynamicObject(2631,-4874.5996094,-2949.7998047,32.5999985,0.0000000,0.0000000,149.2382812); //object(gym_mat1) (4)
	CreateDynamicObject(2631,-4873.2001953,-2947.3994141,32.5999985,0.0000000,0.0000000,149.2382812); //object(gym_mat1) (5)
	CreateDynamicObject(1463,-4790.1000977,-2929.3000488,32.9000015,0.0000000,0.0000000,48.0000000); //object(dyn_woodpile2) (10)
	CreateDynamicObject(1463,-4788.2998047,-2930.6000977,32.9000015,0.0000000,0.0000000,47.9992676); //object(dyn_woodpile2) (10)
	CreateDynamicObject(1463,-4791.6000977,-2930.8999023,32.9000015,0.0000000,0.0000000,47.9992676); //object(dyn_woodpile2) (10)
	CreateDynamicObject(1463,-4789.7998047,-2932.3000488,32.9000015,0.0000000,0.0000000,47.9992676); //object(dyn_woodpile2) (10)
	CreateDynamicObject(1463,-4793.2001953,-2932.8000488,32.9000015,0.0000000,0.0000000,47.9992676); //object(dyn_woodpile2) (10)
	CreateDynamicObject(1463,-4791.5000000,-2933.8999023,32.9000015,0.0000000,0.0000000,47.9992676); //object(dyn_woodpile2) (10)
	CreateDynamicObject(1463,-4794.5000000,-2934.1999512,32.9000015,0.0000000,0.0000000,47.9992676); //object(dyn_woodpile2) (10)
	CreateDynamicObject(1463,-4792.8999023,-2935.5000000,32.9000015,0.0000000,0.0000000,47.9992676); //object(dyn_woodpile2) (10)
	CreateDynamicObject(2060,-4845.0000000,-2988.6999512,33.5000000,0.0000000,0.0000000,10.5000000); //object(cj_sandbag) (1)
	CreateDynamicObject(2060,-4842.0000000,-2988.0996094,33.5000000,0.0000000,0.0000000,10.4919434); //object(cj_sandbag) (2)
	CreateDynamicObject(2060,-4873.2998047,-2950.8000488,32.7999992,0.0000000,0.0000000,60.9974365); //object(cj_sandbag) (3)
	CreateDynamicObject(2060,-4871.7998047,-2948.3000488,32.7999992,0.0000000,0.0000000,60.9960938); //object(cj_sandbag) (4)
	CreateDynamicObject(2059,-4846.7001953,-2989.3999023,33.2999992,0.0000000,0.0000000,0.0000000); //object(cj_gunstuff1) (1)
	CreateDynamicObject(2059,-4844.6000977,-2992.6999512,35.5000000,0.0000000,0.0000000,0.0000000); //object(cj_gunstuff1) (2)
	CreateDynamicObject(2059,-4843.5000000,-2988.5000000,33.2999992,0.0000000,0.0000000,0.0000000); //object(cj_gunstuff1) (3)
	CreateDynamicObject(2059,-4843.2001953,-2989.8000488,33.2999992,0.0000000,0.0000000,0.0000000); //object(cj_gunstuff1) (4)
	CreateDynamicObject(2059,-4846.6000977,-2990.1999512,33.2999992,0.0000000,0.0000000,0.0000000); //object(cj_gunstuff1) (5)
	CreateDynamicObject(2228,-4998.7382812,-2721.2822266,8.9730072,0.0000000,0.0000000,0.0000000); //object(cj_shovel) (1)
	CreateDynamicObject(3499,-4949.8999023,-2739.6000977,12.1999998,0.0000000,0.0000000,0.0000000); //object(wdpillar02_lvs) (1)
	CreateDynamicObject(3095,-4952.7998047,-2743.8000488,17.3999996,0.0000000,0.0000000,11.7458496); //object(a51_jetdoor) (3)
	CreateDynamicObject(3095,-4961.2998047,-2745.5996094,17.3999996,0.0000000,0.0000000,11.7388916); //object(a51_jetdoor) (3)
	CreateDynamicObject(3095,-4951.0000000,-2752.3994141,17.3999996,0.0000000,0.0000000,11.7333984); //object(a51_jetdoor) (3)
	CreateDynamicObject(3095,-4959.5000000,-2754.1999512,17.3999996,0.0000000,0.0000000,11.7443848); //object(a51_jetdoor) (3)
	CreateDynamicObject(3499,-4965.5000000,-2742.6000977,12.3000002,0.0000000,0.0000000,0.0000000); //object(wdpillar02_lvs) (2)
	CreateDynamicObject(3499,-4961.8999023,-2758.1999512,12.1999998,0.0000000,0.0000000,0.0000000); //object(wdpillar02_lvs) (3)
	CreateDynamicObject(3499,-4946.7998047,-2754.6999512,12.3000002,0.0000000,0.0000000,0.0000000); //object(wdpillar02_lvs) (4)
	CreateDynamicObject(3095,-4949.2001953,-2761.0000000,16.3999996,13.0000000,0.0000000,11.7443848); //object(a51_jetdoor) (3)
	CreateDynamicObject(3095,-4947.3999023,-2769.6000977,14.3999996,12.9968262,0.0000000,11.7388916); //object(a51_jetdoor) (3)
	CreateDynamicObject(3095,-4957.6000977,-2762.6999512,16.3999996,12.9968262,0.0000000,11.7388916); //object(a51_jetdoor) (3)
	CreateDynamicObject(3095,-4955.7998047,-2771.3000488,14.3999996,12.9968262,0.0000000,11.7388916); //object(a51_jetdoor) (3)
	CreateDynamicObject(3095,-4963.2998047,-2755.1999512,13.3999996,89.7420654,179.9560547,101.7843323); //object(a51_jetdoor) (5)
	CreateDynamicObject(3095,-4965.2001953,-2746.3999023,13.3999996,89.7420654,179.9505615,101.7828369); //object(a51_jetdoor) (5)
	CreateDynamicObject(3095,-4963.2998047,-2755.1999512,5.8000002,89.7418213,179.9505615,101.7828369); //object(a51_jetdoor) (5)
	CreateDynamicObject(3095,-4965.1000977,-2746.3999023,5.5000000,89.7418213,179.9505615,101.7828369); //object(a51_jetdoor) (5)
	CreateDynamicObject(3095,-4947.1000977,-2751.6999512,13.3999996,89.7420654,179.9560547,281.7843018); //object(a51_jetdoor) (5)
	CreateDynamicObject(3095,-4948.8999023,-2743.0000000,13.3999996,89.7420654,179.9505615,281.7828369); //object(a51_jetdoor) (5)
	CreateDynamicObject(3095,-4948.8999023,-2743.0000000,6.9000001,89.7420654,179.9505615,281.7828369); //object(a51_jetdoor) (5)
	CreateDynamicObject(3095,-4947.2001953,-2751.8000488,6.8000002,89.7418213,179.9505615,281.7828369); //object(a51_jetdoor) (5)
	CreateDynamicObject(3095,-4953.6000977,-2739.8999023,11.1000004,89.7418213,179.9450684,11.7828369); //object(a51_jetdoor) (5)
	CreateDynamicObject(3095,-4962.0000000,-2741.6999512,11.1000004,89.2474365,179.9945068,11.7224121); //object(a51_jetdoor) (5)
	CreateDynamicObject(16501,-4959.5000000,-2750.1992188,20.2000008,0.0000000,0.0000000,10.2447510); //object(cn2_savgardr2_) (1)
	CreateDynamicObject(16501,-4952.5000000,-2748.7998047,20.2000008,0.0000000,0.0000000,11.2445068); //object(cn2_savgardr2_) (2)
	CreateDynamicObject(16501,-4956.7001953,-2746.0996094,22.7999992,0.0000000,0.0000000,281.4916992); //object(cn2_savgardr2_) (3)
	CreateDynamicObject(16501,-4956.2998047,-2747.8999023,22.2999992,0.0000000,90.0000000,280.4997559); //object(cn2_savgardr2_) (7)
	CreateDynamicObject(16501,-4955.7998047,-2750.8000488,22.2999992,0.0000000,90.0000000,280.4974365); //object(cn2_savgardr2_) (8)
	CreateDynamicObject(5153,-4958.0996094,-2746.3994141,18.3999996,88.8793335,206.5592651,187.1852722); //object(stuntramp7_las2) (1)
	CreateDynamicObject(5153,-4955.3994141,-2745.8994141,18.3999996,88.8739624,206.5540619,187.1848907); //object(stuntramp7_las2) (2)
	CreateDynamicObject(16134,-4974.0996094,-2751.5000000,4.3000002,3.9166260,11.2664795,0.7086182); //object(des_rockfl1_01) (2)
	CreateDynamicObject(16134,-4967.5000000,-2730.6000977,2.5000000,1.2194824,11.2424011,335.2458191); //object(des_rockfl1_01) (2)
	CreateDynamicObject(16134,-4946.7998047,-2731.7998047,1.4000000,3.9056396,11.2609863,316.7028809); //object(des_rockfl1_01) (2)
	CreateDynamicObject(16134,-4936.0000000,-2748.8999023,2.5000000,3.9819336,0.4857178,245.4461060); //object(des_rockfl1_01) (2)
	CreateDynamicObject(669,-4976.8999023,-2740.1999512,8.3999996,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (11)
	CreateDynamicObject(669,-4958.5996094,-2737.6992188,7.1999998,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (11)
	CreateDynamicObject(669,-4965.2001953,-2759.8000488,8.6999998,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (11)
	CreateDynamicObject(669,-4947.0000000,-2740.3999023,6.5999999,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (11)
	CreateDynamicObject(669,-4933.5000000,-2730.6000977,5.4000001,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (11)
	CreateDynamicObject(2063,-4958.8999023,-2748.8999023,18.8999996,0.0000000,0.0000000,101.5000305); //object(cj_greenshelves) (1)
	CreateDynamicObject(2063,-4958.2998047,-2752.0000000,18.8999996,0.0000000,0.0000000,101.4971924); //object(cj_greenshelves) (2)
	CreateDynamicObject(2063,-4953.2998047,-2747.8000488,18.8999996,0.0000000,0.0000000,101.4971924); //object(cj_greenshelves) (3)
	CreateDynamicObject(2063,-4952.7001953,-2750.8999023,18.8999996,0.0000000,0.0000000,101.4971924); //object(cj_greenshelves) (4)
	CreateDynamicObject(1744,-4958.3994141,-2746.5000000,18.2999992,0.0000000,0.0000000,11.4971924); //object(med_shelf) (1)
	CreateDynamicObject(1744,-4955.8999023,-2746.1000977,18.2999992,0.0000000,0.0000000,11.4971924); //object(med_shelf) (2)
	CreateDynamicObject(1647,-4680.5000000,-2984.1992188,33.9000015,0.0000000,0.0000000,8.2397461); //object(lounge_wood_dn) (3)
	CreateDynamicObject(1647,-4682.1000977,-2984.3999023,33.9000015,0.0000000,0.0000000,8.2397461); //object(lounge_wood_dn) (5)
	CreateDynamicObject(1647,-4683.8999023,-2984.6000977,33.9000015,0.0000000,0.0000000,8.2397461); //object(lounge_wood_dn) (6)
	CreateDynamicObject(1421,-4686.6000977,-2986.3999023,34.4000015,0.0000000,0.0000000,7.0000000); //object(dyn_boxes) (1)
	CreateDynamicObject(1417,-4688.3999023,-2980.3000488,33.7999992,0.0000000,0.0000000,98.0000000); //object(dyn_cupboard) (1)
	CreateDynamicObject(941,-4701.1000977,-2920.5000000,33.2000008,0.0000000,0.0000000,15.5000000); //object(cj_df_worktop_3) (1)
	CreateDynamicObject(1737,-4955.5000000,-2748.6000977,18.0000000,0.0000000,0.0000000,343.5000000); //object(med_dinning_5) (1)
	CreateDynamicObject(1720,-4954.7001953,-2747.6000977,18.0000000,0.0000000,0.0000000,0.0000000); //object(rest_chair) (1)
	CreateDynamicObject(1720,-4701.8999023,-2919.3000488,32.7000008,0.0000000,0.0000000,0.0000000); //object(rest_chair) (2)
	CreateDynamicObject(1720,-4700.6000977,-2919.3000488,32.7000008,0.0000000,0.0000000,16.0000000); //object(rest_chair) (3)
	CreateDynamicObject(1720,-4699.2001953,-2919.8999023,32.7999992,0.0000000,0.0000000,289.9960938); //object(rest_chair) (4)
	CreateDynamicObject(1720,-4701.2998047,-2921.3999023,32.7999992,0.0000000,0.0000000,201.9951172); //object(rest_chair) (5)
	CreateDynamicObject(1720,-4700.0000000,-2921.1999512,32.7999992,0.0000000,0.0000000,193.9946442); //object(rest_chair) (6)
	CreateDynamicObject(1720,-4702.6000977,-2920.8000488,32.7999992,0.0000000,0.0000000,105.9946289); //object(rest_chair) (7)
	CreateDynamicObject(1810,-4872.2998047,-2944.3000488,32.5000000,0.0000000,0.0000000,0.0000000); //object(cj_foldchair) (1)
	CreateDynamicObject(1810,-4873.2001953,-2945.0000000,32.5000000,0.0000000,0.0000000,0.0000000); //object(cj_foldchair) (2)
	CreateDynamicObject(1810,-4838.5996094,-2990.0996094,33.2999992,0.0000000,0.0000000,237.9968262); //object(cj_foldchair) (3)
	CreateDynamicObject(1810,-4839.6000977,-2990.8000488,33.2999992,0.0000000,0.0000000,237.9968262); //object(cj_foldchair) (4)
	CreateDynamicObject(1280,-4842.5000000,-2986.6000977,33.5000000,0.0000000,0.0000000,280.0000000); //object(parkbench1) (1)
	CreateDynamicObject(1280,-4837.3999023,-2986.0000000,33.5000000,0.0000000,0.0000000,279.9975586); //object(parkbench1) (2)
	CreateDynamicObject(1280,-4687.2001953,-2977.1000977,33.9000015,0.0000000,0.0000000,279.9975586); //object(parkbench1) (3)
	CreateDynamicObject(1280,-4694.8999023,-2917.6000977,33.2000008,0.0000000,0.0000000,102.7475891); //object(parkbench1) (4)
	CreateDynamicObject(941,-4866.1000977,-2983.8999023,33.5000000,0.0000000,0.0000000,313.7462158); //object(cj_df_worktop_3) (2)
	CreateDynamicObject(1811,-4864.2998047,-2985.5000000,33.7000008,0.0000000,0.0000000,0.0000000); //object(med_din_chair_5) (1)
	CreateDynamicObject(1811,-4864.5000000,-2983.8000488,33.5999985,0.0000000,0.0000000,46.5000000); //object(med_din_chair_5) (2)
	CreateDynamicObject(1811,-4865.3999023,-2982.6999512,33.5999985,0.0000000,0.0000000,46.4996338); //object(med_din_chair_5) (3)
	CreateDynamicObject(1811,-4867.2998047,-2982.5000000,33.5999985,0.0000000,0.0000000,146.4996338); //object(med_din_chair_5) (4)
	CreateDynamicObject(1811,-4867.0000000,-2984.3000488,33.5999985,0.0000000,0.0000000,228.4971771); //object(med_din_chair_5) (5)
	CreateDynamicObject(1811,-4866.6000977,-2985.3999023,33.7000008,0.0000000,0.0000000,216.4936676); //object(med_din_chair_5) (6)
	CreateDynamicObject(834,-4985.7998047,-2925.1999512,51.0999985,346.5000000,0.0000000,0.0000000); //object(dead_tree_7) (1)
	CreateDynamicObject(834,-5007.7998047,-2884.8000488,46.9000015,346.4978027,0.0000000,0.0000000); //object(dead_tree_7) (2)
	CreateDynamicObject(834,-4792.7998047,-2999.0000000,36.0999985,0.7470703,1.4996338,359.9780273); //object(dead_tree_7) (3)
	CreateDynamicObject(672,-4896.7001953,-2654.3000488,22.5000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree5) (1)
	CreateDynamicObject(672,-4907.7001953,-2671.6000977,14.6000004,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree5) (2)
	CreateDynamicObject(905,-4844.8999023,-2960.3999023,33.2999992,0.0000000,0.0000000,0.0000000); //object(rockbrkq) (1)
	CreateDynamicObject(905,-4846.1000977,-2959.8000488,33.2999992,0.0000000,0.0000000,0.0000000); //object(rockbrkq) (2)
	CreateDynamicObject(905,-4847.5000000,-2959.8999023,33.2999992,0.0000000,0.0000000,0.0000000); //object(rockbrkq) (3)
	CreateDynamicObject(905,-4849.2001953,-2960.5000000,33.2999992,0.0000000,0.0000000,0.0000000); //object(rockbrkq) (4)
	CreateDynamicObject(905,-4850.3999023,-2961.8000488,33.2999992,0.0000000,0.0000000,0.0000000); //object(rockbrkq) (5)
	CreateDynamicObject(905,-4843.8999023,-2962.1999512,33.2999992,0.0000000,0.0000000,0.0000000); //object(rockbrkq) (6)
	CreateDynamicObject(905,-4843.7998047,-2964.1000977,33.2999992,0.0000000,0.0000000,0.0000000); //object(rockbrkq) (7)
	CreateDynamicObject(905,-4845.1000977,-2965.3999023,33.2999992,0.0000000,0.0000000,0.0000000); //object(rockbrkq) (8)
	CreateDynamicObject(905,-4846.5996094,-2965.5996094,33.2999992,0.0000000,0.0000000,0.0000000); //object(rockbrkq) (9)
	CreateDynamicObject(905,-4848.5000000,-2966.0000000,33.2999992,0.0000000,0.0000000,0.0000000); //object(rockbrkq) (10)
	CreateDynamicObject(905,-4850.0000000,-2965.1999512,33.2999992,0.0000000,0.0000000,0.0000000); //object(rockbrkq) (11)
	CreateDynamicObject(905,-4850.5000000,-2963.6999512,33.2999992,0.0000000,0.0000000,0.0000000); //object(rockbrkq) (12)
	CreateDynamicObject(905,-4799.1000977,-2952.3000488,33.2999992,0.0000000,0.0000000,0.0000000); //object(rockbrkq) (13)
	CreateDynamicObject(905,-4800.7998047,-2951.6000977,33.2999992,0.0000000,0.0000000,0.0000000); //object(rockbrkq) (14)
	CreateDynamicObject(905,-4802.3999023,-2951.8000488,33.2999992,0.0000000,0.0000000,0.0000000); //object(rockbrkq) (15)
	CreateDynamicObject(905,-4803.7998047,-2952.6992188,33.2999992,0.0000000,0.0000000,0.0000000); //object(rockbrkq) (16)
	CreateDynamicObject(905,-4804.0000000,-2954.3000488,33.2999992,0.0000000,0.0000000,0.0000000); //object(rockbrkq) (17)
	CreateDynamicObject(905,-4803.5000000,-2955.6000977,33.2999992,0.0000000,0.0000000,0.0000000); //object(rockbrkq) (18)
	CreateDynamicObject(905,-4802.2001953,-2956.1999512,33.2999992,0.0000000,0.0000000,0.0000000); //object(rockbrkq) (19)
	CreateDynamicObject(905,-4798.8999023,-2954.3999023,33.2999992,0.0000000,0.0000000,0.0000000); //object(rockbrkq) (20)
	CreateDynamicObject(905,-4799.3999023,-2956.3000488,33.2999992,0.0000000,0.0000000,0.0000000); //object(rockbrkq) (21)
	CreateDynamicObject(905,-4800.7998047,-2956.6000977,33.2999992,0.0000000,0.0000000,0.0000000); //object(rockbrkq) (22)
	CreateDynamicObject(905,-4686.2001953,-2947.3999023,33.5999985,0.0000000,0.0000000,0.0000000); //object(rockbrkq) (23)
	CreateDynamicObject(905,-4685.0000000,-2946.5000000,33.5999985,0.0000000,0.0000000,0.0000000); //object(rockbrkq) (24)
	CreateDynamicObject(905,-4684.3999023,-2944.8000488,33.5999985,0.0000000,0.0000000,0.0000000); //object(rockbrkq) (25)
	CreateDynamicObject(905,-4685.0000000,-2943.1999512,33.5999985,0.0000000,0.0000000,0.0000000); //object(rockbrkq) (26)
	CreateDynamicObject(905,-4685.8999023,-2941.8000488,33.5999985,0.0000000,0.0000000,0.0000000); //object(rockbrkq) (27)
	CreateDynamicObject(905,-4687.3999023,-2941.8000488,33.5999985,0.0000000,0.0000000,0.0000000); //object(rockbrkq) (28)
	CreateDynamicObject(905,-4689.1000977,-2942.0000000,33.5999985,0.0000000,0.0000000,0.0000000); //object(rockbrkq) (29)
	CreateDynamicObject(905,-4690.3999023,-2943.0000000,33.5999985,0.0000000,0.0000000,0.0000000); //object(rockbrkq) (30)
	CreateDynamicObject(905,-4691.2998047,-2944.6000977,33.5999985,0.0000000,0.0000000,0.0000000); //object(rockbrkq) (31)
	CreateDynamicObject(905,-4690.7998047,-2946.3000488,33.5999985,0.0000000,0.0000000,0.0000000); //object(rockbrkq) (32)
	CreateDynamicObject(905,-4689.7001953,-2947.3000488,33.5999985,0.0000000,0.0000000,0.0000000); //object(rockbrkq) (33)
	CreateDynamicObject(905,-4688.2001953,-2947.6000977,33.5999985,0.0000000,0.0000000,0.0000000); //object(rockbrkq) (34)
	CreateDynamicObject(905,-4687.2001953,-2947.6000977,33.5999985,0.0000000,0.0000000,0.0000000); //object(rockbrkq) (35)
	CreateDynamicObject(10985,-4847.2998047,-2963.5000000,31.7000008,0.0000000,357.4951172,56.2445068); //object(rubbled02_sfs) (1)
	CreateDynamicObject(10985,-4801.2001953,-2954.5000000,31.6000004,0.0000000,357.4951172,56.2445068); //object(rubbled02_sfs) (2)
	CreateDynamicObject(10985,-4687.8999023,-2945.1999512,32.0000000,0.0000000,357.4951172,56.2445068); //object(rubbled02_sfs) (3)
	CreateDynamicObject(17000,-4684.2001953,-2899.1999512,32.5000000,0.0000000,0.0000000,0.0000000); //object(wt6suppsxc) (1)
	CreateDynamicObject(1454,-4787.5000000,-2939.8000488,33.5000000,0.0000000,0.0000000,47.0000000); //object(dyn_h_bale2) (1)
	CreateDynamicObject(1454,-4785.8999023,-2937.8000488,33.5000000,0.0000000,0.0000000,46.9995117); //object(dyn_h_bale2) (2)
	CreateDynamicObject(1454,-4784.2001953,-2935.8000488,33.4000015,0.0000000,0.0000000,46.9995117); //object(dyn_h_bale2) (3)
	CreateDynamicObject(1458,-4706.1000977,-2961.8999023,33.2999992,11.2500000,0.0000000,56.0000000); //object(dyn_cart) (1)
	CreateDynamicObject(13367,-4786.7998047,-2986.8994141,45.2999992,0.0000000,0.0000000,13.7493896); //object(sw_watertower01) (1)
	CreateDynamicObject(944,-4847.7998047,-2985.8000488,34.2000008,0.0000000,0.0000000,8.7500000); //object(packing_carates04) (1)
	CreateDynamicObject(942,-4861.5000000,-2985.5000000,35.5000000,0.0000000,0.0000000,64.7479248); //object(cj_df_unit_2) (1)
	CreateDynamicObject(935,-4806.3999023,-2930.8999023,33.0999985,0.0000000,0.0000000,0.0000000); //object(cj_drum) (1)
	CreateDynamicObject(935,-4806.0996094,-2932.0996094,33.0999985,0.0000000,0.0000000,0.0000000); //object(cj_drum) (2)
	CreateDynamicObject(935,-4805.8999023,-2933.1999512,33.0999985,0.0000000,0.0000000,0.0000000); //object(cj_drum) (3)
	CreateDynamicObject(935,-4807.7998047,-2931.1999512,33.0999985,0.0000000,0.0000000,0.0000000); //object(cj_drum) (4)
	CreateDynamicObject(935,-4807.3999023,-2932.3000488,33.0999985,0.0000000,0.0000000,0.0000000); //object(cj_drum) (5)
	CreateDynamicObject(935,-4807.3999023,-2933.3999023,33.0999985,0.0000000,0.0000000,0.0000000); //object(cj_drum) (6)
	CreateDynamicObject(1362,-4876.2998047,-2952.6000977,33.2000008,0.0000000,0.0000000,0.0000000); //object(cj_firebin) (1)
	CreateDynamicObject(3461,-4876.3999023,-2952.6999512,32.0000000,0.0000000,0.0000000,0.0000000); //object(tikitorch01_lvs) (7)
	CreateDynamicObject(1362,-4686.7998047,-2980.6000977,34.2000008,0.0000000,0.0000000,0.0000000); //object(cj_firebin) (2)
	CreateDynamicObject(3461,-4686.7001953,-2980.5000000,32.9000015,0.0000000,0.0000000,0.0000000); //object(tikitorch01_lvs) (8)
	CreateDynamicObject(3093,-4874.1000977,-2953.3999023,33.2000008,0.0000000,0.0000000,330.0000000); //object(cuntgirldoor) (1)
	CreateDynamicObject(3093,-4840.0000000,-2987.0996094,33.9000015,0.0000000,0.0000000,280.2447510); //object(cuntgirldoor) (2)
	CreateDynamicObject(3093,-4679.7001953,-2981.1000977,34.2000008,0.0000000,0.0000000,283.2463379); //object(cuntgirldoor) (3)
	CreateDynamicObject(3095,-5004.5000000,-2900.1999512,49.2999992,89.7420654,179.9505615,251.7788086); //object(a51_jetdoor) (6)
	CreateDynamicObject(3095,-4996.2998047,-2902.6999512,49.2999992,89.7420654,179.9505615,252.5288239); //object(a51_jetdoor) (5)
	CreateDynamicObject(3095,-4998.8999023,-2897.6999512,43.0999985,89.4457397,333.1844482,189.5576172); //object(a51_jetdoor) (1)
	CreateDynamicObject(3095,-5000.1000977,-2901.6000977,53.2000008,0.0000000,0.0000000,342.4958496); //object(a51_jetdoor) (3)
	CreateDynamicObject(669,-4991.7998047,-2898.0000000,45.4000015,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (11)
	CreateDynamicObject(669,-5003.3999023,-2893.6999512,45.5000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (11)
	CreateDynamicObject(669,-4990.7001953,-2907.3000488,47.2000008,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (11)
	CreateDynamicObject(669,-5014.1000977,-2874.5000000,40.2999992,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (11)
	CreateDynamicObject(16134,-5060.1000977,-2760.8000488,15.3000002,25.4587097,12.4671021,148.0592041); //object(des_rockfl1_01) (2)
	CreateDynamicObject(669,-4845.0000000,-2512.6999512,30.6000004,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (12)
	CreateDynamicObject(669,-4870.1000977,-2547.8999023,30.2000008,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (12)
	CreateDynamicObject(669,-4888.6000977,-2526.6000977,31.8999996,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (12)
	CreateDynamicObject(669,-4898.1000977,-2578.8999023,32.7999992,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (12)
	CreateDynamicObject(669,-4946.3999023,-2562.3000488,36.4000015,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (12)
	CreateDynamicObject(669,-4932.6000977,-2578.0000000,34.9000015,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (12)
	CreateDynamicObject(669,-4769.5000000,-2505.8999023,42.0000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (12)
	CreateDynamicObject(669,-4793.7998047,-2531.8000488,46.9000015,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (12)
	CreateDynamicObject(669,-4806.3999023,-2508.5000000,41.7000008,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (12)
	CreateDynamicObject(669,-4838.2001953,-2522.6999512,34.5000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (12)
	CreateDynamicObject(3260,-4843.7998047,-2992.3999023,35.0999985,0.0000000,90.0000000,8.4999695); //object(oldwoodpanel) (1)
	CreateDynamicObject(3260,-4840.7001953,-2991.8999023,35.2000008,0.0000000,90.0000000,8.4999695); //object(oldwoodpanel) (2)
	CreateDynamicObject(3260,-4848.0000000,-2984.5000000,35.2000008,0.0000000,90.0000000,9.7478027); //object(oldwoodpanel) (3)
	CreateDynamicObject(3260,-4875.6000977,-2946.8000488,34.2999992,0.0000000,90.0000000,60.4976196); //object(oldwoodpanel) (4)
	CreateDynamicObject(3260,-4877.2998047,-2949.3999023,34.2999992,0.0000000,90.0000000,60.4962158); //object(oldwoodpanel) (5)
	CreateDynamicObject(3260,-4683.3999023,-2986.6000977,35.0999985,0.0000000,89.7497559,8.9999695); //object(oldwoodpanel) (6)
	CreateDynamicObject(3260,-4680.3999023,-2986.1000977,34.9000015,0.0000000,89.7474365,9.7478027); //object(oldwoodpanel) (7)
	CreateDynamicObject(3260,-4687.7001953,-2978.6000977,35.4000015,0.0000000,270.0000000,190.7498474); //object(oldwoodpanel) (8)
	CreateDynamicObject(16134,-4961.7001953,-2822.1000977,28.8999996,16.7135315,349.2820129,232.5997314); //object(des_rockfl1_01) (2)
	CreateDynamicObject(16501,-4998.2001953,-2897.5996094,51.5000000,0.0000000,0.0000000,253.4875488); //object(cn2_savgardr2_) (3)
	CreateDynamicObject(16501,-4999.3999023,-2897.3000488,51.5000000,0.0000000,0.0000000,253.4875488); //object(cn2_savgardr2_) (3)
	CreateDynamicObject(3276,-4661.7001953,-2877.1999512,33.2000008,0.0000000,0.0000000,12.0000000); //object(cxreffencesld) (2)
	CreateDynamicObject(3276,-4673.1000977,-2879.5000000,33.2000008,0.0000000,0.0000000,10.9970703); //object(cxreffencesld) (3)
	CreateDynamicObject(3276,-4684.3999023,-2881.5000000,33.2000008,0.0000000,0.0000000,10.9918213); //object(cxreffencesld) (4)
	CreateDynamicObject(3276,-4695.7001953,-2883.6999512,33.2000008,0.0000000,0.0000000,10.9918213); //object(cxreffencesld) (5)
	CreateDynamicObject(3276,-4707.1000977,-2886.0000000,33.2000008,0.0000000,0.0000000,10.9918213); //object(cxreffencesld) (6)
	CreateDynamicObject(3276,-4718.5000000,-2888.1999512,33.2000008,0.0000000,0.0000000,10.9918213); //object(cxreffencesld) (7)
	CreateDynamicObject(3276,-4729.7001953,-2890.3999023,33.2000008,0.0000000,0.0000000,10.9918213); //object(cxreffencesld) (8)
	CreateDynamicObject(3276,-4741.5000000,-2892.8000488,33.2000008,0.0000000,0.0000000,10.9918213); //object(cxreffencesld) (9)
	CreateDynamicObject(3276,-4751.7001953,-2894.6999512,33.2000008,0.0000000,0.0000000,10.9918213); //object(cxreffencesld) (10)
	CreateDynamicObject(3276,-4651.1000977,-2878.8999023,33.2999992,0.0000000,0.0000000,329.9970703); //object(cxreffencesld) (11)
	CreateDynamicObject(3276,-4641.7001953,-2885.3999023,33.4000015,0.0000000,0.0000000,318.9962769); //object(cxreffencesld) (12)
	CreateDynamicObject(3276,-4633.2001953,-2892.6999512,33.5000000,0.0000000,0.0000000,318.9935303); //object(cxreffencesld) (13)
	CreateDynamicObject(3276,-4625.2998047,-2901.1000977,33.5999985,0.0000000,0.0000000,308.9935303); //object(cxreffencesld) (14)
	CreateDynamicObject(1463,-4715.7998047,-2906.8999023,32.9000015,0.0000000,0.0000000,3.0000000); //object(dyn_woodpile2) (16)
	CreateDynamicObject(1463,-4718.3999023,-2907.6999512,32.9000015,0.0000000,0.0000000,2.9992676); //object(dyn_woodpile2) (16)
	CreateDynamicObject(1463,-4720.7998047,-2908.3999023,32.9000015,0.0000000,0.0000000,2.9992676); //object(dyn_woodpile2) (16)
	CreateDynamicObject(1463,-4723.5000000,-2908.8999023,32.9000015,0.0000000,0.0000000,2.9992676); //object(dyn_woodpile2) (16)
	CreateDynamicObject(1463,-4726.1000977,-2909.3999023,32.9000015,0.0000000,0.0000000,2.9992676); //object(dyn_woodpile2) (16)
	CreateDynamicObject(1463,-4728.8999023,-2910.1000977,32.9000015,0.0000000,0.0000000,2.9992676); //object(dyn_woodpile2) (16)
	CreateDynamicObject(1463,-4717.0000000,-2904.8000488,32.9000015,0.0000000,0.0000000,2.9992676); //object(dyn_woodpile2) (16)
	CreateDynamicObject(1463,-4720.5000000,-2905.6000977,32.9000015,0.0000000,0.0000000,2.9992676); //object(dyn_woodpile2) (16)
	CreateDynamicObject(1463,-4723.2998047,-2906.3999023,32.9000015,0.0000000,0.0000000,2.9992676); //object(dyn_woodpile2) (16)
	CreateDynamicObject(1463,-4725.8999023,-2907.0000000,32.9000015,0.0000000,0.0000000,2.9992676); //object(dyn_woodpile2) (16)
	CreateDynamicObject(1463,-4728.6000977,-2907.6000977,32.9000015,0.0000000,0.0000000,2.9992676); //object(dyn_woodpile2) (16)
	CreateDynamicObject(14875,-4732.0000000,-2899.3999023,33.4000015,0.0000000,0.0000000,0.0000000); //object(kylie_hay1) (2)
	CreateDynamicObject(14875,-4736.6000977,-2901.1999512,33.4000015,0.0000000,0.0000000,0.0000000); //object(kylie_hay1) (2)
	CreateDynamicObject(14875,-4740.7998047,-2902.5000000,33.4000015,0.0000000,0.0000000,0.0000000); //object(kylie_hay1) (2)
	CreateDynamicObject(669,-4635.7998047,-2885.8999023,32.5000000,0.0000000,0.0000000,0.0000000); //object(sm_veg_tree4) (7)
	CreateDynamicObject(3276,-4763.2998047,-2897.0000000,33.2000008,0.0000000,0.0000000,10.9918213); //object(cxreffencesld) (15)
	CreateDynamicObject(983,-4965.7998047,-2745.1999512,18.6000004,0.0000000,0.0000000,12.0000000); //object(fenceshit3) (1)
	CreateDynamicObject(983,-4964.5000000,-2751.5000000,18.6000004,0.0000000,0.0000000,11.9970703); //object(fenceshit3) (2)
	CreateDynamicObject(983,-4963.5000000,-2756.1999512,18.6000004,0.0000000,0.0000000,11.9970703); //object(fenceshit3) (3)
	CreateDynamicObject(983,-4948.7998047,-2741.6999512,18.6000004,0.0000000,0.0000000,11.9970703); //object(fenceshit3) (4)
	CreateDynamicObject(983,-4947.3999023,-2748.0000000,18.6000004,0.0000000,0.0000000,11.9970703); //object(fenceshit3) (5)
	CreateDynamicObject(983,-4946.3999023,-2752.8000488,18.6000004,0.0000000,0.0000000,11.9970703); //object(fenceshit3) (6)
	CreateDynamicObject(983,-4963.5000000,-2741.5000000,18.6000004,0.0000000,0.0000000,101.7470703); //object(fenceshit3) (7)
	CreateDynamicObject(983,-4957.2001953,-2740.1999512,18.6000004,0.0000000,0.0000000,101.7443848); //object(fenceshit3) (8)
	CreateDynamicObject(983,-4952.5000000,-2739.1999512,18.6000004,0.0000000,0.0000000,101.7443848); //object(fenceshit3) (9)
	CreateDynamicObject(1407,-4784.5000000,-2932.6999512,33.4000015,0.0000000,0.0000000,138.7500000); //object(dyn_f_r_wood_1) (1)
	CreateDynamicObject(1407,-4784.5000000,-2932.6999512,34.7999992,0.0000000,0.0000000,138.2465820); //object(dyn_f_r_wood_1) (2)
	CreateDynamicObject(1407,-4784.5000000,-2932.6999512,36.2000008,0.0000000,0.0000000,138.2465820); //object(dyn_f_r_wood_1) (3)
	CreateDynamicObject(1647,-4877.0000000,-2969.8994141,33.0999985,0.0000000,0.0000000,23.7359619); //object(lounge_wood_dn) (3)
	CreateDynamicObject(1647,-4875.3994141,-2969.1992188,33.0999985,0.0000000,0.0000000,23.7359619); //object(lounge_wood_dn) (3)
	CreateDynamicObject(3066,-4627.6000977,-2933.0000000,34.2000008,0.0000000,0.0000000,9.5000000); //object(ammotrn_obj) (1)
	CreateDynamicObject(3014,-4813.0000000,-2934.3999023,32.7999992,0.0000000,0.0000000,9.2500000); //object(cr_guncrate) (1)
	CreateDynamicObject(3014,-4813.2001953,-2933.5000000,32.7999992,0.0000000,0.0000000,9.2449951); //object(cr_guncrate) (2)
	CreateDynamicObject(3014,-4813.5000000,-2932.6000977,32.7000008,0.0000000,0.0000000,9.2449951); //object(cr_guncrate) (3)
	CreateDynamicObject(3014,-4812.0000000,-2934.1999512,32.7999992,0.0000000,0.0000000,9.2449951); //object(cr_guncrate) (4)
	CreateDynamicObject(3014,-4812.1000977,-2933.3000488,32.7999992,0.0000000,0.0000000,9.2449951); //object(cr_guncrate) (5)
	CreateDynamicObject(3014,-4812.2001953,-2932.5000000,32.7000008,0.0000000,0.0000000,9.2449951); //object(cr_guncrate) (6)
	CreateDynamicObject(2975,-4879.5000000,-2964.3999023,32.9000015,0.0000000,0.0000000,26.7500000); //object(k_cargo3) (1)
	CreateDynamicObject(2975,-4878.0000000,-2963.5996094,32.9000015,0.0000000,0.0000000,26.7462158); //object(k_cargo3) (2)
	CreateDynamicObject(942,-4872.7001953,-2953.7998047,35.0999985,0.0000000,0.0000000,60.4962158); //object(cj_df_unit_2) (1)
	CreateDynamicObject(942,-4795.1000977,-2930.6000977,35.0000000,0.0000000,0.0000000,45.9962158); //object(cj_df_unit_2) (1)
	CreateDynamicObject(1647,-4793.3999023,-2973.6999512,33.2999992,0.0000000,0.0000000,12.4859619); //object(lounge_wood_dn) (3)
	CreateDynamicObject(1647,-4795.3999023,-2974.1000977,33.2999992,0.0000000,0.0000000,12.4859619); //object(lounge_wood_dn) (3)
	CreateDynamicObject(2975,-4800.7998047,-2976.1000977,33.0999985,0.0000000,0.0000000,282.2462158); //object(k_cargo3) (2)
	CreateDynamicObject(2975,-4801.1000977,-2974.3000488,33.0999985,0.0000000,0.0000000,281.9931946); //object(k_cargo3) (2)
	CreateDynamicObject(615,-4735.7998047,-2962.3000488,33.2000008,0.0000000,0.0000000,0.0000000); //object(veg_tree3) (1)
	CreateDynamicObject(615,-4690.8999023,-2980.1000977,33.5999985,0.0000000,0.0000000,0.0000000); //object(veg_tree3) (1)
	CreateDynamicObject(615,-4692.5000000,-2913.1000977,32.7000008,0.0000000,0.0000000,0.0000000); //object(veg_tree3) (1)
	CreateDynamicObject(709,-4764.0000000,-2902.1000977,32.2999992,0.0000000,0.0000000,0.0000000); //object(sm_vegvbbigbrn) (1)
	CreateDynamicObject(5153,-4786.2998047,-2981.5000000,50.2000008,0.0000000,23.7500000,14.2500000); //object(stuntramp7_las2) (3)
	CreateDynamicObject(5153,-4790.5000000,-2982.6000977,50.2000008,0.0000000,23.7469482,14.2470703); //object(stuntramp7_las2) (4)
	CreateDynamicObject(5153,-4782.5000000,-2982.8999023,50.2000008,0.0000000,23.7469482,104.2492676); //object(stuntramp7_las2) (5)
	CreateDynamicObject(5153,-4781.1000977,-2988.5000000,50.0999985,0.0000000,23.7469482,104.2438049); //object(stuntramp7_las2) (6)
	CreateDynamicObject(5153,-4783.7998047,-2991.3999023,50.0999985,0.0000000,23.7469482,14.2492676); //object(stuntramp7_las2) (7)
	CreateDynamicObject(5153,-4788.0000000,-2992.5000000,50.0999985,0.0000000,23.7469482,14.2492676); //object(stuntramp7_las2) (8)
	CreateDynamicObject(5153,-4790.7998047,-2992.1000977,50.2000008,0.6864929,23.7487488,103.9417419); //object(stuntramp7_las2) (9)
	CreateDynamicObject(5153,-4791.8999023,-2987.8000488,50.2000008,0.6811523,23.7469482,103.9416199); //object(stuntramp7_las2) (10)
	CreateDynamicObject(5153,-4792.7001953,-2984.3999023,50.2000008,0.6811523,23.7469482,103.9416199); //object(stuntramp7_las2) (11)
	CreateDynamicObject(5153,-4782.7998047,-2981.8999023,50.2000008,0.0000000,23.7469482,104.2492676); //object(stuntramp7_las2) (12)
	CreateDynamicObject(5153,-4780.7998047,-2989.6000977,50.0999985,0.0000000,23.7469482,104.2438049); //object(stuntramp7_las2) (13)
	CreateDynamicObject(1437,-4780.5000000,-2985.5000000,45.5000000,334.2500000,0.0000000,102.0000000); //object(dyn_ladder_2) (1)
	CreateDynamicObject(1437,-4777.2001953,-2984.8000488,40.7999992,334.2480469,0.0000000,101.9971008); //object(dyn_ladder_2) (5)
	CreateDynamicObject(1437,-4773.7998047,-2984.1000977,36.0000000,334.2480469,0.0000000,101.9971008); //object(dyn_ladder_2) (6)
	CreateDynamicObject(1437,-4770.5000000,-2983.3999023,31.2999992,334.2480469,0.0000000,101.9971008); //object(dyn_ladder_2) (7)
	CreateDynamicObject(846,-4841.1000977,-2964.1000977,28.6000004,90.0000000,180.0095215,179.9904785); //object(dead_tree_18) (1)
	CreateDynamicObject(846,-4842.7998047,-2959.3000488,28.3999996,90.0000000,180.0110016,179.9835205); //object(dead_tree_18) (2)
	CreateDynamicObject(846,-4843.8999023,-2966.8000488,28.3999996,90.0000000,179.9890137,180.0054932); //object(dead_tree_18) (3)
	CreateDynamicObject(846,-4846.3999023,-2957.6999512,28.1000004,90.0000000,179.9835205,180.0054932); //object(dead_tree_18) (4)
	CreateDynamicObject(846,-4847.2998047,-2968.1999512,28.6000004,90.0000000,179.9835205,180.0054932); //object(dead_tree_18) (5)
	CreateDynamicObject(846,-4852.2001953,-2961.6000977,32.7999992,0.0000000,356.0000000,343.7500000); //object(dead_tree_18) (6)
	CreateDynamicObject(846,-4805.7998047,-2953.8999023,28.2999992,90.0000000,180.0054932,179.9890137); //object(dead_tree_18) (8)
	CreateDynamicObject(846,-4804.0000000,-2950.6999512,28.2999992,90.0000000,180.0054932,179.9890137); //object(dead_tree_18) (9)
	CreateDynamicObject(846,-4798.7001953,-2950.1999512,28.1000004,90.0000000,179.9945068,180.0000000); //object(dead_tree_18) (10)
	CreateDynamicObject(846,-4796.7001953,-2954.3999023,28.2000008,90.0000000,180.0054932,179.9835205); //object(dead_tree_18) (11)
	CreateDynamicObject(846,-4803.0000000,-2957.8000488,28.2999992,90.0000000,179.9945068,179.9945068); //object(dead_tree_18) (12)
	CreateDynamicObject(846,-4798.7998047,-2958.1999512,28.2000008,90.0000000,179.9945068,179.9945068); //object(dead_tree_18) (13)
	CreateDynamicObject(846,-4797.2001953,-2952.0000000,28.0000000,90.0000000,179.9945068,179.9945068); //object(dead_tree_18) (14)
	CreateDynamicObject(846,-4797.6000977,-2956.3999023,28.2000008,90.0000000,179.9945068,179.9945068); //object(dead_tree_18) (15)
	CreateDynamicObject(2631,-4683.8999023,-2940.0000000,33.0999985,0.0000000,0.0000000,149.2382812); //object(gym_mat1) (4)
	CreateDynamicObject(2631,-4690.2998047,-2939.1000977,33.0999985,0.0000000,0.0000000,193.2382812); //object(gym_mat1) (4)
	CreateDynamicObject(2631,-4694.6000977,-2943.3000488,33.0999985,0.0000000,0.0000000,253.2330322); //object(gym_mat1) (4)
	CreateDynamicObject(2631,-4682.0000000,-2945.8999023,33.2000008,0.0000000,0.0000000,253.2293701); //object(gym_mat1) (4)
	CreateDynamicObject(2631,-4686.2001953,-2950.8000488,33.2999992,0.0000000,0.0000000,194.7293549); //object(gym_mat1) (4)
	CreateDynamicObject(2631,-4692.1000977,-2949.0000000,33.2000008,0.0000000,0.0000000,138.2271729); //object(gym_mat1) (4)
	CreateDynamicObject(17098,-5146.7001953,-2874.6000977,-5.0000000,345.1093445,352.4937134,238.3014221); //object(cuntwland24b) (1)
	CreateDynamicObject(17098,-5143.7998047,-2814.6000977,-1.9000000,345.1080322,352.4908447,208.2989349); //object(cuntwland24b) (1)
	CreateDynamicObject(6295,-5076.5000000,-2823.3999023,74.5999985,0.0000000,0.0000000,23.9999695); //object(sanpedlithus_law2) (1)
	CreateDynamicObject(16000,-5113.0000000,-2819.0000000,51.2999992,0.0000000,0.0000000,350.5000000); //object(drvin_screen) (1)
	CreateDynamicObject(10357,-4725.7998047,-2649.5000000,185.3000031,0.0000000,0.0000000,120.0000000); //object(transmitter_sfs) (1)
	CreateDynamicObject(3243,-4933.2998047,-3050.3999023,33.7000008,0.0000000,0.0000000,0.0000000); //object(tepee_room_) (1)
	CreateDynamicObject(3243,-4941.7998047,-3046.8999023,33.5999985,0.0000000,0.0000000,308.0000000); //object(tepee_room_) (2)
	CreateDynamicObject(3243,-4924.2001953,-3045.1000977,33.5999985,0.0000000,0.0000000,53.9962158); //object(tepee_room_) (3)
	CreateDynamicObject(3243,-4923.0000000,-3035.6999512,33.5000000,0.0000000,0.0000000,106.7423096); //object(tepee_room_) (4)
	CreateDynamicObject(3243,-4928.7998047,-3025.1999512,33.4000015,0.0000000,0.0000000,158.7376709); //object(tepee_room_) (5)
	CreateDynamicObject(3243,-4945.8999023,-3037.1000977,33.5000000,0.0000000,0.0000000,276.7359619); //object(tepee_room_) (6)
	CreateDynamicObject(3243,-4940.2998047,-3027.3000488,33.4000015,0.0000000,0.0000000,218.7346039); //object(tepee_room_) (7)
	CreateDynamicObject(1463,-4933.2998047,-3036.6999512,33.7999992,0.0000000,0.0000000,0.0000000); //object(dyn_woodpile2) (5)
	CreateDynamicObject(3461,-4933.2001953,-3036.5000000,32.0000000,0.0000000,0.0000000,0.0000000); //object(tikitorch01_lvs) (5)
	CreateDynamicObject(3461,-4933.7001953,-3037.1000977,32.0999985,0.0000000,0.0000000,0.0000000); //object(tikitorch01_lvs) (5)
	CreateDynamicObject(3243,-4654.1000977,-2920.3999023,32.9000015,0.0000000,0.0000000,129.9923096); //object(tepee_room_) (8)
	CreateDynamicObject(3243,-4649.7001953,-2978.6999512,33.7000008,0.0000000,0.0000000,43.9902344); //object(tepee_room_) (9)
	CreateDynamicObject(3243,-4694.8999023,-2978.1999512,33.5000000,0.0000000,0.0000000,321.9892578); //object(tepee_room_) (10)
	CreateDynamicObject(3243,-4805.5000000,-2918.0000000,32.2999992,0.0000000,0.0000000,167.9873047); //object(tepee_room_) (12)
	CreateDynamicObject(3866,-4590.1000977,-2964.3000488,38.5999985,343.9999695,0.0000000,12.5000000); //object(demolish1_sfxrf) (1)
	CreateDynamicObject(3866,-4589.1000977,-2964.0000000,49.2999992,9.9984131,0.0000000,12.4969482); //object(demolish1_sfxrf) (2)
	CreateDynamicObject(3866,-4597.1000977,-2933.1000977,35.7000008,321.9984131,0.0000000,12.4969482); //object(demolish1_sfxrf) (3)
	CreateDynamicObject(3866,-4600.0000000,-2920.6999512,42.9000015,293.6496887,353.1307983,8.4496460); //object(demolish1_sfxrf) (4)
	CreateDynamicObject(3866,-4603.5000000,-2907.1999512,40.2999992,272.7966003,259.6394043,274.3755493); //object(demolish1_sfxrf) (6)
	CreateDynamicObject(3887,-5009.1000977,-2960.1999512,60.7999992,0.0000000,357.2500000,356.0000000); //object(demolish4_sfxrf) (1)
	CreateDynamicObject(17098,-5114.8999023,-2800.1999512,-3.5000000,345.1080322,352.4853516,208.2952881); //object(cuntwland24b) (1)

	/*
	Objects converted: 571
	Vehicles converted: 1
	Vehicle models found: 1
	----------------------
	convertFFS converted your input in 0.15 seconds - Chuck Norris could have done it in 0.0024 seconds!
	*/
	return 1;
}

function RemoveVends(playerid)
{
    RemoveBuildingForPlayer(playerid, 1302, 0.0, 0.0, 0.0, 6000.0);
    RemoveBuildingForPlayer(playerid, 1209, 0.0, 0.0, 0.0, 6000.0);
    RemoveBuildingForPlayer(playerid, 955, 0.0, 0.0, 0.0, 6000.0);
    RemoveBuildingForPlayer(playerid, 956, 0.0, 0.0, 0.0, 6000.0);
    RemoveBuildingForPlayer(playerid, 1775, 0.0, 0.0, 0.0, 6000.0);
    RemoveBuildingForPlayer(playerid, 1776, 0.0, 0.0, 0.0, 6000.0);
    RemoveBuildingForPlayer(playerid, 1977, 0.0, 0.0, 0.0, 6000.0);
    return 1;
}

stock DayZSA_RemoveLights(playerid)
{
    RemoveBuildingForPlayer(playerid, 1283, 1345.7656, -1740.6172, 15.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1335.1953, -1731.7813, 15.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1357.5156, -1732.9375, 15.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1376.5156, -1731.8516, 15.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1441.8594, -1733.0078, 15.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1403.3672, -1733.0078, 15.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1414.4141, -1731.4297, 15.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1513.2344, -1732.9219, 15.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1443.2031, -1592.9453, 15.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1453.6016, -1455.9063, 15.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1469.5625, -1441.5391, 15.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1516.1641, -1591.6563, 15.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1568.8828, -1745.4766, 15.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1545.7656, -1731.6719, 15.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1530.1172, -1717.0078, 15.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1582.6719, -1733.1328, 15.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1690.2109, -1718.5781, 15.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1701.9922, -1732.8750, 15.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1762.7891, -1732.8281, 15.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1736.5313, -1731.7969, 15.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1528.9531, -1605.8594, 15.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1544.6250, -1593.0313, 15.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1664.9063, -1593.1250, 15.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1646.6016, -1591.6875, 15.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1658.5313, -1583.3203, 15.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1676.7813, -1591.6094, 15.5859, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1657.6016, -1449.5781, 15.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1646.4375, -1441.4531, 15.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1667.4688, -1441.3672, 15.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1703.9063, -1593.6719, 15.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1744.4922, -1598.3359, 15.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1700.8672, -1440.3203, 15.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1731.2188, -1441.3281, 15.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1753.4453, -1610.8281, 15.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1765.0781, -1604.1875, 15.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1762.8047, -1443.7578, 15.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1781.3906, -1450.5625, 15.6250, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1962.5625, -1974.0938, 15.4688, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1975.6953, -1933.0781, 15.5078, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1962.1953, -1919.2266, 15.5547, 0.25);
	RemoveBuildingForPlayer(playerid, 1315, 2207.4297, -1897.1172, 15.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1852.5938, -1351.9844, 15.6406, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1862.7188, -1340.1953, 15.6406, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1976.1328, -1341.8125, 26.0469, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1846.2422, -1329.1094, 15.6406, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1999.0781, -1340.0625, 26.0313, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2066.1641, -1329.9688, 26.0313, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2072.4531, -1351.8672, 26.0156, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2072.4219, -1312.1641, 26.0391, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1852.5391, -1272.3672, 15.5938, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1862.9453, -1260.1016, 15.6016, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1964.0703, -1261.4453, 25.9609, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1987.3984, -1260.3828, 26.0234, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1846.1641, -1249.5469, 15.6406, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2066.3594, -1290.2578, 26.0078, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2072.3984, -1271.7031, 26.0156, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2055.3516, -1261.4453, 26.1094, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2066.2578, -1249.8047, 26.0313, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2072.6172, -1232.4609, 26.0938, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2066.1406, -1210.5625, 26.0391, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1958.7031, -1140.3438, 28.1250, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1974.6875, -1146.8516, 28.0625, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1981.9141, -1131.4297, 28.0859, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1966.2031, -1124.6875, 28.0078, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1969.2969, -1053.8906, 26.7109, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1984.2891, -1066.0391, 26.7109, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1981.4297, -1038.3672, 26.7109, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1995.0391, -1052.0391, 26.7109, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2066.0781, -1124.8359, 25.9688, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2058.2813, -1085.2969, 26.9219, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2072.7422, -1146.7344, 26.0313, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2084.3359, -1095.1250, 27.1406, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1962.6016, -1823.5234, 15.5859, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1972.9922, -1811.4531, 15.5859, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1960.6094, -1802.0078, 15.5000, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1930.3750, -1753.1016, 15.5938, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1952.5156, -1751.3750, 15.5547, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1820.8359, -1741.1484, 15.5781, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1990.6094, -1752.8438, 15.5859, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2013.2891, -1751.7656, 15.5859, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2001.9219, -1683.6172, 15.5391, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2001.3594, -1665.5391, 15.5000, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2013.0703, -1671.8672, 15.6953, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1822.1563, -1623.5156, 15.6406, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1810.2031, -1612.9063, 15.6406, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1852.2109, -1476.9609, 15.7109, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1835.9063, -1461.4063, 15.7422, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1846.0469, -1449.8828, 15.9375, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1862.9453, -1460.4453, 15.7422, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2053.9297, -1611.4375, 15.6094, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1975.1328, -1466.7109, 15.4844, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2101.1563, -1384.8438, 26.0859, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2123.5703, -1384.0859, 25.9922, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2139.3047, -1383.5781, 26.0938, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2155.6875, -1384.9219, 26.2500, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2178.2422, -1383.9141, 26.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2155.7813, -1301.6016, 25.9844, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2178.0391, -1300.0156, 25.9922, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2201.1797, -1385.0781, 26.0391, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2224.1328, -1383.7813, 26.1484, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2259.7500, -1385.1172, 26.2500, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2270.1797, -1373.1250, 26.1250, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2260.1484, -1301.6484, 26.0078, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2270.0625, -1289.6875, 26.0156, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2271.7734, -1311.8203, 26.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2166.2734, -1119.2266, 27.5703, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2187.0625, -1120.8125, 26.8203, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2190.4688, -1105.7188, 27.0703, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2200.8203, -1127.6641, 27.7109, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2225.6563, -1129.9297, 27.8438, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2218.2656, -1112.5234, 27.8359, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2259.9063, -1145.8359, 29.0547, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2272.1484, -1231.4844, 26.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2269.9844, -1209.3516, 26.0391, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2271.9453, -1160.8906, 28.7266, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2282.1641, -1148.2578, 28.8672, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2070.2109, -1812.8828, 15.6016, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2081.1719, -1740.8984, 15.6172, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2093.5313, -1744.5938, 15.6172, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2094.6797, -1762.9531, 15.7266, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2104.4766, -1751.8281, 15.5938, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2070.1484, -1612.9219, 15.6094, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2194.3984, -1653.9531, 16.9844, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2208.8984, -1644.6563, 17.3750, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2186.1406, -1640.3672, 17.4453, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2092.9922, -1604.1563, 15.6016, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2100.9688, -1466.7188, 26.0469, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 2111.7578, -1449.9922, 26.0859, 0.25);
	RemoveBuildingForPlayer(playerid, 1315, 2535.6406, -1738.6016, 15.7578, 0.25);
	RemoveBuildingForPlayer(playerid, 1315, 2633.2813, -1739.7578, 13.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 1315, 2645.6797, -1723.5234, 13.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 1315, 2639.9141, -1667.8438, 13.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 1315, 2653.3438, -1659.9219, 13.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 1315, 2720.3516, -1647.4297, 15.4844, 0.25);
	RemoveBuildingForPlayer(playerid, 1315, 2716.7266, -1632.4922, 15.4844, 0.25);
	RemoveBuildingForPlayer(playerid, 1297, 2843.8203, -1661.9453, 13.0781, 0.25);
	RemoveBuildingForPlayer(playerid, 1315, 2815.7578, -1651.8516, 13.1250, 0.25);
	RemoveBuildingForPlayer(playerid, 1315, 2218.7891, -1760.0078, 15.5703, 0.25);
	RemoveBuildingForPlayer(playerid, 1315, 2335.3203, -1726.4922, 15.7813, 0.25);
	RemoveBuildingForPlayer(playerid, 1315, 2221.8359, -1659.1172, 17.6016, 0.25);
	RemoveBuildingForPlayer(playerid, 1315, 2235.1719, -1659.2813, 17.6094, 0.25);
	RemoveBuildingForPlayer(playerid, 1315, 2236.0391, -1650.4219, 17.6016, 0.25);
	RemoveBuildingForPlayer(playerid, 1315, 2335.3828, -1653.2891, 15.5781, 0.25);
	RemoveBuildingForPlayer(playerid, 1315, 2350.1641, -1664.6875, 15.7500, 0.25);
	RemoveBuildingForPlayer(playerid, 1315, 2349.9609, -1570.2109, 26.1328, 0.25);
	RemoveBuildingForPlayer(playerid, 1315, 2334.9609, -1557.7969, 26.0859, 0.25);
	RemoveBuildingForPlayer(playerid, 1315, 2347.9297, -1516.7969, 25.8906, 0.25);
	RemoveBuildingForPlayer(playerid, 1315, 2336.8203, -1491.3516, 26.2891, 0.25);
	RemoveBuildingForPlayer(playerid, 1315, 2407.5703, -1756.6406, 15.7813, 0.25);
	RemoveBuildingForPlayer(playerid, 1315, 2421.0703, -1738.6016, 15.7578, 0.25);
	RemoveBuildingForPlayer(playerid, 1315, 2444.7109, -1729.4531, 15.9688, 0.25);
	RemoveBuildingForPlayer(playerid, 1315, 2295.9844, -1378.2813, 26.2734, 0.25);
	RemoveBuildingForPlayer(playerid, 1315, 2310.0547, -1376.9453, 26.2422, 0.25);
	RemoveBuildingForPlayer(playerid, 1315, 2349.8047, -1390.0469, 26.2578, 0.25);
	RemoveBuildingForPlayer(playerid, 1315, 2364.0859, -1378.8125, 26.2734, 0.25);
	RemoveBuildingForPlayer(playerid, 1315, 2636.4531, -1451.8516, 32.5313, 0.25);
	RemoveBuildingForPlayer(playerid, 1315, 2648.3984, -1397.3984, 32.5313, 0.25);
	RemoveBuildingForPlayer(playerid, 1350, 1041.4844, -1800.2813, 12.7109, 0.25);
	RemoveBuildingForPlayer(playerid, 1350, 1029.6016, -1789.5469, 12.9297, 0.25);
	RemoveBuildingForPlayer(playerid, 1350, 1042.8359, -1722.5313, 12.4453, 0.25);
	RemoveBuildingForPlayer(playerid, 1350, 1139.7266, -1717.4609, 12.4453, 0.25);
	RemoveBuildingForPlayer(playerid, 1350, 1160.5391, -1706.7734, 12.4453, 0.25);
	RemoveBuildingForPlayer(playerid, 1350, 1144.7891, -1701.7109, 12.2500, 0.25);
	RemoveBuildingForPlayer(playerid, 1350, 1139.5000, -1577.2734, 12.3984, 0.25);
	RemoveBuildingForPlayer(playerid, 1350, 1184.5938, -1577.5938, 12.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 1350, 1163.9922, -1566.7578, 12.4766, 0.25);
	RemoveBuildingForPlayer(playerid, 1350, 756.3438, -1596.5469, 12.5000, 0.25);
	RemoveBuildingForPlayer(playerid, 1350, 743.2266, -1591.8359, 12.5000, 0.25);
	RemoveBuildingForPlayer(playerid, 1350, 760.0000, -1591.9141, 12.5000, 0.25);
	RemoveBuildingForPlayer(playerid, 1350, 922.9063, -1500.0938, 12.5000, 0.25);
	RemoveBuildingForPlayer(playerid, 1350, 802.9609, -1416.4766, 12.5391, 0.25);
	RemoveBuildingForPlayer(playerid, 1350, 912.2656, -1478.6094, 12.5000, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 798.3750, -1415.6719, 15.6328, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 807.9531, -1406.5391, 15.5703, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 786.9453, -1394.5703, 15.7031, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 907.0469, -1406.6094, 15.3906, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 928.0547, -1394.8438, 15.5156, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 798.3828, -1384.3516, 15.6094, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 918.2422, -1384.4141, 15.4844, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 798.0781, -1337.8516, 15.6016, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 918.0078, -1337.7813, 15.5391, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 796.8203, -1309.5469, 15.4609, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1043.8594, -1406.5547, 15.7109, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1061.6328, -1416.1172, 15.7109, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1052.8203, -1385.5469, 15.7109, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1073.1328, -1395.1094, 15.7813, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1184.7891, -1406.9063, 15.3906, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1190.3047, -1389.8047, 15.5000, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1194.3203, -1415.2891, 15.3906, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1216.5625, -1394.7109, 15.5469, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1244.0391, -1406.5313, 15.1641, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1250.4531, -1389.7500, 15.3984, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1270.8516, -1394.6797, 15.3906, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1342.0000, -1384.6563, 15.7109, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1358.4766, -1416.2734, 15.5859, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 1367.9766, -1394.7734, 15.7109, 0.25);
	RemoveBuildingForPlayer(playerid, 1284, 611.7422, -1728.8438, 16.2188, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 133.6484, -1581.1328, 13.5781, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 346.6484, -1576.1094, 35.2031, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 162.5234, -1569.9297, 14.3125, 0.25);
	RemoveBuildingForPlayer(playerid, 1284, 337.1953, -1570.3906, 35.4688, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 438.6406, -1571.1016, 27.5234, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 463.2031, -1577.0938, 27.5469, 0.25);
	RemoveBuildingForPlayer(playerid, 1284, 526.1406, -1568.5391, 18.3672, 0.25);
	RemoveBuildingForPlayer(playerid, 1284, 551.1953, -1591.7031, 18.2813, 0.25);
	RemoveBuildingForPlayer(playerid, 1284, 628.0000, -1416.2188, 15.8984, 0.25);
	RemoveBuildingForPlayer(playerid, 1284, 616.3750, -1392.8438, 15.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1284, 637.1484, -1383.8047, 15.8906, 0.25);
	RemoveBuildingForPlayer(playerid, 1284, 648.7891, -1404.8125, 15.6484, 0.25);
	RemoveBuildingForPlayer(playerid, 1283, 311.6641, -1641.5156, 35.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 1284, 333.3516, -1631.8906, 35.4141, 0.25);
	return 1;
}

function WeatherUpdate()
{
    new Weathers[] =
	{
		1,
		2
	};
	new id;
	id = Weathers[random(sizeof Weathers)];
	for(new i; i < MAX_PLAYERS; i++)
	{
	    if(!IsPlayerConnected(i)) continue;
	    SetPlayerWeather(i,id);
	}
	return 1;
}

function ChangeServerTime()
{
	new hour,minute,second;
	gettime(hour,minute,second);
	new string[128];
	new string2[128];
	if (minute <= 9)
	{
 		format(string,25,"%d:0%d",hour,minute);
	}
	else
	{
 		format(string,25,"%d:%d",hour,minute);
	}
	new day,month,year;
	getdate(year,month,day);

	if (day <= 9){
		format(string2,25,"0%d.%d.%d",day,month,year);
	}
	else if (month <= 9 && day >= 9) {
		format(string2,25,"%d.0%d.%d",day,month,year);
	}
	else {
		format(string2,25,"%d.%d.%d",day,month,year);
	}

	if (hour == 0){SetWorldTime(0), timeMode = NIGHT;}
	if (hour == 1){SetWorldTime(1), timeMode = NIGHT;}
	if (hour == 2){SetWorldTime(2), timeMode = NIGHT;}
	if (hour == 3){SetWorldTime(3), timeMode = NIGHT;}
	if (hour == 4){SetWorldTime(4), timeMode = NIGHT;}
	if (hour == 5){SetWorldTime(5), timeMode = NIGHT;}
	if (hour == 6){SetWorldTime(6), timeMode = DAY;}
	if (hour == 7){SetWorldTime(7), timeMode = DAY;}
	if (hour == 8){SetWorldTime(8), timeMode = DAY;}
	if (hour == 9){SetWorldTime(9), timeMode = DAY;}
	if (hour == 10){SetWorldTime(10), timeMode = DAY;}
	if (hour == 11){SetWorldTime(11), timeMode = DAY;}
	if (hour == 12){SetWorldTime(12), timeMode = DAY;}
	if (hour == 13){SetWorldTime(13), timeMode = DAY;}
	if (hour == 14){SetWorldTime(14), timeMode = DAY;}
	if (hour == 15){SetWorldTime(15), timeMode = DAY;}
	if (hour == 16){SetWorldTime(16), timeMode = DAY;}
	if (hour == 17){SetWorldTime(17), timeMode = DAY;}
	if (hour == 18){SetWorldTime(18), timeMode = DAY;}
	if (hour == 19){SetWorldTime(19), timeMode = DAY;}
	if (hour == 20){SetWorldTime(20), timeMode = NIGHT;}
	if (hour == 21){SetWorldTime(21), timeMode = NIGHT;}
	if (hour == 22){SetWorldTime(22), timeMode = NIGHT;}
	if (hour == 23){SetWorldTime(23), timeMode = NIGHT;}
	if (hour == 24){SetWorldTime(24), timeMode = NIGHT;}


	new strsa[128];
	format(strsa,sizeof(strsa),"mapname Time: %s",string);
	SendRconCommand(strsa);
/*	foreach(Player,i)
	{
		TextDrawHideForPlayer(i,Clock);
		TextDrawHideForPlayer(i,Date);

		TextDrawSetString(Clock,string);
		TextDrawSetString(Date,string2);

		TextDrawShowForPlayer(i,Clock);
		TextDrawShowForPlayer(i,Date);
	}*/
	return 1;
}

stock SetPlayerPosEx(playerid, Float:X, Float:Y, Float:Z, Float:angle, interiorid = 0)
{
    TeleportAllowed[playerid] = 1;
    SetPlayerPos(playerid, X, Y, Z);
    SetPlayerFacingAngle(playerid, angle);
    SetPlayerInterior(playerid, interiorid);
    SetCameraBehindPlayer(playerid);
    SetTimerEx("TeleportFix", 1500, false, "i", playerid);
}

function TeleportFix(playerid)
{
	TeleportAllowed[playerid] = 0;
	return 1;
}

stock SendMessageToAllInvalid(message[], color)
{
	foreach(Player, i)
	{
		if(pInfo[i][pHour] >= 10000)
		{
	 	    SendClientMessage(i, color, message);
	 	}
 	}
	return 1;
}

stock SendMessageToAllGroups(groupid, message[], color)
{
	foreach(Player, i)
	{
		if(pInfo[i][IsPlayerInGroupID] == groupid)
		{
	 	    SendClientMessage(i, color, message);
	 	}
 	}
	return 1;
}

stock SendMessageToAllAdmins(message[], color)
{
	foreach(Player, i)
	{
		if(pInfo[i][pAdminLevel] >= 1 || IsPlayerAdmin(i))
		{
	 	    SendClientMessage(i, color, message);
	 	}
 	}
	return 1;
}

stock SendMessageToAllHelpers(message[], color)
{
	foreach(Player, i)
	{
		if(pInfo[i][Helper] >= 1)
		{
	 	    SendClientMessage(i, color, message);
	 	}
 	}
	return 1;
}

stock SendMessageToAllPremium(message[], color)
{
	foreach(Player, i)
	{
		if(pInfo[i][pPremium] >= 1)
		{
	 	    SendClientMessage(i, color, message);
	 	}
 	}
	return 1;
}

stock SetVehicleJump(playerid, Float:forwardspeed, Float:upwardspeed)
{
    new Float:vx, Float:vy, Float:vz;
    new Float:rot;
    GetPlayerFacingAngle(playerid, rot);
    rot = 360 - rot;

	GetVehicleVelocity(GetPlayerVehicleID(playerid),vx,vy,vz);
	SetVehicleVelocity(GetPlayerVehicleID(playerid),vx + forwardspeed * floatsin(rot, degrees), vy + forwardspeed * floatcos(rot, degrees), vz + upwardspeed);
    return 1;
}

stock DayZSA_IsPlayerAtGasStation(playerid)
{
	for(new i = 0; i < sizeof (DayZSA_GasStations); i++)
	{
        if (IsPlayerInRangeOfPoint(playerid,8.5, DayZSA_GasStations[i][xGas], DayZSA_GasStations[i][yGas], DayZSA_GasStations[i][zGas])) return 1;
	}
	return 0;
}

stock pGABase_RemoveObjects(playerid)
{
    RemoveBuildingForPlayer(playerid, 3279, 103.890, 1901.101, 16.820, 0.250);
	RemoveBuildingForPlayer(playerid, 3279, 113.382, 1814.453, 16.820, 0.250);
	RemoveBuildingForPlayer(playerid, 3279, 262.093, 1807.671, 16.820, 0.250);
	RemoveBuildingForPlayer(playerid, 3279, 267.062, 1895.296, 16.820, 0.250);
	RemoveBuildingForPlayer(playerid, 3279, 233.429, 1934.843, 16.820, 0.250);
	RemoveBuildingForPlayer(playerid, 3279, 165.953, 1849.992, 16.820, 0.250);
	RemoveBuildingForPlayer(playerid, 3279, 161.906, 1933.093, 16.820, 0.250);
	RemoveBuildingForPlayer(playerid, 3268, 276.656, 1955.765, 16.632, 0.250);
	RemoveBuildingForPlayer(playerid, 3366, 276.656, 1955.765, 16.632, 0.250);
	RemoveBuildingForPlayer(playerid, 3268, 276.656, 1989.546, 16.632, 0.250);
	RemoveBuildingForPlayer(playerid, 3366, 276.656, 1989.546, 16.632, 0.250);
	RemoveBuildingForPlayer(playerid, 3268, 276.656, 2023.757, 16.632, 0.250);
	RemoveBuildingForPlayer(playerid, 3366, 276.656, 2023.757, 16.632, 0.250);
	RemoveBuildingForPlayer(playerid, 3268, 276.656, 2023.757, 16.632, 0.250);
	RemoveBuildingForPlayer(playerid, 3366, 276.656, 2023.757, 16.632, 0.250);
    RemoveBuildingForPlayer(playerid, 13759, 1413.4141, -804.7422, 83.4375, 0.25);
	RemoveBuildingForPlayer(playerid, 13722, 1413.4141, -804.7422, 83.4375, 0.25);
	RemoveBuildingForPlayer(playerid, 13831, 1413.4141, -804.7422, 83.4375, 0.25);
	RemoveBuildingForPlayer(playerid, 3763, 1459.1797, -783.2656, 124.3906, 0.25);
	RemoveBuildingForPlayer(playerid, 10793, -1604.0391, 22.7266, 35.5703, 0.25);
	RemoveBuildingForPlayer(playerid, 10794, -1550.8281, 75.9297, 7.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 10795, -1552.4375, 74.3203, 17.0469, 0.25);
	RemoveBuildingForPlayer(playerid, 10815, -1608.8906, -494.8359, 13.4297, 0.25);
	RemoveBuildingForPlayer(playerid, 10838, -1735.7109, -580.0078, 29.5547, 0.25);
	RemoveBuildingForPlayer(playerid, 705, -1663.5078, 364.1172, 6.3047, 0.25);
	RemoveBuildingForPlayer(playerid, 10932, -1941.4609, 138.0000, 32.6406, 0.25);
	RemoveBuildingForPlayer(playerid, 11024, -2076.2734, 359.3203, 44.5938, 0.25);
	RemoveBuildingForPlayer(playerid, 11091, -2133.5547, -132.7031, 36.1328, 0.25);
	RemoveBuildingForPlayer(playerid, 11217, -1941.4609, 138.0000, 32.6406, 0.25);
	RemoveBuildingForPlayer(playerid, 11294, -1708.1875, 376.8359, 11.8828, 0.25);
	RemoveBuildingForPlayer(playerid, 11326, -2041.9453, 121.1797, 30.1875, 0.25);
	RemoveBuildingForPlayer(playerid, 11327, -2026.9141, 129.4063, 30.4531, 0.25);
	RemoveBuildingForPlayer(playerid, 11328, -2041.9453, 121.1797, 30.1875, 0.25);
	RemoveBuildingForPlayer(playerid, 11329, -1552.4375, 74.3203, 17.0469, 0.25);
	RemoveBuildingForPlayer(playerid, 11330, -1604.0391, 22.7266, 35.5703, 0.25);
	RemoveBuildingForPlayer(playerid, 11331, -1550.8281, 75.9297, 7.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 11354, -1921.8906, 137.8828, 29.7578, 0.25);
	RemoveBuildingForPlayer(playerid, 3874, -2081.9063, -859.9453, 48.5234, 0.25);
	RemoveBuildingForPlayer(playerid, 3874, -2081.9063, -808.7188, 48.5234, 0.25);
	RemoveBuildingForPlayer(playerid, 3874, -2081.9063, -911.1797, 48.5234, 0.25);
	RemoveBuildingForPlayer(playerid, 11373, -1608.8906, -494.8359, 13.4297, 0.25);
	RemoveBuildingForPlayer(playerid, 11376, -2144.3516, -132.9609, 38.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 3868, -2120.7656, 336.8672, 49.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 3868, -2103.3281, 336.8672, 49.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 3868, -2032.2891, 336.8672, 49.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 3868, -2022.0859, 347.1328, 49.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 3868, -2022.0859, 364.5781, 49.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 3868, -2032.2969, 380.7422, 49.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 3868, -2131.1797, 347.2813, 49.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 3868, -2131.1797, 364.7266, 49.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 3868, -2049.7344, 336.8672, 49.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 10757, -1735.2266, -580.9844, 32.7266, 0.25);
	RemoveBuildingForPlayer(playerid, 3867, -2131.1797, 347.2813, 49.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 3867, -2120.7656, 336.8672, 49.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 3867, -2103.3281, 336.8672, 49.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 3867, -2049.7344, 336.8672, 49.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 3867, -2032.2891, 336.8672, 49.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 3867, -2022.0859, 347.1328, 49.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 3867, -2131.1797, 364.7266, 49.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 10949, -2076.2734, 359.3203, 44.5938, 0.25);
	RemoveBuildingForPlayer(playerid, 3867, -2032.2969, 380.7422, 49.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 3867, -2022.0859, 364.5781, 49.1563, 0.25);
	RemoveBuildingForPlayer(playerid, 792, -1995.4766, 298.0859, 34.2734, 0.25);
	RemoveBuildingForPlayer(playerid, 11293, -1708.1875, 376.8359, 11.8828, 0.25);
	RemoveBuildingForPlayer(playerid, 672, -1670.8516, 357.5547, 7.1016, 0.25);
	RemoveBuildingForPlayer(playerid, 3873, -2081.9063, -911.1797, 48.5234, 0.25);
	RemoveBuildingForPlayer(playerid, 3873, -2081.9063, -859.9453, 48.5234, 0.25);
	RemoveBuildingForPlayer(playerid, 3873, -2081.9063, -808.7188, 48.5234, 0.25);
	RemoveBuildingForPlayer(playerid, 11011, -2144.3516, -132.9609, 38.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 1278, -2137.6172, -110.9375, 48.3516, 0.25);
	RemoveBuildingForPlayer(playerid, 1350, -2016.8594, 103.2891, 26.6797, 0.25);
	RemoveBuildingForPlayer(playerid, 1350, -2011.7813, 118.4531, 26.6797, 0.25);
	RemoveBuildingForPlayer(playerid, 673, -1998.5625, 133.1094, 26.8047, 0.25);
	RemoveBuildingForPlayer(playerid, 1350, -2001.0234, 96.1172, 26.6797, 0.25);
	RemoveBuildingForPlayer(playerid, 673, -1998.5625, 141.8281, 26.8047, 0.25);
	RemoveBuildingForPlayer(playerid, 673, -1998.5625, 149.1250, 26.8047, 0.25);
	RemoveBuildingForPlayer(playerid, 673, -1998.5625, 164.9063, 26.8047, 0.25);
	RemoveBuildingForPlayer(playerid, 673, -1998.5625, 157.6094, 26.8047, 0.25);
	RemoveBuildingForPlayer(playerid, 1226, -2010.7344, 158.5391, 30.5547, 0.25);
	RemoveBuildingForPlayer(playerid, 3851, -1965.2188, 258.7734, 36.4688, 0.25);
	RemoveBuildingForPlayer(playerid, 3851, -1965.2188, 271.9141, 42.0469, 0.25);
	RemoveBuildingForPlayer(playerid, 3851, -1965.2188, 285.0625, 36.4688, 0.25);
	RemoveBuildingForPlayer(playerid, 11353, -1921.8906, 137.8828, 29.7578, 0.25);
	RemoveBuildingForPlayer(playerid, 731, -1653.7422, 657.9922, 9.2734, 0.25);
	RemoveBuildingForPlayer(playerid, 715, -1673.3828, 638.9531, 25.3359, 0.25);
	RemoveBuildingForPlayer(playerid, 8042, 1720.7500, 1604.4141, 14.8203, 0.25);
	RemoveBuildingForPlayer(playerid, 8394, 2018.0234, 1440.4297, 23.9063, 0.25);
	RemoveBuildingForPlayer(playerid, 8414, 2096.2031, 1285.4375, 19.8984, 0.25);
	RemoveBuildingForPlayer(playerid, 8421, 1928.4141, 1628.5938, 48.1875, 0.25);
	RemoveBuildingForPlayer(playerid, 8692, 1928.4141, 1628.5938, 48.1875, 0.25);
	RemoveBuildingForPlayer(playerid, 8707, 2107.3516, 1003.0547, 32.9844, 0.25);
	RemoveBuildingForPlayer(playerid, 8823, 2018.0234, 1440.4297, 23.9063, 0.25);
	RemoveBuildingForPlayer(playerid, 8825, 2057.3906, 1602.5781, 10.5313, 0.25);
	RemoveBuildingForPlayer(playerid, 8977, 2001.1406, 1555.1016, 24.8750, 0.25);
	RemoveBuildingForPlayer(playerid, 9107, 1905.8125, 1513.4531, 10.0781, 0.25);
	RemoveBuildingForPlayer(playerid, 9126, 2107.3750, 1003.0781, 33.0000, 0.25);
	RemoveBuildingForPlayer(playerid, 3437, 2022.5547, 1329.5625, 15.6484, 0.25);
	RemoveBuildingForPlayer(playerid, 3437, 2022.6172, 1311.8594, 12.3516, 0.25);
	RemoveBuildingForPlayer(playerid, 3437, 2022.5547, 1356.6094, 15.6484, 0.25);
	RemoveBuildingForPlayer(playerid, 3499, 1900.8359, 1476.1641, 8.2891, 0.25);
	RemoveBuildingForPlayer(playerid, 3524, 1900.9922, 1473.2109, 11.3125, 0.25);
	RemoveBuildingForPlayer(playerid, 3499, 1915.6719, 1476.1641, 7.9375, 0.25);
	RemoveBuildingForPlayer(playerid, 3524, 1915.5938, 1473.2109, 11.3125, 0.25);
	RemoveBuildingForPlayer(playerid, 3437, 2022.3828, 1369.9219, 13.1875, 0.25);
	RemoveBuildingForPlayer(playerid, 3437, 2023.8516, 1383.5156, 10.6953, 0.25);
	RemoveBuildingForPlayer(playerid, 3499, 1900.7969, 1494.0938, 11.0469, 0.25);
	RemoveBuildingForPlayer(playerid, 3499, 1915.6797, 1494.0938, 11.6016, 0.25);
	RemoveBuildingForPlayer(playerid, 8832, 1905.8125, 1513.4531, 10.0781, 0.25);
	RemoveBuildingForPlayer(playerid, 3499, 1900.8125, 1513.4609, 11.6797, 0.25);
	RemoveBuildingForPlayer(playerid, 3499, 1915.6953, 1513.4609, 11.1875, 0.25);
	RemoveBuildingForPlayer(playerid, 3499, 1900.8125, 1533.1953, 11.6563, 0.25);
	RemoveBuildingForPlayer(playerid, 8833, 1908.2969, 1515.5703, 13.4141, 0.25);
	RemoveBuildingForPlayer(playerid, 3499, 1915.6641, 1533.1953, 11.6953, 0.25);
	RemoveBuildingForPlayer(playerid, 621, 1864.2266, 1587.9609, 9.4141, 0.25);
	RemoveBuildingForPlayer(playerid, 3499, 1900.8281, 1554.9688, 8.0703, 0.25);
	RemoveBuildingForPlayer(playerid, 3524, 1900.9922, 1556.3984, 11.3125, 0.25);
	RemoveBuildingForPlayer(playerid, 3499, 1915.6641, 1554.9688, 7.9688, 0.25);
	RemoveBuildingForPlayer(playerid, 3524, 1915.6875, 1556.3984, 11.3125, 0.25);
	RemoveBuildingForPlayer(playerid, 3524, 2005.4375, 1539.8438, 13.7266, 0.25);
	RemoveBuildingForPlayer(playerid, 3524, 1995.8203, 1539.7813, 13.7266, 0.25);
	RemoveBuildingForPlayer(playerid, 1503, 1998.0078, 1544.1953, 12.9609, 0.25);
	RemoveBuildingForPlayer(playerid, 8493, 2001.1406, 1555.1016, 24.8750, 0.25);
	RemoveBuildingForPlayer(playerid, 8981, 2000.5938, 1548.9141, 24.4375, 0.25);
	RemoveBuildingForPlayer(playerid, 3524, 1996.0469, 1549.7422, 13.7266, 0.25);
	RemoveBuildingForPlayer(playerid, 9159, 2001.1406, 1555.1016, 24.8750, 0.25);
	RemoveBuildingForPlayer(playerid, 3524, 2005.2344, 1549.6719, 13.7266, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1974.1094, 1578.7266, 6.1094, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1980.0391, 1600.4531, 1.1719, 0.25);
	RemoveBuildingForPlayer(playerid, 621, 1989.3047, 1579.1250, 1.4688, 0.25);
	RemoveBuildingForPlayer(playerid, 641, 1993.7500, 1595.8516, 9.6094, 0.25);
	RemoveBuildingForPlayer(playerid, 621, 1994.7109, 1583.9297, 10.5391, 0.25);
	RemoveBuildingForPlayer(playerid, 641, 1995.7031, 1589.0234, 8.9766, 0.25);
	RemoveBuildingForPlayer(playerid, 641, 1995.9922, 1587.3672, 6.6406, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1979.6328, 1682.2031, 3.8281, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1986.6875, 1682.2031, -0.4844, 0.25);
	RemoveBuildingForPlayer(playerid, 8835, 1986.4141, 1628.7969, 13.6484, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1989.7031, 1657.6875, -0.5781, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 1996.9688, 1680.5938, 0.1719, 0.25);
	RemoveBuildingForPlayer(playerid, 641, 1997.3281, 1681.5313, 7.3281, 0.25);
	RemoveBuildingForPlayer(playerid, 621, 2000.8359, 1664.1094, 1.4688, 0.25);
	RemoveBuildingForPlayer(playerid, 621, 1998.4375, 1674.9922, -1.5625, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 2002.1172, 1664.6953, 1.2188, 0.25);
	RemoveBuildingForPlayer(playerid, 641, 2002.8594, 1674.1719, 8.8438, 0.25);
	RemoveBuildingForPlayer(playerid, 3524, 2003.8516, 1665.6875, 12.2344, 0.25);
	RemoveBuildingForPlayer(playerid, 3524, 2003.8516, 1673.1484, 12.2344, 0.25);
	RemoveBuildingForPlayer(playerid, 3524, 2024.3438, 1540.3906, 11.3125, 0.25);
	RemoveBuildingForPlayer(playerid, 8397, 2096.2031, 1285.4375, 19.8984, 0.25);
	RemoveBuildingForPlayer(playerid, 9019, 2096.2031, 1286.0391, 11.4609, 0.25);
	RemoveBuildingForPlayer(playerid, 8826, 2057.3906, 1422.8281, 10.5313, 0.25);
	RemoveBuildingForPlayer(playerid, 3509, 2057.3594, 1560.7188, 9.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 3463, 2057.4531, 1543.5313, 10.2422, 0.25);
	RemoveBuildingForPlayer(playerid, 8828, 2057.3906, 988.3750, 8.7422, 0.25);
	RemoveBuildingForPlayer(playerid, 647, 2057.5703, 1050.3984, 11.2266, 0.25);
	RemoveBuildingForPlayer(playerid, 8827, 2057.3906, 1192.5859, 10.5313, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 2088.1797, 1021.5391, 9.5078, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 2102.7109, 1032.2109, 9.7266, 0.25);
	RemoveBuildingForPlayer(playerid, 8620, 2107.3516, 1003.0547, 32.9844, 0.25);
	RemoveBuildingForPlayer(playerid, 8621, 2107.5938, 1003.0625, 42.1406, 0.25);
	RemoveBuildingForPlayer(playerid, 710, 2048.3047, 1762.1484, 25.0547, 0.25);
	RemoveBuildingForPlayer(playerid, 3509, 2031.0469, 1754.4688, 7.4375, 0.25);
	RemoveBuildingForPlayer(playerid, 3509, 2046.2734, 1767.0938, 7.4375, 0.25);
	RemoveBuildingForPlayer(playerid, 11677, -1303.3672, 2664.0781, 53.5781, 0.25);
	RemoveBuildingForPlayer(playerid, 3291, 246.5625, 1435.1953, 9.6875, 0.25);
	RemoveBuildingForPlayer(playerid, 3424, 262.5078, 1465.2031, 9.5859, 0.25);
	RemoveBuildingForPlayer(playerid, 16086, 232.2891, 1434.4844, 13.5000, 0.25);
	RemoveBuildingForPlayer(playerid, 3255, 246.5625, 1435.1953, 9.6875, 0.25);
	RemoveBuildingForPlayer(playerid, 3259, 262.5078, 1465.2031, 9.5859, 0.25);
	RemoveBuildingForPlayer(playerid, 652, -883.3125, 2738.9219, 45.1328, 0.25);
	RemoveBuildingForPlayer(playerid, 3243, -865.9219, 2763.5469, 45.1406, 0.25);
	RemoveBuildingForPlayer(playerid, 3280, 245.3750, 1862.3672, 20.1328, 0.25);
	RemoveBuildingForPlayer(playerid, 3280, 246.6172, 1863.3750, 20.1328, 0.25);
	RemoveBuildingForPlayer(playerid, 785, -1914.4453, -1893.8984, 81.9219, 0.25);
	RemoveBuildingForPlayer(playerid, 785, -1847.5938, -1878.0000, 81.6641, 0.25);
	RemoveBuildingForPlayer(playerid, 784, -1981.5859, -1813.0938, 39.5234, 0.25);
	RemoveBuildingForPlayer(playerid, 784, -2014.9141, -1861.1875, 45.4297, 0.25);
	RemoveBuildingForPlayer(playerid, 784, -2036.6250, -1883.8672, 49.1719, 0.25);
	RemoveBuildingForPlayer(playerid, 694, -2036.6250, -1883.8672, 49.1719, 0.25);
	RemoveBuildingForPlayer(playerid, 694, -2014.9141, -1861.1875, 45.4297, 0.25);
	RemoveBuildingForPlayer(playerid, 694, -1981.5859, -1813.0938, 39.5234, 0.25);
	RemoveBuildingForPlayer(playerid, 3336, -16.3281, -1526.5547, 1.0703, 0.25);
	return 1;
}

stock DayZSA_CreateObject()
{
    CreateDynamicObject(10794, -1546.22, 78.35, 7.00,   47.00, 0.00, 47.00);
	CreateDynamicObject(10795, -1542.27, 72.28, 12.96,   47.00, 0.00, 47.00);
	CreateDynamicObject(10793, -1582.08, 9.73, 25.71,   47.00, 0.00, 47.00);
	CreateDynamicObject(1378, -1529.50, 129.16, 25.12,   356.86, 0.00, 225.58);
	CreateDynamicObject(1378, -1617.04, 85.09, 20.29,   84.00, -4.00, 226.00);
	CreateDynamicObject(10773, -1547.69, 23.00, -0.13,   3.14, 0.00, 2.36);
	CreateDynamicObject(10984, -2024.89, 339.77, 35.03,   356.86, 0.00, 3.14);
	CreateDynamicObject(10984, -2026.21, 354.85, 35.03,   356.86, 0.00, 3.14);
	CreateDynamicObject(10984, -2032.44, 340.15, 35.03,   356.86, 0.00, 3.14);
	CreateDynamicObject(10984, -2037.48, 352.31, 35.03,   356.86, 0.00, 3.14);
	CreateDynamicObject(10984, -2037.48, 352.31, 35.03,   356.86, 0.00, 3.14);
	CreateDynamicObject(10984, -2044.10, 342.76, 35.03,   356.86, 0.00, 3.14);
	CreateDynamicObject(10984, -2044.40, 368.18, 35.03,   356.86, 0.00, 3.14);
	CreateDynamicObject(10984, -2046.64, 357.25, 35.03,   356.86, 0.00, 3.14);
	CreateDynamicObject(10984, -2036.43, 368.22, 35.03,   356.86, 0.00, 3.14);
	CreateDynamicObject(10984, -2026.42, 369.50, 35.03,   356.86, 0.00, 3.14);
	CreateDynamicObject(3866, -2125.08, 344.49, 41.69,   3.14, 0.00, 1.57);
	CreateDynamicObject(3866, -2122.04, 367.83, 42.15,   360.00, 1.00, -0.50);
	CreateDynamicObject(10984, -2055.71, 359.32, 35.03,   356.86, 0.00, 3.14);
	CreateDynamicObject(10984, -2056.93, 346.12, 35.03,   356.86, 0.00, 3.14);
	CreateDynamicObject(1391, -2065.63, 373.12, 66.74,   0.00, 0.00, 0.00);
	CreateDynamicObject(1384, -2065.54, 373.15, 78.36,   0.00, 0.00, 105.00);
	CreateDynamicObject(10932, -1948.10, 140.48, 18.59,   0.00, -40.00, 0.00);
	CreateDynamicObject(11353, -1930.77, 140.78, 27.86,   0.00, -40.00, 0.00);
	CreateDynamicObject(673, -1998.70, 164.48, 26.80,   3.00, 47.00, -11.00);
	CreateDynamicObject(673, -1998.36, 157.42, 26.80,   3.00, 76.00, -11.00);
	CreateDynamicObject(673, -1998.69, 151.18, 26.80,   3.00, -11.00, -11.00);
	CreateDynamicObject(673, -1998.56, 131.85, 26.80,   84.00, -11.00, -200.00);
	CreateDynamicObject(1226, -2012.62, 151.32, 29.87,   3.00, 42.00, 0.00);
	CreateDynamicObject(987, -1940.81, 239.26, 32.87,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, -1908.69, 277.91, 40.29,   0.00, 0.00, 0.00);
	CreateDynamicObject(11011, -2133.77, -130.97, 38.29,   360.00, 0.00, 90.50);
	CreateDynamicObject(10984, -2027.70, 128.76, 28.12,   356.86, 0.00, 3.14);
	CreateDynamicObject(10984, -2036.41, 126.25, 28.12,   356.86, 0.00, 3.14);
	CreateDynamicObject(10984, -2024.61, 127.71, 27.89,   356.86, 0.00, 3.14);
	CreateDynamicObject(11389, -2048.12, 166.72, 30.98,   356.86, 0.00, 3.14);
	CreateDynamicObject(731, -1657.46, 649.75, 9.97,   0.00, -47.00, 47.00);
	CreateDynamicObject(11293, -1705.35, 377.33, 8.34,   -4.00, 84.00, 40.00);
	CreateDynamicObject(10838, -1744.15, -558.63, 0.82,   120.00, 84.00, 0.00);
	CreateDynamicObject(10757, -1743.24, -544.19, 0.29,   357.00, 91.00, -1.00);
	CreateDynamicObject(10811, -1612.09, -648.14, 25.08,   356.86, 0.00, 3.14);
	CreateDynamicObject(10811, -1614.54, -593.15, 25.08,   356.86, 0.00, 3.14);
	CreateDynamicObject(3873, -2079.84, -805.55, 36.94,   357.00, 25.00, 17.00);
	CreateDynamicObject(3873, -2078.43, -896.85, 39.25,   331.00, 360.00, 3.00);
	CreateDynamicObject(3873, -2081.85, -858.97, 41.89,   345.00, 4.00, 3.00);
	CreateDynamicObject(791, -1974.75, -1789.28, 22.55,   356.86, 0.00, 3.14);
	CreateDynamicObject(791, -1999.65, -1823.52, 28.71,   356.86, 0.00, 3.14);
	CreateDynamicObject(791, -2032.32, -1861.87, 43.22,   356.86, 0.00, 3.14);
	CreateDynamicObject(791, -1800.58, -1779.29, 22.55,   356.86, 0.00, 3.14);
	CreateDynamicObject(791, -1786.53, -1740.24, 17.27,   356.86, 0.00, 3.14);
	CreateDynamicObject(791, -1743.75, -1778.46, 22.55,   356.86, 0.00, 3.14);
	CreateDynamicObject(791, -1704.31, -1745.58, 5.49,   356.86, 0.00, 3.14);
	CreateDynamicObject(791, -1738.10, -1710.79, 5.49,   356.86, 0.00, 3.14);
	CreateDynamicObject(791, -1841.53, -1772.32, 17.27,   356.86, 0.00, 3.14);
	CreateDynamicObject(791, -1881.93, -1811.35, 17.27,   356.86, 0.00, 3.14);
	CreateDynamicObject(791, -1929.98, -1842.14, 17.27,   356.86, 0.00, 3.14);
	CreateDynamicObject(11677, -1305.12, 2664.33, 50.38,   3.00, 55.00, 105.00);
	CreateDynamicObject(3243, -864.61, 2764.40, 45.14,   3.14, 0.00, 0.73);
	CreateDynamicObject(3259, 264.22, 1454.15, 9.59,   84.00, 4.00, -40.00);
	CreateDynamicObject(987, 2381.29, 1043.54, 9.73,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, 2387.81, 1483.60, 9.88,   0.00, 0.00, 0.00);
	CreateDynamicObject(8397, 2101.45, 1284.47, 15.76,   357.00, 25.00, 3.00);
	CreateDynamicObject(8394, 2021.32, 1439.49, 19.59,   0.00, 18.00, 0.00);
	CreateDynamicObject(8493, 1988.77, 1543.18, 20.92,   357.00, -33.00, 3.00);
	CreateDynamicObject(8832, 1910.41, 1511.48, 3.57,   -178.00, 171.00, 84.00);
	CreateDynamicObject(10984, 1921.83, 1610.28, 21.73,   0.00, 0.00, 0.00);
	CreateDynamicObject(10984, 1928.30, 1609.04, 21.73,   0.00, 0.00, 0.00);
	CreateDynamicObject(10984, 1929.46, 1616.83, 21.73,   0.00, 0.00, 0.00);
	CreateDynamicObject(10984, 1933.39, 1627.48, 21.73,   0.00, 0.00, 0.00);
	CreateDynamicObject(10984, 1936.75, 1622.85, 21.73,   0.00, 0.00, 0.00);
	CreateDynamicObject(10984, 1937.60, 1616.35, 21.73,   0.00, 0.00, 0.00);
	CreateDynamicObject(10984, 1936.64, 1607.35, 21.73,   0.00, 0.00, 0.00);
	CreateDynamicObject(10984, 1949.14, 1605.15, 21.73,   0.00, 0.00, 0.00);
	CreateDynamicObject(10984, 1944.28, 1600.28, 22.50,   0.00, 0.00, 0.00);
	CreateDynamicObject(10984, 1944.28, 1600.28, 22.50,   0.00, 0.00, 0.00);
	CreateDynamicObject(10984, 1949.31, 1616.46, 22.50,   0.00, 0.00, 0.00);
	CreateDynamicObject(10984, 1957.84, 1594.82, 22.50,   0.00, 0.00, 0.00);
	CreateDynamicObject(10984, 1951.10, 1590.75, 22.50,   0.00, 0.00, 0.00);
	CreateDynamicObject(10984, 1919.78, 1617.04, 22.50,   0.00, 0.00, 0.00);
	CreateDynamicObject(10984, 1909.73, 1611.70, 22.50,   0.00, 0.00, 0.00);
	CreateDynamicObject(10984, 1905.83, 1625.02, 22.50,   0.00, 0.00, 0.00);
	CreateDynamicObject(10984, 1918.52, 1629.47, 22.50,   0.00, 0.00, 0.00);
	CreateDynamicObject(10984, 1926.10, 1632.28, 22.50,   0.00, 0.00, 0.00);
	CreateDynamicObject(10984, 1931.18, 1642.50, 22.50,   0.00, 0.00, 0.00);
	CreateDynamicObject(10984, 1941.78, 1637.11, 22.50,   0.00, 0.00, 0.00);
	CreateDynamicObject(10984, 1915.83, 1640.04, 22.50,   0.00, 0.00, 0.00);
	CreateDynamicObject(10984, 1905.23, 1639.38, 22.50,   0.00, 0.00, 0.00);
	CreateDynamicObject(3530, 1984.26, 1588.55, 27.19,   0.00, 0.00, 0.00);
	CreateDynamicObject(3530, 1970.25, 1567.53, 30.21,   0.00, 0.00, 0.00);
	CreateDynamicObject(3530, 1944.00, 1568.86, 30.33,   0.00, 0.00, 0.00);
	CreateDynamicObject(3530, 1948.60, 1595.55, 27.29,   0.00, 0.00, 0.00);
	CreateDynamicObject(3530, 1985.90, 1669.78, 27.34,   0.00, 0.00, 0.00);
	CreateDynamicObject(3530, 1932.14, 1678.01, 27.34,   0.00, 0.00, 0.00);
	CreateDynamicObject(3530, 1932.11, 1653.18, 27.34,   0.00, 0.00, 0.00);
	CreateDynamicObject(3530, 1961.82, 1649.45, 27.34,   0.00, 0.00, 0.00);
	CreateDynamicObject(3887, 1892.97, 1627.33, 28.32,   0.00, 0.00, 0.00);
	CreateDynamicObject(3866, 1908.62, 1669.52, 32.07,   0.00, 0.00, 0.00);
	CreateDynamicObject(1383, 1873.56, 1626.90, 40.38,   0.00, 0.00, 0.00);
	CreateDynamicObject(1388, 1873.72, 1625.59, 71.37,   0.00, 0.00, -63.00);
	CreateDynamicObject(8620, 2108.38, 1009.61, 30.00,   338.00, 4.00, 3.00);
	CreateDynamicObject(987, 1969.01, 2168.03, 10.18,   0.00, 0.00, -91.00);
	CreateDynamicObject(987, 2071.26, -1836.67, 11.51,   0.00, 0.00, 91.00);
	CreateDynamicObject(3763, 1467.73, -811.35, 110.10,   357.00, 47.00, -84.00);
	CreateDynamicObject(13831, 1418.41, -806.24, 74.36,   316.00, 4.00, 3.00);
	CreateDynamicObject(987, 1038.45, -1025.85, 30.61,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, 1019.38, -1029.31, 29.73,   0.00, 0.00, 0.00);
	CreateDynamicObject(987, 482.91, -1734.97, 9.30,   0.00, 0.00, -11.00);
	CreateDynamicObject(3336, -16.35, -1525.75, 1.07,   3.00, 47.00, 0.00);

	// Connor And hannibal base? Forest mapping?

	CreateDynamicObject(791,2301.6550300,-641.1397700,125.7763300,3.1415900,0.0000000,-7.3826500); //
	CreateDynamicObject(791,2326.5266100,-676.9769300,127.3050300,3.1415900,0.0000000,-73.2026600); //
	CreateDynamicObject(791,2326.5266100,-676.9769300,127.3050300,3.1415900,0.0000000,-73.2026600); //
	CreateDynamicObject(791,2326.5266100,-676.9769300,127.3050300,3.1415900,0.0000000,-73.2026600); //
	CreateDynamicObject(791,2335.9314000,-713.4489700,126.5939900,3.1415900,0.0000000,-160.5026700); //
	CreateDynamicObject(791,2374.1999500,-697.3662700,123.1045500,3.1415900,0.0000000,-186.2426500); //
	CreateDynamicObject(791,2430.1311000,-671.3928200,117.4614500,3.1415900,0.0000000,0.7049100); //
	CreateDynamicObject(791,2473.0346700,-665.8646900,110.7001700,3.1415900,0.0000000,-9.7950900); //
	CreateDynamicObject(791,2366.0693400,-718.0877100,108.7427300,3.1415900,0.0000000,-9.7950900); //
	CreateDynamicObject(791,2459.3225100,-626.1931200,110.1767800,3.1415900,0.0000000,-9.7950900); //
	CreateDynamicObject(791,2368.6408700,-593.5804400,111.9769100,3.1415900,0.0000000,-9.7950900); //
	CreateDynamicObject(791,2395.8410600,-574.0816000,107.2559100,3.1415900,0.0000000,-52.1550900); //
	CreateDynamicObject(791,2322.0024400,-574.3596800,120.2097200,3.1415900,0.0000000,0.9573500); //
	CreateDynamicObject(791,2306.8198200,-550.5570700,118.0751300,3.1415900,0.0000000,-50.5826500); //
	CreateDynamicObject(791,2349.2641600,-547.9115000,107.2153600,3.1415900,0.0000000,-135.0150600); //
	CreateDynamicObject(791,2391.5581100,-544.5661600,101.3373000,3.1415900,0.0000000,-135.0150600); //
	CreateDynamicObject(791,2402.7375500,-618.3230000,114.9722100,3.1415900,0.0000000,-52.1550900); //
	CreateDynamicObject(791,2428.5783700,-606.3957500,110.0672800,3.1415900,0.0000000,-192.2550700); //
	CreateDynamicObject(791,2427.2675800,-578.1110200,102.4108100,3.1415900,0.0000000,-211.3350200); //
	CreateDynamicObject(791,2460.3227500,-590.7644700,96.7019600,3.1415900,0.0000000,-202.7549700); //
	CreateDynamicObject(791,2445.1894500,-557.3277000,95.2074500,3.1415900,0.0000000,-207.3149400); //
	CreateDynamicObject(791,2416.2258300,-548.9054000,94.1400700,3.1415900,0.0000000,-324.6749600); //
	CreateDynamicObject(694,2487.9924300,-725.4207800,102.9719600,3.1415900,0.0000000,2.8536100); //
	CreateDynamicObject(694,2463.1474600,-722.8852500,110.5962200,3.1415900,0.0000000,2.8536100); //
	CreateDynamicObject(694,2443.3979500,-713.5817900,109.7023400,3.1415900,0.0000000,-15.7463900); //
	CreateDynamicObject(791,2477.0695800,-714.9096700,98.6951100,3.1415900,0.0000000,0.7049100); //
	CreateDynamicObject(791,2405.2092300,-745.4256000,98.6951100,3.1415900,0.0000000,0.7049100); //
	CreateDynamicObject(791,2330.6484400,-742.6015600,127.3906300,3.1415900,0.0000000,0.1165700); //
	CreateDynamicObject(791,2330.6484400,-742.6015600,127.3906300,3.1415900,0.0000000,0.1165700); //
	CreateDynamicObject(791,2366.5766600,-763.9682000,122.3910800,3.1415900,0.0000000,0.1165700); //
	CreateDynamicObject(791,2399.2026400,-793.1178000,111.7046100,3.1415900,0.0000000,0.1165700); //
	CreateDynamicObject(791,2427.9804700,-775.0538300,107.8188600,3.1415900,0.0000000,0.1165700); //
	CreateDynamicObject(791,2461.6943400,-776.6239000,95.8450600,3.1415900,0.0000000,0.1165700); //
	CreateDynamicObject(791,2430.9616700,-798.1784700,106.1013600,3.1415900,0.0000000,0.1165700); //
	CreateDynamicObject(791,2325.2224100,-765.0423600,120.0706000,3.1415900,0.0000000,0.1165700); //
	CreateDynamicObject(791,2346.9716800,-789.2402300,119.1665300,3.1415900,0.0000000,-30.9634200); //
	CreateDynamicObject(791,2375.5151400,-811.6946400,113.8826300,3.1415900,0.0000000,-69.4834400); //
	CreateDynamicObject(791,2415.7194800,-823.2378500,98.8365400,3.1415900,0.0000000,-114.5434400); //
	CreateDynamicObject(791,2308.6604000,-701.5133700,120.1223800,3.1415900,0.0000000,-7.3826500); //
	CreateDynamicObject(791,2282.0332000,-577.3933700,123.9327900,3.1415900,0.0000000,-7.3826500); //
	CreateDynamicObject(791,2267.4006300,-614.3520500,118.0790300,3.1415900,0.0000000,-32.4026500); //
	CreateDynamicObject(791,2251.4577600,-607.7739900,111.8513000,3.1415900,0.0000000,-111.5426600); //
	CreateDynamicObject(791,2210.2473100,-563.8407600,111.8513000,3.1415900,0.0000000,-111.5426600); //
	CreateDynamicObject(791,2203.9123500,-596.1540500,110.2658600,3.1415900,0.0000000,-161.6426700); //
	CreateDynamicObject(791,2173.5363800,-581.8625500,110.4839800,3.1415900,0.0000000,-230.7626300); //
	CreateDynamicObject(791,2166.0412600,-555.1674800,108.4526600,3.1415900,0.0000000,-243.0626100); //
	CreateDynamicObject(791,2148.1291500,-566.1734000,108.4526600,3.1415900,0.0000000,-279.3026100); //
	CreateDynamicObject(791,2122.3139600,-544.1029700,108.4526600,3.1415900,0.0000000,-298.6225300); //
	CreateDynamicObject(791,2462.7729500,-535.0039700,91.2946100,3.1415900,0.0000000,-207.3149400); //
	CreateDynamicObject(791,2486.1933600,-581.8939800,98.0422700,3.1415900,0.0000000,-207.3149400); //
	CreateDynamicObject(791,2491.2595200,-627.5661600,95.8599700,3.1415900,0.0000000,-256.4549000); //
	CreateDynamicObject(791,2487.6977500,-541.5359500,88.4898000,3.1415900,0.0000000,-207.3149400); //
	CreateDynamicObject(791,2504.7773400,-549.5148300,87.1071400,3.1415900,0.0000000,-243.4349500); //
	CreateDynamicObject(791,2484.8540000,-498.3748500,84.8751400,3.1415900,0.0000000,-300.3749700); //
	CreateDynamicObject(791,2515.5620100,-511.0711400,83.9087300,3.1415900,0.0000000,-300.3749700); //
	CreateDynamicObject(791,2527.7004400,-524.3878800,81.5670900,3.1415900,0.0000000,-340.2749900); //
	CreateDynamicObject(791,2505.2204600,-682.9743000,103.7899600,3.1415900,0.0000000,-27.9150900); //
	CreateDynamicObject(791,2486.4223600,-772.2260700,89.9790100,3.1415900,0.0000000,-12.3634300); //
	CreateDynamicObject(694,2530.3127400,-710.6442300,97.9488200,3.1415900,0.0000000,57.7536100); //
	CreateDynamicObject(791,2458.9753400,-803.1990400,92.9651300,3.1415900,0.0000000,-10.2634300); //
	CreateDynamicObject(791,2501.3129900,-792.6469100,87.7027100,3.1415900,0.0000000,-10.2634300); //
	CreateDynamicObject(791,2379.9882800,-818.4045400,112.2755400,3.1415900,0.0000000,-96.4234500); //
	CreateDynamicObject(791,2293.5783700,-783.2609300,116.3740300,3.1415900,0.0000000,0.1165700); //
	CreateDynamicObject(791,2257.1638200,-802.2265600,114.5257900,3.1415900,0.0000000,-67.1434300); //
	CreateDynamicObject(791,2225.4404300,-813.4106400,109.5944900,3.1415900,0.0000000,-89.5834400); //
	CreateDynamicObject(791,2308.4653300,-817.7786900,111.9865300,3.1415900,0.0000000,-67.1434300); //
	CreateDynamicObject(791,2343.2670900,-829.1758400,111.8874500,3.1415900,0.0000000,-67.1434300); //
	CreateDynamicObject(791,2277.2304700,-822.5178800,110.8757100,3.1415900,0.0000000,-98.8834400); //
	CreateDynamicObject(791,2303.7983400,-837.2136800,109.1703500,3.1415900,0.0000000,-85.0834400); //
	CreateDynamicObject(791,2239.2175300,-834.5745800,109.7822500,3.1415900,0.0000000,-52.9234400); //
	CreateDynamicObject(791,2262.4353000,-849.7287000,109.4579200,3.1415900,0.0000000,-30.4234400); //
	CreateDynamicObject(791,2305.4550800,-857.6964100,105.3349700,3.1415900,0.0000000,-85.0834400); //
	CreateDynamicObject(791,2335.4265100,-861.2268100,104.3713200,3.1415900,0.0000000,-16.2634400); //
	CreateDynamicObject(791,2383.0395500,-857.2069100,101.9310300,3.1415900,0.0000000,-46.6234400); //
	CreateDynamicObject(791,2300.8056600,-738.6992800,120.1223800,3.1415900,0.0000000,-26.7626500); //
	CreateDynamicObject(791,2300.4021000,-669.2219200,120.1223800,3.1415900,0.0000000,-7.3826500); //
	CreateDynamicObject(1224,2352.9243200,-658.3720700,127.5013000,0.0000000,0.0000000,1.0800000); //
	CreateDynamicObject(1431,2352.7907700,-659.6849400,127.4910900,0.0000000,0.0000000,-25.5600000); //
	CreateDynamicObject(693,2348.7580600,-635.1323200,130.9990500,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(3415,2361.6735800,-654.8275100,126.8652600,0.0000000,0.0000000,-424.0799600); //
	CreateDynamicObject(1431,2350.9150400,-659.3156700,127.4910900,0.0000000,0.0000000,0.0000000); //
	CreateDynamicObject(1224,2351.3735400,-658.2169200,127.5013000,0.0000000,0.0000000,1.0800000); //
	CreateDynamicObject(1280,2354.3872100,-658.0295400,127.3839500,0.0000000,0.0000000,-180.2999900); //
	CreateDynamicObject(1280,2350.6728500,-660.4805300,127.5368900,0.0000000,0.0000000,-273.3600200); //
	CreateDynamicObject(1328,2354.3989300,-651.2922400,127.4558700,0.0000000,0.0000000,0.0000000); //

	/*
	Objects converted: 85
	Vehicles converted: 0
	Vehicle models found: 0
	----------------------
	In the time this conversion took to finish 0.01 micro-fortnights have passed!
	*/


	// 2k9 ISLAND
	/*
	CreateDynamicObject(16258, 786.93988, -2788.77954, -49.05000,   0.00000, 0.00000, 256.00000);
	CreateDynamicObject(14393, 775.37000, -2852.29004, 1000.00000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(11490, 775.37000, -2852.29004, 3.10000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(11491, 775.35999, -2841.22998, 4.58000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1736, 775.34003, -2845.35010, 7.99000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1828, 773.87000, -2849.02002, 4.71000,   0.00000, 0.00000, 972.00000);
	CreateDynamicObject(11665, 778.15997, -2848.56006, 5.26000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(11631, 778.71997, -2855.77002, 5.83000,   0.00000, 0.00000, 2700.00000);
	CreateDynamicObject(1723, 773.44000, -2851.88989, 4.54000,   0.00000, 0.00000, 500.00000);
	CreateDynamicObject(1723, 771.83002, -2847.91992, 4.66000,   0.00000, 0.00000, 62.00000);
	CreateDynamicObject(1646, 752.71997, -2828.77002, 2.90000,   14.00000, 4.00000, 134.00000);
	CreateDynamicObject(1637, 797.77014, -2739.31738, 3.54000,   0.00000, 0.00000, 562.00000);
	CreateDynamicObject(1645, 755.38000, -2829.87012, 2.99000,   6.00000, 4.00000, 162.00000);
	CreateDynamicObject(3461, 753.23999, -2830.52002, 4.41000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3461, 781.96997, -2839.11011, 4.63000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3461, 770.20001, -2838.89990, 4.48000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3461, 793.46997, -2849.87012, 4.44000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3461, 754.58002, -2849.57007, 4.98000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3524, 775.39001, -2844.55005, 2.85000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(628, 771.83002, -2849.18994, 6.44000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(711, 758.59998, -2831.96997, 7.29000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(711, 749.40997, -2825.10010, 6.21000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(711, 753.79999, -2834.20996, 7.37000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(711, 749.48999, -2830.80005, 6.95000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(746, 752.78998, -2831.86011, 3.20000,   0.00000, 0.00000, 710.00000);
	CreateDynamicObject(747, 749.71997, -2827.76001, 2.57000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(745, 758.79999, -2833.51001, 2.69000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(745, 803.76001, -2745.09009, 1.77000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(758, 788.50000, -2746.62988, 0.27000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3461, 795.44000, -2739.26001, 3.97000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(745, 797.69000, -2751.66992, 0.99000,   -4.00000, -374.00000, -252.00000);
	CreateDynamicObject(747, 809.92999, -2740.48999, 0.77000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(880, 808.08301, -2757.16699, 0.60000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1461, 797.71997, -2743.16992, 3.08000,   0.00000, 0.00000, 292.00000);
	CreateDynamicObject(620, 803.79999, -2743.12988, 2.03000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(746, 799.40997, -2735.66992, 2.23000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3507, 798.96002, -2732.96997, 1.89000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1642, 790.47998, -2740.71997, 1.56000,   1272.00000, 168.00000, 272.00000);
	CreateDynamicObject(3626, 743.32001, -2850.70996, 2.47000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3626, 747.09003, -2850.70996, 2.47000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(3525, 664.72998, -2830.13989, 46.47000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14392, 775.50000, -2852.23999, 998.98999,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14391, 776.41998, -2853.20996, 998.77002,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(16501, 784.19000, -2853.81006, 998.32001,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(14402, 771.52002, -2841.30005, 3.76000,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(14402, 778.75000, -2839.20996, 3.86000,   0.00000, 0.00000, -85.00000);
	CreateDynamicObject(14402, 775.75000, -2839.20996, 3.86000,   0.00000, 0.00000, -85.00000);
	CreateDynamicObject(18368, 788.34003, -2837.38989, -1.21000,   0.00000, 0.00000, 81.00000);
	CreateDynamicObject(1481, 781.34998, -2842.12012, 5.28000,   0.00000, 0.00000, 270.00000);
	CreateDynamicObject(1209, 773.21002, -2856.27002, 4.59000,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(749, 799.59003, -2844.19995, 2.62000,   0.00000, -88.00000, 149.00000);
	CreateDynamicObject(751, 805.58002, -2847.05005, 0.92000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(751, 796.15997, -2840.43994, 2.72000,   0.00000, -88.00000, 497.00000);
	CreateDynamicObject(751, 792.20001, -2838.63989, 2.80000,   0.00000, 271.00000, 153.00000);
	CreateDynamicObject(751, 787.71002, -2838.40991, 2.69000,   0.00000, -88.00000, 179.00000);
	CreateDynamicObject(751, 787.41998, -2838.27002, 3.04000,   -41.00000, -94.00000, 361.00000);
	CreateDynamicObject(747, 787.40814, -2838.91138, 2.91000,   0.00000, 0.00000, 202.00000);
	CreateDynamicObject(14402, 782.42999, -2841.30005, 3.83000,   0.00000, 0.00000, 30.00000);
	CreateDynamicObject(820, 795.64001, -2835.28003, -0.28000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(820, 799.63000, -2835.72998, -0.33000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(820, 802.53003, -2839.64990, -0.18000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(820, 804.17999, -2843.66992, -0.28000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(820, 792.40997, -2836.37988, -0.26000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(856, 788.64001, -2842.88989, 3.27000,   0.00000, 0.00000, 7.00000);
	CreateDynamicObject(822, 802.60999, -2848.10010, 3.68000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(813, 795.38000, -2842.32007, 5.20000,   0.00000, 0.00000, 54.00000);
	CreateDynamicObject(814, 798.97998, -2854.15991, 3.14000,   0.00000, 0.00000, 143.00000);
	CreateDynamicObject(728, 795.91998, -2845.09009, 3.14000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(762, 799.09998, -2850.16992, 3.14000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(800, 742.48999, -2837.13989, 3.84000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(803, 751.95001, -2839.79004, 5.83000,   0.00000, 0.00000, 11.00000);
	CreateDynamicObject(805, 760.97998, -2837.94995, 4.35000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(762, 745.30237, -2836.27319, 6.29000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(762, 736.39001, -2842.14990, 6.23000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(762, 733.84003, -2852.46997, 5.07000,   0.00000, 0.00000, 33.00000);
	CreateDynamicObject(762, 734.21997, -2860.72998, 6.69000,   0.00000, 0.00000, 99.00000);
	CreateDynamicObject(762, 736.84650, -2869.74780, 7.06000,   0.00000, 0.00000, 286.43997);
	CreateDynamicObject(800, 754.09003, -2844.79004, 4.80000,   0.00000, 0.00000, 68.00000);
	CreateDynamicObject(800, 759.25000, -2841.55005, 4.15000,   0.00000, 0.00000, 215.00000);
	CreateDynamicObject(762, 805.72998, -2736.91992, 4.55000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1432, 779.65002, -2840.88989, 4.67000,   0.00000, 0.00000, 52.50000);
	CreateDynamicObject(1280, 784.81000, -2837.28003, 3.65000,   0.00000, 0.00000, -90.00000);
	CreateDynamicObject(3092, 1480.94995, -1750.66003, 34.85000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1234, 1480.95996, -1750.93994, 33.99000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(8172, 871.84003, -2872.52002, 0.90000,   0.00000, 0.00000, 86.28000);
	CreateDynamicObject(17030, 820.59998, -2892.00000, -4.33000,   0.00000, 0.00000, -133.02000);
	CreateDynamicObject(17030, 860.28998, -2896.48999, -4.33000,   0.00000, 0.00000, -133.02000);
	CreateDynamicObject(17030, 898.85840, -2899.63403, -4.33000,   0.00000, 0.00000, -129.30016);
	CreateDynamicObject(17030, 898.14001, -2852.42993, -4.33000,   0.00000, 0.00000, -313.85999);
	CreateDynamicObject(17030, 852.84003, -2848.84009, -4.40000,   0.00000, 0.00000, -313.85999);
	CreateDynamicObject(17030, 828.58002, -2849.38989, -4.40000,   0.00000, 0.00000, -309.54001);
	CreateDynamicObject(620, 976.09003, -2860.36011, -0.58000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(620, 973.51001, -2893.38989, -0.17000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(620, 965.21002, -2845.59009, 0.52000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(620, 956.14001, -2841.54004, 0.52000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(620, 942.52002, -2841.36011, 0.52000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(620, 931.90997, -2847.01001, 0.52000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(620, 961.73999, -2900.76001, -0.91000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(620, 968.01001, -2897.59009, -0.67000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1515, 779.45001, -2846.56006, 4.56000,   0.00000, 0.00000, -89.28000);
	CreateDynamicObject(14467, 976.28998, -2887.25000, 2.68000,   0.00000, 0.00000, -229.98000);
	CreateDynamicObject(14467, 976.77002, -2863.92993, 2.68000,   0.00000, 0.00000, -311.28000);
	CreateDynamicObject(620, 971.00000, -2852.96997, -0.58000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3934, 744.77002, -2850.76001, 4.04000,   0.00000, 0.00000, -91.02000);
	CreateDynamicObject(17030, 811.97906, -2891.91040, -13.51000,   0.00000, 0.00000, -134.76009);
	CreateDynamicObject(3462, 926.81000, -2750.82007, 3.56000,   0.00000, 0.00000, -175.74001);
	CreateDynamicObject(3462, 925.58002, -2752.61011, 3.56000,   0.00000, 0.00000, -253.38000);
	CreateDynamicObject(3462, 924.06000, -2751.31006, 3.56000,   0.00000, 0.00000, -348.23999);
	CreateDynamicObject(3462, 925.20001, -2749.68994, 3.56000,   0.00000, 0.00000, -442.38000);
	CreateDynamicObject(14467, 925.62000, -2750.78003, 4.49000,   0.00000, 0.00000, 86.94000);
	CreateDynamicObject(620, 940.82001, -2758.56006, -0.60000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(620, 934.00000, -2761.53003, -0.60000,   0.00000, 0.00000, -48.90000);
	CreateDynamicObject(620, 925.88000, -2763.66992, -0.60000,   0.00000, 0.00000, -95.04000);
	CreateDynamicObject(620, 919.26001, -2760.61011, -0.60000,   0.00000, 0.00000, -113.16000);
	CreateDynamicObject(620, 914.84003, -2755.80005, -0.60000,   0.00000, 0.00000, -124.98000);
	CreateDynamicObject(620, 917.84003, -2748.46997, -0.60000,   0.00000, 0.00000, -136.08000);
	CreateDynamicObject(620, 924.44000, -2742.66992, -0.60000,   0.00000, 0.00000, -156.96001);
	CreateDynamicObject(620, 934.40997, -2742.72998, -0.02000,   0.00000, 0.00000, -161.39999);
	CreateDynamicObject(620, 936.94000, -2750.09009, 0.33000,   0.00000, 0.00000, -161.39999);
	CreateDynamicObject(17030, 941.12000, -2900.73999, -4.33000,   0.00000, 0.00000, -121.32000);
	CreateDynamicObject(16258, 744.07001, -2814.36011, -55.56000,   -2.10000, -4.20000, 284.22000);
	CreateDynamicObject(16258, 773.66998, -2814.32007, -53.78550,   -2.10000, -4.20000, 284.22000);
	CreateDynamicObject(16258, 786.40997, -2840.44995, -55.73000,   -2.10000, -4.20000, 307.50000);
	CreateDynamicObject(16258, 720.40997, -2849.98999, -55.56000,   -2.10000, -4.20000, 307.50000);
	CreateDynamicObject(16258, 823.26874, -2897.03467, -52.60092,   -2.10000, -4.20000, 223.92018);
	CreateDynamicObject(11495, 785.94000, -2758.38989, 0.55000,   0.00000, 0.00000, 140.98000);
	CreateDynamicObject(11495, 819.78998, -2747.08008, 0.55000,   0.00000, 0.00000, 85.00000);
	CreateDynamicObject(11495, 841.65002, -2748.98999, 0.55000,   0.00000, 0.00000, 85.00000);
	CreateDynamicObject(11495, 863.45001, -2750.90991, 0.55000,   0.00000, 0.00000, 85.00000);
	CreateDynamicObject(11495, 885.25000, -2753.26001, 0.55000,   0.00000, 0.00000, 82.66000);
	CreateDynamicObject(11495, 906.96002, -2756.06006, 0.55000,   0.00000, 0.00000, 82.66000);
	CreateDynamicObject(11495, 928.63000, -2767.85010, 0.55000,   0.00000, 0.00000, 8.98000);
	CreateDynamicObject(11495, 931.98999, -2788.83008, 2.79000,   -12.12000, 0.48000, 8.98000);
	CreateDynamicObject(11495, 938.23999, -2827.98999, 0.24000,   0.00000, 0.00000, 8.98000);
	CreateDynamicObject(11495, 935.32001, -2809.79004, 2.24000,   15.18000, -0.06000, 8.98000);
	CreateDynamicObject(11495, 940.96997, -2846.04004, 0.24000,   0.00000, 0.00000, 8.98000);
	CreateDynamicObject(13755, 761.54999, -2913.00000, 6.14000,   0.00000, 0.00000, -200.16000);
	CreateDynamicObject(7096, 763.68079, -2938.72974, 6.11286,   0.48000, -1.20000, -213.71951);
	CreateDynamicObject(620, 767.35950, -2951.85059, -3.15241,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(620, 760.77002, -2946.32007, -5.28000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(620, 747.17999, -2944.93994, -5.28000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(620, 735.34998, -2940.03003, -5.77000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(620, 730.52002, -2929.12988, -5.77000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(620, 727.98999, -2917.76001, -5.77000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(620, 722.34998, -2904.84009, -6.99000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(620, 722.19000, -2891.85010, -6.99000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(620, 722.34998, -2877.06006, -6.99000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(620, 728.09003, -2867.31006, -6.99000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(11495, 772.17999, -2775.39990, 0.55000,   0.00000, 0.00000, 140.98000);
	CreateDynamicObject(11495, 758.40997, -2792.46997, 0.55000,   0.00000, 0.00000, 140.98000);
	CreateDynamicObject(11495, 744.62000, -2809.61011, 0.55000,   0.00000, 0.00000, 140.98000);
	CreateDynamicObject(11495, 736.98999, -2819.08008, 0.55000,   0.00000, 0.00000, 140.98000);
	CreateDynamicObject(3925, 773.63000, -2892.52002, 4.23000,   -2.46000, -25.50000, -107.04000);
	CreateDynamicObject(3925, 775.81000, -2887.48999, 1.71000,   -2.46000, -25.50000, -107.04000);
	CreateDynamicObject(3925, 771.87000, -2896.59009, 4.23000,   -2.46000, -25.50000, -287.45999);
	CreateDynamicObject(16258, 779.83002, -2777.12988, -54.84000,   -2.10000, -4.20000, 289.56000);
	CreateDynamicObject(16258, 807.28998, -2874.37012, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 839.82330, -2867.16797, -55.50000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(3599, 840.93994, -2953.41968, 5.88563,   0.00000, 0.00000, 25.74000);
	CreateDynamicObject(8572, 836.07001, -2944.57007, 5.51000,   0.00000, 0.00000, -63.42000);
	CreateDynamicObject(620, 802.38281, -2950.26050, -2.96973,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(620, 790.12134, -2965.23022, -4.34000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(620, 811.03998, -2974.37988, -4.34000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(620, 826.65997, -2968.09009, -4.34000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(620, 861.90997, -2957.36011, -4.38000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(620, 857.98468, -2936.96069, -4.38000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(620, 847.67999, -2919.44995, -4.38000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1281, 852.79187, -2953.70532, 4.03000,   0.00000, 0.00000, -155.70000);
	CreateDynamicObject(3461, 856.19733, -2955.22437, 3.28738,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1645, 843.30255, -2970.01709, 2.16000,   0.00000, 0.00000, 4.80000);
	CreateDynamicObject(1645, 852.33771, -2968.41577, 2.16000,   0.00000, 0.00000, 25.38000);
	CreateDynamicObject(1637, 860.10956, -2950.25830, 1.81778,   0.00000, 0.00000, -94.31998);
	CreateDynamicObject(815, 934.88879, -2756.42847, 1.30265,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(814, 926.13873, -2741.54004, 1.54335,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1224, 754.33234, -2855.05200, 4.28098,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1431, 754.65204, -2853.22021, 4.29555,   0.00000, 0.00000, -92.69999);
	CreateDynamicObject(1271, 753.91870, -2853.85742, 4.08394,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(653, 795.39185, -2734.93481, 2.18849,   0.00000, 0.00000, -177.00000);
	CreateDynamicObject(651, 799.57349, -2744.51099, 2.62806,   0.00000, 0.00000, 63.42000);
	CreateDynamicObject(674, 797.72656, -2737.98413, 1.10811,   0.00000, 0.00000, 26.58000);
	CreateDynamicObject(1642, 791.23883, -2742.43481, 1.56000,   1272.00000, 168.00000, 253.10001);
	CreateDynamicObject(16258, 822.94904, -2904.63354, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 790.72662, -2908.24561, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 764.77740, -2887.65796, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 726.02008, -2872.49414, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 745.29468, -2907.06494, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 773.35577, -2930.36987, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 801.08563, -2937.11523, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 807.65399, -2968.58545, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 771.53662, -2972.78125, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 742.58649, -2956.88135, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 716.94458, -2923.15259, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 696.15009, -2886.95166, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 714.25244, -2847.58228, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 767.10925, -3024.78442, -26.63683,   0.00000, 0.00000, 331.24045);
	CreateDynamicObject(16258, 777.86945, -3010.76416, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 797.80353, -3019.74048, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 733.61328, -2998.65698, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 696.75543, -2964.26147, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 680.58777, -2922.83228, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 662.79413, -2957.64429, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 686.56183, -2996.29834, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 714.69940, -3024.53076, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 749.40491, -3038.98438, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 786.19983, -3055.16724, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 815.33521, -3043.27417, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 830.69525, -3024.87793, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 835.78351, -2998.95166, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 695.93597, -2942.30884, -55.56000,   -2.10000, -4.20000, 268.85977);
	CreateDynamicObject(16258, 652.39642, -3002.14941, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 718.63977, -3060.31372, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 681.85077, -3035.91772, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 765.71942, -3079.60278, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 791.91382, -3064.40088, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 733.42346, -3080.01587, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 749.46997, -3081.98828, -26.63683,   0.00000, 0.00000, 179.20085);
	CreateDynamicObject(16258, 754.68927, -3108.11914, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 723.09692, -3107.83594, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 690.00623, -3075.91113, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 671.18341, -3050.78906, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 906.53949, -3046.01538, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 878.26099, -3036.00928, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 936.59302, -3064.52832, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 968.52118, -3080.74536, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 957.59808, -3115.86304, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 856.45355, -3058.04199, -55.67535,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 898.19806, -3074.93384, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 920.85944, -3104.57983, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 826.48621, -3086.51050, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 863.38507, -3088.93823, -54.92426,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 889.94617, -3117.16431, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 796.85297, -3112.95215, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 845.23096, -3131.14746, -54.98264,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 935.13745, -3146.33936, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 900.61273, -3165.38965, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 954.54346, -3250.22827, -55.56000,   -2.10000, -4.20000, 209.39986);
	CreateDynamicObject(16258, 912.74103, -3272.45923, -55.56000,   -2.10000, -4.20000, 195.95992);
	CreateDynamicObject(16258, 881.16193, -3256.80273, -55.56000,   -2.10000, -4.20000, 195.95992);
	CreateDynamicObject(16258, 751.26160, -3141.22900, -55.56000,   -2.10000, -4.20000, 286.44000);
	CreateDynamicObject(16258, 806.56995, -3144.96997, -55.56000,   -2.10000, -4.20000, 286.44000);
	CreateDynamicObject(16258, 782.55017, -3154.59399, -55.56000,   -2.10000, -4.20000, 286.44000);
	CreateDynamicObject(16258, 845.29895, -3157.04639, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(16258, 880.45599, -3158.53784, -55.56000,   -2.10000, -4.20000, 286.67999);
	CreateDynamicObject(12815, 759.65680, -3018.00342, 15.03859,   0.00000, 0.00000, 171.78012);
	CreateDynamicObject(16258, 711.80737, -2909.98511, -49.28473,   -2.10000, -4.20000, 301.92004);
	CreateDynamicObject(16258, 718.11603, -2890.59082, -51.31852,   -2.10000, -4.20000, 301.92004);
	CreateDynamicObject(16258, 867.21143, -3036.09229, -51.31852,   -2.10000, -4.20000, 519.36029);
	CreateDynamicObject(16258, 860.20026, -3050.14917, -48.41490,   -2.10000, -4.20000, 519.36029);
	CreateDynamicObject(1645, 854.58203, -2967.36230, 2.16000,   0.00000, 0.00000, 37.38000);
	CreateDynamicObject(1645, 850.39667, -2969.47241, 2.16000,   0.00000, 0.00000, 25.38000);
	CreateDynamicObject(16258, 684.53400, -2999.95093, -49.28473,   -2.10000, -4.20000, 294.18036);
	CreateDynamicObject(16258, 702.56464, -2951.50562, -49.28473,   -2.10000, -4.20000, 294.18036);
	CreateDynamicObject(16258, 692.05835, -2975.94556, -46.14518,   -2.10000, -4.20000, 295.50031);
	CreateDynamicObject(16258, 675.48322, -3020.74561, -41.45417,   -2.10000, -4.20000, 295.32031);
	CreateDynamicObject(16258, 666.07007, -3047.74512, -49.28473,   -2.10000, -4.20000, 296.76047);
	CreateDynamicObject(16258, 763.15503, -3090.94629, -44.51841,   -2.10000, -4.20000, 442.02026);
	CreateDynamicObject(16258, 753.67303, -3119.86646, -44.51841,   -2.10000, -4.20000, 442.02026);
	CreateDynamicObject(16258, 743.70343, -3151.35010, -44.51841,   -2.10000, -4.20000, 442.02026);
	CreateDynamicObject(16258, 739.09924, -3175.32104, -45.62055,   -2.10000, -4.20000, 445.56012);
	CreateDynamicObject(16258, 731.04059, -3203.35986, -49.18748,   -2.10000, -4.20000, 445.56012);
	CreateDynamicObject(16258, 674.51880, -3225.73999, -52.97625,   -2.10000, -4.20000, 440.76031);
	CreateDynamicObject(12820, 757.54028, -3185.95850, 4.02758,   0.00000, 0.00000, 73.85996);
	CreateDynamicObject(12820, 847.94513, -3232.90015, 4.02758,   0.00000, 0.00000, -376.19983);
	CreateDynamicObject(12820, 800.97394, -3322.95093, 4.02758,   0.00000, 0.00000, -466.01965);
	CreateDynamicObject(12820, 711.07953, -3276.28027, 4.02758,   0.00000, 0.00000, -555.83972);
	CreateDynamicObject(16258, 748.31982, -3224.14648, -49.27903,   -2.10000, -4.20000, 11.34013);
	CreateDynamicObject(16258, 754.68134, -3213.69092, -52.80545,   -2.10000, -4.20000, 11.34013);
	CreateDynamicObject(16258, 827.83563, -3182.13843, -50.07480,   -2.10000, -4.20000, 11.34013);
	CreateDynamicObject(16258, 779.65137, -3154.03442, -33.66273,   -2.10000, -4.20000, 286.44000);
	CreateDynamicObject(16258, 731.08105, -3196.77881, -49.27903,   -2.10000, -4.20000, -5.15988);
	CreateDynamicObject(16258, 712.70581, -3190.95923, -49.27903,   -2.10000, -4.20000, -5.15988);
	CreateDynamicObject(16258, 698.10065, -3186.33887, -49.27903,   -2.10000, -4.20000, -5.15988);
	CreateDynamicObject(16258, 687.80713, -3183.06274, -49.27903,   -2.10000, -4.20000, -4.19988);
	CreateDynamicObject(16258, 673.28375, -3159.19897, -54.31913,   -2.10000, -4.20000, -4.19988);
	CreateDynamicObject(16258, 722.18396, -3313.28491, -49.27903,   -2.10000, -4.20000, 87.60013);
	CreateDynamicObject(16258, 716.44287, -3331.23096, -49.27903,   -2.10000, -4.20000, 87.60013);
	CreateDynamicObject(16258, 711.39703, -3347.15625, -49.27903,   -2.10000, -4.20000, 87.60013);
	CreateDynamicObject(16258, 680.50696, -3366.68701, -54.74156,   -2.10000, -4.20000, 87.60013);
	CreateDynamicObject(16258, 639.53949, -3243.23950, -53.50996,   -2.10000, -4.20000, -51.35990);
	CreateDynamicObject(16258, 639.16174, -3217.21191, -52.76515,   -2.10000, -4.20000, -61.43988);
	CreateDynamicObject(16258, 668.85809, -3113.26978, -49.27903,   -2.10000, -4.20000, -61.43988);
	CreateDynamicObject(16258, 660.59479, -3147.00977, -49.27903,   -2.10000, -4.20000, -61.43988);
	CreateDynamicObject(16258, 649.90253, -3173.31494, -49.53873,   -2.10000, -4.20000, -61.43988);
	CreateDynamicObject(16258, 669.32819, -3220.84155, -54.18450,   -2.10000, -4.20000, -247.85991);
	CreateDynamicObject(16258, 663.65588, -3257.92480, -54.18450,   -2.10000, -4.20000, -247.85991);
	CreateDynamicObject(16258, 651.36139, -3296.11206, -54.18450,   -2.10000, -4.20000, -247.85991);
	CreateDynamicObject(16258, 651.26331, -3330.25415, -54.18450,   -2.10000, -4.20000, -244.50005);
	CreateDynamicObject(16258, 666.12280, -3378.48608, -54.18450,   -2.10000, -4.20000, -233.69998);
	CreateDynamicObject(16258, 644.16107, -3192.96729, -52.90986,   -2.10000, -4.20000, -61.43988);
	CreateDynamicObject(16258, 910.79346, -3298.51831, -55.56000,   -2.10000, -4.20000, 195.95992);
	CreateDynamicObject(16258, 908.97284, -3319.89111, -55.56000,   -2.10000, -4.20000, 195.95992);
	CreateDynamicObject(16258, 905.18188, -3341.15454, -55.56000,   -2.10000, -4.20000, 195.95992);
	CreateDynamicObject(16258, 870.59998, -3288.80884, -51.70233,   -2.10000, -4.20000, 195.95992);
	CreateDynamicObject(16258, 863.07227, -3314.31592, -54.02438,   -2.10000, -4.20000, 195.95992);
	CreateDynamicObject(16258, 809.38184, -3320.28101, -55.56000,   -2.10000, -4.20000, 195.95992);
	CreateDynamicObject(16258, 877.37390, -3346.68164, -55.56000,   -2.10000, -4.20000, 195.95992);
	CreateDynamicObject(16258, 845.64838, -3335.07544, -55.56000,   -2.10000, -4.20000, 195.95992);
	CreateDynamicObject(16258, 909.03662, -3368.95264, -53.67673,   -2.10000, -4.20000, 200.99971);
	CreateDynamicObject(16258, 802.79517, -3447.39282, -49.85986,   -2.10000, -4.20000, 116.93969);
	CreateDynamicObject(16258, 771.54315, -3439.31006, -54.34014,   -2.10000, -4.20000, 116.93969);
	CreateDynamicObject(16258, 740.42535, -3430.89160, -53.32855,   -2.10000, -4.20000, 116.93969);
	CreateDynamicObject(16258, 713.54504, -3424.02393, -52.81490,   -2.10000, -4.20000, 116.93969);
	CreateDynamicObject(16258, 883.92944, -3301.80249, -51.75740,   -2.10000, -4.20000, 195.95992);
	CreateDynamicObject(16258, 839.82184, -3383.18555, -53.46880,   -2.10000, -4.20000, 131.75977);
	CreateDynamicObject(16258, 749.72510, -3253.17114, -49.27903,   -2.10000, -4.20000, 24.42013);
	CreateDynamicObject(16258, 742.78271, -3275.87769, -49.27903,   -2.10000, -4.20000, 24.42013);
	CreateDynamicObject(16258, 736.97839, -3295.44873, -49.27903,   -2.10000, -4.20000, 24.42013);
	CreateDynamicObject(16258, 937.97650, -3378.16113, -54.54202,   -2.10000, -4.20000, 165.00012);
	CreateDynamicObject(16258, 942.96234, -3359.99316, -53.43024,   -2.10000, -4.20000, 165.00012);
	CreateDynamicObject(16258, 947.67047, -3341.50073, -53.12135,   -2.10000, -4.20000, 165.00012);
	CreateDynamicObject(16258, 953.97736, -3323.62061, -52.50149,   -2.10000, -4.20000, 165.00012);
	CreateDynamicObject(16258, 957.65259, -3304.91138, -52.50149,   -2.10000, -4.20000, 165.00012);
	CreateDynamicObject(16258, 963.07281, -3292.39282, -52.50149,   -2.10000, -4.20000, 165.00012);
	CreateDynamicObject(16258, 967.05408, -3277.02051, -52.50149,   -2.10000, -4.20000, 165.00012);
	CreateDynamicObject(16258, 831.09045, -3213.08179, -50.07480,   -2.10000, -4.20000, 11.34013);
	CreateDynamicObject(620, 782.27679, -3160.46191, -3.90453,   0.00000, 0.00000, 11.10000);
	CreateDynamicObject(620, 818.13104, -3165.36768, -4.66977,   0.00000, 0.00000, -4.38000);
	CreateDynamicObject(620, 853.83978, -3183.08008, -2.71115,   0.00000, 0.00000, -8.28000);
	CreateDynamicObject(620, 858.41388, -3214.31665, -5.28000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(620, 869.38959, -3249.54932, -5.28000,   0.00000, 0.00000, -16.98000);
	CreateDynamicObject(620, 823.55707, -3321.71802, -5.28000,   0.00000, 0.00000, -8.22000);
	CreateDynamicObject(620, 860.60358, -3295.96167, -5.28000,   0.00000, 0.00000, -50.52000);
	CreateDynamicObject(620, 788.95502, -3347.57837, -2.51711,   0.00000, 0.00000, -8.22000);
	CreateDynamicObject(620, 715.54633, -3339.72900, -4.17441,   0.00000, 0.00000, -8.22000);
	CreateDynamicObject(620, 781.93414, -3314.49805, -4.01696,   0.00000, 0.00000, -8.22000);
	CreateDynamicObject(620, 689.00293, -3315.00610, -4.01696,   0.00000, 0.00000, -8.22000);
	CreateDynamicObject(620, 707.15460, -3297.81934, -4.01696,   0.00000, 0.00000, -8.22000);
	CreateDynamicObject(620, 684.54071, -3277.78345, -4.01696,   0.00000, 0.00000, -8.22000);
	CreateDynamicObject(620, 693.54004, -3243.80615, -4.01696,   0.00000, 0.00000, -54.36000);
	CreateDynamicObject(620, 689.97388, -3225.12842, -4.01696,   0.00000, 0.00000, -8.22000);
	CreateDynamicObject(620, 701.61401, -3203.15430, -4.01696,   0.00000, 0.00000, -8.22000);
	CreateDynamicObject(620, 717.20282, -3175.23364, -4.01696,   0.00000, 0.00000, -12.18000);
	CreateDynamicObject(620, 699.59454, -3156.23047, -4.01696,   0.00000, 0.00000, -8.22000);
	CreateDynamicObject(620, 699.41711, -3139.11694, -0.71485,   0.00000, 0.00000, -11.22000);
	CreateDynamicObject(11495, 855.28546, -3007.02686, 0.55000,   0.00000, 0.00000, 36.81997);
	CreateDynamicObject(11495, 866.59851, -3025.52466, 0.55000,   0.00000, 0.00000, 26.19997);
	CreateDynamicObject(11495, 874.26410, -3045.83569, 0.55000,   0.00000, 0.00000, 15.27997);
	CreateDynamicObject(11495, 880.04602, -3067.04761, 0.55000,   0.00000, 0.00000, 15.27997);
	CreateDynamicObject(11495, 880.04010, -3087.18677, 0.55000,   0.00000, 0.00000, -14.18004);
	CreateDynamicObject(762, 731.09045, -2870.50195, 5.07000,   0.00000, 0.00000, 33.00000);
	CreateDynamicObject(762, 726.38385, -2876.66162, 5.07000,   0.00000, 0.00000, 33.00000);
	CreateDynamicObject(762, 724.12170, -2887.08154, 5.07000,   0.00000, 0.00000, 25.20000);
	CreateDynamicObject(762, 728.28119, -2891.21045, 5.07000,   0.00000, 0.00000, 33.00000);
	CreateDynamicObject(762, 731.28223, -2901.97192, 5.07000,   0.00000, 0.00000, 33.00000);
	CreateDynamicObject(800, 734.65552, -2896.97314, 4.15000,   0.00000, 0.00000, 215.00000);
	CreateDynamicObject(800, 734.13068, -2883.30396, 4.15000,   0.00000, 0.00000, 177.26004);
	CreateDynamicObject(800, 734.65552, -2896.97314, 4.15000,   0.00000, 0.00000, 215.00000);
	CreateDynamicObject(800, 733.34412, -2891.05103, 4.15000,   0.00000, 0.00000, 140.06004);
	CreateDynamicObject(800, 733.65448, -2877.41357, 4.15000,   0.00000, 0.00000, 132.02007);
	CreateDynamicObject(800, 741.47937, -2867.28589, 4.15000,   0.00000, 0.00000, 102.14005);
	CreateDynamicObject(800, 741.17999, -2858.39600, 4.15000,   0.00000, 0.00000, 104.00008);
	CreateDynamicObject(762, 737.42029, -2900.09668, 5.07000,   0.00000, 0.00000, -3.78000);
	CreateDynamicObject(745, 740.67072, -2863.67529, 2.69000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(745, 733.91077, -2880.55103, 2.69000,   0.00000, 0.00000, -54.18000);
	CreateDynamicObject(745, 735.79120, -2893.45825, 2.69000,   0.00000, 0.00000, -54.18000);
	CreateDynamicObject(711, 741.35010, -2860.36230, 7.29000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(711, 736.12939, -2876.10938, 7.29000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(711, 734.65778, -2888.88525, 7.29000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(711, 734.43524, -2833.64526, 6.21000,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(856, 803.70544, -2852.77612, 3.27000,   0.00000, 0.00000, -0.50000);
	CreateDynamicObject(747, 780.99170, -2839.53540, 2.91000,   0.00000, 0.00000, 202.00000);
	CreateDynamicObject(12820, 790.43304, -2969.37378, 3.04846,   0.00000, 0.00000, -560.57886);
	CreateDynamicObject(16258, 722.62915, -2877.18579, -51.31852,   -2.10000, -4.20000, 301.92004);
	CreateDynamicObject(16258, 874.18170, -3017.66187, -53.58941,   -2.10000, -4.20000, 519.36029);
	CreateDynamicObject(16258, 882.52826, -2997.69312, -53.79346,   -2.10000, -4.20000, 519.36029);
	CreateDynamicObject(16258, 886.12402, -2984.72974, -53.58941,   -2.10000, -4.20000, 519.36029);
	CreateDynamicObject(16258, 893.49103, -2967.62939, -53.58941,   -2.10000, -4.20000, 520.74023);
	CreateDynamicObject(1645, 856.31989, -2966.08862, 2.16000,   0.00000, 0.00000, 46.32003);
	CreateDynamicObject(1645, 857.81451, -2964.50415, 2.16000,   0.00000, 0.00000, 54.30007);
	CreateDynamicObject(1645, 859.02002, -2962.65405, 2.16000,   0.00000, 0.00000, 57.00007);
	CreateDynamicObject(1645, 847.56396, -2955.83813, 2.16000,   0.00000, 0.00000, 57.00007);
	CreateDynamicObject(3641, 761.03784, -3347.43604, 6.23864,   0.00000, 0.00000, -16.20000);
	CreateDynamicObject(3640, 742.60992, -3338.61450, 8.16753,   0.00000, 0.00000, 163.85995);
	CreateDynamicObject(3639, 704.71246, -3327.72705, 8.23855,   0.00000, 0.00000, -196.37982);
	CreateDynamicObject(3589, 724.66034, -3333.92603, 6.51659,   0.00000, 0.00000, -16.80002);
	CreateDynamicObject(3590, 672.33319, -3298.62280, 6.51750,   0.00000, 0.00000, -105.06001);
	CreateDynamicObject(3642, 675.88733, -3284.09448, 6.40736,   0.00000, 0.00000, -283.55972);
	CreateDynamicObject(9237, 937.08923, -3466.08667, 27.98122,   0.00000, 0.00000, -37.61999);
	CreateDynamicObject(16258, 893.05664, -3415.87622, -40.74892,   -2.10000, -4.20000, 329.03949);
	CreateDynamicObject(10844, 822.20129, -3363.42676, 6.67989,   0.00000, 0.00000, 163.80029);
	CreateDynamicObject(10846, 843.61407, -3374.96411, 10.43586,   0.00000, 0.00000, -15.35999);
	CreateDynamicObject(16258, 893.34064, -3387.18579, -51.33002,   -2.10000, -4.20000, 200.99971);
	CreateDynamicObject(17030, 871.40710, -2927.14624, -5.86022,   0.00000, 0.00000, -217.14012);
	CreateDynamicObject(17030, 841.83514, -3042.88037, -5.86022,   0.00000, 0.00000, -173.04012);
	CreateDynamicObject(17030, 854.32770, -3068.35889, -5.86022,   0.00000, 0.00000, -381.29984);
	CreateDynamicObject(17030, 877.46667, -3378.74072, -1.64393,   0.00000, 0.00000, -442.43964);
	CreateDynamicObject(17030, 867.64984, -3380.01782, -1.64393,   0.00000, 0.00000, -425.81931);
	CreateDynamicObject(17030, 854.37408, -3402.65063, -1.64393,   0.00000, 0.00000, -455.81946);
	CreateDynamicObject(17030, 812.80151, -3421.20313, -1.64393,   0.00000, 0.00000, -654.11926);
	CreateDynamicObject(17030, 797.38098, -3410.83228, -1.64393,   0.00000, 0.00000, -882.65881);
	CreateDynamicObject(17030, 801.52045, -3400.26318, -1.64393,   0.00000, 0.00000, -870.65802);
	CreateDynamicObject(17030, 816.95929, -3393.85083, -1.64393,   0.00000, 0.00000, -708.71826);
	CreateDynamicObject(17030, 802.05829, -3388.00366, -1.64393,   0.00000, 0.00000, -866.87836);
	CreateDynamicObject(17030, 848.98914, -3398.75171, -1.64393,   0.00000, 0.00000, -986.27808);
	CreateDynamicObject(17030, 809.94592, -3379.77295, -1.64393,   0.00000, 0.00000, -1222.61853);
	CreateDynamicObject(17030, 798.55145, -3367.06860, -1.64393,   0.00000, 0.00000, -1496.93835);
	CreateDynamicObject(17030, 791.98303, -3378.50928, -1.64393,   0.00000, 0.00000, -1684.19812);
	CreateDynamicObject(17030, 860.86346, -3384.29736, -1.64393,   0.00000, 0.00000, -588.35956);
	CreateDynamicObject(16258, 945.62750, -2796.30835, -49.00000,   0.00000, 0.00000, -66.90000);
	CreateDynamicObject(10820, 943.24530, -3075.12769, 17.15125,   0.00000, 0.00000, 29.16000);
	CreateDynamicObject(10821, 1074.49768, -2998.03711, 32.99722,   0.00000, 0.00000, -148.79959);
	CreateDynamicObject(10822, 1285.22278, -2874.88135, 26.94393,   0.00000, 0.00000, -150.42012);
	CreateDynamicObject(10823, 1452.82532, -2779.73584, 22.58875,   0.00000, 0.00000, -150.47964);
	CreateDynamicObject(12820, 878.30347, -3160.55542, 3.50835,   0.00000, 0.00000, -514.98022);
	CreateDynamicObject(16258, 796.16382, -3184.32617, -48.61907,   -2.10000, -4.20000, 458.39993);
	CreateDynamicObject(16258, 934.24371, -3253.53174, -52.89593,   -2.10000, -4.20000, 504.47955);
	CreateDynamicObject(16258, 834.91803, -3241.16211, -54.08307,   -2.10000, -4.20000, 462.23975);
	CreateDynamicObject(16258, 880.39490, -3035.37036, -51.65589,   -2.10000, -4.20000, 286.67999);*/

	// *** ISLAND NEAR LS MIDDLE OF WATER! *** //

	CreateDynamicObject(11521,406.19921875,-3405.59960938,-5.50000000,358.00048828,3.99353027,0.13732910); //object(nw_bit_19) (1)
	CreateDynamicObject(11515,348.39941406,-3630.19921875,15.00000000,337.98889160,0.00000000,5.99853516); //object(nw_bit_13) (1)
	CreateDynamicObject(17030,448.70001221,-3539.10009766,12.00000000,0.00000000,0.00000000,264.00000000); //object(cunt_rockgp2_11) (1)
	CreateDynamicObject(17032,467.20001221,-3528.60009766,12.30000019,334.01184082,357.76977539,317.02197266); //object(cunt_rockgp2_14) (1)
	CreateDynamicObject(17031,397.50000000,-3529.10009766,7.69999981,0.00000000,0.00000000,92.00000000); //object(cunt_rockgp2_13) (2)
	CreateDynamicObject(17034,352.10000610,-3525.00000000,0.30000001,1.99401855,357.99499512,8.06945801); //object(cunt_rockgp2_16) (1)
	CreateDynamicObject(17033,384.60000610,-3535.60009766,4.09999990,0.00000000,0.00000000,326.00000000); //object(cunt_rockgp2_15) (2)
	CreateDynamicObject(16409,412.29998779,-3297.50000000,4.00000000,356.00646973,4.00451660,0.27465820); //object(by_weehangr) (1)
	CreateDynamicObject(16409,412.50000000,-3314.19995117,5.30000019,354.49911499,4.00772095,0.37423706); //object(by_weehangr) (2)
	CreateDynamicObject(3388,417.10000610,-3294.89990234,3.70000005,358.00000000,0.00000000,0.00000000); //object(a51_srack4_) (1)
	CreateDynamicObject(3387,417.10000610,-3295.89990234,3.79999995,358.00000000,0.00000000,0.00000000); //object(a51_srack3_) (1)
	CreateDynamicObject(3386,417.00000000,-3296.89990234,3.90000010,358.00000000,0.00000000,0.00000000); //object(a51_srack2_) (1)
	CreateDynamicObject(3390,416.60000610,-3300.10009766,4.09999990,356.00000000,0.00000000,0.00000000); //object(a51_sdsk_ncol1_) (1)
	CreateDynamicObject(3391,411.50000000,-3301.60009766,4.50000000,358.00000000,0.00000000,274.00000000); //object(a51_sdsk_ncol2_) (1)
	CreateDynamicObject(3393,407.20001221,-3301.80004883,4.80000019,356.00000000,0.00000000,276.00000000); //object(a51_sdsk_ncol4_) (1)
	CreateDynamicObject(16782,414.20001221,-3294.39990234,6.19999981,357.99731445,357.24832153,267.89923096); //object(a51_radar_scan) (1)
	CreateDynamicObject(3070,412.10000610,-3301.50000000,5.40000010,0.00000000,0.00000000,0.00000000); //object(kmb_goggles) (1)
	CreateDynamicObject(3277,379.10000610,-3331.69995117,16.20000076,0.00000000,0.00000000,0.00000000); //object(mil_sambase) (1)
	CreateDynamicObject(3884,379.20001221,-3331.80004883,16.29999924,0.00000000,0.00000000,191.99829102); //object(samsite_sfxrf) (1)
	CreateDynamicObject(987,385.39941406,-3367.09960938,9.60000038,0.00000000,0.00000000,0.00000000); //object(elecfence_bar) (1)
	CreateDynamicObject(987,373.50000000,-3367.00000000,9.60000038,0.00000000,0.00000000,0.00000000); //object(elecfence_bar) (2)
	CreateDynamicObject(987,361.60000610,-3367.00000000,9.50000000,0.00000000,0.00000000,0.00000000); //object(elecfence_bar) (3)
	CreateDynamicObject(987,351.29998779,-3366.80004883,7.09999990,1.95626831,347.99288940,0.41598511); //object(elecfence_bar) (4)
	CreateDynamicObject(987,340.10000610,-3366.60009766,4.19999981,7.76086426,345.86788940,1.94729614); //object(elecfence_bar) (5)
	CreateDynamicObject(987,328.60000610,-3366.60009766,1.39999998,6.56259155,346.40618896,1.33303833); //object(elecfence_bar) (6)
	CreateDynamicObject(1250,405.20001221,-3367.30004883,10.19999981,0.00000000,0.00000000,268.00000000); //object(smashbarpost) (1)
	CreateDynamicObject(1251,401.50000000,-3367.10009766,10.80000019,0.00000000,0.00000000,270.00000000); //object(smashbar) (1)
	CreateDynamicObject(3881,409.10000610,-3369.39990234,10.60000038,0.00000000,0.00000000,3.99902344); //object(airsecbooth_sfse) (1)
	CreateDynamicObject(2206,406.89999390,-3318.80004883,6.00000000,354.01245117,4.02099609,0.41748047); //object(med_office8_desk_02) (1)
	CreateDynamicObject(2206,410.20001221,-3318.69995117,5.80000019,354.00695801,4.01550293,0.41748047); //object(med_office8_desk_02) (3)
	CreateDynamicObject(2165,416.20001221,-3312.60009766,5.09999990,0.00000000,0.00000000,94.00000000); //object(med_office_desk_1) (1)
	CreateDynamicObject(2173,416.29998779,-3314.60009766,5.19999981,1.99725342,3.00183105,93.89483643); //object(med_office_desk_3) (1)
	CreateDynamicObject(683,378.70001221,-3487.30004883,18.89999962,0.00000000,0.00000000,0.00000000); //object(sm_fir_group) (1)
	CreateDynamicObject(683,371.29998779,-3480.69995117,18.70000076,0.00000000,0.00000000,0.00000000); //object(sm_fir_group) (2)
	CreateDynamicObject(683,379.60000610,-3475.69995117,17.50000000,0.00000000,0.00000000,0.00000000); //object(sm_fir_group) (3)
	CreateDynamicObject(683,372.89999390,-3466.80004883,16.50000000,0.00000000,0.00000000,0.00000000); //object(sm_fir_group) (4)
	CreateDynamicObject(683,381.89999390,-3460.39990234,16.50000000,0.00000000,0.00000000,0.00000000); //object(sm_fir_group) (5)
	CreateDynamicObject(683,370.70001221,-3457.60009766,16.50000000,0.00000000,0.00000000,0.00000000); //object(sm_fir_group) (6)
	CreateDynamicObject(683,382.39999390,-3447.89990234,16.50000000,0.00000000,0.00000000,0.00000000); //object(sm_fir_group) (7)
	CreateDynamicObject(683,370.10000610,-3448.10009766,16.50000000,0.00000000,0.00000000,0.00000000); //object(sm_fir_group) (8)
	CreateDynamicObject(683,361.79998779,-3458.80004883,11.80000019,0.00000000,0.00000000,0.00000000); //object(sm_fir_group) (9)
	CreateDynamicObject(683,388.60000610,-3453.30004883,11.80000019,0.00000000,0.00000000,0.00000000); //object(sm_fir_group) (10)
	CreateDynamicObject(683,392.39999390,-3463.10009766,11.80000019,0.00000000,0.00000000,0.00000000); //object(sm_fir_group) (11)
	CreateDynamicObject(683,390.10000610,-3477.89990234,11.80000019,0.00000000,0.00000000,0.00000000); //object(sm_fir_group) (12)
	CreateDynamicObject(683,397.10000610,-3480.00000000,11.80000019,0.00000000,0.00000000,0.00000000); //object(sm_fir_group) (13)
	CreateDynamicObject(683,399.70001221,-3468.60009766,11.80000019,0.00000000,0.00000000,0.00000000); //object(sm_fir_group) (14)
	CreateDynamicObject(683,399.79998779,-3457.00000000,11.80000019,0.00000000,0.00000000,0.00000000); //object(sm_fir_group) (15)
	CreateDynamicObject(683,409.60000610,-3461.00000000,11.80000019,0.00000000,0.00000000,0.00000000); //object(sm_fir_group) (16)
	CreateDynamicObject(683,408.39999390,-3471.89990234,11.80000019,0.00000000,0.00000000,0.00000000); //object(sm_fir_group) (17)
	CreateDynamicObject(683,407.00000000,-3483.39990234,11.80000019,0.00000000,0.00000000,0.00000000); //object(sm_fir_group) (18)
	CreateDynamicObject(683,413.89999390,-3480.10009766,9.80000019,0.00000000,0.00000000,0.00000000); //object(sm_fir_group) (19)
	CreateDynamicObject(683,416.10000610,-3467.30004883,9.80000019,0.00000000,0.00000000,0.00000000); //object(sm_fir_group) (20)
	CreateDynamicObject(683,420.79998779,-3477.80004883,7.50000000,0.00000000,0.00000000,0.00000000); //object(sm_fir_group) (21)
	CreateDynamicObject(683,414.70001221,-3455.60009766,9.80000019,0.00000000,0.00000000,0.00000000); //object(sm_fir_group) (22)
	CreateDynamicObject(683,406.79998779,-3450.10009766,9.80000019,0.00000000,0.00000000,0.00000000); //object(sm_fir_group) (23)
	CreateDynamicObject(683,422.70001221,-3453.89990234,7.30000019,0.00000000,0.00000000,0.00000000); //object(sm_fir_group) (24)
	CreateDynamicObject(683,426.79998779,-3463.00000000,9.80000019,0.00000000,0.00000000,0.00000000); //object(sm_fir_group) (25)
	CreateDynamicObject(683,427.10000610,-3463.69995117,4.50000000,0.00000000,0.00000000,0.00000000); //object(sm_fir_group) (26)
	CreateDynamicObject(689,395.20001221,-3452.69995117,13.50000000,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (1)
	CreateDynamicObject(689,423.79998779,-3456.19995117,5.19999981,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (2)
	CreateDynamicObject(689,409.89999390,-3443.60009766,5.19999981,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (3)
	CreateDynamicObject(689,428.39999390,-3437.39990234,5.19999981,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (4)
	CreateDynamicObject(689,414.60000610,-3425.80004883,5.19999981,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (5)
	CreateDynamicObject(689,399.00000000,-3424.30004883,5.19999981,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (6)
	CreateDynamicObject(689,403.79998779,-3412.10009766,5.19999981,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (7)
	CreateDynamicObject(689,393.00000000,-3400.30004883,5.19999981,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (8)
	CreateDynamicObject(689,383.79998779,-3405.10009766,5.19999981,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (9)
	CreateDynamicObject(689,384.89999390,-3414.19995117,5.19999981,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (10)
	CreateDynamicObject(689,388.70001221,-3424.39990234,5.19999981,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (11)
	CreateDynamicObject(689,393.39999390,-3437.10009766,7.19999981,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (12)
	CreateDynamicObject(689,380.70001221,-3445.30004883,7.19999981,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (13)
	CreateDynamicObject(689,377.29998779,-3432.89990234,7.19999981,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (14)
	CreateDynamicObject(689,370.39999390,-3420.10009766,7.19999981,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (15)
	CreateDynamicObject(689,370.89999390,-3408.60009766,7.19999981,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (16)
	CreateDynamicObject(689,386.79998779,-3473.50000000,7.19999981,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (17)
	CreateDynamicObject(689,364.20001221,-3474.10009766,7.19999981,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (18)
	CreateDynamicObject(689,363.70001221,-3447.10009766,7.19999981,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (19)
	CreateDynamicObject(689,352.79998779,-3470.39990234,5.69999981,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (20)
	CreateDynamicObject(689,358.10000610,-3484.39990234,7.19999981,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (21)
	CreateDynamicObject(689,363.70001221,-3494.80004883,15.00000000,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (22)
	CreateDynamicObject(689,349.39999390,-3494.80004883,7.00000000,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (23)
	CreateDynamicObject(689,354.00000000,-3507.89990234,9.50000000,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (24)
	CreateDynamicObject(689,366.60000610,-3511.00000000,9.50000000,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (25)
	CreateDynamicObject(689,366.79998779,-3511.00000000,9.50000000,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (26)
	CreateDynamicObject(690,383.00000000,-3515.30004883,13.50000000,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse2) (1)
	CreateDynamicObject(690,378.39941406,-3505.50000000,19.50000000,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse2) (2)
	CreateDynamicObject(690,396.70001221,-3502.30004883,14.80000019,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse2) (3)
	CreateDynamicObject(690,414.50000000,-3504.60009766,9.30000019,0.00000000,0.00000000,58.00000000); //object(sm_fir_copse2) (4)
	CreateDynamicObject(690,427.50000000,-3491.19921875,3.70000005,0.00000000,0.00000000,57.99682617); //object(sm_fir_copse2) (5)
	CreateDynamicObject(690,431.20001221,-3471.30004883,4.59999990,0.00000000,0.00000000,57.99682617); //object(sm_fir_copse2) (6)
	CreateDynamicObject(690,434.60000610,-3454.80004883,4.59999990,0.00000000,0.00000000,57.99682617); //object(sm_fir_copse2) (7)
	CreateDynamicObject(690,426.60000610,-3515.39990234,4.59999990,0.00000000,0.00000000,57.99682617); //object(sm_fir_copse2) (8)
	CreateDynamicObject(690,431.89999390,-3505.00000000,4.59999990,0.00000000,0.00000000,57.99682617); //object(sm_fir_copse2) (9)
	CreateDynamicObject(690,467.79998779,-3497.89990234,3.40000010,0.00000000,0.00000000,57.99682617); //object(sm_fir_copse2) (10)
	CreateDynamicObject(690,481.29998779,-3453.60009766,2.79999995,0.00000000,0.00000000,57.99682617); //object(sm_fir_copse2) (11)
	CreateDynamicObject(690,495.10000610,-3475.89990234,4.59999990,0.00000000,0.00000000,57.99682617); //object(sm_fir_copse2) (12)
	CreateDynamicObject(690,501.00000000,-3470.60009766,4.59999990,0.00000000,0.00000000,57.99682617); //object(sm_fir_copse2) (13)
	CreateDynamicObject(690,501.29998779,-3442.00000000,1.60000002,0.00000000,0.00000000,57.99682617); //object(sm_fir_copse2) (14)
	CreateDynamicObject(690,506.29998779,-3424.10009766,0.30000001,0.00000000,0.00000000,57.99682617); //object(sm_fir_copse2) (15)
	CreateDynamicObject(690,508.50000000,-3454.80004883,3.00000000,0.00000000,0.00000000,57.99682617); //object(sm_fir_copse2) (16)
	CreateDynamicObject(690,511.00000000,-3491.69995117,4.59999990,0.00000000,0.00000000,57.99682617); //object(sm_fir_copse2) (17)
	CreateDynamicObject(690,494.00000000,-3498.39990234,4.59999990,0.00000000,0.00000000,57.99682617); //object(sm_fir_copse2) (18)
	CreateDynamicObject(690,475.79998779,-3476.89990234,2.79999995,0.00000000,0.00000000,57.99682617); //object(sm_fir_copse2) (19)
	CreateDynamicObject(690,464.00000000,-3451.80004883,2.29999995,0.00000000,0.00000000,57.99682617); //object(sm_fir_copse2) (20)
	CreateDynamicObject(791,468.39999390,-3384.39990234,-19.60000038,0.00000000,0.00000000,0.00000000); //object(vbg_fir_copse) (1)
	CreateDynamicObject(791,392.79998779,-3482.80004883,-1.70000005,0.00000000,0.00000000,0.00000000); //object(vbg_fir_copse) (2)
	CreateDynamicObject(689,387.10000610,-3385.19995117,4.19999981,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (27)
	CreateDynamicObject(689,370.39999390,-3377.19995117,4.19999981,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (28)
	CreateDynamicObject(689,367.20001221,-3387.00000000,4.19999981,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (29)
	CreateDynamicObject(689,449.39999390,-3406.50000000,4.19999981,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (30)
	CreateDynamicObject(689,461.50000000,-3386.39990234,1.60000002,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (31)
	CreateDynamicObject(689,432.70001221,-3385.89990234,4.19999981,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (32)
	CreateDynamicObject(689,440.50000000,-3375.80004883,4.19999981,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (33)
	CreateDynamicObject(689,423.50000000,-3360.00000000,4.19999981,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (34)
	CreateDynamicObject(689,443.50000000,-3356.89990234,4.19999981,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (35)
	CreateDynamicObject(689,463.79998779,-3359.60009766,1.89999998,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (36)
	CreateDynamicObject(689,487.70001221,-3365.60009766,0.69999999,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (37)
	CreateDynamicObject(689,482.20001221,-3348.69995117,1.70000005,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (38)
	CreateDynamicObject(689,457.10000610,-3337.00000000,1.20000005,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (39)
	CreateDynamicObject(689,437.39999390,-3344.19995117,0.89999998,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (40)
	CreateDynamicObject(689,438.50000000,-3319.89990234,0.89999998,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (41)
	CreateDynamicObject(689,421.79998779,-3340.00000000,0.89999998,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (42)
	CreateDynamicObject(689,425.50000000,-3297.39990234,0.89999998,0.00000000,0.00000000,280.00000000); //object(sm_fir_copse1) (43)
	CreateDynamicObject(689,424.50000000,-3309.19995117,0.89999998,0.00000000,0.00000000,279.99755859); //object(sm_fir_copse1) (44)
	CreateDynamicObject(689,423.39999390,-3325.39990234,0.89999998,0.00000000,0.00000000,279.99755859); //object(sm_fir_copse1) (45)
	CreateDynamicObject(689,440.20001221,-3298.39990234,0.89999998,0.00000000,0.00000000,279.99755859); //object(sm_fir_copse1) (46)
	CreateDynamicObject(689,450.00000000,-3318.89990234,0.89999998,0.00000000,0.00000000,279.99755859); //object(sm_fir_copse1) (47)
	CreateDynamicObject(689,460.10000610,-3302.19995117,0.89999998,0.00000000,0.00000000,279.99755859); //object(sm_fir_copse1) (48)
	CreateDynamicObject(689,468.29998779,-3334.00000000,0.89999998,0.00000000,0.00000000,279.99755859); //object(sm_fir_copse1) (49)
	CreateDynamicObject(689,497.79998779,-3373.39990234,0.89999998,0.00000000,0.00000000,279.99206543); //object(sm_fir_copse1) (50)
	CreateDynamicObject(689,492.00000000,-3347.10009766,0.89999998,0.00000000,0.00000000,279.99755859); //object(sm_fir_copse1) (51)
	CreateDynamicObject(689,480.70001221,-3322.89990234,0.89999998,0.00000000,0.00000000,279.99755859); //object(sm_fir_copse1) (52)
	CreateDynamicObject(689,475.70001221,-3303.39990234,0.89999998,0.00000000,0.00000000,279.99755859); //object(sm_fir_copse1) (53)
	CreateDynamicObject(689,498.00000000,-3302.50000000,0.89999998,0.00000000,0.00000000,279.99755859); //object(sm_fir_copse1) (54)
	CreateDynamicObject(689,498.60000610,-3322.60009766,0.89999998,0.00000000,0.00000000,279.99755859); //object(sm_fir_copse1) (55)
	CreateDynamicObject(689,502.60000610,-3343.30004883,0.89999998,0.00000000,0.00000000,279.99755859); //object(sm_fir_copse1) (56)
	CreateDynamicObject(689,506.29998779,-3354.00000000,0.89999998,0.00000000,0.00000000,279.99755859); //object(sm_fir_copse1) (57)
	CreateDynamicObject(689,513.59997559,-3326.10009766,0.89999998,0.00000000,0.00000000,279.99755859); //object(sm_fir_copse1) (58)
	CreateDynamicObject(689,513.09997559,-3312.00000000,0.89999998,0.00000000,0.00000000,279.99755859); //object(sm_fir_copse1) (59)
	CreateDynamicObject(689,505.70001221,-3292.80004883,0.89999998,0.00000000,0.00000000,279.99755859); //object(sm_fir_copse1) (60)
	CreateDynamicObject(689,488.39999390,-3294.50000000,0.89999998,0.00000000,0.00000000,279.99755859); //object(sm_fir_copse1) (61)
	CreateDynamicObject(647,424.00000000,-3360.80004883,9.50000000,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (1)
	CreateDynamicObject(647,395.00000000,-3386.60009766,10.60000038,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (2)
	CreateDynamicObject(647,380.60000610,-3393.50000000,10.69999981,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (3)
	CreateDynamicObject(647,390.50000000,-3400.00000000,11.80000019,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (4)
	CreateDynamicObject(647,404.60000610,-3405.30004883,10.39999962,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (5)
	CreateDynamicObject(647,405.50000000,-3424.69995117,11.89999962,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (6)
	CreateDynamicObject(647,423.10000610,-3424.60009766,8.39999962,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (7)
	CreateDynamicObject(647,422.39999390,-3446.30004883,9.50000000,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (8)
	CreateDynamicObject(647,438.60000610,-3452.00000000,6.59999990,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (9)
	CreateDynamicObject(647,423.89999390,-3478.89990234,7.80000019,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (10)
	CreateDynamicObject(647,429.60000610,-3502.30004883,8.30000019,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (11)
	CreateDynamicObject(647,436.39999390,-3479.69995117,5.40000010,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (12)
	CreateDynamicObject(647,405.89999390,-3480.60009766,15.69999981,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (13)
	CreateDynamicObject(647,401.29998779,-3447.00000000,14.69999981,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (14)
	CreateDynamicObject(647,390.00000000,-3433.00000000,14.19999981,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (15)
	CreateDynamicObject(647,386.29998779,-3406.39990234,12.00000000,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (16)
	CreateDynamicObject(647,371.20001221,-3396.30004883,10.19999981,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (17)
	CreateDynamicObject(647,363.29998779,-3414.50000000,10.00000000,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (18)
	CreateDynamicObject(647,366.29998779,-3438.39990234,14.50000000,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (19)
	CreateDynamicObject(647,359.29998779,-3455.69995117,14.39999962,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (20)
	CreateDynamicObject(647,347.79998779,-3481.19995117,10.39999962,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (21)
	CreateDynamicObject(647,341.70001221,-3500.69995117,10.30000019,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (22)
	CreateDynamicObject(802,352.29998779,-3497.19995117,12.89999962,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (1)
	CreateDynamicObject(802,352.00000000,-3506.80004883,14.19999981,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (2)
	CreateDynamicObject(802,358.20001221,-3506.60009766,16.79999924,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (3)
	CreateDynamicObject(802,417.00000000,-3474.19995117,9.89999962,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (4)
	CreateDynamicObject(802,426.89999390,-3458.50000000,7.00000000,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (5)
	CreateDynamicObject(802,430.20001221,-3442.89990234,6.69999981,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (6)
	CreateDynamicObject(802,330.89999390,-3318.50000000,-51.90000153,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (7)
	CreateDynamicObject(802,390.70001221,-3374.39990234,9.39999962,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (8)
	CreateDynamicObject(802,423.70001221,-3371.30004883,8.10000038,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (9)
	CreateDynamicObject(802,430.39999390,-3355.00000000,7.80000019,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (10)
	CreateDynamicObject(802,445.79998779,-3363.80004883,5.00000000,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (11)
	CreateDynamicObject(802,435.00000000,-3377.10009766,6.50000000,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (12)
	CreateDynamicObject(802,437.89999390,-3398.39990234,5.40000010,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (13)
	CreateDynamicObject(802,466.20001221,-3372.60009766,3.00000000,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (14)
	CreateDynamicObject(802,470.20001221,-3344.50000000,2.40000010,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (15)
	CreateDynamicObject(802,454.00000000,-3384.10009766,3.40000010,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (16)
	CreateDynamicObject(802,492.00000000,-3346.39990234,2.90000010,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (17)
	CreateDynamicObject(802,493.39999390,-3324.30004883,3.90000010,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (18)
	CreateDynamicObject(802,470.50000000,-3325.60009766,2.29999995,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (19)
	CreateDynamicObject(802,456.29998779,-3311.19995117,2.29999995,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (20)
	CreateDynamicObject(802,434.10000610,-3308.19995117,3.00000000,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (21)
	CreateDynamicObject(802,402.60000610,-3306.30004883,5.59999990,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (22)
	CreateDynamicObject(802,414.79998779,-3289.00000000,3.09999990,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (23)
	CreateDynamicObject(802,392.29998779,-3351.80004883,11.10000038,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (24)
	CreateDynamicObject(802,382.89999390,-3321.69995117,14.30000019,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (25)
	CreateDynamicObject(802,362.29998779,-3353.10009766,13.10000038,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (26)
	CreateDynamicObject(802,333.70001221,-3349.60009766,7.69999981,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (27)
	CreateDynamicObject(802,354.39999390,-3331.69995117,17.20000076,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (28)
	CreateDynamicObject(802,337.00000000,-3298.80004883,13.39999962,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (29)
	CreateDynamicObject(802,361.70001221,-3313.19995117,16.50000000,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (30)
	CreateDynamicObject(802,353.70001221,-3286.69995117,15.69999981,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (31)
	CreateDynamicObject(802,374.60000610,-3299.30004883,15.19999981,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (32)
	CreateDynamicObject(802,335.70001221,-3314.30004883,11.50000000,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (33)
	CreateDynamicObject(802,414.29998779,-3327.89990234,6.80000019,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (34)
	CreateDynamicObject(802,408.39999390,-3354.00000000,8.89999962,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (35)
	CreateDynamicObject(802,421.89999390,-3352.19995117,8.10000038,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (36)
	CreateDynamicObject(802,410.79998779,-3377.39990234,9.80000019,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (37)
	CreateDynamicObject(802,433.39999390,-3424.19995117,5.59999990,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (38)
	CreateDynamicObject(802,454.89999390,-3443.80004883,4.00000000,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (39)
	CreateDynamicObject(802,459.50000000,-3444.50000000,4.19999981,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (40)
	CreateDynamicObject(802,465.50000000,-3471.80004883,4.80000019,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (41)
	CreateDynamicObject(802,464.39999390,-3485.60009766,5.50000000,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (42)
	CreateDynamicObject(802,485.00000000,-3494.10009766,6.30000019,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (43)
	CreateDynamicObject(802,464.79998779,-3500.10009766,6.40000010,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (44)
	CreateDynamicObject(802,480.79998779,-3462.19995117,3.29999995,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (45)
	CreateDynamicObject(802,501.79998779,-3437.80004883,3.00000000,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (46)
	CreateDynamicObject(802,499.70001221,-3452.89990234,4.90000010,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (47)
	CreateDynamicObject(802,496.00000000,-3462.30004883,5.19999981,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (48)
	CreateDynamicObject(802,513.20001221,-3474.10009766,7.59999990,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (49)
	CreateDynamicObject(802,491.50000000,-3486.50000000,6.59999990,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (50)
	CreateDynamicObject(802,501.60000610,-3482.80004883,7.69999981,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (51)
	CreateDynamicObject(802,508.29998779,-3497.00000000,9.30000019,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (52)
	CreateDynamicObject(802,502.60000610,-3508.00000000,8.30000019,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (53)
	CreateDynamicObject(802,410.60000610,-3414.80004883,9.39999962,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (54)
	CreateDynamicObject(802,390.79998779,-3390.50000000,9.50000000,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (55)
	CreateDynamicObject(802,485.89999390,-3437.69995117,3.40000010,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (56)
	CreateDynamicObject(802,491.79998779,-3402.30004883,2.90000010,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (57)
	CreateDynamicObject(802,514.70001221,-3384.10009766,0.69999999,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (58)
	CreateDynamicObject(802,517.40002441,-3403.19995117,1.10000002,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (59)
	CreateDynamicObject(802,461.39999390,-3408.80004883,2.20000005,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (60)
	CreateDynamicObject(802,442.70001221,-3292.30004883,-35.59999847,0.00000000,0.00000000,0.00000000); //object(genveg_bush08) (61)
	CreateDynamicObject(805,389.89999390,-3298.50000000,7.19999981,0.00000000,0.00000000,0.00000000); //object(genveg_bush11) (1)
	CreateDynamicObject(820,430.50000000,-3289.60009766,1.10000002,0.00000000,0.00000000,0.00000000); //object(genveg_tallgrass04) (1)
	CreateDynamicObject(820,375.60000610,-3377.19995117,8.89999962,0.00000000,0.00000000,0.00000000); //object(genveg_tallgrass04) (2)
	CreateDynamicObject(820,433.00000000,-3399.50000000,5.80000019,0.00000000,0.00000000,0.00000000); //object(genveg_tallgrass04) (3)
	CreateDynamicObject(820,482.89999390,-3488.60009766,4.90000010,0.00000000,0.00000000,0.00000000); //object(genveg_tallgrass04) (4)
	CreateDynamicObject(820,432.70001221,-3520.10009766,10.89999962,0.00000000,0.00000000,0.00000000); //object(genveg_tallgrass04) (5)
	CreateDynamicObject(820,415.20001221,-3549.50000000,17.10000038,0.00000000,0.00000000,0.00000000); //object(genveg_tallgrass04) (6)
	CreateDynamicObject(820,384.20001221,-3497.50000000,20.70000076,0.00000000,0.00000000,0.00000000); //object(genveg_tallgrass04) (7)
	CreateDynamicObject(820,390.79998779,-3413.60009766,10.89999962,0.00000000,0.00000000,0.00000000); //object(genveg_tallgrass04) (8)
	CreateDynamicObject(820,507.29998779,-3291.00000000,2.00000000,0.00000000,0.00000000,0.00000000); //object(genveg_tallgrass04) (9)
	CreateDynamicObject(820,503.20001221,-3311.69995117,3.09999990,0.00000000,0.00000000,0.00000000); //object(genveg_tallgrass04) (10)
	CreateDynamicObject(820,444.00000000,-3296.30004883,-39.29999924,0.00000000,0.00000000,0.00000000); //object(genveg_tallgrass04) (11)
	CreateDynamicObject(17030,368.50000000,-3281.50000000,-1.70000005,0.00000000,0.00000000,215.99670410); //object(cunt_rockgp2_11) (2)
	CreateDynamicObject(17030,328.79998779,-3280.10009766,8.00000000,346.00000000,0.00000000,258.00000000); //object(cunt_rockgp2_11) (3)
	CreateDynamicObject(17030,307.00000000,-3318.60009766,10.30000019,3.80392456,18.04110718,334.76211548); //object(cunt_rockgp2_11) (4)
	CreateDynamicObject(17031,315.79998779,-3365.60009766,2.59999990,0.00000000,18.00000000,28.00000000); //object(cunt_rockgp2_13) (1)
	CreateDynamicObject(17031,335.29998779,-3398.89990234,2.59999990,0.00000000,17.99560547,13.99865723); //object(cunt_rockgp2_13) (3)
	CreateDynamicObject(17031,337.10000610,-3458.80004883,-0.89999998,0.00000000,17.99560547,173.99658203); //object(cunt_rockgp2_13) (4)
	CreateDynamicObject(17033,330.60000610,-3486.60009766,1.10000002,0.00000000,0.00000000,30.00000000); //object(cunt_rockgp2_15) (1)
	CreateDynamicObject(17034,314.50000000,-3507.39990234,-3.00000000,0.00000000,0.00000000,233.99993896); //object(cunt_rockgp2_16) (2)
	CreateDynamicObject(791,442.50000000,-3343.50000000,-29.50000000,0.00000000,0.00000000,250.00000000); //object(vbg_fir_copse) (3)
	CreateDynamicObject(791,495.79998779,-3333.39990234,-24.79999924,0.00000000,0.00000000,249.99938965); //object(vbg_fir_copse) (4)
	CreateDynamicObject(791,496.89999390,-3444.60009766,-24.79999924,0.00000000,0.00000000,249.99938965); //object(vbg_fir_copse) (5)
	CreateDynamicObject(791,496.00000000,-3489.39990234,-36.79999924,0.00000000,0.00000000,195.99938965); //object(vbg_fir_copse) (6)
	CreateDynamicObject(791,391.10000610,-3440.60009766,-16.79999924,0.00000000,0.00000000,195.99609375); //object(vbg_fir_copse) (7)
	CreateDynamicObject(17031,269.79998779,-3532.39990234,-2.40000010,0.00000000,17.99560547,111.99594116); //object(cunt_rockgp2_13) (5)
	CreateDynamicObject(17031,234.19999695,-3558.39990234,-0.89999998,0.00000000,17.99560547,133.99462891); //object(cunt_rockgp2_13) (6)
	CreateDynamicObject(17031,220.80000305,-3589.60009766,9.89999962,335.35934448,19.87045288,12.55822754); //object(cunt_rockgp2_13) (7)
	CreateDynamicObject(17031,232.89999390,-3614.19995117,17.70000076,334.60827637,346.68759155,10.19506836); //object(cunt_rockgp2_13) (8)
	CreateDynamicObject(17031,246.30000305,-3639.30004883,18.70000076,334.26727295,351.10302734,36.09722900); //object(cunt_rockgp2_13) (9)
	CreateDynamicObject(17031,265.00000000,-3697.89990234,27.29999924,5.97738647,355.96789551,330.40563965); //object(cunt_rockgp2_13) (10)
	CreateDynamicObject(17031,264.29998779,-3748.89990234,30.10000038,5.97656250,355.96252441,202.40283203); //object(cunt_rockgp2_13) (11)
	CreateDynamicObject(17031,300.10000610,-3760.19995117,30.10000038,5.97106934,355.96252441,268.40112305); //object(cunt_rockgp2_13) (12)
	CreateDynamicObject(17031,335.00000000,-3757.10009766,29.10000038,5.96557617,355.96252441,96.39599609); //object(cunt_rockgp2_13) (13)
	CreateDynamicObject(17031,261.50000000,-3671.10009766,36.09999847,5.96008301,355.96252441,18.39404297); //object(cunt_rockgp2_13) (14)
	CreateDynamicObject(17034,384.39999390,-3757.30004883,19.60000038,347.03796387,337.39343262,178.66186523); //object(cunt_rockgp2_16) (3)
	CreateDynamicObject(17034,415.50000000,-3743.60009766,16.60000038,345.99774170,359.99691772,201.99642944); //object(cunt_rockgp2_16) (4)
	CreateDynamicObject(17031,453.29998779,-3731.60009766,20.39999962,5.79711914,14.05773926,294.77539062); //object(cunt_rockgp2_13) (15)
	CreateDynamicObject(17031,469.39999390,-3700.00000000,20.39999962,5.79528809,14.05700684,348.77416992); //object(cunt_rockgp2_13) (16)
	CreateDynamicObject(17031,473.00000000,-3655.50000000,16.89999962,349.96948242,2.00500488,2.56530762); //object(cunt_rockgp2_13) (17)
	CreateDynamicObject(17031,464.00000000,-3611.39990234,12.39999962,9.95748901,2.00454712,19.86926270); //object(cunt_rockgp2_13) (18)
	CreateDynamicObject(17031,448.20001221,-3569.50000000,17.89999962,355.96209717,357.96435547,20.07113647); //object(cunt_rockgp2_13) (19)
	CreateDynamicObject(17032,492.50000000,-3522.60009766,3.29999995,334.00634766,357.76428223,311.02148438); //object(cunt_rockgp2_14) (1)
	CreateDynamicObject(17031,519.79998779,-3489.19995117,6.90000010,355.95703125,357.96203613,350.06652832); //object(cunt_rockgp2_13) (20)
	CreateDynamicObject(17031,527.29998779,-3442.60009766,-1.60000002,355.95153809,357.95654297,350.06286621); //object(cunt_rockgp2_13) (21)
	CreateDynamicObject(17031,520.40002441,-3401.80004883,-1.60000002,355.95153809,357.95654297,8.06286621); //object(cunt_rockgp2_13) (22)
	CreateDynamicObject(17030,524.59997559,-3378.80004883,0.60000002,0.00000000,0.00000000,342.00000000); //object(cunt_rockgp2_11) (5)
	CreateDynamicObject(17026,521.90002441,-3335.30004883,0.60000002,0.00000000,0.00000000,317.99926758); //object(cunt_rockgp2_) (1)
	CreateDynamicObject(17026,491.20001221,-3281.89990234,-0.40000001,0.00000000,0.00000000,51.99926758); //object(cunt_rockgp2_) (2)
	CreateDynamicObject(17030,522.70001221,-3298.00000000,-0.89999998,0.00000000,0.00000000,334.00000000); //object(cunt_rockgp2_11) (7)
	CreateDynamicObject(17030,451.89999390,-3280.69995117,-0.89999998,0.00000000,0.00000000,55.99536133); //object(cunt_rockgp2_11) (8)
	CreateDynamicObject(17030,503.39999390,-3249.30004883,-1.89999998,0.00000000,0.00000000,321.98730469); //object(cunt_rockgp2_11) (9)
	CreateDynamicObject(17030,498.20001221,-3214.69995117,-0.89999998,0.00000000,0.00000000,171.98730469); //object(cunt_rockgp2_11) (10)
	CreateDynamicObject(17030,457.00000000,-3181.10009766,-0.89999998,0.00000000,0.00000000,29.98547363); //object(cunt_rockgp2_11) (11)
	CreateDynamicObject(17030,421.20001221,-3174.60009766,-4.69999981,0.00000000,0.00000000,239.98168945); //object(cunt_rockgp2_11) (12)
	CreateDynamicObject(17030,376.60000610,-3184.80004883,-0.89999998,0.00000000,0.00000000,257.97985840); //object(cunt_rockgp2_11) (13)
	CreateDynamicObject(17030,322.50000000,-3210.89990234,-0.89999998,0.00000000,0.00000000,73.97546387); //object(cunt_rockgp2_11) (14)
	CreateDynamicObject(17030,303.79998779,-3243.50000000,-0.89999998,0.00000000,0.00000000,135.97094727); //object(cunt_rockgp2_11) (15)
	CreateDynamicObject(17030,315.29998779,-3259.69995117,-0.89999998,0.00000000,0.00000000,1.96685791); //object(cunt_rockgp2_11) (16)
	CreateDynamicObject(17030,419.89941406,-3281.39941406,0.80000001,0.00000000,357.99499512,63.99536133); //object(cunt_rockgp2_11) (17)
	CreateDynamicObject(12990,393.29998779,-3276.39990234,2.09999990,352.00000000,0.00000000,16.00000000); //object(sw_jetty) (1)
	CreateDynamicObject(901,388.79998779,-3291.39990234,1.60000002,4.90176392,101.23931885,110.01245117); //object(searock05) (1)
	CreateDynamicObject(3939,391.89999390,-3359.80004883,11.50000000,10.10037231,350.09497070,95.75408936); //object(hanger01) (1)
	CreateDynamicObject(3939,384.70001221,-3359.89990234,12.69999981,359.99975586,350.00000000,91.99996948); //object(hanger01) (2)
	CreateDynamicObject(3939,377.39999390,-3359.69995117,12.60000038,359.99450684,349.99694824,89.99450684); //object(hanger01) (3)
	//CreateDynamicObject(9241,359.10000610,-3311.69995117,19.29999924,0.00000000,0.00000000,2.00000000); //object(copbits_sfn) (1)
	CreateObject(9241,359.10000610,-3311.69995117,19.29999924,0.00000000,0.00000000,2.00000000);
	CreateDynamicObject(3095,374.60000610,-3314.00000000,13.19999981,0.00000000,90.00000000,2.00000000); //object(a51_jetdoor) (1)
	CreateDynamicObject(3095,374.29998779,-3305.10009766,13.19999981,0.00000000,90.00000000,1.99951172); //object(a51_jetdoor) (2)
	CreateDynamicObject(3095,374.10000610,-3299.80004883,13.19999981,0.00000000,90.00000000,1.99951172); //object(a51_jetdoor) (3)
	CreateDynamicObject(3095,374.89999390,-3322.89990234,13.19999981,0.00000000,90.00000000,1.99951172); //object(a51_jetdoor) (4)
	CreateDynamicObject(3095,370.89999390,-3326.89990234,13.19999981,0.00000000,90.00000000,272.00000000); //object(a51_jetdoor) (5)
	CreateDynamicObject(3095,362.00000000,-3327.19995117,13.19999981,0.00000000,90.00000000,272.00000000); //object(a51_jetdoor) (6)
	CreateDynamicObject(3095,353.20001221,-3327.50000000,13.19999981,0.00000000,90.00000000,271.50000000); //object(a51_jetdoor) (7)
	CreateDynamicObject(3095,348.29998779,-3327.60009766,13.19999981,0.00000000,90.00000000,271.25000000); //object(a51_jetdoor) (8)
	CreateDynamicObject(3095,344.20001221,-3323.69995117,13.19999981,0.00000000,90.00000000,181.99951172); //object(a51_jetdoor) (9)
	CreateDynamicObject(3095,343.89999390,-3314.80004883,13.19999981,0.00000000,90.00000000,181.99951172); //object(a51_jetdoor) (10)
	CreateDynamicObject(3095,343.60000610,-3305.80004883,13.19999981,0.00000000,90.00000000,181.99951172); //object(a51_jetdoor) (11)
	CreateDynamicObject(3095,343.39999390,-3300.80004883,13.19999981,0.00000000,90.00000000,181.99951172); //object(a51_jetdoor) (12)
	CreateDynamicObject(3095,347.29998779,-3296.69995117,13.19999981,0.00000000,90.00000000,91.99951172); //object(a51_jetdoor) (13)
	CreateDynamicObject(3095,356.20001221,-3296.39990234,13.19999981,0.00000000,90.00000000,91.99401855); //object(a51_jetdoor) (14)
	CreateDynamicObject(3095,365.20001221,-3296.10009766,13.19999981,0.00000000,90.00000000,91.99401855); //object(a51_jetdoor) (15)
	CreateDynamicObject(3095,369.89999390,-3295.89990234,13.19999981,0.00000000,90.00000000,91.99401855); //object(a51_jetdoor) (16)
	CreateDynamicObject(689,454.70001221,-3422.89990234,-0.80000001,0.00000000,0.00000000,28.00000000); //object(sm_fir_copse1) (63)
	CreateDynamicObject(689,355.70001221,-3438.30004883,0.80000001,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (64)
	CreateDynamicObject(689,359.79998779,-3426.30004883,-0.50000000,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (65)
	CreateDynamicObject(689,359.39999390,-3405.69995117,-2.29999995,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (66)
	CreateDynamicObject(689,350.79998779,-3380.69995117,-4.59999990,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (67)
	CreateDynamicObject(791,376.79998779,-3408.10009766,-25.29999924,0.00000000,0.00000000,121.99609375); //object(vbg_fir_copse) (8)
	CreateDynamicObject(18609,406.79998779,-3327.50000000,8.10000038,352.17590332,347.88549805,274.32629395); //object(cs_logs06) (1)
	CreateDynamicObject(18609,407.00000000,-3330.00000000,8.10000038,352.17224121,347.88208008,271.32312012); //object(cs_logs06) (2)
	CreateDynamicObject(18609,407.00000000,-3328.69995117,9.00000000,352.90002441,347.90270996,272.72705078); //object(cs_logs06) (3)
	CreateDynamicObject(18569,412.10000610,-3338.60009766,8.30000019,355.50018311,0.50155640,0.28933716); //object(cs_logs01) (1)
	CreateDynamicObject(837,414.29998779,-3409.19995117,8.69999981,0.00000000,12.00000000,0.00000000); //object(dead_tree_1) (1)
	CreateDynamicObject(837,417.79998779,-3450.80004883,9.39999962,1.87933350,20.01123047,359.31570435); //object(dead_tree_1) (2)
	CreateDynamicObject(835,452.39999390,-3413.30004883,5.50000000,0.00000000,0.00000000,0.00000000); //object(dead_tree_8) (1)
	CreateDynamicObject(833,474.60000610,-3442.69995117,3.70000005,0.00000000,0.00000000,0.00000000); //object(dead_tree_6) (1)
	CreateDynamicObject(831,461.29998779,-3473.89990234,5.90000010,0.00000000,8.00000000,21.99462891); //object(dead_tree_5) (1)
	CreateDynamicObject(834,486.10000610,-3490.30004883,7.90000010,0.00000000,0.00000000,0.00000000); //object(dead_tree_7) (1)
	CreateDynamicObject(834,419.10000610,-3490.10009766,12.00000000,359.75592041,12.50012207,0.05410767); //object(dead_tree_7) (2)
	CreateDynamicObject(689,491.70001221,-3389.69995117,0.89999998,0.00000000,0.00000000,279.99206543); //object(sm_fir_copse1) (70)
	CreateDynamicObject(689,482.60000610,-3404.50000000,-0.10000000,0.00000000,0.00000000,279.99755859); //object(sm_fir_copse1) (71)
	CreateDynamicObject(689,467.60000610,-3414.39990234,-0.60000002,0.00000000,0.00000000,279.99755859); //object(sm_fir_copse1) (72)
	CreateDynamicObject(689,420.20001221,-3377.30004883,-0.60000002,0.00000000,0.00000000,279.99755859); //object(sm_fir_copse1) (73)
	CreateDynamicObject(689,435.70001221,-3398.30004883,-1.89999998,0.00000000,0.00000000,279.99755859); //object(sm_fir_copse1) (74)
	CreateDynamicObject(660,336.10000610,-3356.19995117,5.59999990,0.00000000,0.00000000,0.00000000); //object(pinetree03) (1)
	CreateDynamicObject(660,347.29998779,-3359.30004883,8.60000038,0.00000000,0.00000000,0.00000000); //object(pinetree03) (2)
	CreateDynamicObject(660,360.79998779,-3372.69995117,7.09999990,0.00000000,0.00000000,0.00000000); //object(pinetree03) (3)
	CreateDynamicObject(660,349.29998779,-3341.80004883,11.89999962,0.00000000,0.00000000,0.00000000); //object(pinetree03) (4)
	CreateDynamicObject(689,355.29998779,-3355.50000000,-0.40000001,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (77)
	CreateDynamicObject(689,340.50000000,-3340.69995117,-0.40000001,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (78)
	CreateDynamicObject(689,332.60000610,-3325.89990234,-2.40000010,0.00000000,0.00000000,64.00000000); //object(sm_fir_copse1) (79)
	CreateDynamicObject(689,333.79998779,-3313.60009766,-2.40000010,0.00000000,0.00000000,63.99536133); //object(sm_fir_copse1) (80)
	CreateDynamicObject(689,335.20001221,-3302.60009766,-2.40000010,0.00000000,0.00000000,111.99536133); //object(sm_fir_copse1) (81)
	CreateDynamicObject(689,338.29998779,-3290.19995117,-4.69999981,0.00000000,0.00000000,111.99462891); //object(sm_fir_copse1) (82)
	CreateDynamicObject(689,353.89999390,-3287.00000000,-4.69999981,0.00000000,0.00000000,111.99462891); //object(sm_fir_copse1) (83)
	CreateDynamicObject(689,355.00000000,-3340.10009766,-4.69999981,0.00000000,0.00000000,111.99462891); //object(sm_fir_copse1) (84)
	CreateDynamicObject(661,368.29998779,-3346.19995117,14.19999981,0.00000000,0.00000000,0.00000000); //object(pinetree07) (1)
	CreateDynamicObject(661,369.39999390,-3361.10009766,10.19999981,0.00000000,0.00000000,0.00000000); //object(pinetree07) (2)
	CreateDynamicObject(661,365.29998779,-3354.80004883,9.69999981,0.00000000,0.00000000,0.00000000); //object(pinetree07) (3)
	CreateDynamicObject(647,376.29998779,-3291.89990234,15.39999962,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (23)
	CreateDynamicObject(12915,293.70001221,-3673.50000000,41.70000076,358.01947021,8.00482178,358.27844238); //object(ce_bigbarn07) (1)
	CreateDynamicObject(12921,312.10000610,-3645.89990234,41.79999924,0.00000000,0.00000000,116.00000000); //object(sw_farment01) (1)
	CreateDynamicObject(13206,309.70001221,-3661.89990234,39.20000076,356.03900146,8.01928711,42.55758667); //object(cetruth_barn02) (1)
	CreateDynamicObject(1451,288.20001221,-3656.19995117,43.59999847,0.00000000,0.00000000,92.00000000); //object(dyn_coup) (1)
	CreateDynamicObject(1452,289.60000610,-3651.80004883,43.40000153,0.00000000,0.00000000,58.00000000); //object(dyn_outhouse) (1)
	CreateDynamicObject(1454,299.10000610,-3663.69995117,42.00000000,0.00000000,0.00000000,0.00000000); //object(dyn_h_bale2) (1)
	CreateDynamicObject(1454,300.70001221,-3663.60009766,41.79999924,0.00000000,0.00000000,0.00000000); //object(dyn_h_bale2) (2)
	CreateDynamicObject(1454,302.20001221,-3663.60009766,41.70000076,0.00000000,0.00000000,0.00000000); //object(dyn_h_bale2) (3)
	CreateDynamicObject(1454,301.50000000,-3663.50000000,43.20000076,0.00000000,0.00000000,0.00000000); //object(dyn_h_bale2) (4)
	CreateDynamicObject(1454,299.89999390,-3663.60009766,43.29999924,0.00000000,0.00000000,0.00000000); //object(dyn_h_bale2) (5)
	CreateDynamicObject(1454,300.79998779,-3663.60009766,44.50000000,0.00000000,0.00000000,0.00000000); //object(dyn_h_bale2) (6)
	CreateDynamicObject(1457,292.89999390,-3641.39990234,43.50000000,0.00000000,0.00000000,48.00000000); //object(dyn_outhouse_2) (1)
	CreateDynamicObject(3252,284.50000000,-3650.60009766,40.59999847,0.00000000,0.00000000,0.00000000); //object(des_oldwattwr_) (1)
	CreateDynamicObject(3403,302.20001221,-3635.69995117,42.50000000,0.00000000,0.00000000,0.00000000); //object(sw_logcover) (1)
	CreateDynamicObject(18609,304.60000610,-3638.60009766,41.50000000,0.00000000,0.00000000,359.75000000); //object(cs_logs06) (4)
	CreateDynamicObject(18609,302.70001221,-3638.69995117,41.70000076,0.00000000,10.00000000,3.00000000); //object(cs_logs06) (5)
	CreateDynamicObject(18609,300.50000000,-3638.89990234,42.20000076,0.00000000,9.99755859,5.24597168); //object(cs_logs06) (6)
	CreateDynamicObject(18609,298.50000000,-3639.10009766,42.50000000,0.00000000,9.99755859,5.24597168); //object(cs_logs06) (7)
	CreateDynamicObject(3425,296.10000610,-3648.10009766,52.09999847,0.00000000,0.00000000,306.00000000); //object(nt_windmill) (1)
	CreateDynamicObject(6865,294.70001221,-3664.19995117,47.00000000,20.30169678,320.08306885,236.18713379); //object(steerskull) (1)
	CreateDynamicObject(933,290.70001221,-3663.00000000,42.20000076,0.00000000,0.00000000,0.00000000); //object(cj_cableroll) (1)
	CreateDynamicObject(3092,289.60000610,-3651.80004883,43.29999924,33.98782349,338.11853027,310.65380859); //object(dead_tied_cop) (1)
	CreateDynamicObject(1431,288.79998779,-3659.69995117,43.20000076,1.24880981,2.50057983,293.94543457); //object(dyn_box_pile) (1)
	CreateDynamicObject(689,276.10000610,-3641.30004883,33.90000153,0.00000000,0.00000000,318.00000000); //object(sm_fir_copse1) (85)
	CreateDynamicObject(689,283.89999390,-3631.89990234,33.90000153,0.00000000,0.00000000,317.99926758); //object(sm_fir_copse1) (86)
	CreateDynamicObject(689,266.20001221,-3634.60009766,30.20000076,0.00000000,0.00000000,315.99926758); //object(sm_fir_copse1) (87)
	CreateDynamicObject(689,302.60000610,-3623.50000000,33.90000153,0.00000000,0.00000000,289.99926758); //object(sm_fir_copse1) (88)
	CreateDynamicObject(689,310.20001221,-3632.30004883,33.90000153,0.00000000,0.00000000,209.99511719); //object(sm_fir_copse1) (89)
	CreateDynamicObject(689,324.20001221,-3652.19995117,33.90000153,0.00000000,0.00000000,289.99511719); //object(sm_fir_copse1) (90)
	CreateDynamicObject(689,323.60000610,-3661.00000000,33.90000153,0.00000000,0.00000000,307.99511719); //object(sm_fir_copse1) (91)
	CreateDynamicObject(689,317.10000610,-3671.00000000,33.90000153,0.00000000,0.00000000,307.99072266); //object(sm_fir_copse1) (92)
	CreateDynamicObject(689,305.89999390,-3681.30004883,33.90000153,0.00000000,0.00000000,307.99072266); //object(sm_fir_copse1) (93)
	CreateDynamicObject(689,301.89999390,-3686.30004883,33.90000153,0.00000000,0.00000000,307.99072266); //object(sm_fir_copse1) (94)
	CreateDynamicObject(689,293.70001221,-3686.89990234,33.20000076,0.00000000,0.00000000,307.99072266); //object(sm_fir_copse1) (95)
	CreateDynamicObject(689,276.89999390,-3681.60009766,33.20000076,0.00000000,0.00000000,305.99072266); //object(sm_fir_copse1) (96)
	CreateDynamicObject(689,277.00000000,-3669.30004883,33.20000076,0.00000000,0.00000000,315.98571777); //object(sm_fir_copse1) (97)
	CreateDynamicObject(689,274.20001221,-3658.30004883,33.20000076,0.00000000,0.00000000,305.98571777); //object(sm_fir_copse1) (98)
	CreateDynamicObject(690,304.10000610,-3702.80004883,44.79999924,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse2) (22)
	CreateDynamicObject(690,318.89999390,-3689.19995117,38.79999924,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse2) (23)
	CreateDynamicObject(690,330.79998779,-3678.19995117,33.59999847,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse2) (24)
	CreateDynamicObject(690,321.60000610,-3703.10009766,38.09999847,0.00000000,0.00000000,290.00000000); //object(sm_fir_copse2) (25)
	CreateDynamicObject(690,332.60000610,-3696.60009766,35.09999847,0.00000000,0.00000000,273.99511719); //object(sm_fir_copse2) (26)
	CreateDynamicObject(690,344.79998779,-3684.39990234,29.29999924,0.00000000,0.00000000,273.99353027); //object(sm_fir_copse2) (27)
	CreateDynamicObject(690,344.70001221,-3698.60009766,27.10000038,0.00000000,0.00000000,273.99353027); //object(sm_fir_copse2) (28)
	CreateDynamicObject(690,356.50000000,-3688.00000000,25.60000038,0.00000000,0.00000000,273.99353027); //object(sm_fir_copse2) (29)
	CreateDynamicObject(690,364.20001221,-3678.60009766,25.60000038,0.00000000,0.00000000,273.99353027); //object(sm_fir_copse2) (30)
	CreateDynamicObject(690,352.20001221,-3673.80004883,25.60000038,0.00000000,0.00000000,273.99353027); //object(sm_fir_copse2) (31)
	CreateDynamicObject(690,341.00000000,-3670.80004883,25.60000038,0.00000000,0.00000000,273.99353027); //object(sm_fir_copse2) (32)
	CreateDynamicObject(690,337.00000000,-3660.80004883,29.39999962,0.00000000,0.00000000,273.99353027); //object(sm_fir_copse2) (33)
	CreateDynamicObject(690,332.20001221,-3649.50000000,29.39999962,0.00000000,0.00000000,273.99353027); //object(sm_fir_copse2) (34)
	CreateDynamicObject(690,343.60000610,-3652.30004883,27.70000076,0.00000000,0.00000000,273.99353027); //object(sm_fir_copse2) (35)
	CreateDynamicObject(690,353.29998779,-3656.30004883,27.70000076,0.00000000,0.00000000,273.99353027); //object(sm_fir_copse2) (36)
	CreateDynamicObject(690,361.60000610,-3665.10009766,27.70000076,0.00000000,0.00000000,273.99353027); //object(sm_fir_copse2) (37)
	CreateDynamicObject(690,370.60000610,-3669.19995117,27.70000076,0.00000000,0.00000000,321.99353027); //object(sm_fir_copse2) (38)
	CreateDynamicObject(690,374.29998779,-3662.19995117,27.70000076,0.00000000,0.00000000,321.99279785); //object(sm_fir_copse2) (39)
	CreateDynamicObject(690,366.60000610,-3653.89990234,25.00000000,0.00000000,0.00000000,321.99279785); //object(sm_fir_copse2) (40)
	CreateDynamicObject(690,316.00000000,-3626.00000000,34.20000076,0.00000000,0.00000000,321.99279785); //object(sm_fir_copse2) (41)
	CreateDynamicObject(690,326.89999390,-3625.89990234,31.50000000,0.00000000,0.00000000,321.99279785); //object(sm_fir_copse2) (42)
	CreateDynamicObject(690,336.00000000,-3625.60009766,29.79999924,0.00000000,0.00000000,321.99279785); //object(sm_fir_copse2) (43)
	CreateDynamicObject(690,348.29998779,-3624.69995117,26.60000038,0.00000000,0.00000000,287.99279785); //object(sm_fir_copse2) (44)
	CreateDynamicObject(690,360.10000610,-3628.30004883,24.60000038,0.00000000,0.00000000,287.99011230); //object(sm_fir_copse2) (45)
	CreateDynamicObject(690,378.29998779,-3650.60009766,22.60000038,0.00000000,0.00000000,287.99011230); //object(sm_fir_copse2) (46)
	CreateDynamicObject(690,387.70001221,-3643.69995117,20.60000038,0.00000000,0.00000000,287.99011230); //object(sm_fir_copse2) (47)
	CreateDynamicObject(690,370.70001221,-3625.50000000,20.60000038,0.00000000,0.00000000,221.99011230); //object(sm_fir_copse2) (48)
	CreateDynamicObject(690,385.79998779,-3618.60009766,17.10000038,0.00000000,0.00000000,193.98974609); //object(sm_fir_copse2) (49)
	CreateDynamicObject(690,398.50000000,-3620.19995117,15.60000038,0.00000000,0.00000000,183.98559570); //object(sm_fir_copse2) (50)
	CreateDynamicObject(690,406.00000000,-3622.80004883,14.60000038,0.00000000,0.00000000,223.98254395); //object(sm_fir_copse2) (51)
	CreateDynamicObject(690,395.70001221,-3646.19995117,15.60000038,0.00000000,0.00000000,223.97827148); //object(sm_fir_copse2) (52)
	CreateDynamicObject(690,386.79998779,-3657.60009766,15.60000038,0.00000000,0.00000000,223.97827148); //object(sm_fir_copse2) (53)
	CreateDynamicObject(690,376.79998779,-3668.39990234,15.60000038,0.00000000,0.00000000,223.97827148); //object(sm_fir_copse2) (54)
	CreateDynamicObject(690,406.79998779,-3611.89990234,12.89999962,0.00000000,0.00000000,183.98254395); //object(sm_fir_copse2) (56)
	CreateDynamicObject(690,392.00000000,-3609.19995117,15.89999962,0.00000000,0.00000000,197.98254395); //object(sm_fir_copse2) (57)
	CreateDynamicObject(690,376.79998779,-3607.50000000,17.89999962,0.00000000,0.00000000,197.97912598); //object(sm_fir_copse2) (58)
	CreateDynamicObject(690,371.00000000,-3601.69995117,16.20000076,0.00000000,0.00000000,197.97912598); //object(sm_fir_copse2) (59)
	CreateDynamicObject(690,363.39999390,-3592.50000000,15.00000000,0.00000000,0.00000000,197.97912598); //object(sm_fir_copse2) (60)
	CreateDynamicObject(690,355.50000000,-3581.50000000,10.50000000,0.00000000,0.00000000,197.97912598); //object(sm_fir_copse2) (61)
	CreateDynamicObject(690,355.50000000,-3581.50000000,10.50000000,0.00000000,0.00000000,197.97912598); //object(sm_fir_copse2) (62)
	CreateDynamicObject(11457,456.60000610,-3697.19995117,23.39999962,352.17593384,347.88552856,356.32629395); //object(des_pueblo09) (1)
	CreateDynamicObject(11459,443.00000000,-3680.89990234,16.60000038,356.11895752,345.96716309,329.03088379); //object(des_pueblo11) (1)
	CreateDynamicObject(11459,447.10000610,-3674.10009766,16.10000038,356.11633301,345.96496582,329.02954102); //object(des_pueblo11) (2)
	CreateDynamicObject(1447,448.29998779,-3666.80004883,16.79999924,0.00000000,0.00000000,236.00000000); //object(dyn_mesh_4) (1)
	CreateDynamicObject(1447,451.29998779,-3662.30004883,16.79999924,0.00000000,0.00000000,235.99731445); //object(dyn_mesh_4) (2)
	CreateDynamicObject(11427,438.70001221,-3722.39990234,30.20000076,12.00000000,0.00000000,276.00000000); //object(des_adobech) (1)
	CreateDynamicObject(11428,432.89999390,-3709.39990234,24.20000076,0.00000000,0.00000000,338.00000000); //object(des_indruin02) (1)
	CreateDynamicObject(11442,455.89999390,-3661.60009766,15.69999981,0.00000000,0.00000000,238.00000000); //object(des_pueblo3) (1)
	CreateDynamicObject(11444,459.70001221,-3653.50000000,15.69999981,0.00000000,0.00000000,328.00000000); //object(des_pueblo2) (1)
	CreateDynamicObject(11447,464.39999390,-3648.00000000,15.60000038,355.75012207,0.50137329,42.03717041); //object(des_pueblo08) (1)
	CreateDynamicObject(11459,440.20001221,-3684.00000000,20.60000038,77.83947754,99.31353760,52.47628784); //object(des_pueblo11) (3)
	CreateDynamicObject(11459,438.39999390,-3687.80004883,20.89999962,75.44311523,285.63354492,43.86840820); //object(des_pueblo11) (4)
	CreateDynamicObject(11459,438.79998779,-3685.30004883,24.60000038,356.11633301,345.96496582,329.02954102); //object(des_pueblo11) (5)
	CreateDynamicObject(11459,436.50000000,-3693.60009766,18.60000038,356.11633301,345.96496582,337.02954102); //object(des_pueblo11) (6)
	CreateDynamicObject(1447,427.39999390,-3710.69995117,20.79999924,0.00000000,0.00000000,271.99731445); //object(dyn_mesh_4) (4)
	CreateDynamicObject(1447,431.89999390,-3702.30004883,20.79999924,0.00000000,0.00000000,265.99401855); //object(dyn_mesh_4) (5)
	CreateDynamicObject(11457,429.89999390,-3724.30004883,20.29999924,0.00000000,350.00000000,342.00000000); //object(des_pueblo09) (2)
	CreateDynamicObject(1442,453.20001221,-3694.00000000,23.70000076,0.00000000,346.00000000,302.00000000); //object(dyn_firebin0) (1)
	CreateDynamicObject(11447,464.79998779,-3666.10009766,20.50000000,340.24856567,346.70312500,17.68032837); //object(des_pueblo08) (2)
	CreateDynamicObject(11447,463.50000000,-3675.80004883,21.70000076,342.61685181,341.62680054,350.33032227); //object(des_pueblo08) (3)
	CreateDynamicObject(11459,455.39999390,-3682.19995117,20.70000076,359.99731445,341.99780273,333.99865723); //object(des_pueblo11) (7)
	CreateDynamicObject(11459,451.50000000,-3687.19995117,20.50000000,335.99426270,359.99279785,63.99420166); //object(des_pueblo11) (8)
	CreateDynamicObject(11459,447.20001221,-3692.10009766,20.70000076,353.57656860,341.87573242,331.89996338); //object(des_pueblo11) (9)
	CreateDynamicObject(11459,445.89999390,-3698.50000000,21.39999962,353.57299805,341.87255859,359.89697266); //object(des_pueblo11) (10)
	CreateDynamicObject(11459,443.60000610,-3704.69995117,22.29999924,347.78195190,4.85009766,93.02307129); //object(des_pueblo11) (11)
	CreateDynamicObject(11459,443.60000610,-3711.10009766,22.29999924,347.77770996,4.84497070,93.02124023); //object(des_pueblo11) (12)
	CreateDynamicObject(11459,435.79998779,-3717.10009766,21.60000038,359.99066162,345.99038696,1.99200439); //object(des_pueblo11) (14)
	CreateDynamicObject(11459,461.60000610,-3712.60009766,27.10000038,347.77770996,4.84497070,93.02124023); //object(des_pueblo11) (15)
	CreateDynamicObject(11459,460.60000610,-3718.50000000,27.60000038,346.25119019,2.81564331,70.66290283); //object(des_pueblo11) (16)
	CreateDynamicObject(11459,454.39999390,-3723.30004883,26.50000000,353.57299805,341.87255859,359.89562988); //object(des_pueblo11) (18)
	CreateDynamicObject(11459,449.79998779,-3723.39990234,25.29999924,353.57299805,341.87255859,359.89562988); //object(des_pueblo11) (19)
	CreateDynamicObject(11459,445.89999390,-3724.60009766,25.10000038,351.24072266,359.48437500,276.41589355); //object(des_pueblo11) (20)
	CreateDynamicObject(1442,445.79998779,-3719.80004883,25.10000038,0.00000000,0.00000000,0.00000000); //object(dyn_firebin0) (2)
	CreateDynamicObject(1327,432.70001221,-3712.69995117,21.89999962,0.00000000,0.00000000,252.75000000); //object(junk_tyre) (1)
	CreateDynamicObject(1327,453.00000000,-3708.50000000,26.00000000,0.00000000,0.00000000,0.00000000); //object(junk_tyre) (2)
	CreateDynamicObject(12957,455.50000000,-3672.19995117,19.00000000,343.00149536,0.78427124,4.72927856); //object(sw_pickupwreck01) (1)
	CreateDynamicObject(1264,443.60000610,-3693.30004883,21.20000076,0.00000000,0.00000000,0.00000000); //object(blackbag1) (1)
	CreateDynamicObject(1264,438.50000000,-3694.50000000,20.00000000,0.00000000,0.00000000,0.00000000); //object(blackbag1) (2)
	CreateDynamicObject(1264,442.89999390,-3701.80004883,22.70000076,0.00000000,0.00000000,0.00000000); //object(blackbag1) (3)
	CreateDynamicObject(1264,434.50000000,-3704.19995117,20.79999924,0.00000000,0.00000000,0.00000000); //object(blackbag1) (4)
	CreateDynamicObject(1264,434.70001221,-3712.30004883,21.89999962,0.00000000,0.00000000,0.00000000); //object(blackbag1) (5)
	CreateDynamicObject(13591,460.70001221,-3687.39990234,24.00000000,349.68630981,10.92871094,103.97994995); //object(kickcar28) (1)
	CreateDynamicObject(854,442.00000000,-3700.80004883,22.00000000,356.15518188,343.96295166,334.89578247); //object(cj_urb_rub_3b) (1)
	CreateDynamicObject(849,434.39999390,-3700.60009766,20.10000038,0.00000000,0.00000000,0.00000000); //object(cj_urb_rub_3) (1)
	CreateDynamicObject(849,451.39999390,-3683.60009766,20.39999962,0.00000000,0.00000000,0.00000000); //object(cj_urb_rub_3) (2)
	CreateDynamicObject(849,460.39999390,-3671.60009766,20.60000038,354.70446777,331.86932373,331.17510986); //object(cj_urb_rub_3) (3)
	CreateDynamicObject(647,425.50000000,-3717.50000000,22.00000000,0.00000000,0.00000000,0.00000000); //object(new_bushsm) (24)
	CreateDynamicObject(677,452.20001221,-3667.80004883,16.39999962,0.00000000,0.00000000,0.00000000); //object(sm_des_agave1) (1)
	CreateDynamicObject(678,435.89999390,-3698.69995117,19.79999924,0.00000000,0.00000000,0.00000000); //object(sm_des_agave2) (1)
	CreateDynamicObject(701,445.39999390,-3716.19995117,24.79999924,0.00000000,0.00000000,0.00000000); //object(sm_tumblewd48p) (1)
	CreateDynamicObject(760,449.10000610,-3708.00000000,24.20000076,0.00000000,0.00000000,0.00000000); //object(sm_bush_small_1) (1)
	CreateDynamicObject(761,456.20001221,-3712.89990234,26.20000076,0.00000000,0.00000000,0.00000000); //object(sm_drybrush_sm1) (1)
	CreateDynamicObject(761,451.39999390,-3716.19995117,25.50000000,0.00000000,0.00000000,0.00000000); //object(sm_drybrush_sm1) (2)
	CreateDynamicObject(818,434.29998779,-3726.30004883,26.70000076,0.00000000,0.00000000,0.00000000); //object(genveg_tallgrass02) (1)
	CreateDynamicObject(819,450.89999390,-3703.80004883,26.20000076,0.00000000,0.00000000,0.00000000); //object(genveg_tallgrass03) (1)
	CreateDynamicObject(1807,453.79998779,-3711.10009766,26.00000000,0.00000000,0.00000000,0.00000000); //object(cj_mediumpots1) (1)
	CreateDynamicObject(3409,460.79998779,-3698.60009766,26.20000076,0.00000000,0.00000000,0.00000000); //object(grassplant) (1)
	CreateDynamicObject(3409,461.10000610,-3694.50000000,25.29999924,0.00000000,0.00000000,0.00000000); //object(grassplant) (2)
	CreateDynamicObject(11447,465.70001221,-3659.30004883,19.70000076,340.68154907,15.64843750,103.53881836); //object(des_pueblo08) (4)
	CreateDynamicObject(11446,452.39999390,-3678.80004883,18.89999962,344.63546753,343.39007568,341.48092651); //object(des_pueblo07) (1)
	CreateDynamicObject(3524,438.60000610,-3681.60009766,20.39999962,37.49328613,1.26040649,278.73278809); //object(skullpillar01_lvs) (1)
	CreateDynamicObject(3524,435.59960938,-3687.79980469,21.10000038,42.98950195,358.96728516,210.44311523); //object(skullpillar01_lvs) (2)
	CreateDynamicObject(664,348.39999390,-3610.19995117,27.20000076,0.00000000,0.00000000,0.00000000); //object(firtree2) (1)
	CreateDynamicObject(661,457.20001221,-3669.69995117,18.50000000,0.00000000,0.00000000,0.00000000); //object(pinetree07) (4)
	CreateDynamicObject(661,463.79998779,-3681.89990234,20.50000000,0.00000000,0.00000000,0.00000000); //object(pinetree07) (5)
	CreateDynamicObject(661,462.70001221,-3653.30004883,16.79999924,0.00000000,0.00000000,0.00000000); //object(pinetree07) (6)
	CreateDynamicObject(661,417.00000000,-3736.39990234,16.79999924,0.00000000,0.00000000,0.00000000); //object(pinetree07) (7)
	CreateDynamicObject(661,433.20001221,-3732.19995117,19.00000000,0.00000000,0.00000000,0.00000000); //object(pinetree07) (8)
	CreateDynamicObject(661,456.10000610,-3721.89990234,26.50000000,0.00000000,0.00000000,0.00000000); //object(pinetree07) (9)
	CreateDynamicObject(690,417.00000000,-3651.10009766,16.39999962,0.00000000,0.00000000,287.99011230); //object(sm_fir_copse2) (63)
	CreateDynamicObject(689,420.70001221,-3642.60009766,19.79999924,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (100)
	CreateDynamicObject(689,426.89999390,-3632.10009766,16.79999924,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (101)
	CreateDynamicObject(689,430.79998779,-3618.10009766,16.79999924,0.00000000,0.00000000,36.00000000); //object(sm_fir_copse1) (102)
	CreateDynamicObject(689,438.50000000,-3611.10009766,16.79999924,0.00000000,0.00000000,35.99670410); //object(sm_fir_copse1) (103)
	CreateDynamicObject(689,441.79998779,-3603.00000000,16.79999924,0.00000000,0.00000000,35.99670410); //object(sm_fir_copse1) (104)
	CreateDynamicObject(689,429.50000000,-3601.00000000,13.80000019,0.00000000,0.00000000,35.99670410); //object(sm_fir_copse1) (105)
	CreateDynamicObject(689,420.60000610,-3591.30004883,10.30000019,0.00000000,0.00000000,35.99670410); //object(sm_fir_copse1) (107)
	CreateDynamicObject(689,409.10000610,-3589.60009766,10.30000019,0.00000000,0.00000000,35.99670410); //object(sm_fir_copse1) (108)
	CreateDynamicObject(689,394.89999390,-3591.60009766,10.30000019,0.00000000,0.00000000,35.99670410); //object(sm_fir_copse1) (109)
	CreateDynamicObject(689,385.89999390,-3588.69995117,10.30000019,0.00000000,0.00000000,35.99670410); //object(sm_fir_copse1) (110)
	CreateDynamicObject(689,372.39999390,-3570.19995117,8.39999962,0.00000000,0.00000000,35.99670410); //object(sm_fir_copse1) (113)
	CreateDynamicObject(689,369.00000000,-3562.39990234,7.50000000,0.00000000,0.00000000,35.99670410); //object(sm_fir_copse1) (114)
	CreateDynamicObject(689,364.29998779,-3555.19995117,4.80000019,0.00000000,0.00000000,35.99670410); //object(sm_fir_copse1) (115)
	CreateDynamicObject(689,374.10000610,-3553.19995117,5.80000019,0.00000000,0.00000000,35.99670410); //object(sm_fir_copse1) (117)
	CreateDynamicObject(689,383.50000000,-3553.00000000,5.80000019,0.00000000,0.00000000,35.99670410); //object(sm_fir_copse1) (118)
	CreateDynamicObject(689,399.10000610,-3551.19995117,5.80000019,0.00000000,0.00000000,297.99670410); //object(sm_fir_copse1) (119)
	CreateDynamicObject(689,405.39999390,-3552.30004883,5.80000019,0.00000000,0.00000000,297.99316406); //object(sm_fir_copse1) (120)
	CreateDynamicObject(689,413.00000000,-3552.39990234,5.80000019,0.00000000,0.00000000,297.99316406); //object(sm_fir_copse1) (121)
	CreateDynamicObject(689,383.60000610,-3564.60009766,4.59999990,0.00000000,0.00000000,297.99316406); //object(sm_fir_copse1) (122)
	CreateDynamicObject(689,392.79998779,-3565.00000000,3.40000010,0.00000000,0.00000000,297.99316406); //object(sm_fir_copse1) (124)
	CreateDynamicObject(689,403.70001221,-3563.50000000,3.40000010,0.00000000,0.00000000,297.99316406); //object(sm_fir_copse1) (125)
	CreateDynamicObject(689,404.50000000,-3577.10009766,3.40000010,0.00000000,0.00000000,297.99316406); //object(sm_fir_copse1) (126)
	CreateDynamicObject(689,423.50000000,-3567.39990234,6.40000010,0.00000000,0.00000000,297.99316406); //object(sm_fir_copse1) (129)
	CreateDynamicObject(689,428.20001221,-3577.69995117,6.40000010,0.00000000,0.00000000,297.99316406); //object(sm_fir_copse1) (130)
	CreateDynamicObject(689,436.29998779,-3580.30004883,6.40000010,0.00000000,0.00000000,297.99316406); //object(sm_fir_copse1) (131)
	CreateDynamicObject(689,432.60000610,-3567.80004883,6.40000010,0.00000000,0.00000000,297.99316406); //object(sm_fir_copse1) (132)
	CreateDynamicObject(690,392.89999390,-3513.69995117,12.30000019,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse2) (64)
	CreateDynamicObject(1503,290.70001221,-3660.30004883,42.90000153,15.75000000,0.00000000,120.00000000); //object(dyn_ramp) (1)
	CreateDynamicObject(16304,256.60000610,-3554.50000000,13.50000000,0.00000000,328.24996948,294.00000000); //object(des_gravelpile05) (2)
	CreateDynamicObject(689,266.70001221,-3621.50000000,33.20000076,0.00000000,0.00000000,315.99426270); //object(sm_fir_copse1) (134)
	CreateDynamicObject(689,256.29998779,-3628.60009766,33.20000076,0.00000000,0.00000000,315.99426270); //object(sm_fir_copse1) (135)
	CreateDynamicObject(689,253.89999390,-3617.39990234,30.70000076,0.00000000,0.00000000,315.99426270); //object(sm_fir_copse1) (136)
	CreateDynamicObject(689,248.69999695,-3605.19995117,27.00000000,0.00000000,0.00000000,315.99426270); //object(sm_fir_copse1) (137)
	CreateDynamicObject(689,346.60000610,-3573.30004883,8.19999981,0.00000000,0.00000000,315.99426270); //object(sm_fir_copse1) (138)
	CreateDynamicObject(689,341.39999390,-3562.50000000,5.80000019,0.00000000,0.00000000,315.99426270); //object(sm_fir_copse1) (139)
	CreateDynamicObject(689,339.89999390,-3553.60009766,2.79999995,0.00000000,0.00000000,315.99426270); //object(sm_fir_copse1) (140)
	CreateDynamicObject(689,339.70001221,-3543.50000000,1.79999995,0.00000000,0.00000000,315.99426270); //object(sm_fir_copse1) (141)
	CreateDynamicObject(689,330.39999390,-3538.39990234,1.29999995,0.00000000,0.00000000,315.99426270); //object(sm_fir_copse1) (142)
	CreateDynamicObject(689,329.29998779,-3553.80004883,3.79999995,0.00000000,0.00000000,315.99426270); //object(sm_fir_copse1) (143)
	CreateDynamicObject(689,320.89999390,-3533.69995117,1.00000000,0.00000000,0.00000000,315.98876953); //object(sm_fir_copse1) (144)
	CreateDynamicObject(689,314.60000610,-3546.39990234,3.79999995,0.00000000,0.00000000,315.99426270); //object(sm_fir_copse1) (145)
	CreateDynamicObject(689,299.39999390,-3541.89990234,2.09999990,0.00000000,0.00000000,315.99426270); //object(sm_fir_copse1) (146)
	CreateDynamicObject(689,283.00000000,-3545.00000000,1.29999995,0.00000000,0.00000000,315.99426270); //object(sm_fir_copse1) (147)
	CreateDynamicObject(689,242.50000000,-3566.80004883,2.79999995,0.00000000,0.00000000,315.99426270); //object(sm_fir_copse1) (148)
	CreateDynamicObject(689,241.00000000,-3586.19995117,10.10000038,0.00000000,0.00000000,321.99429321); //object(sm_fir_copse1) (149)
	CreateDynamicObject(689,243.00000000,-3596.30004883,17.89999962,0.00000000,0.00000000,321.99279785); //object(sm_fir_copse1) (150)
	CreateDynamicObject(689,325.10000610,-3608.19995117,20.39999962,0.00000000,0.00000000,321.99279785); //object(sm_fir_copse1) (151)
	CreateDynamicObject(689,329.70001221,-3590.30004883,19.39999962,0.00000000,0.00000000,321.99279785); //object(sm_fir_copse1) (152)
	CreateDynamicObject(689,313.50000000,-3575.60009766,18.39999962,0.00000000,0.00000000,321.99279785); //object(sm_fir_copse1) (153)
	CreateDynamicObject(689,298.20001221,-3562.30004883,10.10000038,0.00000000,0.00000000,321.98730469); //object(sm_fir_copse1) (154)
	CreateDynamicObject(689,301.29998779,-3597.50000000,23.70000076,0.00000000,0.00000000,321.99279785); //object(sm_fir_copse1) (155)
	CreateDynamicObject(689,267.89999390,-3599.10009766,23.70000076,0.00000000,0.00000000,321.99279785); //object(sm_fir_copse1) (156)
	CreateDynamicObject(689,254.00000000,-3585.30004883,17.50000000,0.00000000,0.00000000,321.99279785); //object(sm_fir_copse1) (157)
	CreateDynamicObject(689,297.60000610,-3588.89990234,17.50000000,0.00000000,0.00000000,321.99279785); //object(sm_fir_copse1) (158)
	CreateDynamicObject(689,288.00000000,-3572.69995117,17.50000000,0.00000000,0.00000000,321.99279785); //object(sm_fir_copse1) (159)
	CreateDynamicObject(689,279.50000000,-3558.60009766,9.00000000,0.00000000,0.00000000,321.99279785); //object(sm_fir_copse1) (160)
	CreateDynamicObject(690,300.79998779,-3610.60009766,34.20000076,0.00000000,0.00000000,321.99279785); //object(sm_fir_copse2) (66)
	CreateDynamicObject(690,271.70001221,-3612.50000000,34.20000076,0.00000000,0.00000000,321.99279785); //object(sm_fir_copse2) (67)
	CreateDynamicObject(11515,348.39999390,-3632.19995117,15.00000000,337.99987793,0.00000000,5.99853516); //object(nw_bit_13) (1)
	CreateDynamicObject(689,327.60000610,-3575.19995117,18.39999962,0.00000000,0.00000000,321.99279785); //object(sm_fir_copse1) (162)
	CreateDynamicObject(689,313.70001221,-3564.10009766,14.69999981,0.00000000,0.00000000,321.99279785); //object(sm_fir_copse1) (163)
	CreateDynamicObject(791,412.70001221,-3580.80004883,-5.90000010,0.00000000,0.00000000,0.00000000); //object(vbg_fir_copse) (9)
	CreateDynamicObject(791,425.29998779,-3633.60009766,-5.90000010,0.00000000,0.00000000,16.00000000); //object(vbg_fir_copse) (10)
	CreateDynamicObject(791,324.00000000,-3619.89990234,-5.90000010,0.00000000,0.00000000,276.00000000); //object(vbg_fir_copse) (11)
	CreateDynamicObject(791,307.50000000,-3568.30004883,-9.60000038,0.00000000,0.00000000,0.00000000); //object(vbg_fir_copse) (12)
	CreateDynamicObject(791,252.60000610,-3620.60009766,-9.60000038,0.00000000,0.00000000,0.00000000); //object(vbg_fir_copse) (13)
	CreateDynamicObject(791,314.50000000,-3698.30004883,-9.60000038,0.00000000,0.00000000,0.00000000); //object(vbg_fir_copse) (14)
	CreateDynamicObject(791,335.60000610,-3675.89990234,-9.60000038,0.00000000,0.00000000,0.00000000); //object(vbg_fir_copse) (15)
	CreateDynamicObject(791,354.50000000,-3655.19995117,-15.39999962,0.00000000,0.00000000,0.00000000); //object(vbg_fir_copse) (16)
	CreateDynamicObject(690,342.00000000,-3723.39990234,21.60000038,0.00000000,0.00000000,273.99353027); //object(sm_fir_copse2) (69)
	CreateDynamicObject(690,350.60000610,-3733.10009766,21.60000038,0.00000000,0.00000000,273.99353027); //object(sm_fir_copse2) (70)
	CreateDynamicObject(690,361.50000000,-3738.50000000,21.60000038,0.00000000,0.00000000,273.99353027); //object(sm_fir_copse2) (71)
	CreateDynamicObject(690,372.39999390,-3736.69995117,19.89999962,0.00000000,0.00000000,273.99353027); //object(sm_fir_copse2) (72)
	CreateDynamicObject(690,334.89999390,-3735.00000000,19.20000076,0.00000000,0.00000000,273.99353027); //object(sm_fir_copse2) (73)
	CreateDynamicObject(690,323.29998779,-3725.89990234,19.20000076,0.00000000,0.00000000,273.99353027); //object(sm_fir_copse2) (74)
	CreateDynamicObject(690,316.60000610,-3736.50000000,17.00000000,0.00000000,0.00000000,273.99353027); //object(sm_fir_copse2) (75)
	CreateDynamicObject(690,303.29998779,-3727.30004883,17.00000000,0.00000000,0.00000000,273.99353027); //object(sm_fir_copse2) (76)
	CreateDynamicObject(685,408.50000000,-3695.39990234,18.39999962,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (1)
	CreateDynamicObject(685,409.29998779,-3690.39990234,18.60000038,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (2)
	CreateDynamicObject(685,420.70001221,-3682.19995117,15.80000019,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (3)
	CreateDynamicObject(685,412.79998779,-3686.69995117,17.29999924,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (4)
	CreateDynamicObject(685,411.29998779,-3694.30004883,17.39999962,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (5)
	CreateDynamicObject(685,419.10000610,-3689.10009766,16.20000076,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (6)
	CreateDynamicObject(685,415.50000000,-3691.80004883,16.10000038,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (7)
	CreateDynamicObject(685,408.60000610,-3699.10009766,17.70000076,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (8)
	CreateDynamicObject(685,414.10000610,-3698.10009766,16.39999962,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (9)
	CreateDynamicObject(685,412.50000000,-3701.39990234,16.50000000,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (10)
	CreateDynamicObject(685,408.70001221,-3706.50000000,16.60000038,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (11)
	CreateDynamicObject(685,409.00000000,-3711.50000000,16.79999924,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (12)
	CreateDynamicObject(685,403.70001221,-3714.89990234,16.70000076,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (13)
	CreateDynamicObject(685,403.89999390,-3721.30004883,16.89999962,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (14)
	CreateDynamicObject(685,399.10000610,-3725.60009766,16.89999962,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (15)
	CreateDynamicObject(685,406.60000610,-3717.80004883,17.00000000,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (16)
	CreateDynamicObject(685,392.29998779,-3738.00000000,20.10000038,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (17)
	CreateDynamicObject(685,395.79998779,-3736.89990234,18.00000000,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (18)
	CreateDynamicObject(685,395.20001221,-3732.39990234,18.00000000,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (19)
	CreateDynamicObject(685,398.89999390,-3732.89990234,17.79999924,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (20)
	CreateDynamicObject(685,400.79998779,-3733.60009766,18.00000000,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (21)
	CreateDynamicObject(685,380.39999390,-3729.10009766,34.70000076,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (22)
	CreateDynamicObject(685,383.89999390,-3726.00000000,33.90000153,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (23)
	CreateDynamicObject(685,388.29998779,-3722.89990234,31.79999924,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (24)
	CreateDynamicObject(685,385.50000000,-3722.39990234,32.70000076,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (25)
	CreateDynamicObject(685,404.10000610,-3695.10009766,19.89999962,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (26)
	CreateDynamicObject(685,399.89999390,-3700.89990234,23.10000038,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (27)
	CreateDynamicObject(685,394.00000000,-3706.89990234,25.70000076,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (28)
	CreateDynamicObject(685,394.60000610,-3711.69995117,27.20000076,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (29)
	CreateDynamicObject(685,391.20001221,-3712.30004883,28.10000038,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (30)
	CreateDynamicObject(685,389.00000000,-3720.00000000,31.70000076,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (31)
	CreateDynamicObject(685,388.29998779,-3716.00000000,29.79999924,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (32)
	CreateDynamicObject(685,363.10000610,-3714.60009766,32.59999847,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (33)
	CreateDynamicObject(685,364.89999390,-3716.89990234,32.90000153,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (34)
	CreateDynamicObject(685,368.10000610,-3716.60009766,30.89999962,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (35)
	CreateDynamicObject(685,368.60000610,-3713.69995117,30.10000038,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (36)
	CreateDynamicObject(685,373.20001221,-3716.00000000,29.89999962,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (37)
	CreateDynamicObject(685,374.60000610,-3712.89990234,28.70000076,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (38)
	CreateDynamicObject(685,381.00000000,-3709.69995117,26.89999962,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (39)
	CreateDynamicObject(685,383.50000000,-3707.30004883,25.00000000,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (40)
	CreateDynamicObject(685,365.10000610,-3710.80004883,32.20000076,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (41)
	CreateDynamicObject(685,367.39999390,-3707.89990234,31.70000076,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (42)
	CreateDynamicObject(685,371.00000000,-3703.50000000,30.89999962,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (43)
	CreateDynamicObject(685,376.00000000,-3700.30004883,29.89999962,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (44)
	CreateDynamicObject(685,376.79998779,-3696.89990234,29.89999962,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (45)
	CreateDynamicObject(685,381.20001221,-3693.80004883,29.39999962,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (46)
	CreateDynamicObject(685,382.79998779,-3690.80004883,29.20000076,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (47)
	CreateDynamicObject(685,408.60000610,-3657.69995117,24.89999962,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (48)
	CreateDynamicObject(685,405.60000610,-3662.30004883,25.29999924,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (49)
	CreateDynamicObject(685,403.10000610,-3663.80004883,25.79999924,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (50)
	CreateDynamicObject(685,401.20001221,-3669.50000000,26.00000000,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (51)
	CreateDynamicObject(685,396.60000610,-3672.00000000,26.70000076,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (52)
	CreateDynamicObject(685,396.00000000,-3677.19995117,26.89999962,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (53)
	CreateDynamicObject(685,396.00000000,-3677.80004883,29.39999962,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (54)
	CreateDynamicObject(685,392.70001221,-3680.89990234,27.60000038,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (55)
	CreateDynamicObject(685,389.50000000,-3682.80004883,28.20000076,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (56)
	CreateDynamicObject(685,389.29998779,-3685.00000000,28.20000076,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (57)
	CreateDynamicObject(685,385.70001221,-3687.69995117,28.70000076,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (58)
	CreateDynamicObject(685,436.70001221,-3655.80004883,12.60000038,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (60)
	CreateDynamicObject(685,435.10000610,-3660.69995117,12.89999962,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (61)
	CreateDynamicObject(685,432.50000000,-3662.80004883,13.10000038,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (62)
	CreateDynamicObject(685,432.20001221,-3667.19995117,13.30000019,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (63)
	CreateDynamicObject(685,427.29998779,-3671.80004883,14.39999962,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (64)
	CreateDynamicObject(685,428.60000610,-3674.10009766,13.69999981,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (65)
	CreateDynamicObject(685,460.39999390,-3628.30004883,12.50000000,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (66)
	CreateDynamicObject(685,451.89999390,-3633.60009766,12.30000019,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (67)
	CreateDynamicObject(685,451.60000610,-3639.39990234,13.19999981,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (68)
	CreateDynamicObject(685,447.39999390,-3644.10009766,13.39999962,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (69)
	CreateDynamicObject(685,442.79998779,-3649.00000000,13.10000038,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (70)
	CreateDynamicObject(685,440.70001221,-3655.10009766,12.89999962,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (71)
	CreateDynamicObject(685,422.89999390,-3663.60009766,19.20000076,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (72)
	CreateDynamicObject(685,413.79998779,-3660.39990234,23.39999962,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (73)
	CreateDynamicObject(685,391.10000610,-3722.39990234,30.10000038,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (74)
	CreateDynamicObject(685,393.79998779,-3716.19995117,28.00000000,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (75)
	CreateDynamicObject(685,384.79998779,-3729.69995117,33.50000000,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (76)
	CreateDynamicObject(685,335.39999390,-3602.10009766,30.39999962,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (77)
	CreateDynamicObject(685,345.10000610,-3602.10009766,27.29999924,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (78)
	CreateDynamicObject(685,345.60000610,-3592.80004883,25.00000000,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (79)
	CreateDynamicObject(685,289.79998779,-3637.19995117,41.09999847,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (80)
	CreateDynamicObject(685,258.60000610,-3575.69995117,19.10000038,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (81)
	CreateDynamicObject(685,266.60000610,-3589.00000000,26.20000076,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (82)
	CreateDynamicObject(685,263.10000610,-3592.10009766,26.70000076,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (83)
	CreateDynamicObject(685,340.00000000,-3486.00000000,5.50000000,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (84)
	CreateDynamicObject(685,334.29998779,-3497.50000000,4.90000010,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (85)
	CreateDynamicObject(685,335.00000000,-3507.89990234,6.80000019,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (86)
	CreateDynamicObject(685,346.39999390,-3511.19995117,11.30000019,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (87)
	CreateDynamicObject(685,345.00000000,-3478.19995117,6.69999981,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (88)
	CreateDynamicObject(685,346.79998779,-3463.30004883,6.30000019,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (89)
	CreateDynamicObject(685,351.70001221,-3454.19995117,8.19999981,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (90)
	CreateDynamicObject(685,347.70001221,-3447.60009766,5.09999990,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (91)
	CreateDynamicObject(685,328.29998779,-3346.80004883,6.30000019,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (92)
	CreateDynamicObject(685,329.89999390,-3338.30004883,7.90000010,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (93)
	CreateDynamicObject(685,335.89999390,-3352.50000000,7.30000019,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (94)
	CreateDynamicObject(685,340.89999390,-3364.60009766,5.09999990,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (95)
	CreateDynamicObject(685,411.29998779,-3348.89990234,8.00000000,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (96)
	CreateDynamicObject(685,417.60000610,-3356.89990234,8.19999981,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (97)
	CreateDynamicObject(685,409.79998779,-3360.19995117,8.69999981,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (98)
	CreateDynamicObject(685,383.00000000,-3296.89990234,10.50000000,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (99)
	CreateDynamicObject(685,385.89999390,-3311.39990234,9.30000019,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (100)
	CreateDynamicObject(685,385.29998779,-3323.69995117,10.89999962,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (101)
	CreateDynamicObject(685,407.20001221,-3306.69995117,5.00000000,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (102)
	CreateDynamicObject(685,408.50000000,-3323.69995117,6.30000019,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (103)
	CreateDynamicObject(685,414.60000610,-3332.60009766,6.69999981,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (104)
	CreateDynamicObject(685,434.50000000,-3729.60009766,27.10000038,0.00000000,0.00000000,0.00000000); //object(sm_fir_scabby) (105)
	CreateDynamicObject(2985,309.00000000,-3662.89990234,44.00000000,0.00000000,0.00000000,0.00000000); //object(minigun_base) (1)
	CreateDynamicObject(831,461.29980469,-3473.89941406,5.90000010,0.00000000,7.99804688,21.99462891); //object(dead_tree_5) (1)
	CreateDynamicObject(831,461.29980469,-3473.89941406,5.90000010,0.00000000,7.99804688,21.99462891); //object(dead_tree_5) (1)
	CreateDynamicObject(11245,398.60000610,-3365.10009766,11.19999981,0.00000000,287.00000000,18.25000000); //object(sfsefirehseflag) (1)
	CreateDynamicObject(3524,452.70001221,-3714.89990234,27.10000038,10.98919678,0.75830078,249.84382629); //object(skullpillar01_lvs) (2)
	CreateDynamicObject(2985,415.50000000,-3318.89990234,5.50000000,0.00000000,0.00000000,0.00000000); //object(minigun_base) (2)
	CreateDynamicObject(2977,417.50000000,-3318.69995117,5.19999981,0.00000000,0.00000000,0.00000000); //object(kmilitary_crate) (1)
	CreateDynamicObject(2977,417.50000000,-3317.39990234,5.19999981,0.00000000,0.00000000,0.00000000); //object(kmilitary_crate) (2)
	CreateDynamicObject(2922,405.20001221,-3311.19995117,7.50000000,1.74575806,4.00186157,84.87786865); //object(kmb_keypad) (1)
	CreateDynamicObject(3787,407.29998779,-3311.80004883,6.09999990,358.00122070,2.00122070,356.06982422); //object(missile_02_sfxr) (1)
	CreateDynamicObject(3797,416.29998779,-3313.60009766,8.30000019,0.00000000,0.00000000,0.00000000); //object(missile_11_sfxr) (1)
	CreateDynamicObject(3797,417.39999390,-3315.30004883,8.10000038,0.00000000,0.00000000,0.00000000); //object(missile_11_sfxr) (2)
	CreateDynamicObject(3794,410.79998779,-3311.89990234,6.00000000,0.00000000,0.00000000,0.00000000); //object(missile_07_sfxr) (1)
	CreateDynamicObject(16093,367.60000610,-3300.80004883,21.39999962,0.00000000,0.00000000,0.00000000); //object(a51_gatecontrol) (1)
	CreateDynamicObject(987,411.60000610,-3367.60009766,8.39999962,0.00000000,4.00000000,0.00000000); //object(elecfence_bar) (1)
	CreateDynamicObject(987,423.00000000,-3367.50000000,7.09999990,0.00000000,3.99902344,0.00000000); //object(elecfence_bar) (1)
	CreateDynamicObject(987,434.50000000,-3367.39990234,6.09999990,359.50402832,7.24929810,0.06307983); //object(elecfence_bar) (1)
	CreateDynamicObject(987,446.00000000,-3367.19995117,4.50000000,359.50012207,7.24548340,0.06042480); //object(elecfence_bar) (1)
	CreateDynamicObject(987,457.79998779,-3367.19995117,3.00000000,359.49694824,3.24533081,0.02539062); //object(elecfence_bar) (1)
	CreateDynamicObject(689,482.19921875,-3348.69921875,1.70000005,0.00000000,0.00000000,0.00000000); //object(sm_fir_copse1) (38)
	CreateDynamicObject(987,469.70001221,-3367.39990234,2.79999995,359.49462891,3.24096680,0.02197266); //object(elecfence_bar) (1)
	CreateDynamicObject(987,481.60000610,-3367.30004883,2.29999995,359.49462891,3.24096680,0.02197266); //object(elecfence_bar) (1)
	CreateDynamicObject(987,493.39999390,-3367.30004883,2.00000000,359.49462891,3.24096680,0.02197266); //object(elecfence_bar) (1)
	CreateDynamicObject(987,505.20001221,-3367.39990234,2.00000000,359.49462891,3.24096680,0.02197266); //object(elecfence_bar) (1)
	CreateDynamicObject(1503,507.79998779,-3373.00000000,2.59999990,3.24801636,2.00320435,353.88644409); //object(dyn_ramp) (2)
	CreateDynamicObject(901,388.79980469,-3291.39941406,1.60000002,4.89990234,101.23901367,110.01159668); //object(searock05) (1)
	CreateDynamicObject(901,405.50000000,-3287.39990234,1.60000002,4.89990234,101.23901367,110.01159668); //object(searock05) (1)
	return 1;
}

stock DayZSA_SelectObj()
{
	new obj;
	switch(random(35))
	{
	    case 0: obj = 353;
	    case 1: obj = 355;
	    case 2: obj = 356;
	    case 3: obj = 358;
	    case 4: obj = 357;
	    case 5: obj = 346;
	    case 6: obj = 347;
	    case 7: obj = 349;
	    case 8: obj = 3082;
	    case 9: obj = 3082;
	    case 10: obj = 3082;
	    case 11: obj = 3082;
	    case 12: obj = 3082;
	    case 13: obj = 1579;
	    case 14: obj = 1580;
	    case 15: obj = 1578;
	    case 16: obj = 1575;
	    case 17: obj = 1576;
	    case 18: obj = 1650;
	    case 19: obj = 1650;
	    case 20: obj = 1327;
	    case 21: obj = 19130;
	    case 22: obj = 19166;
	    case 23: obj = 2683;
	    case 24: obj = 2814;
	    case 25: obj = 2703;
	    case 26: obj = 354;
	    case 27: obj = 2647;
	    case 28: obj = 2856;
	    case 29: obj = 2647;
	    case 30: obj = 2969;
	    case 31: obj = 943;
	    case 32: obj = 371;
		case 33: obj = 1310;
		case 34: obj = 1550;
	}
	return obj;
}

function DayZSA_DisplayLootFunction(playerid)
{
	new str[64];
	format(str,sizeof(str),"1\t%s",Loot[GetLootIDFunction(playerid)][lootDrop]);
	ShowPlayerDialog(playerid,DIALOG_LOOTING_DROP,DIALOG_STYLE_LIST,""COL_LIGHTBLUE"GEAR Looting",str,"Take","Close");
	return 1;
}

stock DayZSA_IsPlayerNearObject(playerid, objectid, Float:range)
{
    new Float:X, Float:Y, Float:Z;
    GetDynamicObjectPos(objectid, X, Y, Z);
    if(IsPlayerInRangeOfPoint(playerid, range, X, Y, Z))return true;
    return false;
}

stock DayZSA_GetLootNameLow()
{
	new str[128];
	switch(random(23))
	{
	    case 0: str = "Pistol Ammo";
	    case 1: str = "Shotgun Ammo";
	    case 2: str = "Assault Ammo";
	    case 3: str = "Sniper Ammo";
	    case 4: str = "Dirty Pizza Slice";
	    case 5: str = "SMG Ammo";
	    case 6: str = "Empty Jerry Can";
	    case 7: str = "Soda Bottle";
	    case 8: str = "ToolBox";
	    case 9: str = "Silenced Pistol";
	    case 10: str = "Pistol";
		case 11: str = "Burger";
		case 12: str = "Full Water Bottle";
		case 13: str = "Empty Water Bottle";
		case 14: str = "Can of Beans";
		case 15: str = "Dirty Pizza Slice";
		case 16: str = "Baseball Bat";
		case 17: str = "Katana";
		case 18: str = "Binoculars";
		case 19: str = "Heat Pack";
		case 20: str = "Orange";
		case 21: str = "Dirty Water Bottle";
		case 22: str = "Rope";
	}
	return str;
}

stock DayZSA_GetLootNameMedium()
{
	new str[128];
	switch(random(24))
	{
	    case 0: str = "MP5";
	    case 1: str = "Morphine";
	    case 2: str = "Bandage";
	    case 3: str = "Shotgun";
	    case 4: str = "Map";
	    case 5: str = "GPS";
		case 6: str = "Milk";
		case 7: str = "Can of Beans";
		case 8: str = "Tire";
		case 9: str = "Blood Bag";
		case 10: str = "Country Rifle";
		case 11: str = "SPAZ-12 Shotgun";
		case 12: str = "Czech Vest Pouch";
		case 13: str = "Army Skin";
		case 14: str = "Road Flare";
		case 15: str = "Burger";
		case 16: str = "Full Water Bottle";
		case 17: str = "Can of Beans";
		case 18: str = "Dirty Pizza Slice";
		case 19: str = "Radio Device";
		case 20: str = "Civilian Skin";
		case 21: str=  "Orange";
		case 22: str = "Dirty Water Bottle";
		case 23: str = "Rope";
	}
	return str;
}

stock DayZSA_GetLootNameHigh()
{
	new str[128];
	switch(random(11))
	{
	    case 0: str = "AK-47";
	    case 1: str = "M4";
	    case 2: str = "Sniper Rifle";
	    case 3: str = "Medical Kit";
	    case 4: str = "Engine";
	    case 5: str = "Alice Pack";
	    case 6: str = "Coyote Backpack";
	    case 7: str = "Tent";
	    case 8: str = "Radio Device";
	    case 9: str = "Sniper Skin";
	    case 10: str = "Rope";
	}
	return str;
}

function DayZSA_DisplayVehicleStorage(playerid)
{
	new str[256];

	if(vInfo[GetVehicleNearID(playerid)][vehicleSlots] == 1)
	{
		format(str,sizeof(str),"%s",
		vInfo[GetVehicleNearID(playerid)][vSlot1]);
	    ShowPlayerDialog(playerid,DIALOG_VEHICLE_STORAGE,DIALOG_STYLE_LIST,""COL_GREEN"GEAR Vehicle Storage (1 SLOTS)",str,"Select","Close");
	}

	if(vInfo[GetVehicleNearID(playerid)][vehicleSlots] == 2)
	{
		format(str,sizeof(str),"%s\n%s",
		vInfo[GetVehicleNearID(playerid)][vSlot1],
		vInfo[GetVehicleNearID(playerid)][vSlot2]);
	    ShowPlayerDialog(playerid,DIALOG_VEHICLE_STORAGE,DIALOG_STYLE_LIST,""COL_GREEN"GEAR Vehicle Storage (2 SLOTS)",str,"Select","Close");
	}

	if(vInfo[GetVehicleNearID(playerid)][vehicleSlots] == 4)
	{
		format(str,sizeof(str),"%s\n%s\n%s\n%s",
		vInfo[GetVehicleNearID(playerid)][vSlot1],
		vInfo[GetVehicleNearID(playerid)][vSlot2],
		vInfo[GetVehicleNearID(playerid)][vSlot3],
		vInfo[GetVehicleNearID(playerid)][vSlot4]);
	    ShowPlayerDialog(playerid,DIALOG_VEHICLE_STORAGE,DIALOG_STYLE_LIST,""COL_GREEN"GEAR Vehicle Storage (4 SLOTS)",str,"Select","Close");
	}

	if(vInfo[GetVehicleNearID(playerid)][vehicleSlots] == 6)
	{
		format(str,sizeof(str),"%s\n%s\n%s\n%s\n%s\n%s",
		vInfo[GetVehicleNearID(playerid)][vSlot1],
		vInfo[GetVehicleNearID(playerid)][vSlot2],
		vInfo[GetVehicleNearID(playerid)][vSlot3],
		vInfo[GetVehicleNearID(playerid)][vSlot4],
		vInfo[GetVehicleNearID(playerid)][vSlot5],
		vInfo[GetVehicleNearID(playerid)][vSlot6]);
	    ShowPlayerDialog(playerid,DIALOG_VEHICLE_STORAGE,DIALOG_STYLE_LIST,""COL_GREEN"GEAR Vehicle Storage (6 SLOTS)",str,"Select","Close");
	}
	return 1;
}

function DayZSA_DisplayTent(playerid)
{
	new str[364];
	format(str,sizeof(str),"%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s",
	Tent[GetTentID(playerid)][tentSlot1],
	Tent[GetTentID(playerid)][tentSlot2],
	Tent[GetTentID(playerid)][tentSlot3],
	Tent[GetTentID(playerid)][tentSlot4],
	Tent[GetTentID(playerid)][tentSlot5],
	Tent[GetTentID(playerid)][tentSlot6],
	Tent[GetTentID(playerid)][tentSlot7],
	Tent[GetTentID(playerid)][tentSlot8],
	Tent[GetTentID(playerid)][tentSlot9],
	Tent[GetTentID(playerid)][tentSlot10],
	Tent[GetTentID(playerid)][tentSlot11],
	Tent[GetTentID(playerid)][tentSlot12],
	Tent[GetTentID(playerid)][tentSlot13],
	Tent[GetTentID(playerid)][tentSlot14],
	Tent[GetTentID(playerid)][tentSlot15],
	Tent[GetTentID(playerid)][tentSlot16]);

	ShowPlayerDialog(playerid,DIALOG_TENT_VIEW,DIALOG_STYLE_LIST,""COL_WHITE"GEAR Tent"COL_GREEN" (16 SLOTS)",str,"Select","Close");
	return 1;
}

function DayZSA_DisplayHospital(playerid)
{
	new str[256];
	format(str,sizeof(str),"%s\n%s\n%s\n%s\n%s\n%s",
	Loot[GetHospitalID(playerid)][HosSlot1],
	Loot[GetHospitalID(playerid)][HosSlot2],
	Loot[GetHospitalID(playerid)][HosSlot3],
	Loot[GetHospitalID(playerid)][HosSlot4],
	Loot[GetHospitalID(playerid)][HosSlot5],
	Loot[GetHospitalID(playerid)][HosSlot6]);

	ShowPlayerDialog(playerid,DIALOG_HOSPITAL,DIALOG_STYLE_LIST,""COL_WHITE"GEAR Hospital Crate"COL_GREEN" (6 SLOTS)",str,"Take","Close");
	return 1;
}

function DayZSA_DisplayAirdrop(playerid)
{
	new str[500];
	format(str,sizeof(str),"%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s",
	Loot[GetAirDropID(playerid)][AirSlot1],
	Loot[GetAirDropID(playerid)][AirSlot2],
	Loot[GetAirDropID(playerid)][AirSlot3],
	Loot[GetAirDropID(playerid)][AirSlot4],
	Loot[GetAirDropID(playerid)][AirSlot5],
	Loot[GetAirDropID(playerid)][AirSlot6],
	Loot[GetAirDropID(playerid)][AirSlot7],
	Loot[GetAirDropID(playerid)][AirSlot8],
	Loot[GetAirDropID(playerid)][AirSlot9],
	Loot[GetAirDropID(playerid)][AirSlot10],
	Loot[GetAirDropID(playerid)][AirSlot11],
	Loot[GetAirDropID(playerid)][AirSlot12]);

	ShowPlayerDialog(playerid,DIALOG_AIRDROP,DIALOG_STYLE_LIST,""COL_WHITE"GEAR Military Crate"COL_GREEN" (12 SLOTS)",str,"Take","Close");
	return 1;
}

stock ShowInventoryStorage(playerid)
{
    if(!IsPlayerNPC(playerid))
    {
		gItemList="";
		for(new item;item<MAX_ITEMS;item++)
		{
			if(!strlen(_GetItemNamePVar(playerid,item))||!_GetItemAmountPVar(playerid,item))continue;
			format(gItemList,sizeof(gItemList),"%s\n%d\t\t%s",gItemList,_GetItemAmountPVar(playerid,item),_GetItemNamePVar(playerid,item));
		}
		format(gItemList,sizeof(gItemList),"%s",gItemList);
		ShowPlayerDialog(playerid,DIALOG_VEHICLE_STORAGE_S2,DIALOG_STYLE_LIST,""COL_GREEN"GEAR Vehicle Storage",gItemList,"Add Item","Close");
	}
	return 1;
}

stock ShowInventoryTent(playerid)
{
    if(!IsPlayerNPC(playerid))
    {
		gItemList="";
		for(new item;item<MAX_ITEMS;item++)
		{
			if(!strlen(_GetItemNamePVar(playerid,item))||!_GetItemAmountPVar(playerid,item))continue;
			format(gItemList,sizeof(gItemList),"%s\n%d\t\t%s",gItemList,_GetItemAmountPVar(playerid,item),_GetItemNamePVar(playerid,item));
		}
		format(gItemList,sizeof(gItemList),"%s",gItemList);
		ShowPlayerDialog(playerid,DIALOG_TENT_VIEW_S2,DIALOG_STYLE_LIST,""COL_GREEN"GEAR Viewing Tent (16 SLOTS)",gItemList,"Add Item","Close");
	}
	return 1;
}

function DayZSA_DisplayLootZombie(playerid)
{
	new str[64];
	format(str,sizeof(str),"1\t%s",Loot[GetLootIDZombie(playerid)][lootDrop]);
	ShowPlayerDialog(playerid,DIALOG_LOOTING_DROPZ,DIALOG_STYLE_LIST,""COL_LIGHTBLUE"GEAR Looting",str,"Take","Close");
	return 1;
}

function DayZSA_DisplayLootForPlayer(playerid)
{
	new str[64];
	format(str,sizeof(str),"1\t%s",Loot[GetLootID(playerid)][LootName]);
	ShowPlayerDialog(playerid,DIALOG_LOOTING,DIALOG_STYLE_LIST,""COL_LIGHTBLUE"GEAR Looting",str,"Take","Cancel");
	return 1;
}

function DayZSA_LootSetupMarket()
{
	new str[64],dayzmodel, Float:rotx, Float:roty, Float:rotz;
	switch(random(14))
	{
		case 0: format(str,sizeof(str),"Soda Bottle"),dayzmodel = 2647, rotx = 0.0, roty = 0.0, rotz = 0.0;
		case 1: format(str,sizeof(str),"Burger"),dayzmodel = 2663, rotx = 0.0, roty = 0.0, rotz = 0.0;
    	case 2: format(str,sizeof(str),"Whiskey Bottle"),dayzmodel = 2683, rotx = 0.0, roty = 0.0, rotz = 0.0;
    	case 3: format(str,sizeof(str),"Milk"),dayzmodel = 2856, rotx = 0.0, roty = 0.0, rotz = 0.0;
	    case 4: format(str,sizeof(str),"Dirty Pizza Slice"),dayzmodel = 2814, rotx = 0.0, roty = 0.0, rotz = 0.0;
	    case 5: format(str,sizeof(str),"Full Water Bottle"),dayzmodel = 2814, rotx = 0.0, roty = 0.0, rotz = 0.0;
		case 6: format(str,sizeof(str),"Can of Beans"),dayzmodel = 2769, rotx = 0.0, roty = 0.0, rotz = 0.0;
		case 7: format(str,sizeof(str),"Civilian Skin"),dayzmodel = 1275, rotx = 272.828125, roty = 134.98297119141, rotz = 135.01782226563;
		case 8: format(str,sizeof(str),"Raw Meat"),dayzmodel = 2804, rotx = 0.0, roty = 0.0, rotz = 0.0;
		case 9: format(str,sizeof(str),"Lighter"),dayzmodel = 2751, rotx = 0.0, roty = 0.0, rotz = 0.0;
		case 10: format(str,sizeof(str),"Antibiotics"),dayzmodel = 1577, rotx = 0.0, roty = 0.0, rotz = 0.0;
		case 11: format(str,sizeof(str),"Orange"), dayzmodel = 19574, rotx= 0.0, roty = 0.0, rotz = 0.0;
		case 12: format(str,sizeof(str),"Dirty Water Bottle"),dayzmodel = 2683, rotx = 0.0, roty = 0.0, rotz = 0.0;
		case 13: format(str,sizeof(str),"Rope"),dayzmodel = 19088, rotx = 0.0, roty = 0.0, rotz = 0.0;
	}
	Loot[lootCount][ModelID] = dayzmodel;
	Loot[lootCount][LootName] = str;
	Loot[lootCount][LootRotX] = rotx;
	Loot[lootCount][LootRotY] = roty;
	Loot[lootCount][LootRotZ] = rotz;
	return 1;
}

function DayZSA_LootSetupFarm()
{
	new str[64],dayzmodel, Float:rotx, Float:roty, Float:rotz;
	switch(random(20))
	{
	    case 0: format(str,sizeof(str),"Empty Jerry Can"),dayzmodel = 1650, rotx = 0.0, roty = 0.0, rotz = 0.0;
	    case 1: format(str,sizeof(str),"Soda Bottle"),dayzmodel = 2647, rotx = 0.0, roty = 0.0, rotz = 0.0;
	    case 2: format(str,sizeof(str),"Toolbox"),dayzmodel = 3052, rotx = 0.0, roty = 0.0, rotz = 0.0;
   		case 3: format(str,sizeof(str),"Can of Beans"),dayzmodel = 2769, rotx = 0.0, roty = 0.0, rotz = 0.0;
		case 4: format(str,sizeof(str),"Dirty Pizza Slice"),dayzmodel = 2814, rotx = 0.0, roty = 0.0, rotz = 0.0;
		case 5: format(str,sizeof(str),"Full Water Bottle"),dayzmodel = 2683, rotx = 0.0, roty = 0.0, rotz = 0.0;
		case 6: format(str,sizeof(str),"Country Rifle"),dayzmodel = 357, rotx = 276.0, roty = 90.0, rotz = 90.0;
		case 7: format(str,sizeof(str),"Sniper Ammo"),dayzmodel = 3013, rotx = 0.0, roty = 0.0, rotz = 0.0;
		case 8: format(str,sizeof(str),"Alice Pack"),dayzmodel = 1310, rotx = 271.99987792969, roty = 270.00048828125, rotz = 270.00036621094;
		case 9: format(str,sizeof(str),"Burger"),dayzmodel = 2663, rotx = 0.0, roty = 0.0, rotz = 0.0;
    	case 10: format(str,sizeof(str),"Whiskey Bottle"),dayzmodel = 2683, rotx = 0.0, roty = 0.0, rotz = 0.0;
    	case 11: format(str,sizeof(str),"Milk"),dayzmodel = 2856, rotx = 0.0, roty = 0.0, rotz = 0.0;
    	case 12: format(str,sizeof(str),"Czech Vest Pouch"),dayzmodel = 371, rotx = 82.7929077, roty = 236.4282684, rotz = 123.7814941;
    	case 13: format(str,sizeof(str),"Full Water Bottle"),dayzmodel = 2683, rotx = 0.0, roty = 0.0, rotz = 0.0;
    	case 14: format(str,sizeof(str),"Army Skin"),dayzmodel = 19106, rotx = 82.7929077, roty = 236.4282684, rotz = 123.7814941;
    	case 15: format(str,sizeof(str),"Raw Meat"),dayzmodel = 2804, rotx = 0.0, roty = 0.0, rotz = 0.0;
    	case 16: format(str,sizeof(str),"Wood"),dayzmodel = 1463, rotx = 82.7929077, roty = 236.4282684, rotz = 123.7814941;
    	case 17: format(str,sizeof(str),"Orange"),dayzmodel = 19574, rotx = 0.0, roty = 0.0, rotz = 0.0;
   		case 18: format(str,sizeof(str),"Flashlight"),dayzmodel = 18641, rotx = 82.7929077, roty = 236.4282684, rotz = 123.7814941;
    	case 19: format(str,sizeof(str),"Rope"),dayzmodel = 19088, rotx = 0.0, roty = 0.0, rotz = 0.0;
	}
	Loot[lootCount][ModelID] = dayzmodel;
	Loot[lootCount][LootName] = str;
	Loot[lootCount][LootRotX] = rotx;
	Loot[lootCount][LootRotY] = roty;
	Loot[lootCount][LootRotZ] = rotz;
	return 1;
}

function DayZSA_LootSetupLow()
{
	new str[64],dayzmodel, Float:rotx, Float:roty, Float:rotz;
	switch(random(25))
	{
	    case 0: format(str,sizeof(str),"Pistol Ammo"),dayzmodel = 3013, rotx = 0.0, roty = 0.0, rotz = 0.0;
	    case 1: format(str,sizeof(str),"Shotgun Ammo"),dayzmodel = 3013, rotx = 0.0, roty = 0.0, rotz = 0.0;
	    case 2: format(str,sizeof(str),"Dirty Pizza Slice"),dayzmodel = 2814, rotx = 0.0, roty = 0.0, rotz = 0.0;
	    case 3: format(str,sizeof(str),"SMG Ammo"),dayzmodel = 3013, rotx = 0.0, roty = 0.0, rotz = 0.0;
	    case 4: format(str,sizeof(str),"Empty Jerry Can"),dayzmodel = 1650, rotx = 0.0, roty = 0.0, rotz = 0.0;
	    case 5: format(str,sizeof(str),"Soda Bottle"),dayzmodel = 2647, rotx = 0.0, roty = 0.0, rotz = 0.0;
	    case 6: format(str,sizeof(str),"Toolbox"),dayzmodel = 3052, rotx = 0.0, roty = 0.0, rotz = 0.0;
	    case 7: format(str,sizeof(str),"Silenced Pistol"),dayzmodel = 347, rotx = 276.0, roty = 90.0, rotz = 90.0;
	    case 8: format(str,sizeof(str),"Pistol"),dayzmodel = 346, rotx = 276.0, roty = 90.0, rotz = 90.0;
		case 9: format(str,sizeof(str),"Burger"),dayzmodel = 2663, rotx = 0.0, roty = 0.0, rotz = 0.0;
		case 10: format(str,sizeof(str),"Full Water Bottle"),dayzmodel = 2683, rotx = 0.0, roty = 0.0, rotz = 0.0;
		case 11: format(str,sizeof(str),"Empty Water Bottle"),dayzmodel = 2683, rotx = 0.0, roty = 0.0, rotz = 0.0;
		case 12: format(str,sizeof(str),"Can of Beans"),dayzmodel = 2769, rotx = 0.0, roty = 0.0, rotz = 0.0;
		case 13: format(str,sizeof(str),"Dirty Pizza Slice"),dayzmodel = 2814, rotx = 0.0, roty = 0.0, rotz = 0.0;
		case 14: format(str,sizeof(str),"Baseball Bat"),dayzmodel = 336, rotx = 82.7929077, roty = 236.4282684, rotz = 123.7814941;
		case 15: format(str,sizeof(str),"Katana"),dayzmodel = 339, rotx = 82.7929077, roty = 236.4282684, rotz = 123.7814941;
		case 16: format(str,sizeof(str),"Heat Pack"),dayzmodel = 2058, rotx = 0.0, roty = 0.0, rotz = 0.0;
		case 17: format(str,sizeof(str),"Whiskey Bottle"),dayzmodel = 2683, rotx = 0.0, roty = 0.0, rotz = 0.0;
		case 18: format(str,sizeof(str),"Lighter"),dayzmodel = 2751, rotx = 0.0, roty = 0.0, rotz = 0.0;
		case 19: format(str,sizeof(str),"Antibiotics"),dayzmodel = 1577, rotx = 0.0, roty = 0.0, rotz = 0.0;
		case 20: format(str,sizeof(str),"Wood"),dayzmodel = 1463, rotx = 82.7929077, roty = 236.4282684, rotz = 123.7814941;
		case 21: format(str,sizeof(str),"Orange"),dayzmodel = 19574, rotx= 0.0 , roty= 0.0, rotz= 0.0;
		case 22: format(str,sizeof(str),"Flashlight"),dayzmodel = 18641, rotx = 82.7929077, roty = 236.4282684, rotz = 123.7814941;
	 	case 23: format(str,sizeof(str),"Dirty Water Bottle"),dayzmodel = 2683, rotx = 0.0, roty = 0.0, rotz = 0.0;
       	case 24: format(str,sizeof(str),"Rope"),dayzmodel = 19088, rotx = 0.0, roty = 0.0, rotz = 0.0;
	}
	Loot[lootCount][ModelID] = dayzmodel;
	Loot[lootCount][LootName] = str;
	Loot[lootCount][LootRotX] = rotx;
	Loot[lootCount][LootRotY] = roty;
	Loot[lootCount][LootRotZ] = rotz;
	return 1;
}

function DayZSA_LootSetupMedium()
{
	new str[64],dayzmodel, Float:rotx, Float:roty, Float:rotz;
	switch(random(35))
	{
	    case 0: format(str,sizeof(str),"MP5"),dayzmodel = 353, rotx = 276.0, roty = 90.0, rotz = 90.0;
	    case 1: format(str,sizeof(str),"Morphine"),dayzmodel = 11736, rotx = 0.0, roty = 0.0, rotz = 0.0;
	    case 2: format(str,sizeof(str),"Bandage"),dayzmodel = 1578, rotx = 0.0, roty = 0.0, rotz = 0.0;
	    case 3: format(str,sizeof(str),"Shotgun"),dayzmodel = 349, rotx = 276.0, roty = 90.0, rotz = 90.0;
	    case 4: format(str,sizeof(str),"Map"),dayzmodel = 3017, rotx = 0.0, roty = 0.0, rotz = 0.0;
	    case 5: format(str,sizeof(str),"GPS"),dayzmodel = 19042, rotx = 0.0, roty = 0.0, rotz = 0.0;
		case 6: format(str,sizeof(str),"Milk"),dayzmodel = 2856, rotx = 0.0, roty = 0.0, rotz = 0.0;
		case 7: format(str,sizeof(str),"Can of Beans"),dayzmodel = 2769, rotx = 0.0, roty = 0.0, rotz = 0.0;
		case 8: format(str,sizeof(str),"Tire"),dayzmodel = 1025, rotx = 0.0, roty = 0.0, rotz = 0.0;
		case 9: format(str,sizeof(str),"Blood Bag"),dayzmodel = 1575, rotx = 0.0, roty = 0.0, rotz = 0.0;
		case 10: format(str,sizeof(str),"Country Rifle"),dayzmodel = 357, rotx = 276.0, roty = 90.0, rotz = 90.0;
		case 11: format(str,sizeof(str),"SPAZ-12 Shotgun"),dayzmodel = 351, rotx = 276.0, roty = 90.0, rotz = 90.0;
		case 12: format(str,sizeof(str),"Czech Vest Pouch"),dayzmodel = 371, rotx = 274.0, roty = 180.0, rotz = 180.0;
		case 13: format(str,sizeof(str),"Army Skin"),dayzmodel = 19106, rotx = 82.7929077, roty = 236.4282684, rotz = 123.7814941;
		case 14: format(str,sizeof(str),"Road Flare"),dayzmodel = 1904, rotx = 0.0, roty = 0.0, rotz = 0.0;
		case 15: format(str,sizeof(str),"Burger"),dayzmodel = 2663, rotx = 0.0, roty = 0.0, rotz = 0.0;
		case 16: format(str,sizeof(str),"Full Water Bottle"),dayzmodel = 2683, rotx = 0.0, roty = 0.0, rotz = 0.0;
		case 17: format(str,sizeof(str),"Can of Beans"),dayzmodel = 2769, rotx = 0.0, roty = 0.0, rotz = 0.0;
		case 18: format(str,sizeof(str),"Dirty Pizza Slice"),dayzmodel = 2814, rotx = 0.0, roty = 0.0, rotz = 0.0;
		case 19: format(str,sizeof(str),"Radio Device"),dayzmodel = 330, rotx = 82.7929077, roty = 236.4282684, rotz = 123.7814941;
		case 20: format(str,sizeof(str),"Civilian Skin"),dayzmodel = 1275, rotx = 272.828125, roty = 134.98297119141, rotz = 135.01782226563;
		case 21: format(str,sizeof(str),"Binoculars"),dayzmodel = 3070, rotx = 0.0, roty = 0.0, rotz = 0.0;
		case 22: format(str,sizeof(str),"Antibiotics"),dayzmodel = 1577, rotx = 0.0, roty = 0.0, rotz = 0.0;
		case 23: format(str,sizeof(str),"Heat Pack"),dayzmodel = 2058, rotx = 0.0, roty = 0.0, rotz = 0.0;
		case 24: format(str,sizeof(str),"Sniper Rifle"),dayzmodel = 358, rotx = 82.7929077, roty = 236.4282684, rotz = 123.7814941;
		case 25: format(str,sizeof(str),"Orange"),dayzmodel = 19574, rotx= 0.0 , roty= 0.0, rotz= 0.0;
		case 26: format(str,sizeof(str),"Apple"),dayzmodel = 19576, rotx= 0.0 , roty= 0.0, rotz= 0.0;
		case 27: format(str,sizeof(str),"Tomato"),dayzmodel = 19577, rotx= 0.0 , roty= 0.0, rotz= 0.0;
		case 28: format(str,sizeof(str),"Banana"),dayzmodel = 19578, rotx= 0.0 , roty= 0.0, rotz= 0.0;
		case 29: format(str,sizeof(str),"Packet Of Cereals"),dayzmodel = 19561, rotx= 0.0 , roty= 0.0, rotz= 0.0;
		case 30: format(str,sizeof(str),"Fresh Juice"),dayzmodel = 19563, rotx= 0.0 , roty= 0.0, rotz= 0.0;
		case 31: format(str,sizeof(str),"Gin"),dayzmodel = 19823, rotx= 0.0 , roty= 0.0, rotz= 0.0;
		case 32: format(str,sizeof(str),"Rum"),dayzmodel = 1512, rotx= 0.0 , roty= 0.0, rotz= 0.0;
 		case 33: format(str,sizeof(str),"Dirty Water Bottle"),dayzmodel = 2683, rotx = 0.0, roty = 0.0, rotz = 0.0;
    	case 34: format(str,sizeof(str),"Rope"),dayzmodel = 19088, rotx = 0.0, roty = 0.0, rotz = 0.0;
	}
	Loot[lootCount][ModelID] = dayzmodel;
	Loot[lootCount][LootName] = str;
	Loot[lootCount][LootRotX] = rotx;
	Loot[lootCount][LootRotY] = roty;
	Loot[lootCount][LootRotZ] = rotz;
	return 1;
}

function DayZSA_LootSetupHigh()
{
	new str[64],dayzmodel, Float:rotx, Float:roty, Float:rotz;
	switch(random(12))
	{
	    case 0: format(str,sizeof(str),"AK-47"),dayzmodel = 355, rotx = 276.0, roty = 90.0, rotz = 90.0;
	    case 1: format(str,sizeof(str),"Sniper Rifle"),dayzmodel = 358, rotx = 276.0, roty = 90.0, rotz = 90.0;
	    case 2: format(str,sizeof(str),"Medical Kit"),dayzmodel = 11738, rotx = 0.0, roty = 0.0, rotz = 0.0;
	    case 3: format(str,sizeof(str),"Engine"),dayzmodel = 2891, rotx = 0.0, roty = 0.0, rotz = 0.0;
	    case 4: format(str,sizeof(str),"Alice Pack"),dayzmodel = 1310, rotx = 271.99987792969, roty = 270.00048828125, rotz = 270.00036621094;
	    case 5: format(str,sizeof(str),"Coyote Backpack"),dayzmodel = 1550, rotx = 79.237274169922, roty = 68.415649414063, rotz = 107.93438720703;
	    case 6: format(str,sizeof(str),"Tent"),dayzmodel = 1279, rotx = 0.0, roty = 0.0, rotz = 0.0;
	    case 7: format(str,sizeof(str),"Radio Device"),dayzmodel = 330, rotx = 0.0, roty = 0.0, rotz = 0.0;
	    case 8: format(str,sizeof(str),"Sniper Skin"),dayzmodel = 1275, rotx = 82.7929077, roty = 236.4282684, rotz = 123.7814941;
	    case 9: format(str,sizeof(str),"Antibiotics"),dayzmodel = 1577, rotx = 0.0, roty = 0.0, rotz = 0.0;
	    case 10: format(str,sizeof(str),"Heat Pack"),dayzmodel = 2058, rotx = 0.0, roty = 0.0, rotz = 0.0;
       	case 11: format(str,sizeof(str),"Rope"),dayzmodel = 19088, rotx = 0.0, roty = 0.0, rotz = 0.0;
	}
	Loot[lootCount][ModelID] = dayzmodel;
	Loot[lootCount][LootName] = str;
	Loot[lootCount][LootRotX] = rotx;
	Loot[lootCount][LootRotY] = roty;
	Loot[lootCount][LootRotZ] = rotz;
	return 1;
}

function DayZSA_LootSetupMilitary()
{
	new str[64],dayzmodel, Float:rotx, Float:roty, Float:rotz;
	switch(random(24))
	{
	    case 0: format(str,sizeof(str),"AK-47"),dayzmodel = 355, rotx = 82.7929077, roty = 236.4282684, rotz = 123.7814941;
	    case 1: format(str,sizeof(str),"M4"),dayzmodel = 356, rotx = 82.7929077, roty = 236.4282684, rotz = 123.7814941;
	    case 2: format(str,sizeof(str),"Sniper Rifle"),dayzmodel = 358, rotx = 82.7929077, roty = 236.4282684, rotz = 123.7814941;
	    case 3: format(str,sizeof(str),"Sniper Ammo"),dayzmodel = 3013, rotx = 0.0, roty = 0.0, rotz = 0.0;
	    case 4: format(str,sizeof(str),"Engine"),dayzmodel = 2891, rotx = 0.0, roty = 0.0, rotz = 0.0;
	    case 5: format(str,sizeof(str),"Alice Pack"),dayzmodel = 1310, rotx = 271.99987792969, roty = 270.00048828125, rotz = 270.00036621094;
	    case 6: format(str,sizeof(str),"Coyote Backpack"),dayzmodel = 1550, rotx = 79.237274169922, roty = 68.415649414063, rotz = 107.93438720703;
	    case 7: format(str,sizeof(str),"Tent"),dayzmodel = 1279, rotx = 0.0, roty = 0.0, rotz = 0.0;
	    case 8: format(str,sizeof(str),"Radio Device"),dayzmodel = 330, rotx = 0.0, roty = 0.0, rotz = 0.0;
	    case 9: format(str,sizeof(str),"Sniper Skin"),dayzmodel = 1275, rotx = 82.7929077, roty = 236.4282684, rotz = 123.7814941;
	    case 10: format(str,sizeof(str),"Army Skin"),dayzmodel = 1275, rotx = 82.7929077, roty = 236.4282684, rotz = 123.7814941;
	    case 11: format(str,sizeof(str),"Assault Ammo"),dayzmodel = 3013, rotx = 0.0, roty = 0.0, rotz = 0.0;
	    case 12: format(str,sizeof(str),"Tire"),dayzmodel = 1025, rotx = 0.0, roty = 0.0, rotz = 0.0;
	    case 13: format(str,sizeof(str),"Toolbox"),dayzmodel = 3052, rotx = 0.0, roty = 0.0, rotz = 0.0;
	    case 14: format(str,sizeof(str),"Pistol Ammo"),dayzmodel = 3013, rotx = 0.0, roty = 0.0, rotz = 0.0;
	    case 15: format(str,sizeof(str),"Shotgun Ammo"),dayzmodel = 3013, rotx = 0.0, roty = 0.0, rotz = 0.0;
	    case 16: format(str,sizeof(str),"Assault Ammo"),dayzmodel = 3013, rotx = 0.0, roty = 0.0, rotz = 0.0;
	    case 17: format(str,sizeof(str),"Sniper Ammo"),dayzmodel = 3013, rotx = 0.0, roty = 0.0, rotz = 0.0;
	    case 18: format(str,sizeof(str),"Dirty Pizza Slice"),dayzmodel = 2814, rotx = 0.0, roty = 0.0, rotz = 0.0;
	    case 19: format(str,sizeof(str),"SMG Ammo"),dayzmodel = 3013, rotx = 0.0, roty = 0.0, rotz = 0.0;
	    case 20: format(str,sizeof(str),"Full Jerry Can"),dayzmodel = 1650, rotx = 0.0, roty = 0.0, rotz = 0.0;
	    case 21: format(str,sizeof(str),"Shotgun"),dayzmodel = 349, rotx = 82.7929077, roty = 236.4282684, rotz = 123.7814941;
      	case 22: format(str,sizeof(str),"Flashlight"),dayzmodel = 18641, rotx = 82.7929077, roty = 236.4282684, rotz = 123.7814941;
     	case 23: format(str,sizeof(str),"Rope"),dayzmodel = 19088, rotx = 0.0, roty = 0.0, rotz = 0.0;
	}
	Loot[lootCount][ModelID] = dayzmodel;
	Loot[lootCount][LootName] = str;
	Loot[lootCount][LootRotX] = rotx;
	Loot[lootCount][LootRotY] = roty;
	Loot[lootCount][LootRotZ] = rotz;
	return 1;
}

function DayZSA_CreateVehicleStorage()
{
	new str[128],strV[64];
    new Float:x, Float:y, Float:z;
    format(strV,sizeof(strV),"Empty Slot");
    for(new i = 0; i < MAX_VEHICLES; i++)
    {
        GetVehiclePos(i, x, y, z);
        vInfo[i][vX] = x;
        vInfo[i][vY] = y;
        vInfo[i][vZ] = z;
        vInfo[i][vSlot1] = strV;
        vInfo[i][vSlot2] = strV;
        vInfo[i][vSlot3] = strV;
        vInfo[i][vSlot4] = strV;
        vInfo[i][vSlot5] = strV;
        vInfo[i][vSlot6] = strV;

        new vID = GetVehicleModel(i);

        // BELOW = 1 SLOTS
        if(vID == 510 || vID == 509 || vID == 473 || vID == 471 || vID == 531)
        {
            vInfo[i][vehicleSlots] = 1;
		}

        // BELOW = 4 SLOTS
        if(vID == 453 || vID == 484 || vID == 511 || vID == 417 || vID == 445 || vID == 554 || vID == 542 || vID == 470 || vID == 422)
        {
            vInfo[i][vehicleSlots] = 4;
		}

        // BELOW = 2 SLOTS
        if(vID == 487 || vID == 468 || vID == 500 || vID == 604)
		{
            vInfo[i][vehicleSlots] = 2;
		}

		// BELOW = 6 SLOTS
		if(vID == 471 || vID == 455 || vID == 433 || vID == 418)
		{
            vInfo[i][vehicleSlots] = 6;
		}

		format(str,sizeof(str),""COL_GREEN"GEAR\n"COL_GREY" Press LEFT ALT to view vehicle gear!");
        vInfo[i][vehicleText] = CreateDynamic3DTextLabel(str, -1, x, y, z, 8.0,INVALID_PLAYER_ID, i,1,-1,-1, -1, 8.0);
       	new panelss, doorss, lightss, tiress;
		GetVehicleDamageStatus(i, panelss, doorss, lightss, tiress);
		UpdateVehicleDamageStatus(i, 5, 7, 4, 8);
		switch(random(4))
		{
			case 0: SetVehicleHealth(i,480.0), vInfo[i][vehicleFuel] = random(21), vInfo[i][vehicleEngine] = random(1), vInfo[i][vehicleTires] = random(4);
			case 1: SetVehicleHealth(i,800.0), vInfo[i][vehicleFuel] = random(21), vInfo[i][vehicleEngine] = random(1), vInfo[i][vehicleTires] = random(4);
			case 2: SetVehicleHealth(i,580.0), vInfo[i][vehicleFuel] = random(21), vInfo[i][vehicleEngine] = random(1), vInfo[i][vehicleTires] = random(4);
			case 3: SetVehicleHealth(i,400.0), vInfo[i][vehicleFuel] = random(21), vInfo[i][vehicleEngine] = random(1), vInfo[i][vehicleTires] = random(4);
		}

		if(GetVehicleModel(i) == 510 || GetVehicleModel(i) == 473)
		{
		    vInfo[i][vehicleFuel] = 99999999999999999999999999999999999999999999;
		    vInfo[i][vehicleEngine] = 1;
		    vInfo[i][vehicleTires] = 4;
		}
	}
	return 1;
}

function DayZSA_CreateHospital(Float:pXX,Float:pYX,Float:pZX)
{
	new strt[128],slot1[64],slot2[64],slot3[64],slot4[64],slot5[64],slot6[64];
	lootCount += 1;

	format(slot1,sizeof(slot1),"1\tMedical Kit");
    Loot[lootCount][HosSlot1] = slot1;
   	format(slot2,sizeof(slot2),"1\tMorphine");
    Loot[lootCount][HosSlot2] = slot2;
   	format(slot3,sizeof(slot3),"1\tBandage");
    Loot[lootCount][HosSlot3] = slot3;
   	format(slot4,sizeof(slot4),"1\tPainkiller");
    Loot[lootCount][HosSlot4] = slot4;
   	format(slot5,sizeof(slot5),"1\tBlood Bag");
    Loot[lootCount][HosSlot5] = slot5;
   	format(slot6,sizeof(slot6),"1\tAntibiotics");
    Loot[lootCount][HosSlot6] = slot6;

    Loot[lootCount][xHos] = pXX;
    Loot[lootCount][yHos] = pYX;
    Loot[lootCount][zHos] = pZX;

   	Loot[lootCount][HospitalID] = CreateDynamicObject(1685/*DayZSA_SelectObj()*/,pXX+0.3,pYX+float(1),pZX-0.7,0.0,0.0,0.0,-1,-1,-1,1000.0);
	format(strt,sizeof(strt),""COL_GREEN"GEAR\n"COL_GREY"Press LEFT ALT to view hospital crate");
    CreateDynamic3DTextLabel(strt,-1,pXX+0.3,pYX+float(1),pZX-0.7,8.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1,-1,-1,-1, 8.0);

    return 1;
}


function DayZSA_CreateAirdrop(Float:pXX,Float:pYX,Float:pZX)
{
	new strt[128],slot1[64],slot2[64],slot3[64],slot4[64],slot5[64],slot6[64],slot7[064],slot8[64],slot9[64],slot10[64],slot11[64],slot12[64];
	lootCount += 1;

	format(slot1,sizeof(slot1),"1\tMedical Kit");
    Loot[lootCount][AirSlot1] = slot1;
   	format(slot2,sizeof(slot2),"1\tMorphine");
    Loot[lootCount][AirSlot2] = slot2;
   	format(slot3,sizeof(slot3),"1\tM4");
    Loot[lootCount][AirSlot3] = slot3;
   	format(slot4,sizeof(slot4),"1\tSniper Rifle");
    Loot[lootCount][AirSlot4] = slot4;
   	format(slot5,sizeof(slot5),"1\tAssault Ammo");
    Loot[lootCount][AirSlot5] = slot5;
   	format(slot6,sizeof(slot6),"1\tAssault Ammo");
    Loot[lootCount][AirSlot6] = slot6;
   	format(slot7,sizeof(slot7),"1\tSniper Ammo");
    Loot[lootCount][AirSlot7] = slot7;
   	format(slot8,sizeof(slot8),"1\tSniper Ammo");
    Loot[lootCount][AirSlot8] = slot8;
   	format(slot9,sizeof(slot9),"1\tFull Water Bottle");
    Loot[lootCount][AirSlot9] = slot9;
   	format(slot10,sizeof(slot10),"1\tApple");
    Loot[lootCount][AirSlot10] = slot10;
   	format(slot11,sizeof(slot11),"1\tBlood Bag");
    Loot[lootCount][AirSlot11] = slot11;
   	format(slot12,sizeof(slot12),"1\tTent");
    Loot[lootCount][AirSlot12] = slot12;

    Loot[lootCount][xAir] = pXX;
    Loot[lootCount][yAir] = pYX;
    Loot[lootCount][zAir] = pZX;

   	Loot[lootCount][AirID] = CreateDynamicObject(3800/*DayZSA_SelectObj()*/,pXX+0.3,pYX+float(1),pZX-0.7,0.0,0.0,0.0,-1,-1,-1,1000.0);
   	SetDynamicObjectMaterial(Loot[lootCount][AirID], 0, 16322, "a51_stores", "metpat64chev_128", 0x00000000);
	//SetDynamicObjectMaterialText(Loot[lootCount][AirID],0, "MILITARY CRATE", OBJECT_MATERIAL_SIZE_256x128,"Arial", 28, 0, 0xFFFF8200, 0xFF000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	//SetDynamicObjectMaterialText(Loot[lootCount][AirID], 0, "Military Crate", 100, "Ariel", 199, 1, 0x00000000, 0x00000000, 1);
	
	format(strt,sizeof(strt),""COL_GREEN"GEAR\n"COL_GREY"Press LEFT ALT to view airdrop crate");
    CreateDynamic3DTextLabel(strt,-1,pXX+0.3,pYX+float(1),pZX-0.7,8.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1,-1,-1,-1, 8.0);

    return 1;
}


function DayZSA_CreateCampFire(playerid)
{
	new strt[128];
	campCount += 1;

	// 841 Wood
	// 18688 Fire

	static Float:px, Float:py, Float:pz, Float:pa;

	GetPlayerPos(playerid, px, py, pz);
	GetPlayerFacingAngle(playerid, pa);

	px += floatsin ( -pa,  degrees) * 1.5;
	py += floatcos ( -pa,  degrees) * 1.5;

	CampFire[campCount][xTent] = px;
	CampFire[campCount][yTent] = py;
	CampFire[campCount][zTent] = pz;

	CreateDynamicObject(18688, px, py, pz-1.47, 0.0, 0.0, 0.0, -1, -1, -1, 1000.0);
	CreateDynamicObject(19632, px, py, pz-0.7, 0.0, 0.0, 0.0, -1, -1, -1, 1000.0);
	format(strt,sizeof(strt),""COL_GREEN"GEAR\n"COL_GREY"Press LEFT ALT to cook meat!");
	CampFire[campCount][tentText] = CreateDynamic3DTextLabel(strt,-1,px,py,pz,8.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1,-1,-1,-1, 8.0);
	SendClientMessage(playerid, -1, ""chat" You have sucessfully created a camp fire!");
	RemoveSlotToInventory(playerid,"Wood",1);
	RemoveSlotToInventory(playerid,"Lighter",1);
	return 1;
}

function DayZSA_CreateTent(playerid)
{
	new strt[128],reset[64];
	tentCount += 1;
	format(reset,sizeof(reset),"Empty Slot");
	new Float:pXX,Float:pYX,Float:pZX;
 	GetPlayerPos(playerid,pXX,pYX,pZX);
	GetXYInFrontOfPlayer(playerid,pXX,pYX, 3.8);
	Tent[tentCount][xTent] = pXX;
	Tent[tentCount][yTent] = pYX;
	Tent[tentCount][zTent] = pZX;
	Tent[tentCount][tentSlot1] = reset;
	Tent[tentCount][tentSlot2] = reset;
	Tent[tentCount][tentSlot3] = reset;
	Tent[tentCount][tentSlot4] = reset;
	Tent[tentCount][tentSlot5] = reset;
	Tent[tentCount][tentSlot6] = reset;
	Tent[tentCount][tentSlot7] = reset;
	Tent[tentCount][tentSlot8] = reset;
	Tent[tentCount][tentSlot9] = reset;
	Tent[tentCount][tentSlot10] = reset;
	Tent[tentCount][tentSlot11] = reset;
	Tent[tentCount][tentSlot12] = reset;
	Tent[tentCount][tentSlot13] = reset;
	Tent[tentCount][tentSlot14] = reset;
	Tent[tentCount][tentSlot15] = reset;
	Tent[tentCount][tentSlot16] = reset;

	pInfo[playerid][pTentCreated] = 1;

	Tent[tentCount][TentID] = CreateDynamicObject(1336,pXX,pYX,pZX,0.0,0.0,0.0,-1,-1,-1,1000.0);
	SetDynamicObjectMaterial(Tent[tentCount][TentID],0, 2068, "cj_ammo_net", "CJ_cammonet", 0);
	format(strt,sizeof(strt),""COL_GREEN"GEAR\n"COL_GREY"Press LEFT ALT to view tent!\nPress N to Destroy it!");
	Tent[tentCount][tentText] = CreateDynamic3DTextLabel(strt,-1,pXX,pYX,pZX,8.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1,-1,-1,-1, 8.0);
	return 1;
}

function DayZSA_CreateLootsDeadBody(playerid,Float:pXX,Float:pYX,Float:pZX)
{
	lootCount += 1;

	Loot[lootCount][zLootDeadBodyX] = pXX;
	Loot[lootCount][zLootDeadBodyY] = pYX;
	Loot[lootCount][zLootDeadBodyZ] = pZX;

    if(PlayerHasItem(playerid, "Binoculars")) DayZSA_CreateLootsFunction("Binoculars",pXX+random(2),pYX+random(4),pZX);
    if(PlayerHasItem(playerid, "Road Flare")) DayZSA_CreateLootsFunction("Road Flare",pXX+random(2),pYX+random(4),pZX);
    if(PlayerHasItem(playerid, "Map")) DayZSA_CreateLootsFunction("Map",pXX+random(2),pYX+random(2),pZX);
	if(PlayerHasItem(playerid, "GPS")) DayZSA_CreateLootsFunction("GPS",pXX+random(2),pYX+random(7),pZX);
	if(PlayerHasItem(playerid, "Sniper Skin")) DayZSA_CreateLootsFunction("Sniper Skin",pXX+random(2),pYX+random(4),pZX);
	if(PlayerHasItem(playerid, "Civilian Skin")) DayZSA_CreateLootsFunction("Civilian Skin",pXX+random(2),pYX+random(4),pZX);
	if(PlayerHasItem(playerid, "Army Skin")) DayZSA_CreateLootsFunction("Army Skin",pXX+random(2),pYX+random(4),pZX);
	if(PlayerHasItem(playerid, "Tent")) DayZSA_CreateLootsFunction("Tent",pXX+random(2),pYX+random(4),pZX);
	if(PlayerHasItem(playerid, "Radio Device")) DayZSA_CreateLootsFunction("Radio Device",pXX+random(2),pYX+random(5),pZX);
	if(PlayerHasItem(playerid, "Bandage")) DayZSA_CreateLootsFunction("Bandage",pXX+random(2),pYX+random(4),pZX);
	if(PlayerHasItem(playerid, "Painkiller")) DayZSA_CreateLootsFunction("Painkiller",pXX+random(2),pYX+random(4),pZX);
	if(PlayerHasItem(playerid, "Morphine")) DayZSA_CreateLootsFunction("Morphine",pXX+random(2),pYX+random(4),pZX);
	if(PlayerHasItem(playerid, "Medical Kit")) DayZSA_CreateLootsFunction("Medical Kit",pXX+random(2),pYX+random(4),pZX);
	if(PlayerHasItem(playerid, "Blood Bag")) DayZSA_CreateLootsFunction("Blood Bag",pXX+random(2),pYX+random(4),pZX);
	if(PlayerHasItem(playerid, "Can of Beans")) DayZSA_CreateLootsFunction("Can of Beans",pXX+random(2),pYX+random(4),pZX);
	if(PlayerHasItem(playerid, "Burger")) DayZSA_CreateLootsFunction("Burger",pXX+random(2),pYX+random(4),pZX);
	if(PlayerHasItem(playerid, "Dirty Pizza Slice")) DayZSA_CreateLootsFunction("Dirty Pizza Slice",pXX+random(2),pYX+random(4),pZX);
	if(PlayerHasItem(playerid, "Orange")) DayZSA_CreateLootsFunction("Orange",pXX+random(2),pYX+random(4),pZX);
	if(PlayerHasItem(playerid, "Rum")) DayZSA_CreateLootsFunction("Rum",pXX+random(2),pYX+random(4),pZX);
	if(PlayerHasItem(playerid, "Gin")) DayZSA_CreateLootsFunction("Gin",pXX+random(2),pYX+random(4),pZX);
	if(PlayerHasItem(playerid, "Apple")) DayZSA_CreateLootsFunction("Apple",pXX+random(2),pYX+random(4),pZX);
	if(PlayerHasItem(playerid, "Packet Of Cereals")) DayZSA_CreateLootsFunction("Packet Of Cereals",pXX+random(2),pYX+random(4),pZX);
	if(PlayerHasItem(playerid, "Tomato")) DayZSA_CreateLootsFunction("Tomato",pXX+random(2),pYX+random(4),pZX);
	if(PlayerHasItem(playerid, "Banana")) DayZSA_CreateLootsFunction("Banana",pXX+random(2),pYX+random(4),pZX);
	if(PlayerHasItem(playerid, "Fresh Juice")) DayZSA_CreateLootsFunction("Fresh Juice",pXX+random(2),pYX+random(4),pZX);
	if(PlayerHasItem(playerid, "Full Water Bottle")) DayZSA_CreateLootsFunction("Full Water Bottle",pXX+random(2),pYX+random(8),pZX);
	if(PlayerHasItem(playerid, "Milk")) DayZSA_CreateLootsFunction("Milk",pXX+random(2),pYX+random(5),pZX);
	if(PlayerHasItem(playerid, "Soda Bottle")) DayZSA_CreateLootsFunction("Soda Bottle",pXX+random(2),pYX+random(4),pZX);
	if(PlayerHasItem(playerid, "Tire")) DayZSA_CreateLootsFunction("Tire",pXX+random(2),pYX+random(4),pZX);
	if(PlayerHasItem(playerid, "Empty Jerry Can")) DayZSA_CreateLootsFunction("Empty Jerry Can",pXX+random(2),pYX+random(4),pZX);
	if(PlayerHasItem(playerid, "Full Jerry Can")) DayZSA_CreateLootsFunction("Full Jerry Can",pXX+random(1),pYX+random(8),pZX);
	if(PlayerHasItem(playerid, "Engine")) DayZSA_CreateLootsFunction("Engine",pXX+random(2),pYX+random(4),pZX);
	if(PlayerHasItem(playerid, "Toolbox")) DayZSA_CreateLootsFunction("Toolbox",pXX+random(2),pYX+random(4),pZX);
	if(PlayerHasItem(playerid, "AK-47")) DayZSA_CreateLootsFunction("AK-47",pXX+random(2),pYX+random(4),pZX);
	if(PlayerHasItem(playerid, "M4")) DayZSA_CreateLootsFunction("M4",pXX+random(2),pYX+random(4),pZX);
	if(PlayerHasItem(playerid, "Silenced Pistol")) DayZSA_CreateLootsFunction("Silenced Pistol",pXX+random(2),pYX+random(4),pZX);
	if(PlayerHasItem(playerid, "Pistol")) DayZSA_CreateLootsFunction("Pistol",pXX+random(2),pYX+random(4),pZX);
	if(PlayerHasItem(playerid, "Shotgun")) DayZSA_CreateLootsFunction("Shotgun",pXX+random(8),pYX+random(4),pZX);
	if(PlayerHasItem(playerid, "SPAZ-12 Shotgun")) DayZSA_CreateLootsFunction("SPAZ-12 Shotgun",pXX+random(2),pYX+random(1),pZX);
	if(PlayerHasItem(playerid, "Country Rifle")) DayZSA_CreateLootsFunction("Country Rifle",pXX+random(6),pYX+random(8),pZX);
	if(PlayerHasItem(playerid, "Sniper Rifle")) DayZSA_CreateLootsFunction("Sniper Rifle",pXX+random(2),pYX+random(4),pZX);
	if(PlayerHasItem(playerid, "MP5")) DayZSA_CreateLootsFunction("MP5",pXX+random(2),pYX+random(4),pZX);
	if(PlayerHasItem(playerid, "Katana")) DayZSA_CreateLootsFunction("Katana",pXX+random(2),pYX+random(4),pZX);
	if(PlayerHasItem(playerid, "Baseball Bat")) DayZSA_CreateLootsFunction("Baseball Bat",pXX+random(3),pYX+random(4),pZX);
	if(PlayerHasItem(playerid, "Pistol Ammo")) DayZSA_CreateLootsFunction("Pistol Ammo",pXX+random(2),pYX+random(4),pZX);
	if(PlayerHasItem(playerid, "Shotgun Ammo")) DayZSA_CreateLootsFunction("Shotgun Ammo",pXX+random(2),pYX+random(4),pZX);
	if(PlayerHasItem(playerid, "Sniper Ammo")) DayZSA_CreateLootsFunction("Sniper Ammo",pXX+random(2),pYX+random(4),pZX);
	if(PlayerHasItem(playerid, "Assault Ammo")) DayZSA_CreateLootsFunction("Assault Ammo",pXX+random(2),pYX+random(4),pZX);
	if(PlayerHasItem(playerid, "SMG Ammo")) DayZSA_CreateLootsFunction("SMG Ammo",pXX+random(2),pYX+random(4),pZX);
	if(PlayerHasItem(playerid, "Heat Pack")) DayZSA_CreateLootsFunction("Heat Pack",pXX+random(2),pYX+random(4),pZX);
	if(PlayerHasItem(playerid, "Whiskey Bottle")) DayZSA_CreateLootsFunction("Whiskey Bottle",pXX+random(2),pYX+random(4),pZX);
    if(PlayerHasItem(playerid, "Raw Meat")) DayZSA_CreateLootsFunction("Raw Meat",pXX+random(2),pYX+random(4),pZX);
    if(PlayerHasItem(playerid, "Cooked Meat")) DayZSA_CreateLootsFunction("Cooked Meat",pXX+random(2),pYX+random(4),pZX);
    if(PlayerHasItem(playerid, "Wood")) DayZSA_CreateLootsFunction("Wood",pXX+random(2),pYX+random(4),pZX);
    if(PlayerHasItem(playerid, "Lighter")) DayZSA_CreateLootsFunction("Lighter",pXX+random(2),pYX+random(4),pZX);
    if(PlayerHasItem(playerid, "Antibiotics")) DayZSA_CreateLootsFunction("Antibiotics",pXX+random(2),pYX+random(4),pZX);
   	if(PlayerHasItem(playerid, "Dirty Water Bottle")) DayZSA_CreateLootsFunction("Dirty Water Bottle",pXX+random(2),pYX+random(8),pZX);

	if(GetPlayerSkin(playerid) == CIVSKIN) DayZSA_CreateLootsFunction("Civilian Skin",pXX+random(7),pYX+random(3),pZX);
	if(GetPlayerSkin(playerid) == CIV) DayZSA_CreateLootsFunction("Army Skin",pXX+random(7),pYX+random(3),pZX);
	if(GetPlayerSkin(playerid) == SNIP) DayZSA_CreateLootsFunction("Sniper Skin",pXX+random(7),pYX+random(3),pZX);

	if(pInfo[playerid][Backpack] == 0) DayZSA_CreateLootsFunction("Coyote Patrol Pack",pXX+random(8),pYX+random(6),pZX);
	if(pInfo[playerid][Backpack] == 1) DayZSA_CreateLootsFunction("Czech Vest Pouch",pXX+random(2),pYX+random(4),pZX);
	if(pInfo[playerid][Backpack] == 2) DayZSA_CreateLootsFunction("Alice Pack",pXX+random(9),pYX+random(5),pZX);
	if(pInfo[playerid][Backpack] == 3) DayZSA_CreateLootsFunction("Coyote Backpack",pXX+random(6),pYX+random(3),pZX);
	return 1;
}

function DayZSA_CreateLootsFunction(item[],Float:pXX,Float:pYX,Float:pZX)
{
	new strt[128];
	lootCount += 1;
	Loot[lootCount][xLootdrop] = pXX;
	Loot[lootCount][yLootdrop] = pYX;
	Loot[lootCount][zLootdrop] = pZX;
	Loot[lootCount][AntiDup] = 1;
	format(Loot[lootCount][lootDrop], 128, "%s", item);

	DayZSA_LootModelDrop(item);

	Loot[lootCount][LootID] = CreateDynamicObject(Loot[lootCount][dropID],pXX,pYX,pZX-0.9,Loot[lootCount][dLootRotX],Loot[lootCount][dLootRotY],Loot[lootCount][dLootRotZ],-1,-1,-1,1000.0);
	format(strt,sizeof(strt),""COL_GREEN"GEAR\n"COL_GREY"Press LEFT ALT to loot");
    Loot[lootCount][TextID] = CreateDynamic3DTextLabel(strt,-1,pXX,pYX,pZX-0.7,8.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1,-1,-1,-1, 8.0);
	return 1;
}

function DayZSA_DropWeapon(item[], ammo, Float:pXX,Float:pYX,Float:pZX)
{
	new strt[128];
	lootCount += 1;
	Loot[lootCount][DropGunX] = pXX;
	Loot[lootCount][DropGunY] = pYX;
	Loot[lootCount][DropGunZ] = pZX;
	Loot[lootCount][DropGunAmmo] = ammo;
	Loot[lootCount][AntiDup] = 1;
	format(Loot[lootCount][lootDrop], 128, "%s", item);

	DayZSA_LootModelDropWeapon(item);

	Loot[lootCount][LootID] = CreateDynamicObject(Loot[lootCount][DropGunID],pXX,pYX,pZX-0.9,Loot[lootCount][DropGunXR],Loot[lootCount][DropGunYR],Loot[lootCount][DropGunZR],-1,-1,-1,1000.0);
	format(strt,sizeof(strt),""COL_GREEN"WEAPON GEAR\n"COL_GREY"Type /pickupgun");
    Loot[lootCount][TextID] = CreateDynamic3DTextLabel(strt,-1,pXX,pYX,pZX-0.7,8.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1,-1,-1,-1, 8.0);
	return 1;
}

function DayZSA_CreateGroup(playerid,groupname[],owner[])
{
	new str[24],gname[16];
	groupCount += 1;

	format(str,sizeof(str),"%s",owner);
	format(gname,sizeof(gname),"%s",groupname);

	Groups[groupCount][GroupID] = groupCount;
	Groups[groupCount][GroupOwner] = str;
	Groups[groupCount][GroupName] = gname;
	Groups[groupCount][GroupMembers]++;
	pInfo[playerid][IsPlayerInGroup] = 1;
	pInfo[playerid][IsPlayerGroupOwner] = 1;
	pInfo[playerid][IsPlayerInGroupID] = groupCount;

	new stra[256];
	format(stra,sizeof(stra),"*"COL_LGREEN" Player %s(%i) has created a group named %s(%i)",PlayerName(playerid),playerid, groupname, groupCount);
	SendClientMessageToAll(-1,stra);
	return 1;
}

function DayZSA_CreateFarmLoots(Float:pXX,Float:pYX,Float:pZX)
{
	new strt[128];
	lootCount += 1;
	Loot[lootCount][xLoot] = pXX;
	Loot[lootCount][yLoot] = pYX;
	Loot[lootCount][zLoot] = pZX;

    DayZSA_LootSetupFarm();

    Loot[lootCount][AntiDup] = 1;
	Loot[lootCount][LootID] = CreateDynamicObject(Loot[lootCount][ModelID],pXX,pYX,pZX-0.9,Loot[lootCount][LootRotX],Loot[lootCount][LootRotY],Loot[lootCount][LootRotZ],-1,-1,-1,1000.0);
	format(strt,sizeof(strt),""COL_GREEN"GEAR\n"COL_GREY"Press N to loot");
    Loot[lootCount][TextID] = CreateDynamic3DTextLabel(strt,-1,pXX,pYX,pZX-0.9,8.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1,-1,-1,-1, 8.0);
	return 1;
}

function DayZSA_CreateMarketLoots(Float:pXX,Float:pYX,Float:pZX)
{
	new strt[128];
	lootCount += 1;
	Loot[lootCount][xLoot] = pXX;
	Loot[lootCount][yLoot] = pYX;
	Loot[lootCount][zLoot] = pZX;

    DayZSA_LootSetupMarket();

    Loot[lootCount][AntiDup] = 1;
	Loot[lootCount][LootID] = CreateDynamicObject(Loot[lootCount][ModelID],pXX,pYX,pZX-0.9,Loot[lootCount][LootRotX],Loot[lootCount][LootRotY],Loot[lootCount][LootRotZ],-1,-1,-1,1000.0);
	format(strt,sizeof(strt),""COL_GREEN"GEAR\n"COL_GREY"Press N to loot");
    Loot[lootCount][TextID] = CreateDynamic3DTextLabel(strt,-1,pXX,pYX,pZX-0.9,8.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1,-1,-1,-1, 8.0);
	return 1;
}

function DayZSA_CreateMilitaryLoots(Float:pXX,Float:pYX,Float:pZX)
{
	new strt[128];
	lootCount += 1;
	Loot[lootCount][xLoot] = pXX;
	Loot[lootCount][yLoot] = pYX;
	Loot[lootCount][zLoot] = pZX;

    DayZSA_LootSetupMilitary();

    Loot[lootCount][AntiDup] = 1;
	Loot[lootCount][LootID] = CreateDynamicObject(Loot[lootCount][ModelID],pXX,pYX,pZX-0.9,Loot[lootCount][LootRotX],Loot[lootCount][LootRotY],Loot[lootCount][LootRotZ],-1,-1,-1,1000.0);
	format(strt,sizeof(strt),""COL_GREEN"GEAR\n"COL_GREY"Press N to loot");
    Loot[lootCount][TextID] = CreateDynamic3DTextLabel(strt,-1,pXX,pYX,pZX-0.9,8.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1,-1,-1,-1, 8.0);
	return 1;
}

function DayZSA_CreateLoots(Float:pXX,Float:pYX,Float:pZX)
{
	new strt[128];
	lootCount += 1;
	Loot[lootCount][xLoot] = pXX;
	Loot[lootCount][yLoot] = pYX;
	Loot[lootCount][zLoot] = pZX;

	switch(random(16))
	{
		case 0: DayZSA_LootSetupLow();
		case 1: DayZSA_LootSetupMedium();
		case 2: DayZSA_LootSetupHigh();
		case 3: DayZSA_LootSetupLow();
		case 4: DayZSA_LootSetupMedium();
		case 5: DayZSA_LootSetupHigh();
		case 6: DayZSA_LootSetupMedium();
		case 7: DayZSA_LootSetupHigh();
		case 8: DayZSA_LootSetupMedium();
		case 9: DayZSA_LootSetupLow();
		case 10: DayZSA_LootSetupLow();
		case 11: DayZSA_LootSetupMedium();
		case 12: DayZSA_LootSetupMedium();
		case 13: DayZSA_LootSetupLow();
		case 14: DayZSA_LootSetupMedium();
		case 15: DayZSA_LootSetupLow();
	}

    Loot[lootCount][AntiDup] = 1;
	Loot[lootCount][LootID] = CreateDynamicObject(Loot[lootCount][ModelID],pXX,pYX,pZX-0.9,Loot[lootCount][LootRotX],Loot[lootCount][LootRotY],Loot[lootCount][LootRotZ],-1,-1,-1,1000.0);
	format(strt,sizeof(strt),""COL_GREEN"GEAR\n"COL_GREY"Press N to loot");
    Loot[lootCount][TextID] = CreateDynamic3DTextLabel(strt,-1,pXX,pYX,pZX-0.9,8.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1,-1,-1,-1, 8.0);
	return 1;
}

function DayZSA_CreateLootsZombie(item[],Float:pXX,Float:pYX,Float:pZX)
{
	new strt[128];
	lootCount += 1;
	Loot[lootCount][xLootdropZ] = pXX;
	Loot[lootCount][yLootdropZ] = pYX;
	Loot[lootCount][zLootdropZ] = pZX;
	format(Loot[lootCount][lootDrop], 128, "%s", item);

	Loot[lootCount][LootID] = CreateDynamicObject(2907/*DayZSA_SelectObj()*/,pXX+0.3,pYX+float(1),pZX-0.7,0.0,0.0,0.0,-1,-1,-1,1000.0);
	format(strt,sizeof(strt),""COL_GREEN"GEAR\n"COL_GREY"Press N to loot zombie body");
    Loot[lootCount][TextID] = CreateDynamic3DTextLabel(strt,-1,pXX+0.3,pYX+float(1),pZX-0.7,8.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1,-1,-1,-1, 8.0);
	return 1;
}

function DayZSA_RespawnItems()
{
	SendClientMessageToAll(-1, ""chat""COL_RED"*** Server is backing up data this may cause lag for few seconds/minutes.");
	for(new i = 0; i < 20000; i++)
    {
   		DestroyDynamicObject(Loot[i][LootID]);
		DestroyDynamic3DTextLabel(Loot[i][TextID]);
		DestroyDynamicObject(Loot[i][HospitalID]);
		Loot[i][xLoot] = 0.0;
		Loot[i][yLoot] = 0.0;
		Loot[i][zLoot] = 0.0;
		Loot[i][xLootdrop] = 0.0;
		Loot[i][yLootdrop] = 0.0;
		Loot[i][zLootdrop] = 0.0;
		Loot[i][xLootdropZ] = 0.0;
		Loot[i][yLootdropZ] = 0.0;
		Loot[i][zLootdropZ] = 0.0;
		Loot[i][zLootDeadBodyX] = 0.0;
		Loot[i][zLootDeadBodyY] = 0.0;
		Loot[i][zLootDeadBodyZ] = 0.0;
	    Loot[i][xHos] = 0.0;
	    Loot[i][yHos] = 0.0;
	    Loot[i][zHos] = 0.0;
	    Loot[i][xAir] = 0.0;
	    Loot[i][yAir] = 0.0;
	    Loot[i][zAir] = 0.0;

		lootCount = 0;
	}

	DayZSA_CreateAllLoots();
	foreach(Player, i)
	{
		PlayerLabel[i] = CreateDynamic3DTextLabel("" , 0xADFF2FAA, 0.0, 0.0, 0.2, 15.0, i, INVALID_VEHICLE_ID, 1, -1, -1, -1, 100.0);
	}
	return 1;
}

CMD:lootres(playerid)
{
	if(pInfo[playerid][pAdminLevel] >= 6)
	{
		DayZSA_RespawnItems();
	}
	return 1;
}

CMD:tentres(playerid)
{
	if(pInfo[playerid][pAdminLevel] >= 6)
	{
		for(new iv2 = 0; iv2 < 500; iv2++)
	 	{
		    DestroyDynamicObject(Tent[iv2][TentID]);
		    DestroyDynamic3DTextLabel(Tent[iv2][tentText]);
	   		Tent[iv2][xTent] = 0.0;
			Tent[iv2][yTent] = 0.0;
			Tent[iv2][zTent] = 0.0;
			tentCount = 0;
		}
	}
	return 1;
}

function DayZSA_DestroyLoot(id)
{
	DestroyDynamicObject(Loot[id][LootID]);
	DestroyDynamic3DTextLabel(Loot[id][TextID]);
	Loot[id][xLoot] = 0.0;
	Loot[id][yLoot] = 0.0;
	Loot[id][zLoot] = 0.0;
	Loot[id][xLootdrop] = 0.0;
	Loot[id][yLootdrop] = 0.0;
	Loot[id][zLootdrop] = 0.0;
	Loot[id][xLootdropZ] = 0.0;
	Loot[id][yLootdropZ] = 0.0;
	Loot[id][zLootdropZ] = 0.0;
	Loot[id][zLootDeadBodyX] = 0.0;
	Loot[id][zLootDeadBodyY] = 0.0;
	Loot[id][zLootDeadBodyZ] = 0.0;
	return 1;
}

function DayZSA_DestroyLootDroped(id)
{
	DestroyDynamicObject(Loot[id][LootID]);
	DestroyDynamic3DTextLabel(Loot[id][TextID]);
	Loot[id][xLootdrop] = 0.0;
	Loot[id][yLootdrop] = 0.0;
	Loot[id][zLootdrop] = 0.0;
	return 1;
}

function DayZSA_DestroyLootZombie(id)
{
	DestroyDynamic3DTextLabel(Loot[id][TextID]);
	Loot[id][xLootdropZ] = 0.0;
	Loot[id][yLootdropZ] = 0.0;
	Loot[id][zLootdropZ] = 0.0;
	return 1;
}

stock PlayerToPoint(Float:radi, playerid, Float:x, Float:y, Float:z)
{
	if(IsPlayerConnected(playerid))
	{
		new Float:oldposx, Float:oldposy, Float:oldposz;
		new Float:tempposx, Float:tempposy, Float:tempposz;
		GetPlayerPos(playerid, oldposx, oldposy, oldposz);
		tempposx = (oldposx -x);
		tempposy = (oldposy -y);
		tempposz = (oldposz -z);
		if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
		{
			return 1;
		}
	}
	return 0;
}

stock GetVehicleNearID(playerid)
{
	for(new i=0; i<MAX_VEHICLES; i++)
 	{
  		if(IsPlayerInRangeOfPoint(playerid,2.7, vInfo[i][vX],vInfo[i][vY],vInfo[i][vZ]))
    	{
     		return i;
       	}
	}
 	return 0;
}

stock GetHospitalID(playerid)
{
	for(new i=0; i<MAX_LOOTING; i++)
 	{
  		if(IsPlayerInRangeOfPoint(playerid,3.5, Loot[i][xHos],Loot[i][yHos],Loot[i][zHos]))
    	{
     		return i;
       	}
	}
 	return 0;
}

stock GetAirDropID(playerid)
{
	for(new i=0; i<MAX_LOOTING; i++)
 	{
  		if(IsPlayerInRangeOfPoint(playerid,3.5, Loot[i][xAir],Loot[i][yAir],Loot[i][zAir]))
    	{
     		return i;
       	}
	}
 	return 0;
}

stock GetTentID(playerid)
{
	for(new i=0; i<MAX_TENTS; i++)
 	{
  		if(IsPlayerInRangeOfPoint(playerid,3.5, Tent[i][xTent],Tent[i][yTent],Tent[i][zTent]))
    	{
     		return i;
       	}
	}
 	return 0;
}

stock GetCampID(playerid)
{
	for(new i=0; i<MAX_TENTS; i++)
 	{
  		if(IsPlayerInRangeOfPoint(playerid,2.1, CampFire[i][xTent],CampFire[i][yTent],CampFire[i][zTent]))
    	{
     		return i;
       	}
	}
 	return 0;
}

stock GetLootW_ID(playerid)
{
	for(new i=0; i<MAX_LOOTING; i++)
 	{
  		if(IsPlayerInRangeOfPoint(playerid,1.1, Loot[i][DropGunX],Loot[i][DropGunY],Loot[i][DropGunZ]))
    	{
     		return i;
       	}
	}
 	return 0;
}

stock GetLootID(playerid)
{
	for(new i=0; i<MAX_LOOTING; i++)
 	{
  		if(IsPlayerInRangeOfPoint(playerid,1.1, Loot[i][xLoot],Loot[i][yLoot],Loot[i][zLoot]))
    	{
     		return i;
       	}
	}
 	return 0;
}

stock GetLootIDFunction(playerid)
{
	for(new i=0; i<MAX_LOOTING; i++)
 	{
  		if(IsPlayerInRangeOfPoint(playerid,1.1,Loot[i][xLootdrop],Loot[i][yLootdrop],Loot[i][zLootdrop]))
    	{
     		return i;
       	}
	}
 	return 0;
}

stock GetLootIDZombie(playerid)
{
	for(new i=0; i<MAX_LOOTING; i++)
 	{
  		if(IsPlayerInRangeOfPoint(playerid,1.9,Loot[i][xLootdropZ],Loot[i][yLootdropZ],Loot[i][zLootdropZ]))
    	{
     		return i;
       	}
	}
 	return 0;
}

stock GetLootIDPlayer(playerid)
{
	for(new i=0; i<MAX_LOOTING; i++)
 	{
  		if(IsPlayerInRangeOfPoint(playerid,3.7, Loot[i][zLootDeadBodyX],Loot[i][zLootDeadBodyY],Loot[i][zLootDeadBodyZ]))
    	{
     		return i;
       	}
	}
 	return 0;
}

public OnPlayerCommandPerformed(playerid, cmdtext[], success)
{
	if(!success) { SendClientMessage(playerid, -1, ""chat" Command does not exist, to find out the server commnads type in /cmds or /help!"); }
	return 1;
}

function DayZSA_CreateAllLoots()
{
	for(new i; i < sizeof(DayZSA_Loots); i++)
	{
	    DayZSA_CreateLoots(DayZSA_Loots[i][xLoo], DayZSA_Loots[i][yLoo], DayZSA_Loots[i][zLoo]);
	}
	printf("Loaded %i Looting areas!",lootCount);

	for(new i; i < sizeof(DayZSA_Military); i++)
	{
	    DayZSA_CreateMilitaryLoots(DayZSA_Military[i][xLoo], DayZSA_Military[i][yLoo], DayZSA_Military[i][zLoo]);
	}

	for(new i; i < sizeof(DayZSA_Farms); i++)
	{
	    DayZSA_CreateFarmLoots(DayZSA_Farms[i][xLoo], DayZSA_Farms[i][yLoo], DayZSA_Farms[i][zLoo]);
	}

	for(new i; i < sizeof(DayZSA_Market); i++)
	{
		DayZSA_CreateMarketLoots(DayZSA_Market[i][xLoo], DayZSA_Market[i][yLoo], DayZSA_Market[i][zLoo]);
	}

	printf("Loaded 182 military Looting areas!");
    printf("Loaded 986 farm Looting areas!");
    printf("Loaded 434 market Looting areas!");

	DayZSA_CreateHospital(2023.5582,-1405.0769,17.1937);
    DayZSA_CreateHospital(2036.0295,-1404.5823,17.2557);
    DayZSA_CreateHospital(1179.2520,-1327.7645,14.1603);
    DayZSA_CreateHospital(1179.0232,-1319.0414,14.1490);
    DayZSA_CreateHospital(-2668.2903,636.6271,14.4531);
    DayZSA_CreateHospital(-2639.6472,636.2640,14.4531);
    DayZSA_CreateHospital(1615.5638,1817.7030,10.8203);
    DayZSA_CreateHospital(1599.5947,1817.7300,10.8203);
    DayZSA_CreateHospital(-1514.4979,2521.6721,55.8504);
    DayZSA_CreateHospital(-314.7439,1051.8927,20.3403);
    DayZSA_CreateHospital(-325.9240,1051.6086,20.3403);
    DayZSA_CreateHospital(1245.3959,326.4455,19.7555);
	DayZSA_CreateHospital(1238.7815,328.9627,19.7555);
	printf("Loaded 13 Hospitals!!");
	DayZSA_CreateAirdrop(306.42618, 2026.72473, 16.73662);
	DayZSA_CreateAirdrop(2486.3821,-1662.7250,13.3359);
	DayZSA_CreateAirdrop(-1631.7996,1419.6204,7.1875);
	printf("Loaded 3 Military Crates!!");
	return 1;
}


stock GetAdminName(playerid)
{
	new adminname[128];
	switch(pInfo[playerid][pAdminLevel])
	{
		case 0: adminname = "Not Admin";
		case 1: adminname = "Trial Moderator";
		case 2: adminname = "Moderator Team";
		case 3: adminname = "Administrator Team";
		case 4: adminname = "Support Team";
		case 5: adminname = "Management Team";
		case 6: adminname = "Developer Team";
		case 7: adminname = "Community Owner";
	}
	return adminname;
}

stock UpdatePlayer3DName(playerid)
{
	new string[256];
	/*if(pInfo[playerid][pPremium] >= 1)
	{
		format(string,sizeof(string),"%s"COL_WHITE" (%i)\n"COL_LIGHTBLUE"%s",PlayerName(playerid),playerid,GetPremiumName(playerid));
	}*/

	if(pInfo[playerid][IsPlayerInGroup] == 1)
	{
		format(string,sizeof(string),"%s"COL_WHITE" (%i)\nGroup:"COL_LIGHTBLUE" %s",PlayerName(playerid),playerid,GetPlayerGroupName(playerid));
	}

	else
	{
		format(string,sizeof(string),"%s"COL_WHITE" (%i)",PlayerName(playerid),playerid);
	}

	UpdateDynamic3DTextLabelText(PlayerLabel[playerid], 0xADFF2FAA, string);
	return 1;
}

stock CreatePlayer3DName(playerid)
{
	new string[256];
	if(pInfo[playerid][pPremium] >= 1)
	{
		format(string,sizeof(string),"%s"COL_WHITE" (%i)\n"COL_LIGHTBLUE"%s",PlayerName(playerid),playerid,GetPremiumName(playerid));
	}
	else
	{
		format(string,sizeof(string),"%s"COL_WHITE" (%i)",PlayerName(playerid),playerid);
	}
	return 1;
}

stock GetPremiumName(playerid)
{
	new premiumname[128];
	switch(pInfo[playerid][pPremium])
	{
		case 0: premiumname = "Not Premium";
		case 1: premiumname = "Premium Bronze";
		case 2: premiumname = "Premium Silver";
		case 3: premiumname = "Premium Gold";
		case 4: premiumname = "Premium Specialist";
	}
	return premiumname;
}

stock escstring(stri[])
{
	new escstr[200];
	mysql_real_escape_string(stri, escstr);
	return escstr;
}

stock ShowRulesToPlayer(playerid)
{
	new str[600];
	strcat(str,"1. Respect your fellow Players, Administrators, and Moderators.\n2. No offensive language is tolerated either in game\n3. Do not use any third party mod!\n\
	4. Do not argue with any staff members!\n5. Do not duplicate loots!\n6. Use common sense. If you are being an ass you will be treated like one.\n7. No Advertising\n8. Do not bunnyhop\n");
	strcat(str,"9. Do not abuse or exploit any bugs!\n10. No pausing during playing!\n11. Do not spam or flood the chat\n12. Do not C-Bug or any other SA-MP glitches!");
	ShowPlayerDialog(playerid,8618,DIALOG_STYLE_MSGBOX,"DayZ - Rules",str,"I Accept","Deny");
	return 1;
}

stock GlobalResetVars()
{
	ServerLimit[RandomMessage] = 0;
	ServerLimit[TimeCheck] = 0;
	ServerLimit[WeatherCheck] = 0;
	ServerLimit[TentRespawn] = 0;
	return 1;
}

stock CheckPlayerColor(playerid)
{
	if(GetPlayerSkin(playerid) == BANDIT)
	{
	    SetPlayerColor(playerid,COLOR_RED);
	}

	if(GetPlayerSkin(playerid) == HERO)
	{
	    SetPlayerColor(playerid,COLOR_BLUE);
	}

	if(GetPlayerSkin(playerid) == NORMAL)
	{
		SetPlayerColor(playerid,COLOR_WHITE);
	}

	if(GetPlayerSkin(playerid) == FEMALE)
	{
		SetPlayerColor(playerid,COLOR_PINK);
	}

	if(GetPlayerSkin(playerid) == CIV)
	{
		SetPlayerColor(playerid,COLOR_BROWN);
	}

	if(GetPlayerSkin(playerid) == CIVSKIN)
	{
		SetPlayerColor(playerid,0x19197000);
	}

	if(GetPlayerSkin(playerid) == SNIP)
	{
		SetPlayerColor(playerid,0xADFF2F00);
	}
	return 1;
}

stock ChangeTextdrawColor(playerid)
{
	if(pInfo[playerid][Humanity] >= 3000)
	{
 		PlayerTextDrawHide(playerid,playerBandit[playerid]);
	    PlayerTextDrawColor(playerid,playerBandit[playerid], 0x33AA3355);
		PlayerTextDrawShow(playerid,playerBandit[playerid]);
	}

	if(pInfo[playerid][Humanity] == 2500)
	{
 		PlayerTextDrawHide(playerid,playerBandit[playerid]);
	    PlayerTextDrawColor(playerid,playerBandit[playerid], 0xFFFF0055);
		PlayerTextDrawShow(playerid,playerBandit[playerid]);
	}

	if(pInfo[playerid][Humanity] <= 2000)
	{
 		PlayerTextDrawHide(playerid,playerBandit[playerid]);
	    PlayerTextDrawColor(playerid,playerBandit[playerid], 0xAA333355);
		PlayerTextDrawShow(playerid,playerBandit[playerid]);
	}

	if(pInfo[playerid][pTemp] >= 100.0)
	{
		PlayerTextDrawHide(playerid,PlayerTemp[playerid]);
	    PlayerTextDrawColor(playerid,PlayerTemp[playerid], 0x33AA3355);
		PlayerTextDrawShow(playerid,PlayerTemp[playerid]);
	}

	if(pInfo[playerid][pTemp] <= 59.0)
	{
	    PlayerTextDrawHide(playerid,PlayerTemp[playerid]);
	    PlayerTextDrawColor(playerid,PlayerTemp[playerid], 0xFFFF0055);
		PlayerTextDrawShow(playerid,PlayerTemp[playerid]);
	}

	if(pInfo[playerid][pTemp] <= 25.0)
	{
	    PlayerTextDrawHide(playerid,PlayerTemp[playerid]);
	    PlayerTextDrawColor(playerid,PlayerTemp[playerid], 0xFF450055);
		PlayerTextDrawShow(playerid,PlayerTemp[playerid]);
	}

	if(pInfo[playerid][pTemp] <= 10.0)
	{
	    PlayerTextDrawHide(playerid,PlayerTemp[playerid]);
	    PlayerTextDrawColor(playerid,PlayerTemp[playerid], 0xAA333355);
		PlayerTextDrawShow(playerid,PlayerTemp[playerid]);
	}

	if(pInfo[playerid][pBlood] >= 12000)
	{
	    PlayerTextDrawHide(playerid,PlayerBlood[playerid]);
	    PlayerTextDrawColor(playerid,PlayerBlood[playerid], 0x10F44155);
		PlayerTextDrawShow(playerid,PlayerBlood[playerid]);
	}

	if(pInfo[playerid][pBlood] <= 7500)
	{
	    PlayerTextDrawHide(playerid,PlayerBlood[playerid]);
	    PlayerTextDrawColor(playerid,PlayerBlood[playerid], 0x84E34D66);
		PlayerTextDrawShow(playerid,PlayerBlood[playerid]);
	}

	if(pInfo[playerid][pBlood] <= 5000)
	{
	    PlayerTextDrawHide(playerid,PlayerBlood[playerid]);
	    PlayerTextDrawColor(playerid,PlayerBlood[playerid], 0xFFFF0055);
		PlayerTextDrawShow(playerid,PlayerBlood[playerid]);
	}

	if(pInfo[playerid][pBlood] <= 2500)
	{
	    PlayerTextDrawHide(playerid,PlayerBlood[playerid]);
	    PlayerTextDrawColor(playerid,PlayerBlood[playerid], 0xFF450055);
		PlayerTextDrawShow(playerid,PlayerBlood[playerid]);
	}

	if(pInfo[playerid][pBlood] <= 1000)
	{
	    PlayerTextDrawHide(playerid,PlayerBlood[playerid]);
	    PlayerTextDrawColor(playerid,PlayerBlood[playerid], 0xAA333355);
		PlayerTextDrawShow(playerid,PlayerBlood[playerid]);
	}

	if(pInfo[playerid][pHunger] >= 2500)
	{
	    PlayerTextDrawHide(playerid,PlayerHunger[playerid]);
	    PlayerTextDrawColor(playerid,PlayerHunger[playerid], 0x10F44155);
		PlayerTextDrawShow(playerid,PlayerHunger[playerid]);
	}

	if(pInfo[playerid][pHunger] <= 1750)
	{
	    PlayerTextDrawHide(playerid,PlayerHunger[playerid]);
	    PlayerTextDrawColor(playerid,PlayerHunger[playerid], 0x84E34D6);
		PlayerTextDrawShow(playerid,PlayerHunger[playerid]);
	}

	if(pInfo[playerid][pHunger] <= 1200)
	{
	    PlayerTextDrawHide(playerid,PlayerHunger[playerid]);
	    PlayerTextDrawColor(playerid,PlayerHunger[playerid], 0xFFFF0055);
		PlayerTextDrawShow(playerid,PlayerHunger[playerid]);
	}

	if(pInfo[playerid][pHunger] <= 650)
	{
        PlayerTextDrawHide(playerid,PlayerHunger[playerid]);
	    PlayerTextDrawColor(playerid,PlayerHunger[playerid], 0xFF450055);
		PlayerTextDrawShow(playerid,PlayerHunger[playerid]);
	}

	if(pInfo[playerid][pHunger] <= 100)
	{
        PlayerTextDrawHide(playerid,PlayerHunger[playerid]);
	    PlayerTextDrawColor(playerid,PlayerHunger[playerid], 0xAA333355);
		PlayerTextDrawShow(playerid,PlayerHunger[playerid]);
	}

	if(pInfo[playerid][pThrist] >= 1000)
	{
	    PlayerTextDrawHide(playerid,PlayerThirst[playerid]);
	    PlayerTextDrawColor(playerid,PlayerThirst[playerid], 0x10F44155);
		PlayerTextDrawShow(playerid,PlayerThirst[playerid]);
	}

	if(pInfo[playerid][pThrist] <= 700)
	{
	    PlayerTextDrawHide(playerid,PlayerThirst[playerid]);
	    PlayerTextDrawColor(playerid,PlayerThirst[playerid], 0x84E34D66);
		PlayerTextDrawShow(playerid,PlayerThirst[playerid]);
	}

	if(pInfo[playerid][pThrist] <= 450)
	{
	    PlayerTextDrawHide(playerid,PlayerThirst[playerid]);
	    PlayerTextDrawColor(playerid,PlayerThirst[playerid], 0xFFFF0055);
		PlayerTextDrawShow(playerid,PlayerThirst[playerid]);
	}

	if(pInfo[playerid][pThrist] <= 250)
	{
	    PlayerTextDrawHide(playerid,PlayerThirst[playerid]);
	    PlayerTextDrawColor(playerid,PlayerThirst[playerid], 0xFF450055);
		PlayerTextDrawShow(playerid,PlayerThirst[playerid]);
	}

	if(pInfo[playerid][pThrist] <= 100)
	{
		PlayerTextDrawHide(playerid,PlayerThirst[playerid]);
	    PlayerTextDrawColor(playerid,PlayerThirst[playerid], 0xAA333355);
		PlayerTextDrawShow(playerid,PlayerThirst[playerid]);
	}
	return 1;
}

stock IsVehicleOccupied(vehid)
{
    for(new i; i <= MAX_PLAYERS; i++) {
        if(IsPlayerConnected(i)) {
            if(IsPlayerInVehicle(i, vehid)) return 1;
        }
    }
    return 0;
}

stock IsPlayerInZone(playerid, zone[])
{
	new TmpZone[MAX_ZONE_NAME];
	GetPlayer3DZone(playerid, TmpZone, sizeof(TmpZone));
	for(new i = 0; i != sizeof(gSAZones); i++)
	{
		if(strfind(TmpZone, zone, true) != -1)
			return 1;
	}
	return 0;
}

stock GetPlayer2DZone(playerid, zone[], len)
{
	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x, y, z);
 	for(new i = 0; i != sizeof(gSAZones); i++ )
 	{
		if(x >= gSAZones[i][SAZONE_AREA][0] && x <= gSAZones[i][SAZONE_AREA][3] && y >= gSAZones[i][SAZONE_AREA][1] && y <= gSAZones[i][SAZONE_AREA][4])
		{
		    return format(zone, len, gSAZones[i][SAZONE_NAME], 0);
		}
	}
	return 0;
}

stock GetPlayer3DZone(playerid, zone[], len)
{
	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x, y, z);
 	for(new i = 0; i != sizeof(gSAZones); i++ )
 	{
		if(x >= gSAZones[i][SAZONE_AREA][0] && x <= gSAZones[i][SAZONE_AREA][3] && y >= gSAZones[i][SAZONE_AREA][1] && y <= gSAZones[i][SAZONE_AREA][4] && z >= gSAZones[i][SAZONE_AREA][2] && z <= gSAZones[i][SAZONE_AREA][5])
		{
		    return format(zone, len, gSAZones[i][SAZONE_NAME], 0);
		}
	}
	return 0;
}

stock GetWeaponModel(weaponid)
{
	switch(weaponid)
	{
	    case 1:
	        return 331;

		case 2..8:
		    return weaponid+331;

        case 9:
		    return 341;

		case 10..15:
			return weaponid+311;

		case 16..18:
		    return weaponid+326;

		case 22..29:
		    return weaponid+324;

		case 30,31:
		    return weaponid+325;

		case 32:
		    return 372;

		case 33..45:
		    return weaponid+324;

		case 46:
		    return 371;
	}
	return 0;
}

function DayZSA_LootModelDropWeapon(objectname[])
{
	new dayzsaid, Float:rotx, Float:roty, Float:rotz;
    if(strfind(objectname, "Binoculars", true) != -1) dayzsaid = 3070, rotx = 0.0, roty = 0.0, rotz = 0.0;
	if(strfind(objectname, "AK-47", true) != -1) dayzsaid = 355, rotx = 276.0, roty = 90.0, rotz = 90.0;
	if(strfind(objectname, "M4", true) != -1) dayzsaid = 356, rotx = 276.0, roty = 90.0, rotz = 90.0;
	if(strfind(objectname, "Silenced Pistol", true) != -1) dayzsaid =  347, rotx = 276.0, roty = 90.0, rotz = 90.0;
	if(strfind(objectname, "Pistol", true) != -1) dayzsaid = 346, rotx = 276.0, roty = 90.0, rotz = 90.0;
	if(strfind(objectname, "Shotgun", true) != -1) dayzsaid = 349, rotx = 276.0, roty = 90.0, rotz = 90.0;
	if(strfind(objectname, "SPAZ-12 Shotgun", true) != -1) dayzsaid = 351, rotx = 276.0, roty = 90.0, rotz = 90.0;
	if(strfind(objectname, "Country Rifle", true) != -1) dayzsaid = 357, rotx = 276.0, roty = 90.0, rotz = 90.0;
	if(strfind(objectname, "Sniper Rifle", true) != -1) dayzsaid = 358, rotx = 276.0, roty = 90.0, rotz = 90.0;
	if(strfind(objectname, "MP5", true) != -1) dayzsaid = 353, rotx = 276.0, roty = 90.0, rotz = 90.0;
	if(strfind(objectname, "Katana", true) != -1) dayzsaid = 339, rotx = 276.0, roty = 90.0, rotz = 90.0;
	if(strfind(objectname, "Baseball Bat", true) != -1) dayzsaid = 336, rotx = 276.0, roty = 90.0, rotz = 90.0;

	Loot[lootCount][DropGunID] = dayzsaid;
	Loot[lootCount][DropGunXR] = rotx, Loot[lootCount][DropGunYR] = roty, Loot[lootCount][DropGunZR] = rotz;
    return 1;
}

function DayZSA_LootModelDrop(objectname[])
{
	new dayzsaid, Float:rotx, Float:roty, Float:rotz;
    if(strfind(objectname, "Binoculars", true) != -1) dayzsaid = 3070, rotx = 0.0, roty = 0.0, rotz = 0.0;
    if(strfind(objectname, "Road Flare", true) != -1) dayzsaid = 1904, rotx = 0.0, roty = 0.0, rotz = 0.0;
    if(strfind(objectname, "Map", true) != -1) dayzsaid = 3017, rotx = 0.0, roty = 0.0, rotz = 0.0;
	if(strfind(objectname, "GPS", true) != -1) dayzsaid = 19042, rotx = 0.0, roty = 0.0, rotz = 0.0;
	if(strfind(objectname, "Sniper Skin", true) != -1) dayzsaid = 1275, rotx = 272.828125, roty = 134.98297119141, rotz = 135.01782226563;
	if(strfind(objectname, "Civilian Skin", true) != -1) dayzsaid = 1275, rotx = 272.828125, roty = 134.98297119141, rotz = 135.01782226563;
	if(strfind(objectname, "Army Skin", true) != -1) dayzsaid = 1275, rotx = 0.0, roty = 0.0, rotz = 0.0;
	if(strfind(objectname, "Tent", true) != -1) dayzsaid = 1279, rotx = 0.0, roty = 0.0, rotz = 0.0;
	if(strfind(objectname, "Radio Device", true) != -1) dayzsaid = 330, rotx = 0.0, roty = 0.0, rotz = 0.0;
	if(strfind(objectname, "Bandage", true) != -1) dayzsaid = 1578, rotx = 0.0, roty = 0.0, rotz = 0.0;
	if(strfind(objectname, "Painkiller", true) != -1) dayzsaid = 1579, rotx = 0.0, roty = 0.0, rotz = 0.0;
	if(strfind(objectname, "Morphine", true) != -1) dayzsaid = 11736, rotx = 0.0, roty = 0.0, rotz = 0.0;
	if(strfind(objectname, "Medical Kit", true) != -1) dayzsaid = 11738, rotx = 0.0, roty = 0.0, rotz = 0.0;
	if(strfind(objectname, "Blood Bag", true) != -1) dayzsaid = 1575, rotx = 0.0, roty = 0.0, rotz = 0.0;
	if(strfind(objectname, "Can of Beans", true) != -1) dayzsaid = 2769, rotx = 0.0, roty = 0.0, rotz = 0.0;
	if(strfind(objectname, "Burger", true) != -1) dayzsaid = 2663, rotx = 0.0, roty = 0.0, rotz = 0.0;
	if(strfind(objectname, "Dirty Pizza Slice", true) != -1) dayzsaid = 2814, rotx = 0.0, roty = 0.0, rotz = 0.0;
	if(strfind(objectname, "Orange", true) != -1) dayzsaid = 19574, rotx = 0.0, roty = 0.0, rotz = 0.0;
	if(strfind(objectname, "Apple", true) != -1) dayzsaid = 19576, rotx = 0.0, roty = 0.0, rotz = 0.0;
	if(strfind(objectname, "Rum", true) != -1) dayzsaid = 1512, rotx = 0.0, roty = 0.0, rotz = 0.0;
	if(strfind(objectname, "Banana", true) != -1) dayzsaid = 19578, rotx = 0.0, roty = 0.0, rotz = 0.0;
	if(strfind(objectname, "Gin", true) != -1) dayzsaid = 19823, rotx = 0.0, roty = 0.0, rotz = 0.0;
	if(strfind(objectname, "Packet Of Cereals", true) != -1) dayzsaid = 19561, rotx = 0.0, roty = 0.0, rotz = 0.0;
	if(strfind(objectname, "Fresh Juice", true) != -1) dayzsaid = 19563, rotx = 0.0, roty = 0.0, rotz = 0.0;
	if(strfind(objectname, "Tomato", true) != -1) dayzsaid = 19577, rotx = 0.0, roty = 0.0, rotz = 0.0;
	if(strfind(objectname, "Full Water Bottle", true) != -1) dayzsaid = 2683, rotx = 0.0, roty = 0.0, rotz = 0.0;
	if(strfind(objectname, "Milk", true) != -1) dayzsaid = 2856, rotx = 0.0, roty = 0.0, rotz = 0.0;
	if(strfind(objectname, "Soda Bottle", true) != -1) dayzsaid = 2647, rotx = 0.0, roty = 0.0, rotz = 0.0;
	if(strfind(objectname, "Tire", true) != -1) dayzsaid = 1025, rotx = 0.0, roty = 0.0, rotz = 0.0;
	if(strfind(objectname, "Empty Jerry Can", true) != -1) dayzsaid = 1650, rotx = 0.0, roty = 0.0, rotz = 0.0;
	if(strfind(objectname, "Full Jerry Can", true) != -1) dayzsaid = 1650, rotx = 0.0, roty = 0.0, rotz = 0.0;
	if(strfind(objectname, "Engine", true) != -1) dayzsaid = 2891, rotx = 0.0, roty = 0.0, rotz = 0.0;
	if(strfind(objectname, "Toolbox", true) != -1) dayzsaid = 3052, rotx = 0.0, roty = 0.0, rotz = 0.0;
	if(strfind(objectname, "AK-47", true) != -1) dayzsaid = 355, rotx = 276.0, roty = 90.0, rotz = 90.0;
	if(strfind(objectname, "M4", true) != -1) dayzsaid = 356, rotx = 276.0, roty = 90.0, rotz = 90.0;
	if(strfind(objectname, "Silenced Pistol", true) != -1) dayzsaid =  347, rotx = 276.0, roty = 90.0, rotz = 90.0;
	if(strfind(objectname, "Pistol", true) != -1) dayzsaid = 346, rotx = 276.0, roty = 90.0, rotz = 90.0;
	if(strfind(objectname, "Shotgun", true) != -1) dayzsaid = 349, rotx = 276.0, roty = 90.0, rotz = 90.0;
	if(strfind(objectname, "SPAZ-12 Shotgun", true) != -1) dayzsaid = 351, rotx = 276.0, roty = 90.0, rotz = 90.0;
	if(strfind(objectname, "Country Rifle", true) != -1) dayzsaid = 357, rotx = 276.0, roty = 90.0, rotz = 90.0;
	if(strfind(objectname, "Sniper Rifle", true) != -1) dayzsaid = 358, rotx = 276.0, roty = 90.0, rotz = 90.0;
	if(strfind(objectname, "MP5", true) != -1) dayzsaid = 353, rotx = 276.0, roty = 90.0, rotz = 90.0;
	if(strfind(objectname, "Katana", true) != -1) dayzsaid = 339, rotx = 276.0, roty = 90.0, rotz = 90.0;
	if(strfind(objectname, "Baseball Bat", true) != -1) dayzsaid = 336, rotx = 276.0, roty = 90.0, rotz = 90.0;
	if(strfind(objectname, "Pistol Ammo", true) != -1) dayzsaid = 3013, rotx = 0.0, roty = 0.0, rotz = 0.0;
	if(strfind(objectname, "Shotgun Ammo", true) != -1) dayzsaid = 3013, rotx = 0.0, roty = 0.0, rotz = 0.0;
	if(strfind(objectname, "Sniper Ammo", true) != -1) dayzsaid = 3013, rotx = 0.0, roty = 0.0, rotz = 0.0;
	if(strfind(objectname, "Assault Ammo", true) != -1) dayzsaid = 3013, rotx = 0.0, roty = 0.0, rotz = 0.0;
	if(strfind(objectname, "SMG Ammo", true) != -1) dayzsaid = 3013, rotx = 0.0, roty = 0.0, rotz = 0.0;
	if(strfind(objectname, "Heat Pack", true) != -1) dayzsaid = 2058, rotx = 0.0, roty = 0.0, rotz = 0.0;
	if(strfind(objectname, "Heat Pack Basic", true) != -1) dayzsaid = 2058, rotx = 0.0, roty = 0.0, rotz = 0.0;
	if(strfind(objectname, "Whiskey Bottle", true) != -1) dayzsaid = 2683, rotx = 0.0, roty = 0.0, rotz = 0.0;
    if(strfind(objectname, "Coyote Patrol Pack", true) != -1) dayzsaid = 3026, rotx = 272.828125, roty = 45.0169677734380, rotz = 314.98205566406;
    if(strfind(objectname, "Czech Vest Pouch", true) != -1) dayzsaid = 371, rotx = 274.0, roty = 180.0, rotz = 180.0;
    if(strfind(objectname, "Alice Pack", true) != -1) dayzsaid = 1310, rotx = 271.99987792969, roty = 270.00048828125, rotz = 270.00036621094;
    if(strfind(objectname, "Coyote Backpack", true) != -1) dayzsaid = 1550, rotx = 79.237274169922, roty = 68.415649414063, rotz = 107.93438720703;
    if(strfind(objectname, "Raw Meat", true) != -1) dayzsaid =  2804, rotx = 82.7929077, roty = 236.4282684, rotz = 123.7814941;
    if(strfind(objectname, "Cooked Meat", true) != -1) dayzsaid =  2804, rotx = 82.7929077, roty = 236.4282684, rotz = 123.7814941;
    if(strfind(objectname, "Wood", true) != -1) dayzsaid = 1463, rotx = 82.7929077, roty = 236.4282684, rotz = 123.7814941;
    if(strfind(objectname, "Lighter", true) != -1) dayzsaid = 2751, rotx = 82.7929077, roty = 236.4282684, rotz = 123.7814941;
    if(strfind(objectname, "Antibiotics", true) != -1) dayzsaid = 1577, rotx = 0.0, roty = 0.0, rotz = 0.0;
	if(strfind(objectname, "Flashlight", true) != -1) dayzsaid = 18641, rotx = 82.7929077, roty = 236.4282684, rotz = 123.7814941;
    if(strfind(objectname, "Dirty Water Bottle", true) != -1) dayzsaid = 2683, rotx = 0.0, roty = 0.0, rotz = 0.0;

	Loot[lootCount][dropID] = dayzsaid;
	Loot[lootCount][dLootRotX] = rotx, Loot[lootCount][dLootRotY] = roty, Loot[lootCount][dLootRotZ] = rotz;
    return 1;
}

stock GetPlayerGroupName(playerid)
{
	new gname[24];
	format(gname,sizeof(gname),"%s",Groups[pInfo[playerid][IsPlayerInGroupID]][GroupName]);
	return gname;
}

/*DayZSA_GetSwimmingPointZ(playerid)
{
	if(IsPlayerInRangeOfPoint(playerid, 50.0, 1962.15, -1198.71, 17.45)) return 19;
	if(IsPlayerInRangeOfPoint(playerid, 100.0, -1127.58, 2764.43, 40.00)) return 43;
	if(IsPlayerInRangeOfPoint(playerid, 100.0, -988.19, 2486.89, 40.00)) return 43;
	if(IsPlayerInRangeOfPoint(playerid, 100.0, -924.33, 2306.59, 40.00)) return 43;
	if(IsPlayerInRangeOfPoint(playerid, 100.0, -1104.15, 2175.83, 40.00)) return 43;
	if(IsPlayerInRangeOfPoint(playerid, 100.0, -1307.06, 2119.33, 40.00)) return 43;
	if(IsPlayerInRangeOfPoint(playerid, 100.0, -831.85, 2122.23, 40.00)) return 43;
	if(IsPlayerInRangeOfPoint(playerid, 100.0, -595.76, 2138.34, 40.00)) return 43;
	if(IsPlayerInRangeOfPoint(playerid, 100.0, -569.24, 2274.40, 40.00)) return 43;
	if(IsPlayerInRangeOfPoint(playerid, 12.0, 1095.800, -674.950, 111.908)) return 113;
 	if(IsPlayerInRangeOfPoint(playerid, 12.0, 224.500, -1185.725, 73.908)) return 76;
  	if(IsPlayerInRangeOfPoint(playerid, 12.0, 193.700, -1230.608, 76.603)) return 79;
   	if(IsPlayerInRangeOfPoint(playerid, 12.0, 1277.500, -805.200, 86.581)) return 88;
    if(IsPlayerInRangeOfPoint(playerid, 12.0, 2582.0, 2387.0, 16.0)) return 18;
	return 10;
}*/

DayZSA_GetVehicleSpeed(vehicleid)
{
    new Float: vVel[3];
	GetVehicleVelocity(vehicleid, vVel[0], vVel[1], vVel[2]);
	return floatround(floatsqroot((vVel[0]*vVel[1]+vVel[2]*vVel[2]))*100.0*1.6);
}

stock IsPlayerNearSpawn(playerid)
{
	if(IsPlayerInRangeOfPoint(playerid, 20.0, 896.9587,2892.6489,37.5137)) return 1;
	if(IsPlayerInRangeOfPoint(playerid, 20.0, 1097.0283,2938.3865,40.1624)) return 1;
	if(IsPlayerInRangeOfPoint(playerid, 20.0, 1296.5024,2979.8425,17.4619)) return 1;
    if(IsPlayerInRangeOfPoint(playerid, 20.0, 2783.9072,614.0805,10.8984)) return 1;
    if(IsPlayerInRangeOfPoint(playerid, 20.0, 2867.5149,-341.7785,4.7310)) return 1;
    if(IsPlayerInRangeOfPoint(playerid, 20.0, -261.4227,-2167.7725,28.9799)) return 1;
    if(IsPlayerInRangeOfPoint(playerid, 20.0, 10.0890,-2541.1738,36.4986)) return 1;
    if(IsPlayerInRangeOfPoint(playerid, 20.0, 37.2395,-2711.1577,40.7622)) return 1;
    if(IsPlayerInRangeOfPoint(playerid, 20.0, -2381.2095,-2783.9360,5.2847)) return 1;
    if(IsPlayerInRangeOfPoint(playerid, 20.0, -2592.3835,-2687.4109,6.8228)) return 1;
    if(IsPlayerInRangeOfPoint(playerid, 20.0, -2686.7085,-2309.7456,9.7577)) return 1;
    if(IsPlayerInRangeOfPoint(playerid, 20.0, -2882.9514,-1170.3204,8.3407)) return 1;
    if(IsPlayerInRangeOfPoint(playerid, 20.0, -2804.3250,-916.2314,6.6717)) return 1;
    if(IsPlayerInRangeOfPoint(playerid, 20.0, -2032.6765,-1365.8677,27.9453)) return 1;
    if(IsPlayerInRangeOfPoint(playerid, 20.0, -1514.1663,-2896.9551,36.2866)) return 1;
    if(IsPlayerInRangeOfPoint(playerid, 20.0, 258.2556,2921.2253,2.4099)) return 1;
    if(IsPlayerInRangeOfPoint(playerid, 20.0, -162.6886,2890.2515,69.4884)) return 1;
    if(IsPlayerInRangeOfPoint(playerid, 20.0, -767.8674,2909.6902,36.2154)) return 1;
    if(IsPlayerInRangeOfPoint(playerid, 20.0, -1309.0072,2927.9607,73.6017)) return 1;
    if(IsPlayerInRangeOfPoint(playerid, 20.0, -2808.2583,2839.0881,207.1883)) return 1;
    if(IsPlayerInRangeOfPoint(playerid, 20.0, -2885.0125,2779.8203,230.5088)) return 1;
    if(IsPlayerInRangeOfPoint(playerid, 20.0, -2954.5725,761.5862,13.5812)) return 1;
    if(IsPlayerInRangeOfPoint(playerid, 20.0, -2929.7065,648.1838,13.3614)) return 1;
    if(IsPlayerInRangeOfPoint(playerid, 20.0, -2911.4805,-222.4231,2.5815)) return 1;
    if(IsPlayerInRangeOfPoint(playerid, 20.0, 89.4478,-1578.9141,10.5615)) return 1;
    if(IsPlayerInRangeOfPoint(playerid, 20.0, 27.8256,-1548.2875,3.6570)) return 1;
    if(IsPlayerInRangeOfPoint(playerid, 20.0, -59.0989,-1623.1260,3.4638)) return 1;
    if(IsPlayerInRangeOfPoint(playerid, 20.0, 2943.2224,-740.7009,2.0903)) return 1;
    if(IsPlayerInRangeOfPoint(playerid, 20.0, 2947.9048,-599.2261,2.6566)) return 1;
    if(IsPlayerInRangeOfPoint(playerid, 20.0, 2907.0012,-1868.3958,1.4930)) return 1;
    if(IsPlayerInRangeOfPoint(playerid, 20.0, 2910.2698,-1924.7443,1.2293)) return 1;
    if(IsPlayerInRangeOfPoint(playerid, 20.0, 2911.5835,-2061.7764,1.2522)) return 1;
    if(IsPlayerInRangeOfPoint(playerid, 20.0, 2907.9006,-2128.4133,1.6745)) return 1;
    if(IsPlayerInRangeOfPoint(playerid, 20.0, 1917.8435,-2769.5659,1.2644)) return 1;
    if(IsPlayerInRangeOfPoint(playerid, 20.0, 1709.0188,-2768.6555,1.5160)) return 1;
    if(IsPlayerInRangeOfPoint(playerid, 20.0, 1447.8463,-2768.2688,1.5921)) return 1;
    if(IsPlayerInRangeOfPoint(playerid, 20.0, 1257.2092,-2574.3057,1.3367)) return 1;
    if(IsPlayerInRangeOfPoint(playerid, 20.0, 976.4642,-1988.6869,1.5947)) return 1;
    if(IsPlayerInRangeOfPoint(playerid, 20.0, 117.9445,-1757.2789,6.6126)) return 1;
    return 0;
}

stock IsPlayerNearZombie(playerid)
{
    for(new i = 0; i < MAX_ZOMBIES; i++)
    {
        if(IsPlayerNPC(i))
        {
    		if(PlayerToPlayer(playerid, i, 50.0))
			{
	    	    return 1;
			}
		}
	}
	return 0;
}

stock PlayerToPlayer(playerid,targetid,Float:distance)
{
    new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid,x,y,z);
    if(IsPlayerInRangeOfPoint(targetid,distance,x,y,z))
    {
        return 1;
    }
    return 0;
}

stock DayZSA_SetPlayerNoiseLevel(playerid,level)
{
	if(level == 0)
	{
	    PlayerTextDrawHide(playerid,NoiseLevel1[playerid]);
	    PlayerTextDrawHide(playerid,NoiseLevel2[playerid]);
	    PlayerTextDrawHide(playerid,NoiseLevel3[playerid]);
	    PlayerTextDrawHide(playerid,NoiseLevel4[playerid]);
	    pInfo[playerid][IsPlayerMakingNoise] = 80;
	}

	if(level == 1)
	{
	    PlayerTextDrawHide(playerid,NoiseLevel2[playerid]);
	    PlayerTextDrawHide(playerid,NoiseLevel3[playerid]);
	    PlayerTextDrawHide(playerid,NoiseLevel4[playerid]);
		PlayerTextDrawShow(playerid,NoiseLevel1[playerid]);
		pInfo[playerid][IsPlayerMakingNoise] = 100;
	}

	if(level == 2)
	{
	    PlayerTextDrawHide(playerid,NoiseLevel3[playerid]);
	    PlayerTextDrawShow(playerid,NoiseLevel1[playerid]);
		PlayerTextDrawShow(playerid,NoiseLevel2[playerid]);
		pInfo[playerid][IsPlayerMakingNoise] = 300;
	}

	if(level == 3)
	{
 		PlayerTextDrawHide(playerid,NoiseLevel4[playerid]);
 		PlayerTextDrawShow(playerid,NoiseLevel1[playerid]);
		PlayerTextDrawShow(playerid,NoiseLevel2[playerid]);
		PlayerTextDrawShow(playerid,NoiseLevel3[playerid]);
		pInfo[playerid][IsPlayerMakingNoise] = 350;
	}

	if(level == 4)
	{
 		PlayerTextDrawShow(playerid,NoiseLevel1[playerid]);
		PlayerTextDrawShow(playerid,NoiseLevel2[playerid]);
		PlayerTextDrawShow(playerid,NoiseLevel3[playerid]);
		PlayerTextDrawShow(playerid,NoiseLevel4[playerid]);
		pInfo[playerid][IsPlayerMakingNoise] = 1000;
	}
	return 1;
}

stock DayZSA_SetPlayerEyeLevel(playerid,level)
{
	if(level == 0)
	{
	    PlayerTextDrawShow(playerid,EyeLevel1[playerid]);
	    PlayerTextDrawHide(playerid,EyeLevel2[playerid]);
	    PlayerTextDrawHide(playerid,EyeLevel3[playerid]);
	    PlayerTextDrawHide(playerid,EyeLevel4[playerid]);
	    pInfo[playerid][IsPlayerVisual] = 80;
	}

	if(level == 1)
	{
	    PlayerTextDrawHide(playerid,EyeLevel3[playerid]);
	    PlayerTextDrawHide(playerid,EyeLevel4[playerid]);
	    PlayerTextDrawShow(playerid,EyeLevel1[playerid]);
		PlayerTextDrawShow(playerid,EyeLevel2[playerid]);
		pInfo[playerid][IsPlayerVisual] = 100;
	}

	if(level == 2)
	{
	    PlayerTextDrawHide(playerid,EyeLevel4[playerid]);
	    PlayerTextDrawShow(playerid,EyeLevel1[playerid]);
		PlayerTextDrawShow(playerid,EyeLevel2[playerid]);
        PlayerTextDrawShow(playerid,EyeLevel3[playerid]);
		pInfo[playerid][IsPlayerVisual] = 200;
	}

	if(level == 3)
	{
	    PlayerTextDrawShow(playerid,EyeLevel1[playerid]);
		PlayerTextDrawShow(playerid,EyeLevel2[playerid]);
        PlayerTextDrawShow(playerid,EyeLevel3[playerid]);
		PlayerTextDrawShow(playerid,EyeLevel4[playerid]);
		pInfo[playerid][IsPlayerVisual] = 300;
	}
	return 1;
}

function ThrowFlare(playerid)
{
	new Float:pz, Float:x, Float:y, Float:z;
	GetPlayerFacingAngle(playerid, pz);
	GetPlayerPos(playerid, Float:x, Float:y, Float:z);
	GetXYInFrontOfPlayer(playerid, Float:x,Float:y, 10.0);
	RoadFlare[playerid] = CreateDynamicObject(354,Float:x,Float:y,Float:z-0.6,0.0,0.0,pz,-1,-1,-1,1000.0);
	ClearAnimations(playerid);
	return 1;
}

function VodkaStop(playerid)
{
	SetPlayerDrunkLevel(playerid,0);
	ClearAnimations(playerid);
	pInfo[playerid][IsPlayerDrunk] = 0;
	KillTimer(pInfo[playerid][IsPlayerDrunkTimer]);
	return 1;
}

stock IsPlayerNearVehicle(playerid, vehicleid, Float:distance)
{
    new m = GetVehicleModel(vehicleid);
    if(m == 0) return 0;
    new Float:x, Float:y, Float:z;
    GetVehiclePos(vehicleid, x, y, z);
    if(!IsPlayerInRangeOfPoint(playerid, distance, x, y, z)) return 0;
    return 1;
}

stock DayZSA_GetWeaponName(playerid)
{
	new wepname[64];
	switch(GetPlayerWeapon(playerid))
	{
	    case 0: wepname = "Fists";
	    case 25: wepname = "Shotgun";
	    case 30: wepname = "AK-47";
	    case 31: wepname = "M4";
	    case 34: wepname = "Sniper Rifle";
	    case 33: wepname = "Country Rifle";
	    case 22: wepname = "Pistol";
	    case 27: wepname = "SPAZ-12 Shotgun";
	    case 29: wepname = "MP5";
	    case 8: wepname = "Katana";
	    case 5: wepname = "Baseball Bat";
	    case 23: wepname = "Silenced Pistol";
	    case 43: wepname = "Binoculars";
	}
	return wepname;
}

stock DayZSA_GetVehicleName(vehicleid)
{
	new String[128];
    format(String,sizeof(String),"%s",VehicleNames[GetVehicleModel(vehicleid) - 400]);
    return String;
}

stock GetMaxZombies()
{
	return 350;
}

function GetClosestPlayer(p1)
{
    new x,Float:dis,Float:dis2,player;
    player = -1;
    dis = 99999.99;
    for (x=0;x<MAX_PLAYERS;x++) {
        if(IsPlayerConnected(x)) {
            if(x != p1) {
                dis2 = GetDistanceBetweenPlayers(x,p1);
                if(dis2 < dis && dis2 != -1.00) {
                    dis = dis2;
                    player = x;
                }
            }
        }
    }
    return player;
}

function Float:GetDistanceBetweenPlayers(p1,p2)
{
    new Float:x1,Float:y1,Float:z1,Float:x2,Float:y2,Float:z2;
    if(!IsPlayerConnected(p1) || !IsPlayerConnected(p2)) {
        return -1.00;
    }
    GetPlayerPos(p1,x1,y1,z1);
    GetPlayerPos(p2,x2,y2,z2);
    return floatsqroot(floatpower(floatabs(floatsub(x2,x1)),2)+floatpower(floatabs(floatsub(y2,y1)),2)+floatpower(floatabs(floatsub(z2,z1)),2));
}

stock GetNearest_Player(playerid, Float:distance)
{
	new Float:xX, Float:yY, Float:zZ, retElement = -1;
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
    	if((i == playerid) || (i == INVALID_PLAYER_ID)) continue;
        GetPlayerPos(i, xX, yY, zZ);
        new Float:odist = GetPlayerDistanceFromPoint(playerid, xX, yY, zZ);
        if (retElement == -1)
        {
            retElement = i;
            distance = odist;
        }
        else if (odist < distance)
        {
            retElement = i;
            distance = odist;
        }
    }
    return retElement;
}

stock IsPlayerMoving(playerid)
{
	if(GetPlayerAnimationIndex(playerid))
	{
	    new animname[32], animlib[32];
		GetAnimationName(GetPlayerAnimationIndex(playerid), animlib, sizeof(animlib), animname, sizeof(animname));
		if(!strcmp(animname, "WEAPON_CROUCH", true) || !strcmp(animname, "GUNCROUCHFWD", true))
		{
			return false;
		}
		else
		{
			new Float:Velocity[3];
    		GetPlayerVelocity(playerid, Velocity[0], Velocity[1], Velocity[2]);
    		if(Velocity[0] == 0 && Velocity[1] == 0 && Velocity[2] == 0) return false;
		}
	}
	return true;
}

stock IsPlayerSight(Float:point1[3], Float:point2[3])
{
    new Float: vector[3];
    new Float: dpoint[3];
    dpoint[0] = point2[0];
    dpoint[1] = point2[1];
    dpoint[2] = point2[2];
    new Float:konst;
    do
    {
        vector[0] = point1[0]-dpoint[0];
        vector[1] = point1[1]-dpoint[1];
        vector[2] = point1[2]-dpoint[2];
        konst = ACCURACY/floatsqroot(vector[0]*vector[0]+vector[1]*vector[1]+vector[2]*vector[2]);
        vector[0] = konst*vector[0];
        vector[1] = konst*vector[1];
        vector[2] = konst*vector[2];
        dpoint[0] = dpoint[0]+vector[0];
        dpoint[1] = dpoint[1]+vector[1];
        dpoint[2] = dpoint[2]+vector[2];
        new Float:zpoint;
        GetPointZPos(dpoint[0],dpoint[1], zpoint);
        //CreateObject(19130,dpoint[0],dpoint[1],zpoint+0.5,0.0,0.0,0.0);
        //CreateObject(19130,dpoint[0],dpoint[1],dpoint[2]+0.5,0.0,0.0,0.0);
        //printf("%.2f | %.2f",dpoint[2], zpoint);
        if(dpoint[2] < zpoint) return 0;
    }while(konst<1);
    return 1;
}

function SetWeatherEx(weatherid)
{
	SetWeather(weatherid);
	CurrentWeather = weatherid;
}

function GetWeather()
{
	return CurrentWeather;
}

stock GetPlayerTemperature(playerid)
{
	new Float:temp = pInfo[playerid][pTemp]/100;
	return _:temp;
}

function FOUR_TIRE(playerid)
{
	if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 500 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 445 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 471 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 604 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 554) return 1;
	return 0;
}

function FOUR_TIRE2(playerid)
{
	if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 531 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 418 ||GetVehicleModel(GetPlayerVehicleID(playerid)) == 542 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 470 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 422) return 1;
	return 0;
}

function FOUR_TIRE_ADD1(playerid)
{
	if(GetVehicleModel(GetVehicleNearID(playerid)) == 500 || GetVehicleModel(GetVehicleNearID(playerid)) == 445 || GetVehicleModel(GetVehicleNearID(playerid)) == 471 || GetVehicleModel(GetVehicleNearID(playerid)) == 604 || GetVehicleModel(GetVehicleNearID(playerid)) == 554) return 1;
	return 0;
}

function FOUR_TIRE_ADD2(playerid)
{
	if(GetVehicleModel(GetVehicleNearID(playerid)) == 531 || GetVehicleModel(GetVehicleNearID(playerid)) == 418 ||GetVehicleModel(GetVehicleNearID(playerid)) == 542 || GetVehicleModel(GetVehicleNearID(playerid)) == 470 || GetVehicleModel(GetVehicleNearID(playerid)) == 422) return 1;
	return 0;
}

/* Ban System */

stock jBan(player_banned, player_banner, reason[], time = 0, system = 0)
{
	if(system == 0)
	{
		if(strlen(reason) > MAX_REASON_LENGTH) return SendClientMessage(player_banner, 0xFFFFFF, ""chat" Sorry, the maximum reason length is "#MAX_REASON_LENGTH" characters!");

		if(gotBanned[player_banned] == 0)
		{
		    gotBanned[player_banned] = 1;
			format(jQuery, MAX_QUERY_LENGTH, "INSERT INTO `"#J_TABLE"` (user_banned, user_banned_ip, user_banner, ban_reason, ban_timestamp, ban_time) VALUES ('%s', '%s', 'System', '%s', CURRENT_TIMESTAMP, %d)", jNames[player_banned], jIP[player_banned], reason, time);
			mysql_tquery(handle, jQuery, "", "");
			gotBanned[player_banned] = 1;
			new strkick[180];
			format(strkick, sizeof(strkick), ""chat" System has banned %s (%i) for: %s", PlayerName(player_banned), player_banned, reason);
			SendClientMessageToAll(-1, strkick);
            SendClientMessage(player_banned, -1, ""chat""COL_WHITE" If you feel this is a mistake please, visit www.pgagaming.net under DayZ boards -> Unban Requests");

			KickEx(player_banned);
			printf(jQuery);
		}
	}
	else
	{
		if(strlen(reason) > MAX_REASON_LENGTH) return SendClientMessage(player_banner, 0xFFFFFF, ""chat" Sorry, the maximum reason length is "#MAX_REASON_LENGTH" characters!");

		if(gotBanned[player_banned] == 0)
		{
		    gotBanned[player_banned] = 1;
			format(jQuery, MAX_QUERY_LENGTH, "INSERT INTO `"#J_TABLE"` (user_banned, user_banned_ip, user_banner, ban_reason, ban_timestamp, ban_time) VALUES ('%s', '%s', '%s', '%s', CURRENT_TIMESTAMP, %d)", jNames[player_banned], jIP[player_banned], jNames[player_banner], reason, time);
			mysql_tquery(handle, jQuery, "", "");

			new strkick[180];
			format(strkick, sizeof(strkick), ""chat""COL_WHITE" %s has banned you for: %s", GetAdminName(player_banner), reason);
			SendClientMessage(player_banned, -1, strkick);
			SendClientMessage(player_banned, -1, ""chat""COL_WHITE" If you feel this is a mistake please, visit www.pgagaming.net under DayZ boards -> Unban Requests");
			printf(jQuery);
			KickEx(player_banned);
		}
	}
	return 1;
}

stock jBanCheck(playerid)
{
	format(jQuery, MAX_QUERY_LENGTH, "SELECT user_banner, ban_reason, TIMESTAMPDIFF(MINUTE, NOW(), DATE_ADD(ban_timestamp, INTERVAL ban_time MINUTE)) FROM `"#J_TABLE"` WHERE ( `user_banned` = '%s' OR user_banned_ip = '%s' ) AND (NOW() <= DATE_ADD(ban_timestamp, INTERVAL ban_time MINUTE) OR ban_time = 0)", PlayerName(playerid), jIP[playerid]);
	mysql_tquery(handle, jQuery, "jban_OnQueryFinish", "i", playerid);
	return 1;
}

stock jUnbanName(name[])
{
	if(strlen(name) > MAX_PLAYER_NAME) return 0;
	format(jQuery, MAX_QUERY_LENGTH, "DELETE FROM `"#J_TABLE"` WHERE user_banned = '%s'", name);

	mysql_tquery(handle, jQuery, "", "");
	return 1;
}

stock jUnbanIP(IP[])
{
	if(strlen(IP) > MAX_PLAYER_IP) return 0;
	format(jQuery, MAX_QUERY_LENGTH, "DELETE FROM `"#J_TABLE"` WHERE user_banned_ip = '%s'", IP);

	mysql_tquery(handle, jQuery, "", "");
	return 1;
}

function jban_OnQueryFinish(extraid)
{
	new rows, fields;
	cache_get_data(rows, fields, handle);

	if(rows)
	{
		SendClientMessage(extraid, -1, ""COL_RED" *** YOU ARE CURRENTLY BANNED FROM THIS SERVER");
		SendClientMessage(extraid, -1, ""COL_RED" *** POST YOUR APPEAL AT "COL_WHITE"WWW.PGAGAMING.NET");

		Kick(extraid);
	}
	else
	{
		new versionsa[128];
		GetPlayerVersion(extraid, versionsa, sizeof(versionsa));
		if(!strcmp(versionsa,"0.3x",true))
		{
			ShowPlayerDialog(extraid,5235,DIALOG_STYLE_MSGBOX,"Outdated Version","You need to have the latest SA-MP Version 0.3x R1-2\nDownload it off http://sa-mp.com/download.php","Leave","");
			Kick(extraid);
		}
		else
		{
			new query[256];
			format(query, sizeof(query), "SELECT * FROM `users` WHERE `Username` = '%s'", PlayerName(extraid));
			mysql_tquery(handle, query, "WhenAccountCheck", "i", extraid);
		}
	}
	return 1;
}

function MySQLConnect()
{
	handle = mysql_connect(mysql_host, mysql_user, mysql_database, mysql_password);
	if(handle && mysql_errno(handle) == 0)
	{
		printf("[DayZ MySQL]: Connection to database (%s) was established!", mysql_database);
	}
	else
	{
		printf("[DayZ MySQL]: Connection to database (%s) failed!", mysql_database);
	}
	return 1;
}

function DayZSA_ShowMenuForPlayer(playerid)
{
    SelectTextDraw(playerid, 0x00FF00FF);
	PlayerTextDrawShow(playerid, MenuLogo[playerid]);
	PlayerTextDrawShow(playerid, MenuBG[playerid]);

	if(gRegistred[playerid] == 0)
	{
	    PlayerTextDrawSetString(playerid, MenuPlay[playerid], "       START YOUR STORY");
	}

	PlayerTextDrawShow(playerid, MenuPlay[playerid]);
	PlayerTextDrawShow(playerid, MenuOptions[playerid]);
	PlayerTextDrawShow(playerid, MenuPremium[playerid]);
	PlayerTextDrawShow(playerid, MenuCredits[playerid]);
	PlayerTextDrawShow(playerid, MenuURL[playerid]);
	//PlayerTextDrawShow(playerid, MenuBlackLayer1[playerid]);
	//PlayerTextDrawShow(playerid, MenuBlackLayer2[playerid]);
	PlayerTextDrawShow(playerid, GeneralInfo[playerid]);


	PlayAudioStreamForPlayer(playerid, "http://pgagaming.net/dayzmenu.mp3");
	/*SetPlayerCameraLookAt(playerid, -1054.3846,-1157.3766,133.2800);
	SetPlayerCameraPos(playerid, -1054.3846,-1157.3766,133.2800);
	SetPlayerPos_Allow(playerid,-1037.0377,-1318.6061,143.1855);*/

	SetPlayerPos_Allow(playerid, -2820.2588,-1530.7047,144.9823);
	SetPlayerFacingAngle(playerid,299.6856);
	SetPlayerCameraPos(playerid, -2867.5381,-1556.2440,140.2921);
	SetPlayerCameraLookAt(playerid,  -2820.2588,-1530.7047,144.9823);

	defer MeowShow(playerid);

	isPlayerInMenu[playerid] = 1;
	return 1;
}

timer MeowShow[1800](playerid)
{
	SetPlayerPos_Allow(playerid, -2820.2588,-1530.7047,144.9823);
	SetPlayerFacingAngle(playerid,299.6856);
	SetPlayerCameraPos(playerid, -2867.5381,-1556.2440,140.2921);
	SetPlayerCameraLookAt(playerid,  -2820.2588,-1530.7047,144.9823);
	return 1;
}

function DayZSA_HideMenuForPlayer(playerid)
{
	StopAudioStreamForPlayer(playerid);
    CancelSelectTextDraw(playerid);
	PlayerTextDrawHide(playerid, MenuLogo[playerid]);
	PlayerTextDrawHide(playerid, MenuBG[playerid]);
	PlayerTextDrawHide(playerid, MenuPlay[playerid]);
	PlayerTextDrawHide(playerid, MenuOptions[playerid]);
	PlayerTextDrawHide(playerid, MenuPremium[playerid]);
	PlayerTextDrawHide(playerid, MenuCredits[playerid]);
	PlayerTextDrawHide(playerid, MenuURL[playerid]);
	PlayerTextDrawHide(playerid, MenuBlackLayer1[playerid]);
	PlayerTextDrawHide(playerid, MenuBlackLayer2[playerid]);
	PlayerTextDrawHide(playerid, GeneralInfo[playerid]);
	isPlayerInMenu[playerid] = 0;
	return 1;
}

timer loadingSpawn[2500](playerid)
{
    SetSpawnInfo(playerid, 0, 285, 0.0, 0.0, 0.0, 0.0, 0,0,0,0,0,0);
    TogglePlayerSpectating(playerid, 0);
    return 1;
}

public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
	if(playertextid == MenuPlay[playerid])
    {

        GameTextForPlayer(playerid,"~w~loading...", 2500, 4);
        DayZSA_HideMenuForPlayer(playerid);
        if(pInfo[playerid][DefaultGender] == 0)
        {
            //ShowPlayerDialog(playerid, DIALOG_GENDEROPTION_2, DIALOG_STYLE_MSGBOX, "DayZ - Gender Selection", "Please, select the default gender you wish to spawn with.\n** Please note you can change this anytime via Options Menu **", "Male", "Female");
			pInfo[playerid][DefaultGender] = 1;
		}
   		PlayerTextDrawShow(playerid, PlayerBlood[playerid]);
		PlayerTextDrawShow(playerid, PlayerHunger[playerid]);
		PlayerTextDrawShow(playerid, PlayerThirst[playerid]);
		PlayerTextDrawShow(playerid, PlayerNoise[playerid]);
		PlayerTextDrawShow(playerid, PlayerEye[playerid]);
		PlayerTextDrawShow(playerid, playerBandit[playerid]);
		PlayerTextDrawShow(playerid, PlayerTemp[playerid]);
//		PlayerTextDrawShow(playerid, HudBG_1[playerid]);
		TextDrawShowForPlayer(playerid, DebugBox);
		PlayerTextDrawShow(playerid, DebugMonitor_Text[playerid]);
		PlayerTextDrawShow(playerid, WebsiteLogo[playerid]);
		PlayerTextDrawShow(playerid, Debug_GunInfo[playerid]);
		PlayerTextDrawShow(playerid, Debug_GunIcon[playerid]);
		PlayerTextDrawShow(playerid, DebugInfo[playerid]);
		
		
		defer loadingSpawn(playerid);
    }

   	else if(playertextid == MenuOptions[playerid])
    {
		ShowPlayerDialog(playerid, DIALOG_OPTIONS, DIALOG_STYLE_LIST, "DayZ - Options Menu", "Default Gender Selection\nAmbient Background", "Select", "Cancel");
    }

   	else if(playertextid == MenuPremium[playerid])
    {
    	SendClientMessage(playerid, -1, ""chat" Soon to be added!");
    }

   	else if(playertextid == MenuCredits[playerid])
    {
		SendClientMessage(playerid, -1, ""chat" Soon to be added!");
    }

    else if(playertextid == GeneralInfo[playerid])
    {
		SendClientMessage(playerid, -1, ""chat" Soon to be added!");
	}
    return 1;
}

timer ResetAB_Allow[2500](playerid)
{
	abAllow[playerid] = 0;
	return 1;
}

stock PreloadAnimLib(playerid, animlib[]) ApplyAnimation(playerid,animlib,"null",0.0,0,0,0,0,0);

timer ResetAction[1450](playerid,actionid)
{
	if(actionid == ACTION_ANIMATION)
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
			ClearAnimations(playerid, 1);
			new clearanim = GetPlayerSkin(playerid);
			SetPlayerSkin(playerid, clearanim);
		}
	}

	if(actionid == ACTION_SPECIAL)
	{
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	}
	return 1;
}

function SetPlayerPos_Allow(playerid, Float:px_ab, Float:py_ab, Float:pz_ab)
{
    abAllow[playerid] = 1;
    defer ResetAB_Allow(playerid);
    SetPlayerPos(playerid, px_ab, py_ab, pz_ab);
    return 1;
}

stock SetPlayerLookAt(playerid, Float:x, Float:y)
{
	new Float:Px, Float:Py, Float: Pa;
	GetPlayerPos(playerid, Px, Py, Pa);
	Pa = floatabs(atan((y-Py)/(x-Px)));
	if (x <= Px && y >= Py) Pa = floatsub(180, Pa);
	else if (x < Px && y < Py) Pa = floatadd(Pa, 180);
	else if (x >= Px && y <= Py) Pa = floatsub(360.0, Pa);
	Pa = floatsub(Pa, 90.0);
	if (Pa >= 360.0) Pa = floatsub(Pa, 360.0);
	SetPlayerFacingAngle(playerid, Pa);
}

// Zombies

public FCNPC_OnChangeNode(npcid, newnodeid, oldnodeid)
{
	// Validate the node zone
 	return IsValidZone(newnodeid) ? 1 : 0;
}

stock IsValidZone(zoneid)
{
#if defined SAN_ANDREAS
	return zoneid > 0 && zoneid < FCNPC_MAX_NODES;
#elseif defined LOS_SANTOS
	return (zoneid >= 5 && zoneid <= 7) || (zoneid >= 12 && zoneid <= 15) || (zoneid >= 20 && zoneid <= 23);
#elseif defined SAN_FIERRO
	return zoneid == 17 || (zoneid >= 24 && zoneid <= 26) || (zoneid >= 32 && zoneid <= 24)  || (zoneid >= 40 && zoneid <= 41);
#elseif defined LAS_VENTURAS
	return (zoneid >= 38 && zoneid <= 39) || (zoneid >= 45 && zoneid <= 47) || (zoneid >= 53 && zoneid <= 55) || (zoneid >= 61 && zoneid <= 63);
#else
	return false;
#endif
}

stock Float:frandom(Float:max)
{
	return floatdiv(float(random(0)), floatdiv(float(cellmax), max));
}

forward CreateZombies();
public CreateZombies()
{
	new str[50]; //objects[7];
	//new Random = random(sizeof(ZombieSpawns));
	new nodeid, point, pednodes, vehnodes, navinodes;
	if(SpawnedZombies < MAX_ZOMBIES)
	{

		new thenpc_;
		format(str,sizeof(str),"Zombie[%d]",MAX_PLAYERS-(SpawnedZombies));
		thenpc_ = FCNPC_Create(str);
		/*ZombieLabel[thenpc_] = Create3DTextLabel("Zombie\nHP: 100", -1, 30.0, 40.0, 50.0, 60.0, -1, 0);
		Attach3DTextLabelToPlayer(ZombieLabel[thenpc_], thenpc_, 0.0, 0.0, 0.4);*/

		new skinidl;
		switch(random(2))
		{
		    case 0: skinidl = 162;
		    case 1: skinidl = 29;
		}
		FCNPC_ClearAnimations(thenpc_);
		FCNPC_ApplyAnimation(thenpc_, "PED", "WALK_DRUNK", 4.1, 1, 1,  1,  0,  0);
		
		

		do
		{
			nodeid = random(FCNPC_MAX_NODES);
		} while (!IsValidZone(nodeid));
        FCNPC_GetNodeInfo(nodeid, vehnodes, pednodes, navinodes);
        new Float:posNodes[3];
        if (random(2) == 1 && pednodes != 0)
		{
			point = random(pednodes - 1) + vehnodes + 1;
			FCNPC_SetNodePoint(nodeid, point);
			FCNPC_GetNodePointPosition(nodeid, posNodes[0], posNodes[1], posNodes[2]);
			FCNPC_Spawn(thenpc_, skinidl, posNodes[0], posNodes[1], posNodes[2]);
		}
		else
		{
			point = random(vehnodes - 1);
			FCNPC_SetNodePoint(nodeid, point);
			FCNPC_GetNodePointPosition(nodeid, posNodes[0], posNodes[1], posNodes[2]);
			FCNPC_Spawn(thenpc_, skinidl, posNodes[0], posNodes[1], posNodes[2]);
		}
		//FCNPC_Spawn(thenpc_,skinidl,ZombieSpawns[Random][0],ZombieSpawns[Random][1],ZombieSpawns[Random][2]);
		FCNPC_SetWeapon(thenpc_, 1);
		FCNPC_SetHealth(thenpc_, 100);
		FCNPC_ClearAnimations(thenpc_);
		FCNPC_ApplyAnimation(thenpc_, "PED", "WALK_DRUNK", 4.1, 1, 1,  1,  0,  0);
		ZombieTimer[thenpc_] = repeat ZombieMove(thenpc_);
		SetPlayerColor(thenpc_,0xAA333300);
		IsAZombie[thenpc_] = 1;
		SetPlayerAttachedObject( thenpc_, 1, 2908, 2, 0.064999,0.045000,0.000999, 176.500000, 5.699998, 95.000007, 0.941999, 1.082999, 1.075000 );
		SetPlayerAttachedObject( thenpc_, 2, 2907, 1, 0.038000,0.051000,0.027000,-94.999984, -0.299995, 89.399932, 1.0, 0.739000, 1.211000 );
		SetPlayerAttachedObject( thenpc_, 3, 2906, 5, -0.146000,0.000000,-0.007000,10.299988,1.500002, -89.800010, 1.0, 1.0, 1.0 );
		SetPlayerAttachedObject( thenpc_, 4, 2905, 10, -0.176999,0.082000,0.005000, 0.000000, 0.000000, -92.700004,1.067999, 0.662999, 0.998000 );
		SetPlayerAttachedObject( thenpc_, 5, 2804, 8, 0.240999,0.034000,0.000000, 0.000000, 0.000000,91.499977, 0.757999, 1.000000, 1.214999 );
		SetPlayerAttachedObject( thenpc_, 6, 2803, 1,0.132999,-0.161000,0.000000, 0.000000,91.599998,102.699989, 0.259000,0.369999, 0.719000 );
		SpawnedZombies++;

	}
	else
	{
		KillTimer(ZombiesTimer);
		printf("Zombies creation done!");
	}
	return 1;
}
public FCNPC_OnDeath(npcid, killerid, reason)
{
	ZombieAttackPlayer[npcid] = 0;
	PlayAnim(npcid, "PED", "BIKE_fall_off", 4.1, 0, 1, 1, 1, 0, 1);
	CallLocalFunction("OnPlayerKillZombie","ii",killerid,npcid);

	new Float:fPos[3];

	FCNPC_GetPosition(npcid,fPos[0],fPos[1],fPos[2]);
	DayZSA_CreateZLoot(fPos[0],fPos[1],fPos[2]);

	if(IsPlayerAimingTargetBodyPart(killerid, npcid, BODY_PART_HEAD))
	{
		GameTextForPlayer(killerid, "~r~~h~Headshot!", 3000, 3);
		pInfo[killerid][Headshots]++;
	}

	pInfo[killerid][ZombiesKilled]++;
	SendDeathMessage(killerid, npcid, reason);

	return 1;
}

public FCNPC_OnTakeDamage(npcid, issuerid, Float:amount, weaponid, bodypart)
{
 	new Float:HP = FCNPC_GetHealth(npcid);
    if(weaponid == 34) FCNPC_SetHealth(npcid, HP-120) ; // Sniper
	return 1;
}

timer ZombieMove[500](zombieid)
{
	new Float:xa,Float:ya,Float:za;
	if(FCNPC_IsDead(zombieid)) return 1;
	foreach(Player, playerid)
	{
		GetPlayerPos(playerid,xa,ya,za);
		MapAndreas_SetZ_For2DCoord(xa,ya,za);
		if(IsPlayerInRangeOfPoint(zombieid,1.2,xa,ya,za))// here playerid not zombieid
		{
		    FCNPC_Stop(zombieid);
			ZombieAttackPlayer[zombieid] = 2;
			FCNPC_MeleeAttack(zombieid,100);
			pInfo[playerid][pBlood] -= random(35);
			if(pInfo[playerid][pBlood] <= 0)
			{
			    FCNPC_Stop(zombieid);
			    FCNPC_StopAttack(zombieid);
			    ZombieAttackPlayer[zombieid] = 1;
			    FCNPC_ResumePlayingNode(zombieid);
			}
			break;
		}
		else if(IsPlayerInRangeOfPoint(zombieid,30.0,xa,ya,za))
		{
			if(ZombieAttackPlayer[zombieid] == 2)
			{
				FCNPC_Stop(zombieid);
				FCNPC_StopAttack(zombieid);
			}
			ZombieAttackPlayer[zombieid] = 1;
			FCNPC_GoTo(zombieid,xa,ya,za,FCNPC_MOVE_TYPE_AUTO,FCNPC_MOVE_SPEED_AUTO, FCNPC_MOVE_MODE_MAPANDREAS, FCNPC_MOVE_PATHFINDING_AUTO, 0.0, true, 0.0, 250);
			//FCNPC_GoToPlayer(zombieid, playerid, FCNPC_MOVE_TYPE_RUN, FCNPC_MOVE_TYPE_RUN, FCNPC_MOVE_MODE_MAPANDREAS, FCNPC_MOVE_PATHFINDING_AUTO, 0.0, true, 0.0, 1.5, 250);
			break;
		}
		else if(IsPlayerInRangeOfPoint(zombieid,35.0,xa,ya,za))
		{
			if(ZombieAttackPlayer[zombieid] == 2)
			{
				FCNPC_Stop(zombieid);
				FCNPC_StopAttack(zombieid);
			}
			ZombieAttackPlayer[zombieid] = 1;
			break;
		}
		else
		{
			ZombieAttackPlayer[zombieid] = 0;
		}
	}
	return 1;
}

/*stock FCNPC_GoToPlayerEx(npcid, playerid, Float:dist, Float:rangle, movetype = FCNPC_MOVE_TYPE_RUN)
{
	new Float:xa, Float:ya, Float:za, Float:fa;
	GetPlayerPos(playerid, xa, ya, za);
	MapAndreas_FindZ_For2DCoord(xa,ya,za);
	GetPlayerFacingAngle(playerid, fa);
	rangle += fa;
	xa = (xa + dist * floatsin(-rangle,degrees));
	ya = (ya + dist * floatcos(-rangle,degrees));
	FCNPC_GoTo(npcid,xa,ya,za,movetype,0.5,FCNPC_MOVE_MODE_AUTO,FCNPC_MOVE_PATHFINDING_AUTO, 0.0, true, 0.0, 250);
    return 1;
}*/
forward OnPlayerKillZombie(playerid, zombieid);
public OnPlayerKillZombie(playerid,zombieid)
{
	pInfo[playerid][ZombiesKilled]++;
	ZombiesAlive--;
	defer RespawnZ(zombieid);
	return 1;
}

timer RespawnZ[45000](zombieid)
{
    FCNPC_Respawn(zombieid);
	return 1;
}

public FCNPC_OnRespawn(npcid)
{
    new nodeid, point, pednodes, vehnodes, navinodes;
	new skinidl;
	switch(random(2))
	{
		case 0: skinidl = 162;
		case 1: skinidl = 29;
	}


	do
	{
		nodeid = random(FCNPC_MAX_NODES);
	} while (!IsValidZone(nodeid));
	FCNPC_GetNodeInfo(nodeid, vehnodes, pednodes, navinodes);
	new Float:posNodes[3];
	if (random(2) == 1 && pednodes != 0)
	{
		point = random(pednodes - 1) + vehnodes + 1;
		FCNPC_SetNodePoint(nodeid, point);
		FCNPC_GetNodePointPosition(nodeid, posNodes[0], posNodes[1], posNodes[2]);
		FCNPC_Spawn(npcid, skinidl, posNodes[0], posNodes[1], posNodes[2]);
	}
	else
	{
		point = random(vehnodes - 1);
		FCNPC_SetNodePoint(nodeid, point);
		FCNPC_GetNodePointPosition(nodeid, posNodes[0], posNodes[1], posNodes[2]);
		FCNPC_Spawn(npcid, skinidl, posNodes[0], posNodes[1], posNodes[2]);
	}
	FCNPC_StopAttack(npcid);
	FCNPC_SetWeapon(npcid,1);
	FCNPC_ApplyAnimation(npcid, "PED", "WALK_DRUNK", 4.1, 1, 1,  1,  0,  0);
	FCNPC_SetAmmo(npcid,1);
	ZombiesAlive++;
	return 1;
}

function DayZSA_CreateZLoot(Float:pXX,Float:pYX,Float:pZX)
{
	new strt[128];
	lootCount += 1;
	Loot[lootCount][xLoot] = pXX;
	Loot[lootCount][yLoot] = pYX;
	Loot[lootCount][zLoot] = pZX;

	switch(random(16))
	{
		case 0: DayZSA_LootSetupLow();
		case 1: DayZSA_LootSetupMedium();
		case 2: DayZSA_LootSetupHigh();
		case 3: DayZSA_LootSetupLow();
		case 4: DayZSA_LootSetupMedium();
		case 5: DayZSA_LootSetupHigh();
		case 6: DayZSA_LootSetupMedium();
		case 7: DayZSA_LootSetupHigh();
		case 8: DayZSA_LootSetupMedium();
		case 9: DayZSA_LootSetupLow();
		case 10: DayZSA_LootSetupLow();
		case 11: DayZSA_LootSetupMedium();
		case 12: DayZSA_LootSetupMedium();
		case 13: DayZSA_LootSetupLow();
		case 14: DayZSA_LootSetupMedium();
		case 15: DayZSA_LootSetupLow();
	}

    Loot[lootCount][AntiDup] = 1;
	Loot[lootCount][LootID] = CreateDynamicObject(Loot[lootCount][ModelID],pXX,pYX,pZX-0.9,Loot[lootCount][LootRotX],Loot[lootCount][LootRotY],Loot[lootCount][LootRotZ],-1,-1,-1,1000.0);
	format(strt,sizeof(strt),""COL_GREEN"GEAR\n"COL_GREY"Press N to pick up zombie loot!");
    Loot[lootCount][TextID] = CreateDynamic3DTextLabel(strt,-1,pXX,pYX,pZX-0.9,8.0,INVALID_PLAYER_ID,INVALID_VEHICLE_ID,1,-1,-1,-1, 8.0);
	return 1;
}

function Float:floatrand(Float:min, Float:max) //By Alex "Y_Less" Cole
{
	new imin = floatround(min);
	return floatdiv(float(random((floatround(max)-imin)*100)+(imin*100)),100.0);
}

