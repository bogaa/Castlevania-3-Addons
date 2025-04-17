norom	
check bankcross off 
 
	incsrc "code/labels.asm"			 	

{ ; notes 
	
	; 00000 00: palette text expansions => patches.asm (!expandCHRanim)
	; 04000 01: IRQ, Animation CHR => patches.asm
	; 08000 02: data_misc.asm
	; 0c000 03:
	; 10000 04:
	; 14000 05: 
	; 18000 06: 
	; 1c000 07: 
	; 20000 08: boss.asm 
	; 24000 09: boss.asm 
	; 28000 0a: text.asm 
	; 2c000 0b: enemy.asm  
	; 30000 0c: music.asm | boss.asm 
	; 34000 0d: data_sprite.asm 
	; 38000 0e: player.asm 
	; LAST_BANK => label.asm 	; data_screens_compressed.asm has FreeSpace -> newLoad_X_preserveAll, MMC5Init

	; expand PRG 40000-43fff	; a0 main hijacks (pause, all_bank_free_space "code/patches.asm")
	; expand PRG 44000-47fff	; a2 !unused	
	; expand PRG 48000-4dfff	; a4 sram code
	; expand PRG 4c000-4ffff	; a6 data screens
	; expand PRG 50000-53fff	; a8 data moved

}

{ ; rom expansion insert empty banks 	
org $3e000
	pad $3e000+($4000*(HEADER_PRG-$10))
	incbin "rom/Castlevania_3.nes":$3e010..$60010 

org ROM_CHRstart+ROM_CHRsize
	pad ROM_CHRstart+ROM_CHRsize+($2000*(HEADER_CHR-$10))
}

{ ; patch options 
	
	!fast_options = 1				; -- general --------------------
	!removeTimer = 1
	!deathCouter = 1
	!subweaponDrop = 1
	!expandCHRanim = 1
	!optionScreen = 1
	!alienPatchRemove = 1	


	!jumpControllDirection = 1		; -- player ---------------------
	!jumpControllHight = 0
	!jumpControllMovment = 1
	
	!grantSaveClimbSpeed = 1
	!grantNinjaStar = 1
	!grantDaggerSpiderSilkFreez = 0
	
	!playerAclucardShootOnStairs = 1 


	!debuggMenu = 0					; -- debug ---------------------
	!levelSelect = 1	
	!sprite_viewer = 0				
	
	
	!CHR_paralex = 1				; -- game elements --------------	 
	!putAllSpritesBehindFog = 0


}

{ ; text symbols game 

	' ' = $40
	'0' = $41
	'1' = $42
	'2' = $43
	'3' = $44
	'4' = $45
	'5' = $46
	'6' = $47
	'7' = $48
	'8' = $49
	'9' = $4A
	'A' = $50
	'B' = $51
	'C' = $52
	'D' = $53
	'E' = $54
	'F' = $55
	'G' = $56
	'H' = $57
	'I' = $58
	'J' = $59
	'K' = $5A
	'L' = $5B
	'M' = $5C
	'N' = $5D
	'O' = $5E
	'P' = $5F
	'Q' = $60
	'R' = $61
	'S' = $62
	'T' = $63
	'U' = $64
	'V' = $65
	'W' = $66
	'X' = $67
	'Y' = $68
	'Z' = $69
	'.'	= $4B
	'=' = $4C
	'-' = $4D
	'"' = $4E
	'!' = $6A
	'?' = $6B
	',' = $78
	''' = $4F	; '
}

org $40000			; free space 
base $8000
	correntBankIDX:	
		db $A0		
pushPC 	
	
	incsrc "code/patches.asm"
	incsrc "code/data_tables_transit.asm"
	
pullPC 
assert pc() <= $4c000 
org $50000			; free space 
base $8000
		db $A8		; bankIDX mark 
pushPC 

	incsrc "code/player.asm"		
	incsrc "code/enemy.asm" 		
	incsrc "code/boss.asm"			
	
	incsrc "code/data_screens_compressed.asm"
	incsrc "code/data_sprite.asm"
	
	
	
pullPC 
assert pc() <= $54000 	










