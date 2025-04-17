norom 
check bankcross off 	

ROM_CHRstart = $40010						; assuming vanilla rom
CHR_bankSize = $400

org $0										; get CHR assembly 

	incbin "../../rom/Castlevania_3.nes":($41*CHR_bankSize)+ROM_CHRstart..($42*CHR_bankSize)+ROM_CHRstart
	incbin "../../rom/Castlevania_3.nes":($70*CHR_bankSize)+ROM_CHRstart..($73*CHR_bankSize)+ROM_CHRstart
		
	
	; - You can dump a SNES palette from Mesen and get something usable in YY-CHR via the following steps:
	; - Pause the emulator at the part of the game where you want to rip the palette.
	; - Open the "Debug" menu and select "Memory Viewer" (or use the key combo Ctrl+M).
	; - In the "Memory Type:" dropdown, select "CG RAM (Palette)".
	; - Open the "File" menu and select "Export" (or press Ctrl+S).
	; - Change the "Save as type" to "All files (*)".
	; - Change the file name to something with the extension .pal. Click Save.
	; - In the palette pane of YY-CHR, switch from the PAL-SET tab to the PAL tab.
	; - Open the "Palette" menu and select "Open RGB Palette (*.pal)..."
	; - Select the palette file you saved in step 6. Click Open.
	; 
	; - Alternatively, if you want to view or tweak the palette before dumping it:
	; - Pause the emulator at the part of the game where you want to rip the palette.
	; - Open the "Debug" menu and select "Palette Viewer" (or use the key combo Ctrl+4)
	; - Right-click anywhere in the palette area of the Palette Viewer window and select "View in Memory Viewer".
	; - Follow steps 4 to 9 above.