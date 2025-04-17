..\..\tools\NESCompress -d:"../../rom/Castlevania_3.nes" -o:0x0b580 --nt0:"title/01_titleScreen.nam"
..\..\tools\NESCompress -d:"../../rom/Castlevania_3.nes" -o:0x3ECAD --nt0:"00_clearScreen.nam"
..\..\tools\NESCompress -d:"../../rom/Castlevania_3.nes" -o:0x32BB8 --nt0:"map/06_map00.nam"
..\..\tools\NESCompress -d:"../../rom/Castlevania_3.nes" -o:0x17A78 --nt0:"mapCastle/07_mapCastleTop.nam"
..\..\tools\NESCompress -d:"../../rom/Castlevania_3.nes" -o:0x17A0A --nt3:"mapCastle/08_mapCastleMid.nam"
::we will get the attribute from NEXXT map file later
::..\..\tools\NESCompress -d:"../../rom/Castlevania_3.nes" -o:0x17A6C --nt3:"mapCastle/09_mapX3.nam"
::..\..\tools\NESCompress -d:"../../rom/Castlevania_3.nes" -o:0x17BCC --nt0:"mapCastle/0a_mapX4.nam"
..\..\tools\NESCompress -d:"../../rom/Castlevania_3.nes" -o:0x13AE4 --nt0:"prayer/0b_prayerScreen.nam"
..\..\tools\NESCompress -d:"../../rom/Castlevania_3.nes" -o:0x079B6 --nt0:"name/0c_nameScreen.nam" 
..\..\tools\NESCompress -d:"../../rom/Castlevania_3.nes" -o:0x33337 --nt0:"password/0d_password.nam"
..\..\tools\NESCompress -d:"../../rom/Castlevania_3.nes" -o:0x17849 --nt3:"mapCastle/0e_mapCastleBottom.nam"
..\..\tools\NESCompress -d:"../../rom/Castlevania_3.nes" -o:0x32D8C --nt0:"intro/0f_castleIntro.nam"
..\..\tools\NESCompress -d:"../../rom/Castlevania_3.nes" -o:0x2BE0A --nt0:"ending/10_ending00.nam"
..\..\tools\NESCompress -d:"../../rom/Castlevania_3.nes" -o:0x3D782 --nt2:"ending/10_ending01.nam"
..\..\tools\NESCompress -d:"../../rom/Castlevania_3.nes" -o:0x2BAAA --nt2:"ending/10_ending02.nam"

..\..\tools\asar.exe --fix-checksum=off --no-title-check ../../gfx/screens/mapCastle/combineMidBottom.asm combine.sfc
move combine.sfc mapCastle\0e_mapCastleBottom.nam 	

del mapCastle\08_mapCastleMid.nam

pause
