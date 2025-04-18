; options 

  !expandPRG =  1     ; most patches will not work without expansion 
  !expandCHR =  1
  !sRAM = 1

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


    SUBWE_AXE = $01              
    SUBWE_CROSS = $02      
    SUBWE_DAGGER = $03      
    SUBWE_HOLYW = $04      
    SUBWE_FLAME = $05      
    SUBWE_FREEZ = $06      
    SUBWE_ORB = $07      
    SUBWE_GRANT_DAGGER = $08      
    SUBWE_GRANT_AXE = $09      
    SUBWE_ALUCARD = $0A    
    SUBWE_CLOCK = $0B      
    SUBWE_DO_0 = $0C      
    SUBWE_DO_1 = $0D      


  { ; -- enemy defines 
  
      {  ; -- AI routine defines  
      !AI_IDX_waitScript                                 = $00        
      !AI_IDX_stopHurtAndMov_01                          = $01
      !AI_IDX_spawn4Spore_02                             = $02
      !AI_IDX_remove88_effect_03                         = $03
      !AI_IDX_setScript01_04                             = $04
      !AI_IDX_facePlayer_05                              = $05
      !AI_IDX_getSpriteFromID_06                         = $06
      !AI_IDX_getSprite_07                               = $07
      !AI_IDX_randomDelay_script4_08                     = $08
      !AI_IDX_spawnPos_09                                = $09
      !AI_IDX_add88_effect_0A                            = $0A
      !AI_IDX_getSpritFromScript_0B                      = $0B
      !AI_IDX_findPlayerXposTrigger_0C                   = $0C
      !AI_IDX_spawnAtPos_Yscript_0D                      = $0D
      !AI_IDX_screenBorderDespawn_0e                     = $0E
      !AI_IDX_nearPlayerTrigger_0f                       = $0F
      !AI_IDX_seekGround_10                              = $10
      !AI_IDX_fallSpeed_Yscript_Delay_11                 = $11
      !AI_IDX_homePlayerYpos_12                          = $12
      !AI_IDX_setSpriteAnim_13                           = $13
      !AI_IDX_lighning_14                                = $14
      !AI_IDX_lightning_15                               = $15
      !AI_IDX_setNoCollusion_16                          = $16
      !AI_IDX_setNoCollution_17                          = $17
      !AI_IDX_setScriptWait_18                           = $18
      !AI_IDX_RTS_19                                     = $19
      !AI_IDX_addScript2_rExtra_1a                       = $1A
      !AI_IDX_dec_rExtra2_advance_1b                     = $1B
      !AI_IDX_zombieGround_1c                            = $1C
      !AI_IDX_zombi_script2Target_1d                     = $1D
      !AI_IDX_addSpeedFromScript_1e                      = $1E
      !AI_IDX_setDelay_1f                                = $1F
      !AI_IDX_getRandomDelay_20                          = $20
      !AI_IDX_hunchBackJump_21                           = $21
      !AI_IDX_setXposOffsets_22                          = $22
      !AI_IDX_paletteOverwrite_23                        = $23
      !AI_IDX_facePlayerWithDelay_24                     = $24
      !AI_IDX_spawnFireBall_scriptDelay_25               = $25
      !AI_IDX_addDamage_26                               = $26
      !AI_IDX_clearEnemy_27                              = $27
      !AI_IDX_axeArmorWalk_28                            = $28
      !AI_IDX_axeArmorAI_29                              = $29
      !AI_IDX_startHurtAndMov_2a                         = $2A
      !AI_IDX_turn_2b                                    = $2B
      !AI_IDX_throwAxe_2c                                = $2C
      !AI_IDX_stopMoveHurtAnim_2d                        = $2D
      !AI_IDX_sinkIntoGround_2e                          = $2E
      !AI_IDX_findGround_2f                              = $2F
      !AI_IDX_script2Pallete_30                          = $30
      !AI_IDX_bone_scriptWaight_32                       = $32
      !AI_IDX_skellyFall_33                              = $33
      !AI_IDX_skellyWalkBump_34                          = $34
      !AI_IDX_skellyWalkJump_35                          = $35
      !AI_IDX_seekPlayer_36                              = $36
      !AI_IDX_itemCollect_37                             = $37
      !AI_IDX_waitTillDisapear_38                        = $38
      !AI_IDX_fallSpeed_fromScript_39                    = $39
      !AI_IDX_script_sprite_SpdX_3a                      = $3A
      !AI_IDX_walkCol_3b                                 = $3B
      !AI_IDX_blobScript_delay_scriptIDX_3c              = $3C
      !AI_IDX_moveUp_3d                                  = $3D
      !AI_IDX_startFalling_3e                            = $3E
      !AI_IDX_slime_3f                                   = $3F
      !AI_IDX_slimeJumpPlayer_40                         = $40
      !AI_IDX_slimUp_41                                  = $41
      !AI_IDX_slimeApperTop_scriptYspd_42                = $42
      !AI_IDX_scriptYspd_YspdSub_43                      = $43
      !AI_IDX_clearEntityBottom_44                       = $44
      !AI_IDX_crumble_script2damageFlag_45               = $45
      !AI_IDX_skellyHit_46                               = $46
      !AI_IDX_bird_47                                    = $47
      !AI_IDX_birdWait_48                                = $48
      !AI_IDX_birdMovement_49                            = $49
      !AI_IDX_startMov_hurt_4a                           = $4A
      !AI_IDX_followPlayer_4d                            = $4D
      !AI_IDX_blockPalFix_4e                             = $4E
      !AI_IDX_candleItemSpawn_4f                         = $4F
      !AI_IDX_spiderString_50                            = $50
      !AI_IDX_spiderSetStartPosY_51                      = $51
      !AI_IDX_shootSpiderling_52                         = $52
      !AI_IDX_addPlayerColu_53                           = $53
      !AI_IDX_removePlayerColu_54                        = $54
      !AI_IDX_addDamage_55                               = $55
      !AI_IDX_spiderLingSeek_56                          = $56
      !AI_IDX_ghostSeek_57                               = $57
      !AI_IDX_fallSpeed_Yscript_action_Delay_58          = $58
      !AI_IDX_homePlayerY_timed_59                       = $59
      !AI_IDX_sporeDecend_5a                             = $5A
      !AI_IDX_frogSit_5b                                 = $5B
      !AI_IDX_frog_jump_5c                               = $5C
      !AI_IDX_zombie_setYPos_5d                          = $5D
      !AI_IDX_mudMan_5e                                  = $5E
      !AI_IDX_mudMan_disapear_5f                         = $5F
      !AI_IDX_fishman_goWater_60                         = $60
      !AI_IDX_fishman_landScript_col_61                  = $61
      !AI_IDX_scriptAddXY_offset_62                      = $62
      !AI_IDX_fishman_script_JumpSpd_target_63           = $63
      !AI_IDX_fishmanJump_scriptFlag_64                  = $64
      !AI_IDX_fishManWater_65                            = $65
      !AI_IDX_fishman_66                                 = $66
      !AI_IDX_fishman_67                                 = $67
      !AI_IDX_spawn_scriptEntity_68                      = $68
      !AI_IDX_setFlagTargetFromSctipt_69                 = $69
      !AI_IDX_smallHeartFall_6a                          = $6A
      !AI_IDX_knight_groundCheck_6b                      = $6B
      !AI_IDX_lunchSound_6c                              = $6C
      !AI_IDX_fallTillGroundSmall_6d                     = $6D
      !AI_IDX_bonePillar_6e                              = $6E
      !AI_IDX_sleepBat_scriptYspd_target_6f              = $6F
      !AI_IDX_sleepBat_scriptYSpd_70                     = $70
      !AI_IDX_collectItemAir_71                          = $71
      !AI_IDX_RTS_72                                     = $72
      !AI_IDX_fallSpeed_Yscript_action_Delay_73          = $73
      !AI_IDX_fallSpdWithFlags_74                        = $74
      !AI_IDX_RTS_75                                     = $75
      !AI_IDX_boneDragonHead_76                          = $76
      !AI_IDX_boneDragonHead_77                          = $77
      !AI_IDX_boneDragonHead_78                          = $78
      !AI_IDX_boneDragonRip_79                           = $79
      !AI_IDX_frameSwitch_7a                             = $7A
      !AI_IDX_addScript2_rCounter_7b                     = $7B
      !AI_IDX_giveScriptAI_IDX_7c                        = $7C
      !AI_IDX_owl_7d                                     = $7D
      !AI_IDX_owl_7e                                     = $7E
      !AI_IDX_xSpd_distanceBased_7f                      = $7F
      !AI_IDX_owl_initDive_80                            = $80
      !AI_IDX_owl_arc_81                                 = $81
      !AI_IDX_owl_clear_82                               = $82
      !AI_IDX_owl_stop_83                                = $83
      !AI_IDX_fuzzy_84                                   = $84
      !AI_IDX_fuzzy_85                                   = $85
      !AI_IDX_fuzzy_86                                   = $86
      !AI_IDX_showCash_87                                = $87
      !AI_IDX_boneDragonRip_88                           = $88
      !AI_IDX_frog_89                                    = $89
      !AI_IDX_frog_8a                                    = $8A
      !AI_IDX_setSpriteAnim_8b                           = $8B
      !AI_IDX_setSpriteAnimFromTable_8c                  = $8C
      !AI_IDX_spriteFixStage5_8d                         = $8D
      !AI_IDX_ghost_8e                                   = $8E
      !AI_IDX_axeArmor_8f                                = $8F
      !AI_IDX_fishMan_nearPlayerCount_90                 = $90
      !AI_IDX_enableCol_turnAround_91                    = $91
      !AI_IDX_harpyHunchBackSpawn_92                     = $92
      !AI_IDX_hunchBack_93                               = $93
      !AI_IDX_hunchBack_94                               = $94
      !AI_IDX_spriteSmallTable_95                        = $95
      !AI_IDX_spiderTrailer_96                           = $96
      !AI_IDX_attack_97                                  = $97
      !AI_IDX_attack_98                                  = $98
      !AI_IDX_attack_scriptFlag_99                       = $99
      !AI_IDX_spider_disappear_9a                        = $9A
      !AI_IDX_spiderString_9b                            = $9B
      !AI_IDX_medusa_9c                                  = $9C
      !AI_IDX_medusa_9d                                  = $9D
      !AI_IDX_fallTillBottomSplash_9e                    = $9E
      !AI_IDX_findPlayerYpos_9f                          = $9F
      !AI_IDX_clearAtFloatHight_stage8_A0                = $A0
      !AI_IDX_fallTillGroundLarge_A1                     = $A1
      !AI_IDX_shutterCrumbs_A2                           = $A2
      !AI_IDX_crumble_A3                                 = $A3
      !AI_IDX_fuzzyFall_A4                               = $A4
      !AI_IDX_setSpriteAnim__A5                          = $A5
      !AI_IDX_frogAppear_A6                              = $A6
      !AI_IDX_addDamage_A7                               = $A7
      !AI_IDX_fallSpeed_Yscript_action_Delay_A8          = $A8
      !AI_IDX_spiderWeb_NEW_A9                           = $A9
  
  }
  
      {  ; -- what else should be defined?? bosses, sprites, spawners..
      
      }
  
  }
  

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
  
      r_pointerQueue = $08
      r_temp_Xpos = $0A
      r_tempCurrGroup = $0C
      r_tempCurrSection = $0D
      r_tempCurrRoomIdx = $0E
      r_roomSectionChrBanksDataOffset = $0F
      r_index = $10
      r_collisionPointYinScreen = $11
      r_collisionPointXvalDiv32 = $12
      
      r_collisionPointAbsoluteXInRoom = $13
      r_collisionPointAbsoluteXRoom = $14
      r_15 = $15
      
      r_bossState__12 = $12
      r_bossScript__13 = $13
      r_bossScript__14 = $14
      r_bossScript__15 = $15
    
      r_coreLoadingFuncAddr = $16
      r_gameState = $18
      r_gameSubstate = $19
      r_frameCount = $1A
      r_NMI_readyFlag = $1B
      r_counter_ShowSprBg = $1C
      r_sceneDrawQueue = $1D
      r_RNG = $1F
      r_spriteOffsetOAM = $20
      r_PrgBank_8000 = $21
      r_PrgBankBkup_8000 = $22
      r_PrgBankBkup2_8000 = $23
      r_snd = $24
      r_updateNametable = $25
      r_Joy1_t = $26
      r_Joy2_t     = $27
      r_Joy1Held_t = $28
      r_Joy2Held_t = $29
      r_gameTransition = $2A
      r_pauseFlag = $2B
      r_autoPlay = $2C
      r_02e = $2E
      r_GrantDefeated = $2F
      r_timerGenerel = $30
      r_stage = $32
      r_blockLevel = $33
      r_roomIdx = $34
      r_lifes = $35
      r_scoreLo = $36
      r_scoreMid = $37
      r_scoreHi = $38
      r_039 = $39
      r_partner = $3A
      r_partnerIdx = $3B
      r_HUD_healthPlayer = $3C
      r_HUD_healthBoss = $3D
      r_score4ExtraLive = $3E
      r_IRQFuncIdx = $3F
      r_IRQStatus = $40
      r_IRQCmpVal = $41
      r_scannlineTarget = $42
      r_IRQScanlineCmpVal = $43
      r_IRQFuncAddr = $44
      r_IRQFuncAddrHi = $45
      r_CHR_BankSpr_0000 = $46
      r_CHR_BankSpr_0400 = $47
      r_CHR_BankSpr_0800 = $48
      r_CHR_BankSpr_0c00 = $49
      r_CHR_BankBG_0000 = $4A
      r_CHR_BankBG_0400 = $4B
      r_CHR_BankBG_0800 = $4C
      r_CHR_BankBG_0c00 = $4D
      r_CHR_BankSecondQuest_1400 = $4E
      r_sceneAddr = $50
      r_sceneAddrLeft = $52
      r_sceneAddrRight = $54
      r_sceneScrollOffsetLo = $56
      r_sceneScrollOffsetHi = $57
      r_subSceneOffsets = $58
      r_TSA_blocksAddr = $5D
      r_paletteAddr = $5F
      r_VRAM_QueueDestLo = $61
      r_VRAM_QueueDestHi = $62
      r_TSA_blockAttri = $63
      r_tranitionTimer = $64
      r_scrollDirection = $65
      r_roomOrientation = $68     ; 80 = verticle, 81 = top_to_bottom
      r_currRoomStairsDataAddr = $69
      r_menuSelectIdx = $6B
      r_entityID_processed = $6C
      r_IRQFuncDrawIdx = $6D
      r_scrollSpd = $6E
      r_scrollStartOffsetLo = $6F
      r_scrollStartOffsetHi = $70
      r_scroolLock = $71
      r_HUD_CHR_overwrite = $72
      r_PrevRoomOrientation = $73
      r_stageMusicResetFlag = $74
      r_075 = $75
      r_quarterSpawner_Xpos = $76
      r_spawnerBlock = $77
      r_bossActiveFlag = $78
      r_roomEffect = $7D
      r_lvlTimerLo = $7E
      r_lvlTimerHi = $7F
      r_invincableFrames = $80
      r_damagePlayer = $81
      r_currPartnerID = $82
      r_hearts = $84
      r_subweap = $85
      r_subweapPartner = $86
      r_subweapMultiplier = $87
      r_subweapMultiplierPartner = $88
      r_conveyaerRoomEffect = $8B   ; 06 cogGear, 0a left, 0b right 
      r_whipSparkTimer = $8C
      r_roomInit = $8D
      r_trevorWhipLevel = $8E
      r_partnerWeaponLevel = $8F
      r_knockBackDirrection = $90
      r_ConveyorRelated = $91
      r_CogProximity = $93
      r_CogID = $94
      r_CogSize = $95
      r_TerrainPresent = $96
      r_roomEntityDataAddrSpawner = $98
      r_roomTerrainDataAddr = $9A
      r_playerDirBKP = $A0
      r_playerDirBKP2 = $A1
      r_frameCounter = $A3
      r_0a4 = $A4
      r_collisionValIsForRightHalfOf32x16block = $A5
      r_partnerSwapDrawingBackup = $A6
      r_partnerSwapDrawingIRQPointer = $A7
      r_partnerSwapDrawingLatch = $A9
      r_partnerSwapStateBackup = $AA
      r_stopWatchActive = $AB
      r_stopWatchTimer = $AC
      r_potionTimer = $AD
      r_alucardBatTimer = $AE
      r_delayElevators = $AF
      r_defaultCHR = $B0
      r_bankLocationLoad = $B1
      r_rosseryFlashTimer = $B2
      r_bridgeTimer = $B3
      r_verticleRoomTileCounter = $B6
      r_powerUpDrop = $B7
      r_platformIDFrozenEnemy = $B8
      r_timerClunk_drop = $B9
      r_bossSpecialHitbox = $BA
      r_bossMeleeHitbox = $BB
      r_bossDopplegangerHitbox = $BC
      r_bossDragonKingHP = $BD
      r_bossDragonMisc = $BE
      r_deathDelay = $BF
      r_floodStop = $C0
      r_bossObject = $C1
      r_bossSecondFace = $C2
      r_bossSpawner = $C3
      r_disablePlayer = $C4
      r_autoWalkPlayer = $C6
      r_horizontalScrollLockBridge = $C8
      r_floodHight = $CA
      r_bossExtra = $CC 
      r_subweaponKillCount = $CE
      r_previousBackup88 = $CF
      r_HighestTileToCheckForCollisionsInVertRoom = $D0
      r_CogwheelIDbackup = $D2
      r_GrantCurrentYpos = $D3
      r_CogwheelID = $D4
  
      r_0f0 = $F0
      r_Joy1 = $F8
      r_Joy2 = $F9
      r_Joy1Held = $FA
      r_Joy2Held = $FB
      r_ScrollY = $FC
      r_ScrollX = $FD
      r_PPUMask = $FE
      r_PPUCtrl = $FF
  
  }
  
  
  { ; ram entity 
      r_entity_ID           = $54E  ; r_entity_ObjectIdxes      
      r_entity_AI           = $5EF  
      r_entity_AI_IDX       = $5C1  
      r_entity_spriteGroup  = $48C
      r_entity_spriteID     = $400  
      r_entity_PaletteOverride = $454
      r_entity_mask         = $470  ; 01 = ?? bg collusion off 
                    ; 02 = ice freeze
                    ; 04 = ?? collusion
                    ; 08 = collectable
                    ; 10 = no player collusion
                    ; 20 = no animation
                    ; 40 = movement 
                    ; 80 = no sprite                   
    
      r_entity_FacingLeft   = $4A8
      r_entity_FractionalX  = $4C4
      r_entity_FractionalY  = $4DB    
      r_entity_XPos         = $438
      r_entity_YPos         = $41C    
      r_entity_Xspd         = $4F2
      r_entity_XsubSpd      = $509
      r_entity_Yspd         = $520
      r_entity_YsubSpd      = $537    
  
    
      r_subWe_HUD_IDX       = $418
      r_subMulti_HUD_IDX    = $419
      r_subWe_HUD_YPos      = $434
      r_subWe_HUD_YPos_BKP  = $435 
      r_subWe_HUD_XPos      = $450
      r_subWeaHUD_attrib    = $46c    
      r_subWe_CHRbank       = $4A4 
      r_subMulti_CHRbank    = $4A5  
  
  
      r_player_WhipID       = $561
      r_player_subWeID_01   = $562
      r_player_subWeID_02   = $563
      r_player_subWeID_03   = $564   
      r_Player_StateDoubled = $565
      r_player_AttackState  = $578
      r_entity_AnimTimer    = $57C
      r_entity_OamBaseOffset = $593
      r_entity_AnimGroup    = $5AA
      r_player_stateBackup  = $5D4
      r_entity_extra        = $5D8
      r_candleDrop          = $5E5
      r_stairsStuneTimer    = $5EB
      r_boss_batRiverSwap   = $602
      r_entity_target       = $606
      r_subweaponMultikillCount = $61A
      r_damagActionFlag     = $61D    ; r_stairs_PixelToWalk
      r_miscTicker          = $61E
      r_weaponDamage        = $630
      r_wubweaponDeflection = $631
      r_entity_Counter      = $633
      r_Misc                = $634
      r_misc_movementState  = $645    ; pendalum left right, scale up down     
      r_entity_damage       = $657    ; r_candleActive
      r_entity_damageRelated = $669    
      r_entity_Health       = $67B
      r_player_WeaImpact    = $68D      
  
  
      r_collisionMap        = $6E0
      r_collisionTypeCHR400 = $770
      r_collisionTypeCHR800 = $778
      r_soundModeSongSelected = $780
      r_animTimerBG_CHR = $781
      r_FogParallelPos = $782
      r_EffectSpeedGeneral = $784
      r_EffectSpeedSupGeneral = $785
      r_PW_iconGeneral = $786
      r_PW_dumpGeneral = $788
      r_cinematicTimer = $78A
      r_secretIDX = $78d
      r_wall_secretFlag = $791
      r_tempWallColProcessing_00 = $793
      r_tempWallColProcessing_01 = $795
      r_tempWallColProcessing_En = $79f
      r_stackedBreakableWall = $7B1
      r_LowerBlockBroken = $7B3
      r_UpperBlockBroken = $7B5
      r_breakAbleBlock = $7B7
      r_spawnerID = $7C2     ; the enemy tracker value will be stored here
      r_spawner_var7c8 = $7C8    ; lower half byte is for r_spawnerID indexing
      r_spawner_var7ce = $7CE
      r_spawnerYCoord = $7D4
      r_spawnerXCoord = $7DA
      r_spawnerOffScreenStatus = $7E0
      r_spawner_var7e6 = $7E6
      r_bossPieces = $7EC      ; r_bossBoneDragonKingRips
      r_orb_statesGlobal = $7ED
      r_bossProgress = $7EE
      r_hardMode = $7F6
      r_orb_flagsTimer = $7F3
      r_7f7 = $7F7
      r_playerName = $7F8  
  
  }
  
      
  { ; ram audio 
  
      r_CurrInstrumentDataAddr = $E0
      r_SoundBankJumpAddr = $E2
      r_SoundBankTempVar1 = $E4
      r_SoundBankTempVar2 = $E5
      r_TempCurrInstrumentDataAddr = $E6
      r_SoundMetadataAddr = $E8
      r_SoundNumInstrumentsMinus1 = $EA
      r_SoundDataBank = $EB
      r_SoundFrequency = $EC
      r_CurrInstrumentIdx = $EE
      r_SoundToPlay = $EF
    
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
  
 
}


{ ; common routines   

    bank_80 = $8000                     ; IDX value current bank loaded     
    
    swapPRGbankStore = $E2E6            ; e000 common 
    swapPRGbank = $E2E8   
    lunchMusic = $E25F
    playerCollusionCheck = $FCDD
    jumpFromStack = $E886
    jumpFromStackYXpreserved = $E86D
    clearSpriteAndAnimGroup = $EF57        
    clearSpeed = $FEC8              
    updateQueueWithNumber = $E8FC
    runRAM_00_inBankA = $E62F
    clearAll_entitySlot = $FED7                  ; resets animation??  
    findEmptyEntitySlot = $FEB9
    getCollusionBasedOnOffset = $FC1E 
    setSpriteAndAnimGroup_AY = $EF5C      
    setAnimGroup_A = $EF60            
    setSpriteAndAnimGroup_AY_update = $EF6E           
    stopScanlineIRQ = $E13A
    wait_X_cycles = $E001
    changePalette_frozen = $FF8A
  
    subHeart_A = $E748 
    addHeart_A = $E753
    mainUpdateHeartCount_HUD = $E760
    updateSpriteAnimFrame = $EF73
    updateSpriteLoop = $EF75
    updateVRAM_1 = $E8B5
    updateVRAM_2 = $E8AF
    endVRAM_queue = $E8DE
    screenLoad_A_CHR = $ECE9              ; hijack with fast loader patch.asm 
  
    X_setBank4Load_A = $ECDC              ; !!use for LDX #BA LDA #$1D
    screenLoad_X_bank_A_IDX = $ECF6        ; just for ending 
    
    updateVRAMqueue_fromBank = $ED03     
    getIDX_storeByteVramQueue = $ED14
    closeVramQueue = $ED12
    drawBlock_Y_Bank80 = $E9B3
    storeByteVramQueue = $ED16
    
    restorePRG = $E67F
    runRAM_00_inBank9_IDX_0EtoA = $E641   ; bosses  
    
    
    enemyCHR000_Bank2REG = $E352
    enemyCHR800_Bank2REG = $E342
    updateCHR_enemyCHR = $E33C
    BG_CHR_Bank2REG = $E35D
    updateBG_CHR_IRQ = $E36D
    backupCurrBank_endIRQ = $E13F
    
    
    runRAM_00_inBank9 = $E62D             ; e000 less common    
    collusion_stuff_bank80 = $E935
    pushCurBankGo9 = $FF40                ; bosses  
    backupCurrent_bank_swap_00 = $E5D3     ; bosses 
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
    gameState_0b_showPassword = $E553 
    loadScreen_decompress = $EC04 ;
    screenLoadRoutine01 = $EBD5   ;   namescreen related  
  
  
    CODE_0FE593 = $E593       ; namescreen related
    CODE_0FFBAF = $FBAF       ;   namescreen related
    CODE_0FFBA4 = $FBA4       ;   namescreen related  
    CODE_0FE5A0 = $E5A0       ;   boss stuff  
    CODE_0FE5BF = $E5BF       ;   boss stuff 
    CODE_0FFF50 = $FF50       ;   boss stuff 
    CODE_0FE61E = $E61E       ;   boss stuff 
    CODE_0FE777 = $E777       ; likely CHR stuff bank 0 
    CODE_0FE76C = $E76C       ;   likely CHR stuff bank 0   
    CODE_0FE7AB = $E7AB       ; multiplayer related 
    CODE_0FE7CC = $E7CC       ;   rossery related   
    CODE_0FFF7A = $FF7A       ; rossery bit 2??
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
    DATA8_0FFDC2 = $FDC2          ; some_indexData X  
    entity_YsubSpd_data = $FD81
    
    bank_levelBlockScene = $C94B      ; bank C000-DFFF
  
    getCurrRoomsChrBanks = $8013      ; bank 00
    getStageCHR_enemy = $859E       ; bank 00
  
  
  
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
    lda.b #<address>    ; %jsl ($96,collectItem)        
    sta $00 
    lda.b #<address>>>8
    sta $01
    lda #<bankValue>
    jsr runRAM_00_inBankA
endmacro

macro jml(bankValue, address) 
    lda.b #<address>    ; %jml ($96,collectItem)        
    sta $00 
    lda.b #<address>>>8
    sta $01
    lda #<bankValue>
    jmp runRAM_00_inBankA
endmacro


}


{ ; hardware defines 


  { ; MMC5
    FILL_MODE_TILE =      $5106
    FILL_MODE_COLOUR =    $5107
    PRG_BANK_8000 =       $5115    
    PRG_BANK_c000 =       $5116
  
    CHR_BANK_0000 =       $5120   ; in 8x16 mode, the 1st 8 are for sprites, the next 4 for bg
    CHR_BANK_0400 =       $5121
    CHR_BANK_0800 =       $5122
    CHR_BANK_0c00 =       $5123
    CHR_BANK_1000 =       $5124
    CHR_BANK_1400 =       $5125
    CHR_BANK_1800 =       $5126
    CHR_BANK_1c00 =       $5127
    CHR_BANK_0000_1000 =  $5128
    CHR_BANK_0400_1400 =  $5129
    CHR_BANK_0800_1800 =  $512a
    CHR_BANK_0c00_1c00 =  $512b
    VERTICAL_SPLIT_MODE = $5200
    SCANLINE_CMP_VALUE =  $5203
    SCANLINE_IRQ_STATUS = $5204  

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
 
 
  { ; NES and Sound
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
      
}


}





{ ; notes 

; !not added yet

; 780.. password stuff 
; 790-79f password 
; 7ef, uslessTransitionStuff,



; -- IDs used in spawnerData 
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