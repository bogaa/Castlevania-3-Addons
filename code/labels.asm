; options 

!expandPRG = 	1			; most patches will not work without expansion 
!expandCHR = 	1
!sRAM = 		1

{ ; defines 
	padbyte $00

	HEADER = $1A
if !expandPRG == 1 
	HEADER_PRG = $20
else
	HEADER_PRG = $10
endif 
	
if !expandCHR == 1 
	HEADER_CHR = $20	
else 	
	HEADER_CHR = $10
endif 	

if !sRAM == 1
	HEADER_MAPPER = $51 
else 	
	HEADER_MAPPER = $50 
endif 

	LAST_BANK = (HEADER_PRG*$4000)-$2000
	ROM_CHRstart = HEADER_PRG*$4000 
	ROM_CHRsize = HEADER_CHR*$2000

	JOY1 = $4016
	JOY2 = $4017
	P_A = $80
	P_B = $40
	P_SELECT = $20
	P_START = $10
	P_UP = $08
	P_DOWN = $04
	P_LEFT = $02
	P_RIGHT = $01
	BUTTONE_DELAY = $20

	FILL_MODE_TILE = $5106
	FILL_MODE_COLOUR = $5107
	PRG_BANK_8000 = $5115
	
	PRG_BANK_c000 = $5116
	
	CHR_BANK_0000 = $5120		; in 8x16 mode, the 1st 8 are for sprites, the next 4 for bg
	CHR_BANK_0400 = $5121
	CHR_BANK_0800 = $5122
	CHR_BANK_0c00 = $5123
	CHR_BANK_1000 = $5124
	CHR_BANK_1400 = $5125
	CHR_BANK_1800 = $5126
	CHR_BANK_1c00 = $5127
	CHR_BANK_0000_1000 = $5128
	CHR_BANK_0400_1400 = $5129
	CHR_BANK_0800_1800 = $512a
	CHR_BANK_0c00_1c00 = $512b
	VERTICAL_SPLIT_MODE = $5200
	SCANLINE_CMP_VALUE = $5203
	SCANLINE_IRQ_STATUS = $5204 	
	
	GS_INTRO = $00													
	GS_STUB = $01                     
	GS_PRE_NAME_PW_INPUT = $02        
	GS_PRE_IN_GAME = $03              
	GS_IN_GAME = $04                  
	GS_DIED = $05                     
	GS_GAME_OVER = $06                
	GS_DEBUG_MODE = $07               
	GS_BETWEEN_LEVELS = $08           
	GS_INTRO_CUTSCENE = $09           
	GS_NAME_PW_INPUT = $0a            
	GS_SHOW_PASSWORD = $0b            
	GS_ENDING_CUTSCENE = $0c          
	GS_CREDITS = $0d                  
	GS_AFTER_PW_ENTER = $0e           
	GS_SOUND_MODE = $0f               	

	
	PARTNER_SYMPHA = $01
	PARTNER_GRANT = $02
	PARTNER_ALUCARD = $03

}
	
{ ; ram labels 
	
	sr_lvl_IDX_00 = $6000 
	sr_defaultLife = $6001
	sr_setStartingStage = $6002
	sr_selectedPlayer = $6003
	
	sr_heldButtonFlag_0F = $600F
	sr_PRGbackup = $600E

	SRAM_Code = $7000
	SRAM_ClearMark = $6ffb


{ ; ram zero page (no audio)

    r_pointerQueue = $000008
    r_temp_Xpos = $00000A
    r_tempCurrGroup = $00000C
    r_tempCurrSection = $00000D
    r_tempCurrRoomIdx = $00000E
    r_roomSectionChrBanksDataOffset = $00000F
    r_index = $000010
    r_collisionPointYinScreen = $000011
    r_collisionPointXvalDiv32 = $000012
    
	r_collisionPointAbsoluteXInRoom = $000013
	r_collisionPointAbsoluteXRoom = $000014
    r_15 = $000015
    
	r_bossState__12 = $000012
	r_bossScript__13 = $000013
	r_bossScript__14 = $000014
	r_bossScript__15 = $000015
	
	r_coreLoadingFuncAddr = $000016
    r_gameState = $000018
    r_gameSubstate = $000019
    r_frameCount = $00001A
    r_NMI_readyFlag = $00001B
    r_counter_ShowSprBg = $00001C
    r_sceneDrawQueue = $00001D
    r_RNG = $00001F
    r_spriteOffsetOAM = $000020
    r_PrgBank_8000 = $000021
    r_PrgBankBkup_8000 = $000022
    r_PrgBankBkup2_8000 = $000023
    r_snd = $000024
    r_updateNametable = $000025
    r_Joy1_t = $000026
    r_Joy2_t     = $000027
    r_Joy1Held_t = $000028
    r_Joy2Held_t = $000029
    r_gameTransition = $00002A
    r_pauseFlag = $00002B
    r_autoPlay = $00002C
    r_02e = $00002E
    r_GrantDefeated = $00002F
    r_timerGenerel = $000030
    r_stage = $000032
    r_blockLevel = $000033
    r_roomIdx = $000034
    r_lifes = $000035
    r_scoreLo = $000036
    r_scoreMid = $000037
    r_scoreHi = $000038
    r_039 = $000039
    r_partner = $00003A
    r_partnerIdx = $00003B
    r_HUD_healthPlayer = $00003C
    r_HUD_healthBoss = $00003D
    r_score4ExtraLive = $00003E
    r_IRQFuncIdx = $00003F
    r_IRQStatus = $000040
    r_IRQCmpVal = $000041
    r_scannlineTarget = $000042
    r_IRQScanlineCmpVal = $000043
    r_IRQFuncAddr = $000044
    r_CHR_BankSpr_0000 = $000046
    r_CHR_BankSpr_0400 = $000047
    r_CHR_BankSpr_0800 = $000048
    r_CHR_BankSpr_0c00 = $000049
    r_CHR_BankBG_0000 = $00004A
    r_CHR_BankBG_0400 = $00004B
    r_CHR_BankBG_0800 = $00004C
    r_CHR_BankBG_0c00 = $00004D
    r_CHR_BankSecondQuest_1400 = $00004E
    r_sceneAddr = $000050
    r_sceneAddrLeft = $000052
    r_sceneAddrRight = $000054
    r_sceneScrollOffsetLo = $000056
    r_sceneScrollOffsetHi = $000057
    r_subSceneOffsets = $000058
    r_TSA_blocksAddr = $00005D
    r_paletteAddr = $00005F
    r_VRAM_QueueDestLo = $000061
	r_VRAM_QueueDestHi = $000062
    r_TSA_blockAttri = $000063
    r_tranitionTimer = $000064
    r_scrollDirection = $000065
    r_roomOrientation = $000068			; 80 = verticle, 81 = top_to_bottom
    r_currRoomStairsDataAddr = $000069
    r_menuSelectIdx = $00006B
    r_entityID_processed = $00006C
    r_IRQFuncDrawIdx = $00006D
    r_scrollSpd = $00006E
    r_scrollStartOffsetLo = $00006F
    r_scrollStartOffsetHi = $000070
    r_scroolLock = $000071
    r_HUD_CHR_overwrite = $000072
    r_PrevRoomOrientation = $000073
    r_stageMusicResetFlag = $000074
    r_075 = $000075
    r_quarterSpawner_Xpos = $000076
    r_spawnerBlock = $000077
    r_bossActiveFlag = $000078
    r_roomEffect = $00007D
    r_lvlTimerLo = $00007E
    r_lvlTimerHi = $00007F
    r_invincableFrames = $000080
    r_damagePlayer = $000081
    r_currPartnerID = $000082
    r_hearts = $000084
    r_subweap = $000085
    r_subweapPartner = $000086
    r_subweapMultiplier = $000087
    r_subweapMultiplierPartner = $000088
    r_conveyaerRoomEffect = $00008B		; 06 cogGear, 0a left, 0b right 
    r_whipSparkTimer = $00008C
    r_roomInit = $00008D
    r_trevorWhipLevel = $00008E
    r_partnerWeaponLevel = $00008F
    r_knockBackDirrection = $000090
    r_ConveyorRelated = $000091
    r_CogProximity = $000093
    r_CogID = $000094
    r_CogSize = $000095
    r_TerrainPresent = $000096
    r_roomEntityDataAddrSpawner = $000098
    r_roomTerrainDataAddr = $00009A
    r_playerDirBKP = $0000A0
    r_playerDirBKP2 = $0000A1
    r_frameCounter = $0000A3
    r_0a4 = $0000A4
    r_collisionValIsForRightHalfOf32x16block = $0000A5
    r_partnerSwapDrawingBackup = $0000A6
    r_partnerSwapDrawingIRQPointer = $0000A7
    r_partnerSwapDrawingLatch = $0000A9
    r_partnerSwapStateBackup = $0000AA
    r_stopWatchActive = $0000AB
    r_stopWatchTimer = $0000AC
    r_potionTimer = $0000AD
    r_alucardBatTimer = $0000AE
    r_delayElevators = $0000AF
    r_defaultCHR = $0000B0
    r_bankLocationLoad = $0000B1
    r_rosseryFlashTimer = $0000B2
    r_bridgeTimer = $0000B3
    r_verticleRoomTileCounter = $0000B6
    r_powerUpDrop = $0000B7
    r_platformIDFrozenEnemy = $0000B8
    r_timerClunk_drop = $0000B9
    r_bossSpecialHitbox = $0000BA
    r_bossMeleeHitbox = $0000BB
    r_bossDopplegangerHitbox = $0000BC
    r_bossDragonKingHP = $0000BD
    r_bossDragonMisc = $0000BE
    r_deathDelay = $0000BF
    r_floodStop = $0000C0
    r_bossObject = $0000C1
    r_bossSecondFace = $0000C2
    r_bossSpawner = $0000C3
    r_disablePlayer = $0000C4
    r_autoWalkPlayer = $0000C6
    r_horizontalScrollLockBridge = $0000C8
    r_floodHight = $0000CA
    r_bossExtra = $CC	
	r_subweaponKillCount = $0000CE
    r_previousBackup88 = $0000CF
    r_HighestTileToCheckForCollisionsInVertRoom = $0000D0
    r_CogwheelIDbackup = $0000D2
    r_GrantCurrentYpos = $0000D3
    r_CogwheelID = $0000D4

    r_0f0 = $0000F0
    r_Joy1 = $0000F8
    r_Joy2 = $0000F9
    r_Joy1Held = $0000FA
    r_Joy2Held = $0000FB
    r_ScrollY = $0000FC
    r_ScrollX = $0000FD
    r_PPUMask = $0000FE
    r_PPUCtrl = $0000FF

}


{ ; ram entity 
	r_entity_ID 			= $54E  ; r_entity_ObjectIdxes		  
    r_entity_AI				= $5EF	
	r_entity_AI_IDX		 	= $5C1	
	r_entity_spriteGroup 	= $48C
	r_entity_spriteID 		= $400 	
	r_entity_PaletteOverride = $454
    r_entity_mask 			= $470	; 01 = ?? bg collusion off 
									; 02 = ice freeze
									; 04 = ?? collusion
									; 08 = collectable
									; 10 = no player collusion
									; 20 = no animation
									; 40 = movement 
									; 80 = no sprite 								   
	
	r_entity_FacingLeft 	= $4A8
    r_entity_FractionalX 	= $4C4
    r_entity_FractionalY 	= $4DB		
	r_entity_XPos 			= $438
	r_entity_YPos			= $41C    
	r_entity_Xspd 			= $4F2
    r_entity_XsubSpd 		= $509
    r_entity_Yspd 			= $520
    r_entity_YsubSpd 		= $537    

	
    r_subWe_HUD_IDX 		= $418
	r_subMulti_HUD_IDX 		= $419
	r_subWe_HUD_YPos 		= $434
    r_subWe_HUD_YPos_BKP 	= $435 
	r_subWe_HUD_XPos 		= $450
	r_subWeaHUD_attrib 		= $46c    
	r_subWeaHUD_Group 		= $4A4  ; r_subWe_CHRbank
	r_subMulti_CHRbank 		= $4A5	


	
	r_player_WhipID 		= $561
	r_player_subWeID_01 	= $562
	r_player_subWeID_02 	= $563
	r_player_subWeID_03 	= $564   
	r_Player_StateDoubled 	= $565
	r_player_AttackState 	= $578
    r_entity_AnimTimer 		= $57C
    r_entity_OamBaseOffset 	= $593
    r_entity_AnimGroup 		= $5AA
	r_player_stateBackup 	= $5D4
    r_entity_extra 			= $5D8
    r_candleDrop 			= $5E5
    r_stairsStuneTimer 		= $5EB
    r_boss_batRiverSwap 	= $602
    r_entity_target 		= $606
    r_subweaponMultikillCount = $61A
    r_damagActionFlag 		= $61D		; r_stairs_PixelToWalk
    r_miscTicker		 	= $61E
    r_weaponDamage 			= $630
    r_wubweaponDeflection 	= $631
    r_entity_Counter 		= $633
    r_Misc 					= $634
	r_misc_movementState	= $645		; pendalum left right, scale up down     
	r_entity_damage 		= $657		; r_candleActive
	r_entity_damageRelated	= $669    
	r_entity_Health 		= $67B
	r_player_WeaImpact		= $68D    	

}

    
{ ; ram audio 

    r_CurrInstrumentDataAddr = $0000E0
    r_SoundBankJumpAddr = $0000E2
    r_SoundBankTempVar1 = $0000E4
    r_SoundBankTempVar2 = $0000E5
    r_TempCurrInstrumentDataAddr = $0000E6
    r_SoundMetadataAddr = $0000E8
    r_SoundNumInstrumentsMinus1 = $0000EA
    r_SoundDataBank = $0000EB
    r_SoundFrequency = $0000EC
    r_CurrInstrumentIdx = $0000EE
    r_SoundToPlay = $0000EF
	
	r_InstrumentsFramesUntilNextByteProcessed = $000100
    r_InstrumentsSoundIdxes = $000107
    r_InstrumentsSpeedCtrler_todo = $00010E
    r_SoundControlByte = $000115
    r_SoundCtrsForLastLoop = $00011C
    r_InstrumentData_lo = $000123
    r_InstrumentData_hi = $00012A
    r_LoopToAddr_lo = $000131
    r_LoopToAddr_hi = $000138
    r_AudioChannelCodaAddressLowByte = $00013F
    r_AudioChannelCodaAddressHighByte = $000146
    r_InstrumentLastFreq_hi = $00014D
    r_AudioChannelVolum = $000154
    r_PauseSoundPlayed = $000167
    r_AudioChannelAttributesDuty = $00016E
    r_InstrumentFrequencyAdjust = $000173
    r_InstrumentLastFreq_lo = $000178
    r_OctaveIncreasedBy5minusThis = $00017D
    r_InstrumentFrequency_lo = $000183
    r_InstrumentFrequency_hi = $000186
    r_InstrumentEnvelope1Idx = $000189
    r_CurrInstrumentHwRegOffset = $00018C
    r_SoundCounterForGlobalDelayFrames = $00018D
    r_SoundGlobalDelayFrames = $00018E
    r_SoundShouldSkipDecDelayBytes = $00018F
    r_AudioSFXSquareSweep = $000190
    r_CurrentlyPlayingDMCSoundIdx = $000192
    r_AudioTriangleStaccatoTimer = $000193
    r_InstrumentDataBanks = $000195
    r_AudioSFXSquare1SweepWriteTo4001 = $00019C
    r_StackEnd = $0001FF
    r_Oam = $000200
    r_VramQueue = $000300
    r_AudioChannelVolumeEnvelopeDuration = $0003C0
    r_AudioChannelVolumeEnvelopePosition = $0003C3
    r_AudioChannelVolumeEnvelopeLoopCount = $0003C6
    r_AudioChannelVolumeEnvelopeLoopPoint = $0003C9
    r_AudioChannelFadeoutPoint = $0003CC
    r_AudioChannelVolumeEnvelope = $0003CF
    r_AudioChannelNextFadeDuration = $0003D2
    r_AudioChannelFadeDuration = $0003D5
    r_AudioChannelAlternateDutyCycle = $0003D8
    r_AudioChannelNextPitchbendDuration = $0003DB
    r_AudioChannelPitchbendDuration = $0003DE
    r_AudioChannelSweepRate = $0003E1
    r_3e4 = $0003E4


	r_InstrumentEnvelopeLoopToIdx = $0006A0
    r_InstrumentsCurrEnvelopeInUse = $0006A3
    r_InstrumentsEnvelopeIdx = $0006A6
    r_InstrumentsCurrEnvelopeLoops = $0006A9
    r_TimeSpecialDMCSoundPlayed = $0006C8
    r_sound_musicStop = $0006C9
}
 
    r_collisionMap = $0006E0
    r_collisionTypeCHR400 = $000770
    r_collisionTypeCHR800 = $000778
    r_soundModeSongSelected = $000780
    r_animTimerBG_CHR = $000781
    r_FogParallelPos = $000782
    r_EffectSpeedGeneral = $000784
    r_EffectSpeedSupGeneral = $000785
    r_PW_iconGeneral = $000786
    r_PW_dumpGeneral = $000788
    r_cinematicTimer = $00078A
    r_stackedBreakableWall = $0007B1
    r_LowerBlockBroken = $0007B3
    r_UpperBlockBroken = $0007B5
    r_breakAbleBlock = $0007B7
    r_spawnerID = $0007C2			; the enemy tracker value will be stored here
    r_spawner_var7c8 = $0007C8		; lower half byte is for r_spawnerID indexing
    r_spawner_var7ce = $0007CE
    r_spawnerYCoord = $0007D4
    r_spawnerXCoord = $0007DA
    r_spawnerOffScreenStatus = $0007E0
    r_spawner_var7e6 = $0007E6
    r_bossPieces = $0007EC 			; r_bossBoneDragonKingRips
    r_orb_statesGlobal = $7ED
	r_bossProgress = $7EE
	r_hardMode = $0007F6
    r_orb_flagsTimer = $7F3
	r_7f7 = $0007F7
	r_playerName = $7F8                
 
}

{ ; common routines 	

	bank_80 = $8000								; IDX value current bank loaded			
	
	swapPRGbankStore = $E2E6					; e000 common 
	swapPRGbank = $E2E8	 	
	lunchMusic = $E25F
	playerCollusionCheck = $FCDD
	jumpFromStack = $E886
	jumpFromStackYXpreserved = $E86D
	clearAllEntitySprite = $EF57				; !!FIXME clears slot sprite group 
	setMovmentSpdZero = $FEC8					; clear speed
	updateQueueWithNumber = $E8FC
	runRAM_00_inBankA = $E62F
	clearEntityAll = $FED7						; resets animation 	
	findEmptyEntitySlot = $FEB9
	getCollusionBasedOnOffset = $FC1E	
	setSpriteAndAnimGroup_AY = $EF5C			
	setAnimGroup_A = $EF60  					
	setSpriteAndAnimGroup_AY_update = $EF6E						
	stopScanlineIRQ = $E13A
    wait_X_cycles = $E001
	
	
	subHeart_A = $E748 
	addHeart_A = $E753
	mainUpdateHeartCount_HUD = $E760
	updateSpriteAnimFrame = $EF73
	updateSpriteLoop = $EF75
	updateVRAM_1 = $E8B5
	updateVRAM_2 = $E8AF
	endVRAM_queue = $E8DE
	screenLoad_A_CHR = $ECE9          		; hijack with fast loader patch.asm 
	
	X_setBank4Load_A = $ECDC				; !!use for LDX #BA LDA #$1D
	screenLoad_X_bank_A_IDX = $ECF6			; just for ending 
	
	updateVRAMqueue_fromBank = $ED03		 
	getIDX_storeByteVramQueue = $ED14
	closeVramQueue = $ED12
	drawBlock_Y_Bank80 = $E9B3
	storeByteVramQueue = $ED16
	
	restorePRG = $E67F
	runRAM_00_inBank9_IDX_0EtoA = $E641		; bosses	
	
	
	enemyCHR000_Bank2REG = $E352
	enemyCHR800_Bank2REG = $E342
	updateCHR_enemyCHR = $E33C
	BG_CHR_Bank2REG = $E35D
	updateBG_CHR_IRQ = $E36D
	backupCurrBank_endIRQ = $E13F
	
	
	runRAM_00_inBank9 = $E62D			; e000 less common    
	collusion_stuff_bank80 = $E935
	pushCurBankGo9 = $FF40				; bosses 	
	backupCurrent_bank_swap_00 = $E5D3	; bosses 
	goBank_death2thFormSkull_D = $FF6D	
	stackRestoreBank = $E63D	
	
	end_RLE_decompRoutine = $ED66
	setPPU2_Load = $E182        		                                   			                                              
	backupPRGSwap = $E2E0                                                                                                                                                                                                                                                                                      
	increasePointerOffset00_withA = $E899  	
	initSound = $E227
	unsetAutoPlayFlag = $E5CA	
	setAutoPlayFlag = $E5CE
	updateAnimGroupSetOneFrame = $EF4A
	changePalette_frozen = $FF8A	
	pushCurBankGo6 = $FF30
	getCollectableData = $FFAA		
	BG_hitboxRoutine = $E611
	stopWatchMain = $E7B6
	bossCode_bank8 = $E604
	initBoss_setSoundBank = $E2D6 
	moreBossInitStuff = $FFBA
	loadBank_9_doRam16 = $FBCF
	loadBank_E_doRam16 = $FBD3
	mamaBat_bossRoutine = $E6A5		
	clearZeroPage_26 = $E824
	storeGameState_zeroSub = $E574
	clearScreen_E4 = $EBFD
	gameState_00_intro = $E3A2	
	gameState_0b_showPassword = $E553;
	loadScreen_decompress = $EC04	;
	screenLoadRoutine01 = $EBD5		; 	namescreen related 	


	CODE_0FE593 = $E593				;	namescreen related
	CODE_0FFBAF = $FBAF				;   namescreen related
	CODE_0FFBA4 = $FBA4 			; 	namescreen related 	
	CODE_0FE5A0 = $E5A0				; 	boss stuff 	
	CODE_0FE5BF = $E5BF				; 	boss stuff 
	CODE_0FFF50 = $FF50				; 	boss stuff 
	CODE_0FE61E = $E61E				; 	boss stuff 
	CODE_0FE777 = $E777				;	likely CHR stuff bank 0	
	CODE_0FE76C = $E76C				; 	likely CHR stuff bank 0		
	CODE_0FE7AB = $E7AB				;	multiplayer related 
	CODE_0FE7CC = $E7CC				;   rossery related 	
	CODE_0FFF7A = $FF7A				;	rossery bit 2??
	CODE_0FE7DC = $E7DC					
	CODE_0FFBE8 = $FBE8
	CODE_0FE7C1 = $E7C1					
	CODE_0FFE9C = $FE9C 
	CODE_0FE69A = $E69A
	CODE_0FE6D4 = $E6D4
	CODE_0FE6DF = $E6DF
	CODE_0FE199 = $E199
	CODE_0FFB89 = $FB89
	CODE_0FFB85 = $FB85	
	getCollusion_IDX = $FC16


	OAM_attribTableFF = $FD4C    
	DATA8_0FFD58 = $FD58
	DATA8_0FFDC2 = $FDC2					; some_indexData X	
	entity_YsubSpd_data = $FD81
	
	bank_levelBlockScene = $C94B			; bank C000-DFFF

	getCurrRoomsChrBanks = $8013 			; bank 00
	getStageCHR_enemy = $859E				; bank 00
	
	
	
	; -- sram code summery -----------------------
	; getDistance_yPos
	; getDistance_xPos
	; showHUDnumber_addressInY
	; decelarate_xSpeed
	; acelarate_xSpeed
	; decelarate_ySpeed	
	; acelarate_ySpeed	
	; currentScreenBoundry

	; ---------------------------------------------

	
} 

{ ; macro

macro phxya()
	pha 
	tya 
	pha
	txa 
	pha 	
endmacro

macro plxya()
	pla 
	tax 
	pla 
	tay 
	pla 
endmacro


;macro org(bank, offset)
;    org $10+((<offset>-$8000)%$2000)+($2000*<bank>)
;    base <offset>
;endmacro	


macro jsl(bankValue, address)	
		lda.b #<address>		; %jsl ($96,collectItem)				
		sta $00 
		lda.b #<address>>>8
		sta $01
		lda #<bankValue>
		jsr runRAM_00_inBankA
endmacro

macro jml(bankValue, address)	
		lda.b #<address>		; %jml ($96,collectItem)				
		sta $00 
		lda.b #<address>>>8
		sta $01
		lda #<bankValue>
		jmp runRAM_00_inBankA
endmacro


}



; !not added yet
; r_IRQFuncAddrHi = $45
; r_secretIDX = $78d
; r_wall_secretFlag = $791
; r_tempWallColProcessing_00 = $793
; r_tempWallColProcessing_00 = $795
; r_tempWallColProcessing_En = $79f

; 780.. password stuff 
; 790-79f password 
; 7ef, uslessTransitionStuff,


{ ; -- add hardware defines 

PPUCTRL = $2000
PPUCTRL_NMI_ON = $80
PPUCTRL_COLOR_ON_EXT_PINS = $40
PPUCTRL_SPR_16 = $20
PPUCTRL_BG_1000 = $10
PPUCTRL_SPR_1000 = $08
PPUCTRL_PPUDATA_INC_DOWN = $04
PPUCTRL_PPUDATA_INC_RIGHT = $00
PPUCTRL_NT_BASE = $03

PPUMASK = $2001
PPUMASK_EMP_BLUE = $80
PPUMASK_EMP_GREEN = $40
PPUMASK_EMP_RED = $20
PPUMASK_SHOW_SPR = $10
PPUMASK_SHOW_BG = $08
PPUMASK_SPR_LEFT_8PX = $04
PPUMASK_BG_LEFT_8PX = $02
PPUMASK_GREYSCALE = $01

PPUSTATUS = $2002
OAMADDR = $2003
PPUSCROLL = $2005
PPUADDR = $2006
PPUDATA = $2007
OAMDMA = $4014

; for instances where any channel is referenced
SND_VOL = $4000
SND_SWEEP = $4001
SND_FREQ_LO = $4002
SND_FREQ_HI = $4003
LENGTH_COUNTER_LOAD = $f8

SQ1_VOL = $4000
SQ1_SWEEP = $4001
SQ1_LO = $4002
SQ1_HI = $4003
SQ2_VOL = $4004
SQ2_SWEEP = $4005
SQ2_LO = $4006
SQ2_HI = $4007
TRI_LINEAR = $4008
TRI_LO = $400a
TRI_HI = $400b
NOISE_VOL = $400c
NOISE_LO = $400e
NOISE_HI = $400f
DMC_FREQ = $4010
DMC_RAW = $4011
DMC_START = $4012
DMC_LEN = $4013
SND_CHN = $4015
SNDENA_DMC = $10
SNDENA_NOISE = $08
SNDENA_TRI = $04
SNDENA_SQ2 = $02
SNDENA_SQ1 = $01
APU_FRAME_CTR = $4017


NAMETABLE0 = $2000
INTERNAL_PALETTES = $3f00

; MMC5
PCM_MODE = $5010

PRG_MODE = $5100
PRG_MODE_16_8_8 = $02

CHR_MODE = $5101
EXTENDED_RAM_MODE = $5104

; nametable bits - DDCCBBAA
; 00 - vram page 0
; 01 - vram page 1
; 10 - internal expansion ram (unused due to 5104 unset)
; 11 - fill mode data (unused due to 5106/5107 unset)
NAMETABLE_MAPPING = $5105
NT_VERTICAL_MIRROR = $44 ; %01000100
NT_HORIZONTAL_MIRROR = $50 ; %01010000
NT_SINGLE_SCREEN_CIRAM_1 = $55 ; %01010101
NT_ALL_MODES_HORIZONTAL_MIRROR = $d8; %11011000
NT_ALL_MODES_VERTICAL_MIRROR = $e4 ; %11100100
NT_SINGLE_SCREEN_FILL_MODE = $ff ; %11111111

}



{ ; notes 

;	-- IDs used in spawnerData 
; 00 = 			
; 01 = zombie
; 02 = zombieGround
; 03 = medusa
; 04 = wingedDeamon
; 05 = boss_skullKing
; 06 = boss_zyklobs
; 07 = boss_grant
; 08 = smallLighning
; 09 = boss_
; 0A = boss_  
; 0B = hunchback
; 0C = 
; 0D = sleepBat
; 0E = bonePillar
; 0F = axeKnight
; 10 = bird 
; 11 = skellySword
; 12 = fishmanJump
; 13 = skellyWhipRed
; 14 = eye
; 15 = slimBlob
; 16 = skellyBone
; 17 = skellyWhip
; 18 = ghost
; 19 = skellyRed
; 1A = mummy
; 1B = bossBat
; 1C = bossAlucard
; 1D = ??
; 1E = bossMedusa
; 1F = bossVipers
; 20 = bossSpawner_duo_trio
; 21 = bossMonster
; 22 = ??
; 23 = bossDeath
; 24 = bossDopleGanger
; 25 = bossSpawner_duo_trio
; 26 = bossDracula
; 27 = bird2
; 28 = headlessKnight
; 29 = spider
; 2A = 
; 2B = 2ndQuestBat??
; 2C = 2ndQuestFuzzy??
; 2D = floadJelly
; 2E = jelly
; 2F = 
; 30 = 
; 31 = 
; 32 = 
; 33 = 
; 34 = 
; 35 = 
; 36 = convyerLeftMid
; 37 = 
; 38 = 
; 39 = convyerLeftLow
; 3A = ??
; 3B = 
; 3C = ??
; 3D = 
; 3E = ??
; 3F = flamMan
; 40 = knight
; 41 = bonePillar2_3Shot
; 42 = leftDoorExit2
; 43 = boneDragonLeft
; 44 = owl
; 45 = fuzzy
; 46 = harpy
; 47 = bat2
; 48 = ??
; 49 = skellySword2
; 4A = 
; 4B = ghostLateSpawn
; 4C = leftDoorExit
; 4D = 
; 4E = 
; 4F = 
; 50 = 
; 51 = 
; 52 = wingedDeamonFromBehind
; 53 = 
; 54 = 
; 55 = 
; 56 = 
; 57 = 
; 58 = 
; 59 = 
; 5A = 
; 5B = 
; 5C = 
; 5D = 
; 5E = 
; 5F = 
; 60 = 
; 61 = 
; 62 = 
; 63 = 
; 64 = 
; 65 = 
; 66 = 
; 67 = 
; 68 =
; 69 = 
; 6A = 
; 6B = 
; 6C = 
; 6D = 
; 6E = 
; 6F = 
; 70 = 
; 71 = 
; 72 = 
; 73 = 
; 74 = 
; 75 = 
; 76 = 
; 77 = 
; 78 = 
; 79 = 
; 7A = 
; 7B = 
; 7C = 
; 7D = 
; 7E = 
; 7F = 



; enemyID_zombie_02            
; enemyID_zombieGr_04          
; enemyID_raven_06             
; enemyID_raven_08             
; enemyID_bat_0A               
; enemyID_sleepingBat_0C       
; enemyID_medusa_0E            
; enemyID_ghost_10             
; enemyID_skeletonBone_12      
; enemyID_skeletonWhip_14      
; enemyID_eyeFloat_16          
; enemyID_shroomFloat_18       
; enemyID_wingDeamon_1A        
; enemyID_fleaMan_1C           
; enemyID_slim_1E              
; enemyID_skeletonSword_20     
; enemyID_axeKnight_22         
; enemyID_bonePillar3_24       
; enemyID_skeletonWalk_26      
; enemyID_fishMan_28           
; enemyID_flame_2A             
; enemyID_mummy_2C             
; enemyID_skeletonRed_2E       
; enemyID_spark_30             
; entity_RTS_19_stub           
; enemyID_mummyCrumbl_34       
; enemyID_skeletonCrumbl_36    
; enemyID_splash_38            
; enemyID_headlessKnight_3A    
; enemyID_spider_3C            
; enemyID_bonePillarTwo_3E     
; enemyID__40                  
; enemyID_shroomFloat_42       
; enemyID_skeletonRedWhip_44   
; enemyID_shroomGround_46      
; enemyID_shroomGround_48      
; enemyID_zombieSide_4A        
; enemyID_mudMan_4C            
; enemyID_frog_4E              
; enemyID_fishManSwim_50       
; enemyID_fireMan_52           
; enemyID_fishManSwimJump_54   
; enemyID_splash_56            
; enemyID_knight_58            
; enemyID_boneDragonHead_5A    
; enemyID_boneDragonRip_5C     
; enemyID_boneDragonBase_5E    
; enemyID_bonePillar3_60       
; enemyID_candle_62            
; enemyID_candle_62            
; enemyID_lantern_66           
; enemyID_zombieSide_68        
; enemyID__6A                  
; enemyID__6C                  
; enemyID__6E                  
; enemyID__70                  
; enemyID__72                  
; enemyID__74                  
; enemyID__76                  





}