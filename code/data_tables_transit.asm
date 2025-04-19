
; -- content ------------------
; IRQ effect table
; enemyHealth
; enemy_HitBox


; spawnerEntityAI Idxes (spawner stuff)
;------------------------------



{ ; IRQ effect table

org $01702              ;009730|        |      ;
base $9702
      %jml ($A0,mainTransite_3) 


assert pc() <= $97E1
pad $7E1
}


{ ; level transit tabels 



  pullPC 

    mainTransite_3:   
        jsr getCurrentLevelIDX
        lda.w roomEffect,x 
        sta.b r_roomEffect  
        
        rts 
{ ; new effect table
    roomEffect:
        db $00  ; 00            ; $10 Fog wide  
        db $00  ; 01                        ; $11 Fog bottom 
        db $00  ; 02                        ; $12 Fog high last stage
        db $00  ; 03                        ; $13 Fog low last stage 
        db $00  ; 04                        ; $20 ?? 
        db $00  ; 05                        ; $23
        db $00  ; 06                        ; $28 Blinking sprites 
        db $00  ; 07                        ; $30 Animation Water Freezable_00 with sound 
        db $40  ; 08                        ; $31 Animation Water Freezable_01 with sound 
        db $40  ; 09 !                      ; $32 Water/Mud Effect(flicker)
        db $40  ; 0a !                      ; $33 Water/Mud Effect(flicker)
        db $40  ; 0b                        ; $34 Water/Mud Effect(flicker)
        db $40  ; 0c                        ; $35 Water/Mud Effect(flicker)
        db $40  ; 0d                        ; $36 Water/Mud Effect(flicker)
        db $40  ; 0e                        ; $37 ??
        db $40  ; 0f                        ; $40 Animation only
        db $40  ; 10 !                      ; $41 Animation and Sound 
        db $40  ; 11 !                      ; $50 Water Splash
        db $40  ; 12                        ; $51 Water Splash
        db $40  ; 13                        ; $71 Rising Water
        db $40  ; 14                        ; $80 Falling Bridge 
        db $40  ; 15                        ; $81 Falling Bridge  
        db $40  ; 16 
        db $40  ; 17 !
        db $40  ; 18 !
        db $40  ; 19 
        db $00  ; 1a
        db $20  ; 1b
        db $51  ; 1c
        db $00  ; 1d
        db $10  ; 1e
        db $00  ; 1f
        db $11  ; 20
        db $00  ; 21
        db $00  ; 22
        db $00  ; 23
        db $00  ; 24
        db $00  ; 25
        db $00  ; 26
        db $00  ; 27
        db $00  ; 28
        db $00  ; 29
        db $00  ; 2a
        db $00  ; 2b
        db $00  ; 2c
        db $00  ; 2d
        db $00  ; 2e
        db $00  ; 2f
        db $00  ; 30
        db $00  ; 31
        db $00  ; 32
        db $00  ; 33
        db $00  ; 34
        db $00  ; 35
        db $00  ; 36
        db $00  ; 37
        db $00  ; 38
        db $00  ; 39
        db $30  ; 3a
        db $00  ; 3b
        db $00  ; 3c
        db $80  ; 3d
        db $51  ; 3e
        db $32  ; 3f
        db $33  ; 40
        db $34  ; 41
        db $37  ; 42
        db $35  ; 43
        db $36  ; 44
        db $00  ; 45
        db $00  ; 46
        db $00  ; 47
        db $00  ; 48
        db $00  ; 49
        db $00  ; 4a
        db $00  ; 4b
        db $00  ; 4c
        db $00  ; 4d
        db $00  ; 4e
        db $60  ; 4f
        db $50  ; 50
        db $51  ; 51
        db $51  ; 52
        db $00  ; 53
        db $71  ; 54
        db $71  ; 55
        db $51  ; 56
        db $00  ; 57
        db $00  ; 58
        db $00  ; 59
        db $00  ; 5a
        db $00  ; 5b
        db $00  ; 5c
        db $51  ; 5d
        db $51  ; 5e
        db $51  ; 5f
        db $00  ; 60
        db $00  ; 61
        db $00  ; 62
        db $00  ; 63
        db $00  ; 64
        db $00  ; 65
        db $00  ; 66
        db $00  ; 67
        db $00  ; 68
        db $00  ; 69
        db $00  ; 6a
        db $00  ; 6b
        db $00  ; 6c
        db $00  ; 6d
        db $00  ; 6e
        db $00  ; 6f
        db $00  ; 70
        db $00  ; 71
        db $00  ; 72
        db $23  ; 73
        db $81  ; 74
        db $00  ; 75
        db $00  ; 76
        db $00  ; 77
        db $41  ; 78
        db $41  ; 79
        db $41  ; 7a
        db $00  ; 7b
        db $00  ; 7c
        db $00  ; 7d
        db $31  ; 7e
        db $00  ; 7f
        db $12  ; 80
        db $40  ; 81
        db $00  ; 82
        db $00  ; 83
        db $00  ; 84
        db $13  ; 85
        db $00  ; 86 
 

}
          
{ ; -- old vanillaTable           
;         LDY.B #$00                          ; 009702|A000    |      ; 
;     CODE_009704: 
;         LDA.W IRQ_IDX_stage,Y           ; in theory we could use lvlIDX we got in transit.        
;         CMP.B #$FF                          
;         BEQ ++                     
;         CMP.B r_stage                       
;         BNE +
;         LDA.W IRQ_IDX_lvl,Y                 
;         CMP.B r_blockLevel                  
;         BNE +              
;         LDA.W IRQ_IDX_block,Y               
;         CMP.B r_roomIdx                     
;         BNE +                     
;         LDA.W IRQ_IDX,Y                     
;         STA.B r_roomEffect                  
;         SEC                                 
;         RTS                                 
; 
;       +
;         INY                                 
;         INY                                 
;         INY                                 
;         INY                                 
;         BNE CODE_009704                     
; 
;       ++  LDA.B #$00                          
;         STA.B r_roomEffect                  
;         
;         
;         CLC                                 
;         RTS                                 
; 
;   IRQ_IDX_stage:  db $00
;     IRQ_IDX_lvl:  db $00
;   IRQ_IDX_block:  db $00
;         IRQ_IDX:  db $00
;
;;            +-----------------  r_stage     32    -> IRQ_IDX_stage:                       
;;            | +-------------  r_blockLevel  33    -> IRQ_IDX_lvl:               
;;            | | +---------  r_roomIdx     34    -> IRQ_IDX_block:                     
;;            | | | +-----  r_roomEffect  7d    -> IRQ_IDX:               
;;            | | | |     
;         db $02,$02,$01,$10
;         db $02,$03,$01,$11    ; $10 Fog wide  
;         db $0e,$00,$02,$12    ; $11 Fog bottom 
;         db $0e,$02,$00,$13    ; $12 Fog high last stage
;         db $02,$00,$01,$20    ; $13 Fog low last stage 
;         db $0c,$01,$01,$23    ; $20 ?? 
;         db $05,$01,$00,$30    ; $23
;         db $0d,$03,$00,$31    ; $28 Blinking sprites 
;         db $01,$00,$00,$40    ; $30 Animation Water Freezable_00 with sound 
;         db $01,$01,$00,$40    ; $31 Animation Water Freezable_01 with sound 
;         db $01,$01,$01,$40    ; $32 Water/Mud Effect(flicker)
;         db $01,$01,$02,$40    ; $33 Water/Mud Effect(flicker)
;         db $01,$02,$00,$40    ; $34 Water/Mud Effect(flicker)
;         db $01,$02,$01,$40    ; $35 Water/Mud Effect(flicker)
;         db $01,$03,$00,$40    ; $36 Water/Mud Effect(flicker)
;         db $01,$03,$01,$40    ; $37 ??
;         db $01,$04,$00,$40    ; $40 Animation only
;         db $01,$04,$01,$40    ; $41 Animation and Sound 
;         db $01,$04,$02,$40    ; $50 Water Splash
;         db $01,$05,$00,$40    ; $51 Water Splash
;         db $0e,$00,$01,$40    ; $71 Rising Water
;         db $0d,$01,$00,$41    ; $80 Falling Bridge 
;         db $0d,$01,$01,$41    ; $81 Falling Bridge  
;         db $0d,$01,$02,$41          
;         db $06,$00,$01,$32         
;         db $06,$00,$00,$33          
;         db $06,$01,$00,$34              
;         db $06,$02,$01,$35                 
;         db $06,$02,$00,$36                  
;         db $06,$02,$02,$37                  
;         db $08,$00,$00,$50                  
;         db $08,$01,$00,$51                  
;         db $08,$02,$00,$51              
;         db $05,$03,$00,$51                  
;         db $09,$00,$00,$51                  
;         db $0a,$01,$00,$51                  
;         db $0a,$02,$00,$51               
;         db $0a,$03,$00,$51               
;         db $02,$01,$00,$51               
;         db $08,$00,$01,$60               
;         db $08,$03,$00,$71               
;         db $08,$04,$00,$71               
;         db $05,$03,$01,$80               
;         db $0c,$02,$00,$81               
;         db $ff  ;end of table 
}

      
      getCurrentLevelIDX: 
        jsr makeLevelPointer
        ldx #$00
      - ldy #$00
        lda.b ($00),y
        cmp #$ff
        beq goWhereNoLevelGoes
        cmp.b r_stage
        bne +
        
        iny 
        lda.b ($00),y
        cmp.b r_blockLevel
        bne +
        
        iny 
        lda.b ($00),y
        cmp.b r_roomIdx
        bne +
        
        txa 
        sta.w sr_lvl_IDX_00   ; update level IDX level select 
        jmp endGetLvLIDX    
          
      + inx           ; count levels 
      
        lda $00         ; update pointer 
        clc 
        adc #$03
        sta $00
        lda #$00
        adc $01
        sta $01
        
        jmp -
      endGetLvLIDX:
        rts 
      
      goWhereNoLevelGoes:
        lda #$0c        ; end game.. might be the speedruners best friend
        jmp storeGameState_zeroSub
;       rts 
pushPC  

}


{ ; entity HP table 
org $2934F      ; bank_0a 
base $934F
    enemyHealth:  
    db $04                                                
        db $04                                              
        db $04                                              
        db $04                                              
        db $04                                              
        db $04                                              
        db $04                                              
        db $04                                              
        db $02    ; enemyID_zombie_02                     
        db $02                                              
        db $02                                              
        db $04                                              
        db $0C                                              
        db $02                                              
        db $02                                              
        db $04                                              
        db $04                                              
        db $04                                              
        db $04                                              
        db $04                                              
        db $0C      ; enemyID_skeletonSword_20              
        db $30                                              
        db $24                                              
        db $04                                              
        db $04                                              
        db $40                                              
        db $06                                              
        db $04                                              
        db $02                                              
        db $04                                              
        db $04                                              
        db $04                                              
        db $04                                              
        db $04                                              
        db $0C                                              
        db $0C                                              
        db $7F                                              
        db $04                                              
        db $0A                                              
        db $06                                              
        db $04                                              
        db $04                                              
        db $04                                              
        db $04                                              
        db $04                                              
        db $04                                              
        db $04                                              
        db $04                                              
                                                            
                                                           
                                                            

}


{ ; checkpoints and level timer 
  ;; FIXME a other hardcoded checkpoint after alucard boss  

org LAST_BANK+$475
base $E475
  !draculasCheckpoint = 1     
      
  if !draculasCheckpoint == 1   
      NOP #$10                ;!! addCheckpoint for block levels?
  else    
      LDA.B r_stage                             ;0FE475|A532    |000032;
            CMP.B #$0E                                ;0FE477|C90E    |      ;
            BNE +                               ;0FE479|D00A    |0FE485;
            LDA.B r_blockLevel                        ;0FE47B|A533    |000033;
            CMP.B #$02                                ;0FE47D|C902    |      ;
            BNE +                               ;0FE47F|D004    |0FE485;
            LDA.B #$01                                ;0FE481|A901    |      ;
            STA.B r_blockLevel                        ;0FE483|8533    |000033;
  +
  endif 


;org $133AD                  ; the time can be edited in revamp
;base $B3AD
; stageTimerCheckpoint:                   
;     dw timerCheckpointStage_00                ;04B3AD|        |04B3CB;
;            dw timerCheckpointStage_01                 ;04B3AF|        |04B3CF;
;            dw timerCheckpointStage_02                 ;04B3B1|        |04B3D5;
;            dw timerCheckpointStage_03                 ;04B3B3|        |04B3DA;
;            dw timerCheckpointStage_04                 ;04B3B5|        |04B3DF;
;            dw timerCheckpointStage_05                 ;04B3B7|        |04B3E2;
;            dw timerCheckpointStage_06                 ;04B3B9|        |04B3E6;
;            dw timerCheckpointStage_07                 ;04B3BB|        |04B3E9;
;            dw timerCheckpointStage_08                 ;04B3BD|        |04B3F0;
;            dw timerCheckpointStage_09                 ;04B3BF|        |04B3F5;
;            dw timerCheckpointStage_0A                 ;04B3C1|        |04B3F7;
;            dw timerCheckpointStage_0B                 ;04B3C3|        |04B3FE;
;            dw timerCheckpointStage_0C                 ;04B3C5|        |04B401;
;            dw timerCheckpointStage_0D                 ;04B3C7|        |04B404;
;            dw timerCheckpointStage_0E                 ;04B3C9|        |04B408;
; 
; timerCheckpointStage_00: db $50,$40,$31,$20             ; High byte = lvlTime, Low byte = r_roomIdx        
; timerCheckpointStage_01: db $40,$30,$20,$42,$32,$22           
; timerCheckpointStage_02: db $30,$20,$10,$32,$21               
; timerCheckpointStage_03: db $42,$30,$20,$30,$22               
; timerCheckpointStage_04: db $40,$30,$20                       
; timerCheckpointStage_05: db $50,$40,$31,$21                   
; timerCheckpointStage_06: db $41,$30,$22                       
; timerCheckpointStage_07: db $61,$50,$50,$40,$30,$20,$20       
; timerCheckpointStage_08: db $41,$30,$20,$20,$10               
; timerCheckpointStage_09: db $30,$20                           
; timerCheckpointStage_0A: db $50,$40,$30,$20,$50,$40,$30       
; timerCheckpointStage_0B: db $50,$40,$32                       
; timerCheckpointStage_0C: db $40,$30,$20                       
; timerCheckpointStage_0D: db $50,$40,$30,$20                   
; timerCheckpointStage_0E: db $32,$20,$30                       
 

;assert pc() <= $B40B 
}


{ ; progression table 

org $04171
base $8171
    stateOrb_transitLockup: 
;   db $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0a,$0b,$0c,$0d,$0e  ; stage IDX 
    db $02,$01,$01,$00,$00,$00,$00,$01,$00,$00,$00,$00,$00,$00,$02  ; 00 type progressionLookUp_map
                                    ; 01 progressionTableMap 
                                    ; 02 progressionChoosePath, ending 
                                
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00  ; ?? 


org $01244          ; 00 type 
base $9244          ; progressionLookUp_map  
    db $00,$00,$00,$00  ; stage, block, room, new index 
    
    db $01,$02,$02,$01              
    db $01,$05,$00,$02
    db $02,$04,$00,$03
    db $03,$04,$01,$04
    db $04,$02,$02,$05             
    db $05,$03,$00,$06             
    
    db $06,$02,$00,$07
    db $07,$04,$01,$08
    db $07,$06,$00,$09
    db $08,$04,$00,$0A
    db $09,$01,$02,$0B             
    
    db $0A,$06,$02,$0C
    db $0B,$02,$00,$0D
    db $0C,$02,$00,$0E
    db $0D,$03,$01,$0F
    db $FF,$00,$00,$00   

org $0211D          ; 00 type 
base $A11D          ; progressionTable_map 
    db $00,$00,$00      ; stage, block, room 
    
    db $01,$03,$02    ; grant tower         
    db $02,$01,$00    ; woods 
    db $03,$00,$02    ; ghost ship
    db $04,$00,$00    ; red tower 
    db $05,$00,$00    ; water bridge dragons 
    db $0B,$00,$00    ; bridge aquarius 
    
    db $07,$00,$01    ; alucards cave
    db $07,$05,$00    ; alucards path
    db $09,$00,$00    ; franks cave
    db $0A,$00,$00    ; endless raising tower 
    db $0A,$00,$00
    
    db $0C,$00,$00    ; death stage 
    db $0C,$00,$00  
    db $0D,$00,$00    ; doblegenger 
    db $0E,$00,$02    ; final


org $029A5          ; 02 type 
base $A9A5
  progressionChoosePath: 
    dw goClockTower          
        dw goSymphaOrAlucard     
        dw goCryptOrWater        
 
    goClockTower: 
    db $01,$00,$00
    db $00,$00,$00              
  goWoods: 
    db $02,$00,$00                       
 
    goSymphaOrAlucard: 
    db $02,$03,$02
    db $06,$00,$01            

    goCryptOrWater: 
    db $07,$06,$00
    db $08,$00,$00   

org $012D5
base $92D5          
    checkBossStage:     ; check stage, get index for table below     
    db $01,$00        ; grant             
    db $02,$01      ; cyclops 
    db $07,$02          ; alucard 
    db $03,$03      ; medusa
    db $0A,$04      ; bat endles rising tower
    db $0E,$05,$FF      ; door to dracula
  
  afterBossActionTable:   ; autoWalk dir, gameState, loadState, inc room
    db $01,$04,$1E,$00  ; exit door bottom-grant-tower    
    db $00,$08,$00,$00  ; exit door crossroad map cyclops          
    db $01,$08,$00,$00  ; exit door crossroad map alucard 
    db $00,$04,$1F,$01  ; exit door         
    db $00,$04,$1F,$01  ; exit door          
    db $01,$04,$1F,$01  ; exit door        

org $0414C
base $814C
        LDA.B r_stage                 
        CMP.B #$0E      ; choose ending stage                  
        BNE goTransit               
        LDA.B #$0C                    
        BNE ending               
    goTransit: 
    LDA.B #$08                    
    ending: 
    STA.B r_gameState             
        LDA.B #$00                    
        STA.B r_gameSubstate          
        RTS                           

}


{ ; random drop table 

org $135CC  
base $B5CC  
    randomDrops_ID_stage0: db $95,$93,$93,$97                   ;04B5CC| 93     ; SUBWE_axe       SBC.B #$93  subWeapon processing ID
    randomDrops_ID_stage1: db $93,$95,$97,$95                   ;04B5D0| 94     ; MULIT shot      
    randomDrops_ID_stage2: db $93,$97,$93,$95                   ;04B5D4| 95     ; SUBWE_dagger      
    randomDrops_ID_stage3: db $93,$95,$93,$95                   ;04B5D8| 96     ; SUBWE_holywater     
    randomDrops_ID_stage4: db $93,$95,$97,$95                   ;04B5DC| 97     ; SUBWE_clock          
    randomDrops_ID_stage5: db $95,$95,$97,$95                   ;04B5E0| 98 +   ; errors   
    randomDrops_ID_stage6: db $95,$95,$97,$95                   ;04B5E4| anyRandomDropHandler in enemy.asm could add others but needs helper handler for subweapon.. but if you do not want any..     
    randomDrops_ID_stage7: db $97,$95,$93,$95                   ;04B5E8|      
    randomDrops_ID_stage8: db $97,$95,$93,$93                   ;04B5EC|      
    randomDrops_ID_stage9: db $97,$95,$93,$93                   ;04B5F0|      
    randomDrops_ID_stageA: db $94,$96,$93,$94                   ;04B5F4|      
    randomDrops_ID_stageB: db $97,$97,$93,$95                   ;04B5F8|      
    randomDrops_ID_stageC: db $97,$94,$96,$93                   ;04B5FC|   
    randomDrops_ID_stageD: db $97,$97,$93,$95                   ;04B600|   
    randomDrops_ID_stageE: db $93,$96,$95,$97                   ;04B604|   
    randomDrops_ID_stageF: db $97,$93,$95,$96                   ;04B608|   

}


{ ; collusion tables 

org $003EE
base $83EE
  %jml ($A0,getCollisonBitBothSlots)

assert pc() <= $8501
pad $00501



org $3D3D9
base $D3D9
  tay 
  %jml ($A0,secondCHR_C00_3rdSlot)

assert pc() <= $D3FB
pad $3D3FB
  



  pullPC    ; freeSpace 
  
    secondCHR_C00_3rdSlot: 
      tya 
      CMP.B #$DC                           
      BEQ A_spikeTileTop                   
      CMP.B #$DD                           
      BEQ A_spikeTileTop                   
      CMP.B #$DE                           
      BEQ A_spikeTileFloor                 
      CMP.B #$DF                           
      BEQ A_spikeTileFloor                 
      CMP.B #$E4                           
      BEQ A_flooTile                       
      CMP.B #$E5                           
      BEQ A_flooTile                       
      RTS                                  
  
  
    A_spikeTileFloor: 
      LDY.B #$07                           
      RTS                                  
  
  
    A_spikeTileTop: 
      LDY.B #$05                           
      RTS                                  
  
  
    A_flooTile: 
      LDY.B #$00                           
      RTS                                  


    getCollisonBitBothSlots:
            LDX.B #$00                         
            LDA.B r_CHR_BankBG_0400            
            JSR.W getCollusionBits2ndSlot      
            
      LDX.B #$08                         ; 3d slot offset
            LDA.B r_CHR_BankBG_0800            
 
    getCollusionBits2ndSlot:
            LDY.B #$00                         
            CMP.B #$33                         
            BEQ specialBankCol                    
            
      LDY.B #$02                         
            CMP.B #$36                         
            BEQ specialBankCol                    
            
      LDY.B #$04                         
            CMP.B #$37                         
            BEQ specialBankCol                    
            SEC                                
 
            SBC.B #$44                         
            ASL A                              
            TAY                                
            LDA.W collusioBitLo,Y              
            STA.B r_pointerQueue               
            LDA.W collusioBitLo+1,Y              
 
          writeColTableLoop:
            STA.B $09                          
            LDY.B #$00                         
 
          CODE_00841C:
            LDA.B (r_pointerQueue),Y           
            INY                                
            STA.B r_temp_Xpos                  
 
            LDA.B (r_pointerQueue),Y           
            INY                                
 
          CODE_008424:
            STA.W r_collisionTypeCHR400,X      
            INX                                
            DEC.B r_temp_Xpos                  
            BNE CODE_008424                    
            TXA                                
            AND.B #$07                         
            BNE CODE_00841C                    
            RTS                                
 
 
        specialBankCol:
            LDA.W cullusion_CHR_33_36_37,Y     
            STA.B r_pointerQueue               
            LDA.W cullusion_CHR_33_36_37+1,Y   
            JMP.W writeColTableLoop                  
 
 
        collusioBitLo:
            dw no_col                   ; 44 CHR bank (cross graphics)
            dw collusion_45             ; 45
            dw no_col                   ; 46 churge window
            dw collusion_47             ; 47
            dw no_col                   ; 48 houses
            dw collusion_49             ; 49 clock tower
            dw collusion_4a             ; 4A clock tower big gear
            dw no_col                   ; 4B woods
 
            dw no_col                   ; 4C sympha
            dw collusion_4d             ; 4D crusher
            dw no_col                   ; 4E ship and coffine
            dw no_col                   ; 4F swamp
            dw collusion_49             ; 50 ship window pillars
            dw no_col                   ; 51 coffine open
            dw no_col                   ; 52 statue
            dw collusion_53             ; 53 outer wall
            dw collusion_54             ; 54 water gear animation 00
            dw collusion_54             ; 55 water gear animation 00
            dw collusion_54             ; 56 water gear animation 00
            dw collusion_57             ; 57 sewers
 
            dw no_col                   ; 58 swamp mountains
            dw collusion_59             ; 59 swamp robes
            dw collusion_5a             ; 5A swamp floor with sprite mud man
            dw no_col                   ; 5B cave
 
            dw no_col                   ; 5C alucard
            dw collusion_unused         ; 5D crypt
            dw no_col                   ; 5E aquaduct
            dw no_col                   ; 5F aquabridge
 
            dw collusion_60             ; 60 aqua pillar
            dw no_col                   ; 61 crypt frank
            dw collusion_62             ; 62 crypt slulls
            dw no_col                   ; 63 crypt tower
 
            dw collusion_64             ; 64 red tower spikes
            dw collusion_65             ; 65 sunset bridge
            dw collusion_66             ; 66 castle exterior
            dw no_col                   ; 67 cave spider web
            dw collusion_68             ; 68 lake mountains
            dw collusion_68             ; 69 torture wall
            dw no_col                   ; 6A big moon
            dw collusion_6b             ; 6B finall
            dw no_col                   ; 6C armore
            dw collusion_6d             ; 6D castlevania
            dw collusion_6e             ; 6E konami
 
                    
    
    cullusion_CHR_33_36_37:               ; bossDracBottomFeet, secondQuest sprite, ABC puls candles
            dw collusion_33                        
            dw collusion_33                      
            dw collusion_33                      
 
         
                 
    no_col:
;                         +--------------------------   ; type
;               | +----------------------   ; startPos (mask and #$07) basically if lower byte is not 0 a other table follows)
             db $08,$80                           

                              ; types                
                              ; 2 = convior right
                              ; 3 = convior left
                              ; 4 = crumble Block
                              ; 5 = spike 
                              ; 6 = ground 
                              ; 8 = ground 
                              ; 0 1 7...crash!

         collusion_33:
                       db $06,$BC                            
                       db $02,$C0                           
 
         collusion_6e:
                       db $06,$7B                           
                       db $02,$80                           
 
         collusion_45:
                       db $06,$7E                           
                       db $02,$80                           
 
         collusion_47:
                       db $06,$B7                           
                       db $02,$C0                           
 
         collusion_4a:
                       db $06,$B9                           
                       db $02,$C0                           
 
         collusion_4d:
                       db $06,$B8                           
                       db $02,$C0                           
 
         collusion_49:
                       db $04,$B8                           
                       db $02,$B9                           
                       db $02,$C0                           
 
         collusion_53:
                       db $06,$7A                           
                       db $02,$80                           
 
         collusion_54:
                       db $06,$7C                           
                       db $02,$80                           
 
         collusion_57:
                       db $02,$B6                           
                       db $01,$B7                           
                       db $03,$B8                           
                       db $02,$C0                           
 
         collusion_59:
                       db $06,$78                           
                       db $02,$80                           
 
         collusion_5a:
                       db $01,$B8                           
                       db $05,$BA                           
                       db $02,$C0                           
 
     collusion_unused:
                       db $04,$B2                           
                       db $02,$B4                           
                       db $02,$C0                           
 
         collusion_60:
                       db $04,$BA                           
                       db $02,$BB                           
                       db $02,$C0                           
 
         collusion_62:
                       db $06,$A0                           
 
                       db $02,$C0                           
 
         collusion_64:
                       db $06,$B8                           
                       db $02,$C0                           
 
         collusion_65:
                       db $06,$7C                           
                       db $02,$80                           
 
         collusion_66:
                       db $04,$B8                           
                       db $02,$B9                           
                       db $02,$C0                           
 
         collusion_68:
                       db $04,$B2                           
                       db $02,$B3                           
                       db $02,$C0                           
 
         collusion_6b:
                       db $04,$B7                           
                       db $02,$B8                           
                       db $02,$C0                           
 
         collusion_6d:
                       db $06,$B8                           
 
                       db $02,$C0                           
 
                        


  
  pushPC 

}


{ ; item and drop tables

org $B083
  wallItems_subweaponFlag:    ; 02B083|        |      ;
      db $00
      db $FF      ; SUBWE_AXE = $01                       
      db $FF      ; SUBWE_CROSS = $02      
      db $FF      ; SUBWE_DAGGER = $03      
      db $FF      ; SUBWE_HOLYW = $04      
      db $00      ; SUBWE_FLAME = $05      
      db $00      ; SUBWE_FREEZ = $06      
      db $00      ; SUBWE_ORB = $07           
    if !grantDaggerSpiderSilkFreez == 1 
      db $00,$00  
    else   
      db $FF      ; SUBWE_GRANT_DAGGER = $08    
      db $FF      ; SUBWE_GRANT_AXE = $09      
    endif   
      db $00      ; SUBWE_ALUCARD = $0A    
      db $00      ; SUBWE_CLOCK = $0B                                    

}


{ ; enemySpawnerIDs

org $29282        ; bank_0a 
base $9282

                        ; r_spawnerXCoord -> $00
                        ; r_spawnerYCoord -> $01
  spawner_entity_AI_02:             ;           -> $02 -> r_entity_AI
    db $00        ;0A9282|        |       ; changes the AI the spaned enemy uses  
        db $01        ;0A9283|        |       ; Skull Knight                      
        db $02        ;0A9284|        |       ; Cyclops
        db $07        ;0A9285|        |       ; The Monster
        db $0D        ;0A9286|        |       ; Death
        db $00        ;0A9287|        |       ;
        db $00        ;0A9288|        |       ;
        db $00        ;0A9289|        |       ;
        db $00        ;0A928A|        |       ;
        db $00        ;0A928B|        |       ;
        db $00        ;0A928C|        |       ;
        db $0E        ;0A928D|        |       ; Mummy Boss
        db $05        ;0A928E|        |       ; Alucard
        db $06        ;0A928F|        |       ; Bone Dragon King
        db $12        ;0A9290|        |       ; Storm Clouds
        db $11        ;0A9291|        |       ; Grant
        db $03        ;0A9292|        |       ;
        db $10        ;0A9293|        |       ;
        db $14        ;0A9294|        |       ; Grant's Knife
        db $21        ;0A9295|        |       ;
        db $0B        ;0A9296|        |       ; Doppelganger
        db $0F        ;0A9297|        |       ; Doppelganger Weapon
        db $09        ;0A9298|        |       ; Triad Wisp
        db $0A        ;0A9299|        |       ; Medusa
        db $08        ;0A929A|        |       ;
        db $17        ;0A929B|        |       ; Alucard Fireball
        db $16        ;0A929C|        |       ; Soul Shard
        db $00        ;0A929D|        |       ;
        db $00        ;0A929E|        |       ;
        db $00        ;0A929F|        |       ;
        db $00        ;0A92A0|        |       ;
        db $00        ;0A92A1|        |       ;
        db $00        ;0A92A2|        |       ;
        db $00        ;0A92A3|        |       ;
        db $00        ;0A92A4|        |       ;
        db $00        ;0A92A5|        |       ;
        db $00        ;0A92A6|        |       ;
        db $00        ;0A92A7|        |       ;
        db $00        ;0A92A8|        |       ;
        db $04        ;0A92A9|        |       ; Giant Bat
        db $1C        ;0A92AA|        |       ;
        db $1D        ;0A92AB|        |       ;
        db $1E        ;0A92AC|        |       ;
        db $6E        ;0A92AD|        |       ;
        db $6F        ;0A92AE|        |       ;
        db $0C        ;0A92AF|        |       ;
        db $22        ;0A92B0|        |       ;
        db $00        ;0A92B1|        |       ;
        db $00        ;0A92B2|        |       ;
        db $00        ;0A92B3|        |       ;
        db $13        ;0A92B4|        |       ;
        db $00        ;0A92B5|        |       ;
        db $00        ;0A92B6|        |       ;
        db $00        ;0A92B7|        |       ;
        db $00        ;0A92B8|        |       ;
        db $00        ;0A92B9|        |       ;
        db $00        ;0A92BA|        |       ;
        db $00        ;0A92BB|        |       ;
        db $24        ;0A92BC|        |       ;
        db $25        ;0A92BD|        |       ;
        db $26        ;0A92BE|        |       ;
        db $27        ;0A92BF|        |       ;
        db $29        ;0A92C0|        |       ;
        db $28        ;0A92C1|        |       ;
        db $2B        ;0A92C2|        |       ;
        db $2F        ;0A92C3|        |       ;
        db $00        ;0A92C4|        |       ;
        db $2C        ;0A92C5|        |       ;
        db $63        ;0A92C6|        |       ;
        db $64        ;0A92C7|        |       ;
        db $65        ;0A92C8|        |       ;
        db $66        ;0A92C9|        |       ;
        db $07        ;0A92CA|        |       ;
        db $10        ;0A92CB|        |       ;
        db $07        ;0A92CC|        |       ;
        db $68        ;0A92CD|        |       ;
        db $00        ;0A92CE|        |       ;
        db $00        ;0A92CF|        |       ;
        db $00        ;0A92D0|        |       ;
        db $01        ;0A92D1|        |       ;
        db $16        ;0A92D2|        |       ;
        db $6A        ;0A92D3|        |       ;
        db $0D        ;0A92D4|        |       ;
        db $00        ;0A92D5|        |       ;
        db $00        ;0A92D6|        |       ;
        db $00        ;0A92D7|        |       ;
        db $00        ;0A92D8|        |       ;
        db $00        ;0A92D9|        |       ;
 
  spawner_entity_ID_03:             ; -> $03 -> r_entity_ID
    db $00        ;0A92DA|        |       ;
        db $48        ;0A92DB|        |       ;
        db $48        ;0A92DC|        |       ;
        db $4B        ;0A92DD|        |       ;
        db $51        ;0A92DE|        |       ;
        db $01        ;0A92DF|        |       ;
        db $02        ;0A92E0|        |       ;
        db $03        ;0A92E1|        |       ;
        db $00        ;0A92E2|        |       ;
        db $00        ;0A92E3|        |       ;
        db $00        ;0A92E4|        |       ;
        db $52        ;0A92E5|        |       ;
        db $4A        ;0A92E6|        |       ;
        db $4A        ;0A92E7|        |       ;
        db $56        ;0A92E8|        |       ;
        db $55        ;0A92E9|        |       ;
        db $49        ;0A92EA|        |       ;
        db $54        ;0A92EB|        |       ;
        db $58        ;0A92EC|        |       ;
        db $57        ;0A92ED|        |       ;
        db $4F        ;0A92EE|        |       ;
        db $53        ;0A92EF|        |       ;
        db $4D        ;0A92F0|        |       ;
        db $4E        ;0A92F1|        |       ;
        db $4C        ;0A92F2|        |       ;
        db $5B        ;0A92F3|        |       ;
        db $5A        ;0A92F4|        |       ;
        db $04        ;0A92F5|        |       ;
        db $05        ;0A92F6|        |       ;
        db $06        ;0A92F7|        |       ;
        db $0A        ;0A92F8|        |       ;
        db $08        ;0A92F9|        |       ;
        db $09        ;0A92FA|        |       ;
        db $07        ;0A92FB|        |       ;
        db $00        ;0A92FC|        |       ;
        db $0C        ;0A92FD|        |       ;
        db $0B        ;0A92FE|        |       ;
        db $09        ;0A92FF|        |       ;
        db $0D        ;0A9300|        |       ;
        db $49        ;0A9301|        |       ;
        db $5C        ;0A9302|        |       ;
        db $5D        ;0A9303|        |       ;
        db $56        ;0A9304|        |       ;
        db $4A        ;0A9305|        |       ;
        db $64        ;0A9306|        |       ;
        db $50        ;0A9307|        |       ;
        db $5E        ;0A9308|        |       ;
        db $7D        ;0A9309|        |       ;
        db $82        ;0A930A|        |       ;
        db $80        ;0A930B|        |       ;
        db $4D        ;0A930C|        |       ;
        db $7F        ;0A930D|        |       ;
        db $7E        ;0A930E|        |       ;
        db $84        ;0A930F|        |       ;
        db $76        ;0A9310|        |       ;
        db $7B        ;0A9311|        |       ;
        db $7C        ;0A9312|        |       ;
        db $75        ;0A9313|        |       ;
        db $48        ;0A9314|        |       ;
        db $60        ;0A9315|        |       ;
        db $61        ;0A9316|        |       ;
        db $58        ;0A9317|        |       ;
        db $58        ;0A9318|        |       ;
        db $62        ;0A9319|        |       ;
        db $63        ;0A931A|        |       ;
        db $56        ;0A931B|        |       ;
        db $74        ;0A931C|        |       ;
        db $59        ;0A931D|        |       ;
        db $5F        ;0A931E|        |       ;
        db $64        ;0A931F|        |       ;
        db $65        ;0A9320|        |       ;
        db $4A        ;0A9321|        |       ;
        db $4B        ;0A9322|        |       ;
        db $54        ;0A9323|        |       ;
        db $4B        ;0A9324|        |       ;
        db $4C        ;0A9325|        |       ;
        db $73        ;0A9326|        |       ;
        db $71        ;0A9327|        |       ;
        db $72        ;0A9328|        |       ;
        db $48        ;0A9329|        |       ;
        db $5A        ;0A932A|        |       ;
        db $58        ;0A932B|        |       ;
        db $51        ;0A932C|        |       ;
        db $00        ;0A932D|        |       ;
        db $00        ;0A932E|        |       ;
        db $00        ;0A932F|        |       ;
        db $00        ;0A9330|        |       ;
        db $00        ;0A9331|        |       ;


}


; !! enemy.asm 
{ ; enemy_HitBox
;org $2FBC8         ; bank_0b 
;base $BBC8
;
;    enemy_X_HitBox:    ;0BBBC8|        |      ;
;   db $08                              
;        db $08                       
;        db $0A                       
;        db $08                       
;        db $08                       
;        db $10                       
;        db $08                       
;        db $0D                       
;        db $0C                       
;        db $18                       
;        db $10                       
;        db $06                       
;        db $0C                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $10                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $0C                       
;        db $08                       
;        db $08                       
;        db $10                       
;        db $06                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $10                       
;        db $08                       
;        db $03                       
;        db $05                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $03                       
;        db $04                       
;        db $02                       
;        db $06                       
;        db $04                       
;        db $04                       
;        db $03                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $05                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $06                       
;        db $08                       
;        db $0C                       
;        db $06                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $06                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $06                       
;        db $08                       
;        db $08                       
;        db $0C                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $30                       
;        db $10                       
;        db $20                       
;        db $80                       
;        db $10                       
;        db $20                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $11                       
;        db $0C                       
;        db $10                       
;        db $08                       
;        db $08                       
;        db $0C                       
;        db $08                       
;        db $0E                       
;        db $08                       
;        db $10                       
;        db $10                       
;        db $10                       
;        db $08                       
;        db $10                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $08                       
;        db $04                       
;        db $06                       
;        db $04                       
;        db $02                       
;        db $02                       
;        db $02                       
;        db $02                       
;        db $02                       
; 
;    enemy_Y_HitBox:            ;0BBC60|        |      ;
;   db $0E                               
;        db $10                        
;        db $10                        
;        db $10                        
;        db $10                        
;        db $10                        
;        db $08                        
;        db $20                        
;        db $0C                        
;        db $18                        
;        db $10                        
;        db $0C                        
;        db $14                        
;        db $08                        
;        db $14                        
;        db $0E                        
;        db $0E                        
;        db $08                        
;        db $0E                        
;        db $0E                        
;        db $04                        
;        db $0E                        
;        db $0E                        
;        db $0E                        
;        db $0E                        
;        db $0E                        
;        db $0E                        
;        db $09                        
;        db $0E                        
;        db $0A                        
;        db $14                        
;        db $0E                        
;        db $06                        
;        db $04                        
;        db $02                        
;        db $06                        
;        db $08                        
;        db $0E                        
;        db $02                        
;        db $04                        
;        db $0E                        
;        db $0E                        
;        db $08                        
;        db $08                        
;        db $03                        
;        db $05                        
;        db $0E                        
;        db $0E                        
;        db $08                        
;        db $08                        
;        db $08                        
;        db $08                        
;        db $08                        
;        db $08                        
;        db $08                        
;        db $08                        
;        db $08                        
;        db $08                        
;        db $08                        
;        db $08                        
;        db $08                        
;        db $08                        
;        db $08                        
;        db $08                        
;        db $04                        
;        db $08                        
;        db $04                        
;        db $06                        
;        db $02                        
;        db $06                        
;        db $06                        
;        db $0E                        
;        db $0E                        
;        db $0E                        
;        db $06                        
;        db $05                        
;        db $08                        
;        db $0E                        
;        db $0E                        
;        db $0E                        
;        db $0E                        
;        db $0E                        
;        db $08                        
;        db $04                        
;        db $0E                        
;        db $0E                        
;        db $0E                        
;        db $0E                        
;        db $0E                        
;        db $06                        
;        db $0E                        
;        db $0E                        
;        db $0E                        
;        db $0E                        
;        db $06                        
;        db $0E                        
;        db $0E                        
;        db $0E                        
;        db $0E                        
;        db $0E                        
;        db $06                        
;        db $0E                        
;        db $0E                        
;        db $0E                        
;        db $0E                        
;        db $0E                        
;        db $0E                        
;        db $0E                        
;        db $0E                        
;        db $0E                        
;        db $0E                        
;        db $0E                        
;        db $0E                        
;        db $20                        
;        db $28                        
;        db $10                        
;        db $10                        
;        db $10                        
;        db $28                        
;        db $0E                        
;        db $0E                        
;        db $05                        
;        db $05                        
;        db $0E                        
;        db $0E                        
;        db $04                        
;        db $08                        
;        db $08                        
;        db $0E                        
;        db $0E                        
;        db $04                        
;        db $04                        
;        db $08                        
;        db $0E                        
;        db $08                        
;        db $08                        
;        db $08                        
;        db $0E                        
;        db $08                        
;        db $0E                        
;        db $0E                        
;        db $0E                        
;        db $0E                        
;        db $0E                        
;        db $07                        
;        db $0C                        
;        db $07                        
;        db $04                        
;        db $04                        
;        db $04                        
;        db $04                        
;        db $04                        
; 
}


;!! enemy.asm
{ ; spawnerEntityAI Idxes (spawner stuff)
;org $29282         ; bank_0a 
;base $9282
; spawnerEntityAI_Idxes_00:   ; changes the AI the spaned enemy uses 
;   db $00              ; #00  Unused address used by diverted spawners                   
;   db $01              ; #01  Zombie (slow rate) normal zombie                   
;   db $02              ; #02  Zombie (from ground)                   
;   db $07              ; #03  Medusa Head (one)                   
;   db $0D              ; #04  Winged Demon (one)                   
;   db $00              ; #05  Skull Knight (Boss)                   
;   db $00              ; #06  Cyclops (Boss)                   
;   db $00              ; #07  Grant (Boss)                   
;   db $00              ; #08  Lightning (bolts) first visual effect                   
;   db $00              ; #09  Lightning (Sypha) cinematic visual effect                   
;   db $00              ; #0A  Lightning (clouds) boss fight visual effect                   
;   db $0E              ; #0B  Hunchback                   
;   db $05              ; #0C  Bats (flying)[1]                   
;   db $06              ; #0D  Bats (asleep)                   
;   db $12              ; #0E  Bone Pillar (3-shot)[1]                   
;   db $11              ; #0F  Axe Knight                   
;   db $03              ; #10  Crow (flying low)                   
;   db $10              ; #11  Skeleton (sword)[1]                   
;   db $14              ; #12  Fishmen (jumping) bridge variety                   
;   db $21              ; #13  Skeleton (whip,red)                   
;   db $0B              ; #14  Floating Eye                   
;   db $0F              ; #15  Slime Ball                   
;   db $09              ; #16  Skeleton (bones)                   
;   db $0A              ; #17  Skeleton (whip,blue)                   
;   db $08              ; #18  Ghost (no flicker)                   
;   db $17              ; #19  Skeleton (red)                   
;   db $16              ; #1A  Mummies[1]                   
;   db $00              ; #1B  Giant Bat (Boss)                   
;   db $00              ; #1C  Alucard (Boss)                   
;   db $00              ; #1D  Bone Dragon King (Boss)                   
;   db $00              ; #1E  Medusa (Boss)                   
;   db $00              ; #1F  Water Dragons (Boss)                   
;   db $00              ; #20  Mummies + Cyclops (Boss)                   
;   db $00              ; #21  Frankenstein's Monster (Boss)                   
;   db $00              ; #22  UNUSED BOSS (no object, spawner position #2A)                   
;   db $00              ; #23  Grim Reaper (Boss)                   
;   db $00              ; #24  Doppelganger (Boss)                   
;   db $00              ; #25  Mummy + Cyclops + Leviathan (Boss)                   
;   db $00              ; #26  Dracula (Boss)                   
;   db $04              ; #27  Crow (flying high)                   
;   db $1C              ; #28  Headless Pirate a.k.a. Dhuron                   
;   db $1D              ; #29  Spider                   
;   db $1E              ; #2A  Bone Pillar (2-shot)                   
;   db $6E              ; #2B  Bats (flying)[2] *unused in CV3j*                   
;   db $6F              ; #2C  Fuzz Buster[1] *unused in CV3j*                   
;   db $0C              ; #2D  Spore (floating)                   
;   db $22              ; #2E  Spore                   
;   db $00              ; #2F  Trap Door *unused*                   
;   db $00              ; #30  Trap Door (spikes) *unused*                   
;   db $00              ; #31  Gear Tooth *unused*                   
;   db $13              ; #32  Skeleton (blue)                   
;   db $00              ; #33  Pendulum *unused*                   
;   db $00              ; #34  Falling Spikes[1] *unused*                   
;   db $00              ; #35  Falling Spikes[2] *unused*                   
;   db $00              ; #36  Water Current (4 blocks)                   
;   db $00              ; #37  Falling Blocks *unused*                   
;   db $00              ; #38  Acid Drops *unused*                   
;   db $00              ; #39  Water Current (2 blocks)[1]                   
;   db $24              ; #3A  Zombie (fast rate)[1]                   
;   db $25              ; #3B  Mudmen                   
;   db $26              ; #3C  Frog                   
;   db $27              ; #3D  Fishmen (swimming) aqueduct variety                   
;   db $29              ; #3E  Fishmen (swim+jump) deep water variety                   
;   db $28              ; #3F  Fire Man                   
;   db $2B              ; #40  Knight                   
;   db $2F              ; #41  Bone Pillar (3-shot)[2]                   
;   db $00              ; #42  Auto-Walk (forest)                   
;   db $2C              ; #43  Bone Dragon                   
;   db $63              ; #44  Owl                   
;   db $64              ; #45  Fuzz Buster[2]                   
;   db $65              ; #46  Harpy                   
;   db $66              ; #47  Bats Flying[3]                   
;   db $07              ; #48  Medusa Heads (two)[1]                   
;   db $10              ; #49  Skeleton (sword)[2]                   
;   db $07              ; #4A  Medusa Heads (two)[2]                   
;   db $68              ; #4B  Ghost (w/flicker)                   
;   db $00              ; #4C  Auto-Walk (caves)                   
;   db $00              ; #4D  Water Current (6 blocks)                   
;   db $00              ; #4E  Water Current (2 blocks)[2]                   
;   db $01              ; #4F  Zombie (fast rate)[2]                   
;   db $16              ; #50  Mummies[2]                   
;   db $6A              ; #51  Flood Controller                   
;   db $0D              ; #52  Winged Demon (two) *CV3u only*                   
;   db $00                               
;   db $00                               
;   db $00                               
;   db $00                               
;   db $00                               
; 
; spawnerEntityAI_Idxes_01: 
;   db $00            ; #00  Unused address used by diverted spawners                       
;        db $48            ; #01  Zombie (slow rate) normal zombie                       
;        db $48            ; #02  Zombie (from ground)                       
;        db $4B            ; #03  Medusa Head (one)                       
;        db $51            ; #04  Winged Demon (one)                       
;        db $01            ; #05  Skull Knight (Boss)                       
;        db $02            ; #06  Cyclops (Boss)                       
;        db $03            ; #07  Grant (Boss)                       
;        db $00            ; #08  Lightning (bolts) first visual effect                       
;        db $00            ; #09  Lightning (Sypha) cinematic visual effect                       
;        db $00            ; #0A  Lightning (clouds) boss fight visual effect                       
;        db $52            ; #0B  Hunchback                       
;        db $4A            ; #0C  Bats (flying)[1]                       
;        db $4A            ; #0D  Bats (asleep)                       
;        db $56            ; #0E  Bone Pillar (3-shot)[1]                       
;        db $55            ; #0F  Axe Knight                       
;        db $49            ; #10  Crow (flying low)                       
;        db $54            ; #11  Skeleton (sword)[1]                       
;        db $58            ; #12  Fishmen (jumping) bridge variety                       
;        db $57            ; #13  Skeleton (whip,red)                       
;        db $4F            ; #14  Floating Eye                       
;        db $53            ; #15  Slime Ball                       
;        db $4D            ; #16  Skeleton (bones)                       
;        db $4E            ; #17  Skeleton (whip,blue)                       
;        db $4C            ; #18  Ghost (no flicker)                       
;        db $5B            ; #19  Skeleton (red)                       
;        db $5A            ; #1A  Mummies[1]                       
;        db $04            ; #1B  Giant Bat (Boss)                       
;        db $05            ; #1C  Alucard (Boss)                       
;        db $06            ; #1D  Bone Dragon King (Boss)                       
;        db $0A            ; #1E  Medusa (Boss)                       
;        db $08            ; #1F  Water Dragons (Boss)                       
;        db $09            ; #20  Mummies + Cyclops (Boss)                       
;        db $07            ; #21  Frankenstein's Monster (Boss)                       
;        db $00            ; #22  UNUSED BOSS (no object, spawner position #2A)                       
;        db $0C            ; #23  Grim Reaper (Boss)                       
;        db $0B            ; #24  Doppelganger (Boss)                       
;        db $09            ; #25  Mummy + Cyclops + Leviathan (Boss)                       
;        db $0D            ; #26  Dracula (Boss)                       
;        db $49            ; #27  Crow (flying high)                       
;        db $5C            ; #28  Headless Pirate a.k.a. Dhuron                       
;        db $5D            ; #29  Spider                       
;        db $56            ; #2A  Bone Pillar (2-shot)                       
;        db $4A            ; #2B  Bats (flying)[2] *unused in CV3j*                       
;        db $64            ; #2C  Fuzz Buster[1] *unused in CV3j*                       
;        db $50            ; #2D  Spore (floating)                       
;        db $5E            ; #2E  Spore                       
;        db $7D            ; #2F  Trap Door *unused*                       
;        db $82            ; #30  Trap Door (spikes) *unused*                       
;        db $80            ; #31  Gear Tooth *unused*                       
;        db $4D            ; #32  Skeleton (blue)                       
;        db $7F            ; #33  Pendulum *unused*                       
;        db $7E            ; #34  Falling Spikes[1] *unused*                       
;        db $84            ; #35  Falling Spikes[2] *unused*                       
;        db $76            ; #36  Water Current (4 blocks)                       
;        db $7B            ; #37  Falling Blocks *unused*                       
;        db $7C            ; #38  Acid Drops *unused*                       
;        db $75            ; #39  Water Current (2 blocks)[1]                       
;        db $48            ; #3A  Zombie (fast rate)[1]                       
;        db $60            ; #3B  Mudmen                   
;        db $61            ; #3C  Frog                   
;        db $58            ; #3D  Fishmen (swimming) aqueduct variety                   
;        db $58            ; #3E  Fishmen (swim+jump) deep water variety                   
;        db $62            ; #3F  Fire Man                   
;        db $63            ; #40  Knight                   
;        db $56            ; #41  Bone Pillar (3-shot)[2]                   
;        db $74            ; #42  Auto-Walk (forest)                   
;        db $59            ; #43  Bone Dragon                   
;        db $5F            ; #44  Owl                   
;        db $64            ; #45  Fuzz Buster[2]                   
;        db $65            ; #46  Harpy                   
;        db $4A            ; #47  Bats Flying[3]                   
;        db $4B            ; #48  Medusa Heads (two)[1]                   
;        db $54            ; #49  Skeleton (sword)[2]                   
;        db $4B            ; #4A  Medusa Heads (two)[2]                   
;        db $4C            ; #4B  Ghost (w/flicker)                   
;        db $73            ; #4C  Auto-Walk (caves)                   
;        db $71            ; #4D  Water Current (6 blocks)                   
;        db $72            ; #4E  Water Current (2 blocks)[2]                   
;        db $48            ; #4F  Zombie (fast rate)[2]                   
;        db $5A            ; #50  Mummies[2]                   
;        db $58            ; #51  Flood Controller                   
;        db $51            ; #52  Winged Demon (two) *CV3u only*                   
;        db $00                               
;        db $00                               
;        db $00                               
;        db $00                               
;        db $00                               

}



