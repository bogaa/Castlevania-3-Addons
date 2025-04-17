

..\..\tools\asar.exe --fix-checksum=off --no-title-check ../../gfx/screens/title/extractGFX_title.asm title.sfc
move title.sfc title\title.chr

..\..\tools\asar.exe --fix-checksum=off --no-title-check ../../gfx/screens/map/extractGFX_map.asm map.sfc
move map.sfc map\map.chr

..\..\tools\asar.exe --fix-checksum=off --no-title-check ../../gfx/screens/intro/extractGFX_intro.asm intro.sfc
move intro.sfc intro\intro.chr

..\..\tools\asar.exe --fix-checksum=off --no-title-check ../../gfx/screens/prayer/extractGFX_prayer.asm prayer.sfc
move prayer.sfc prayer\prayer.chr

..\..\tools\asar.exe --fix-checksum=off --no-title-check ../../gfx/screens/name/extractGFX_name.asm name.sfc
move name.sfc name\name.chr

..\..\tools\asar.exe --fix-checksum=off --no-title-check ../../gfx/screens/password/extractGFX_PW.asm PW.sfc
move PW.sfc password\PW.chr

..\..\tools\asar.exe --fix-checksum=off --no-title-check ../../gfx/screens/mapCastle/extractGFX_map2.asm mapCastle.sfc
move mapCastle.sfc mapCastle\mapCastle.chr

..\..\tools\asar.exe --fix-checksum=off --no-title-check ../../gfx/screens/ending/extractGFX_ending.asm ending.sfc
move ending.sfc ending\ending.chr

..\..\tools\asar.exe --fix-checksum=off --no-title-check ../../gfx/screens/ending/extractGFX_credits.asm credits.sfc
move credits.sfc ending\credits.chr

pause 