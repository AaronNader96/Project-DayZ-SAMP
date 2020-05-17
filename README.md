# Project-DayZ-SAMP

Installation:

1. Download SAMP 0.3.7 Server package: http://files.sa-mp.com/samp037_svr_R2-1-1_win32.zip
2. Download project files and copy & paste them into the folder
3. Download XAMPP and create local MySQL database or if hosted remotely put the info for the MySQL connection in dayz.pwn settings

The .sql files will automatically generate as soon you compile and start the server if the database is successfully connected.

4. Compile dayz.pwn.
5. Start samp-server.exe

Server Settings (all in dayz.pwn under #define SETTINGNAME):

#define mysql_host "" // IP of remote host or if local: 127.0.0.1

#define mysql_user  "" // Username of MySQL. If local type root.

#define mysql_password "" 

#define mysql_database  "" // Name of the database

#define MAX_ZOMBIES (originally set to 400) make sure this setting is set to amount of zombies you need. In server.cfg make sure maxnpc is set to max zombies.

#define NAME - Server same

Everything else is self-explanatory. 

Admin Level Status

1. Login to PhpMyAdmin or MySQL command prompt.
2. Edit the pAdminLevel field set to level 5
3. (Optional) Edit dayz.pwn Line 9120 repalce if(pInfo[playerid][pAdminLevel] >= 5) to if(IsPlayerAdmin(playerid)) which use RCON built in SAMP administrative system. (via /rcon login pass)

Military Crates

/spawncratem (command used by administrators)
To create military crate spawns please use:
DayZSA_CreateAirdrop(x,y,z);

