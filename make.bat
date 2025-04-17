@ECHO OFF 

if not exist "rom/Castlevania_3.nes" (
  goto errorNoRom
  )

tools\asar.exe --fix-checksum=off --no-title-check "code/prePatch/preMain.asm" "rom/Castlevania_3.nes"

if exist "Castlevania_3.nes" (
  del "Castlevania_3.nes"
  )

tools\asar.exe --fix-checksum=off --no-title-check code/setup/header.asm header.sfc
tools\asar.exe --fix-checksum=off --no-title-check code/setup/headerRemover.asm patch.sfc
tools\asar.exe --fix-checksum=off --no-title-check main.asm patch.sfc
copy /b "header.sfc"+"patch.sfc" "Castlevania_3.nes"
del header.sfc 
del patch.sfc 

::timeout 3
pause 
exit 

:errorNoRom
echo no rom found! 
echo Put your "Castlevania_3.nes" rom into the "rom" folder and rename the file as shown.
pause