
IF EXIST title/01_titleScreen.map (
	..\..\tools\asar.exe --fix-checksum=off --no-title-check ../../gfx/screens/title/trim_title.asm title.sfc
 	move title.sfc title\01_titleScreen.nam
	)

IF EXIST map/06_map00.map (
	..\..\tools\asar.exe --fix-checksum=off --no-title-check ../../gfx/screens/map/trim_map.asm map.sfc
 	move map.sfc map\06_map00.nam
	)

IF EXIST mapCastle/07_mapCastleTop.map (
	..\..\tools\asar.exe --fix-checksum=off --no-title-check ../../gfx/screens/mapCastle/trim_mapCastleTop.asm mapCastleTop.sfc
	move mapCastleTop.sfc mapCastle\07_mapCastleTop.nam 
	..\..\tools\asar.exe --fix-checksum=off --no-title-check ../../gfx/screens/mapCastle/trim_mapAttriTop.asm mapCastleAtriTop.sfc
	move mapCastleAtriTop.sfc mapCastle\0a_mapX4.nam 
	)

IF EXIST mapCastle/0e_mapCastleBottom.map (
	..\..\tools\asar.exe --fix-checksum=off --no-title-check ../../gfx/screens/mapCastle/trim_mapCastleMid.asm mapCastleMid.sfc
	move mapCastleMid.sfc mapCastle\08_mapCastleMid.nam 
	..\..\tools\asar.exe --fix-checksum=off --no-title-check ../../gfx/screens/mapCastle/trim_mapAttriBottom.asm mapCastleAtriBottom.sfc
	move mapCastleAtriBottom.sfc mapCastle\09_mapX3.nam 		
	)

IF EXIST prayer/0b_prayerScreen.map (
	..\..\tools\asar.exe --fix-checksum=off --no-title-check ../../gfx/screens/prayer/trim_pray.asm pray.sfc
 	move pray.sfc prayer\0b_prayerScreen.nam
	)

IF EXIST name/0c_nameScreen.map (
	..\..\tools\asar.exe --fix-checksum=off --no-title-check ../../gfx/screens/name/trim_name.asm name.sfc
 	move name.sfc name\0c_nameScreen.nam
	)

IF EXIST password/0d_password.map (
	..\..\tools\asar.exe --fix-checksum=off --no-title-check ../../gfx/screens/password/trim_password.asm password.sfc
 	move password.sfc password\0d_password.nam
	)

IF EXIST mapCastle/0e_mapCastleBottom.map (
	..\..\tools\asar.exe --fix-checksum=off --no-title-check ../../gfx/screens/mapCastle/trim_mapCastleBottom.asm mapCastleBottom.sfc
 	move mapCastleBottom.sfc mapCastle\0e_mapCastleBottom.nam
	)

IF EXIST intro/0f_castleIntro.map (
	..\..\tools\asar.exe --fix-checksum=off --no-title-check ../../gfx/screens/intro/trim_intro.asm intro.sfc
 	move intro.sfc intro\0f_castleIntro.nam
	)

IF EXIST ending/10_ending01.map (
	..\..\tools\asar.exe --fix-checksum=off --no-title-check ../../gfx/screens/ending/trim_endingAttri.asm ending2.sfc
 	move ending2.sfc ending\10_ending02.nam
	..\..\tools\asar.exe --fix-checksum=off --no-title-check ../../gfx/screens/ending/trim_ending1.asm ending1.sfc
 	move ending1.sfc ending\10_ending01.nam	
	)

IF EXIST ending/10_ending00.map (
	..\..\tools\asar.exe --fix-checksum=off --no-title-check ../../gfx/screens/ending/trim_ending0.asm ending0.sfc
 	move ending0.sfc ending\10_ending00.nam
	)





..\..\tools\NESCompress --compress:"title/01_titleScreen.nam"					--ppuaddr:0x2000 -x:"title/compressed/01_titleScreen.nam"		
..\..\tools\NESCompress --compress:"00_clearScreen.nam"                     	--ppuaddr:0x2000 -x:"ending/compressed/00_clearScreen.nam"              
..\..\tools\NESCompress --compress:"map/06_map00.nam"                       	--ppuaddr:0x2000 -x:"map/compressed/06_map00.nam"                
..\..\tools\NESCompress --compress:"mapCastle/07_mapCastleTop.nam"          	--ppuaddr:0x2240 -x:"mapCastle/compressed/07_mapCastleTop.nam"   
..\..\tools\NESCompress --compress:"mapCastle/08_mapCastleMid.nam"          	--ppuaddr:0x2C00 -x:"mapCastle/compressed/08_mapCastleMid.nam"   
..\..\tools\NESCompress --compress:"mapCastle/09_mapX3.nam"                 	--ppuaddr:0x2FC0 -x:"mapCastle/compressed/09_mapX3.nam"          
..\..\tools\NESCompress --compress:"mapCastle/0a_mapX4.nam"                 	--ppuaddr:0x23C0 -x:"mapCastle/compressed/0a_mapX4.nam"          
..\..\tools\NESCompress --compress:"prayer/0b_prayerScreen.nam"             	--ppuaddr:0x2000 -x:"prayer/compressed/0b_prayerScreen.nam"      
..\..\tools\NESCompress --compress:"name/0c_nameScreen.nam"                 	--ppuaddr:0x2000 -x:"name/compressed/0c_nameScreen.nam"          
..\..\tools\NESCompress --compress:"password/0d_password.nam"               	--ppuaddr:0x2000 -x:"password/compressed/0d_password.nam"        
..\..\tools\NESCompress --compress:"mapCastle/0e_mapCastleBottom.nam"       	--ppuaddr:0x2c80 -x:"mapCastle/compressed/0e_mapCastleBottom.nam"
..\..\tools\NESCompress --compress:"intro/0f_castleIntro.nam"               	--ppuaddr:0x2000 -x:"intro/compressed/0f_castleIntro.nam"        
..\..\tools\NESCompress --compress:"ending/10_ending00.nam"                 	--ppuaddr:0x2000 -x:"ending/compressed/10_ending00.nam"          
..\..\tools\NESCompress --compress:"ending/10_ending01.nam"                 	--ppuaddr:0x2800 -x:"ending/compressed/10_ending01.nam"          
..\..\tools\NESCompress --compress:"ending/10_ending02.nam"                 	--ppuaddr:0x2BC0 -x:"ending/compressed/10_ending02.nam"          

pause 