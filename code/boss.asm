

{ ; -- hijacks --------------------------------------------------------------------- 

org LAST_BANK+$5A7 
base $E5A7                      
    jsr someScreenLoad               

org LAST_BANK+$609	
base $E609
    jsr someSpriteRoutine_bank8   

org LAST_BANK+$6BE 
base $E6BE
    jsr mamaBatLastBatDefeated  

org LAST_BANK+$1F49 
base $FF49
    jsr deathSkull_routine 
	
org LAST_BANK+$1F59 
base $FF59
    jsr skullBoss_routine                                     

org LAST_BANK+$1E1E	
base $FE1E
    jsr bossMain   

org $08047
base $8047
	dw generalBank0C__00           

	

}


{ ; -- boss bank 3 -----------------------------------------------------------------

	
org $0C000		; bank 3 
base $8000
				
				
				bank_86:
						db $86                               ;038000|        |      ; NES PRG C000
;		; FIXME!! 
;						db $00,$02,$01,$03,$14,$13,$12,$13   ;039234|        |      ;
;						db $12,$13,$14,$13                   ;03923C|        |      ;	


{  ; -- 03 grant boss code


		bossPreview_grant_03:
						LDA.B r_bossActiveFlag               ;038DD7|A578    |000078;
						BEQ CODE_038DE6                      ;038DD9|F00B    |038DE6;
						LDA.W r_entity_extra,X               ;038DDB|BDD805  |0305D8;
						CMP.B #$40                           ;038DDE|C940    |      ;
						BCS CODE_038DFC                      ;038DE0|B01A    |038DFC;
						INC.W r_entity_extra,X               ;038DE2|FED805  |0305D8;
						RTS                                  ;038DE5|60      |      ;
	
	
			CODE_038DE6:
						LDA.B #$40                           ;038DE6|A940    |      ;
						STA.W r_entity_mask,X                ;038DE8|9D7004  |030470;
						LDA.B #$00                           ;038DEB|A900    |      ;
						STA.W r_entity_FacingLeft,X          ;038DED|9DA804  |0304A8;
						LDA.B #$04                           ;038DF0|A904    |      ;
						STA.W r_Player_StateDoubled,X        ;038DF2|9D6505  |030565;
						LDA.B #$0A                           ;038DF5|A90A    |      ;
						LDY.B #$19                           ;038DF7|A019    |      ;	
						jmp setSpriteAndAnimGroup_AY_update                       ;038DFA|        |0FEF6E;
	
			CODE_038DFC:
						LDA.B #$00                           ;038DFC|A900    |      ;
						STA.W r_entity_extra,X               ;038DFE|9DD805  |0305D8;
						STA.W r_orb_statesGlobal             ;038E01|8DED07  |0307ED;
						jsr AND_7F_r_orb_flagsTimer_bank3
						LDA.B #$1A                           ;038E0C|A91A    |      ;
						STA.W r_misc_movementState,X         ;038E0E|9D4506  |030645;
			
			bossPre_RTS__2a:			
						RTS                                  ;038E11|60      |      ;
	
	
		bossID_grant_03:
						LDA.W r_orb_flagsTimer               ;038E12|ADF307  |0307F3;
						CMP.B #$01                           ;038E15|C901    |      ;
						BNE CODE_038E24                      ;038E17|D00B    |038E24;
						LDA.B #$00                           ;038E19|A900    |      ;
						STA.W r_entity_damage,X              ;038E1B|9D5706  |030657;
						STA.W r_entity_damageRelated,X       ;038E1E|9D6906  |030669;
						JMP.W CODE_039240                    ;038E21|4C4092  |039240;
	
	
			CODE_038E24:
						LDA.B #$01                           ;038E24|A901    |      ;
						JSR.W spawnA_times_Y_6                    ;038E26|205699  |039956;
						BCS +
						JSR.W setBossEntityDamage_20                    ;038E2B|203B99  |03993B;
						LDA.B #$01                           ;038E2E|A901    |      ;
						JSR.W spawnA_times_Y_8                    ;038E30|205C99  |03995C;
						LDA.W r_entity_damageRelated,X       ;038E33|BD6906  |030669;
						STA.B r_coreLoadingFuncAddr          ;038E36|8516    |000016;
						AND.B #$0F                           ;038E38|290F    |      ;
						CMP.B #$02                           ;038E3A|C902    |      ;
						BEQ CODE_038E4E                      ;038E3C|F010    |038E4E;
						JSR.W CODE_039309                    ;038E3E|200993  |039309;
						CMP.B #$41                           ;038E41|C941    |      ;
						BEQ CODE_038E49                      ;038E43|F004    |038E49;
						CMP.B #$42                           ;038E45|C942    |      ;
						BNE CODE_038E4E                      ;038E47|D005    |038E4E;
	
			CODE_038E49:
						LDA.B #$00                           ;038E49|A900    |      ;
						STA.W r_entity_damageRelated,X       ;038E4B|9D6906  |030669;
	
			CODE_038E4E:
						JSR.W CODE_039309                    ;038E4E|200993  |039309;
						CMP.B #$41                           ;038E51|C941    |      ;
						BCC CODE_038E56                      ;038E53|9001    |038E56;
					+	
						RTS                                  ;038E55|60      |      ;
	
	
			CODE_038E56:
						JSR.W spawnA_times_Y_16                    ;038E56|209C99  |03999C;
						LDA.W r_entity_YPos,X                ;038E59|BD1C04  |03041C;
						CMP.B #$60                           ;038E5C|C960    |      ;
						BCS CODE_038E8A                      ;038E5E|B02A    |038E8A;
						LDA.W r_entity_XPos,X                ;038E60|BD3804  |030438;
						CMP.B #$70                           ;038E63|C970    |      ;
						BCC CODE_038E6B                      ;038E65|9004    |038E6B;
						LDA.B r_coreLoadingFuncAddr          ;038E67|A516    |000016;
						BNE CODE_038E7F                      ;038E69|D014    |038E7F;
	
			CODE_038E6B:
						LDA.W r_entity_XPos,X                ;038E6B|BD3804  |030438;
						CMP.B #$50                           ;038E6E|C950    |      ;
						BCC CODE_038E8A                      ;038E70|9018    |038E8A;
						LDA.W r_entity_target,X              ;038E72|BD0606  |030606;
						AND.B #$01                           ;038E75|2901    |      ;
						BEQ CODE_038E8A                      ;038E77|F011    |038E8A;
						LDA.B $00                            ;038E79|A500    |000000;
						CMP.B #$20                           ;038E7B|C920    |      ;
						BCS CODE_038E8A                      ;038E7D|B00B    |038E8A;
	
			CODE_038E7F:
						LDA.W r_entity_target,X              ;038E7F|BD0606  |030606;
						AND.B #$FE                           ;038E82|29FE    |      ;
						STA.W r_entity_target,X              ;038E84|9D0606  |030606;
						JMP.W CODE_039159                    ;038E87|4C5991  |039159;
	
	
			CODE_038E8A:
						JSR.W CODE_039309                    ;038E8A|200993  |039309;
						CMP.B #$14                           ;038E8D|C914    |      ;
						BNE CODE_038EA4                      ;038E8F|D013    |038EA4;
						LDA.W r_entity_XPos,X                ;038E91|BD3804  |030438;
						CMP.B #$40                           ;038E94|C940    |      ;
						BCS CODE_038EA4                      ;038E96|B00C    |038EA4;
						LDA.B #$00                           ;038E98|A900    |      ;
						LDY.B #$F0                           ;038E9A|A0F0    |      ;
						db $20                               ;038E9C|        |      ;
						dw getCollusionBasedOnOffset         ;038E9D|        |0FFC1E;
						BEQ CODE_038EA4                      ;038E9F|F003    |038EA4;
						JMP.W CODE_039159                    ;038EA1|4C5991  |039159;
	
	
			CODE_038EA4:
						JSR.W CODE_039309                    ;038EA4|200993  |039309;
						CMP.B #$40                           ;038EA7|C940    |      ;
						BEQ CODE_038EB2                      ;038EA9|F007    |038EB2;
						CMP.B #$12                           ;038EAB|C912    |      ;
						BEQ CODE_038EB2                      ;038EAD|F003    |038EB2;
						JMP.W CODE_038F35                    ;038EAF|4C358F  |038F35;
	
	
			CODE_038EB2:
						LDA.W r_entity_YPos,X                ;038EB2|BD1C04  |03041C;
						CMP.B #$50                           ;038EB5|C950    |      ;
						BCS CODE_038EF1                      ;038EB7|B038    |038EF1;
						LDA.W r_Player_StateDoubled,X        ;038EB9|BD6505  |030565;
						AND.B #$04                           ;038EBC|2904    |      ;
						BEQ CODE_038F35                      ;038EBE|F075    |038F35;
						LDA.W r_damagActionFlag,X            ;038EC0|BD1D06  |03061D;
						AND.B #$FD                           ;038EC3|29FD    |      ;
						STA.W r_damagActionFlag,X            ;038EC5|9D1D06  |03061D;
						AND.B #$01                           ;038EC8|2901    |      ;
						BNE CODE_038F35                      ;038ECA|D069    |038F35;
						LDA.W r_entity_target,X              ;038ECC|BD0606  |030606;
						AND.B #$01                           ;038ECF|2901    |      ;
						BNE CODE_038F35                      ;038ED1|D062    |038F35;
						LDA.B $00                            ;038ED3|A500    |000000;
						CMP.B #$20                           ;038ED5|C920    |      ;
						BCS CODE_038F35                      ;038ED7|B05C    |038F35;
						LDA.W r_entity_XPos,X                ;038ED9|BD3804  |030438;
						CMP.B #$30                           ;038EDC|C930    |      ;
						BCC CODE_038F35                      ;038EDE|9055    |038F35;
						CMP.B #$D0                           ;038EE0|C9D0    |      ;
						BCS CODE_038F35                      ;038EE2|B051    |038F35;
						LDA.W r_damagActionFlag,X            ;038EE4|BD1D06  |03061D;
						ORA.B #$01                           ;038EE7|0901    |      ;
						STA.W r_damagActionFlag,X            ;038EE9|9D1D06  |03061D;
						LDA.B #$42                           ;038EEC|A942    |      ;
						JMP.W CODE_039215                    ;038EEE|4C1592  |039215;
	
	
			CODE_038EF1:
						LDA.W r_damagActionFlag,X            ;038EF1|BD1D06  |03061D;
						AND.B #$FE                           ;038EF4|29FE    |      ;
						STA.W r_damagActionFlag,X            ;038EF6|9D1D06  |03061D;
						AND.B #$02                           ;038EF9|2902    |      ;
						BNE CODE_038F35                      ;038EFB|D038    |038F35;
						LDA.B $17                            ;038EFD|A517    |000017;
						CMP.W r_entity_FacingLeft,X          ;038EFF|DDA804  |0304A8;
						BNE CODE_038F35                      ;038F02|D031    |038F35;
						LDA.B $00                            ;038F04|A500    |000000;
						CMP.B #$10                           ;038F06|C910    |      ;
						BCC CODE_038F35                      ;038F08|902B    |038F35;
						LDA.W r_entity_YPos                  ;038F0A|AD1C04  |03041C;
						SEC                                  ;038F0D|38      |      ;
						SBC.W r_entity_YPos,X                ;038F0E|FD1C04  |03041C;
						BCS CODE_038F18                      ;038F11|B005    |038F18;
						EOR.B #$FF                           ;038F13|49FF    |      ;
						CLC                                  ;038F15|18      |      ;
						ADC.B #$01                           ;038F16|6901    |      ;
	
			CODE_038F18:
						CMP.B #$0C                           ;038F18|C90C    |      ;
						BCS CODE_038F35                      ;038F1A|B019    |038F35;
						LDA.W r_damagActionFlag,X            ;038F1C|BD1D06  |03061D;
						ORA.B #$02                           ;038F1F|0902    |      ;
						STA.W r_damagActionFlag,X            ;038F21|9D1D06  |03061D;
						LDA.B #$10                           ;038F24|A910    |      ;
						LDY.B #$29                           ;038F26|A029    |      ;
						db $20                               ;038F28|        |      ;
						dw setSpriteAndAnimGroup_AY_update                       ;038F29|        |0FEF6E;
						LDA.B #$00                           ;038F2B|A900    |      ;
						STA.W r_entity_mask,X                ;038F2D|9D7004  |030470;
						LDA.B #$41                           ;038F30|A941    |      ;
						JMP.W CODE_039215                    ;038F32|4C1592  |039215;
	
	
			CODE_038F35:
						LDA.W r_entity_XPos,X                ;038F35|BD3804  |030438;
						CMP.B #$F0                           ;038F38|C9F0    |      ;
						BCC CODE_038F69                      ;038F3A|902D    |038F69;
						LDA.B #$EF                           ;038F3C|A9EF    |      ;
						STA.W r_entity_XPos,X                ;038F3E|9D3804  |030438;
						LDA.W r_entity_FacingLeft,X          ;038F41|BDA804  |0304A8;
						EOR.B #$01                           ;038F44|4901    |      ;
						STA.W r_entity_FacingLeft,X          ;038F46|9DA804  |0304A8;
						LDA.W r_Player_StateDoubled,X        ;038F49|BD6505  |030565;
						CLC                                  ;038F4C|18      |      ;
						ADC.B #$08                           ;038F4D|6908    |      ;
						AND.B #$0F                           ;038F4F|290F    |      ;
						STA.W r_Player_StateDoubled,X        ;038F51|9D6505  |030565;
						LDA.W r_entity_XsubSpd,X             ;038F54|BD0905  |030509;
						EOR.B #$FF                           ;038F57|49FF    |      ;
						CLC                                  ;038F59|18      |      ;
						ADC.B #$01                           ;038F5A|6901    |      ;
						STA.W r_entity_XsubSpd,X             ;038F5C|9D0905  |030509;
						LDA.W r_entity_Xspd,X                ;038F5F|BDF204  |0304F2;
						EOR.B #$FF                           ;038F62|49FF    |      ;
						ADC.B #$00                           ;038F64|6900    |      ;
						STA.W r_entity_Xspd,X                ;038F66|9DF204  |0304F2;
	
			CODE_038F69:
						LDA.B #$00                           ;038F69|A900    |      ;
						STA.B $07                            ;038F6B|8507    |000007;
						JSR.W CODE_039309                    ;038F6D|200993  |039309;
						CMP.B #$14                           ;038F70|C914    |      ;
						BCS CODE_038F9D                      ;038F72|B029    |038F9D;
						LDA.W r_Player_StateDoubled,X        ;038F74|BD6505  |030565;
						AND.B #$04                           ;038F77|2904    |      ;
						BEQ CODE_038F8A                      ;038F79|F00F    |038F8A;
						LDA.W r_entity_YPos,X                ;038F7B|BD1C04  |03041C;
						CMP.B #$60                           ;038F7E|C960    |      ;
						BCC CODE_038F9D                      ;038F80|901B    |038F9D;
						LDY.B #$00                           ;038F82|A000    |      ;
						LDA.B #$10                           ;038F84|A910    |      ;
						STA.B $01                            ;038F86|8501    |000001;
						BNE CODE_038FA3                      ;038F88|D019    |038FA3;
	
			CODE_038F8A:
						LDA.W r_Player_StateDoubled,X        ;038F8A|BD6505  |030565;
						AND.B #$08                           ;038F8D|2908    |      ;
						BNE CODE_038F95                      ;038F8F|D004    |038F95;
						LDY.B #$F0                           ;038F91|A0F0    |      ;
						BNE CODE_038F97                      ;038F93|D002    |038F97;
	
			CODE_038F95:
						LDY.B #$10                           ;038F95|A010    |      ;
	
			CODE_038F97:
						LDA.B #$00                           ;038F97|A900    |      ;
						STA.B $01                            ;038F99|8501    |000001;
						BEQ CODE_038FB1                      ;038F9B|F014    |038FB1;
	
			CODE_038F9D:
						LDY.B #$00                           ;038F9D|A000    |      ;
						LDA.B #$08                           ;038F9F|A908    |      ;
						STA.B $01                            ;038FA1|8501    |000001;
	
			CODE_038FA3:
						LDA.W r_entity_FacingLeft,X          ;038FA3|BDA804  |0304A8;
						BEQ CODE_038FB1                      ;038FA6|F009    |038FB1;
						LDA.B $01                            ;038FA8|A501    |000001;
						EOR.B #$FF                           ;038FAA|49FF    |      ;
						CLC                                  ;038FAC|18      |      ;
						ADC.B #$01                           ;038FAD|6901    |      ;
						STA.B $01                            ;038FAF|8501    |000001;
	
			CODE_038FB1:
						LDA.B $01                            ;038FB1|A501    |000001;
						db $20                               ;038FB3|        |      ;
						dw getCollusionBasedOnOffset         ;038FB4|        |0FFC1E;
						BEQ CODE_038FBC                      ;038FB6|F004    |038FBC;
						LDA.B #$01                           ;038FB8|A901    |      ;
						STA.B $07                            ;038FBA|8507    |000007;
	
			CODE_038FBC:
						JSR.W CODE_039309                    ;038FBC|200993  |039309;
						CMP.B #$14                           ;038FBF|C914    |      ;
						BCS CODE_038FD7                      ;038FC1|B014    |038FD7;
						LDA.W r_Player_StateDoubled,X        ;038FC3|BD6505  |030565;
						AND.B #$04                           ;038FC6|2904    |      ;
						BEQ CODE_038FDD                      ;038FC8|F013    |038FDD;
						LDA.W r_entity_YPos,X                ;038FCA|BD1C04  |03041C;
						CMP.B #$60                           ;038FCD|C960    |      ;
						BCS CODE_038FD7                      ;038FCF|B006    |038FD7;
						LDA.B #$00                           ;038FD1|A900    |      ;
						LDY.B #$F0                           ;038FD3|A0F0    |      ;
						BNE DATA8_038FEA                     ;038FD5|D013    |038FEA;
	
			CODE_038FD7:
						LDA.B #$00                           ;038FD7|A900    |      ;
						LDY.B #$10                           ;038FD9|A010    |      ;
						BNE DATA8_038FEA                     ;038FDB|D00D    |038FEA;
	
			CODE_038FDD:
						LDY.B #$00                           ;038FDD|A000    |      ;
						LDA.W r_entity_FacingLeft,X          ;038FDF|BDA804  |0304A8;
						BNE CODE_038FE8                      ;038FE2|D004    |038FE8;
						LDA.B #$11                           ;038FE4|A911    |      ;
						BNE DATA8_038FEA                     ;038FE6|D002    |038FEA;
	
			CODE_038FE8:
						LDA.B #$EF                           ;038FE8|A9EF    |      ;
	
			DATA8_038FEA:
						db $20                               ;038FEA|        |      ;
						dw getCollusionBasedOnOffset         ;038FEB|        |0FFC1E;
						BEQ CODE_038FF5                      ;038FED|F006    |038FF5;
						LDA.B $07                            ;038FEF|A507    |000007;
						ORA.B #$02                           ;038FF1|0902    |      ;
						STA.B $07                            ;038FF3|8507    |000007;
	
			CODE_038FF5:
						JSR.W CODE_039309                    ;038FF5|200993  |039309;
						BEQ CODE_039005                      ;038FF8|F00B    |039005;
						CMP.B #$40                           ;038FFA|C940    |      ;
						BEQ CODE_039005                      ;038FFC|F007    |039005;
						CMP.B #$14                           ;038FFE|C914    |      ;
						BCS CODE_039008                      ;039000|B006    |039008;
						JMP.W CODE_039148                    ;039002|4C4891  |039148;
	
	
			CODE_039005:
						JMP.W CODE_039104                    ;039005|4C0491  |039104;
	
	
			CODE_039008:
						LDA.B $07                            ;039008|A507    |000007;
						AND.B #$01                           ;03900A|2901    |      ;
						BEQ CODE_03905A                      ;03900C|F04C    |03905A;
						LDA.W r_entity_XPos,X                ;03900E|BD3804  |030438;
						AND.B #$0F                           ;039011|290F    |      ;
						BEQ CODE_039032                      ;039013|F01D    |039032;
						LDA.W r_entity_FacingLeft,X          ;039015|BDA804  |0304A8;
						BEQ CODE_039027                      ;039018|F00D    |039027;
						LDA.W r_entity_XPos,X                ;03901A|BD3804  |030438;
						CLC                                  ;03901D|18      |      ;
						ADC.B #$10                           ;03901E|6910    |      ;
						AND.B #$F0                           ;039020|29F0    |      ;
						STA.W r_entity_XPos,X                ;039022|9D3804  |030438;
						BNE CODE_039032                      ;039025|D00B    |039032;
	
			CODE_039027:
						LDA.W r_entity_XPos,X                ;039027|BD3804  |030438;
						SEC                                  ;03902A|38      |      ;
						SBC.B #$10                           ;03902B|E910    |      ;
						AND.B #$F0                           ;03902D|29F0    |      ;
						STA.W r_entity_XPos,X                ;03902F|9D3804  |030438;
	
			CODE_039032:
						JSR.W CODE_039309                    ;039032|200993  |039309;
						CMP.B #$15                           ;039035|C915    |      ;
						BNE CODE_039043                      ;039037|D00A    |039043;
						LDA.W r_entity_XPos,X                ;039039|BD3804  |030438;
						CMP.B #$38                           ;03903C|C938    |      ;
						BCC CODE_039043                      ;03903E|9003    |039043;
						JMP.W CODE_039155                    ;039040|4C5591  |039155;
	
	
			CODE_039043:
						LDA.W r_entity_target,X              ;039043|BD0606  |030606;
						AND.B #$0F                           ;039046|290F    |      ;
						STA.W r_entity_target,X              ;039048|9D0606  |030606;
						LDA.B #$00                           ;03904B|A900    |      ;
						STA.W r_Player_StateDoubled,X        ;03904D|9D6505  |030565;
						LDA.B #$13                           ;039050|A913    |      ;
						STA.W r_entity_Counter,X             ;039052|9D3306  |030633;
						LDA.B #$12                           ;039055|A912    |      ;
						JMP.W CODE_039215                    ;039057|4C1592  |039215;
	
	
			CODE_03905A:
						LDA.B $07                            ;03905A|A507    |000007;
						AND.B #$02                           ;03905C|2902    |      ;
						BNE CODE_039063                      ;03905E|D003    |039063;
						JMP.W CODE_039103                    ;039060|4C0391  |039103;
	
	
			CODE_039063:
						LDA.W r_entity_target,X              ;039063|BD0606  |030606;
						AND.B #$04                           ;039066|2904    |      ;
						BNE CODE_039075                      ;039068|D00B    |039075;
						LDA.W r_entity_target,X              ;03906A|BD0606  |030606;
						CLC                                  ;03906D|18      |      ;
						ADC.B #$10                           ;03906E|6910    |      ;
						ORA.B #$04                           ;039070|0904    |      ;
						STA.W r_entity_target,X              ;039072|9D0606  |030606;
	
			CODE_039075:
						LDA.W r_orb_statesGlobal             ;039075|ADED07  |0307ED;
						CMP.B #$03                           ;039078|C903    |      ;
						BCC CODE_039096                      ;03907A|901A    |039096;
						LDA.W r_entity_YPos,X                ;03907C|BD1C04  |03041C;
						CMP.B #$A0                           ;03907F|C9A0    |      ;
						BCC CODE_03908A                      ;039081|9007    |03908A;
						LDA.W r_entity_XPos,X                ;039083|BD3804  |030438;
						CMP.B #$60                           ;039086|C960    |      ;
						BCC CODE_039096                      ;039088|900C    |039096;
	
			CODE_03908A:
						LDA.B #$0C                           ;03908A|A90C    |      ;
						STA.W r_Player_StateDoubled,X        ;03908C|9D6505  |030565;
						LDA.B #$01                           ;03908F|A901    |      ;
						STA.W r_entity_FacingLeft,X          ;039091|9DA804  |0304A8;
						BNE CODE_0390B4                      ;039094|D01E    |0390B4;
	
			CODE_039096:
						LDA.B $17                            ;039096|A517    |000017;
						STA.W r_entity_FacingLeft,X          ;039098|9DA804  |0304A8;
						LDA.B #$04                           ;03909B|A904    |      ;
						STA.W r_Player_StateDoubled,X        ;03909D|9D6505  |030565;
						LDA.W r_entity_FacingLeft,X          ;0390A0|BDA804  |0304A8;
						BEQ CODE_0390B4                      ;0390A3|F00F    |0390B4;
						LDA.B #$0C                           ;0390A5|A90C    |      ;
						STA.W r_Player_StateDoubled,X        ;0390A7|9D6505  |030565;
						BNE CODE_0390B4                      ;0390AA|D008    |0390B4;
						LDA.W r_entity_target,X              ;0390AC|BD0606  |030606;
						AND.B #$FB                           ;0390AF|29FB    |      ;
						STA.W r_entity_target,X              ;0390B1|9D0606  |030606;
	
			CODE_0390B4:
						JSR.W CODE_039309                    ;0390B4|200993  |039309;
						CMP.B #$14                           ;0390B7|C914    |      ;
						BNE CODE_0390C2                      ;0390B9|D007    |0390C2;
						LDA.W r_entity_AI_IDX,X              ;0390BB|BDC105  |0305C1;
						CMP.B #$04                           ;0390BE|C904    |      ;
						BCC CODE_039103                      ;0390C0|9041    |039103;
	
			CODE_0390C2:
						LDA.B #$0A                           ;0390C2|A90A    |      ;
						LDY.B #$19                           ;0390C4|A019    |      ;
						db $20                               ;0390C6|        |      ;
						dw setSpriteAndAnimGroup_AY_update                       ;0390C7|        |0FEF6E;
						LDA.B #$1A                           ;0390C9|A91A    |      ;
						STA.W r_misc_movementState,X         ;0390CB|9D4506  |030645;
						LDA.W r_entity_mask,X                ;0390CE|BD7004  |030470;
						AND.B #$DF                           ;0390D1|29DF    |      ;
						STA.W r_entity_mask,X                ;0390D3|9D7004  |030470;
	
			CODE_0390D6:
						LDA.W r_Player_StateDoubled,X        ;0390D6|BD6505  |030565;
						BNE CODE_0390E3                      ;0390D9|D008    |0390E3;
						LDA.B $17                            ;0390DB|A517    |000017;
						STA.W r_entity_FacingLeft,X          ;0390DD|9DA804  |0304A8;
						JSR.W CODE_03930F                    ;0390E0|200F93  |03930F;
	
			CODE_0390E3:
						LDA.B #$00                           ;0390E3|A900    |      ;
						STA.W r_entity_Yspd,X                ;0390E5|9D2005  |030520;
						STA.W r_entity_YsubSpd,X             ;0390E8|9D3705  |030537;
						JSR.W CODE_039309                    ;0390EB|200993  |039309;
						CMP.B #$40                           ;0390EE|C940    |      ;
						BEQ CODE_0390FE                      ;0390F0|F00C    |0390FE;
						LDA.B #$0A                           ;0390F2|A90A    |      ;
						LDY.B #$12                           ;0390F4|A012    |      ;
						db $20                               ;0390F6|        |      ;
						dw setSpriteAndAnimGroup_AY_update                       ;0390F7|        |0FEF6E;
						LDA.B #$1A                           ;0390F9|A91A    |      ;
						STA.W r_misc_movementState,X         ;0390FB|9D4506  |030645;
	
			CODE_0390FE:
						LDA.B #$C0                           ;0390FE|A9C0    |      ;
						JMP.W CODE_039215                    ;039100|4C1592  |039215;
	
	
			CODE_039103:
						RTS                                  ;039103|60      |      ;
	
	
			CODE_039104:
						LDA.B $07                            ;039104|A507    |000007;
						AND.B #$02                           ;039106|2902    |      ;
						BNE CODE_03910D                      ;039108|D003    |03910D;
						JMP.W CODE_039159                    ;03910A|4C5991  |039159;
	
	
			CODE_03910D:
						LDA.W r_entity_XPos,X                ;03910D|BD3804  |030438;
						LSR A                                ;039110|4A      |      ;
						LSR A                                ;039111|4A      |      ;
						LSR A                                ;039112|4A      |      ;
						LSR A                                ;039113|4A      |      ;
						TAY                                  ;039114|A8      |      ;
						LDA.W DATA8_039138,Y                 ;039115|B93891  |039138;
						BNE CODE_03912B                      ;039118|D011    |03912B;
						LDA.B $00                            ;03911A|A500    |000000;
						CMP.B #$18                           ;03911C|C918    |      ;
						BCC CODE_03912B                      ;03911E|900B    |03912B;
						LDA.W r_entity_target,X              ;039120|BD0606  |030606;
						AND.B #$FD                           ;039123|29FD    |      ;
						STA.W r_entity_target,X              ;039125|9D0606  |030606;
						JMP.W CODE_0390D6                    ;039128|4CD690  |0390D6;
	
	
			CODE_03912B:
						LDA.W r_entity_target,X              ;03912B|BD0606  |030606;
						AND.B #$FD                           ;03912E|29FD    |      ;
						STA.W r_entity_target,X              ;039130|9D0606  |030606;
						LDA.B #$94                           ;039133|A994    |      ;
						JMP.W CODE_039215                    ;039135|4C1592  |039215;
	
	
			DATA8_039138:
						db $00,$00,$01,$00,$01,$02,$00,$00   ;039138|        |      ;
						db $01,$00,$00,$00,$00,$01,$00,$00   ;039140|        |      ;
	
			CODE_039148:
						LDA.B $07                            ;039148|A507    |000007;
						AND.B #$01                           ;03914A|2901    |      ;
						BNE CODE_039174                      ;03914C|D026    |039174;
						LDA.B $07                            ;03914E|A507    |000007;
						AND.B #$02                           ;039150|2902    |      ;
						BEQ CODE_039159                      ;039152|F005    |039159;
						RTS                                  ;039154|60      |      ;
	
	
			CODE_039155:
						LDA.B #$43                           ;039155|A943    |      ;
						BNE CODE_03915B                      ;039157|D002    |03915B;
	
			CODE_039159:
						LDA.B #$15                           ;039159|A915    |      ;
	
			CODE_03915B:
						STA.B r_coreLoadingFuncAddr          ;03915B|8516    |000016;
						JSR.W CODE_03930F                    ;03915D|200F93  |03930F;
						LDA.B #$0A                           ;039160|A90A    |      ;
						LDY.B #$19                           ;039162|A019    |      ;
						db $20                               ;039164|        |      ;
						dw setSpriteAndAnimGroup_AY_update                       ;039165|        |0FEF6E;
						LDA.W r_entity_mask,X                ;039167|BD7004  |030470;
						AND.B #$DF                           ;03916A|29DF    |      ;
						STA.W r_entity_mask,X                ;03916C|9D7004  |030470;
						LDA.B r_coreLoadingFuncAddr          ;03916F|A516    |000016;
						JMP.W CODE_039215                    ;039171|4C1592  |039215;
	
	
			CODE_039174:
						LDA.B $07                            ;039174|A507    |000007;
						AND.B #$02                           ;039176|2902    |      ;
						BEQ CODE_039159                      ;039178|F0DF    |039159;
						LDA.W r_Player_StateDoubled,X        ;03917A|BD6505  |030565;
						AND.B #$04                           ;03917D|2904    |      ;
						BEQ CODE_0391C5                      ;03917F|F044    |0391C5;
						LDA.W r_entity_target,X              ;039181|BD0606  |030606;
						AND.B #$0F                           ;039184|290F    |      ;
						STA.W r_entity_target,X              ;039186|9D0606  |030606;
						LDA.B #$00                           ;039189|A900    |      ;
						STA.W r_Player_StateDoubled,X        ;03918B|9D6505  |030565;
						LDA.W r_entity_YPos,X                ;03918E|BD1C04  |03041C;
						CMP.B #$60                           ;039191|C960    |      ;
						BCS CODE_0391C1                      ;039193|B02C    |0391C1;
						LDA.B #$08                           ;039195|A908    |      ;
						STA.B $01                            ;039197|8501    |000001;
						LDA.W r_entity_FacingLeft,X          ;039199|BDA804  |0304A8;
						BNE CODE_0391A7                      ;03919C|D009    |0391A7;
						LDA.B $01                            ;03919E|A501    |000001;
						EOR.B #$FF                           ;0391A0|49FF    |      ;
						CLC                                  ;0391A2|18      |      ;
						ADC.B #$01                           ;0391A3|6901    |      ;
						STA.B $01                            ;0391A5|8501    |000001;
	
			CODE_0391A7:
						LDA.W r_entity_XPos,X                ;0391A7|BD3804  |030438;
						AND.B #$F8                           ;0391AA|29F8    |      ;
						CLC                                  ;0391AC|18      |      ;
						ADC.B $01                            ;0391AD|6501    |000001;
						CMP.B #$28                           ;0391AF|C928    |      ;
						BCS CODE_0391B5                      ;0391B1|B002    |0391B5;
						LDA.B #$28                           ;0391B3|A928    |      ;
	
			CODE_0391B5:
						STA.W r_entity_XPos,X                ;0391B5|9D3804  |030438;
						LDA.B #$08                           ;0391B8|A908    |      ;
						STA.W r_Player_StateDoubled,X        ;0391BA|9D6505  |030565;
						LDY.B #$15                           ;0391BD|A015    |      ;
						BNE CODE_039207                      ;0391BF|D046    |039207;
	
			CODE_0391C1:
						LDY.B #$13                           ;0391C1|A013    |      ;
						BNE CODE_039207                      ;0391C3|D042    |039207;
	
			CODE_0391C5:
						LDA.B r_RNG                          ;0391C5|A51F    |00001F;
						AND.B #$01                           ;0391C7|2901    |      ;
						ORA.W r_entity_target,X              ;0391C9|1D0606  |030606;
						STA.W r_entity_target,X              ;0391CC|9D0606  |030606;
						LDA.W r_entity_YPos,X                ;0391CF|BD1C04  |03041C;
						AND.B #$F0                           ;0391D2|29F0    |      ;
						STA.B $01                            ;0391D4|8501    |000001;
						CMP.B #$60                           ;0391D6|C960    |      ;
						BCC CODE_0391DE                      ;0391D8|9004    |0391DE;
						LDA.B $01                            ;0391DA|A501    |000001;
						BNE CODE_0391E3                      ;0391DC|D005    |0391E3;
	
			CODE_0391DE:
						LDA.B $01                            ;0391DE|A501    |000001;
						CLC                                  ;0391E0|18      |      ;
						ADC.B #$0F                           ;0391E1|690F    |      ;
	
			CODE_0391E3:
						STA.W r_entity_YPos,X                ;0391E3|9D1C04  |03041C;
						LDA.W r_entity_FacingLeft,X          ;0391E6|BDA804  |0304A8;
						EOR.B #$01                           ;0391E9|4901    |      ;
						STA.W r_entity_FacingLeft,X          ;0391EB|9DA804  |0304A8;
						LDY.B #$14                           ;0391EE|A014    |      ;
						LDA.W r_Player_StateDoubled,X        ;0391F0|BD6505  |030565;
						AND.B #$08                           ;0391F3|2908    |      ;
						BEQ CODE_0391F9                      ;0391F5|F002    |0391F9;
						LDY.B #$12                           ;0391F7|A012    |      ;
	
			CODE_0391F9:
						LDA.W r_entity_FacingLeft,X          ;0391F9|BDA804  |0304A8;
						BNE CODE_039202                      ;0391FC|D004    |039202;
						LDA.B #$04                           ;0391FE|A904    |      ;
						BNE CODE_039204                      ;039200|D002    |039204;
	
			CODE_039202:
						LDA.B #$0C                           ;039202|A90C    |      ;
	
			CODE_039204:
						STA.W r_Player_StateDoubled,X        ;039204|9D6505  |030565;
	
			CODE_039207:
						TYA                                  ;039207|98      |      ;
						STA.W r_entity_Counter,X             ;039208|9D3306  |030633;
						LDA.B #$0A                           ;03920B|A90A    |      ;
						db $20                               ;03920D|        |      ;
						dw setSpriteAndAnimGroup_AY_update                       ;03920E|        |0FEF6E;
						db $20                               ;039210|        |      ;
						dw updateSpriteLoop                  ;039211|        |0FEF75;
						LDA.B #$13                           ;039213|A913    |      ;
	
			CODE_039215:
						STA.B $07                            ;039215|8507    |000007;
						JSR.W CODE_039309                    ;039217|200993  |039309;
						CMP.B $07                            ;03921A|C507    |000007;
						BEQ CODE_039233                      ;03921C|F015    |039233;
						CMP.B #$14                           ;03921E|C914    |      ;
						BNE CODE_039225                      ;039220|D003    |039225;
						INC.W r_orb_statesGlobal             ;039222|EEED07  |0307ED;
	
			CODE_039225:
						CMP.B #$12                           ;039225|C912    |      ;
						BNE CODE_03922E                      ;039227|D005    |03922E;
						LDA.B #$00                           ;039229|A900    |      ;
						STA.W r_orb_statesGlobal             ;03922B|8DED07  |0307ED;
	
			CODE_03922E:
						LDA.B $07                            ;03922E|A507    |000007;
						JMP.W spawnA_times_Y_2                    ;039230|4C4C99  |03994C;
	
	
			CODE_039233:
						RTS                                  ;039233|60      |      ;
	
			CODE_039240:
						JSR.W CODE_039309                    ;039240|200993  |039309;
						CMP.B #$22                           ;039243|C922    |      ;
						BEQ CODE_03925C                      ;039245|F015    |03925C;
						CMP.B #$21                           ;039247|C921    |      ;
						BEQ CODE_039263                      ;039249|F018    |039263;
						LDA.B #$20                           ;03924B|A920    |      ;
						JSR.W spawnA_times_Y_12                    ;03924D|207899  |039978;
						LDA.B #$0A                           ;039250|A90A    |      ;
						LDY.B #$18                           ;039252|A018    |      ;
						db $20                               ;039254|        |      ;
						dw setSpriteAndAnimGroup_AY_update                       ;039255|        |0FEF6E;
						LDA.B #$21                           ;039257|A921    |      ;
						JMP.W spawnA_times_Y_2                    ;039259|4C4C99  |03994C;
	
	
			CODE_03925C:
						INC.W r_orb_flagsTimer               ;03925C|EEF307  |0307F3;
						JSR.W spawnA_times_Y_6                    ;03925F|205699  |039956;
						RTS                                  ;039262|60      |      ;
	
	
			CODE_039263:
						LDA.B #$40                           ;039263|A940    |      ;
						STA.W r_entity_mask,X                ;039265|9D7004  |030470;
						LDA.B #$04                           ;039268|A904    |      ;
						LDY.B #$0C                           ;03926A|A00C    |      ;
						db $20                               ;03926C|        |      ;
						dw getCollusionBasedOnOffset         ;03926D|        |0FFC1E;
						BEQ CODE_039274                      ;03926F|F003    |039274;
						INC.W r_entity_AI_IDX,X              ;039271|FEC105  |0305C1;
	
			CODE_039274:			
						RTS                                  ;039274|60      |    


}


{  ; -- 08 viper boss code

		goDrawViperNack:
						JMP.W drawViperNack                    ;038001|4C4A83  |03834A;
	
	
		bossPreview_vipers_08:
						LDA.B r_bossActiveFlag               ;038004|A578    |000078;
						BNE CODE_03800E                      ;038006|D006    |03800E;
						LDA.B #$98                           ;038008|A998    |      ;
						STA.W r_entity_mask,X                ;03800A|9D7004  |030470;
						RTS                                  ;03800D|60      |      ;
	
	
			CODE_03800E:
						LDA.B #$00                           ;03800E|A900    |      ;
						STA.W r_entity_extra,X               ;038010|9DD805  |0305D8;
						
						jsr AND_7F_r_orb_flagsTimer_bank3

						LDA.B #$40                           ;03801B|A940    |      ;
						STA.W r_entity_mask,X                ;03801D|9D7004  |030470;
						RTS                                  ;038020|60      |      ;
	
	
		bossID_vipers_08:
						LDA.B #$08                           ;038021|A908    |      ;
						STA.B r_bossSpecialHitbox            ;038023|85BA    |0000BA;
						LDA.B #$06                           ;038025|A906    |      ;
						STA.B r_bossMeleeHitbox              ;038027|85BB    |0000BB;
						JSR.W setBossEntityDamage_20                    ;038029|203B99  |03993B;
						LDY.W r_entity_target,X              ;03802C|BC0606  |030606;
						BMI goDrawViperNack                      ;03802F|30D0    |038001;
						LDA.W $07F1                          ;038031|ADF107  |0307F1;
						AND.B #$0C                           ;038034|290C    |      ;
						CMP.B #$0C                           ;038036|C90C    |      ;
						BNE CODE_03804C                      ;038038|D012    |03804C;
						LDA.B #$50                           ;03803A|A950    |      ;
						JSR.W spawnA_times_Y_12                    ;03803C|207899  |039978;
						LDA.B #$02                           ;03803F|A902    |      ;
						STA.W r_orb_flagsTimer               ;038041|8DF307  |0307F3;
						LDA.B #$00                           ;038044|A900    |      ;
						JSR.W spawnA_times_Y_6                    ;038046|205699  |039956;
						JMP.W spawnA_4_Y                    ;038049|4C5299  |039952;
	
	
			CODE_03804C:
						LDY.W r_misc_movementState,X         ;03804C|BC4506  |030645;
						LDA.W DATA8_038138,Y                 ;03804F|B93881  |038138;
						STA.B $00                            ;038052|8500    |000000;
						LDA.B $00                            ;038054|A500    |000000;
						AND.W $07F1                          ;038056|2DF107  |0307F1;
						BEQ CODE_03805E                      ;038059|F003    |03805E;
						JMP.W spawnA_4_Y                    ;03805B|4C5299  |039952;
	
	
			CODE_03805E:
						LDA.W r_misc_movementState,X         ;03805E|BD4506  |030645;
						CLC                                  ;038061|18      |      ;
						ADC.B #$01                           ;038062|6901    |      ;
						AND.W $07F1                          ;038064|2DF107  |0307F1;
						BEQ CODE_0380D7                      ;038067|F06E    |0380D7;
						LDA.W r_damagActionFlag,X            ;038069|BD1D06  |03061D;
						BEQ CODE_038091                      ;03806C|F023    |038091;
						LDA.W r_entity_extra,X               ;03806E|BDD805  |0305D8;
						CMP.B #$20                           ;038071|C920    |      ;
						BCC CODE_03808D                      ;038073|9018    |03808D;
						LDA.W r_misc_movementState,X         ;038075|BD4506  |030645;
						ASL A                                ;038078|0A      |      ;
						TAY                                  ;038079|A8      |      ;
						LDA.B #$FE                           ;03807A|A9FE    |      ;
						STA.W r_orb_statesGlobal,Y           ;03807C|99ED07  |0307ED;
						LDA.W r_damagActionFlag,X            ;03807F|BD1D06  |03061D;
						STA.W $07EE,Y                        ;038082|99EE07  |0307EE;
						DEC.W r_damagActionFlag,X            ;038085|DE1D06  |03061D;
						LDA.B #$00                           ;038088|A900    |      ;
						STA.W r_entity_extra,X               ;03808A|9DD805  |0305D8;
	
			CODE_03808D:
						INC.W r_entity_extra,X               ;03808D|FED805  |0305D8;
						RTS                                  ;038090|60      |      ;
	
	
			CODE_038091:
						LDA.W r_entity_AI,X                  ;038091|BDEF05  |0305EF;
						AND.B #$7F                           ;038094|297F    |      ;
						CMP.B #$35                           ;038096|C935    |      ;
						BCS CODE_0380A3                      ;038098|B009    |0380A3;
						LDA.B #$35                           ;03809A|A935    |      ;
						CLC                                  ;03809C|18      |      ;
						ADC.W r_misc_movementState,X         ;03809D|7D4506  |030645;
						JMP.W spawnA_times_Y_2                    ;0380A0|4C4C99  |03994C;
	
	
			CODE_0380A3:
						STA.B $00                            ;0380A3|8500    |000000;
						LDA.B #$35                           ;0380A5|A935    |      ;
						CLC                                  ;0380A7|18      |      ;
						ADC.W r_misc_movementState,X         ;0380A8|7D4506  |030645;
						CMP.B $00                            ;0380AB|C500    |000000;
						BNE CODE_0380C3                      ;0380AD|D014    |0380C3;
						LDA.W r_entity_AI_IDX,X              ;0380AF|BDC105  |0305C1;
						CMP.B #$01                           ;0380B2|C901    |      ;
						BNE CODE_0380C3                      ;0380B4|D00D    |0380C3;
						LDA.W r_entity_YPos,X                ;0380B6|BD1C04  |03041C;
						CMP.B #$C0                           ;0380B9|C9C0    |      ;
						BCC CODE_0380C3                      ;0380BB|9006    |0380C3;
						INC.W r_entity_AI_IDX,X              ;0380BD|FEC105  |0305C1;
						db $4C                               ;0380C0|        |      ;
	
						dw setMovmentSpdZero                 ;0380C1|        |0FFEC8;
	
			CODE_0380C3:
						LDA.W r_entity_AI_IDX,X              ;0380C3|BDC105  |0305C1;
						CMP.B #$11                           ;0380C6|C911    |      ;
						BNE CODE_0380D6                      ;0380C8|D00C    |0380D6;
						LDY.W r_misc_movementState,X         ;0380CA|BC4506  |030645;
						LDA.W DATA8_038138,Y                 ;0380CD|B93881  |038138;
						ORA.W $07F1                          ;0380D0|0DF107  |0307F1;
						STA.W $07F1                          ;0380D3|8DF107  |0307F1;
	
			CODE_0380D6:
						RTS                                  ;0380D6|60      |      ;
	
	
			CODE_0380D7:
						LDA.W r_damagActionFlag,X            ;0380D7|BD1D06  |03061D;
						CMP.B #$02                           ;0380DA|C902    |      ;
						BCC CODE_0380E3                      ;0380DC|9005    |0380E3;
						LDA.B #$01                           ;0380DE|A901    |      ;
						JSR.W spawnA_times_Y_A                    ;0380E0|206299  |039962;
	
			CODE_0380E3:
						LDA.B #$00                           ;0380E3|A900    |      ;
						STA.W r_entity_damageRelated,X       ;0380E5|9D6906  |030669;
						LDA.W r_entity_Health,X              ;0380E8|BD7B06  |03067B;
						BNE CODE_038130                      ;0380EB|D043    |038130;
						LDA.B #$7B                           ;0380ED|A97B    |      ;
						db $20                               ;0380EF|        |      ;
						dw lunchMusic                        ;0380F0|        |0FE25F;
						LDA.W r_misc_movementState,X         ;0380F2|BD4506  |030645;
						CLC                                  ;0380F5|18      |      ;
						ADC.B #$01                           ;0380F6|6901    |      ;
						ORA.W $07F1                          ;0380F8|0DF107  |0307F1;
						STA.W $07F1                          ;0380FB|8DF107  |0307F1;
						db $20                               ;0380FE|        |      ;
						dw setMovmentSpdZero                 ;0380FF|        |0FFEC8;
						LDA.W r_damagActionFlag,X            ;038101|BD1D06  |03061D;
						STA.B $09                            ;038104|8509    |000009;
	
			CODE_038106:
						JSR.W CODE_0383CD                    ;038106|20CD83  |0383CD;
						LDA.B #$10                           ;038109|A910    |      ;
						STA.W r_entity_mask,Y                ;03810B|997004  |030470;
						LDA.B $09                            ;03810E|A509    |000009;
						STA.W r_damagActionFlag,Y            ;038110|991D06  |03061D;
						TXA                                  ;038113|8A      |      ;
						STA.W r_entity_Counter,Y             ;038114|993306  |030633;
						STY.B r_pointerQueue                 ;038117|8408    |000008;
						LDY.B $09                            ;038119|A409    |000009;
						LDA.W DATA8_0383C0,Y                 ;03811B|B9C083  |0383C0;
						LDY.B r_pointerQueue                 ;03811E|A408    |000008;
						CLC                                  ;038120|18      |      ;
						ADC.W r_entity_YPos,X                ;038121|7D1C04  |03041C;
						STA.W r_entity_YPos,Y                ;038124|991C04  |03041C;
						DEC.B $09                            ;038127|C609    |000009;
						LDA.B $09                            ;038129|A509    |000009;
						CMP.B #$01                           ;03812B|C901    |      ;
						BNE CODE_038106                      ;03812D|D0D7    |038106;
						RTS                                  ;03812F|60      |      ;
	
	
			CODE_038130:
						LDY.W r_entity_target,X              ;038130|BC0606  |030606;
						BEQ CODE_03813A                      ;038133|F005    |03813A;
						JMP.W CODE_0381E6                    ;038135|4CE681  |0381E6;
	
	
			DATA8_038138:
						db $04,$08                           ;038138|        |      ;
	
			CODE_03813A:
						LDA.B #$98                           ;03813A|A998    |      ;
						STA.W r_entity_mask,X                ;03813C|9D7004  |030470;
						LDA.W r_entity_extra,X               ;03813F|BDD805  |0305D8;
						BEQ CODE_038147                      ;038142|F003    |038147;
						JMP.W decExtraRTS                    ;038144|4CC281  |0381C2;
	
	
			CODE_038147:
						LDA.W r_hardMode                     ;038147|ADF607  |0307F6;
						BNE CODE_03815C                      ;03814A|D010    |03815C;
						LDA.W r_entity_Counter,X             ;03814C|BD3306  |030633;
						CLC                                  ;03814F|18      |      ;
						ADC.W r_misc_movementState,X         ;038150|7D4506  |030645;
						AND.B #$0F                           ;038153|290F    |      ;
						TAY                                  ;038155|A8      |      ;
						LDA.W DATA8_0381D6,Y                 ;038156|B9D681  |0381D6;
						JMP.W CODE_03816A                    ;038159|4C6A81  |03816A;
	
	
			CODE_03815C:
						LDA.B r_RNG                          ;03815C|A51F    |00001F;
						ADC.W r_entity_Counter,X             ;03815E|7D3306  |030633;
						ADC.W r_misc_movementState,X         ;038161|7D4506  |030645;
						AND.B #$0F                           ;038164|290F    |      ;
						TAY                                  ;038166|A8      |      ;
						LDA.W DATA8_0381C6,Y                 ;038167|B9C681  |0381C6;
	
			CODE_03816A:
						TAY                                  ;03816A|A8      |      ;
						STA.B $03                            ;03816B|8503    |000003;
						LDA.W DATA8_0383F9,Y                 ;03816D|B9F983  |0383F9;
						JSR.W CODE_0384E7                    ;038170|20E784  |0384E7;
						STA.W r_entity_XPos,X                ;038173|9D3804  |030438;
						LDA.B #$C0                           ;038176|A9C0    |      ;
						STA.W r_entity_YPos,X                ;038178|9D1C04  |03041C;
						db $20                               ;03817B|        |      ;
						dw setMovmentSpdZero                 ;03817C|        |0FFEC8;
						LDA.B #$FE                           ;03817E|A9FE    |      ;
						STA.W r_entity_Yspd,X                ;038180|9D2005  |030520;
						LDA.B #$30                           ;038183|A930    |      ;
						db $20                               ;038185|        |      ;
						dw lunchMusic                        ;038186|        |0FE25F;
						INC.W r_entity_target,X              ;038188|FE0606  |030606;
						LDA.B #$00                           ;03818B|A900    |      ;
						STA.W r_damagActionFlag,X            ;03818D|9D1D06  |03061D;
						INC.W r_entity_Counter,X             ;038190|FE3306  |030633;
						LDA.W r_entity_Counter,X             ;038193|BD3306  |030633;
						AND.B #$07                           ;038196|2907    |      ;
						STA.W r_entity_Counter,X             ;038198|9D3306  |030633;
						LDA.W r_misc_movementState,X         ;03819B|BD4506  |030645;
						ASL A                                ;03819E|0A      |      ;
						TAY                                  ;03819F|A8      |      ;
						LDA.B #$00                           ;0381A0|A900    |      ;
						STA.W $07EE,Y                        ;0381A2|99EE07  |0307EE;
						STA.W r_orb_statesGlobal,Y           ;0381A5|99ED07  |0307ED;
						STA.W r_entity_FacingLeft,X          ;0381A8|9DA804  |0304A8;
						LDA.W r_entity_XPos                  ;0381AB|AD3804  |030438;
						CMP.W r_entity_XPos,X                ;0381AE|DD3804  |030438;
						BCS CODE_0381B8                      ;0381B1|B005    |0381B8;
						LDA.B #$01                           ;0381B3|A901    |      ;
						STA.W r_entity_FacingLeft,X          ;0381B5|9DA804  |0304A8;
	
			CODE_0381B8:
						JSR.W CODE_038319                    ;0381B8|201983  |038319;
						LDA.B #$10                           ;0381BB|A910    |      ;
						LDY.B #$08                           ;0381BD|A008    |      ;
						db $4C                               ;0381BF|        |      ;
	
						dw setSpriteAndAnimGroup_AY                 ;0381C0|        |0FEF5C;
	
			decExtraRTS:
						DEC.W r_entity_extra,X               ;0381C2|DED805  |0305D8;
						RTS                                  ;0381C5|60      |      ;
	
	
			DATA8_0381C6:
						db $01,$00,$03,$02,$01,$00,$02,$01   ;0381C6|        |      ;
						db $03,$02,$01,$00,$01,$00,$01,$02   ;0381CE|        |      ;
	
			DATA8_0381D6:
						db $01,$00,$03,$02,$01,$00,$03,$02   ;0381D6|        |      ;
						db $01,$00,$01,$00,$01,$02,$01,$00   ;0381DE|        |      ;
	
			CODE_0381E6:
						DEY                                  ;0381E6|88      |      ;
						BNE CODE_03824C                      ;0381E7|D063    |03824C;
						LDA.B #$40                           ;0381E9|A940    |      ;
						STA.W r_entity_mask,X                ;0381EB|9D7004  |030470;
						LDA.W r_entity_Counter,X             ;0381EE|BD3306  |030633;
						CLC                                  ;0381F1|18      |      ;
						ADC.W r_misc_movementState,X         ;0381F2|7D4506  |030645;
						TAY                                  ;0381F5|A8      |      ;
						LDA.W DATA8_0383FD,Y                 ;0381F6|B9FD83  |0383FD;
						CMP.W r_entity_YPos,X                ;0381F9|DD1C04  |03041C;
						BCC CODE_03820A                      ;0381FC|900C    |03820A;
						STA.W r_entity_YPos,X                ;0381FE|9D1C04  |03041C;
						INC.W r_entity_target,X              ;038201|FE0606  |030606;
						LDA.B #$20                           ;038204|A920    |      ;
						STA.W r_entity_extra,X               ;038206|9DD805  |0305D8;
						RTS                                  ;038209|60      |      ;
	
	
			CODE_03820A:
						JSR.W CODE_0383E7                    ;03820A|20E783  |0383E7;
						CMP.B #$0E                           ;03820D|C90E    |      ;
						BCC CODE_038236                      ;03820F|9025    |038236;
						INC.W r_damagActionFlag,X            ;038211|FE1D06  |03061D;
						LDA.W r_damagActionFlag,X            ;038214|BD1D06  |03061D;
						CMP.B #$02                           ;038217|C902    |      ;
						BCS CODE_038236                      ;038219|B01B    |038236;
						JSR.W CODE_0383CD                    ;03821B|20CD83  |0383CD;
						LDA.B #$00                           ;03821E|A900    |      ;
						STA.W r_entity_mask,Y                ;038220|997004  |030470;
						LDA.W r_damagActionFlag,X            ;038223|BD1D06  |03061D;
						STA.W r_damagActionFlag,Y            ;038226|991D06  |03061D;
						TXA                                  ;038229|8A      |      ;
						STA.W r_entity_Counter,Y             ;03822A|993306  |030633;
						LDA.W r_entity_YPos,Y                ;03822D|B91C04  |03041C;
						CLC                                  ;038230|18      |      ;
						ADC.B #$10                           ;038231|6910    |      ;
						STA.W r_entity_YPos,Y                ;038233|991C04  |03041C;
	
			CODE_038236:
						LDY.B #$08                           ;038236|A008    |      ;
						LDA.W r_entity_YPos,X                ;038238|BD1C04  |03041C;
						CMP.B #$A8                           ;03823B|C9A8    |      ;
						BCS CODE_038247                      ;03823D|B008    |038247;
						LDY.B #$09                           ;03823F|A009    |      ;
						CMP.B #$A0                           ;038241|C9A0    |      ;
						BCS CODE_038247                      ;038243|B002    |038247;
						LDY.B #$0A                           ;038245|A00A    |      ;
	
			CODE_038247:
						LDA.B #$10                           ;038247|A910    |      ;
						db $4C                               ;038249|        |      ;
	
						dw setSpriteAndAnimGroup_AY                 ;03824A|        |0FEF5C;
	
			CODE_03824C:
						DEY                                  ;03824C|88      |      ;
						BEQ CODE_038252                      ;03824D|F003    |038252;
						JMP.W CODE_0382DE                    ;03824F|4CDE82  |0382DE;
	
	
			CODE_038252:
						LDA.W r_entity_extra,X               ;038252|BDD805  |0305D8;
						BEQ CODE_038260                      ;038255|F009    |038260;
						DEC.W r_entity_extra,X               ;038257|DED805  |0305D8;
						db $20                               ;03825A|        |      ;
						dw setMovmentSpdZero                 ;03825B|        |0FFEC8;
						STA.B r_bossState__12      ;03825D|8512    |000012;
						RTS                                  ;03825F|60      |      ;
	
	
			CODE_038260:
						LDA.B #$00                           ;038260|A900    |      ;
						STA.B r_bossState__12      ;038262|8512    |000012;
	
			CODE_038264:
						LDA.B #$1B                           ;038264|A91B    |      ;
						JSR.W spawnA_times_Y_E                    ;038266|206E99  |03996E;
						BCC CODE_0382CA                      ;038269|905F    |0382CA;
						LDA.B #$28                           ;03826B|A928    |      ;
						STA.W r_entity_mask,Y                ;03826D|997004  |030470;
						LDA.B #$52                           ;038270|A952    |      ;
						STA.W r_entity_spriteID,Y            ;038272|990004  |030400;
						LDA.B #$A2                           ;038275|A9A2    |      ;
						STA.W r_entity_AI,Y                  ;038277|99EF05  |0305EF;
						LDA.B #$01                           ;03827A|A901    |      ;
						STA.W r_entity_extra,Y               ;03827C|99D805  |0305D8;
						LDA.B #$14                           ;03827F|A914    |      ;
						STA.W r_entity_spriteGroup,Y         ;038281|998C04  |03048C;
						LDA.B #$00                           ;038284|A900    |      ;
						STA.W r_entity_AI_IDX,Y              ;038286|99C105  |0305C1;
						LDA.W r_entity_YPos,Y                ;038289|B91C04  |03041C;
						SEC                                  ;03828C|38      |      ;
						SBC.B #$0C                           ;03828D|E90C    |      ;
						STA.W r_entity_YPos,Y                ;03828F|991C04  |03041C;
						LDA.B #$10                           ;038292|A910    |      ;
						STA.B r_collisionPointYinScreen      ;038294|8511    |000011;
						LDA.W r_entity_FacingLeft,X          ;038296|BDA804  |0304A8;
						STA.W r_entity_FacingLeft,Y          ;038299|99A804  |0304A8;
						BEQ CODE_0382A2                      ;03829C|F004    |0382A2;
						LDA.B #$F0                           ;03829E|A9F0    |      ;
						STA.B r_collisionPointYinScreen      ;0382A0|8511    |000011;
	
			CODE_0382A2:
						LDA.W r_entity_XPos,Y                ;0382A2|B93804  |030438;
	
						CLC                                  ;0382A5|18      |      ;
						ADC.B r_collisionPointYinScreen      ;0382A6|6511    |000011;
						STA.W r_entity_XPos,Y                ;0382A8|993804  |030438;
						STA.W r_entity_Counter,Y             ;0382AB|993306  |030633;
						JSR.W CODE_0384BB                    ;0382AE|20BB84  |0384BB;
						LDA.B #$00                           ;0382B1|A900    |      ;
						STA.B $17                            ;0382B3|8517    |000017;
						LDA.B r_bossState__12      ;0382B5|A512    |000012;
						BEQ CODE_0382BD                      ;0382B7|F004    |0382BD;
						LDA.B #$08                           ;0382B9|A908    |      ;
						STA.B $17                            ;0382BB|8517    |000017;
	
			CODE_0382BD:
						LDA.B $17                            ;0382BD|A517    |000017;
						STA.W r_entity_target,Y              ;0382BF|990606  |030606;
						INC.B r_bossState__12      ;0382C2|E612    |000012;
						LDA.B r_bossState__12      ;0382C4|A512    |000012;
						CMP.B #$02                           ;0382C6|C902    |      ;
						BCC CODE_038264                      ;0382C8|909A    |038264;
	
			CODE_0382CA:
						INC.W r_entity_target,X              ;0382CA|FE0606  |030606;
						LDA.B #$58                           ;0382CD|A958    |      ;
						STA.W r_entity_extra,X               ;0382CF|9DD805  |0305D8;
						LDA.B #$24                           ;0382D2|A924    |      ;
						db $20                               ;0382D4|        |      ;
						dw lunchMusic                        ;0382D5|        |0FE25F;
						LDY.B #$0B                           ;0382D7|A00B    |      ;
	
			CODE_0382D9:
						LDA.B #$10                           ;0382D9|A910    |      ;
						db $4C                               ;0382DB|        |      ;
	
						dw setSpriteAndAnimGroup_AY                 ;0382DC|        |0FEF5C;
	
			CODE_0382DE:
						DEY                                  ;0382DE|88      |      ;
						BNE CODE_0382F9                      ;0382DF|D018    |0382F9;
						LDA.W r_entity_extra,X               ;0382E1|BDD805  |0305D8;
						BNE CODE_0382F5                      ;0382E4|D00F    |0382F5;
						INC.W r_entity_target,X              ;0382E6|FE0606  |030606;
						db $20                               ;0382E9|        |      ;
						dw setMovmentSpdZero                 ;0382EA|        |0FFEC8;
						LDA.B #$02                           ;0382EC|A902    |      ;
						STA.W r_entity_Yspd,X                ;0382EE|9D2005  |030520;
						LDY.B #$0A                           ;0382F1|A00A    |      ;
						BNE CODE_0382D9                      ;0382F3|D0E4    |0382D9;
	
			CODE_0382F5:
						DEC.W r_entity_extra,X               ;0382F5|DED805  |0305D8;
						RTS                                  ;0382F8|60      |      ;
	
	
			CODE_0382F9:
						LDA.W r_entity_YPos,X                ;0382F9|BD1C04  |03041C;
						CMP.B #$C0                           ;0382FC|C9C0    |      ;
						BCC CODE_03832F                      ;0382FE|902F    |03832F;
						LDA.B #$31                           ;038300|A931    |      ;
						db $20                               ;038302|        |      ;
						dw lunchMusic                        ;038303|        |0FE25F;
						db $20                               ;038305|        |      ;
						dw setMovmentSpdZero                 ;038306|        |0FFEC8;
						STA.W r_entity_target,X              ;038308|9D0606  |030606;
						LDA.B r_RNG                          ;03830B|A51F    |00001F;
						ADC.W r_misc_movementState,X         ;03830D|7D4506  |030645;
						AND.B #$0F                           ;038310|290F    |      ;
						TAY                                  ;038312|A8      |      ;
						LDA.W DATA8_038406,Y                 ;038313|B90684  |038406;
						STA.W r_entity_extra,X               ;038316|9DD805  |0305D8;
	
			CODE_038319:
						LDA.B #$1C                           ;038319|A91C    |      ;
						JSR.W spawnA_times_Y_E                    ;03831B|206E99  |03996E;
						BCC CODE_03832E                      ;03831E|900E    |03832E;
						LDA.B #$10                           ;038320|A910    |      ;
						STA.W r_entity_mask,Y                ;038322|997004  |030470;
						LDA.W r_entity_YPos,Y                ;038325|B91C04  |03041C;
						SEC                                  ;038328|38      |      ;
						SBC.B #$10                           ;038329|E910    |      ;
						STA.W r_entity_YPos,Y                ;03832B|991C04  |03041C;
	
			CODE_03832E:
						RTS                                  ;03832E|60      |      ;
	
	
			CODE_03832F:
						JSR.W CODE_0383E7                    ;03832F|20E783  |0383E7;
						CMP.B #$02                           ;038332|C902    |      ;
						BCS CODE_038349                      ;038334|B013    |038349;
						LDA.W r_misc_movementState,X         ;038336|BD4506  |030645;
						ASL A                                ;038339|0A      |      ;
						TAY                                  ;03833A|A8      |      ;
						LDA.W r_damagActionFlag,X            ;03833B|BD1D06  |03061D;
						STA.W $07EE,Y                        ;03833E|99EE07  |0307EE;
						DEC.W r_damagActionFlag,X            ;038341|DE1D06  |03061D;
						LDA.B #$FF                           ;038344|A9FF    |      ;
						STA.W r_orb_statesGlobal,Y           ;038346|99ED07  |0307ED;
	
			CODE_038349:
						RTS                                  ;038349|60      |      ;
	
	
			drawViperNack:
						JSR.W spawnA_times_Y_14                    ;03834A|207E99  |03997E;
						LDA.W r_misc_movementState,X         ;03834D|BD4506  |030645;
						ASL A                                ;038350|0A      |      ;
						TAY                                  ;038351|A8      |      ;
						LDA.W r_damagActionFlag,X            ;038352|BD1D06  |03061D;
						CMP.W $07EE,Y                        ;038355|D9EE07  |0307EE;
						BNE CODE_038366                      ;038358|D00C    |038366;
						LDA.W r_orb_statesGlobal,Y           ;03835A|B9ED07  |0307ED;
						BEQ CODE_038366                      ;03835D|F007    |038366;
						CMP.B #$FE                           ;03835F|C9FE    |      ;
						BEQ CODE_038392                      ;038361|F02F    |038392;
						JMP.W spawnA_4_Y                    ;038363|4C5299  |039952;
	
	
			CODE_038366:
						LDY.W r_damagActionFlag,X            ;038366|BC1D06  |03061D;
						LDA.W DATA8_0383C0,Y                 ;038369|B9C083  |0383C0;
						LDY.W r_entity_Counter,X             ;03836C|BC3306  |030633;
						CLC                                  ;03836F|18      |      ;
						ADC.W r_entity_YPos,Y                ;038370|791C04  |03041C;
						STA.W r_entity_YPos,X                ;038373|9D1C04  |03041C;
						LDA.W r_misc_movementState,X         ;038376|BD4506  |030645;
						CLC                                  ;038379|18      |      ;
						ADC.B #$01                           ;03837A|6901    |      ;
						AND.W $07F1                          ;03837C|2DF107  |0307F1;
						BNE CODE_03838E                      ;03837F|D00D    |03838E;
						LDA.W r_damagActionFlag,Y            ;038381|B91D06  |03061D;
						TAY                                  ;038384|A8      |      ;
						LDA.W DATA8_0383C7,Y                 ;038385|B9C783  |0383C7;
						TAY                                  ;038388|A8      |      ;
	
			CODE_038389:
						LDA.B #$10                           ;038389|A910    |      ;
						db $4C                               ;03838B|        |      ;
	
						dw setSpriteAndAnimGroup_AY                 ;03838C|        |0FEF5C;
	
			CODE_03838E:
						LDY.B #$0C                           ;03838E|A00C    |      ;
						BNE CODE_038389                      ;038390|D0F7    |038389;
	
			CODE_038392:
						LDA.W r_entity_AI,X                  ;038392|BDEF05  |0305EF;
						AND.B #$7F                           ;038395|297F    |      ;
						CMP.B #$34                           ;038397|C934    |      ;
						BEQ CODE_0383AC                      ;038399|F011    |0383AC;
						LDA.B #$40                           ;03839B|A940    |      ;
						STA.W r_entity_mask,X                ;03839D|9D7004  |030470;
						LDA.B #$10                           ;0383A0|A910    |      ;
						LDY.B #$0D                           ;0383A2|A00D    |      ;
						db $20                               ;0383A4|        |      ;
						dw setSpriteAndAnimGroup_AY                 ;0383A5|        |0FEF5C;
						LDA.B #$34                           ;0383A7|A934    |      ;
						JMP.W spawnA_times_Y_2                    ;0383A9|4C4C99  |03994C;
	
	
			CODE_0383AC:
						LDA.W r_entity_AI_IDX,X              ;0383AC|BDC105  |0305C1;
						CMP.B #$01                           ;0383AF|C901    |      ;
						BNE CODE_0383F8                      ;0383B1|D045    |0383F8;
						LDA.W r_entity_YPos,X                ;0383B3|BD1C04  |03041C;
						CMP.B #$C0                           ;0383B6|C9C0    |      ;
						BCC CODE_0383F8                      ;0383B8|903E    |0383F8;
						INC.W r_entity_AI_IDX,X              ;0383BA|FEC105  |0305C1;
						db $4C                               ;0383BD|        |      ;
	
						dw setMovmentSpdZero                 ;0383BE|        |0FFEC8;
	
			DATA8_0383C0:
						db $00,$08,$18,$28,$38,$48,$58       ;0383C0|        |      ;
	
			DATA8_0383C7:
						db $0C,$0C,$0F,$10,$11,$12           ;0383C7|        |      ;
	
			CODE_0383CD:
						LDA.B #$08                           ;0383CD|A908    |      ;
						JSR.W spawnA_times_Y_E                    ;0383CF|206E99  |03996E;
						LDA.W r_misc_movementState,X         ;0383D2|BD4506  |030645;
						STA.W r_misc_movementState,Y         ;0383D5|994506  |030645;
						LDA.B #$80                           ;0383D8|A980    |      ;
						STA.W r_entity_target,Y              ;0383DA|990606  |030606;
						JSR.W CODE_0384BB                    ;0383DD|20BB84  |0384BB;
						LDA.W r_entity_FacingLeft,X          ;0383E0|BDA804  |0304A8;
						STA.W r_entity_FacingLeft,Y          ;0383E3|99A804  |0304A8;
						RTS                                  ;0383E6|60      |      ;
	
	
			CODE_0383E7:
						LDY.W r_damagActionFlag,X            ;0383E7|BC1D06  |03061D;
						LDA.W DATA8_0383C0,Y                 ;0383EA|B9C083  |0383C0;
						STA.B $00                            ;0383ED|8500    |000000;
						LDA.B #$C0                           ;0383EF|A9C0    |      ;
						SEC                                  ;0383F1|38      |      ;
						SBC.B $00                            ;0383F2|E500    |000000;
						SEC                                  ;0383F4|38      |      ;
						SBC.W r_entity_YPos,X                ;0383F5|FD1C04  |03041C;
	
			CODE_0383F8:
						RTS                                  ;0383F8|60      |      ;
	
	
			DATA8_0383F9:
						db $10,$50,$B0,$F0                   ;0383F9|        |      ;
	
			DATA8_0383FD:
						db $70,$90,$70,$98,$78,$98,$70,$90   ;0383FD|        |      ;
						db $70                               ;038405|        |      ;
	
			DATA8_038406:
						db $60,$28,$58,$50,$48,$4C,$78,$30   ;038406|        |      ;
						db $4C,$20,$6C,$7C,$44,$2C,$34,$54   ;03840E|        |      ;


}


{  ; -- 07 monster (frank)


		bossPreview_monster_07:
						LDA.B r_bossActiveFlag               ;03931B|A578    |000078;
						BEQ CODE_039345                      ;03931D|F026    |039345;
						JSR.W bossEntity_makeActive                    ;03931F|200995  |039509;
						BNE CODE_039330                      ;039322|D00C    |039330;
						LDA.B #$0A                           ;039324|A90A    |      ;
						LDY.B #$49                           ;039326|A049    |      ;
						db $20                               ;039328|        |      ;
						dw setSpriteAndAnimGroup_AY_update                       ;039329|        |0FEF6E;
						LDA.B #$2A                           ;03932B|A92A    |      ;
						JMP.W spawnA_times_Y_2                    ;03932D|4C4C99  |03994C;
	
	
			CODE_039330:
						LDA.W r_entity_XPos,X                ;039330|BD3804  |030438;
						AND.B #$F0                           ;039333|29F0    |      ;
						BNE CODE_039340                      ;039335|D009    |039340;
						LDA.W r_entity_mask,X                ;039337|BD7004  |030470;
						AND.B #$76                           ;03933A|2976    |      ;
						STA.W r_entity_mask,X                ;03933C|9D7004  |030470;
						RTS                                  ;03933F|60      |      ;
	
	
			CODE_039340:
						CMP.B #$40                           ;039340|C940    |      ;
						BEQ CODE_039360                      ;039342|F01C    |039360;
						RTS                                  ;039344|60      |      ;
	
	
			CODE_039345:
						LDA.B #$C9                           ;039345|A9C9    |      ;
						STA.W r_entity_mask,X                ;039347|9D7004  |030470;
						LDA.B #$00                           ;03934A|A900    |      ;
						STA.W r_entity_FacingLeft,X          ;03934C|9DA804  |0304A8;
						LDA.B #$04                           ;03934F|A904    |      ;
						STA.W r_Player_StateDoubled,X        ;039351|9D6505  |030565;
						LDA.B #$F0                           ;039354|A9F0    |      ;
						STA.W r_entity_XPos,X                ;039356|9D3804  |030438;
						LDA.B #$0A                           ;039359|A90A    |      ;
						LDY.B #$49                           ;03935B|A049    |      ;
						db $4C                               ;03935D|        |      ;
	
						dw setSpriteAndAnimGroup_AY_update                       ;03935E|        |0FEF6E;
	
			CODE_039360:
						LDA.B #$00                           ;039360|A900    |      ;
						STA.W r_entity_extra,X               ;039362|9DD805  |0305D8;
						STA.W r_entity_Counter,X             ;039365|9D3306  |030633;
						STA.W r_entity_AI,X                  ;039368|9DEF05  |0305EF;
						STA.W r_entity_AI_IDX,X              ;03936B|9DC105  |0305C1;
						LDA.B #$40                           ;03936E|A940    |      ;
						STA.W r_entity_mask,X                ;039370|9D7004  |030470;
			
			AND_7F_r_orb_flagsTimer_bank3:
						LDA.W r_orb_flagsTimer
						AND.B #$7F                         
						STA.W r_orb_flagsTimer                                   					
						RTS 
	




		bossID_monster_07:
						LDA.W r_orb_flagsTimer               ;03937C|ADF307  |0307F3;
						CMP.B #$01                           ;03937F|C901    |      ;
						BNE CODE_0393B2                      ;039381|D02F    |0393B2;
						STA.B r_IRQFuncIdx                   ;039383|853F    |00003F;
						LDA.B #$00                           ;039385|A900    |      ;
						STA.W r_entity_damage,X              ;039387|9D5706  |030657;
						STA.W r_entity_damageRelated,X       ;03938A|9D6906  |030669;
						JSR.W bossEntity_makeActive                    ;03938D|200995  |039509;
						CMP.B #$2F                           ;039390|C92F    |      ;
						BEQ CODE_0393B1                      ;039392|F01D    |0393B1;
						LDA.B #$30                           ;039394|A930    |      ;
						JSR.W spawnA_times_Y_12                    ;039396|207899  |039978;
						db $20                               ;039399|        |      ;
						dw setMovmentSpdZero                 ;03939A|        |0FFEC8;
						LDA.B #$0A                           ;03939C|A90A    |      ;
						LDY.B #$52                           ;03939E|A052    |      ;
						db $20                               ;0393A0|        |      ;
						dw setSpriteAndAnimGroup_AY_update                       ;0393A1|        |0FEF6E;
						CLC                                  ;0393A3|18      |      ;
						LDA.W r_entity_YPos,X                ;0393A4|BD1C04  |03041C;
						ADC.B #$10                           ;0393A7|6910    |      ;
						STA.W r_entity_YPos,X                ;0393A9|9D1C04  |03041C;
						LDA.B #$2F                           ;0393AC|A92F    |      ;
						JMP.W spawnA_times_Y_2                    ;0393AE|4C4C99  |03994C;
	
	
			CODE_0393B1:
						RTS                                  ;0393B1|60      |      ;
	
	
			CODE_0393B2:
						JSR.W setBossEntityDamage_20                    ;0393B2|203B99  |03993B;
						LDA.B #$00                           ;0393B5|A900    |      ;
						JSR.W spawnA_times_Y_6                    ;0393B7|205699  |039956;
						LDA.W r_entity_damageRelated,X       ;0393BA|BD6906  |030669;
						AND.B #$F0                           ;0393BD|29F0    |      ;
						BEQ CODE_0393E7                      ;0393BF|F026    |0393E7;
						LDA.B #$03                           ;0393C1|A903    |      ;
						JSR.W spawnA_times_Y_8                    ;0393C3|205C99  |03995C;
						JSR.W bossEntity_makeActive                    ;0393C6|200995  |039509;
						CMP.B #$2A                           ;0393C9|C92A    |      ;
						BEQ CODE_0393D1                      ;0393CB|F004    |0393D1;
						CMP.B #$2E                           ;0393CD|C92E    |      ;
						BNE CODE_0393E7                      ;0393CF|D016    |0393E7;
	
			CODE_0393D1:
						LDA.B #$0F                           ;0393D1|A90F    |      ;
						STA.W r_player_WeaImpact,X           ;0393D3|9D8D06  |03068D;
						LDA.B #$01                           ;0393D6|A901    |      ;
						STA.W r_entity_Counter,X             ;0393D8|9D3306  |030633;
						LDA.B #$0A                           ;0393DB|A90A    |      ;
						LDY.B #$54                           ;0393DD|A054    |      ;
						db $20                               ;0393DF|        |      ;
						dw setSpriteAndAnimGroup_AY_update                       ;0393E0|        |0FEF6E;
						LDA.B #$2B                           ;0393E2|A92B    |      ;
						JMP.W spawnA_times_Y_2                    ;0393E4|4C4C99  |03994C;
	
	
			CODE_0393E7:
						JSR.W bossEntity_makeActive                    ;0393E7|200995  |039509;
						CMP.B #$29                           ;0393EA|C929    |      ;
						BEQ CODE_0393F2                      ;0393EC|F004    |0393F2;
						CMP.B #$28                           ;0393EE|C928    |      ;
						BNE CODE_0393F7                      ;0393F0|D005    |0393F7;
	
			CODE_0393F2:
						LDA.B #$00                           ;0393F2|A900    |      ;
						STA.W r_entity_damageRelated,X       ;0393F4|9D6906  |030669;
	
			CODE_0393F7:
						JSR.W bossEntity_makeActive                    ;0393F7|200995  |039509;
						BEQ CODE_0393FF                      ;0393FA|F003    |0393FF;
						JMP.W CODE_03949C                    ;0393FC|4C9C94  |03949C;
	
	
			CODE_0393FF:
						LDA.W r_entity_target,X              ;0393FF|BD0606  |030606;
						BNE CODE_039427                      ;039402|D023    |039427;
						LDA.B #$04                           ;039404|A904    |      ;
						STA.W r_entity_target,X              ;039406|9D0606  |030606;
						LDA.B r_RNG                          ;039409|A51F    |00001F;
						AND.B #$03                           ;03940B|2903    |      ;
						BNE CODE_03941B                      ;03940D|D00C    |03941B;
						LDA.B #$10                           ;03940F|A910    |      ;
						LDY.B #$00                           ;039411|A000    |      ;
						db $20                               ;039413|        |      ;
						dw setSpriteAndAnimGroup_AY_update                       ;039414|        |0FEF6E;
						LDA.B #$29                           ;039416|A929    |      ;
						JMP.W spawnA_times_Y_2                    ;039418|4C4C99  |03994C;
	
	
			CODE_03941B:
						LDA.B #$0A                           ;03941B|A90A    |      ;
						LDY.B #$4D                           ;03941D|A04D    |      ;
						db $20                               ;03941F|        |      ;
						dw setSpriteAndAnimGroup_AY_update                       ;039420|        |0FEF6E;
						LDA.B #$28                           ;039422|A928    |      ;
						JMP.W spawnA_times_Y_2                    ;039424|4C4C99  |03994C;
	
	
			CODE_039427:
						DEC.W r_entity_target,X              ;039427|DE0606  |030606;
						LDA.W r_entity_Counter,X             ;03942A|BD3306  |030633;
						BNE CODE_03944A                      ;03942D|D01B    |03944A;
						LDA.B #$18                           ;03942F|A918    |      ;
						LDY.W r_entity_FacingLeft,X          ;039431|BCA804  |0304A8;
						BEQ CODE_039438                      ;039434|F002    |039438;
						LDA.B #$E8                           ;039436|A9E8    |      ;
	
			CODE_039438:
						LDY.B #$0C                           ;039438|A00C    |      ;
						db $20                               ;03943A|        |      ;
						dw getCollusionBasedOnOffset         ;03943B|        |0FFC1E;
						BEQ CODE_039442                      ;03943D|F003    |039442;
						JSR.W CODE_03948A                    ;03943F|208A94  |03948A;
	
			CODE_039442:
						JSR.W CODE_03949C                    ;039442|209C94  |03949C;
						LDA.W r_damagActionFlag,X            ;039445|BD1D06  |03061D;
						BNE CODE_039470                      ;039448|D026    |039470;
	
			CODE_03944A:
						LDY.B #$04                           ;03944A|A004    |      ;
						LDA.W r_entity_XPos                  ;03944C|AD3804  |030438;
						CMP.W r_entity_XPos,X                ;03944F|DD3804  |030438;
						BCS CODE_039456                      ;039452|B002    |039456;
						LDY.B #$0C                           ;039454|A00C    |      ;
	
			CODE_039456:
						TYA                                  ;039456|98      |      ;
						JSR.W CODE_03948F                    ;039457|208F94  |03948F;
						LDA.B #$0A                           ;03945A|A90A    |      ;
						STA.W r_damagActionFlag,X            ;03945C|9D1D06  |03061D;
						LDA.B #$00                           ;03945F|A900    |      ;
						STA.W r_entity_Counter,X             ;039461|9D3306  |030633;
						LDA.B #$0A                           ;039464|A90A    |      ;
						LDY.B #$50                           ;039466|A050    |      ;
						db $20                               ;039468|        |      ;
						dw setSpriteAndAnimGroup_AY_update                       ;039469|        |0FEF6E;
						LDA.B #$27                           ;03946B|A927    |      ;
						JMP.W spawnA_times_Y_2                    ;03946D|4C4C99  |03994C;
	
	
			CODE_039470:
						DEC.W r_damagActionFlag,X            ;039470|DE1D06  |03061D;
						JSR.W spawnA_0_Y                    ;039473|204899  |039948;
						LDA.B r_RNG                          ;039476|A51F    |00001F;
						AND.B #$03                           ;039478|2903    |      ;
						CMP.B #$01                           ;03947A|C901    |      ;
						BEQ CODE_03948A                      ;03947C|F00C    |03948A;
						LDA.B #$0A                           ;03947E|A90A    |      ;
						LDY.B #$49                           ;039480|A049    |      ;
						db $20                               ;039482|        |      ;
						dw setSpriteAndAnimGroup_AY_update                       ;039483|        |0FEF6E;
						LDA.B #$2A                           ;039485|A92A    |      ;
						JMP.W spawnA_times_Y_2                    ;039487|4C4C99  |03994C;
	
	
			CODE_03948A:
						LDA.W r_Player_StateDoubled,X        ;03948A|BD6505  |030565;
						EOR.B #$08                           ;03948D|4908    |      ;
	
			CODE_03948F:
						STA.W r_Player_StateDoubled,X        ;03948F|9D6505  |030565;
						AND.B #$08                           ;039492|2908    |      ;
						BEQ CODE_039498                      ;039494|F002    |039498;
						LDA.B #$01                           ;039496|A901    |      ;
	
			CODE_039498:
						STA.W r_entity_FacingLeft,X          ;039498|9DA804  |0304A8;
						RTS                                  ;03949B|60      |      ;
	
	
			CODE_03949C:
						LDY.B #$00                           ;03949C|A000    |      ;
						LDA.W r_entity_XPos,X                ;03949E|BD3804  |030438;
						CMP.B #$18                           ;0394A1|C918    |      ;
						BCC CODE_0394AA                      ;0394A3|9005    |0394AA;
						CMP.B #$D8                           ;0394A5|C9D8    |      ;
						BCC CODE_0394B6                      ;0394A7|900D    |0394B6;
						INY                                  ;0394A9|C8      |      ;
	
			CODE_0394AA:
						LDA.W DATA8_0394B7,Y                 ;0394AA|B9B794  |0394B7;
						STA.W r_entity_FacingLeft,X          ;0394AD|9DA804  |0304A8;
						LDA.W DATA8_0394B9,Y                 ;0394B0|B9B994  |0394B9;
						STA.W r_Player_StateDoubled,X        ;0394B3|9D6505  |030565;
	
			CODE_0394B6:
						RTS                                  ;0394B6|60      |      ;
	
	
			DATA8_0394B7:
						db $00,$01                           ;0394B7|        |      ;
	
			DATA8_0394B9:
						db $04,$0C                           ;0394B9|        |      ;
	
			bossID_blockThrow_18:
						JSR.W setBossEntityDamage_20         ;0394BB|203B99  |03993B;
						JSR.W bossEntity_makeActive                    ;0394BE|200995  |039509;
						BEQ CODE_0394CF                      ;0394C1|F00C    |0394CF;
						LDA.W r_entity_YPos,X                ;0394C3|BD1C04  |03041C;
						CMP.B #$70                           ;0394C6|C970    |      ;
						BCC CODE_0394DC                      ;0394C8|9012    |0394DC;
						CMP.B #$90                           ;0394CA|C990    |      ;
						BCS CODE_0394DC                      ;0394CC|B00E    |0394DC;
						RTS                                  ;0394CE|60      |      ;
	
	
			CODE_0394CF:
						LDA.B #$2C                           ;0394CF|A92C    |      ;
						JMP.W spawnA_times_Y_2                    ;0394D1|4C4C99  |03994C;
	
	
			bossID_blockCelling_19:
						JSR.W setBossEntityDamage_20                    ;0394D4|203B99  |03993B;
						JSR.W bossEntity_makeActive                    ;0394D7|200995  |039509;
						BEQ CODE_039504                      ;0394DA|F028    |039504;
	
			CODE_0394DC:
						LDA.W r_entity_AI_IDX,X              ;0394DC|BDC105  |0305C1;
						CMP.B #$04                           ;0394DF|C904    |      ;
						BNE CODE_039503                      ;0394E1|D020    |039503;
						LDA.W r_entity_YPos,X                ;0394E3|BD1C04  |03041C;
						CMP.B #$60                           ;0394E6|C960    |      ;
						BCC CODE_039503                      ;0394E8|9019    |039503;
						LDA.B #$00                           ;0394EA|A900    |      ;
						LDY.B #$08                           ;0394EC|A008    |      ;
						db $20                               ;0394EE|        |      ;
						dw getCollusionBasedOnOffset         ;0394EF|        |0FFC1E;
						BEQ CODE_0394FC                      ;0394F1|F009    |0394FC;
						LDA.B #$11                           ;0394F3|A911    |      ;
						db $20                               ;0394F5|        |      ;
						dw lunchMusic                        ;0394F6|        |0FE25F;
	
			CODE_0394F8:
						INC.W r_entity_AI_IDX,X              ;0394F8|FEC105  |0305C1;
						RTS                                  ;0394FB|60      |      ;
	
	
			CODE_0394FC:
						LDA.W r_entity_YPos,X                ;0394FC|BD1C04  |03041C;
						CMP.B #$B8                           ;0394FF|C9B8    |      ;
						BCS CODE_0394F8                      ;039501|B0F5    |0394F8;
	
			CODE_039503:
						RTS                                  ;039503|60      |      ;
	
	
			CODE_039504:
						LDA.B #$2D                           ;039504|A92D    |      ;
						JMP.W spawnA_times_Y_2                    ;039506|4C4C99  |03994C;
	
	
			bossEntity_makeActive:
						LDA.W r_entity_AI,X                  ;039509|BDEF05  |0305EF;
						AND.B #$7F                           ;03950C|297F    |      ;
						RTS                                  ;03950E|60      |      ;
	



}
	

{  ; -- 09 devil


		bossPreview_devil_09:
						LDA.B r_bossActiveFlag               ;03851A|A578    |000078;
						BNE CODE_03853F                      ;03851C|D021    |03853F;
						LDA.W r_damagActionFlag,X            ;03851E|BD1D06  |03061D;
						BNE CODE_03853E                      ;038521|D01B    |03853E;
						LDY.B r_stage                        ;038523|A432    |000032;
						CPY.B #$03                           ;038525|C003    |      ;
						BEQ CODE_038534                      ;038527|F00B    |038534;
						LDA.B #$30                           ;038529|A930    |      ;
						CPY.B #$0A                           ;03852B|C00A    |      ;
						BEQ CODE_038531                      ;03852D|F002    |038531;
						LDA.B #$50                           ;03852F|A950    |      ;
	
			CODE_038531:
						STA.W r_entity_YPos,X                ;038531|9D1C04  |03041C;
	
			CODE_038534:
						INC.W r_damagActionFlag,X            ;038534|FE1D06  |03061D;
						LDA.B #$10                           ;038537|A910    |      ;
						LDY.B #$39                           ;038539|A039    |      ;
						db $20                               ;03853B|        |      ;
						dw setSpriteAndAnimGroup_AY                 ;03853C|        |0FEF5C;
	
			CODE_03853E:
						RTS                                  ;03853E|60      |      ;
	
	
			CODE_03853F:
						LDA.W $07EE                          ;03853F|ADEE07  |0307EE;
						BEQ CODE_038558                      ;038542|F014    |038558;
						CMP.B #$01                           ;038544|C901    |      ;
						BEQ CODE_03855B                      ;038546|F013    |03855B;
						LDA.B r_stage                        ;038548|A532    |000032;
						CMP.B #$03                           ;03854A|C903    |      ;
						BEQ CODE_03855E                      ;03854C|F010    |03855E;
						LDA.W $07EE                          ;03854E|ADEE07  |0307EE;
						CMP.B #$03                           ;038551|C903    |      ;
						BEQ CODE_03855E                      ;038553|F009    |03855E;
						JMP.W CODE_038627                    ;038555|4C2786  |038627;
	
	
			CODE_038558:
						JMP.W CODE_0386D0                    ;038558|4CD086  |0386D0;
	
	
			CODE_03855B:
						JMP.W CODE_03867F                    ;03855B|4C7F86  |03867F;
	
	
			CODE_03855E:
						LDA.B #$40                           ;03855E|A940    |      ;
						STA.W r_entity_mask,X                ;038560|9D7004  |030470;
						LDY.W r_entity_target,X              ;038563|BC0606  |030606;
						BNE CODE_038585                      ;038566|D01D    |038585;
						LDA.B #$10                           ;038568|A910    |      ;
						LDY.B #$39                           ;03856A|A039    |      ;
						db $20                               ;03856C|        |      ;
						dw setSpriteAndAnimGroup_AY                 ;03856D|        |0FEF5C;
						LDA.B #$26                           ;03856F|A926    |      ;
						STA.B r_CHR_BankSpr_0800             ;038571|8548    |000048;
						LDA.B #$29                           ;038573|A929    |      ;
						STA.B r_CHR_BankSpr_0c00             ;038575|8549    |000049;
						db $20                               ;038577|        |      ;
						dw updateCHR_enemyCHR                ;038578|        |0FE33C;
						INC.W r_entity_target,X              ;03857A|FE0606  |030606;
						LDA.B #$40                           ;03857D|A940    |      ;
						STA.W r_entity_extra,X               ;03857F|9DD805  |0305D8;
						db $4C                               ;038582|        |      ;
	
						dw setMovmentSpdZero                 ;038583|        |0FFEC8;
	
			CODE_038585:
						DEY                                  ;038585|88      |      ;
						BNE CODE_0385DD                      ;038586|D055    |0385DD;
						LDA.W r_entity_extra,X               ;038588|BDD805  |0305D8;
						BEQ CODE_038591                      ;03858B|F004    |038591;
						DEC.W r_entity_extra,X               ;03858D|DED805  |0305D8;
						RTS                                  ;038590|60      |      ;
	
	
			CODE_038591:
						LDA.W r_entity_YPos,X                ;038591|BD1C04  |03041C;
						CMP.B #$70                           ;038594|C970    |      ;
						BCS DATA8_0385CE                     ;038596|B036    |0385CE;
						INC.W r_entity_target,X              ;038598|FE0606  |030606;
						LDA.B #$00                           ;03859B|A900    |      ;
						STA.W r_entity_Yspd,X                ;03859D|9D2005  |030520;
						STA.W r_entity_YsubSpd,X             ;0385A0|9D3705  |030537;
						LDA.B #$07                           ;0385A3|A907    |      ;
						STA.B $17                            ;0385A5|8517    |000017;
	
			CODE_0385A7:
						LDA.B #$09                           ;0385A7|A909    |      ;
						JSR.W spawnA_times_Y_C                    ;0385A9|206899  |039968;
						LDA.B $17                            ;0385AC|A517    |000017;
						STA.W r_damagActionFlag,Y            ;0385AE|991D06  |03061D;
						ASL A                                ;0385B1|0A      |      ;
						ASL A                                ;0385B2|0A      |      ;
						STA.W r_Player_StateDoubled,Y        ;0385B3|996505  |030565;
						LDA.B #$02                           ;0385B6|A902    |      ;
						STA.W r_entity_target,Y              ;0385B8|990606  |030606;
						DEC.B $17                            ;0385BB|C617    |000017;
						BNE CODE_0385A7                      ;0385BD|D0E8    |0385A7;
						LDA.B $17                            ;0385BF|A517    |000017;
						STA.W r_damagActionFlag,X            ;0385C1|9D1D06  |03061D;
						ASL A                                ;0385C4|0A      |      ;
						ASL A                                ;0385C5|0A      |      ;
						STA.W r_Player_StateDoubled,X        ;0385C6|9D6505  |030565;
						LDA.B #$43                           ;0385C9|A943    |      ; head expload
						jmp lunchMusic                        ;0385CC|        |0FE25F;
	
			DATA8_0385CE:
						db $20                               ;0385CE|        |      ;
						dw setMovmentSpdZero                 ;0385CF|        |0FFEC8;
						LDA.B #$FE                           ;0385D1|A9FE    |      ;
						STA.W r_entity_Yspd,X                ;0385D3|9D2005  |030520;
						LDA.B #$10                           ;0385D6|A910    |      ;
						LDY.B #$47                           ;0385D8|A047    |      ;
						jmp setSpriteAndAnimGroup_AY                 ;0385DB|        |0FEF5C;
	
			CODE_0385DD:
						JSR.W bossEntity_makeActive                    ;0385DD|200995  |039509;
						CMP.B #$5A                           ;0385E0|C95A    |      ;
						BEQ CODE_0385F0                      ;0385E2|F00C    |0385F0;
						LDA.B #$10                           ;0385E4|A910    |      ;
						LDY.B #$3A                           ;0385E6|A03A    |      ;
						db $20                               ;0385E8|        |      ;
						dw setSpriteAndAnimGroup_AY                 ;0385E9|        |0FEF5C;
						LDA.B #$DA                           ;0385EB|A9DA    |      ;
						JMP.W spawnA_times_Y_2                    ;0385ED|4C4C99  |03994C;
	
	
			CODE_0385F0:
						LDA.W r_entity_XPos,X                ;0385F0|BD3804  |030438;
						CMP.B #$08                           ;0385F3|C908    |      ;
						BCC CODE_038607                      ;0385F5|9010    |038607;
						CMP.B #$F8                           ;0385F7|C9F8    |      ;
						BCS CODE_038607                      ;0385F9|B00C    |038607;
						LDA.W r_entity_YPos,X                ;0385FB|BD1C04  |03041C;
						CMP.B #$28                           ;0385FE|C928    |      ;
						BCC CODE_038607                      ;038600|9005    |038607;
						CMP.B #$F8                           ;038602|C9F8    |      ;
						BCS CODE_038607                      ;038604|B001    |038607;
						RTS                                  ;038606|60      |      ;
	
	
			CODE_038607:
						JSR.W spawnA_4_Y                    ;038607|205299  |039952;
						LDY.B #$0D                           ;03860A|A00D    |      ;
	
			CODE_03860C:
						LDA.W r_entity_ID,Y                  ;03860C|B94E05  |03054E;
						BNE CODE_038626                      ;03860F|D015    |038626;
						DEY                                  ;038611|88      |      ;
						BNE CODE_03860C                      ;038612|D0F8    |03860C;
						LDA.B #$09                           ;038614|A909    |      ;
						STA.W r_entity_ID,X                  ;038616|9D4E05  |03054E;
						LDA.B #$02                           ;038619|A902    |      ;
						STA.W r_orb_flagsTimer               ;03861B|8DF307  |0307F3;
						JSR.W spawnA_times_Y_6                    ;03861E|205699  |039956;
						LDA.B #$00                           ;038621|A900    |      ;
						STA.W r_entity_ID,X                  ;038623|9D4E05  |03054E;
	
			CODE_038626:
						RTS                                  ;038626|60      |      ;
	
	
			CODE_038627:
						LDA.W $07EF                          ;038627|ADEF07  |0307EF;
						BEQ CODE_03862F                      ;03862A|F003    |03862F;
						JMP.W CODE_03875E                    ;03862C|4C5E87  |03875E;
	
	
			CODE_03862F:
						LDA.W r_entity_target,X              ;03862F|BD0606  |030606;
						AND.B #$80                           ;038632|2980    |      ;
						BNE CODE_03863C                      ;038634|D006    |03863C;
						JSR.W setCHR26_29sprite              ;038636|20C987  |0387C9;
						BCS CODE_03863C                      ;038639|B001    |03863C;
						RTS                                  ;03863B|60      |      ;
	
	
			CODE_03863C:
						LDA.W r_damagActionFlag,X            ;03863C|BD1D06  |03061D;
						BNE CODE_038656                      ;03863F|D015    |038656;
						LDA.B #$80                           ;038641|A980    |      ;
						STA.W r_entity_target,X              ;038643|9D0606  |030606;
						LDA.B #$10                           ;038646|A910    |      ;
						LDY.B #$2B                           ;038648|A02B    |      ;
						db $20                               ;03864A|        |      ;
						dw setSpriteAndAnimGroup_AY                 ;03864B|        |0FEF5C;
						LDA.B #$00                           ;03864D|A900    |      ;
						JSR.W CODE_0387BF                    ;03864F|20BF87  |0387BF;
						INC.W r_damagActionFlag,X            ;038652|FE1D06  |03061D;
						RTS                                  ;038655|60      |      ;
	
	
			CODE_038656:
						JSR.W CODE_0388F0                    ;038656|20F088  |0388F0;
						BCC CODE_038675                      ;038659|901A    |038675;
						JSR.W CODE_038676                    ;03865B|207686  |038676;
						LDA.B #$40                           ;03865E|A940    |      ;
						STA.B r_HUD_healthBoss               ;038660|853D    |00003D;
						STA.W r_entity_Health,X              ;038662|9D7B06  |03067B;
						LDA.B #$00                           ;038665|A900    |      ;
						STA.W r_entity_PaletteOverride,X     ;038667|9D5404  |030454;
						INC.W $07EF                          ;03866A|EEEF07  |0307EF;
						LDA.W r_orb_flagsTimer               ;03866D|ADF307  |0307F3;
						AND.B #$80                           ;038670|2980    |      ;
						STA.W r_orb_flagsTimer               ;038672|8DF307  |0307F3;
	
			CODE_038675:
						RTS                                  ;038675|60      |      ;
	
	
			CODE_038676:
						LDA.B #$00                           ;038676|A900    |      ;
						STA.W r_entity_target,X              ;038678|9D0606  |030606;
						STA.W r_damagActionFlag,X            ;03867B|9D1D06  |03061D;
						RTS                                  ;03867E|60      |      ;
	
	
			CODE_03867F:
						LDA.W r_entity_target,X              ;03867F|BD0606  |030606;
						AND.B #$80                           ;038682|2980    |      ;
						BNE CODE_03868C                      ;038684|D006    |03868C;
						JSR.W setCHR26_29sprite              ;038686|20C987  |0387C9;
						BCS CODE_03868C                      ;038689|B001    |03868C;
						RTS                                  ;03868B|60      |      ;
	
	
			CODE_03868C:
						LDA.W r_damagActionFlag,X            ;03868C|BD1D06  |03061D;
						BNE CODE_0386AC                      ;03868F|D01B    |0386AC;
						LDA.B #$80                           ;038691|A980    |      ;
						STA.W r_entity_target,X              ;038693|9D0606  |030606;
						LDA.B #$0A                           ;038696|A90A    |      ;
						LDY.B #$06                           ;038698|A006    |      ;
						db $20                               ;03869A|        |      ;
						dw setSpriteAndAnimGroup_AY                 ;03869B|        |0FEF5C;
						LDA.B r_stage                        ;03869D|A532    |000032;
						CMP.B #$03                           ;03869F|C903    |      ;
						BNE CODE_0386A8                      ;0386A1|D005    |0386A8;
						LDA.B #$0C                           ;0386A3|A90C    |      ;
						db $20                               ;0386A5|        |      ;
						dw lunchMusic                        ;0386A6|        |0FE25F;
	
			CODE_0386A8:
						INC.W r_damagActionFlag,X            ;0386A8|FE1D06  |03061D;
	
			CODE_0386AB:
						RTS                                  ;0386AB|60      |      ;
	
	
			CODE_0386AC:
						JSR.W CODE_0388F0                    ;0386AC|20F088  |0388F0;
						BCC CODE_0386AB                      ;0386AF|90FA    |0386AB;
						
						jsr AND_7F_r_orb_flagsTimer_bank3
						JSR.W CODE_038676                    ;0386B9|207686  |038676;
						LDA.B #$02                           ;0386BC|A902    |      ;
						STA.W r_entity_ID,X                  ;0386BE|9D4E05  |03054E;
						LDA.B #$40                           ;0386C1|A940    |      ;
						STA.B r_HUD_healthBoss               ;0386C3|853D    |00003D;
						STA.W r_entity_Health,X              ;0386C5|9D7B06  |03067B;
						LDA.B #$00                           ;0386C8|A900    |      ;
						STA.W r_entity_PaletteOverride,X     ;0386CA|9D5404  |030454;
						JMP.W spawnA_10_Y                    ;0386CD|4C7499  |039974;
	
	
			CODE_0386D0:
						LDA.W r_entity_target,X              ;0386D0|BD0606  |030606;
						AND.B #$80                           ;0386D3|2980    |      ;
						BNE CODE_0386DD                      ;0386D5|D006    |0386DD;
						JSR.W setCHR26_29sprite              ;0386D7|20C987  |0387C9;
						BCS CODE_0386DD                      ;0386DA|B001    |0386DD;
						RTS                                  ;0386DC|60      |      ;
	
	
			CODE_0386DD:
						LDA.W r_damagActionFlag,X            ;0386DD|BD1D06  |03061D;
						BNE CODE_0386F2                      ;0386E0|D010    |0386F2;
						LDA.B #$80                           ;0386E2|A980    |      ;
						STA.W r_entity_target,X              ;0386E4|9D0606  |030606;
						LDA.B #$10                           ;0386E7|A910    |      ;
						LDY.B #$3B                           ;0386E9|A03B    |      ;
						db $20                               ;0386EB|        |      ;
						dw setSpriteAndAnimGroup_AY                 ;0386EC|        |0FEF5C;
						INC.W r_damagActionFlag,X            ;0386EE|FE1D06  |03061D;
						RTS                                  ;0386F1|60      |      ;
	
	
			CODE_0386F2:
						JSR.W CODE_0388F0                    ;0386F2|20F088  |0388F0;
						BCC CODE_038735                      ;0386F5|903E    |038735;
						
						jsr AND_7F_r_orb_flagsTimer_bank3
						JSR.W CODE_038676                    ;0386FF|207686  |038676;
						LDA.B #$0E                           ;038702|A90E    |      ;
						STA.W r_entity_ID,X                  ;038704|9D4E05  |03054E;
						JSR.W spawnA_times_Y_C                    ;038707|206899  |039968;
						LDA.B #$40                           ;03870A|A940    |      ;
						STA.B r_HUD_healthBoss               ;03870C|853D    |00003D;
						STA.W r_entity_mask,Y                ;03870E|997004  |030470;
						LSR A                                ;038711|4A      |      ;
						STA.W r_entity_Health,Y              ;038712|997B06  |03067B;
						STA.W r_entity_Health,X              ;038715|9D7B06  |03067B;
						LDA.B #$01                           ;038718|A901    |      ;
						STA.W r_entity_target,Y              ;03871A|990606  |030606;
						db $20                               ;03871D|        |      ;
						dw setMovmentSpdZero                 ;03871E|        |0FFEC8;
						STX.B $17                            ;038720|8617    |000017;
						TYA                                  ;038722|98      |      ;
						TAX                                  ;038723|AA      |      ;
						LDA.B #$10                           ;038724|A910    |      ;
						LDY.B #$3B                           ;038726|A03B    |      ;
						db $20                               ;038728|        |      ;
						dw setSpriteAndAnimGroup_AY                 ;038729|        |0FEF5C;
						LDX.B $17                            ;03872B|A617    |000017;
						LDA.B #$00                           ;03872D|A900    |      ;
						STA.W r_entity_PaletteOverride,X     ;03872F|9D5404  |030454;
						STA.W $07F1                          ;038732|8DF107  |0307F1;
	
			CODE_038735:
						RTS                                  ;038735|60      |      ;
	
						LDA.B #$C8                           ;038736|A9C8    |      ;
						STA.W r_entity_mask,X                ;038738|9D7004  |030470;
						LDA.B #$02                           ;03873B|A902    |      ;
						STA.W $07EE                          ;03873D|8DEE07  |0307EE;
						LDA.B #$00                           ;038740|A900    |      ;
						STA.W r_entity_target,X              ;038742|9D0606  |030606;
						LDA.B #$40                           ;038745|A940    |      ;
						STA.W r_entity_Health,X              ;038747|9D7B06  |03067B;
						STA.B r_HUD_healthBoss,X             ;03874A|953D    |00003D;
						LDA.B #$A0                           ;03874C|A9A0    |      ;
						STA.W r_entity_YPos,X                ;03874E|9D1C04  |03041C;
						STA.W r_entity_XPos,X                ;038751|9D3804  |030438;
						LDY.B #$26                           ;038754|A026    |      ;
						STY.B r_CHR_BankSpr_0800             ;038756|8448    |000048;
						INY                                  ;038758|C8      |      ;
						STY.B r_CHR_BankSpr_0c00             ;038759|8449    |000049;
						db $4C                               ;03875B|        |      ;
	
						dw updateCHR_enemyCHR                ;03875C|        |0FE33C;
	
			CODE_03875E:
						LDY.W r_entity_target,X              ;03875E|BC0606  |030606;
						BNE CODE_038775                      ;038761|D012    |038775;
						LDA.W r_damagActionFlag,X            ;038763|BD1D06  |03061D;
						JSR.W CODE_0387BF                    ;038766|20BF87  |0387BF;
						LDA.B #$00                           ;038769|A900    |      ;
						STA.W r_damagActionFlag,X            ;03876B|9D1D06  |03061D;
						LDA.B #$04                           ;03876E|A904    |      ;
						STA.W r_entity_extra,X               ;038770|9DD805  |0305D8;
						BNE CODE_038798                      ;038773|D023    |038798;
	
			CODE_038775:
						DEY                                  ;038775|88      |      ;
						BNE CODE_03879C                      ;038776|D024    |03879C;
						LDA.B #$40                           ;038778|A940    |      ;
						STA.W r_entity_mask,X                ;03877A|9D7004  |030470;
						DEC.W r_entity_extra,X               ;03877D|DED805  |0305D8;
						BNE CODE_038797                      ;038780|D015    |038797;
						LDA.W r_damagActionFlag,X            ;038782|BD1D06  |03061D;
						JSR.W CODE_0387BF                    ;038785|20BF87  |0387BF;
						INC.W r_damagActionFlag,X            ;038788|FE1D06  |03061D;
						LDA.W r_damagActionFlag,X            ;03878B|BD1D06  |03061D;
						CMP.B #$03                           ;03878E|C903    |      ;
						BEQ CODE_038798                      ;038790|F006    |038798;
						LDA.B #$04                           ;038792|A904    |      ;
						STA.W r_entity_extra,X               ;038794|9DD805  |0305D8;
	
			CODE_038797:
						RTS                                  ;038797|60      |      ;
	
	
			CODE_038798:
						INC.W r_entity_target,X              ;038798|FE0606  |030606;
						RTS                                  ;03879B|60      |      ;
	
	
			CODE_03879C:
						DEY                                  ;03879C|88      |      ;
						BNE CODE_0387AE                      ;03879D|D00F    |0387AE;
						LDA.B #$10                           ;03879F|A910    |      ;
						LDY.B #$2B                           ;0387A1|A02B    |      ;
						db $20                               ;0387A3|        |      ;
						dw setSpriteAndAnimGroup_AY                 ;0387A4|        |0FEF5C;
						LDA.B #$4A                           ;0387A6|A94A    |      ;
						JSR.W spawnA_times_Y_2                    ;0387A8|204C99  |03994C;
						JMP.W CODE_038798                    ;0387AB|4C9887  |038798;
	
	
			CODE_0387AE:
						JSR.W bossEntity_makeActive                    ;0387AE|200995  |039509;
						BEQ CODE_0387B4                      ;0387B1|F001    |0387B4;
						RTS                                  ;0387B3|60      |      ;
	
	
			CODE_0387B4:
						jsr AND_7F_r_orb_flagsTimer_bank3
						JMP.W CODE_038676                    ;0387BC|4C7686  |038676;
	
	
			CODE_0387BF:
						STX.B $02                            ;0387BF|8602    |000002;
						CLC                                  ;0387C1|18      |      ;
						ADC.B #$11                           ;0387C2|6911    |      ;
						STA.B r_bossObject                   ;0387C4|85C1    |0000C1;
						db $4C                               ;0387C6|        |      ;
	
						dw CODE_0FE61E                       ;0387C7|        |0FE61E;

; --------------------------------------------------



		bossID_Devil_09:
						LDA.W $07EE                          ;038A34|ADEE07  |0307EE;
						CMP.B #$02                           ;038A37|C902    |      ;
						beq runDevilBoss
						RTS                                  ;038A3E|60      |      ;
	
			runDevilBoss:
						LDA.W r_entity_XPos,X                ;038C40|BD3804  |030438;
						AND.B #$FC                           ;038C43|29FC    |      ;
						BEQ CODE_038C4D                      ;038C45|F006    |038C4D;
						CMP.B #$FC                           ;038C47|C9FC    |      ;
						BNE CODE_038C52                      ;038C49|D007    |038C52;
						BEQ CODE_038C4F                      ;038C4B|F002    |038C4F;
	
			CODE_038C4D:
						LDA.B #$04                           ;038C4D|A904    |      ;
	
			CODE_038C4F:
						STA.W r_entity_XPos,X                ;038C4F|9D3804  |030438;
	
			CODE_038C52:
						LDA.W r_orb_flagsTimer               ;038C52|ADF307  |0307F3;
						CMP.B #$01                           ;038C55|C901    |      ;
						BNE CODE_038C9B                      ;038C57|D042    |038C9B;
						LDA.B #$01                           ;038C59|A901    |      ;
						STA.B r_IRQFuncIdx                   ;038C5B|853F    |00003F;
						JSR.W bossEntity_makeActive                    ;038C5D|200995  |039509;
						CMP.B #$5B                           ;038C60|C95B    |      ;
						BEQ CODE_038C78                      ;038C62|F014    |038C78;
						LDA.B #$50                           ;038C64|A950    |      ;
						JSR.W spawnA_times_Y_12                    ;038C66|207899  |039978;
						db $20                               ;038C69|        |      ;
						dw setMovmentSpdZero                 ;038C6A|        |0FFEC8;
						LDA.B #$10                           ;038C6C|A910    |      ;
						LDY.B #$45                           ;038C6E|A045    |      ;
						db $20                               ;038C70|        |      ;
						dw setSpriteAndAnimGroup_AY                 ;038C71|        |0FEF5C;
						LDA.B #$5B                           ;038C73|A95B    |      ;
						JMP.W spawnA_times_Y_2                    ;038C75|4C4C99  |03994C;
	
	
			CODE_038C78:
						LDA.W r_entity_AI_IDX,X              ;038C78|BDC105  |0305C1;
						CMP.B #$09                           ;038C7B|C909    |      ;
						BNE CODE_038C9A                      ;038C7D|D01B    |038C9A;
						INC.W $07EE                          ;038C7F|EEEE07  |0307EE;
						LDA.W r_orb_flagsTimer               ;038C82|ADF307  |0307F3;
						ORA.B #$80                           ;038C85|0980    |      ;
						STA.W r_orb_flagsTimer               ;038C87|8DF307  |0307F3;
						JSR.W spawnA_times_Y_18                    ;038C8A|20A099  |0399A0;
						LDA.B #$00                           ;038C8D|A900    |      ;
						STA.W r_entity_AI,X                  ;038C8F|9DEF05  |0305EF;
						STA.W r_entity_AI_IDX,X              ;038C92|9DC105  |0305C1;
						LDA.B #$09                           ;038C95|A909    |      ;
						STA.W r_entity_ID,X                  ;038C97|9D4E05  |03054E;
	
			CODE_038C9A:
						RTS                                  ;038C9A|60      |      ;
	
	
			CODE_038C9B:
						JSR.W spawnA_times_Y_6                    ;038C9B|205699  |039956;
						LDA.W r_orb_flagsTimer               ;038C9E|ADF307  |0307F3;
						BNE CODE_038C9A                      ;038CA1|D0F7    |038C9A;
						LDA.B #$30                           ;038CA3|A930    |      ;
						STA.W r_entity_damage,X              ;038CA5|9D5706  |030657;
						LDA.B #$05                           ;038CA8|A905    |      ;
						JSR.W spawnA_times_Y_8                    ;038CAA|205C99  |03995C;
						JSR.W bossEntity_makeActive                    ;038CAD|200995  |039509;
						BEQ CODE_038CEA                      ;038CB0|F038    |038CEA;
						CMP.B #$4C                           ;038CB2|C94C    |      ;
						BEQ CODE_038CC2                      ;038CB4|F00C    |038CC2;
						CMP.B #$4D                           ;038CB6|C94D    |      ;
						BEQ CODE_038CC6                      ;038CB8|F00C    |038CC6;
						CMP.B #$4E                           ;038CBA|C94E    |      ;
						BNE CODE_038CC1                      ;038CBC|D003    |038CC1;
						JMP.W CODE_038D2C                    ;038CBE|4C2C8D  |038D2C;
	
	
			CODE_038CC1:
						RTS                                  ;038CC1|60      |      ;
	
	
			CODE_038CC2:
						LDA.B #$10                           ;038CC2|A910    |      ;
						BNE CODE_038CC8                      ;038CC4|D002    |038CC8;
	
			CODE_038CC6:
						LDA.B #$0E                           ;038CC6|A90E    |      ;
	
			CODE_038CC8:
						CMP.W r_entity_AI_IDX,X              ;038CC8|DDC105  |0305C1;
						BNE CODE_038CE9                      ;038CCB|D01C    |038CE9;
						LDA.B #$00                           ;038CCD|A900    |      ;
						LDY.B #$20                           ;038CCF|A020    |      ;
						db $20                               ;038CD1|        |      ;
						dw getCollusionBasedOnOffset         ;038CD2|        |0FFC1E;
						BEQ CODE_038CE9                      ;038CD4|F013    |038CE9;
						INC.W r_entity_AI_IDX,X              ;038CD6|FEC105  |0305C1;
						LDA.B #$37                           ;038CD9|A937    |      ;
						db $20                               ;038CDB|        |      ;
						dw lunchMusic                        ;038CDC|        |0FE25F;
						db $20                               ;038CDE|        |      ;
						dw setMovmentSpdZero                 ;038CDF|        |0FFEC8;
						LDA.W r_entity_YPos,X                ;038CE1|BD1C04  |03041C;
						AND.B #$F0                           ;038CE4|29F0    |      ;
						STA.W r_entity_YPos,X                ;038CE6|9D1C04  |03041C;
	
			CODE_038CE9:
						RTS                                  ;038CE9|60      |      ;
	
	
			CODE_038CEA:
						LDA.B #$00                           ;038CEA|A900    |      ;
						STA.W r_entity_FacingLeft,X          ;038CEC|9DA804  |0304A8;
						LDA.B #$04                           ;038CEF|A904    |      ;
						STA.W r_Player_StateDoubled,X        ;038CF1|9D6505  |030565;
						LDA.W r_entity_XPos                  ;038CF4|AD3804  |030438;
						CMP.W r_entity_XPos,X                ;038CF7|DD3804  |030438;
						BCS CODE_038D06                      ;038CFA|B00A    |038D06;
						LDA.B #$01                           ;038CFC|A901    |      ;
						STA.W r_entity_FacingLeft,X          ;038CFE|9DA804  |0304A8;
						LDA.B #$0C                           ;038D01|A90C    |      ;
						STA.W r_Player_StateDoubled,X        ;038D03|9D6505  |030565;
	
			CODE_038D06:
						LDY.W r_entity_target,X              ;038D06|BC0606  |030606;
						LDA.W DATA8_038D8E,Y                 ;038D09|B98E8D  |038D8E;
						ASL A                                ;038D0C|0A      |      ;
						TAY                                  ;038D0D|A8      |      ;
						STY.B $06                            ;038D0E|8406    |000006;
						LDA.W DATA8_038D97,Y                 ;038D10|B9978D  |038D97;
						TAY                                  ;038D13|A8      |      ;
						LDA.B #$10                           ;038D14|A910    |      ;
						db $20                               ;038D16|        |      ;
						dw setSpriteAndAnimGroup_AY                 ;038D17|        |0FEF5C;
						INC.W r_entity_target,X              ;038D19|FE0606  |030606;
						LDA.W r_entity_target,X              ;038D1C|BD0606  |030606;
						AND.B #$07                           ;038D1F|2907    |      ;
						STA.W r_entity_target,X              ;038D21|9D0606  |030606;
						LDY.B $06                            ;038D24|A406    |000006;
						LDA.W DATA8_038D96,Y                 ;038D26|B9968D  |038D96;
						JMP.W spawnA_times_Y_2                    ;038D29|4C4C99  |03994C;
	
	
			CODE_038D2C:
						LDA.W r_entity_AI_IDX,X              ;038D2C|BDC105  |0305C1;
						CMP.B #$02                           ;038D2F|C902    |      ;
						BNE CODE_038D8D                      ;038D31|D05A    |038D8D;
						LDA.W r_entity_FacingLeft,X          ;038D33|BDA804  |0304A8;
						ASL A                                ;038D36|0A      |      ;
						TAY                                  ;038D37|A8      |      ;
						LDA.W DATA8_038D9E,Y                 ;038D38|B99E8D  |038D9E;
						STA.B r_pointerQueue                 ;038D3B|8508    |000008;
						LDA.W DATA8_038D9F,Y                 ;038D3D|B99F8D  |038D9F;
						STA.B $09                            ;038D40|8509    |000009;
						LDA.B #$01                           ;038D42|A901    |      ;
						STA.B $17                            ;038D44|8517    |000017;
	
			CODE_038D46:
						LDA.B #$23                           ;038D46|A923    |      ;
						JSR.W spawnA_times_Y_C                    ;038D48|206899  |039968;
						LDA.W r_entity_XPos,X                ;038D4B|BD3804  |030438;
						STA.W r_entity_XPos,Y                ;038D4E|993804  |030438;
						LDA.W r_entity_YPos,X                ;038D51|BD1C04  |03041C;
						STA.W r_entity_YPos,Y                ;038D54|991C04  |03041C;
						LDA.W r_entity_FacingLeft,X          ;038D57|BDA804  |0304A8;
						STA.W r_entity_FacingLeft,Y          ;038D5A|99A804  |0304A8;
						LDA.B #$CF                           ;038D5D|A9CF    |      ;
						STA.W r_entity_AI,Y                  ;038D5F|99EF05  |0305EF;
						LDA.B #$00                           ;038D62|A900    |      ;
						STA.W r_entity_AI_IDX,Y              ;038D64|99C105  |0305C1;
						LDA.B #$40                           ;038D67|A940    |      ;
						STA.W r_entity_mask,Y                ;038D69|997004  |030470;
						LDA.B $17                            ;038D6C|A517    |000017;
						CLC                                  ;038D6E|18      |      ;
						ADC.W r_Player_StateDoubled,X        ;038D6F|7D6505  |030565;
						STA.W r_Player_StateDoubled,Y        ;038D72|996505  |030565;
						TXA                                  ;038D75|8A      |      ;
						PHA                                  ;038D76|48      |      ;
						TYA                                  ;038D77|98      |      ;
						TAX                                  ;038D78|AA      |      ;
						LDY.B #$0A                           ;038D79|A00A    |      ;
						LDA.B #$14                           ;038D7B|A914    |      ;
						db $20                               ;038D7D|        |      ;
						dw setSpriteAndAnimGroup_AY                 ;038D7E|        |0FEF5C;
						db $20                               ;038D80|        |      ;
						dw updateSpriteLoop                  ;038D81|        |0FEF75;
						PLA                                  ;038D83|68      |      ;
						TAX                                  ;038D84|AA      |      ;
						DEC.B $17                            ;038D85|C617    |000017;
						LDA.B $17                            ;038D87|A517    |000017;
						CMP.B #$FE                           ;038D89|C9FE    |      ;
						BNE CODE_038D46                      ;038D8B|D0B9    |038D46;
	
			CODE_038D8D:
						RTS                                  ;038D8D|60      |      ;
	
	
			DATA8_038D8E:
						db $00,$01,$00,$01,$00,$02,$00,$03   ;038D8E|        |      ;
	
			DATA8_038D96:
						db $4B                               ;038D96|        |      ;
	
			DATA8_038D97:
						db $30,$4C,$31,$4D,$31,$4E,$30       ;038D97|        |      ;
	
			DATA8_038D9E:
						db $00                               ;038D9E|        |      ;
	
			DATA8_038D9F:
						db $00,$00,$00                       ;038D9F|        |      ;
	
			bossID__23:
						LDA.B #$40                           ;038DA2|A940    |      ;
						STA.W r_entity_mask,X                ;038DA4|9D7004  |030470;
						LDA.W r_orb_flagsTimer               ;038DA7|ADF307  |0307F3;
						CMP.B #$01                           ;038DAA|C901    |      ;
						BEQ CODE_038DBA                      ;038DAC|F00C    |038DBA;
						LDA.B #$30                           ;038DAE|A930    |      ;
						STA.W r_entity_damage,X              ;038DB0|9D5706  |030657;
						LDA.W r_entity_damageRelated,X       ;038DB3|BD6906  |030669;
						AND.B #$F0                           ;038DB6|29F0    |      ;
						BEQ CODE_038DC2                      ;038DB8|F008    |038DC2;
	
			CODE_038DBA:
						LDA.B #$00                           ;038DBA|A900    |      ;
						STA.W r_entity_damageRelated,X       ;038DBC|9D6906  |030669;
						JMP.W spawnA_4_Y                    ;038DBF|4C5299  |039952;
	
	
			CODE_038DC2:
						LDA.B #$00                           ;038DC2|A900    |      ;
						SEC                                  ;038DC4|38      |      ;
						SBC.W r_entity_XPos,X                ;038DC5|FD3804  |030438;
						BCS CODE_038DCF                      ;038DC8|B005    |038DCF;
						EOR.B #$FF                           ;038DCA|49FF    |      ;
						CLC                                  ;038DCC|18      |      ;
						ADC.B #$01                           ;038DCD|6901    |      ;
	
			CODE_038DCF:
						CMP.B #$04                           ;038DCF|C904    |      ;
						BCS CODE_038DD6                      ;038DD1|B003    |038DD6;
						JMP.W spawnA_4_Y                    ;038DD3|4C5299  |039952;
	
	
			CODE_038DD6:
						RTS                                  ;038DD6|60      |      ;
	
	
	
			bossID_granDagger_14:
						JSR.W setBossEntityDamage_20         ;039275|203B99  |03993B;
						LDA.W r_entity_target,X              ;039278|BD0606  |030606;
						BNE CODE_03929C                      ;03927B|D01F    |03929C;
						LDA.B #$00                           ;03927D|A900    |      ;
						STA.B $00                            ;03927F|8500    |000000;
						LDA.B #$FA                           ;039281|A9FA    |      ;
						STA.B $01                            ;039283|8501    |000001;
						LDA.B #$04                           ;039285|A904    |      ;
						STA.W r_Player_StateDoubled,X        ;039287|9D6505  |030565;
						LDA.W r_entity_FacingLeft,X          ;03928A|BDA804  |0304A8;
						BEQ CODE_039294                      ;03928D|F005    |039294;
						LDA.B #$0C                           ;03928F|A90C    |      ;
						STA.W r_Player_StateDoubled,X        ;039291|9D6505  |030565;
	
			CODE_039294:
						JSR.W CODE_0392F3                    ;039294|20F392  |0392F3;
						LDA.B #$96                           ;039297|A996    |      ;
						JSR.W spawnA_times_Y_2                    ;039299|204C99  |03994C;
	
			CODE_03929C:
						LDA.W r_orb_flagsTimer               ;03929C|ADF307  |0307F3;
						AND.B #$3F                           ;03929F|293F    |      ;
						BNE CODE_0392B6                      ;0392A1|D013    |0392B6;
						LDA.W r_entity_YPos,X                ;0392A3|BD1C04  |03041C;
						CMP.B #$F8                           ;0392A6|C9F8    |      ;
						BCS CODE_0392B6                      ;0392A8|B00C    |0392B6;
						LDA.W r_entity_XPos,X                ;0392AA|BD3804  |030438;
						CMP.B #$08                           ;0392AD|C908    |      ;
						BCC CODE_0392B6                      ;0392AF|9005    |0392B6;
						CMP.B #$F8                           ;0392B1|C9F8    |      ;
						BCS CODE_0392B6                      ;0392B3|B001    |0392B6;
						RTS                                  ;0392B5|60      |      ;
	
	
			CODE_0392B6:
						JMP.W spawnA_4_Y                    ;0392B6|4C5299  |039952;
	
	
			bossID__15:
						JSR.W setBossEntityDamage_20                    ;0392B9|203B99  |03993B;
						LDA.W r_entity_target,X              ;0392BC|BD0606  |030606;
						BNE CODE_0392F0                      ;0392BF|D02F    |0392F0;
						LDA.B #$10                           ;0392C1|A910    |      ;
						STA.B $00                            ;0392C3|8500    |000000;
						LDA.B #$F8                           ;0392C5|A9F8    |      ;
						STA.B $01                            ;0392C7|8501    |000001;
						LDA.W r_entity_FacingLeft,X          ;0392C9|BDA804  |0304A8;
						BEQ CODE_0392D6                      ;0392CC|F008    |0392D6;
						LDA.B #$F0                           ;0392CE|A9F0    |      ;
						STA.B $00                            ;0392D0|8500    |000000;
						LDA.B #$F8                           ;0392D2|A9F8    |      ;
						STA.B $01                            ;0392D4|8501    |000001;
	
			CODE_0392D6:
						JSR.W CODE_0392F3                    ;0392D6|20F392  |0392F3;
						LDA.W r_entity_XPos                  ;0392D9|AD3804  |030438;
						STA.B $04                            ;0392DC|8504    |000004;
						LDA.W r_entity_YPos                  ;0392DE|AD1C04  |03041C;
						STA.B $05                            ;0392E1|8505    |000005;
						db $20                               ;0392E3|        |      ;
						dw pushCurBankGo6                    ;0392E4|        |0FFF30;
						LDA.B $00                            ;0392E6|A500    |000000;
						STA.W r_Player_StateDoubled,X        ;0392E8|9D6505  |030565;
						LDA.B #$E4                           ;0392EB|A9E4    |      ;
						JSR.W spawnA_times_Y_2                    ;0392ED|204C99  |03994C;
	
			CODE_0392F0:
						JMP.W CODE_03929C                    ;0392F0|4C9C92  |03929C;
	
	
			CODE_0392F3:
						LDA.W r_entity_XPos,X                ;0392F3|BD3804  |030438;
						CLC                                  ;0392F6|18      |      ;
						ADC.B $00                            ;0392F7|6500    |000000;
						STA.W r_entity_XPos,X                ;0392F9|9D3804  |030438;
						LDA.W r_entity_YPos,X                ;0392FC|BD1C04  |03041C;
						CLC                                  ;0392FF|18      |      ;
						ADC.B $01                            ;039300|6501    |000001;
						STA.W r_entity_YPos,X                ;039302|9D1C04  |03041C;
						INC.W r_entity_target,X              ;039305|FE0606  |030606;
						RTS                                  ;039308|60      |      ;
	
	
			CODE_039309:
						LDA.W r_entity_AI,X                  ;039309|BDEF05  |0305EF;
						AND.B #$7F                           ;03930C|297F    |      ;
						RTS                                  ;03930E|60      |      ;
	
	
			CODE_03930F:
						LDY.W r_entity_FacingLeft,X          ;03930F|BCA804  |0304A8;
						LDA.W DATA8_039319,Y                 ;039312|B91993  |039319;
						STA.W r_Player_StateDoubled,X        ;039315|9D6505  |030565;
						RTS                                  ;039318|60      |      ;
	
	
			DATA8_039319:
						db $04,$0C                           ;039319|        |      ;
	


}


{  ; -- 0a medusa 

	
		bossPreview_medusa_0A:
						LDA.W r_entity_mask,X                ;03950F|BD7004  |030470;
						AND.B #$01                           ;039512|2901    |      ;
						BEQ CODE_03951A                      ;039514|F004    |03951A;
						ORA.B #$88                           ;039516|0988    |      ;
						BNE CODE_03951C                      ;039518|D002    |03951C;
	
			CODE_03951A:
						LDA.B #$40                           ;03951A|A940    |      ;
	
			CODE_03951C:
						STA.W r_entity_mask,X                ;03951C|9D7004  |030470;
						LDA.B r_bossActiveFlag               ;03951F|A578    |000078;
						BNE CODE_03952A                      ;039521|D007    |03952A;
						LDA.B #$10                           ;039523|A910    |      ;
						LDY.B #$1B                           ;039525|A01B    |      ;
						db $4C                               ;039527|        |      ;
	
						dw setSpriteAndAnimGroup_AY                 ;039528|        |0FEF5C;
	
			CODE_03952A:
						LDA.W r_entity_target,X              ;03952A|BD0606  |030606;
						CMP.B #$03                           ;03952D|C903    |      ;
						BEQ CODE_039534                      ;03952F|F003    |039534;
						JMP.W CODE_0395D3                    ;039531|4CD395  |0395D3;
	
	
			CODE_039534:
						STX.W r_bossPieces       ;039534|8EEC07  |0307EC;
						LDA.W r_orb_statesGlobal             ;039537|ADED07  |0307ED;
						CMP.B #$07                           ;03953A|C907    |      ;
						BNE CODE_0395B8                      ;03953C|D07A    |0395B8;
						LDA.W r_entity_AI_IDX,X              ;03953E|BDC105  |0305C1;
						CMP.B #$0E                           ;039541|C90E    |      ;
						BNE CODE_0395B8                      ;039543|D073    |0395B8;
						LDA.W r_entity_Counter,X             ;039545|BD3306  |030633;
						CMP.B #$04                           ;039548|C904    |      ;
						BCS CODE_039550                      ;03954A|B004    |039550;
						INC.W r_entity_Counter,X             ;03954C|FE3306  |030633;
						RTS                                  ;03954F|60      |      ;
	
	
			CODE_039550:
						LDA.B #$00                           ;039550|A900    |      ;
						STA.W r_entity_Counter,X             ;039552|9D3306  |030633;
						LDA.B #$08                           ;039555|A908    |      ;
						STA.B $00                            ;039557|8500    |000000;
						LDA.B #$10                           ;039559|A910    |      ;
						STA.B $01                            ;03955B|8501    |000001;
						LDY.B #$1F                           ;03955D|A01F    |      ;
						LDA.W r_damagActionFlag,X            ;03955F|BD1D06  |03061D;
						AND.B #$01                           ;039562|2901    |      ;
						BEQ CODE_039570                      ;039564|F00A    |039570;
						LDA.B #$F8                           ;039566|A9F8    |      ;
						STA.B $00                            ;039568|8500    |000000;
						LDA.B #$F0                           ;03956A|A9F0    |      ;
						STA.B $01                            ;03956C|8501    |000001;
						LDY.B #$20                           ;03956E|A020    |      ;
	
			CODE_039570:
						LDA.W r_entity_XPos,X                ;039570|BD3804  |030438;
						SEC                                  ;039573|38      |      ;
						SBC.B $00                            ;039574|E500    |000000;
						STA.W r_entity_XPos,X                ;039576|9D3804  |030438;
						LDA.W r_entity_YPos,X                ;039579|BD1C04  |03041C;
						CLC                                  ;03957C|18      |      ;
						ADC.B $01                            ;03957D|6501    |000001;
						STA.W r_entity_YPos,X                ;03957F|9D1C04  |03041C;
						LDA.B #$10                           ;039582|A910    |      ;
						db $20                               ;039584|        |      ;
						dw setSpriteAndAnimGroup_AY                 ;039585|        |0FEF5C;
						INC.W r_damagActionFlag,X            ;039587|FE1D06  |03061D;
						LDA.W r_damagActionFlag,X            ;03958A|BD1D06  |03061D;
						CMP.B #$12                           ;03958D|C912    |      ;
						BEQ CODE_039592                      ;03958F|F001    |039592;
						RTS                                  ;039591|60      |      ;
	
	
			CODE_039592:
						jsr AND_7F_r_orb_flagsTimer_bank3
						LDA.B #$00                           ;03959A|A900    |      ;
						STA.W r_bossPieces       ;03959C|8DEC07  |0307EC;
						STA.W r_orb_statesGlobal             ;03959F|8DED07  |0307ED;
						STA.W r_entity_AI,X                  ;0395A2|9DEF05  |0305EF;
						STA.W r_entity_AI_IDX,X              ;0395A5|9DC105  |0305C1;
						LDA.B #$60                           ;0395A8|A960    |      ;
						STA.W r_entity_target,X              ;0395AA|9D0606  |030606;
						LDA.B #$01                           ;0395AD|A901    |      ;
						STA.W r_damagActionFlag,X            ;0395AF|9D1D06  |03061D;
						LDA.B #$0C                           ;0395B2|A90C    |      ;
						STA.W r_Player_StateDoubled,X        ;0395B4|9D6505  |030565;
	
			CODE_0395B7:
						RTS                                  ;0395B7|60      |      ;
	
	
			CODE_0395B8:
						LDA.B #$00                           ;0395B8|A900    |      ;
						STA.W r_damagActionFlag,X            ;0395BA|9D1D06  |03061D;
						JSR.W bossEntity_makeActive                    ;0395BD|200995  |039509;
						BNE CODE_0395B7                      ;0395C0|D0F5    |0395B7;
						LDA.B #$01                           ;0395C2|A901    |      ;
						STA.W r_entity_FacingLeft,X          ;0395C4|9DA804  |0304A8;
						LDA.B #$10                           ;0395C7|A910    |      ;
						LDY.B #$1C                           ;0395C9|A01C    |      ;
						db $20                               ;0395CB|        |      ;
						dw setSpriteAndAnimGroup_AY                 ;0395CC|        |0FEF5C;
						LDA.B #$38                           ;0395CE|A938    |      ;
						JMP.W spawnA_times_Y_2                    ;0395D0|4C4C99  |03994C;
	
	
			CODE_0395D3:
						LDY.W r_bossPieces       ;0395D3|ACEC07  |0307EC;
						LDA.B #$00                           ;0395D6|A900    |      ;
						STA.B $01                            ;0395D8|8501    |000001;
						LDA.W r_entity_XPos,Y                ;0395DA|B93804  |030438;
						SEC                                  ;0395DD|38      |      ;
						SBC.W r_entity_XPos,X                ;0395DE|FD3804  |030438;
						STA.B $00                            ;0395E1|8500    |000000;
						BCS CODE_0395EE                      ;0395E3|B009    |0395EE;
						EOR.B #$FF                           ;0395E5|49FF    |      ;
						CLC                                  ;0395E7|18      |      ;
						ADC.B #$01                           ;0395E8|6901    |      ;
						STA.B $00                            ;0395EA|8500    |000000;
						INC.B $01                            ;0395EC|E601    |000001;
	
			CODE_0395EE:
						LDA.B $00                            ;0395EE|A500    |000000;
						CMP.B #$04                           ;0395F0|C904    |      ;
						BCS CODE_039628                      ;0395F2|B034    |039628;
						LDA.B #$00                           ;0395F4|A900    |      ;
						STA.W r_entity_Xspd,X                ;0395F6|9DF204  |0304F2;
						STA.W r_entity_XsubSpd,X             ;0395F9|9D0905  |030509;
						LDA.B #$00                           ;0395FC|A900    |      ;
						STA.B $03                            ;0395FE|8503    |000003;
						LDY.W r_entity_target,X              ;039600|BC0606  |030606;
						LDA.B #$B8                           ;039603|A9B8    |      ;
						SEC                                  ;039605|38      |      ;
						SBC.W DATA8_03965C,Y                 ;039606|F95C96  |03965C;
						CMP.W r_entity_YPos,X                ;039609|DD1C04  |03041C;
						BCC CODE_03961D                      ;03960C|900F    |03961D;
						LDY.W r_entity_target,X              ;03960E|BC0606  |030606;
						LDA.W DATA8_039654,Y                 ;039611|B95496  |039654;
						ORA.W r_orb_statesGlobal             ;039614|0DED07  |0307ED;
						STA.W r_orb_statesGlobal             ;039617|8DED07  |0307ED;
						JMP.W spawnA_4_Y                    ;03961A|4C5299  |039952;
	
	
			CODE_03961D:
						LDA.B #$FF                           ;03961D|A9FF    |      ;
						STA.W r_entity_Yspd,X                ;03961F|9D2005  |030520;
						LDA.B #$00                           ;039622|A900    |      ;
						STA.W r_entity_YsubSpd,X             ;039624|9D3705  |030537;
	
			CODE_039627:
						RTS                                  ;039627|60      |      ;
	
	
			CODE_039628:
						LDA.B $01                            ;039628|A501    |000001;
						STA.W r_entity_FacingLeft,X          ;03962A|9DA804  |0304A8;
						LDA.B #$01                           ;03962D|A901    |      ;
						STA.W r_entity_Xspd,X                ;03962F|9DF204  |0304F2;
						LDA.B #$00                           ;039632|A900    |      ;
						STA.W r_entity_XsubSpd,X             ;039634|9D0905  |030509;
						LDA.B $01                            ;039637|A501    |000001;
						BEQ CODE_039645                      ;039639|F00A    |039645;
						LDA.B #$FF                           ;03963B|A9FF    |      ;
						STA.W r_entity_Xspd,X                ;03963D|9DF204  |0304F2;
						LDA.B #$00                           ;039640|A900    |      ;
						STA.W r_entity_XsubSpd,X             ;039642|9D0905  |030509;
	
			CODE_039645:
						LDA.W r_damagActionFlag,X            ;039645|BD1D06  |03061D;
						BNE CODE_039627                      ;039648|D0DD    |039627;
						INC.W r_damagActionFlag,X            ;03964A|FE1D06  |03061D;
						LDA.B #$10                           ;03964D|A910    |      ;
						LDY.B #$1B                           ;03964F|A01B    |      ;
						db $4C                               ;039651|        |      ;
	
						dw setSpriteAndAnimGroup_AY                 ;039652|        |0FEF5C;
	
			DATA8_039654:
						db $01,$02,$04,$08,$10,$20,$40,$00   ;039654|        |      ;
	
			DATA8_03965C:
						db $10,$08,$0C,$12,$13,$14,$12       ;03965C|        |      ;
	
			CODE_039663:
						LDA.B #$00                           ;039663|A900    |      ;
						STA.W r_entity_damageRelated,X       ;039665|9D6906  |030669;
						STA.W r_entity_damage,X              ;039668|9D5706  |030657;
						JSR.W bossEntity_makeActive                    ;03966B|200995  |039509;
						CMP.B #$2F                           ;03966E|C92F    |      ;
						BEQ CODE_0396B5                      ;039670|F043    |0396B5;
						LDA.B #$50                           ;039672|A950    |      ;
						JSR.W spawnA_times_Y_12                    ;039674|207899  |039978;
						db $20                               ;039677|        |      ;
						dw setMovmentSpdZero                 ;039678|        |0FFEC8;
						LDA.B #$10                           ;03967A|A910    |      ;
						LDY.B #$1B                           ;03967C|A01B    |      ;
						db $20                               ;03967E|        |      ;
						dw setSpriteAndAnimGroup_AY                 ;03967F|        |0FEF5C;
						CLC                                  ;039681|18      |      ;
						LDA.W r_entity_YPos,X                ;039682|BD1C04  |03041C;
						ADC.B #$08                           ;039685|6908    |      ;
						STA.W r_entity_YPos,X                ;039687|9D1C04  |03041C;
						LDA.B #$2F                           ;03968A|A92F    |      ;
						JMP.W spawnA_times_Y_2                    ;03968C|4C4C99  |03994C;

	
		bossID_medusa_0a:
						LDA.W r_orb_flagsTimer               ;03968F|ADF307  |0307F3;
						CMP.B #$01                           ;039692|C901    |      ;
						BEQ CODE_039663                      ;039694|F0CD    |039663;
						LDA.B #$00                           ;039696|A900    |      ;
						JSR.W spawnA_times_Y_6                    ;039698|205699  |039956;
						LDA.W r_orb_flagsTimer               ;03969B|ADF307  |0307F3;
						CMP.B #$03                           ;03969E|C903    |      ;
						BEQ CODE_0396B5                      ;0396A0|F013    |0396B5;
						LDA.B #$01                           ;0396A2|A901    |      ;
						JSR.W spawnA_times_Y_8                    ;0396A4|205C99  |03995C;
						JSR.W setBossEntityDamage_20                    ;0396A7|203B99  |03993B;
						JSR.W bossEntity_makeActive                    ;0396AA|200995  |039509;
						CMP.B #$39                           ;0396AD|C939    |      ;
						BEQ CODE_0396B5                      ;0396AF|F004    |0396B5;
						CMP.B #$3A                           ;0396B1|C93A    |      ;
						BNE CODE_0396B6                      ;0396B3|D001    |0396B6;
	
			CODE_0396B5:
						RTS                                  ;0396B5|60      |      ;
	
	
			CODE_0396B6:
						LDA.B r_frameCounter                 ;0396B6|A5A3    |0000A3;
						AND.B #$7F                           ;0396B8|297F    |      ;
						BNE CODE_039708                      ;0396BA|D04C    |039708;
						LDA.W r_damagActionFlag,X            ;0396BC|BD1D06  |03061D;
						BNE CODE_039705                      ;0396BF|D044    |039705;
						LDA.B #$04                           ;0396C1|A904    |      ;
						STA.B $05                            ;0396C3|8505    |000005;
						LDA.W r_entity_FacingLeft,X          ;0396C5|BDA804  |0304A8;
						BEQ CODE_0396CE                      ;0396C8|F004    |0396CE;
						LDA.B #$0C                           ;0396CA|A90C    |      ;
						STA.B $05                            ;0396CC|8505    |000005;
	
			CODE_0396CE:
						LDA.B #$04                           ;0396CE|A904    |      ;
						STA.B $04                            ;0396D0|8504    |000004;
	
			CODE_0396D2:
						LDA.B #$1E                           ;0396D2|A91E    |      ;
						JSR.W spawnA_times_Y_C                    ;0396D4|206899  |039968;
						LDA.B $05                            ;0396D7|A505    |000005;
						ASL A                                ;0396D9|0A      |      ;
						STA.W r_Player_StateDoubled,Y        ;0396DA|996505  |030565;
						LDA.W r_entity_FacingLeft,X          ;0396DD|BDA804  |0304A8;
						STA.W r_entity_FacingLeft,Y          ;0396E0|99A804  |0304A8;
						LDA.B $04                            ;0396E3|A504    |000004;
						SEC                                  ;0396E5|38      |      ;
						SBC.B #$01                           ;0396E6|E901    |      ;
						STA.W r_entity_target,Y              ;0396E8|990606  |030606;
						DEC.B $04                            ;0396EB|C604    |000004;
						BNE CODE_0396D2                      ;0396ED|D0E3    |0396D2;
						LDA.B #$06                           ;0396EF|A906    |      ;
						db $20                               ;0396F1|        |      ;
						dw lunchMusic                        ;0396F2|        |0FE25F;
						LDA.B #$01                           ;0396F4|A901    |      ;
						STA.W r_damagActionFlag,X            ;0396F6|9D1D06  |03061D;
						LDA.B #$10                           ;0396F9|A910    |      ;
						LDY.B #$1A                           ;0396FB|A01A    |      ;
						db $20                               ;0396FD|        |      ;
						dw setSpriteAndAnimGroup_AY                 ;0396FE|        |0FEF5C;
						LDA.B #$39                           ;039700|A939    |      ;
						JMP.W spawnA_times_Y_2                    ;039702|4C4C99  |03994C;
	
	
			CODE_039705:
						DEC.W r_damagActionFlag,X            ;039705|DE1D06  |03061D;
	
			CODE_039708:
						LDA.W r_entity_target,X              ;039708|BD0606  |030606;
						BNE CODE_03973B                      ;03970B|D02E    |03973B;
						JSR.W CODE_0397AF                    ;03970D|20AF97  |0397AF;
						LDA.B #$1D                           ;039710|A91D    |      ;
						JSR.W spawnA_times_Y_C                    ;039712|206899  |039968;
						LDA.B $05                            ;039715|A505    |000005;
						STA.W r_Player_StateDoubled,Y        ;039717|996505  |030565;
						LDA.W r_entity_FacingLeft,X          ;03971A|BDA804  |0304A8;
						STA.W r_entity_FacingLeft,Y          ;03971D|99A804  |0304A8;
						JSR.W CODE_03979F                    ;039720|209F97  |03979F;
						LDA.B $05                            ;039723|A505    |000005;
						LDY.B #$14                           ;039725|A014    |      ;
						CMP.B #$1A                           ;039727|C91A    |      ;
						BCS CODE_03972F                      ;039729|B004    |03972F;
						CMP.B #$07                           ;03972B|C907    |      ;
						BCS CODE_039731                      ;03972D|B002    |039731;
	
			CODE_03972F:
						LDY.B #$17                           ;03972F|A017    |      ;
	
			CODE_039731:
						LDA.B #$10                           ;039731|A910    |      ;
						db $20                               ;039733|        |      ;
						dw setSpriteAndAnimGroup_AY                 ;039734|        |0FEF5C;
						LDA.B #$3A                           ;039736|A93A    |      ;
						JMP.W spawnA_times_Y_2                    ;039738|4C4C99  |03994C;
	
	
			CODE_03973B:
						DEC.W r_entity_target,X              ;03973B|DE0606  |030606;
						LDA.W r_entity_XPos,X                ;03973E|BD3804  |030438;
						CMP.B #$38                           ;039741|C938    |      ;
						BCS CODE_039747                      ;039743|B002    |039747;
						LDA.B #$38                           ;039745|A938    |      ;
	
			CODE_039747:
						CMP.B #$E0                           ;039747|C9E0    |      ;
						BCC CODE_03974D                      ;039749|9002    |03974D;
						LDA.B #$DF                           ;03974B|A9DF    |      ;
	
			CODE_03974D:
						STA.W r_entity_XPos,X                ;03974D|9D3804  |030438;
						JSR.W bossEntity_makeActive                    ;039750|200995  |039509;
						CMP.B #$3B                           ;039753|C93B    |      ;
						BEQ CODE_03979E                      ;039755|F047    |03979E;
						CMP.B #$3F                           ;039757|C93F    |      ;
						BEQ CODE_03979E                      ;039759|F043    |03979E;
						CMP.B #$00                           ;03975B|C900    |      ;
						BNE CODE_039766                      ;03975D|D007    |039766;
						LDA.B #$10                           ;03975F|A910    |      ;
						LDY.B #$13                           ;039761|A013    |      ;
						db $20                               ;039763|        |      ;
						dw setSpriteAndAnimGroup_AY                 ;039764|        |0FEF5C;
	
			CODE_039766:
						JSR.W CODE_03985B                    ;039766|205B98  |03985B;
						JSR.W spawnA_times_Y_16                    ;039769|209C99  |03999C;
						LDA.B $00                            ;03976C|A500    |000000;
						CMP.B #$58                           ;03976E|C958    |      ;
						BCS CODE_03978E                      ;039770|B01C    |03978E;
						LDA.W r_entity_XPos,X                ;039772|BD3804  |030438;
						CMP.B #$D0                           ;039775|C9D0    |      ;
						BCS CODE_039781                      ;039777|B008    |039781;
						CMP.B #$40                           ;039779|C940    |      ;
						BCC CODE_039781                      ;03977B|9004    |039781;
	
			CODE_03977D:
						LDA.B #$3F                           ;03977D|A93F    |      ;
						BNE CODE_039790                      ;03977F|D00F    |039790;
	
			CODE_039781:
						LDA.B r_RNG                          ;039781|A51F    |00001F;
						AND.B #$01                           ;039783|2901    |      ;
						BEQ CODE_03977D                      ;039785|F0F6    |03977D;
						JSR.W CODE_03983A                    ;039787|203A98  |03983A;
						LDA.B #$3B                           ;03978A|A93B    |      ;
						BNE CODE_039790                      ;03978C|D002    |039790;
	
			CODE_03978E:
						LDA.B #$3C                           ;03978E|A93C    |      ;
	
			CODE_039790:
						STA.B $01                            ;039790|8501    |000001;
						JSR.W bossEntity_makeActive                    ;039792|200995  |039509;
						CMP.B $01                            ;039795|C501    |000001;
						BEQ CODE_03979E                      ;039797|F005    |03979E;
						LDA.B $01                            ;039799|A501    |000001;
						JMP.W spawnA_times_Y_2                    ;03979B|4C4C99  |03994C;
	
	
			CODE_03979E:
						RTS                                  ;03979E|60      |      ;
	
	
			CODE_03979F:
						LDA.B r_frameCount                   ;03979F|A51A    |00001A;
						AND.B #$03                           ;0397A1|2903    |      ;
						TAY                                  ;0397A3|A8      |      ;
						LDA.W DATA8_0397AB,Y                 ;0397A4|B9AB97  |0397AB;
						STA.W r_entity_target,X              ;0397A7|9D0606  |030606;
						RTS                                  ;0397AA|60      |      ;
	
	
			DATA8_0397AB:
						db $30,$40,$50,$60                   ;0397AB|        |      ;
	
			CODE_0397AF:
						LDA.W r_entity_XPos                  ;0397AF|AD3804  |030438;
						STA.B $04                            ;0397B2|8504    |000004;
						LDY.B #$00                           ;0397B4|A000    |      ;
						LDA.B r_currPartnerID                ;0397B6|A582    |000082;
						AND.B #$04                           ;0397B8|2904    |      ;
						BEQ CODE_0397BD                      ;0397BA|F001    |0397BD;
						INY                                  ;0397BC|C8      |      ;
	
			CODE_0397BD:
						LDA.W DATA8_03980D,Y                 ;0397BD|B90D98  |03980D;
						CLC                                  ;0397C0|18      |      ;
						ADC.W r_entity_YPos                  ;0397C1|6D1C04  |03041C;
						STA.B $05                            ;0397C4|8505    |000005;
						db $20                               ;0397C6|        |      ;
						dw pushCurBankGo6                    ;0397C7|        |0FFF30;
						JSR.W CODE_039813                    ;0397C9|201398  |039813;
						LDA.B $00                            ;0397CC|A500    |000000;
						LDY.W r_entity_FacingLeft,X          ;0397CE|BCA804  |0304A8;
						BEQ DATA8_0397FC                     ;0397D1|F029    |0397FC;
						AND.B #$10                           ;0397D3|2910    |      ;
						BNE CODE_0397F7                      ;0397D5|D020    |0397F7;
						LDY.B #$00                           ;0397D7|A000    |      ;
						LDA.W DATA8_03980F,Y                 ;0397D9|B90F98  |03980F;
						STA.B $01                            ;0397DC|8501    |000001;
						LDA.W DATA8_039811,Y                 ;0397DE|B91198  |039811;
						STA.B $02                            ;0397E1|8502    |000002;
						LDA.B $00                            ;0397E3|A500    |000000;
						AND.B $02                            ;0397E5|2502    |000002;
						PHA                                  ;0397E7|48      |      ;
						SEC                                  ;0397E8|38      |      ;
						SBC.B #$04                           ;0397E9|E904    |      ;
						TAY                                  ;0397EB|A8      |      ;
						PLA                                  ;0397EC|68      |      ;
						EOR.W DATA8_039804,Y                 ;0397ED|590498  |039804;
						STA.B $00                            ;0397F0|8500    |000000;
						ORA.B $01                            ;0397F2|0501    |000001;
						STA.B $05                            ;0397F4|8505    |000005;
						RTS                                  ;0397F6|60      |      ;
	
	
			CODE_0397F7:
						LDA.B $00                            ;0397F7|A500    |000000;
						STA.B $05                            ;0397F9|8505    |000005;
						RTS                                  ;0397FB|60      |      ;
	
	
			DATA8_0397FC:
						db $29,$10,$F0,$F7,$A0,$01,$D0,$D5   ;0397FC|        |      ;
	
			DATA8_039804:
						db $08,$0E,$0C,$0E,$00,$0E,$0C,$0E   ;039804|        |      ;
						db $08                               ;03980C|        |      ;
	
			DATA8_03980D:
						db $00,$10                           ;03980D|        |      ;
	
			DATA8_03980F:
						db $10,$00                           ;03980F|        |      ;
	
			DATA8_039811:
						db $FF,$0F                           ;039811|        |      ;
	
			CODE_039813:
						LDA.B $00                            ;039813|A500    |000000;
						AND.B #$1F                           ;039815|291F    |      ;
						STA.B $00                            ;039817|8500    |000000;
						LDY.B #$00                           ;039819|A000    |      ;
						AND.B #$10                           ;03981B|2910    |      ;
						BNE CODE_039832                      ;03981D|D013    |039832;
	
			CODE_03981F:
						LDA.B $00                            ;03981F|A500    |000000;
						AND.B #$0F                           ;039821|290F    |      ;
						CMP.B #$04                           ;039823|C904    |      ;
						BCC CODE_03982C                      ;039825|9005    |03982C;
						CMP.B #$0D                           ;039827|C90D    |      ;
						BCC CODE_039831                      ;039829|9006    |039831;
						INY                                  ;03982B|C8      |      ;
	
			CODE_03982C:
						LDA.W CODE_039836,Y                  ;03982C|B93698  |039836;
						STA.B $00                            ;03982F|8500    |000000;
	
			CODE_039831:
						RTS                                  ;039831|60      |      ;
	
	
			CODE_039832:
						LDY.B #$02                           ;039832|A002    |      ;
						BNE CODE_03981F                      ;039834|D0E9    |03981F;
	
			CODE_039836:
						TSB.B r_tempCurrGroup                ;039836|040C    |00000C;
						TRB.B r_counter_ShowSprBg            ;039838|141C    |00001C;
	
			CODE_03983A:
						LDA.B #$00                           ;03983A|A900    |      ;
						STA.W r_entity_FacingLeft,X          ;03983C|9DA804  |0304A8;
						LDA.W r_entity_XPos                  ;03983F|AD3804  |030438;
						CMP.W r_entity_XPos,X                ;039842|DD3804  |030438;
						BCS CODE_039855                      ;039845|B00E    |039855;
	
			CODE_039847:
						LDA.B #$0C                           ;039847|A90C    |      ;
						STA.W r_Player_StateDoubled,X        ;039849|9D6505  |030565;
						LDA.W r_entity_FacingLeft,X          ;03984C|BDA804  |0304A8;
						EOR.B #$01                           ;03984F|4901    |      ;
						STA.W r_entity_FacingLeft,X          ;039851|9DA804  |0304A8;
						RTS                                  ;039854|60      |      ;
	
	
			CODE_039855:
						LDA.B #$04                           ;039855|A904    |      ;
						STA.W r_Player_StateDoubled,X        ;039857|9D6505  |030565;
						RTS                                  ;03985A|60      |      ;
	
	
			CODE_03985B:
						LDA.B #$01                           ;03985B|A901    |      ;
						STA.W r_entity_FacingLeft,X          ;03985D|9DA804  |0304A8;
						LDA.W r_entity_XPos                  ;039860|AD3804  |030438;
						CMP.W r_entity_XPos,X                ;039863|DD3804  |030438;
						BCC CODE_039855                      ;039866|90ED    |039855;
						BCS CODE_039847                      ;039868|B0DD    |039847;
	
			bossID__1d:
						JSR.W setBossEntityDamage_20                    ;03986A|203B99  |03993B;
						JSR.W bossEntity_makeActive                    ;03986D|200995  |039509;
						CMP.B #$3E                           ;039870|C93E    |      ;
						BEQ CODE_0398CA                      ;039872|F056    |0398CA;
						LDA.W r_Player_StateDoubled,X        ;039874|BD6505  |030565;
						LDY.B #$01                           ;039877|A001    |      ;
						CMP.B #$07                           ;039879|C907    |      ;
						BCC CODE_039882                      ;03987B|9005    |039882;
						CMP.B #$1A                           ;03987D|C91A    |      ;
						BCS CODE_039882                      ;03987F|B001    |039882;
						DEY                                  ;039881|88      |      ;
	
			CODE_039882:
						LDA.W DATA8_0398E4,Y                 ;039882|B9E498  |0398E4;
						STA.B $00                            ;039885|8500    |000000;
						LDA.W DATA8_0398E6,Y                 ;039887|B9E698  |0398E6;
						STA.B $01                            ;03988A|8501    |000001;
						LDA.W DATA8_0398E8,Y                 ;03988C|B9E898  |0398E8;
						STA.B $02                            ;03988F|8502    |000002;
						LDA.W r_entity_YPos,X                ;039891|BD1C04  |03041C;
						SEC                                  ;039894|38      |      ;
						SBC.B $00                            ;039895|E500    |000000;
						STA.W r_entity_YPos,X                ;039897|9D1C04  |03041C;
						LDA.W r_entity_FacingLeft,X          ;03989A|BDA804  |0304A8;
						BEQ CODE_0398A3                      ;03989D|F004    |0398A3;
						LDA.B $01                            ;03989F|A501    |000001;
						BNE CODE_0398A5                      ;0398A1|D002    |0398A5;
	
			CODE_0398A3:
						LDA.B $02                            ;0398A3|A502    |000002;
	
			CODE_0398A5:
						CLC                                  ;0398A5|18      |      ;
						ADC.W r_entity_XPos,X                ;0398A6|7D3804  |030438;
						STA.W r_entity_XPos,X                ;0398A9|9D3804  |030438;
						LDA.B #$40                           ;0398AC|A940    |      ;
						STA.W r_entity_mask,X                ;0398AE|9D7004  |030470;
						LDA.W r_Player_StateDoubled,X        ;0398B1|BD6505  |030565;
						LDY.B #$22                           ;0398B4|A022    |      ;
						CMP.B #$07                           ;0398B6|C907    |      ;
						BCC CODE_0398C0                      ;0398B8|9006    |0398C0;
						CMP.B #$1A                           ;0398BA|C91A    |      ;
						BCS CODE_0398C0                      ;0398BC|B002    |0398C0;
						LDY.B #$21                           ;0398BE|A021    |      ;
	
			CODE_0398C0:
						LDA.B #$10                           ;0398C0|A910    |      ;
						db $20                               ;0398C2|        |      ;
						dw setSpriteAndAnimGroup_AY                 ;0398C3|        |0FEF5C;
						LDA.B #$3E                           ;0398C5|A93E    |      ;
						JMP.W spawnA_times_Y_2                    ;0398C7|4C4C99  |03994C;
	
	
			CODE_0398CA:
						LDA.W r_entity_XPos,X                ;0398CA|BD3804  |030438;
						CMP.B #$F8                           ;0398CD|C9F8    |      ;
						BCS CODE_0398E0                      ;0398CF|B00F    |0398E0;
						CMP.B #$08                           ;0398D1|C908    |      ;
						BCC CODE_0398E0                      ;0398D3|900B    |0398E0;
						LDA.W r_entity_YPos,X                ;0398D5|BD1C04  |03041C;
						CMP.B #$20                           ;0398D8|C920    |      ;
						BCC CODE_0398E0                      ;0398DA|9004    |0398E0;
						CMP.B #$F8                           ;0398DC|C9F8    |      ;
						BCC CODE_0398E3                      ;0398DE|9003    |0398E3;
	
			CODE_0398E0:
						JMP.W spawnA_4_Y                    ;0398E0|4C5299  |039952;
	
	
			CODE_0398E3:
						RTS                                  ;0398E3|60      |      ;
	
	
			DATA8_0398E4:
						db $06,$0C                           ;0398E4|        |      ;
	
			DATA8_0398E6:
						db $E8,$F0                           ;0398E6|        |      ;
	
			DATA8_0398E8:
						db $18,$10                           ;0398E8|        |      ;
	
			bossID__1e:
						LDA.B #$0D                           ;0398EA|A90D    |      ;
						STA.W r_entity_damage,X              ;0398EC|9D5706  |030657;
						JSR.W bossEntity_makeActive                    ;0398EF|200995  |039509;
						CMP.B #$3D                           ;0398F2|C93D    |      ;
						BEQ CODE_039934                      ;0398F4|F03E    |039934;
						db $20                               ;0398F6|        |      ;
						dw setMovmentSpdZero                 ;0398F7|        |0FFEC8;
						LDA.W r_entity_YPos,X                ;0398F9|BD1C04  |03041C;
						SEC                                  ;0398FC|38      |      ;
						SBC.B #$0E                           ;0398FD|E90E    |      ;
						STA.W r_entity_YPos,X                ;0398FF|9D1C04  |03041C;
						LDA.W r_entity_FacingLeft,X          ;039902|BDA804  |0304A8;
						BNE CODE_03990B                      ;039905|D004    |03990B;
						LDA.B #$10                           ;039907|A910    |      ;
						BNE CODE_03990D                      ;039909|D002    |03990D;
	
			CODE_03990B:
						LDA.B #$F0                           ;03990B|A9F0    |      ;
	
			CODE_03990D:
						CLC                                  ;03990D|18      |      ;
						ADC.W r_entity_XPos,X                ;03990E|7D3804  |030438;
						STA.W r_entity_XPos,X                ;039911|9D3804  |030438;
						LDA.B #$40                           ;039914|A940    |      ;
						STA.W r_entity_mask,X                ;039916|9D7004  |030470;
						LDA.W r_entity_XPos,X                ;039919|BD3804  |030438;
						STA.W r_damagActionFlag,X            ;03991C|9D1D06  |03061D;
						LDY.W r_entity_target,X              ;03991F|BC0606  |030606;
						LDA.W DATA8_039937,Y                 ;039922|B93799  |039937;
						STA.W r_entity_extra,X               ;039925|9DD805  |0305D8;
						LDA.B #$10                           ;039928|A910    |      ;
						LDY.B #$23                           ;03992A|A023    |      ;
						db $20                               ;03992C|        |      ;
						dw setSpriteAndAnimGroup_AY                 ;03992D|        |0FEF5C;
						LDA.B #$3D                           ;03992F|A93D    |      ;
						JMP.W spawnA_times_Y_2                    ;039931|4C4C99  |03994C;
	
	
			CODE_039934:
						JMP.W CODE_0398CA                    ;039934|4CCA98  |0398CA;
	
	
			DATA8_039937:
						db $21,$31,$41,$51                   ;039937|        |      ;
	
			setBossEntityDamage_20:
						LDA.B #$20                           ;03993B|A920    |      ;
						LDY.W r_hardMode                     ;03993D|ACF607  |0307F6;
						BEQ CODE_039944                      ;039940|F002    |039944;
						LDA.B #$30                           ;039942|A930    |      ;
	
			CODE_039944:
						STA.W r_entity_damage,X              ;039944|9D5706  |030657;
						RTS                                  ;039947|60      |      ;
	
	
			spawnA_0_Y:
						LDY.B #$00                           ;039948|A000    |      ;
						BEQ spawnAY_bank9                      ;03994A|F036    |039982;
	
			spawnA_times_Y_2:
						STA.B r_tempCurrRoomIdx              ;03994C|850E    |00000E;
						LDY.B #$02                           ;03994E|A002    |      ;
						BNE spawnAYtimes_bank9_IDX_0EtoA                       ;039950|D03D    |03998F;
	
			spawnA_4_Y:
						LDY.B #$04                           ;039952|A004    |      ;
						BNE spawnAY_bank9                      ;039954|D02C    |039982;
	
			spawnA_times_Y_6:
						STA.B r_tempCurrRoomIdx              ;039956|850E    |00000E;
						LDY.B #$06                           ;039958|A006    |      ;
						BNE spawnAYtimes_bank9_IDX_0EtoA                       ;03995A|D033    |03998F;
	
			spawnA_times_Y_8:
						STA.B r_tempCurrRoomIdx              ;03995C|850E    |00000E;
						LDY.B #$08                           ;03995E|A008    |      ;
						BNE spawnAYtimes_bank9_IDX_0EtoA                       ;039960|D02D    |03998F;
	
			spawnA_times_Y_A:
						STA.B r_tempCurrRoomIdx              ;039962|850E    |00000E;
						LDY.B #$0A                           ;039964|A00A    |      ;
						BNE spawnAYtimes_bank9_IDX_0EtoA                       ;039966|D027    |03998F;
	
			spawnA_times_Y_C:
						STA.B r_tempCurrRoomIdx              ;039968|850E    |00000E;
						LDY.B #$0C                           ;03996A|A00C    |      ;
						BNE spawnAYtimes_bank9_IDX_0EtoA                       ;03996C|D021    |03998F;
	
			spawnA_times_Y_E:
						STA.B r_tempCurrRoomIdx              ;03996E|850E    |00000E;
						LDY.B #$0E                           ;039970|A00E    |      ;
						BNE spawnAYtimes_bank9_IDX_0EtoA                       ;039972|D01B    |03998F;
	
			spawnA_10_Y:
						LDY.B #$10                           ;039974|A010    |      ;
						BNE spawnAY_bank9                      ;039976|D00A    |039982;
	
			spawnA_times_Y_12:
						STA.B r_tempCurrRoomIdx              ;039978|850E    |00000E;
						LDY.B #$12                           ;03997A|A012    |      ;
						BNE spawnAYtimes_bank9_IDX_0EtoA                       ;03997C|D011    |03998F;
	
			spawnA_times_Y_14:
						LDY.B #$14                           ;03997E|A014    |      ;
						BNE spawnAYtimes_bank9_IDX_0EtoA                       ;039980|D00D    |03998F;
	
			spawnAY_bank9:
						LDA.W spawnEntityA_Y_times,Y                 ;039982|B9A499  |0399A4;
						STA.B $00                            ;039985|8500    |000000;
						LDA.W spawnEntityA_Y_times+1,Y                 ;039987|B9A599  |0399A5;
						STA.B $01                            ;03998A|8501    |000001;
	
	writePointer_00_goBank9:
						jmp runRAM_00_inBank9                 ;03998D|        |0FE62D;
	
			spawnAYtimes_bank9_IDX_0EtoA:
						LDA.W spawnEntityA_Y_times,Y                 ;03998F|B9A499  |0399A4;
						STA.B $00                            ;039992|8500    |000000;
						LDA.W spawnEntityA_Y_times+1,Y                 ;039994|B9A599  |0399A5;
						STA.B $01                            ;039997|8501    |000001;
						jmp runRAM_00_inBank9_IDX_0EtoA           ;03999A|        |0FE641;
	
			spawnA_times_Y_16:
						LDY.B #$16                           ;03999C|A016    |      ;
						BNE spawnAYtimes_bank9_IDX_0EtoA                       ;03999E|D0EF    |03998F;
	
			spawnA_times_Y_18:
						LDY.B #$18                           ;0399A0|A018    |      ;
						BNE spawnAYtimes_bank9_IDX_0EtoA                       ;0399A2|D0EB    |03998F;
	
			spawnEntityA_Y_times:
						dw setEnityAi_RNG_00                 ;0399A4|        |09A13B;
						dw setEnityAi_scriptIDX_01           ;0399A6|        |09864F;
						dw clear_bossSlot_02                ;0399A8|        |09873A;
						dw setEntity_stats_03                ;0399AA|        |0987F4;
						dw setEntity__04                     ;0399AC|        |0988E0;
						dw setEntity__05                     ;0399AE|        |098905;
						dw setEntity_pos_06                  ;0399B0|        |098766;
						dw setEntity__07                     ;0399B2|        |0987C5;
						dw setEntity__08                     ;0399B4|        |09A500;
						dw setEntity__09                     ;0399B6|        |098661;
						dw setEntity__0A                     ;0399B8|        |098231;
						dw setEntity__0B                     ;0399BA|        |098608;
						dw setEntity_resetTarget_0C          ;0399BC|        |09B562;
	


}


{  ; -- 0c death

		bossPreview_death_0C:
						LDA.W r_Player_StateDoubled,X        ;0399BE|BD6505  |030565;
						jsr jumpFromStackYXpreserved         ;0399C2|        |0FE86D;
						dw CODE_0399C8                       ;0399C4|        |0399C8;
						dw CODE_0399F1                       ;0399C6|        |0399F1;
 
			CODE_0399C8: 
						LDA.B #$10                           ;0399C8|A910    |      ;
						LDY.B #$48                           ;0399CA|A048    |      ;
						jsr setSpriteAndAnimGroup_AY          ;0399CD|        |0FEF5C;
						LDA.B #$58                           ;0399CF|A958    |      ;
						STA.W r_entity_mask,X                ;0399D1|9D7004  |030470;
						LDA.B r_bossActiveFlag               ;0399D4|A578    |000078;
						BEQ CODE_0399F0                      ;0399D6|F018    |0399F0;
						DEC.W r_misc_movementState,X         ;0399D8|DE4506  |030645;
						DEC.W r_misc_movementState,X         ;0399DB|DE4506  |030645;
						BNE CODE_0399F0                      ;0399DE|D010    |0399F0;
						JSR.W CODE_039C01                    ;0399E0|20019C  |039C01;
						LDA.B #$A7                           ;0399E3|A9A7    |      ;
						STA.W r_orb_statesGlobal             ;0399E5|8DED07  |0307ED;
						LDA.B #$78                           ;0399E8|A978    |      ;
						STA.W r_misc_movementState,X         ;0399EA|9D4506  |030645;
						INC.W r_Player_StateDoubled,X        ;0399ED|FE6505  |030565;
	
			CODE_0399F0: 
						RTS                                  ;0399F0|60      |      ;
	
	
			CODE_0399F1: 
						LDA.W r_entity_mask,X                ;0399F1|BD7004  |030470;
						EOR.B #$08                           ;0399F4|4908    |      ;
						STA.W r_entity_mask,X                ;0399F6|9D7004  |030470;
						DEC.W r_misc_movementState,X         ;0399F9|DE4506  |030645;
						BNE CODE_039A13                      ;0399FC|D015    |039A13;
						LDA.B #$40                           ;0399FE|A940    |      ;
						STA.W r_entity_mask,X                ;039A00|9D7004  |030470;
						INC.W r_misc_movementState,X         ;039A03|FE4506  |030645;
						LDA.B #$00                           ;039A06|A900    |      ;
						STA.W r_orb_flagsTimer               ;039A08|8DF307  |0307F3;
						STA.W r_Player_StateDoubled,X        ;039A0B|9D6505  |030565;
						LDA.B #$04                           ;039A0E|A904    |      ;
						STA.W r_bossProgress                 ;039A10|8DEE07  |0307EE;
	
			CODE_039A13:
						RTS                                  ;039A13|60      |      ;
 
 
	
		bossID_death_0c:
						JSR.W CODE_039A1A                    ;039A14|201A9A  |039A1A;
						LDX.B r_entityID_processed           ;039A17|A66C    |00006C;
						RTS                                  ;039A19|60      |      ;
	
	
			CODE_039A1A:
						LDA.B #$00                           ;039A1A|A900    |      ;
						JSR.W spawnA_times_Y_6                    ;039A1C|205699  |039956;
						INC.W r_orb_statesGlobal             ;039A1F|EEED07  |0307ED;
						JSR.W CODE_039B0A                    ;039A22|200A9B  |039B0A;
						JSR.W CODE_039C0E                    ;039A25|200E9C  |039C0E;
						LDX.B r_entityID_processed           ;039A28|A66C    |00006C;
						LDA.W r_Player_StateDoubled,X        ;039A2A|BD6505  |030565;
						db $20                               ;039A2D|        |      ;
						dw jumpFromStackYXpreserved          ;039A2E|        |0FE86D;
						dw deathAI_IDX__00                   ;039A30|        |039A48;
						dw deathAI_IDX__01                   ;039A32|        |039A66;
						dw deathAI_IDX__03                   ;039A34|        |039A99;
						dw deathAI_IDX__04                   ;039A36|        |039AB4;
						dw deathAI_IDX__05                   ;039A38|        |039D8F;
						dw deathAI_IDX__06                   ;039A3A|        |039DC4;
						dw deathAI_IDX__07                   ;039A3C|        |039E00;
						dw deathAI_IDX__08                   ;039A3E|        |039E12;
						dw deathAI_IDX__09                   ;039A40|        |039E31;
						dw deathAI_IDX__0a                   ;039A42|        |039E61;
						dw deathAI_IDX__0b                   ;039A44|        |039EF4;
						dw deathAI_IDX__0c                   ;039A46|        |039F01;
	
		deathAI_IDX__00: LDA.B #$30                           ;039A48|A930    |      ;
						STA.W r_entity_damage,X              ;039A4A|9D5706  |030657;
						JSR.W CODE_039B47                    ;039A4D|20479B  |039B47;
						DEC.W r_misc_movementState,X         ;039A50|DE4506  |030645;
						BNE CODE_039A65                      ;039A53|D010    |039A65;
						JSR.W CODE_039B6A                    ;039A55|206A9B  |039B6A;
						LDA.B #$BF                           ;039A58|A9BF    |      ;
						STA.W r_misc_movementState,X         ;039A5A|9D4506  |030645;
						INC.W r_Player_StateDoubled,X        ;039A5D|FE6505  |030565;
	
			CODE_039A60: LDA.B #$40                           ;039A60|A940    |      ;
						STA.W r_entity_mask,X                ;039A62|9D7004  |030470;
	
			CODE_039A65: RTS                                  ;039A65|60      |      ;
	
	
		deathAI_IDX__01: JSR.W CODE_039A60                    ;039A66|20609A  |039A60;
						JSR.W CODE_039B47                    ;039A69|20479B  |039B47;
						JSR.W CODE_039BEF                    ;039A6C|20EF9B  |039BEF;
						JSR.W CODE_039BA5                    ;039A6F|20A59B  |039BA5;
						LDA.W r_entity_YsubSpd,X             ;039A72|BD3705  |030537;
						ADC.B #$04                           ;039A75|6904    |      ;
						STA.W r_entity_YsubSpd,X             ;039A77|9D3705  |030537;
						LDA.W r_entity_Yspd,X                ;039A7A|BD2005  |030520;
						ADC.B #$00                           ;039A7D|6900    |      ;
						STA.W r_entity_Yspd,X                ;039A7F|9D2005  |030520;
						LDA.B #$80                           ;039A82|A980    |      ;
						STA.W r_bossPieces       ;039A84|8DEC07  |0307EC;
						DEC.W r_misc_movementState,X         ;039A87|DE4506  |030645;
						BNE CODE_039A65                      ;039A8A|D0D9    |039A65;
						LDA.B #$00                           ;039A8C|A900    |      ;
						STA.W r_Player_StateDoubled,X        ;039A8E|9D6505  |030565;
						LDA.B #$3F                           ;039A91|A93F    |      ;
						STA.W r_misc_movementState,X         ;039A93|9D4506  |030645;
	
			DATA8_039A96: db $4C                               ;039A96|        |      ;
	
						dw setMovmentSpdZero                 ;039A97|        |0FFEC8;
	
		deathAI_IDX__03: INC.W r_entity_AnimGroup,X           ;039A99|FEAA05  |0305AA;
						INC.W r_Player_StateDoubled,X        ;039A9C|FE6505  |030565;
						LDA.B #$80                           ;039A9F|A980    |      ;
						STA.W r_misc_movementState,X         ;039AA1|9D4506  |030645;
						LDA.B #$00                           ;039AA4|A900    |      ;
						STA.W $07F0                          ;039AA6|8DF007  |0307F0;
						LDA.B #$40                           ;039AA9|A940    |      ;
						STA.W r_bossPieces       ;039AAB|8DEC07  |0307EC;
						JSR.W DATA8_039A96                   ;039AAE|20969A  |039A96;
						JMP.W CODE_039AF2                    ;039AB1|4CF29A  |039AF2;
	
	
		deathAI_IDX__04: LDA.W $07F1                          ;039AB4|ADF107  |0307F1;
						BMI CODE_039ABC                      ;039AB7|3003    |039ABC;
						db $20                               ;039AB9|        |      ;
						dw goBank_00_D                       ;039ABA|        |0FFF60;
	
			CODE_039ABC: LDX.B r_entityID_processed           ;039ABC|A66C    |00006C;
						LDA.W r_entity_mask,X                ;039ABE|BD7004  |030470;
						EOR.B #$28                           ;039AC1|4928    |      ;
						STA.W r_entity_mask,X                ;039AC3|9D7004  |030470;
						DEC.W r_misc_movementState,X         ;039AC6|DE4506  |030645;
						BNE CODE_039B09                      ;039AC9|D03E    |039B09;
						db $20                               ;039ACB|        |      ;
						dw CODE_0FFF50                       ;039ACC|        |0FFF50;
						LDX.B r_entityID_processed           ;039ACE|A66C    |00006C;
						LDA.B #$78                           ;039AD0|A978    |      ;
						STA.W r_entity_mask,X                ;039AD2|9D7004  |030470;
						LDA.B #$00                           ;039AD5|A900    |      ;
						STA.W r_damagActionFlag,X            ;039AD7|9D1D06  |03061D;
						STA.W r_orb_flagsTimer               ;039ADA|8DF307  |0307F3;
						LDA.B #$40                           ;039ADD|A940    |      ;
						STA.W r_entity_Health,X              ;039ADF|9D7B06  |03067B;
						STA.B r_HUD_healthBoss               ;039AE2|853D    |00003D;
						LDA.B #$80                           ;039AE4|A980    |      ;
						STA.W r_entity_XPos,X                ;039AE6|9D3804  |030438;
						LDA.B #$84                           ;039AE9|A984    |      ;
						STA.W r_entity_YPos,X                ;039AEB|9D1C04  |03041C;
						INC.W r_Player_StateDoubled,X        ;039AEE|FE6505  |030565;
						RTS                                  ;039AF1|60      |      ;
	
	
			CODE_039AF2: LDX.B #$01                           ;039AF2|A201    |      ;
	
			CODE_039AF4: LDA.W r_entity_ID,X                  ;039AF4|BD4E05  |03054E;
						CMP.B #$2B                           ;039AF7|C92B    |      ;
						BNE CODE_039B04                      ;039AF9|D009    |039B04;
						db $20                               ;039AFB|        |      ;
						dw clearEntityAll                    ;039AFC|        |0FFED7;
						STA.W r_entity_ID,X                  ;039AFE|9D4E05  |03054E;
						STA.W r_entity_spriteID,X            ;039B01|9D0004  |030400;
	
			CODE_039B04: INX                                  ;039B04|E8      |      ;
						CPX.B #$17                           ;039B05|E017    |      ;
						BCC CODE_039AF4                      ;039B07|90EB    |039AF4;
	
			CODE_039B09: RTS                                  ;039B09|60      |      ;
	
	
			CODE_039B0A: BIT.W r_bossPieces       ;039B0A|2CEC07  |0307EC;
						BVC CODE_039B3B                      ;039B0D|502C    |039B3B;
						LDY.W r_entity_damageRelated,X       ;039B0F|BC6906  |030669;
						BEQ CODE_039B1F                      ;039B12|F00B    |039B1F;
						CPY.B #$02                           ;039B14|C002    |      ;
						BNE CODE_039B1F                      ;039B16|D007    |039B1F;
						PLA                                  ;039B18|68      |      ;
						PLA                                  ;039B19|68      |      ;
						LDA.B #$20                           ;039B1A|A920    |      ;
						JMP.W DATA8_039FF0                   ;039B1C|4CF09F  |039FF0;
	
	
			CODE_039B1F: LDA.W r_entity_damageRelated,X       ;039B1F|BD6906  |030669;
						AND.B #$0F                           ;039B22|290F    |      ;
						CMP.B #$03                           ;039B24|C903    |      ;
						BNE CODE_039B3B                      ;039B26|D013    |039B3B;
						LDA.B #$28                           ;039B28|A928    |      ;
						db $20                               ;039B2A|        |      ;
						dw lunchMusic                        ;039B2B|        |0FE25F;
						LDA.B #$03                           ;039B2D|A903    |      ;
						LDY.W r_entity_damageRelated,X       ;039B2F|BC6906  |030669;
						CPY.B #$70                           ;039B32|C070    |      ;
						BCC CODE_039B38                      ;039B34|9002    |039B38;
						LDA.B #$33                           ;039B36|A933    |      ;
	
			CODE_039B38: STA.W r_entity_damageRelated,X       ;039B38|9D6906  |030669;
	
			CODE_039B3B: LDA.B #$02                           ;039B3B|A902    |      ;
						BIT.W r_bossPieces       ;039B3D|2CEC07  |0307EC;
						BVC CODE_039B44                      ;039B40|5002    |039B44;
						LDA.B #$03                           ;039B42|A903    |      ;
	
			CODE_039B44: JMP.W spawnA_times_Y_8                    ;039B44|4C5C99  |03995C;
	
	
			CODE_039B47: LDA.W r_orb_flagsTimer               ;039B47|ADF307  |0307F3;
						AND.B #$3F                           ;039B4A|293F    |      ;
						CMP.B #$01                           ;039B4C|C901    |      ;
						BNE CODE_039B69                      ;039B4E|D019    |039B69;
						LDA.W r_bossPieces       ;039B50|ADEC07  |0307EC;
						AND.B #$7F                           ;039B53|297F    |      ;
						STA.W r_bossPieces       ;039B55|8DEC07  |0307EC;
						LDA.B #$02                           ;039B58|A902    |      ;
						BIT.W r_bossPieces       ;039B5A|2CEC07  |0307EC;
						BVC CODE_039B61                      ;039B5D|5002    |039B61;
						LDA.B #$0A                           ;039B5F|A90A    |      ;
	
			CODE_039B61: STA.W r_Player_StateDoubled,X        ;039B61|9D6505  |030565;
						LDA.B #$00                           ;039B64|A900    |      ;
						STA.W r_orb_flagsTimer               ;039B66|8DF307  |0307F3;
	
			CODE_039B69: RTS                                  ;039B69|60      |      ;
	
	
			CODE_039B6A: LDA.W r_orb_statesGlobal             ;039B6A|ADED07  |0307ED;
						AND.B #$06                           ;039B6D|2906    |      ;
						TAY                                  ;039B6F|A8      |      ;
						LDA.W DATA8_039B9D,Y                 ;039B70|B99D9B  |039B9D;
						STA.W r_entity_XsubSpd,X             ;039B73|9D0905  |030509;
						LDA.W DATA8_039B9E,Y                 ;039B76|B99E9B  |039B9E;
						STA.W r_entity_Xspd,X                ;039B79|9DF204  |0304F2;
						LDA.W r_orb_statesGlobal             ;039B7C|ADED07  |0307ED;
						AND.B #$08                           ;039B7F|2908    |      ;
						BEQ CODE_039B86                      ;039B81|F003    |039B86;
						JSR.W CODE_039BDD                    ;039B83|20DD9B  |039BDD;
	
			CODE_039B86: LDA.W r_orb_statesGlobal             ;039B86|ADED07  |0307ED;
						LSR A                                ;039B89|4A      |      ;
						LSR A                                ;039B8A|4A      |      ;
						AND.B #$06                           ;039B8B|2906    |      ;
						TAY                                  ;039B8D|A8      |      ;
						LDA.W DATA8_039B9D,Y                 ;039B8E|B99D9B  |039B9D;
						STA.W r_entity_YsubSpd,X             ;039B91|9D3705  |030537;
						LDA.W DATA8_039B9E,Y                 ;039B94|B99E9B  |039B9E;
						STA.W r_entity_Yspd,X                ;039B97|9D2005  |030520;
						JMP.W CODE_039BC3                    ;039B9A|4CC39B  |039BC3;
	
	
			DATA8_039B9D: db $00                               ;039B9D|        |      ;
	
			DATA8_039B9E: db $00,$BA,$00,$00,$01,$40,$01       ;039B9E|        |      ;
	
			CODE_039BA5: LDA.W r_entity_XPos,X                ;039BA5|BD3804  |030438;
						CMP.B #$F0                           ;039BA8|C9F0    |      ;
						BCS CODE_039BD5                      ;039BAA|B029    |039BD5;
						CMP.B #$10                           ;039BAC|C910    |      ;
						BCC CODE_039BD5                      ;039BAE|9025    |039BD5;
						LDA.W r_entity_YPos,X                ;039BB0|BD1C04  |03041C;
						CMP.B #$40                           ;039BB3|C940    |      ;
						BCC CODE_039BBB                      ;039BB5|9004    |039BBB;
						CMP.B #$B0                           ;039BB7|C9B0    |      ;
						BCC CODE_039BD4                      ;039BB9|9019    |039BD4;
	
			CODE_039BBB: LDA.W r_entity_YPos,X                ;039BBB|BD1C04  |03041C;
						EOR.W r_entity_Yspd,X                ;039BBE|5D2005  |030520;
						BPL CODE_039BD4                      ;039BC1|1011    |039BD4;
	
			CODE_039BC3: SEC                                  ;039BC3|38      |      ;
						LDA.B #$00                           ;039BC4|A900    |      ;
						SBC.W r_entity_YsubSpd,X             ;039BC6|FD3705  |030537;
						STA.W r_entity_YsubSpd,X             ;039BC9|9D3705  |030537;
						LDA.B #$00                           ;039BCC|A900    |      ;
						SBC.W r_entity_Yspd,X                ;039BCE|FD2005  |030520;
						STA.W r_entity_Yspd,X                ;039BD1|9D2005  |030520;
	
			CODE_039BD4: RTS                                  ;039BD4|60      |      ;
	
	
			CODE_039BD5: LDA.W r_entity_XPos,X                ;039BD5|BD3804  |030438;
						EOR.W r_entity_Xspd,X                ;039BD8|5DF204  |0304F2;
						BPL CODE_039BD4                      ;039BDB|10F7    |039BD4;
	
			CODE_039BDD: SEC                                  ;039BDD|38      |      ;
						LDA.B #$00                           ;039BDE|A900    |      ;
						SBC.W r_entity_XsubSpd,X             ;039BE0|FD0905  |030509;
						STA.W r_entity_XsubSpd,X             ;039BE3|9D0905  |030509;
						LDA.B #$00                           ;039BE6|A900    |      ;
						SBC.W r_entity_Xspd,X                ;039BE8|FDF204  |0304F2;
						STA.W r_entity_Xspd,X                ;039BEB|9DF204  |0304F2;
						RTS                                  ;039BEE|60      |      ;
	
	
			CODE_039BEF: LDY.B #$00                           ;039BEF|A000    |      ;
						LDA.W r_entity_Xspd,X                ;039BF1|BDF204  |0304F2;
						BMI CODE_039BFC                      ;039BF4|3006    |039BFC;
						INY                                  ;039BF6|C8      |      ;
						ORA.W r_entity_Xspd,X                ;039BF7|1DF204  |0304F2;
						BEQ CODE_039C0D                      ;039BFA|F011    |039C0D;
	
			CODE_039BFC: TYA                                  ;039BFC|98      |      ;
						STA.W r_entity_FacingLeft,X          ;039BFD|9DA804  |0304A8;
						RTS                                  ;039C00|60      |      ;
	
	
			CODE_039C01: LDA.W r_entity_XPos,X                ;039C01|BD3804  |030438;
						CMP.W r_entity_XPos                  ;039C04|CD3804  |030438;
						LDA.B #$00                           ;039C07|A900    |      ;
						ROL A                                ;039C09|2A      |      ;
						STA.W r_entity_FacingLeft,X          ;039C0A|9DA804  |0304A8;
	
			CODE_039C0D: RTS                                  ;039C0D|60      |      ;
	
	
			CODE_039C0E: LDA.W r_bossPieces       ;039C0E|ADEC07  |0307EC;
						BPL CODE_039C57                      ;039C11|1044    |039C57;
						JSR.W CODE_039C58                    ;039C13|20589C  |039C58;
						LDA.B $03                            ;039C16|A503    |000003;
						CMP.W $07EE                          ;039C18|CDEE07  |0307EE;
						BCS CODE_039C57                      ;039C1B|B03A    |039C57;
						LDA.W $07EF                          ;039C1D|ADEF07  |0307EF;
						STA.B $01                            ;039C20|8501    |000001;
	
			DATA8_039C22: db $20                               ;039C22|        |      ;
						dw findEmptyEntitySlot               ;039C23|        |0FFEB9;
						LDY.W $07EF                          ;039C25|ACEF07  |0307EF;
						JSR.W CODE_039C94                    ;039C28|20949C  |039C94;
						BCC CODE_039C41                      ;039C2B|9014    |039C41;
						JSR.W DATA8_039C6D                   ;039C2D|206D9C  |039C6D;
						LDA.B #$3D                           ;039C30|A93D    |      ;
						STA.W r_misc_movementState,X         ;039C32|9D4506  |030645;
						LDA.B #$70                           ;039C35|A970    |      ;
						STA.W r_entity_mask,X                ;039C37|9D7004  |030470;
						LDA.B #$00                           ;039C3A|A900    |      ;
						STA.W r_Player_StateDoubled,X        ;039C3C|9D6505  |030565;
						INC.B $03                            ;039C3F|E603    |000003;
	
			CODE_039C41: INC.W $07EF                          ;039C41|EEEF07  |0307EF;
						LDA.W $07EF                          ;039C44|ADEF07  |0307EF;
						AND.B #$07                           ;039C47|2907    |      ;
						STA.W $07EF                          ;039C49|8DEF07  |0307EF;
						CMP.B $01                            ;039C4C|C501    |000001;
						BEQ CODE_039C57                      ;039C4E|F007    |039C57;
						LDA.B $03                            ;039C50|A503    |000003;
						CMP.W $07EE                          ;039C52|CDEE07  |0307EE;
						BCC DATA8_039C22                     ;039C55|90CB    |039C22;
	
			CODE_039C57: RTS                                  ;039C57|60      |      ;
	
	
			CODE_039C58: LDA.B #$00                           ;039C58|A900    |      ;
						STA.B $03                            ;039C5A|8503    |000003;
						LDY.B #$02                           ;039C5C|A002    |      ;
	
			CODE_039C5E: LDA.W r_entity_ID,Y                  ;039C5E|B94E05  |03054E;
						CMP.B #$2B                           ;039C61|C92B    |      ;
						BNE CODE_039C67                      ;039C63|D002    |039C67;
						INC.B $03                            ;039C65|E603    |000003;
	
			CODE_039C67: INY                                  ;039C67|C8      |      ;
						CPY.B #$17                           ;039C68|C017    |      ;
						BCC CODE_039C5E                      ;039C6A|90F2    |039C5E;
						RTS                                  ;039C6C|60      |      ;
	
	
			DATA8_039C6D: db $20                               ;039C6D|        |      ;
						dw clearEntityAll                    ;039C6E|        |0FFED7;
						LDA.B #$10                           ;039C70|A910    |      ;
						LDY.B #$4A                           ;039C72|A04A    |      ;
						db $20                               ;039C74|        |      ;
						dw setSpriteAndAnimGroup_AY                 ;039C75|        |0FEF5C;
						LDA.B #$2B                           ;039C77|A92B    |      ;
						STA.W r_entity_ID,X                  ;039C79|9D4E05  |03054E;
						LDA.B #$B8                           ;039C7C|A9B8    |      ;
						STA.W r_entity_spriteID,X            ;039C7E|9D0004  |030400;
						LDA.B #$30                           ;039C81|A930    |      ;
						STA.W r_entity_damage,X              ;039C83|9D5706  |030657;
						LDA.B #$80                           ;039C86|A980    |      ;
						STA.W r_entity_AI,X                  ;039C88|9DEF05  |0305EF;
						LDA.B #$00                           ;039C8B|A900    |      ;
						STA.W r_entity_FacingLeft,X          ;039C8D|9DA804  |0304A8;
						STA.W r_entity_PaletteOverride,X     ;039C90|9D5404  |030454;
						RTS                                  ;039C93|60      |      ;
	
	
			CODE_039C94: LDA.W DATA8_039CBA,Y                 ;039C94|B9BA9C  |039CBA;
						ADC.W r_entity_XPos                  ;039C97|6D3804  |030438;
						CMP.B #$10                           ;039C9A|C910    |      ;
						BCC CODE_039CB8                      ;039C9C|901A    |039CB8;
						CMP.B #$F0                           ;039C9E|C9F0    |      ;
						BCS CODE_039CB8                      ;039CA0|B016    |039CB8;
						STA.W r_entity_XPos,X                ;039CA2|9D3804  |030438;
						LDA.W DATA8_039CC2,Y                 ;039CA5|B9C29C  |039CC2;
						ADC.W r_entity_YPos                  ;039CA8|6D1C04  |03041C;
						CMP.B #$30                           ;039CAB|C930    |      ;
						BCC CODE_039CB8                      ;039CAD|9009    |039CB8;
						CMP.B #$C8                           ;039CAF|C9C8    |      ;
						BCS CODE_039CB8                      ;039CB1|B005    |039CB8;
						STA.W r_entity_YPos,X                ;039CB3|9D1C04  |03041C;
						SEC                                  ;039CB6|38      |      ;
						RTS                                  ;039CB7|60      |      ;
	
	
			CODE_039CB8: CLC                                  ;039CB8|18      |      ;
						RTS                                  ;039CB9|60      |      ;
	
	
			DATA8_039CBA: db $F8,$E0,$30,$C0,$08,$A0,$50,$A0   ;039CBA|        |      ;
	
			DATA8_039CC2: db $98,$20,$00,$10,$A0,$10,$C0,$D0   ;039CC2|        |      ;
	
			DATA8_039CCA: db $20                               ;039CCA|        |      ;
						dw clearEntityAll                    ;039CCB|        |0FFED7;
						LDA.B #$0E                           ;039CCD|A90E    |      ;
						LDY.B #$04                           ;039CCF|A004    |      ;
						db $20                               ;039CD1|        |      ;
						dw setSpriteAndAnimGroup_AY                 ;039CD2|        |0FEF5C;
						LDA.B #$03                           ;039CD4|A903    |      ;
						STA.W r_Player_StateDoubled,X        ;039CD6|9D6505  |030565;
						LDA.B #$80                           ;039CD9|A980    |      ;
						STA.W r_entity_AI,X                  ;039CDB|9DEF05  |0305EF;
						ASL A                                ;039CDE|0A      |      ;
						STA.W r_entity_damageRelated,X       ;039CDF|9D6906  |030669;
						STA.W r_entity_damage,X              ;039CE2|9D5706  |030657;
						LDA.B #$20                           ;039CE5|A920    |      ;
						STA.W r_misc_movementState,X         ;039CE7|9D4506  |030645;
						LSR A                                ;039CEA|4A      |      ;
						STA.W r_entity_mask,X                ;039CEB|9D7004  |030470;
						LDA.B #$33                           ;039CEE|A933    |      ;
						db $20                               ;039CF0|        |      ;
						dw lunchMusic                        ;039CF1|        |0FE25F;
						LDX.B r_entityID_processed           ;039CF3|A66C    |00006C;
						RTS                                  ;039CF5|60      |      ;
	
	
			bossID__2b: LDA.W r_entity_damageRelated,X       ;039CF6|BD6906  |030669;
						AND.B #$F0                           ;039CF9|29F0    |      ;
						BNE DATA8_039CCA                     ;039CFB|D0CD    |039CCA;
						LDA.W r_Player_StateDoubled,X        ;039CFD|BD6505  |030565;
						db $20                               ;039D00|        |      ;
						dw jumpFromStackYXpreserved          ;039D01|        |0FE86D;
						dw bossID2b_state__00                ;039D03|        |039D0D;
						dw bossID2b_state__01                ;039D05|        |039D25;
						dw bossID2b_state__02                ;039D07|        |039D15;
						dw bossID2b_state__03                ;039D09|        |039D38;
						dw bossID2b_state__04                ;039D0B|        |039D4B;
	
	bossID2b_state__00: LDA.B #$01                           ;039D0D|A901    |      ;
						EOR.W r_entity_mask,X                ;039D0F|5D7004  |030470;
						STA.W r_entity_mask,X                ;039D12|9D7004  |030470;
	
	bossID2b_state__02: DEC.W r_misc_movementState,X         ;039D15|DE4506  |030645;
						BNE end__ID2B                      ;039D18|D03F    |039D59;
						LDA.B #$40                           ;039D1A|A940    |      ;
						STA.W r_entity_mask,X                ;039D1C|9D7004  |030470;
						INC.W r_Player_StateDoubled,X        ;039D1F|FE6505  |030565;
						JMP.W storePosGoBank6                ;039D22|4C5A9D  |039D5A;
	
	
	bossID2b_state__01: JSR.W CODE_039D73                    ;039D25|20739D  |039D73;
						DEC.W r_misc_movementState,X         ;039D28|DE4506  |030645;
						BNE end__ID2B                      ;039D2B|D02C    |039D59;
						LDA.B #$40                           ;039D2D|A940    |      ;
						STA.W r_misc_movementState,X         ;039D2F|9D4506  |030645;
						DEC.W r_Player_StateDoubled,X        ;039D32|DE6505  |030565;
						JMP.W DATA8_039A96                   ;039D35|4C969A  |039A96;
	
	
	bossID2b_state__03: DEC.W r_misc_movementState,X         ;039D38|DE4506  |030645;
						BNE end__ID2B                      ;039D3B|D01C    |039D59;
						LDA.B #$00                           ;039D3D|A900    |      ;
						STA.W r_entity_spriteID,X            ;039D3F|9D0004  |030400;
						LDA.B #$60                           ;039D42|A960    |      ;
						STA.W r_entity_mask,X                ;039D44|9D7004  |030470;
						INC.W r_Player_StateDoubled,X        ;039D47|FE6505  |030565;
						RTS                                  ;039D4A|60      |      ;
	
	
	bossID2b_state__04: DEC.W r_misc_movementState,X         ;039D4B|DE4506  |030645;
						DEC.W r_misc_movementState,X         ;039D4E|DE4506  |030645;
						BNE end__ID2B                      ;039D51|D006    |039D59;
						db $20                               ;039D53|        |      ;
						dw clearEntityAll                    ;039D54|        |0FFED7;
						STA.W r_entity_ID,X                  ;039D56|9D4E05  |03054E;
 
			end__ID2B: RTS                                  ;039D59|60      |      ;
	
	
		storePosGoBank6: LDA.W r_entity_XPos                  ;039D5A|AD3804  |030438;
						LDY.W r_entity_YPos                  ;039D5D|AC1C04  |03041C;
						STA.B $04                            ;039D60|8504    |000004;
						STY.B $05                            ;039D62|8405    |000005;
						db $20                               ;039D64|        |      ;
						dw pushCurBankGo6                    ;039D65|        |0FFF30;
						LDY.B $00                            ;039D67|A400    |000000;
	
			CODE_039D69: LDA.B #$04                           ;039D69|A904    |      ;
						STA.B $05                            ;039D6B|8505    |000005;
						db $4C                               ;039D6D|        |      ;
	
						dw pushCurBankGo9                    ;039D6E|        |0FFF40;
	
			CODE_039D70: JMP.W CODE_039BBB                    ;039D70|4CBB9B  |039BBB;
	
	
			CODE_039D73: LDA.W r_entity_YPos,X                ;039D73|BD1C04  |03041C;
						CMP.B #$30                           ;039D76|C930    |      ;
						BCC CODE_039D70                      ;039D78|90F6    |039D70;
						CMP.B #$E8                           ;039D7A|C9E8    |      ;
						BCS CODE_039D70                      ;039D7C|B0F2    |039D70;
						LDA.W r_entity_mask,X                ;039D7E|BD7004  |030470;
						LSR A                                ;039D81|4A      |      ;
						BCC end__ID2B                      ;039D82|90D5    |039D59;
						LDA.B #$00                           ;039D84|A900    |      ;
						STA.W r_entity_ID,X                  ;039D86|9D4E05  |03054E;
						LDA.B #$F8                           ;039D89|A9F8    |      ;
						STA.W r_entity_mask,X                ;039D8B|9D7004  |030470;
						RTS                                  ;039D8E|60      |      ;
	
	
		deathAI_IDX__05: LDA.W r_bossPieces       ;039D8F|ADEC07  |0307EC;
						AND.B #$08                           ;039D92|2908    |      ;
						BNE CODE_039DAF                      ;039D94|D019    |039DAF;
						LDA.B #$08                           ;039D96|A908    |      ;
						ORA.W r_bossPieces       ;039D98|0DEC07  |0307EC;
						STA.W r_bossPieces       ;039D9B|8DEC07  |0307EC;
						LDA.B #$00                           ;039D9E|A900    |      ;
						STA.B r_bossObject                   ;039DA0|85C1    |0000C1;
						LDA.B #$40                           ;039DA2|A940    |      ;
						STA.W r_entity_damage,X              ;039DA4|9D5706  |030657;
						db $20                               ;039DA7|        |      ;
						dw backupCurrent_bank_swap_00        ;039DA8|        |0FE5D3;
						LDA.B #$2D                           ;039DAA|A92D    |      ;
						STA.B r_CHR_BankSpr_0c00             ;039DAC|8549    |000049;
						RTS                                  ;039DAE|60      |      ;
	
	
			CODE_039DAF: LDA.B #$00                           ;039DAF|A900    |      ;
						STA.W $07F0                          ;039DB1|8DF007  |0307F0;
						STA.W $07F1                          ;039DB4|8DF107  |0307F1;
						LDA.B #$06                           ;039DB7|A906    |      ;
						STA.B $B4                            ;039DB9|85B4    |0000B4;
						INC.W r_Player_StateDoubled,X        ;039DBB|FE6505  |030565;
						db $20                               ;039DBE|        |      ;
						dw goBank_death2thFormSkull_D        ;039DBF|        |0FFF6D;
						db $4C                               ;039DC1|        |      ;
						dw enemyCHR800_Bank2REG              ;039DC2|        |0FE342;
	
		deathAI_IDX__06: LDA.B #$5F                           ;039DC4|A95F    |      ;
						JSR.W CODE_039FA1                    ;039DC6|20A19F  |039FA1;
						LDA.B $B4                            ;039DC9|A5B4    |0000B4;
						BPL CODE_039DFF                      ;039DCB|1032    |039DFF;
						LDA.B #$01                           ;039DCD|A901    |      ;
						STA.B r_bossSecondFace               ;039DCF|85C2    |0000C2;
						LDX.B #$01                           ;039DD1|A201    |      ;
						LDY.B #$2F                           ;039DD3|A02F    |      ;
						LDA.B #$29                           ;039DD5|A929    |      ;
						db $20                               ;039DD7|        |      ;
						dw CODE_0FE5BF                       ;039DD8|        |0FE5BF;
						LDA.B #$A0                           ;039DDA|A9A0    |      ;
						STA.W r_EffectSpeedSupGeneral        ;039DDC|8D8507  |030785;
						LDA.B #$2C                           ;039DDF|A92C    |      ;
						STA.W r_PW_iconGeneral               ;039DE1|8D8607  |030786;
						LDX.B r_entityID_processed           ;039DE4|A66C    |00006C;
						LDA.W r_entity_YPos,X                ;039DE6|BD1C04  |03041C;
						STA.W $07F0                          ;039DE9|8DF007  |0307F0;
						JSR.W CODE_039F22                    ;039DEC|20229F  |039F22;
						LDA.B #$00                           ;039DEF|A900    |      ;
						STA.W $0787                          ;039DF1|8D8707  |030787;
						STA.W r_misc_movementState,X         ;039DF4|9D4506  |030645;
						INC.W r_Player_StateDoubled,X        ;039DF7|FE6505  |030565;
						LDA.B #$01                           ;039DFA|A901    |      ;
						STA.W $07F0                          ;039DFC|8DF007  |0307F0;
	
			CODE_039DFF: RTS                                  ;039DFF|60      |      ;
	
	
		deathAI_IDX__07: db $20                               ;039E00|        |      ;
						dw goBank_00_D                       ;039E01|        |0FFF60;
						LDA.W $07F1                          ;039E03|ADF107  |0307F1;
						BPL CODE_039E11                      ;039E06|1009    |039E11;
						LDX.B r_entityID_processed           ;039E08|A66C    |00006C;
						INC.W r_Player_StateDoubled,X        ;039E0A|FE6505  |030565;
						LDA.B #$00                           ;039E0D|A900    |      ;
						STA.B $B4                            ;039E0F|85B4    |0000B4;
	
			CODE_039E11: RTS                                  ;039E11|60      |      ;
	
	
		deathAI_IDX__08: LDA.W r_misc_movementState,X         ;039E12|BD4506  |030645;
						CLC                                  ;039E15|18      |      ;
						ADC.B #$47                           ;039E16|6947    |      ;
						db $20                               ;039E18|        |      ;
						dw screenLoad_A_CHR                  ;039E19|        |0FECE9;
						LDX.B r_entityID_processed           ;039E1B|A66C    |00006C;
						INC.W r_misc_movementState,X         ;039E1D|FE4506  |030645;
						LDA.W r_misc_movementState,X         ;039E20|BD4506  |030645;
						CMP.B #$03                           ;039E23|C903    |      ;
						BCC CODE_039E60                      ;039E25|9039    |039E60;
						LDA.B #$2E                           ;039E27|A92E    |      ;
						STA.B r_CHR_BankBG_0400              ;039E29|854B    |00004B;
						INC.W r_Player_StateDoubled,X        ;039E2B|FE6505  |030565;
						JMP.W CODE_039F22                    ;039E2E|4C229F  |039F22;
	
	
		deathAI_IDX__09: LDA.B #$4A                           ;039E31|A94A    |      ;
						JSR.W CODE_039FA1                    ;039E33|20A19F  |039FA1;
						LDX.B r_entityID_processed           ;039E36|A66C    |00006C;
						LDA.B $B4                            ;039E38|A5B4    |0000B4;
						BPL CODE_039E60                      ;039E3A|1024    |039E60;
						LDA.B #$04                           ;039E3C|A904    |      ;
						STA.B r_bossSpecialHitbox            ;039E3E|85BA    |0000BA;
						LDA.B #$00                           ;039E40|A900    |      ;
						STA.B r_bossDopplegangerHitbox       ;039E42|85BC    |0000BC;
						LDA.B #$05                           ;039E44|A905    |      ;
						STA.B r_bossMeleeHitbox              ;039E46|85BB    |0000BB;
						LDA.B #$33                           ;039E48|A933    |      ;
						STA.W r_entity_damage,X              ;039E4A|9D5706  |030657;
						INC.W r_Player_StateDoubled,X        ;039E4D|FE6505  |030565;
						LDA.W r_entity_YPos,X                ;039E50|BD1C04  |03041C;
						STA.W $07F0                          ;039E53|8DF007  |0307F0;
						LDA.B #$40                           ;039E56|A940    |      ;
						STA.W r_bossPieces       ;039E58|8DEC07  |0307EC;
						LDA.B #$01                           ;039E5B|A901    |      ;
						STA.W $07EE                          ;039E5D|8DEE07  |0307EE;
	
			CODE_039E60: RTS                                  ;039E60|60      |      ;
	
	
		deathAI_IDX__0a: JSR.W CODE_039B47                    ;039E61|20479B  |039B47;
						JSR.W CODE_039F22                    ;039E64|20229F  |039F22;
						LDA.B #$48                           ;039E67|A948    |      ;
						STA.W r_entity_mask,X                ;039E69|9D7004  |030470;
						SEC                                  ;039E6C|38      |      ;
						LDA.W r_entity_FractionalX,X         ;039E6D|BDC404  |0304C4;
						SBC.B #$40                           ;039E70|E940    |      ;
						STA.W r_entity_FractionalX,X         ;039E72|9DC404  |0304C4;
						BCS CODE_039E7A                      ;039E75|B003    |039E7A;
						DEC.W r_entity_XPos,X                ;039E77|DE3804  |030438;
	
			CODE_039E7A: INC.W r_damagActionFlag,X            ;039E7A|FE1D06  |03061D;
						LDA.W r_damagActionFlag,X            ;039E7D|BD1D06  |03061D;
						LSR A                                ;039E80|4A      |      ;
						LSR A                                ;039E81|4A      |      ;
						LSR A                                ;039E82|4A      |      ;
						TAY                                  ;039E83|A8      |      ;
						JSR.W CODE_039D69                    ;039E84|20699D  |039D69;
						INC.W r_misc_movementState,X         ;039E87|FE4506  |030645;
						LDA.W r_misc_movementState,X         ;039E8A|BD4506  |030645;
						CMP.B #$0C                           ;039E8D|C90C    |      ;
						BCC CODE_039E93                      ;039E8F|9002    |039E93;
						LDA.B #$00                           ;039E91|A900    |      ;
	
			CODE_039E93: STA.W r_misc_movementState,X         ;039E93|9D4506  |030645;
						BNE CODE_039E60                      ;039E96|D0C8    |039E60;
						INC.W r_entity_extra,X               ;039E98|FED805  |0305D8;
						LDA.W r_entity_extra,X               ;039E9B|BDD805  |0305D8;
						AND.B #$1F                           ;039E9E|291F    |      ;
						PHA                                  ;039EA0|48      |      ;
						SEC                                  ;039EA1|38      |      ;
						SBC.B #$1C                           ;039EA2|E91C    |      ;
						BCS CODE_039EA8                      ;039EA4|B002    |039EA8;
						LDA.B #$00                           ;039EA6|A900    |      ;
	
			CODE_039EA8: TAY                                  ;039EA8|A8      |      ;
						LDA.W DATA8_039EF0,Y                 ;039EA9|B9F09E  |039EF0;
						JSR.W DATA8_039FF0                   ;039EAC|20F09F  |039FF0;
						PLA                                  ;039EAF|68      |      ;
						CMP.B #$1C                           ;039EB0|C91C    |      ;
						BNE CODE_039EB9                      ;039EB2|D005    |039EB9;
						LDA.B #$77                           ;039EB4|A977    |      ;
						db $4C                               ;039EB6|        |      ;
	
						dw lunchMusic                        ;039EB7|        |0FE25F;
	
			CODE_039EB9: CMP.B #$00                           ;039EB9|C900    |      ;
						BNE CODE_039E60                      ;039EBB|D0A3    |039E60;
						JSR.W CODE_039C58                    ;039EBD|20589C  |039C58;
						LDA.B $03                            ;039EC0|A503    |000003;
						BNE CODE_039E60                      ;039EC2|D09C    |039E60;
						db $20                               ;039EC4|        |      ;
						dw findEmptyEntitySlot               ;039EC5|        |0FFEB9;
						db $20                               ;039EC7|        |      ;
						dw clearEntityAll                    ;039EC8|        |0FFED7;
						JSR.W DATA8_039C6D                   ;039ECA|206D9C  |039C6D;
						LDY.B r_entityID_processed           ;039ECD|A46C    |00006C;
						LDA.W r_entity_YPos,Y                ;039ECF|B91C04  |03041C;
						CLC                                  ;039ED2|18      |      ;
						ADC.B #$10                           ;039ED3|6910    |      ;
						STA.W r_entity_YPos,X                ;039ED5|9D1C04  |03041C;
						LDA.W r_entity_XPos,Y                ;039ED8|B93804  |030438;
						STA.W r_entity_XPos,X                ;039EDB|9D3804  |030438;
						LDA.B #$40                           ;039EDE|A940    |      ;
						STA.W r_entity_mask,X                ;039EE0|9D7004  |030470;
						LDA.B #$B4                           ;039EE3|A9B4    |      ;
						STA.W r_misc_movementState,X         ;039EE5|9D4506  |030645;
						LDA.B #$01                           ;039EE8|A901    |      ;
						STA.W r_Player_StateDoubled,X        ;039EEA|9D6505  |030565;
						JMP.W storePosGoBank6                ;039EED|4C5A9D  |039D5A;
	
	
			DATA8_039EF0: db $4A,$4B,$4C,$4B                   ;039EF0|        |      ;
	
		deathAI_IDX__0b: INC.W r_Player_StateDoubled,X        ;039EF4|FE6505  |0F0565;
						db $20                               ;039EF7|        |      ;
						dw setMovmentSpdZero                 ;039EF8|        |0FFEC8;
						LDA.B #$06                           ;039EFA|A906    |      ;
						STA.B $B4                            ;039EFC|85B4    |0000B4;
						JMP.W CODE_039AF2                    ;039EFE|4CF29A  |039AF2;
	
	
		deathAI_IDX__0c: LDA.B #$00                           ;039F01|A900    |      ;
						STA.B r_bossSpecialHitbox            ;039F03|85BA    |0000BA;
						LDA.B #$40                           ;039F05|A940    |      ;
						STA.W r_bossPieces       ;039F07|8DEC07  |0307EC;
						LDA.B #$4A                           ;039F0A|A94A    |      ;
						JSR.W CODE_039FA1                    ;039F0C|20A19F  |039FA1;
						LDA.B $B4                            ;039F0F|A5B4    |0000B4;
						BPL CODE_039F57                      ;039F11|1044    |039F57;
						LDA.B #$02                           ;039F13|A902    |      ;
						STA.W r_orb_flagsTimer               ;039F15|8DF307  |0307F3;
						LDA.B #$80                           ;039F18|A980    |      ;
						JSR.W spawnA_times_Y_12                    ;039F1A|207899  |039978;
						LDX.B r_entityID_processed           ;039F1D|A66C    |00006C;
						JMP.W spawnA_times_Y_6                    ;039F1F|4C5699  |039956;
	
	
			CODE_039F22: LDA.W r_entity_YPos,X                ;039F22|BD1C04  |03041C;
						AND.B #$07                           ;039F25|2907    |      ;
						STA.B $00                            ;039F27|8500    |000000;
						CLC                                  ;039F29|18      |      ;
						ADC.B #$2F                           ;039F2A|692F    |      ;
						STA.B r_scannlineTarget              ;039F2C|8542    |000042;
						SEC                                  ;039F2E|38      |      ;
						LDA.B #$0A                           ;039F2F|A90A    |      ;
						SBC.B $00                            ;039F31|E500    |000000;
						STA.W $0783                          ;039F33|8D8307  |030783;
						LDA.B #$86                           ;039F36|A986    |      ;
						STA.W r_EffectSpeedGeneral           ;039F38|8D8407  |030784;
						LDA.W $07F0                          ;039F3B|ADF007  |0307F0;
						EOR.W r_entity_YPos,X                ;039F3E|5D1C04  |03041C;
						AND.B #$08                           ;039F41|2908    |      ;
						BEQ CODE_039F48                      ;039F43|F003    |039F48;
						JSR.W CODE_039F58                    ;039F45|20589F  |039F58;
	
			CODE_039F48: LDA.W r_entity_YPos,X                ;039F48|BD1C04  |03041C;
						STA.W $07F0                          ;039F4B|8DF007  |0307F0;
						SEC                                  ;039F4E|38      |      ;
						LDA.B #$88                           ;039F4F|A988    |      ;
						SBC.W r_entity_XPos,X                ;039F51|FD3804  |030438;
						STA.W $0787                          ;039F54|8D8707  |030787;
	
			CODE_039F57: RTS                                  ;039F57|60      |      ;
	
			CODE_039F58:
						LDA.W r_entity_Yspd,X                ;039F58|BD2005  |030520;
						BPL CODE_039F81                      ;039F5B|1024    |039F81;
	
						CLC                                  ;039F5D|18      |      ;
						LDA.B #$20                           ;039F5E|A920    |      ;
						ADC.W r_EffectSpeedSupGeneral        ;039F60|6D8507  |030785;
						STA.W r_EffectSpeedSupGeneral        ;039F63|8D8507  |030785;
						BCC CODE_039F6B                      ;039F66|9003    |039F6B;
						INC.W r_PW_iconGeneral               ;039F68|EE8607  |030786;
	
			CODE_039F6B:
						LDY.W r_PW_iconGeneral               ;039F6B|AC8607  |030786;
						CPY.B #$2F                           ;039F6E|C02F    |      ;
						BCC CODE_039F80                      ;039F70|900E    |039F80;
						CMP.B #$C0                           ;039F72|C9C0    |      ;
						BCC CODE_039F80                      ;039F74|900A    |039F80;
						LDA.B #$00                           ;039F76|A900    |      ;
						STA.W r_EffectSpeedSupGeneral        ;039F78|8D8507  |030785;
						LDA.B #$2C                           ;039F7B|A92C    |      ;
						STA.W r_PW_iconGeneral               ;039F7D|8D8607  |030786;
	
			CODE_039F80:
						RTS                                  ;039F80|60      |      ;
	
	
			CODE_039F81:
						SEC                                  ;039F81|38      |      ;
						LDA.W r_EffectSpeedSupGeneral        ;039F82|AD8507  |030785;
						SBC.B #$20                           ;039F85|E920    |      ;
						STA.W r_EffectSpeedSupGeneral        ;039F87|8D8507  |030785;
						BCS CODE_039F8F                      ;039F8A|B003    |039F8F;
						DEC.W r_PW_iconGeneral               ;039F8C|CE8607  |030786;
	
			CODE_039F8F:
						LDY.W r_PW_iconGeneral               ;039F8F|AC8607  |030786;
						CPY.B #$2C                           ;039F92|C02C    |      ;
						BCS CODE_039FA0                      ;039F94|B00A    |039FA0;
						LDA.B #$A0                           ;039F96|A9A0    |      ;
						STA.W r_EffectSpeedSupGeneral        ;039F98|8D8507  |030785;
						LDA.B #$2F                           ;039F9B|A92F    |      ;	
						STA.W r_PW_iconGeneral               ;039F9D|8D8607  |030786;
	
			CODE_039FA0:
						RTS                                  ;039FA0|60      |      ;
	
	
			CODE_039FA1:
						STA.B $01                            ;039FA1|8501    |000001;
						LDA.B r_frameCount                   ;039FA3|A51A    |00001A;
						AND.B #$07                           ;039FA5|2907    |      ;
						BNE CODE_039FB6                      ;039FA7|D00D    |039FB6;
						LDY.B $B4                            ;039FA9|A4B4    |0000B4;
						LDA.W DATA8_039FE4,Y                 ;039FAB|B9E49F  |039FE4;
						STA.B $04                            ;039FAE|8504    |000004;
						CMP.B #$FF                           ;039FB0|C9FF    |      ;
						BNE CODE_039FB7                      ;039FB2|D003    |039FB7;
						STA.B $B4                            ;039FB4|85B4    |0000B4;
	
			CODE_039FB6:
						RTS                                  ;039FB6|60      |      ;
	
	
			CODE_039FB7:
						LDA.B r_sceneDrawQueue               ;039FB7|A51D    |00001D;
						CLC                                  ;039FB9|18      |      ;
						ADC.B #$07                           ;039FBA|6907    |      ;
						PHA                                  ;039FBC|48      |      ;
						LDA.B $01                            ;039FBD|A501    |000001;
						JSR.W DATA8_039FF0                   ;039FBF|20F09F  |039FF0;
						PLA                                  ;039FC2|68      |      ;
						TAX                                  ;039FC3|AA      |      ;
						JSR.W CODE_039FD0                    ;039FC4|20D09F  |039FD0;
						JSR.W CODE_039FD0                    ;039FC7|20D09F  |039FD0;
						JSR.W CODE_039FD0                    ;039FCA|20D09F  |039FD0;
						INC.B $B4                            ;039FCD|E6B4    |0000B4;
						RTS                                  ;039FCF|60      |      ;
	
	
			CODE_039FD0:
						LDY.B #$04                           ;039FD0|A004    |      ;
	
			CODE_039FD2:
						LDA.B $04                            ;039FD2|A504    |000004;
						CLC                                  ;039FD4|18      |      ;
						ADC.W r_VramQueue,X                  ;039FD5|7D0003  |030300;
						BPL CODE_039FDC                      ;039FD8|1002    |039FDC;
						LDA.B #$0F                           ;039FDA|A90F    |      ;
	
			CODE_039FDC:
						STA.W r_VramQueue,X                  ;039FDC|9D0003  |030300;
						INX                                  ;039FDF|E8      |      ;
						DEY                                  ;039FE0|88      |      ;
						BNE CODE_039FD2                      ;039FE1|D0EF    |039FD2;
						RTS                                  ;039FE3|60      |      ;
	
	
			DATA8_039FE4:
						db $C0,$D0,$E0,$F0,$00,$FF,$00,$F0   ;039FE4|        |      ;
						db $E0,$D0,$C0,$FF                   ;039FEC|        |      ;
	
			DATA8_039FF0:
						jsr screenLoad_A_CHR                  ;039FF1|        |0FECE9;
						LDA.B #$04                           ;039FF3|A904    |      ;
						jmp screenLoad_A_CHR                  ;039FF6|        |0FECE9;


}




{ ; -- shared boss routines??

			bossID__1b:
						LDA.W r_entity_target,X              ;038416|BD0606  |030606;
						CMP.B #$08                           ;038419|C908    |      ;
						BCC DATA8_038420                     ;03841B|9003    |038420;
						SEC                                  ;03841D|38      |      ;
						SBC.B #$08                           ;03841E|E908    |      ;
	
			DATA8_038420:
						db $20                               ;038420|        |      ;
						dw jumpFromStackYXpreserved          ;038421|        |0FE86D;
						dw CODE_038433                       ;038423|        |038433;
						dw CODE_038436                       ;038425|        |038436;
						dw CODE_038436                       ;038427|        |038436;
						dw CODE_038447                       ;038429|        |038447;
						dw CODE_038436                       ;03842B|        |038436;
						dw CODE_038453                       ;03842D|        |038453;
						dw CODE_038436                       ;03842F|        |038436;
						dw CODE_03843F                       ;038431|        |03843F;
	
			CODE_038433:
						JSR.W setBossEntityDamage_20                    ;038433|203B99  |03993B;
	
			CODE_038436:
						JSR.W CODE_038461                    ;038436|206184  |038461;
						BCC CODE_03843E                      ;038439|9003    |03843E;
	
			CODE_03843B:
						INC.W r_entity_target,X              ;03843B|FE0606  |030606;
	
			CODE_03843E:
						RTS                                  ;03843E|60      |      ;
	
	
			CODE_03843F:
						DEC.W r_entity_extra,X               ;03843F|DED805  |0305D8;
						BNE CODE_038489                      ;038442|D045    |038489;
						JMP.W spawnA_4_Y                    ;038444|4C5299  |039952;
	
	
			CODE_038447:
						JSR.W CODE_038461                    ;038447|206184  |038461;
						BCC CODE_03843E                      ;03844A|90F2    |03843E;
						LDA.B #$05                           ;03844C|A905    |      ;
						STA.W r_damagActionFlag,X            ;03844E|9D1D06  |03061D;
						BNE CODE_03843B                      ;038451|D0E8    |03843B;
	
			CODE_038453:
						JSR.W CODE_038461                    ;038453|206184  |038461;
						BCC CODE_03843E                      ;038456|90E6    |03843E;
						DEC.W r_damagActionFlag,X            ;038458|DE1D06  |03061D;
						BEQ CODE_03843B                      ;03845B|F0DE    |03843B;
						DEC.W r_entity_target,X              ;03845D|DE0606  |030606;
						RTS                                  ;038460|60      |      ;
	
	
			CODE_038461:
						DEC.W r_entity_extra,X               ;038461|DED805  |0305D8;
						BNE CODE_038488                      ;038464|D022    |038488;
						LDY.W r_entity_target,X              ;038466|BC0606  |030606;
						LDA.B #$04                           ;038469|A904    |      ;
						STA.W r_entity_extra,X               ;03846B|9DD805  |0305D8;
						JSR.W CODE_03848A                    ;03846E|208A84  |03848A;
						CPY.B #$08                           ;038471|C008    |      ;
						BCS CODE_03847B                      ;038473|B006    |03847B;
						LDA.W DATA8_0384A5,Y                 ;038475|B9A584  |0384A5;
						STA.W r_entity_spriteID,X            ;038478|9D0004  |030400;
	
			CODE_03847B:
						LDA.B #$20                           ;03847B|A920    |      ;
						CPY.B #$07                           ;03847D|C007    |      ;
						BCC CODE_038483                      ;03847F|9002    |038483;
						LDA.B #$28                           ;038481|A928    |      ;
	
			CODE_038483:
						STA.W r_entity_mask,X                ;038483|9D7004  |030470;
						SEC                                  ;038486|38      |      ;
						RTS                                  ;038487|60      |      ;
	
	
			CODE_038488:
						CLC                                  ;038488|18      |      ;
	
			CODE_038489:
						RTS                                  ;038489|60      |      ;
	
	
			CODE_03848A:
						LDA.W r_entity_FacingLeft,X          ;03848A|BDA804  |0304A8;
						BNE CODE_03849A                      ;03848D|D00B    |03849A;
						CLC                                  ;03848F|18      |      ;
						LDA.W r_entity_Counter,X             ;038490|BD3306  |030633;
						ADC.W DATA8_0384AC,Y                 ;038493|79AC84  |0384AC;
						STA.W r_entity_XPos,X                ;038496|9D3804  |030438;
						RTS                                  ;038499|60      |      ;
	
	
			CODE_03849A:
						SEC                                  ;03849A|38      |      ;
						LDA.W r_entity_Counter,X             ;03849B|BD3306  |030633;
						SBC.W DATA8_0384AC,Y                 ;03849E|F9AC84  |0384AC;
						STA.W r_entity_XPos,X                ;0384A1|9D3804  |030438;
						RTS                                  ;0384A4|60      |      ;
	
	
			DATA8_0384A5:
						db $44,$46,$48,$4A,$4C,$4E,$50       ;0384A5|        |      ;
	
			DATA8_0384AC:
						db $00,$00,$00,$00,$00,$00,$20,$00   ;0384AC|        |      ;
						db $00,$08,$10,$18,$20,$20,$20       ;0384B4|        |      ;
	
			CODE_0384BB:
						LDA.B #$00                           ;0384BB|A900    |      ;
						STA.W r_entity_Xspd,Y                ;0384BD|99F204  |0304F2;
						STA.W r_entity_XsubSpd,Y             ;0384C0|990905  |030509;
						STA.W r_entity_Yspd,Y                ;0384C3|992005  |030520;
						STA.W r_entity_YsubSpd,Y             ;0384C6|993705  |030537;
	
			CODE_0384C9:
						RTS                                  ;0384C9|60      |      ;
	
	
			bossID__1c:
						LDA.W r_entity_AI,X                  ;0384CA|BDEF05  |0305EF;
						AND.B #$7F                           ;0384CD|297F    |      ;
						BEQ CODE_0384DB                      ;0384CF|F00A    |0384DB;
						LDA.W r_entity_AI_IDX,X              ;0384D1|BDC105  |0305C1;
						CMP.B #$0F                           ;0384D4|C90F    |      ;
						BNE CODE_0384C9                      ;0384D6|D0F1    |0384C9;
						JMP.W spawnA_4_Y                    ;0384D8|4C5299  |039952;
	
	
			CODE_0384DB:
						LDA.B #$0A                           ;0384DB|A90A    |      ;
						LDY.B #$43                           ;0384DD|A043    |      ;
						db $20                               ;0384DF|        |      ;
						dw setSpriteAndAnimGroup_AY                 ;0384E0|        |0FEF5C;
						LDA.B #$25                           ;0384E2|A925    |      ;
						JMP.W spawnA_times_Y_2                    ;0384E4|4C4C99  |03994C;
	
	
			CODE_0384E7:
						STA.B $00                            ;0384E7|8500    |000000;
						STX.B $01                            ;0384E9|8601    |000001;
						LDX.B #$01                           ;0384EB|A201    |      ;
	
			CODE_0384ED:
						CPX.B $01                            ;0384ED|E401    |000001;
						BEQ CODE_0384F8                      ;0384EF|F007    |0384F8;
						LDA.W r_entity_ID,X                  ;0384F1|BD4E05  |03054E;
						CMP.B #$08                           ;0384F4|C908    |      ;
						BEQ CODE_038502                      ;0384F6|F00A    |038502;
	
			CODE_0384F8:
						INX                                  ;0384F8|E8      |      ;
						CPX.B #$0D                           ;0384F9|E00D    |      ;
						BCC CODE_0384ED                      ;0384FB|90F0    |0384ED;
	
			CODE_0384FD:
						LDA.B $00                            ;0384FD|A500    |000000;
	
			CODE_0384FF:
						LDX.B $01                            ;0384FF|A601    |000001;
						RTS                                  ;038501|60      |      ;
	
	
			CODE_038502:
						LDA.W r_entity_target,X              ;038502|BD0606  |030606;
						BMI CODE_0384F8                      ;038505|30F1    |0384F8;
						LDA.B $00                            ;038507|A500    |000000;
						CMP.W r_entity_XPos,X                ;038509|DD3804  |030438;
						BNE CODE_0384FD                      ;03850C|D0EF    |0384FD;
						INC.B $03                            ;03850E|E603    |000003;
						LDA.B $03                            ;038510|A503    |000003;
						AND.B #$03                           ;038512|2903    |      ;
						TAY                                  ;038514|A8      |      ;
						LDA.W DATA8_0383F9,Y                 ;038515|B9F983  |0383F9;
						BNE CODE_0384FF                      ;038518|D0E5    |0384FF;
	

	
		setCHR26_29sprite:
						LDY.W r_entity_target,X              ;0387C9|BC0606  |030606;
						BNE CODE_0387F0                      ;0387CC|D022    |0387F0;
						LDA.B #$26                           ;0387CE|A926    |      ;
						STA.B r_CHR_BankSpr_0800             ;0387D0|8548    |000048;
						LDA.B #$29                           ;0387D2|A929    |      ;
						STA.B r_CHR_BankSpr_0c00             ;0387D4|8549    |000049;
						db $20                               ;0387D6|        |      ;
						dw updateCHR_enemyCHR                ;0387D7|        |0FE33C;
						LDA.B #$00                           ;0387D9|A900    |      ;
						STA.W r_damagActionFlag,X            ;0387DB|9D1D06  |03061D;
						LDA.B #$40                           ;0387DE|A940    |      ;
						STA.W r_entity_mask,X                ;0387E0|9D7004  |030470;
						LDA.B #$10                           ;0387E3|A910    |      ;
						LDY.B #$39                           ;0387E5|A039    |      ;
						db $20                               ;0387E7|        |      ;
						dw setSpriteAndAnimGroup_AY                 ;0387E8|        |0FEF5C;
						INC.W r_entity_target,X              ;0387EA|FE0606  |030606;
						JMP.W A_CLC_RTS                      ;0387ED|4CDA88  |0388DA;
	
	
			CODE_0387F0:
						DEY                                  ;0387F0|88      |      ;
						BNE CODE_038815                      ;0387F1|D022    |038815;
						LDA.W r_entity_YPos,X                ;0387F3|BD1C04  |03041C;
						CMP.B #$70                           ;0387F6|C970    |      ;
						BCS DATA8_038805                     ;0387F8|B00B    |038805;
						LDA.B #$00                           ;0387FA|A900    |      ;
						STA.W r_damagActionFlag,X            ;0387FC|9D1D06  |03061D;
						INC.W r_entity_target,X              ;0387FF|FE0606  |030606;
						JMP.W A_CLC_RTS                      ;038802|4CDA88  |0388DA;
	
	
			DATA8_038805:
						db $20                               ;038805|        |      ;
						dw setMovmentSpdZero                 ;038806|        |0FFEC8;
						LDA.B #$FF                           ;038808|A9FF    |      ;
						STA.W r_entity_Yspd,X                ;03880A|9D2005  |030520;
						LDA.B #$80                           ;03880D|A980    |      ;
						STA.W r_entity_YsubSpd,X             ;03880F|9D3705  |030537;
						JMP.W A_CLC_RTS                      ;038812|4CDA88  |0388DA;
	
	
			CODE_038815:
						DEY                                  ;038815|88      |      ;
						BNE CODE_03888B                      ;038816|D073    |03888B;
						LDA.B #$00                           ;038818|A900    |      ;
						STA.B $00                            ;03881A|8500    |000000;
						LDY.W r_damagActionFlag,X            ;03881C|BC1D06  |03061D;
						CPY.B #$02                           ;03881F|C002    |      ;
						BNE CODE_03882E                      ;038821|D00B    |03882E;
						LDA.B #$80                           ;038823|A980    |      ;
						STA.W r_entity_AI,X                  ;038825|9DEF05  |0305EF;
						INC.W r_entity_target,X              ;038828|FE0606  |030606;
						JMP.W A_CLC_RTS                      ;03882B|4CDA88  |0388DA;
	
	
			CODE_03882E:
						JSR.W CODE_0388C7                    ;03882E|20C788  |0388C7;
						TYA                                  ;038831|98      |      ;
						ASL A                                ;038832|0A      |      ;
						CLC                                  ;038833|18      |      ;
						ADC.W r_damagActionFlag,X            ;038834|7D1D06  |03061D;
						TAY                                  ;038837|A8      |      ;
						LDA.W DATA8_0388DC,Y                 ;038838|B9DC88  |0388DC;
						CMP.B #$FF                           ;03883B|C9FF    |      ;
						BNE CODE_038845                      ;03883D|D006    |038845;
						JSR.W CODE_0388C7                    ;03883F|20C788  |0388C7;
						LDA.W DATA8_0388E6,Y                 ;038842|B9E688  |0388E6;
	
			CODE_038845:
						SEC                                  ;038845|38      |      ;
						SBC.W r_entity_XPos,X                ;038846|FD3804  |030438;
						BCS CODE_038852                      ;038849|B007    |038852;
						EOR.B #$FF                           ;03884B|49FF    |      ;
						CLC                                  ;03884D|18      |      ;
						ADC.B #$01                           ;03884E|6901    |      ;
						INC.B $00                            ;038850|E600    |000000;
	
			CODE_038852:
						CMP.B #$02                           ;038852|C902    |      ;
						BCS CODE_038861                      ;038854|B00B    |038861;
						INC.W r_damagActionFlag,X            ;038856|FE1D06  |03061D;
						LDA.B #$00                           ;038859|A900    |      ;
						STA.W r_entity_AI,X                  ;03885B|9DEF05  |0305EF;
						JMP.W A_CLC_RTS                      ;03885E|4CDA88  |0388DA;
	
	
			CODE_038861:
						LDA.B #$00                           ;038861|A900    |      ;
						STA.W r_entity_Xspd,X                ;038863|9DF204  |0304F2;
						LDA.B #$80                           ;038866|A980    |      ;
						STA.W r_entity_XsubSpd,X             ;038868|9D0905  |030509;
						LDA.B $00                            ;03886B|A500    |000000;
						BEQ CODE_038879                      ;03886D|F00A    |038879;
						LDA.B #$FF                           ;03886F|A9FF    |      ;
						STA.W r_entity_Xspd,X                ;038871|9DF204  |0304F2;
						LDA.B #$80                           ;038874|A980    |      ;
						STA.W r_entity_XsubSpd,X             ;038876|9D0905  |030509;
	
			CODE_038879:
						LDA.B #$00                           ;038879|A900    |      ;
						STA.W r_entity_Yspd,X                ;03887B|9D2005  |030520;
						STA.W r_entity_YsubSpd,X             ;03887E|9D3705  |030537;
						LDA.B #$50                           ;038881|A950    |      ;
						ORA.B #$80                           ;038883|0980    |      ;
						STA.W r_entity_AI,X                  ;038885|9DEF05  |0305EF;
						JMP.W A_CLC_RTS                      ;038888|4CDA88  |0388DA;
	
	
			CODE_03888B:
						JSR.W CODE_0388C7                    ;03888B|20C788  |0388C7;
						LDA.W DATA8_0388EB,Y                 ;03888E|B9EB88  |0388EB;
						CMP.W r_entity_YPos,X                ;038891|DD1C04  |03041C;
						BCS CODE_0388A4                      ;038894|B00E    |0388A4;
						JSR.W spawnA_times_Y_18                    ;038896|20A099  |0399A0;
						LDA.B #$00                           ;038899|A900    |      ;
						STA.W r_misc_movementState,X         ;03889B|9D4506  |030645;
						db $20                               ;03889E|        |      ;
						dw setMovmentSpdZero                 ;03889F|        |0FFEC8;
						JMP.W A_SEC_RTS                      ;0388A1|4CD888  |0388D8;
	
	
			CODE_0388A4:
						LDA.W r_entity_YPos,X                ;0388A4|BD1C04  |03041C;
						CMP.B #$98                           ;0388A7|C998    |      ;
						BCC CODE_0388B0                      ;0388A9|9005    |0388B0;
						LDA.B #$C8                           ;0388AB|A9C8    |      ;
						STA.W r_entity_mask,X                ;0388AD|9D7004  |030470;
	
			CODE_0388B0:
						LDA.W r_entity_YPos,X                ;0388B0|BD1C04  |03041C;
						CMP.B #$80                           ;0388B3|C980    |      ;
						BCC DATA8_0388BC                     ;0388B5|9005    |0388BC;
						LDA.B #$21                           ;0388B7|A921    |      ;
						STA.W r_entity_PaletteOverride,X     ;0388B9|9D5404  |030454;
	
			DATA8_0388BC:
						db $20                               ;0388BC|        |      ;
						dw setMovmentSpdZero                 ;0388BD|        |0FFEC8;
						LDA.B #$01                           ;0388BF|A901    |      ;
						STA.W r_entity_Yspd,X                ;0388C1|9D2005  |030520;
						JMP.W A_CLC_RTS                      ;0388C4|4CDA88  |0388DA;
	
	
			CODE_0388C7:
						LDY.B #$00                           ;0388C7|A000    |      ;
						LDA.B r_stage                        ;0388C9|A532    |000032;
						CMP.B #$03                           ;0388CB|C903    |      ;
						BEQ CODE_0388D1                      ;0388CD|F002    |0388D1;
						LDY.B #$02                           ;0388CF|A002    |      ;
	
			CODE_0388D1:
						TYA                                  ;0388D1|98      |      ;
						CLC                                  ;0388D2|18      |      ;
						ADC.W $07EE                          ;0388D3|6DEE07  |0307EE;
						TAY                                  ;0388D6|A8      |      ;
						RTS                                  ;0388D7|60      |      ;
	
	
				A_SEC_RTS:
						SEC                                  ;0388D8|38      |      ;
						RTS                                  ;0388D9|60      |      ;
	
	
				A_CLC_RTS:
						CLC                                  ;0388DA|18      |      ;
						RTS                                  ;0388DB|60      |      ;
	
	
			DATA8_0388DC:
						db $10,$FF,$D0,$FF,$10,$FF,$D0,$FF   ;0388DC|        |      ;
						db $60,$FF                           ;0388E4|        |      ;
	
			DATA8_0388E6:
						db $50,$B0,$50,$B0,$80               ;0388E6|        |      ;
	
			DATA8_0388EB:
						db $A8,$B0,$A8,$B0,$A0               ;0388EB|        |      ;
	
			CODE_0388F0:
						LDA.W r_entity_target,X              ;0388F0|BD0606  |030606;
						AND.B #$7F                           ;0388F3|297F    |      ;
						TAY                                  ;0388F5|A8      |      ;
						BNE CODE_038919                      ;0388F6|D021    |038919;
						LDA.B #$08                           ;0388F8|A908    |      ;
						STA.W r_entity_extra,X               ;0388FA|9DD805  |0305D8;
						LDA.B #$51                           ;0388FD|A951    |      ;
						STA.B r_CHR_BankBG_0400              ;0388FF|854B    |00004B;
						LDA.W $07EE                          ;038901|ADEE07  |0307EE;
						ASL A                                ;038904|0A      |      ;
						TAY                                  ;038905|A8      |      ;
						LDA.W CHR_bosses800,Y                  ;038906|B9C189  |0389C1;
						STA.B r_CHR_BankSpr_0800             ;038909|8548    |000048;
						LDA.W CHR_bossesC00,Y              ;03890B|B9C289  |0389C2;
						STA.B r_CHR_BankSpr_0c00             ;03890E|8549    |000049;
						db $20                               ;038910|        |      ;
						dw updateCHR_enemyCHR                ;038911|        |0FE33C;
						INC.W r_entity_target,X              ;038913|FE0606  |030606;
						JMP.W A_CLC_RTS                      ;038916|4CDA88  |0388DA;
	
	
			CODE_038919:
						DEY                                  ;038919|88      |      ;
						BNE CODE_038930                      ;03891A|D014    |038930;
						DEC.W r_entity_extra,X               ;03891C|DED805  |0305D8;
						BNE CODE_03892D                      ;03891F|D00C    |03892D;
						LDA.B #$40                           ;038921|A940    |      ;
						STA.W r_entity_mask,X                ;038923|9D7004  |030470;
						LDA.B #$00                           ;038926|A900    |      ;
						STA.B $04                            ;038928|8504    |000004;
						JSR.W CODE_038956                    ;03892A|205689  |038956;
	
			CODE_03892D:
						JMP.W A_CLC_RTS                      ;03892D|4CDA88  |0388DA;
	
	
			CODE_038930:
						DEY                                  ;038930|88      |      ;
						BNE CODE_038942                      ;038931|D00F    |038942;
						DEC.W r_entity_extra,X               ;038933|DED805  |0305D8;
						BNE CODE_03892D                      ;038936|D0F5    |03892D;
						LDA.B #$01                           ;038938|A901    |      ;
						STA.B $04                            ;03893A|8504    |000004;
						JSR.W CODE_038956                    ;03893C|205689  |038956;
						JMP.W A_CLC_RTS                      ;03893F|4CDA88  |0388DA;
	
	
			CODE_038942:
						DEC.W r_entity_extra,X               ;038942|DED805  |0305D8;
						BNE CODE_03892D                      ;038945|D0E6    |03892D;
						LDA.B #$02                           ;038947|A902    |      ;
						STA.B $04                            ;038949|8504    |000004;
						JSR.W CODE_038956                    ;03894B|205689  |038956;
						LDA.B #$00                           ;03894E|A900    |      ;
						STA.W r_entity_target,X              ;038950|9D0606  |030606;
						JMP.W A_SEC_RTS                      ;038953|4CD888  |0388D8;
	
	
			CODE_038956:
						LDY.B #$00                           ;038956|A000    |      ;
						LDA.B r_stage                        ;038958|A532    |000032;
						CMP.B #$03                           ;03895A|C903    |      ;
						BEQ CODE_038960                      ;03895C|F002    |038960;
						LDY.B #$02                           ;03895E|A002    |      ;
	
			CODE_038960:
						TYA                                  ;038960|98      |      ;
						CLC                                  ;038961|18      |      ;
						ADC.W $07EE                          ;038962|6DEE07  |0307EE;
						ASL A                                ;038965|0A      |      ;
						TAY                                  ;038966|A8      |      ;
						LDA.W bossTilemap_01,Y                 ;038967|B92A8A  |038A2A;
						STA.B r_VRAM_QueueDestLo             ;03896A|8561    |000061;
						LDA.B r_sceneScrollOffsetHi          ;03896C|A557    |000057;
						AND.B #$01                           ;03896E|2901    |      ;
						EOR.B r_075                          ;038970|4575    |000075;
						BEQ CODE_038976                      ;038972|F002    |038976;
						LDA.B #$04                           ;038974|A904    |      ;
	
			CODE_038976:
						ORA.W bossTilemap_01+1,Y                 ;038976|192B8A  |038A2B;
						STA.B r_VRAM_QueueDestHi             ;038979|8562    |000062;
						JSR.W CODE_038987                    ;03897B|208789  |038987;
						LDA.B #$04                           ;03897E|A904    |      ;
						STA.W r_entity_extra,X               ;038980|9DD805  |0305D8;
						INC.W r_entity_target,X              ;038983|FE0606  |030606;
						RTS                                  ;038986|60      |      ;
	
	
			CODE_038987:
						LDA.B #$00                           ;038987|A900    |      ;
						STA.B r_coreLoadingFuncAddr          ;038989|8516    |000016;
	
			DATA8_03898B:
						db $20                               ;03898B|        |      ;
						dw updateVRAM_2                      ;03898C|        |0FE8AF;
						LDA.B r_coreLoadingFuncAddr          ;03898E|A516    |000016;
						ASL A                                ;038990|0A      |      ;
						ASL A                                ;038991|0A      |      ;
						ASL A                                ;038992|0A      |      ;
						LDY.B $04                            ;038993|A404    |000004;
						CLC                                  ;038995|18      |      ;
						ADC.W boss_tilemapDest,Y              ;038996|79C789  |0389C7;
						TAY                                  ;038999|A8      |      ;
						LDA.B #$08                           ;03899A|A908    |      ;
						STA.B r_bossScript__15                           ;03899C|8515    |000015;
	
			CODE_03899E:
						LDA.W bossTilemap_00,Y              ;03899E|B9CA89  |0389CA;
						db $20                               ;0389A1|        |      ;
						dw storeByteVramQueue                ;0389A2|        |0FED16;
						INY                                  ;0389A4|C8      |      ;
						DEC.B r_bossScript__15                           ;0389A5|C615    |000015;
						BNE CODE_03899E                      ;0389A7|D0F5    |03899E;
						INC.B r_VRAM_QueueDestLo             ;0389A9|E661    |000061;
						LDA.B r_VRAM_QueueDestLo             ;0389AB|A561    |000061;
						BNE CODE_0389B1                      ;0389AD|D002    |0389B1;
						INC.B r_VRAM_QueueDestHi             ;0389AF|E662    |000062;
	
			CODE_0389B1:
						LDA.B #$FF                           ;0389B1|A9FF    |      ;
						db $20                               ;0389B3|        |      ;
						dw storeByteVramQueue                ;0389B4|        |0FED16;
						INC.B r_coreLoadingFuncAddr          ;0389B6|E616    |000016;
						LDA.B r_coreLoadingFuncAddr          ;0389B8|A516    |000016;
						CMP.B #$04                           ;0389BA|C904    |      ;
						BNE DATA8_03898B                     ;0389BC|D0CD    |03898B;
						LDX.B r_entityID_processed           ;0389BE|A66C    |00006C;
						RTS                                  ;0389C0|60      |      ;
	

			CHR_bosses800: 	db $26                               ;0389C1|        |      ;	
			CHR_bossesC00: 	db $29
							db $1C,$7B
							db $26,$27            
	
		boss_tilemapDest: 
						dw $2000                             ;0389C7|        |      ;
						db $40                               ;0389C9|        |      ;
	
		bossTilemap_00: db $00,$4A,$4B,$79,$4C,$5C,$6C,$7C   ;0389CA|        |      ;
						db $00,$4B,$6A,$7A,$4D,$3F,$6D,$7D   ;0389D2|        |      ;
						db $00,$5A,$6B,$7B,$4E,$5E,$6E,$7E   ;0389DA|        |      ;
						db $00,$5B,$5A,$5D,$4F,$5F,$6F,$7F   ;0389E2|        |      ;
						db $44,$54,$40,$50,$60,$4C,$5C,$6C   ;0389EA|        |      ;
						db $00,$47,$41,$51,$61,$71,$64,$74   ;0389F2|        |      ;
						db $00,$70,$42,$52,$62,$72,$65,$75   ;0389FA|        |      ;
						db $45,$55,$43,$53,$63,$4F,$5F,$6F   ;038A02|        |      ;
						db $46,$56,$66,$66,$66,$66,$57,$67   ;038A0A|        |      ;
						db $00,$47,$00,$00,$00,$00,$00,$77   ;038A12|        |      ;
						db $00,$48,$00,$00,$00,$00,$00,$77   ;038A1A|        |      ;
						db $49,$59,$69,$69,$69,$68,$68,$78   ;038A22|        |      ;
	
		bossTilemap_01: dw $2208                             ;038A2A|        |      ;
						db $14,$22,$08,$22,$14,$22,$0E,$22   ;038A2C|  

	

	
	
		bossID_mummy_0e:
						JSR.W setBossEntityDamage_20                    ;038A3F|203B99  |03993B;
						LDA.B r_stage                        ;038A42|A532    |000032;
						CMP.B #$03                           ;038A44|C903    |      ;
						BEQ CODE_038A4C                      ;038A46|F004    |038A4C;
						LDA.B #$04                           ;038A48|A904    |      ;
						BNE CODE_038A4E                      ;038A4A|D002    |038A4E;
	
			CODE_038A4C:
						LDA.B #$03                           ;038A4C|A903    |      ;
	
			CODE_038A4E:
						JSR.W spawnA_times_Y_A                    ;038A4E|206299  |039962;
						LDA.W r_entity_Health,X              ;038A51|BD7B06  |03067B;
						BNE CODE_038AC6                      ;038A54|D070    |038AC6;
						LDA.B #$00                           ;038A56|A900    |      ;
						STA.W r_entity_damageRelated,X       ;038A58|9D6906  |030669;
						STA.W r_entity_damage,X              ;038A5B|9D5706  |030657;
						JSR.W bossEntity_makeActive                    ;038A5E|200995  |039509;
						CMP.B #$59                           ;038A61|C959    |      ;
						BEQ CODE_038A7D                      ;038A63|F018    |038A7D;
						LDA.B #$33                           ;038A65|A933    |      ;
						db $20                               ;038A67|        |      ;
						dw lunchMusic                        ;038A68|        |0FE25F;
						LDA.B #$40                           ;038A6A|A940    |      ;
						STA.W r_entity_mask,X                ;038A6C|9D7004  |030470;
						LDA.B #$10                           ;038A6F|A910    |      ;
						LDY.B #$3F                           ;038A71|A03F    |      ;
						db $20                               ;038A73|        |      ;
						dw setSpriteAndAnimGroup_AY                 ;038A74|        |0FEF5C;
						LDA.B #$59                           ;038A76|A959    |      ;
						ORA.B #$80                           ;038A78|0980    |      ;
						JMP.W spawnA_times_Y_2                    ;038A7A|4C4C99  |03994C;
	
	
			CODE_038A7D:
						LDA.W r_entity_AI_IDX,X              ;038A7D|BDC105  |0305C1;
						CMP.B #$0B                           ;038A80|C90B    |      ;
						BNE CODE_038AC5                      ;038A82|D041    |038AC5;
						LDA.B r_HUD_healthBoss               ;038A84|A53D    |00003D;
						BNE CODE_038ABD                      ;038A86|D035    |038ABD;
						LDA.W $07F1                          ;038A88|ADF107  |0307F1;
						BEQ CODE_038ABD                      ;038A8B|F030    |038ABD;
						LDA.B #$30                           ;038A8D|A930    |      ;
						JSR.W spawnA_times_Y_12                    ;038A8F|207899  |039978;
						LDA.B #$10                           ;038A92|A910    |      ;
						LDY.B #$39                           ;038A94|A039    |      ;
						db $20                               ;038A96|        |      ;
						dw setSpriteAndAnimGroup_AY                 ;038A97|        |0FEF5C;
						INC.W $07EE                          ;038A99|EEEE07  |0307EE;
						LDA.B #$09                           ;038A9C|A909    |      ;
						STA.W r_entity_ID,X                  ;038A9E|9D4E05  |03054E;
						LDA.B #$00                           ;038AA1|A900    |      ;
						STA.W $07F1                          ;038AA3|8DF107  |0307F1;
						STA.W r_entity_AI,X                  ;038AA6|9DEF05  |0305EF;
						STA.W r_entity_AI_IDX,X              ;038AA9|9DC105  |0305C1;
						JSR.W spawnA_times_Y_18                    ;038AAC|20A099  |0399A0;
						LDA.B #$00                           ;038AAF|A900    |      ;
						STA.W r_misc_movementState,X         ;038AB1|9D4506  |030645;
						LDA.W r_orb_flagsTimer               ;038AB4|ADF307  |0307F3;
						ORA.B #$80                           ;038AB7|0980    |      ;
						STA.W r_orb_flagsTimer               ;038AB9|8DF307  |0307F3;
						RTS                                  ;038ABC|60      |      ;
	
	
			CODE_038ABD:
						LDA.B #$01                           ;038ABD|A901    |      ;
						STA.W $07F1                          ;038ABF|8DF107  |0307F1;
						JMP.W spawnA_4_Y                    ;038AC2|4C5299  |039952;
	
	
			CODE_038AC5:
						RTS                                  ;038AC5|60      |      ;
	
	
			CODE_038AC6:
						LDA.W r_misc_movementState,X         ;038AC6|BD4506  |030645;
						BNE CODE_038AD3                      ;038AC9|D008    |038AD3;
						JSR.W CODE_038B95                    ;038ACB|20958B  |038B95;
						LDA.B #$60                           ;038ACE|A960    |      ;
						STA.W r_misc_movementState,X         ;038AD0|9D4506  |030645;
	
			CODE_038AD3:
						DEC.W r_misc_movementState,X         ;038AD3|DE4506  |030645;
						LDA.B #$40                           ;038AD6|A940    |      ;
						STA.W r_entity_mask,X                ;038AD8|9D7004  |030470;
						LDA.W r_entity_target,X              ;038ADB|BD0606  |030606;
						AND.B #$80                           ;038ADE|2980    |      ;
						BNE CODE_038B42                      ;038AE0|D060    |038B42;
						LDA.B #$01                           ;038AE2|A901    |      ;
						STA.B $00                            ;038AE4|8500    |000000;
						LDA.W r_entity_target,X              ;038AE6|BD0606  |030606;
						AND.B #$7F                           ;038AE9|297F    |      ;
						BEQ CODE_038AF3                      ;038AEB|F006    |038AF3;
						LDA.B #$30                           ;038AED|A930    |      ;
						STA.B $02                            ;038AEF|8502    |000002;
						BNE CODE_038AF7                      ;038AF1|D004    |038AF7;
	
			CODE_038AF3:
						LDA.B #$C0                           ;038AF3|A9C0    |      ;
						STA.B $02                            ;038AF5|8502    |000002;
	
			CODE_038AF7:
						LDA.W r_entity_XPos,X                ;038AF7|BD3804  |030438;
						SEC                                  ;038AFA|38      |      ;
						SBC.B $02                            ;038AFB|E502    |000002;
						BCS CODE_038B06                      ;038AFD|B007    |038B06;
						EOR.B #$FF                           ;038AFF|49FF    |      ;
						CLC                                  ;038B01|18      |      ;
						ADC.B #$01                           ;038B02|6901    |      ;
						DEC.B $00                            ;038B04|C600    |000000;
	
			CODE_038B06:
						CMP.B #$04                           ;038B06|C904    |      ;
						BCS CODE_038B1F                      ;038B08|B015    |038B1F;
						LDA.W r_entity_target,X              ;038B0A|BD0606  |030606;
						AND.B #$80                           ;038B0D|2980    |      ;
						BEQ CODE_038B14                      ;038B0F|F003    |038B14;
						JSR.W CODE_038BD2                    ;038B11|20D28B  |038BD2;
	
			CODE_038B14:
						LDA.W r_entity_target,X              ;038B14|BD0606  |030606;
						ORA.B #$80                           ;038B17|0980    |      ;
						STA.W r_entity_target,X              ;038B19|9D0606  |030606;
						JMP.W CODE_038B30                    ;038B1C|4C308B  |038B30;
	
	
			CODE_038B1F:
						LDA.B #$04                           ;038B1F|A904    |      ;
						STA.W r_Player_StateDoubled,X        ;038B21|9D6505  |030565;
						LDA.B $00                            ;038B24|A500    |000000;
						STA.W r_entity_FacingLeft,X          ;038B26|9DA804  |0304A8;
						BEQ CODE_038B30                      ;038B29|F005    |038B30;
						LDA.B #$0C                           ;038B2B|A90C    |      ;
						STA.W r_Player_StateDoubled,X        ;038B2D|9D6505  |030565;
	
			CODE_038B30:
						JSR.W bossEntity_makeActive                    ;038B30|200995  |039509;
						BNE CODE_038B41                      ;038B33|D00C    |038B41;
						LDA.B #$10                           ;038B35|A910    |      ;
						LDY.B #$3B                           ;038B37|A03B    |      ;
						db $20                               ;038B39|        |      ;
						dw setSpriteAndAnimGroup_AY                 ;038B3A|        |0FEF5C;
						LDA.B #$57                           ;038B3C|A957    |      ;
						JMP.W spawnA_times_Y_2                    ;038B3E|4C4C99  |03994C;
	
	
			CODE_038B41:
						RTS                                  ;038B41|60      |      ;
	
	
			CODE_038B42:
						LDA.W r_entity_Counter,X             ;038B42|BD3306  |030633;
						BNE CODE_038B75                      ;038B45|D02E    |038B75;
						LDA.W r_entity_target,X              ;038B47|BD0606  |030606;
						AND.B #$7F                           ;038B4A|297F    |      ;
						ASL A                                ;038B4C|0A      |      ;
						TAY                                  ;038B4D|A8      |      ;
						LDA.W PTR16_038BDE,Y                 ;038B4E|B9DE8B  |038BDE;
						STA.B $00                            ;038B51|8500    |000000;
						LDA.W PTR16_038BDE+1,Y                 ;038B53|B9DF8B  |038BDF;
						STA.B $01                            ;038B56|8501    |000001;
						LDY.W r_damagActionFlag,X            ;038B58|BC1D06  |03061D;
						LDA.B ($00),Y                        ;038B5B|B100    |000000;
						CMP.B #$FF                           ;038B5D|C9FF    |      ;
						BEQ CODE_038B6A                      ;038B5F|F009    |038B6A;
						STA.B $02                            ;038B61|8502    |000002;
						LDA.B #$01                           ;038B63|A901    |      ;
						STA.B $00                            ;038B65|8500    |000000;
						JMP.W CODE_038AF7                    ;038B67|4CF78A  |038AF7;
	
	
			CODE_038B6A:
						LDA.B #$40                           ;038B6A|A940    |      ;
						STA.W r_entity_Counter,X             ;038B6C|9D3306  |030633;
						LDA.B #$20                           ;038B6F|A920    |      ;
						STA.W r_entity_mask,X                ;038B71|9D7004  |030470;
						RTS                                  ;038B74|60      |      ;
	
	
			CODE_038B75:
						DEC.W r_entity_Counter,X             ;038B75|DE3306  |030633;
						BNE CODE_038B82                      ;038B78|D008    |038B82;
						LDA.B #$40                           ;038B7A|A940    |      ;
						STA.W r_entity_mask,X                ;038B7C|9D7004  |030470;
						JSR.W CODE_038BD2                    ;038B7F|20D28B  |038BD2;
	
			CODE_038B82:
						LDA.B #$00                           ;038B82|A900    |      ;
						STA.W r_entity_FacingLeft,X          ;038B84|9DA804  |0304A8;
						LDA.W r_entity_XPos                  ;038B87|AD3804  |030438;
						CMP.W r_entity_XPos,X                ;038B8A|DD3804  |030438;
						BCS CODE_038B94                      ;038B8D|B005    |038B94;
						LDA.B #$01                           ;038B8F|A901    |      ;
						STA.W r_entity_FacingLeft,X          ;038B91|9DA804  |0304A8;
	
			CODE_038B94:
						RTS                                  ;038B94|60      |      ;
	
	
			CODE_038B95:
						LDA.B #$27                           ;038B95|A927    |      ;
						JSR.W spawnA_times_Y_C                    ;038B97|206899  |039968;
						LDA.B #$40                           ;038B9A|A940    |      ;
						STA.W r_entity_mask,Y                ;038B9C|997004  |030470;
						LDA.B #$80                           ;038B9F|A980    |      ;
						STA.W r_entity_AI,Y                  ;038BA1|99EF05  |0305EF;
						LDA.B #$04                           ;038BA4|A904    |      ;
						STA.W r_Player_StateDoubled,Y        ;038BA6|996505  |030565;
						LDA.W r_entity_FacingLeft,X          ;038BA9|BDA804  |0304A8;
						BEQ CODE_038BB3                      ;038BAC|F005    |038BB3;
						LDA.B #$0C                           ;038BAE|A90C    |      ;
						STA.W r_Player_StateDoubled,Y        ;038BB0|996505  |030565;
	
			CODE_038BB3:
						LDA.W r_entity_FacingLeft,X          ;038BB3|BDA804  |0304A8;
						STA.W r_entity_FacingLeft,Y          ;038BB6|99A804  |0304A8;
						LDA.B #$F8                           ;038BB9|A9F8    |      ;
						STA.B $00                            ;038BBB|8500    |000000;
						LDA.W r_damagActionFlag,X            ;038BBD|BD1D06  |03061D;
						AND.B #$02                           ;038BC0|2902    |      ;
						BEQ CODE_038BC8                      ;038BC2|F004    |038BC8;
						LDA.B #$0C                           ;038BC4|A90C    |      ;
						STA.B $00                            ;038BC6|8500    |000000;
	
			CODE_038BC8:
						LDA.W r_entity_YPos,Y                ;038BC8|B91C04  |03041C;
						CLC                                  ;038BCB|18      |      ;
						ADC.B $00                            ;038BCC|6500    |000000;
						STA.W r_entity_YPos,Y                ;038BCE|991C04  |03041C;
						RTS                                  ;038BD1|60      |      ;
	
	
			CODE_038BD2:
						INC.W r_damagActionFlag,X            ;038BD2|FE1D06  |03061D;
						LDA.W r_damagActionFlag,X            ;038BD5|BD1D06  |03061D;
						AND.B #$0F                           ;038BD8|290F    |      ;
						STA.W r_damagActionFlag,X            ;038BDA|9D1D06  |03061D;
						RTS                                  ;038BDD|60      |      ;
	
	
			PTR16_038BDE:
						dw DATA8_038BE2                      ;038BDE|        |038BE2;
						dw DATA8_038BF2                      ;038BE0|        |038BF2;
	
			DATA8_038BE2:
						db $A0,$FF,$D0,$FF,$90,$FF,$D0,$FF   ;038BE2|        |      ;
						db $80,$FF,$D0,$FF,$70,$FF,$D0,$FF   ;038BEA|        |      ;
	
			DATA8_038BF2:
						db $60,$FF,$20,$FF,$70,$FF,$20,$FF   ;038BF2|        |      ;
						db $80,$FF,$20,$FF,$90,$FF,$20,$FF   ;038BFA|        |      ;
	
			bossID__27:
						LDA.B r_HUD_healthBoss               ;038C02|A53D    |00003D;
						BEQ CODE_038C3D                      ;038C04|F037    |038C3D;
						JSR.W setBossEntityDamage_20                    ;038C06|203B99  |03993B;
						LDA.W r_entity_damageRelated,X       ;038C09|BD6906  |030669;
						BNE CODE_038C38                      ;038C0C|D02A    |038C38;
						JSR.W bossEntity_makeActive                    ;038C0E|200995  |039509;
						BNE CODE_038C21                      ;038C11|D00E    |038C21;
						LDA.B #$10                           ;038C13|A910    |      ;
						LDY.B #$43                           ;038C15|A043    |      ;
						db $20                               ;038C17|        |      ;
						dw setSpriteAndAnimGroup_AY                 ;038C18|        |0FEF5C;
						LDA.B #$58                           ;038C1A|A958    |      ;
						ORA.B #$80                           ;038C1C|0980    |      ;
						JMP.W spawnA_times_Y_2                    ;038C1E|4C4C99  |03994C;
	
	
			CODE_038C21:
						LDA.W r_entity_XPos,X                ;038C21|BD3804  |030438;
						CMP.B #$08                           ;038C24|C908    |      ;
						BCC CODE_038C3D                      ;038C26|9015    |038C3D;
						CMP.B #$F8                           ;038C28|C9F8    |      ;
						BCS CODE_038C3D                      ;038C2A|B011    |038C3D;
						LDA.W r_entity_YPos,X                ;038C2C|BD1C04  |03041C;
						CMP.B #$20                           ;038C2F|C920    |      ;
						BCC CODE_038C3D                      ;038C31|900A    |038C3D;
						CMP.B #$F8                           ;038C33|C9F8    |      ;
						BCS CODE_038C3D                      ;038C35|B006    |038C3D;
						RTS                                  ;038C37|60      |      ;
	
	
			CODE_038C38:
						LDA.B #$33                           ;038C38|A933    |      ;
						db $20                               ;038C3A|        |      ;
						dw lunchMusic                        ;038C3B|        |0FE25F;
	
			CODE_038C3D:
						JMP.W spawnA_4_Y                    ;038C3D|4C5299  |039952;

}



; -- free space bank 3 
	

assert pc() <= $A000 
pad $A000
}


{ ; -- boss bank 5 

	someBossBank_5_thing = $BBC1   	; 05BBC1|A938    |      ; when you freez something while boss and shatter it..

org $17C75
base $BC75

{ ; -- data ----------------------------------------------------- 
			boss2_spriteID: 
							db $DE     ;05BD3D|        |      ; 
			boss2_spiteDir: 
							db $01                    
							db $20                    
							db $01                    
							db $22                    
							db $01                    
							db $DC                    
							db $01                    
							db $1E                    
							db $01                    
							db $EE                    
							db $01                    
							db $EC                    
							db $01                    
							db $EA                    
							db $01                    
							db $E8                    
							db $01                    
							db $EA                    
							db $00                    
							db $EC                    
							db $00                    
							db $EE                    
							db $00                    
							db $1E                    
							db $00                    
							db $DC                    
							db $00                    
							db $22                    
							db $00                    
							db $20                    
							db $00                    
		
		boss2_YspeedTableOffset: 
							db $10     ;05BD5D|        |      ;
							db $0E                              	
							db $0C                              	
							db $0A                              	
							db $08                              	
							db $06                              	
							db $04                              	
							db $02                              	
							db $00                              	
							db $02                              	
							db $04                              	
							db $06                              	
							db $08                              	
							db $0A                              	
							db $0C                              	
							db $0E                              	
		
		boss2_XspeedTableOffset: 
							db $08      ;05BD6D|        |      ;
							db $06                               	
							db $04                               	
							db $02                               	
							db $00                               	
							db $02                               	
							db $04                               	
							db $06                               	
							db $08                               	
							db $0A                               	
							db $0C                               	
							db $0E                               	
							db $10                               	
							db $0E                               	
							db $0C                               	
							db $0A                               	
		
				boss2_SpdSub: 
							db $00      ;05BD7D|        |      ;		
					boss2_Spd: 
							db $02                               
							
							db $D8   	; 02                            
							db $01                               
							
							db $6A     	; 04                             
							db $01                               
							
							db $C2     	; 06                               
							db $00                               
							
							db $00     	; 08                               
							db $00                               
							
							db $3E     	; 0a                               	
							db $FF                               
							
							db $96     	; 0c                               
							db $FE                               
							
							db $28     	; 0e                               
							db $FE                               
							
							db $00     	; 10                               
							db $FE                               

}
			
			bossID__2c: LDA.W r_entity_AI_IDX,X              ;05BC75|BDC105  |0505C1;
						jsr jumpFromStackYXpreserved          ;05BC79|        |0FE86D;
						dw bossID2c_AI_IDX_dracLazer_00               ;05BC7B|        |05BC85;
						dw bossID2c_AI_IDX__01               ;05BC7D|        |05BCDA;
						dw bossID2c_AI_IDX__02               ;05BC7F|        |05BCDE;
						dw bossID2c_AI_IDX__03               ;05BC81|        |05BD8F;
						dw bossID2c_AI_IDX__04               ;05BC83|        |05BDE9;
	
	bossID2c_AI_IDX_dracLazer_00: 
						LDA.B #$44                           ;05BC85|A944    |      ; lazer sound
						jsr lunchMusic                        ;05BC88|        |0FE25F;
						TXA                                  ;05BC8A|8A      |      ;
						TAY                                  ;05BC8B|A8      |      ;
						LDA.B #$00                           ;05BC8C|A900    |      ;
						STA.B $00                            ;05BC8E|8500    |000000;
						LDA.B r_frameCount                   ;05BC90|A51A    |00001A;
						AND.B #$03                           ;05BC92|2903    |      ;
						CLC                                  ;05BC94|18      |      ;
						ADC.B #$05                           ;05BC95|6905    |      ;
						STA.B $01                            ;05BC97|8501    |000001;
	
			CODE_05BC99: LDA.B #$80                           ;05BC99|A980    |      ;
						STA.W r_entity_AI,Y                  ;05BC9B|99EF05  |0505EF;
						LDA.B #$00                           ;05BC9E|A900    |      ;
						STA.W r_entity_spriteID,Y            ;05BCA0|990004  |050400;
						LDA.B #$2C                           ;05BCA3|A92C    |      ;
						STA.W r_entity_ID,Y                  ;05BCA5|994E05  |05054E;
						LDA.B #$01                           ;05BCA8|A901    |      ;
						STA.W r_entity_AI_IDX,Y              ;05BCAA|99C105  |0505C1;
						LDA.B $00                            ;05BCAD|A500    |000000;
						STA.W r_entity_target,Y              ;05BCAF|990606  |050606;
						TXA                                  ;05BCB2|8A      |      ;
						STA.W r_damagActionFlag,Y            ;05BCB3|991D06  |05061D;
						LDA.W r_Player_StateDoubled,X        ;05BCB6|BD6505  |050565;
						AND.B #$1F                           ;05BCB9|291F    |      ;
						STA.W r_Player_StateDoubled,Y        ;05BCBB|996505  |050565;
						LDA.W r_entity_XPos,X                ;05BCBE|BD3804  |050438;
						STA.W r_entity_XPos,Y                ;05BCC1|993804  |050438;
						LDA.W r_entity_YPos,X                ;05BCC4|BD1C04  |05041C;
						STA.W r_entity_YPos,Y                ;05BCC7|991C04  |05041C;
						LDA.B #$20                           ;05BCCA|A920    |      ;
						STA.W r_entity_mask,Y                ;05BCCC|997004  |050470;
						INY                                  ;05BCCF|C8      |      ;
						INC.B $00                            ;05BCD0|E600    |000000;
						LDA.B $00                            ;05BCD2|A500    |000000;
						CMP.B $01                            ;05BCD4|C501    |000001;
						BNE CODE_05BC99                      ;05BCD6|D0C1    |05BC99;
						LDX.B r_entityID_processed           ;05BCD8|A66C    |00006C;
	
	bossID2c_AI_IDX__01: INC.W r_entity_AI_IDX,X              ;05BCDA|FEC105  |0505C1;
						RTS                                  ;05BCDD|60      |      ;
	
	
	bossID2c_AI_IDX__02: 
						LDA.W r_Player_StateDoubled,X        ;05BCDE|BD6505  |050565;
						AND.B #$FE                           ;05BCE1|29FE    |      ;
						TAY                                  ;05BCE3|A8      |      ;
						LDA.W boss2_spriteID,Y               ;05BCE4|B93DBD  |05BD3D;
						STA.W r_entity_spriteID,X            ;05BCE7|9D0004  |050400;
						CMP.B #$DE                           ;05BCEA|C9DE    |      ;
						BEQ CODE_05BCF6                      ;05BCEC|F008    |05BCF6;
						CMP.B #$DC                           ;05BCEE|C9DC    |      ;
						BEQ CODE_05BCF6                      ;05BCF0|F004    |05BCF6;
						LDA.B #$10                           ;05BCF2|A910    |      ;
						BNE CODE_05BCF8                      ;05BCF4|D002    |05BCF8;
	
			CODE_05BCF6: 
						LDA.B #$0A                           ;05BCF6|A90A    |      ;
			CODE_05BCF8: 
						STA.W r_entity_spriteGroup,X         ;05BCF8|9D8C04  |05048C;
						LDA.W boss2_spiteDir,Y               ;05BCFB|B93EBD  |05BD3E;
						STA.W r_entity_FacingLeft,X          ;05BCFE|9DA804  |0504A8;
	
						LDA.W r_Player_StateDoubled,X        ;05BD01|BD6505  |050565;
						LSR A                                ;05BD04|4A      |      ;
						STA.B $02                            ;05BD05|8502    |000002;
						TAY                                  ;05BD07|A8      |      ;
						LDA.W boss2_XspeedTableOffset,Y      ;05BD08|B96DBD  |05BD6D;
						TAY                                  ;05BD0B|A8      |      ;
						LDA.W boss2_SpdSub,Y                 ;05BD0C|B97DBD  |05BD7D;
						STA.W r_entity_XsubSpd,X             ;05BD0F|9D0905  |050509;
						LDA.W boss2_Spd,Y                    ;05BD12|B97EBD  |05BD7E;
						STA.W r_entity_Xspd,X                ;05BD15|9DF204  |0504F2;
						LDY.B $02                            ;05BD18|A402    |000002;
						LDA.W boss2_YspeedTableOffset,Y      ;05BD1A|B95DBD  |05BD5D;
						TAY                                  ;05BD1D|A8      |      ;
						LDA.W boss2_SpdSub,Y                 ;05BD1E|B97DBD  |05BD7D;
						STA.W r_entity_YsubSpd,X             ;05BD21|9D3705  |050537;
						LDA.W boss2_Spd,Y                    ;05BD24|B97EBD  |05BD7E;
						STA.W r_entity_Yspd,X                ;05BD27|9D2005  |050520;
						LDA.W r_entity_target,X              ;05BD2A|BD0606  |050606;
						BNE CODE_05BD34                      ;05BD2D|D005    |05BD34;
						LDA.B #$60                           ;05BD2F|A960    |      ;
						STA.W r_entity_mask,X                ;05BD31|9D7004  |050470;
	
			CODE_05BD34: 
						LDA.B #$30                           ;05BD34|A930    |      ;
						STA.W r_entity_damage,X              ;05BD36|9D5706  |050657;
						INC.W r_entity_AI_IDX,X              ;05BD39|FEC105  |0505C1;
						RTS                                  ;05BD3C|60      |      ;


	
	bossID2c_AI_IDX__03: LDY.B #$00                           ;05BD8F|A000    |      ;
						LDA.B r_frameCount                   ;05BD91|A51A    |00001A;
						AND.B #$01                           ;05BD93|2901    |      ;
						BEQ CODE_05BD99                      ;05BD95|F002    |05BD99;
						LDY.B #$03                           ;05BD97|A003    |      ;
	
			CODE_05BD99: TYA                                  ;05BD99|98      |      ;
						STA.W r_entity_PaletteOverride,X     ;05BD9A|9D5404  |050454;
						LDA.W r_entity_target,X              ;05BD9D|BD0606  |050606;
						BEQ CODE_05BDA5                      ;05BDA0|F003    |05BDA5;
						JMP.W CODE_05BDEA                    ;05BDA2|4CEABD  |05BDEA;
	
	
			CODE_05BDA5: LDA.B #$00                           ;05BDA5|A900    |      ;
						TAY                                  ;05BDA7|A8      |      ;
						db $20                               ;05BDA8|        |      ;
						dw getCollusionBasedOnOffset         ;05BDA9|        |0FFC1E;
						BNE CODE_05BDC4                      ;05BDAB|D017    |05BDC4;
						LDA.W r_entity_XPos,X                ;05BDAD|BD3804  |050438;
						CMP.B #$04                           ;05BDB0|C904    |      ;
						BCC CODE_05BDC4                      ;05BDB2|9010    |05BDC4;
						CMP.B #$FC                           ;05BDB4|C9FC    |      ;
						BCS CODE_05BDC4                      ;05BDB6|B00C    |05BDC4;
						LDA.W r_entity_YPos,X                ;05BDB8|BD1C04  |05041C;
						CMP.B #$20                           ;05BDBB|C920    |      ;
						BCC CODE_05BDC4                      ;05BDBD|9005    |05BDC4;
						CMP.B #$EC                           ;05BDBF|C9EC    |      ;
						BCS CODE_05BDC4                      ;05BDC1|B001    |05BDC4;
						RTS                                  ;05BDC3|60      |      ;
	
	
			CODE_05BDC4: LDA.B #$00                           ;05BDC4|A900    |      ;
						STA.W r_entity_ID,X                  ;05BDC6|9D4E05  |05054E;
						STA.W r_entity_spriteID,X            ;05BDC9|9D0004  |050400;
						INX                                  ;05BDCC|E8      |      ;
	
			CODE_05BDCD: LDA.W r_entity_ID,X                  ;05BDCD|BD4E05  |05054E;
						CMP.B #$2C                           ;05BDD0|C92C    |      ;
						BEQ CODE_05BDD7                      ;05BDD2|F003    |05BDD7;
						LDX.B r_entityID_processed           ;05BDD4|A66C    |00006C;
						RTS                                  ;05BDD6|60      |      ;
	
	
			CODE_05BDD7: DEC.W r_entity_target,X              ;05BDD7|DE0606  |050606;
						BNE CODE_05BDE3                      ;05BDDA|D007    |05BDE3;
						LDA.B #$60                           ;05BDDC|A960    |      ;
						STA.W r_entity_mask,X                ;05BDDE|9D7004  |050470;
						BNE CODE_05BDE6                      ;05BDE1|D003    |05BDE6;
	
			CODE_05BDE3: INC.W r_damagActionFlag,X            ;05BDE3|FE1D06  |05061D;
	
			CODE_05BDE6: INX                                  ;05BDE6|E8      |      ;
						BNE CODE_05BDCD                      ;05BDE7|D0E4    |05BDCD;
	
	bossID2c_AI_IDX__04: RTS                                  ;05BDE9|60      |      ;
	
	
			CODE_05BDEA: LDA.W r_Player_StateDoubled,X        ;05BDEA|BD6505  |050565;
						LSR A                                ;05BDED|4A      |      ;
						STA.B $02                            ;05BDEE|8502    |000002;
						TAY                                  ;05BDF0|A8      |      ;
						LDA.W DATA8_05BE96,Y                 ;05BDF1|B996BE  |05BE96;
						STA.W $5205                          ;05BDF4|8D0552  |055205;
						LDA.W r_entity_target,X              ;05BDF7|BD0606  |050606;
						STA.W $5206                          ;05BDFA|8D0652  |055206;
						LDA.W $5205                          ;05BDFD|AD0552  |055205;
						STA.B $00                            ;05BE00|8500    |000000;
						LDA.W DATA8_05BEA6,Y                 ;05BE02|B9A6BE  |05BEA6;
						STA.W $5205                          ;05BE05|8D0552  |055205;
						LDA.W r_entity_target,X              ;05BE08|BD0606  |050606;
						STA.W $5206                          ;05BE0B|8D0652  |055206;
						LDA.W $5205                          ;05BE0E|AD0552  |055205;
						STA.B $01                            ;05BE11|8501    |000001;
						JSR.W CODE_05BE56                    ;05BE13|2056BE  |05BE56;
						BCC CODE_05BE4B                      ;05BE16|9033    |05BE4B;
						LDY.W r_damagActionFlag,X            ;05BE18|BC1D06  |05061D;
						LDA.W r_Player_StateDoubled,X        ;05BE1B|BD6505  |050565;
						CMP.B #$18                           ;05BE1E|C918    |      ;
						BCS CODE_05BE32                      ;05BE20|B010    |05BE32;
						CMP.B #$08                           ;05BE22|C908    |      ;
						BCC CODE_05BE32                      ;05BE24|900C    |05BE32;
						LDA.W r_entity_YPos,Y                ;05BE26|B91C04  |05041C;
						SEC                                  ;05BE29|38      |      ;
						SBC.B $01                            ;05BE2A|E501    |000001;
						STA.W r_entity_YPos,X                ;05BE2C|9D1C04  |05041C;
						JMP.W CODE_05BE3B                    ;05BE2F|4C3BBE  |05BE3B;
	
	
			CODE_05BE32: LDA.W r_entity_YPos,Y                ;05BE32|B91C04  |05041C;
						CLC                                  ;05BE35|18      |      ;
						ADC.B $01                            ;05BE36|6501    |000001;
						STA.W r_entity_YPos,X                ;05BE38|9D1C04  |05041C;
	
			CODE_05BE3B: LDA.W r_Player_StateDoubled,X        ;05BE3B|BD6505  |050565;
						CMP.B #$10                           ;05BE3E|C910    |      ;
						BCS CODE_05BE4C                      ;05BE40|B00A    |05BE4C;
						LDA.W r_entity_XPos,Y                ;05BE42|B93804  |050438;
						SEC                                  ;05BE45|38      |      ;
						SBC.B $00                            ;05BE46|E500    |000000;
						STA.W r_entity_XPos,X                ;05BE48|9D3804  |050438;
	
			CODE_05BE4B: RTS                                  ;05BE4B|60      |      ;
	
	
			CODE_05BE4C: LDA.W r_entity_XPos,Y                ;05BE4C|B93804  |050438;
						CLC                                  ;05BE4F|18      |      ;
						ADC.B $00                            ;05BE50|6500    |000000;
						STA.W r_entity_XPos,X                ;05BE52|9D3804  |050438;
						RTS                                  ;05BE55|60      |      ;
	
	
			CODE_05BE56: LDY.B $02                            ;05BE56|A402    |000002;
						LDA.W DATA8_05BE85,Y                 ;05BE58|B985BE  |05BE85;
						BEQ CODE_05BE71                      ;05BE5B|F014    |05BE71;
						LDY.W r_damagActionFlag,X            ;05BE5D|BC1D06  |05061D;
						LDA.W r_entity_YPos,Y                ;05BE60|B91C04  |05041C;
						SEC                                  ;05BE63|38      |      ;
						SBC.W r_entity_YPos,X                ;05BE64|FD1C04  |05041C;
						BCS CODE_05BE6E                      ;05BE67|B005    |05BE6E;
						EOR.B #$FF                           ;05BE69|49FF    |      ;
						CLC                                  ;05BE6B|18      |      ;
						ADC.B #$01                           ;05BE6C|6901    |      ;
	
			CODE_05BE6E: CMP.B $01                            ;05BE6E|C501    |000001;
						RTS                                  ;05BE70|60      |      ;
	
	
			CODE_05BE71: LDY.W r_damagActionFlag,X            ;05BE71|BC1D06  |05061D;
						LDA.W r_entity_XPos,Y                ;05BE74|B93804  |050438;
						SEC                                  ;05BE77|38      |      ;
						SBC.W r_entity_XPos,X                ;05BE78|FD3804  |050438;
						BCS CODE_05BE82                      ;05BE7B|B005    |05BE82;
						EOR.B #$FF                           ;05BE7D|49FF    |      ;
						CLC                                  ;05BE7F|18      |      ;
						ADC.B #$01                           ;05BE80|6901    |      ;
	
			CODE_05BE82: CMP.B $00                            ;05BE82|C500    |000000;
						RTS                                  ;05BE84|60      |      ;
	
	
			DATA8_05BE85: db $01,$01,$00,$00,$00,$00,$00,$01   ;05BE85|        |      ;
						db $01,$01,$00,$00,$00,$00,$00,$00   ;05BE8D|        |      ;
						db $01                               ;05BE95|        |      ;
	
			DATA8_05BE96: db $00,$03,$06,$07,$08,$07,$06,$03   ;05BE96|        |      ;
						db $00,$03,$06,$07,$08,$07,$06,$03   ;05BE9E|        |      ;
	
			DATA8_05BEA6: db $08,$07,$06,$03,$00,$03,$06,$07   ;05BEA6|        |      ;
						db $08,$07,$06,$03,$00,$03,$06,$07   ;05BEAE|        |      ;

          someScreenLoad: PHA                                  ;05BEB6|48      |      ;
                       STX.B r_coreLoadingFuncAddr          ;05BEB7|8616    |000016;
                       LDX.B r_sceneDrawQueue               ;05BEB9|A61D    |00001D;
                       LDY.B #$00                           ;05BEBB|A000    |      ;
 
          CODE_05BEBD: LDA.W DATA8_05BEED,Y                 ;05BEBD|B9EDBE  |05BEED;
                       STA.W r_VramQueue,X                  ;05BEC0|9D0003  |050300;
                       INX                                  ;05BEC3|E8      |      ;
                       CMP.B #$FF                           ;05BEC4|C9FF    |      ;
                       BEQ CODE_05BECC                      ;05BEC6|F004    |05BECC;
                       INY                                  ;05BEC8|C8      |      ;
                       JMP.W CODE_05BEBD                    ;05BEC9|4CBDBE  |05BEBD;
 
 
          CODE_05BECC: PLA                                  ;05BECC|68      |      ;
                       TAY                                  ;05BECD|A8      |      ;
                       STX.B r_sceneDrawQueue               ;05BECE|861D    |00001D;
                       TXA                                  ;05BED0|8A      |      ;
                       SEC                                  ;05BED1|38      |      ;
                       SBC.B #$09                           ;05BED2|E909    |      ;
                       TAX                                  ;05BED4|AA      |      ;
                       LDA.B #$08                           ;05BED5|A908    |      ;
                       STA.B $00                            ;05BED7|8500    |000000;
 
          CODE_05BED9: LDA.W DATA8_05BF01,Y                 ;05BED9|B901BF  |05BF01;
                       STA.W r_VramQueue,X                  ;05BEDC|9D0003  |050300;
                       INX                                  ;05BEDF|E8      |      ;
                       INY                                  ;05BEE0|C8      |      ;
                       DEC.B $00                            ;05BEE1|C600    |000000;
                       BNE CODE_05BED9                      ;05BEE3|D0F4    |05BED9;
                       LDA.B #$04                           ;05BEE5|A904    |      ;
                       db $20                               ;05BEE7|        |      ;
                       dw screenLoad_A_CHR                  ;05BEE8|        |0FECE9;
                       LDX.B r_coreLoadingFuncAddr          ;05BEEA|A616    |000016;
                       RTS                                  ;05BEEC|60      |      ;
 
 
         DATA8_05BEED: db $01,$00,$3F,$0F,$16,$26,$20,$0F   ;05BEED|        |      ;
                       db $10,$05,$01,$0F,$0C,$10,$27,$0F   ;05BEF5|        |      ;
                       db $00,$05,$1A,$FF                   ;05BEFD|        |      ;
 
         DATA8_05BF01: db $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F   ;05BF01|        |      ;
                       db $0F,$0F,$0F,$05,$0F,$0F,$0F,$05   ;05BF09|        |      ;
                       db $0F,$0F,$05,$24,$0F,$0F,$16,$05   ;05BF11|        |      ;
                       db $0F,$02,$05,$24,$0F,$00,$16,$05   ;05BF19|        |      ;
                       db $0F,$36,$26,$16,$0F,$36,$26,$16   ;05BF21|        |      ;
                       db $0F,$36,$36,$36,$0F,$36,$36,$36,$FF   ;05BF29|        |      ; 
assert pc() <= $C000
}


{ ; -- boss bank 8 

org $23E21
base $BE21
          
				CODE_08BF58: 
							LDA.B #$00                           ;08BF58|A900    |      ;
							STA.B $17                            ;08BF5A|8517    |000017;
							LDA.W r_entity_XPos                  ;08BF5C|AD3804  |080438;
							SEC                                  ;08BF5F|38      |      ;
							SBC.W r_entity_XPos,X                ;08BF60|FD3804  |080438;
							STA.B $00                            ;08BF63|8500    |000000;
							BCS CODE_08BF74                      ;08BF65|B00D    |08BF74;
							LDA.B #$01                           ;08BF67|A901    |      ;
							STA.B $17                            ;08BF69|8517    |000017;
							LDA.B $00                            ;08BF6B|A500    |000000;
							EOR.B #$FF                           ;08BF6D|49FF    |      ;
							CLC                                  ;08BF6F|18      |      ;
							ADC.B #$01                           ;08BF70|6901    |      ;
							STA.B $00                            ;08BF72|8500    |000000;
		
				CODE_08BF74: 
							LDA.W r_entity_YPos                  ;08BF74|AD1C04  |08041C;
							SEC                                  ;08BF77|38      |      ;
							SBC.W r_entity_YPos,X                ;08BF78|FD1C04  |08041C;
							BCS CODE_08BF82                      ;08BF7B|B005    |08BF82;
							EOR.B #$FF                           ;08BF7D|49FF    |      ;
							CLC                                  ;08BF7F|18      |      ;
							ADC.B #$01                           ;08BF80|6901    |      ;
		
				CODE_08BF82: 
							CMP.B #$28                           ;08BF82|C928    |      ;
							BCC CODE_08BF92                      ;08BF84|900C    |08BF92;
							LDA.W r_entity_ID,X                  ;08BF86|BD4E05  |08054E;
							CMP.B #$01                           ;08BF89|C901    |      ;
							BNE CODE_08BF92                      ;08BF8B|D005    |08BF92;
							LDA.W r_entity_FacingLeft,X          ;08BF8D|BDA804  |0804A8;
							STA.B $17                            ;08BF90|8517    |000017;
		
				CODE_08BF92: 
							RTS                                  ;08BF92|60      |      ;
	
	
				bossID_winOrb_16: 
						LDA.B #$00                           ;08BED9|A900    |      ;
						STA.W r_entity_damage,X              ;08BEDB|9D5706  |080657;
						STA.W r_entity_Xspd,X                ;08BEDE|9DF204  |0804F2;
						STA.W r_entity_XsubSpd,X             ;08BEE1|9D0905  |080509;
						LDA.W r_entity_AI_IDX,X              ;08BEE4|BDC105  |0805C1;
						CMP.B #$01                           ;08BEE7|C901    |      ;
						BNE CODE_08BEFA                      ;08BEE9|D00F    |08BEFA;
						LDA.B #$00                           ;08BEEB|A900    |      ;
						LDY.B #$08                           ;08BEED|A008    |      ;
						db $20                               ;08BEEF|        |      ;
						dw getCollusionBasedOnOffset         ;08BEF0|        |0FFC1E;
						BEQ CODE_08BEFA                      ;08BEF2|F006    |08BEFA;
						db $20                               ;08BEF4|        |      ;
						dw setMovmentSpdZero                 ;08BEF5|        |0FFEC8;
						INC.W r_entity_AI_IDX,X              ;08BEF7|FEC105  |0805C1;
	
				CODE_08BEFA: 
						LDA.W r_entity_AI,X                  ;08BEFA|BDEF05  |0805EF;
						AND.B #$7F                           ;08BEFD|297F    |      ;
						CMP.B #$63                           ;08BEFF|C963    |      ;
						BNE CODE_08BF0B                      ;08BF01|D008    |08BF0B;
						LDA.W r_entity_AI_IDX,X              ;08BF03|BDC105  |0805C1;
						CMP.B #$02                           ;08BF06|C902    |      ;
						BCS CODE_08BF0B                      ;08BF08|B001    |08BF0B;
						RTS                                  ;08BF0A|60      |      ;
	
	
				CODE_08BF0B: 
						LDA.W r_entity_YPos                  ;08BF0B|AD1C04  |08041C;
						SEC                                  ;08BF0E|38      |      ;
						SBC.W r_entity_YPos,X                ;08BF0F|FD1C04  |08041C;
						BCS CODE_08BF19                      ;08BF12|B005    |08BF19;
						EOR.B #$FF                           ;08BF14|49FF    |      ;
						CLC                                  ;08BF16|18      |      ;
						ADC.B #$01                           ;08BF17|6901    |      ;
	
				CODE_08BF19: 
						CMP.B #$10                           ;08BF19|C910    |      ;
						BCS CODE_08BF57                      ;08BF1B|B03A    |08BF57;
						JSR.W CODE_08BF58                    ;08BF1D|2058BF  |08BF58;
						LDA.B $00                            ;08BF20|A500    |000000;
						CMP.B #$08                           ;08BF22|C908    |      ;
						BCS CODE_08BF57                      ;08BF24|B031    |08BF57;
						jsr setAutoPlayFlag                   ;08BF27|        |0FE5CE;
						
						LDA.B r_stage                        ;08BF29|A532    |000032;
						CMP.B #$0E                           ;08BF2B|C90E    |      ;
						BNE playFinishStage                      ;08BF2D|D004    |08BF33;
						LDA.B #$64                           ;08BF2F|A964    |      ;
						BNE playFinalOrbSound                   
	
				playFinishStage: 
						LDA.B #$63                          
	
				playFinalOrbSound:                              
						jsr lunchMusic                        ;08BF35|        |0FE25F;
						LDA.B #$00                           ;08BF38|A900    |      ;
						STA.B r_bossObject                   ;08BF3A|85C1    |0000C1;
						STA.W r_entity_ID,X                  ;08BF3C|9D4E05  |08054E;
						STA.W r_entity_mask,X                ;08BF3F|9D7004  |080470;
						STA.W r_entity_spriteID,X            ;08BF42|9D0004  |080400;
						LDY.B #$07                           ;08BF45|A007    |      ;
						LDA.B #$00                           ;08BF47|A900    |      ;
	
				CODE_08BF49: 
						STA.W r_bossPieces,Y     ;08BF49|99EC07  |0807EC;
						DEY                                  ;08BF4C|88      |      ;
						BNE CODE_08BF49                      ;08BF4D|D0FA    |08BF49;
						STA.W r_bossPieces       ;08BF4F|8DEC07  |0807EC;
						LDA.B #$11                           ;08BF52|A911    |      ;
						STA.B r_gameTransition               ;08BF54|852A    |00002A;
				CODE_08BF57: 		
						RTS                                  ;08BF56|60      |      ;	
 
	someSpriteRoutine_bank8: 
						LDA.W r_entity_ID,X                  ;08BE21|BD4E05  |08054E;
						ASL A                                ;08BE24|0A      |      ;
						ASL A                                ;08BE25|0A      |      ;
						TAY                                  ;08BE26|A8      |      ;
						LDA.W palBossObj,Y                 ;08BE27|B94CBE  |08BE4C;
						STA.W r_entity_PaletteOverride,X     ;08BE2A|9D5404  |080454;
						LDA.W maskBossObj,Y                 ;08BE2D|B949BE  |08BE49;
						STA.W r_entity_mask,X                ;08BE30|9D7004  |080470;
						LDA.W spriteGrBossObj,Y                 ;08BE33|B94ABE  |08BE4A;
						STA.B $01                            ;08BE36|8501    |000001;
						LDA.W animGrBossObj,Y                 ;08BE38|B94BBE  |08BE4B;
						LDY.B $01                            ;08BE3B|A401    |000001;
						jsr setSpriteAndAnimGroup_AY          		;08BE3E|        |0FEF5C;
						LDA.B #$80                           ;08BE40|A980    |      ;
						ORA.W r_entity_AI,X                  ;08BE42|1DEF05  |0805EF;
						STA.W r_entity_AI,X                  ;08BE45|9DEF05  |0805EF;
						RTS                                  ;08BE48|60      |      ;
		
	maskBossObj: 		db $40                               ;08BE49|        |      ;	
	spriteGrBossObj: 	db $00                              
	animGrBossObj:		db $0A                              
	palBossObj: 		db $00

						db $40,$00,$0A,$00		;   01
						db $40,$00,$0A,$00		;   02
						db $40,$12,$0A,$00		;   03
						db $40,$20,$0A,$01		;   04
						db $40,$00,$0A,$00		;   05
						db $40,$00,$0A,$00		;   06
						db $40,$49,$0A,$00		;   07
						db $40,$00,$0A,$00		;   08
						db $40,$00,$0A,$00		;   09
						db $40,$00,$0A,$00		;   0A
						db $40,$00,$0A,$00		;   0B
						db $40,$00,$0A,$00		;   0C
						db $40,$00,$0A,$00		;   0D
						db $40,$00,$0A,$00		;   0E
						db $40,$00,$0A,$00		;   0F
						db $40,$00,$0A,$00		;   10
						db $40,$05,$0A,$00		;   11
						db $C8,$0A,$0A,$00		;   12
						db $C8,$0C,$0A,$00		;   13
						db $40,$17,$0A,$00		;   14
						db $40,$16,$0A,$00		;   15
						db $40,$0B,$0E,$00		;   16
						db $40,$25,$0A,$00		;   17
						db $40,$02,$10,$00		;   18
						db $40,$02,$10,$00		;   19
						db $40,$08,$0E,$00		;   1A
						db $40,$0E,$10,$00		;   1B
						db $00,$43,$0A,$00		;   1C
						db $40,$21,$10,$00		;   1D
						db $40,$22,$10,$00		;   1E
						db $C8,$00,$10,$00		;   1F
						db $C8,$00,$10,$00		;   20
						db $C8,$00,$10,$00		;   21
						db $C8,$00,$10,$00		;   22
						db $40,$14,$0E,$00		;   23                        
						
						db $ff,$ff,$ff,$ff		;	24
						db $ff,$ff,$ff,$ff		;	25 
						db $9d,$05,$05,$bd		; 	26
 
; -- free space bank 8 
	


pad $20000  
assert pc() <= $C000
}


{ ; -- boss bank C 

org $3242F
base $A42F

 
{ ; boss doupleGanger


		bossPreview_doupleGanger_0B:
						LDA.B #$00                           ;0CA59B|A900    |      ;
						STA.W r_entity_damage,X              ;0CA59D|9D5706  |0C0657;
						STA.W r_entity_AI,X                  ;0CA5A0|9DEF05  |0C05EF;
						STA.W r_Player_StateDoubled,X        ;0CA5A3|9D6505  |0C0565;
						JSR.W CODE_0CA8B8                    ;0CA5A6|20B8A8  |0CA8B8;
						LDA.B #$01                           ;0CA5A9|A901    |      ;
						STA.W r_entity_FacingLeft,X          ;0CA5AB|9DA804  |0C04A8;
						LDA.B #$00                           ;0CA5AE|A900    |      ;
						STA.W r_entity_spriteID,X            ;0CA5B0|9D0004  |0C0400;
						LDA.B #$01                           ;0CA5B3|A901    |      ;
						STA.B r_defaultCHR                   ;0CA5B5|85B0    |0000B0;
						LDA.B r_bossActiveFlag               ;0CA5B7|A578    |000078;
						BEQ CODE_0CA5C0                      ;0CA5B9|F005    |0CA5C0;
						LDY.B #$00                           ;0CA5BB|A000    |      ;
						STY.W r_orb_flagsTimer               ;0CA5BD|8CF307  |0C07F3;
	
			CODE_0CA5C0:
						RTS                                  ;0CA5C0|60      |      ;
	
	
			CODE_0CA5C1:
						LDX.B r_entityID_processed           ;0CA5C1|A66C    |00006C;
						LDA.W r_Player_StateDoubled,X        ;0CA5C3|BD6505  |0C0565;
						CMP.B #$19                           ;0CA5C6|C919    |      ;
						BCC CODE_0CA5CD                      ;0CA5C8|9003    |0CA5CD;
						JMP.W bossDoubleState                ;0CA5CA|4C2AA6  |0CA62A;
	
	
			CODE_0CA5CD:
						JSR.W CODE_0CA8B4                    ;0CA5CD|20B4A8  |0CA8B4;
						LDA.B #$19                           ;0CA5D0|A919    |      ;
						STA.W r_Player_StateDoubled,X        ;0CA5D2|9D6505  |0C0565;
						JMP.W bossDoubleState                ;0CA5D5|4C2AA6  |0CA62A;
	
	
			CODE_0CA5D8:
						DEC.W r_entity_target,X              ;0CA5D8|DE0606  |0C0606;
						BEQ CODE_0CA5DE                      ;0CA5DB|F001    |0CA5DE;
						RTS                                  ;0CA5DD|60      |      ;
	
	
			CODE_0CA5DE:
						LDA.W r_Player_StateDoubled,X        ;0CA5DE|BD6505  |0C0565;
						AND.B #$7F                           ;0CA5E1|297F    |      ;
						STA.W r_Player_StateDoubled,X        ;0CA5E3|9D6505  |0C0565;
						LDA.W $07EE                          ;0CA5E6|ADEE07  |0C07EE;
						STA.W r_entity_mask,X                ;0CA5E9|9D7004  |0C0470;
						LDA.B #$01                           ;0CA5EC|A901    |      ;
						STA.W $07EF                          ;0CA5EE|8DEF07  |0C07EF;
						RTS                                  ;0CA5F1|60      |      ;
	
	
			CODE_0CA5F2:
						LDA.B #$00                           ;0CA5F2|A900    |      ;
						STA.W r_entity_damageRelated,X       ;0CA5F4|9D6906  |0C0669;
						LDA.W r_Player_StateDoubled,X        ;0CA5F7|BD6505  |0C0565;
						ORA.B #$80                           ;0CA5FA|0980    |      ;
						STA.W r_Player_StateDoubled,X        ;0CA5FC|9D6505  |0C0565;
						LDA.B #$0C                           ;0CA5FF|A90C    |      ;
						STA.W r_entity_target,X              ;0CA601|9D0606  |0C0606;
						LDA.W r_entity_mask,X                ;0CA604|BD7004  |0C0470;
						STA.W $07EE                          ;0CA607|8DEE07  |0C07EE;
						JSR.W CODE_0CA8AC                    ;0CA60A|20ACA8  |0CA8AC;
						JMP.W CODE_0CA620                    ;0CA60D|4C20A6  |0CA620;


; -------------------------------------------------------------


	bossID_doupleGanger_0b:
						LDA.B #$03                           ;0CA610|A903    |      ;
						LDX.B #$08                           ;0CA612|A208    |      ;
						JSR.W bossDouplegangerRAM16_jmpTab   ;0CA614|2040A4  |0CA440;
						LDA.B r_HUD_healthBoss               ;0CA617|A53D    |00003D;
						BEQ CODE_0CA5C1                      ;0CA619|F0A6    |0CA5C1;
						LDA.W r_entity_damageRelated,X       ;0CA61B|BD6906  |0C0669;
						BNE CODE_0CA5F2                      ;0CA61E|D0D2    |0CA5F2;
	
			CODE_0CA620:
						JSR.W entetyChecks_CC                ;0CA620|206EA6  |0CA66E;
						BCC bossDoubleState                  ;0CA623|9005    |0CA62A;
						LDA.B #$05                           ;0CA625|A905    |      ;
						STA.W r_Player_StateDoubled,X        ;0CA627|9D6505  |0C0565;
	
		bossDoubleState:
						LDX.B r_entityID_processed           ;0CA62A|A66C    |00006C;
						LDA.W r_Player_StateDoubled,X        ;0CA62C|BD6505  |0C0565;
						BMI CODE_0CA5D8                      ;0CA62F|30A7    |0CA5D8;
						db $20                               ;0CA631|        |      ;
						dw jumpFromStackYXpreserved          ;0CA632|        |0FE86D;
						dw bossDoubleState__00               ;0CA634|        |0CA78B;
						dw bossDoubleState__01               ;0CA636|        |0CA79D;
						dw bossDoubleState__02               ;0CA638|        |0CA7AA;
						dw bossDoubleState__01               ;0CA63A|        |0CA79D;
						dw bossDoubleState__04               ;0CA63C|        |0CA7C0;
						dw bossDoubleState__05               ;0CA63E|        |0CA76C;
						dw bossDoubleState__06               ;0CA640|        |0CA77D;
						dw bossDoubleState__01               ;0CA642|        |0CA79D;
						dw bossDoubleState__02               ;0CA644|        |0CA7AA;
						dw bossDoubleState__01               ;0CA646|        |0CA79D;
						dw bossDoubleState__04               ;0CA648|        |0CA7C0;
						dw bossDoubleState__0b               ;0CA64A|        |0CA9E2;
						dw bossDoubleState__0c               ;0CA64C|        |0CA9F1;
						dw bossDoubleState__0d               ;0CA64E|        |0CAA78;
						dw bossDoubleState__0e               ;0CA650|        |0CAB04;
						dw bossDoubleState__0f               ;0CA652|        |0CAB22;
						dw bossDoubleState__10               ;0CA654|        |0CAB7F;
						dw bossDoubleState__0f               ;0CA656|        |0CAB22;
						dw bossDoubleState_rts_12            ;0CA658|        |0CAB93;
						dw bossDoubleState__13               ;0CA65A|        |0CAB94;
						dw RLE_tilemap_map00_06              ;0CA65C|        |0CABA8;
						dw RLE_tilemap_map00_06              ;0CA65E|        |0CABA8;
						dw bossDoubleState__0b               ;0CA660|        |0CA9E2;
						dw bossDoubleState__0b               ;0CA662|        |0CA9E2;
						dw bossDoubleState__0b               ;0CA664|        |0CA9E2;
						dw bossDoubleState__19               ;0CA666|        |0CA6E7;
						dw bossDoubleState__1a               ;0CA668|        |0CA719;
						dw bossDoubleState__1b               ;0CA66A|        |0CA739;
						dw bossDoubleState_rts_1c            ;0CA66C|        |0CA76B;

; -- player action hijacks ------------------------------------------------------

		preservY_Ram16:
						STY.B $00                            ;0CA42F|8400    |000000; 
						ASL A                                ;0CA431|0A      |      ;
						TAY                                  ;0CA432|A8      |      ;
						LDA.W bossDoubleStates,Y                 ;0CA433|B952A4  |0CA452;
						STA.B r_coreLoadingFuncAddr          ;0CA436|8516    |000016;
						LDA.W bossDoubleStates+1,Y                 ;0CA438|B953A4  |0CA453;
						STA.B $17                            ;0CA43B|8517    |000017;
						LDY.B $00                            ;0CA43D|A400    |000000;
						RTS                                  ;0CA43F|60      |      ;
			
			bossDoubleStates:
						dw bossDoupleGanger_jump_00          ;0CA452|        |0E9628;
						dw bossDoupleGanger_hurt_01          ;0CA454|        |0E98C8;
						dw bossDoupleGanger_duck_02          ;0CA456|        |0E974F;
						dw bossDoupleGanger_attack_03        ;0CA458|        |0EBA15;
						dw bossDoupleGanger_collusion_04     ;0CA45A|        |0EAE3F;
						dw bossDoupleGanger_anim_05          ;0CA45C|        |0EBAF4;
						dw bossDoupleGanger_AlucardAttack_06 ;0CA45E|        |0EBA6B;	
						dw bossDoupleGanger_weaponAnim_07    ;0CA460|        |0EBC81;
						dw bossDoupleGanger_grant_08         ;0CA462| 		 |0988DF;
						
	bossDouplegangerRAM16_jmpTab:
						PHA                                  ;0CA440|48      |      ;
						TXA                                  ;0CA441|8A      |      ;
						JSR.W preservY_Ram16                 ;0CA442|202FA4  |0CA42F;
						LDX.B r_entityID_processed           ;0CA445|A66C    |00006C;
						PLA                                  ;0CA447|68      |      ;
						TAY                                  ;0CA448|A8      |      ;
						jmp loadBank_9_doRam16                ;0CA44A|        |0FFBCF;
	
		loadBank0e_jump:
						JSR.W preservY_Ram16                 ;0CA44C|202FA4  |0CA42F;
						jmp loadBank_E_doRam16                ;0CA450|        |0FFBD3;
	


	
			bossID__0f:
						LDA.W r_misc_movementState,X         ;0CA464|BD4506  |0C0645;
						BEQ CODE_0CA499                      ;0CA467|F030    |0CA499;
						CMP.B #$01                           ;0CA469|C901    |      ;
						BEQ CODE_0CA499                      ;0CA46B|F02C    |0CA499;
						LDA.B #$00                           ;0CA46D|A900    |      ;
						STA.W r_entity_damageRelated,X       ;0CA46F|9D6906  |0C0669;
						LDA.W r_entity_Counter,X             ;0CA472|BD3306  |000633;
						STA.W r_entity_ID,X                  ;0CA475|9D4E05  |00054E;
						LDA.B #$04                           ;0CA478|A904    |      ;
						JSR.W loadBank0e_jump                ;0CA47A|204CA4  |0CA44C;
						LDA.W r_entity_ID,X                  ;0CA47D|BD4E05  |00054E;
						BEQ CODE_0CA499                      ;0CA480|F017    |0CA499;
						CMP.B #$08                           ;0CA482|C908    |      ;
						BEQ CODE_0CA48A                      ;0CA484|F004    |0CA48A;
						CMP.B #$09                           ;0CA486|C909    |      ;
						BNE CODE_0CA48E                      ;0CA488|D004    |0CA48E;
	
			CODE_0CA48A:
						LDA.B #$16                           ;0CA48A|A916    |      ;
						BNE CODE_0CA491                      ;0CA48C|D003    |0CA491;
	
			CODE_0CA48E:
						LDA.W $048D                          ;0CA48E|AD8D04  |00048D;
	
			CODE_0CA491:
						STA.W r_entity_spriteGroup,X         ;0CA491|9D8C04  |00048C;
						LDA.B #$0F                           ;0CA494|A90F    |      ;
						STA.W r_entity_ID,X                  ;0CA496|9D4E05  |0C054E;
	
			CODE_0CA499:
						RTS                                  ;0CA499|60      |      ;
	
	
			bossID__10:
						RTS                                  ;0CA49A|60      |      ;
	
	
			CODE_0CA49B:
						LDA.W r_entity_XPos                  ;0CA49B|AD3804  |0C0438;
						SEC                                  ;0CA49E|38      |      ;
						SBC.W r_entity_XPos,X                ;0CA49F|FD3804  |0C0438;
						BCS CODE_0CA4A6                      ;0CA4A2|B002    |0CA4A6;
						EOR.B #$FF                           ;0CA4A4|49FF    |      ;
	
			CODE_0CA4A6:
						CMP.B #$08                           ;0CA4A6|C908    |      ;
						BCS CODE_0CA4AE                      ;0CA4A8|B004    |0CA4AE;
						LDA.B #$04                           ;0CA4AA|A904    |      ;
						BNE CODE_0CA4B9                      ;0CA4AC|D00B    |0CA4B9;
	
			CODE_0CA4AE:
						LDA.B #$02                           ;0CA4AE|A902    |      ;
						BNE CODE_0CA4B9                      ;0CA4B0|D007    |0CA4B9;
	
			CODE_0CA4B2:
						LDA.W r_entity_Counter,X             ;0CA4B2|BD3306  |0C0633;
						CMP.B #$02                           ;0CA4B5|C902    |      ;
						BEQ CODE_0CA49B                      ;0CA4B7|F0E2    |0CA49B;
	
			CODE_0CA4B9:
						STA.B $00                            ;0CA4B9|8500    |000000;
						ASL A                                ;0CA4BB|0A      |      ;
						CLC                                  ;0CA4BC|18      |      ;
						ADC.B $00                            ;0CA4BD|6500    |000000;
						TAY                                  ;0CA4BF|A8      |      ;
						LDA.W DATA8_0CA565,Y                 ;0CA4C0|B965A5  |0CA565;
						CMP.B #$0A                           ;0CA4C3|C90A    |      ;
						BEQ CODE_0CA523                      ;0CA4C5|F05C    |0CA523;
						STA.B r_pointerQueue                 ;0CA4C7|8508    |000008;
						LDA.W DATA8_0CA566,Y                 ;0CA4C9|B966A5  |0CA566;
						PHA                                  ;0CA4CC|48      |      ;
						LDA.W DATA8_0CA566+1,Y                 ;0CA4CD|B967A5  |0CA567;
						PHA                                  ;0CA4D0|48      |      ;
						LDY.B r_partnerIdx                   ;0CA4D1|A43B    |00003B;
						LDX.B #$02                           ;0CA4D3|A202    |      ;
						LDA.B #$03                           ;0CA4D5|A903    |      ;
						JSR.W loadBank0e_jump                ;0CA4D7|204CA4  |0CA44C;
						PLA                                  ;0CA4DA|68      |      ;
						TAY                                  ;0CA4DB|A8      |      ;
						PLA                                  ;0CA4DC|68      |      ;
						BCS CODE_0CA4E2                      ;0CA4DD|B003    |0CA4E2;
						LDX.B r_entityID_processed           ;0CA4DF|A66C    |00006C;
						RTS                                  ;0CA4E1|60      |      ;
	
	
			CODE_0CA4E2:
						STA.W r_misc_movementState,X         ;0CA4E2|9D4506  |0C0645;
						TYA                                  ;0CA4E5|98      |      ;
						STA.W r_entity_damage,X              ;0CA4E6|9D5706  |0C0657;
						LDA.W r_entity_ID,X                  ;0CA4E9|BD4E05  |0C054E;
						STA.W r_entity_Counter,X             ;0CA4EC|9D3306  |0C0633;
						CMP.B #$05                           ;0CA4EF|C905    |      ;
						BEQ CODE_0CA4FB                      ;0CA4F1|F008    |0CA4FB;
						CMP.B #$0A                           ;0CA4F3|C90A    |      ;
						BEQ CODE_0CA4FB                      ;0CA4F5|F004    |0CA4FB;
						LDA.B #$03                           ;0CA4F7|A903    |      ;
						BNE CODE_0CA4FD                      ;0CA4F9|D002    |0CA4FD;
	
			CODE_0CA4FB:
						LDA.B #$00                           ;0CA4FB|A900    |      ;
	
			CODE_0CA4FD:
						STA.W r_entity_PaletteOverride,X     ;0CA4FD|9D5404  |0C0454;
						LDA.B #$0F                           ;0CA500|A90F    |      ;
						STA.W r_entity_ID,X                  ;0CA502|9D4E05  |0C054E;
						JSR.W CODE_0CA8C0                    ;0CA505|20C0A8  |0CA8C0;
						LDA.W r_misc_movementState,X         ;0CA508|BD4506  |0C0645;
						STA.B r_bossDopplegangerHitbox       ;0CA50B|85BC    |0000BC;
						LDA.B #$20                           ;0CA50D|A920    |      ;
						STA.B r_bossSpecialHitbox            ;0CA50F|85BA    |0000BA;
						LDA.B #$00                           ;0CA511|A900    |      ;
						STA.B r_bossMeleeHitbox              ;0CA513|85BB    |0000BB;
	
			CODE_0CA515:
						LDX.B r_entityID_processed           ;0CA515|A66C    |00006C;
						LDA.B #$00                           ;0CA517|A900    |      ;
						STA.W r_entity_OamBaseOffset,X       ;0CA519|9D9305  |0C0593;
						LDA.B #$01                           ;0CA51C|A901    |      ;
						STA.W r_entity_AnimTimer,X           ;0CA51E|9D7C05  |0C057C;
						SEC                                  ;0CA521|38      |      ;
						RTS                                  ;0CA522|60      |      ;
	
	
			CODE_0CA523:
						LDA.W DATA8_0CA566,Y                 ;0CA523|B966A5  |0CA566;
						PHA                                  ;0CA526|48      |      ;
						LDX.B #$02                           ;0CA527|A202    |      ;
						LDA.B #$06                           ;0CA529|A906    |      ;
						JSR.W loadBank0e_jump                ;0CA52B|204CA4  |0CA44C;
						PLA                                  ;0CA52E|68      |      ;
						BCC CODE_0CA562                      ;0CA52F|9031    |0CA562;
						STA.B $01                            ;0CA531|8501    |000001;
						LDX.B #$02                           ;0CA533|A202    |      ;
	
			CODE_0CA535:
						LDA.W r_entity_ID,X                  ;0CA535|BD4E05  |0C054E;
						CMP.B #$0A                           ;0CA538|C90A    |      ;
						BEQ CODE_0CA543                      ;0CA53A|F007    |0CA543;
	
			CODE_0CA53C:
						INX                                  ;0CA53C|E8      |      ;
						CPX.B #$05                           ;0CA53D|E005    |      ;
						BCC CODE_0CA535                      ;0CA53F|90F4    |0CA535;
						BCS CODE_0CA515                      ;0CA541|B0D2    |0CA515;
	
			CODE_0CA543:
						LDA.W r_Player_StateDoubled,X        ;0CA543|BD6505  |0C0565;
						BNE CODE_0CA53C                      ;0CA546|D0F4    |0CA53C;
						LDA.B $01                            ;0CA548|A501    |000001;
						STA.W r_misc_movementState,X         ;0CA54A|9D4506  |0C0645;
						LDA.W r_entity_ID,X                  ;0CA54D|BD4E05  |0C054E;
						STA.W r_entity_Counter,X             ;0CA550|9D3306  |0C0633;
						LDA.B #$0F                           ;0CA553|A90F    |      ;
						STA.W r_entity_ID,X                  ;0CA555|9D4E05  |0C054E;
						JSR.W CODE_0CA8C0                    ;0CA558|20C0A8  |0CA8C0;
						LDA.B #$30                           ;0CA55B|A930    |      ;
						STA.W r_entity_damage,X              ;0CA55D|9D5706  |0C0657;
						BNE CODE_0CA53C                      ;0CA560|D0DA    |0CA53C;
	
			CODE_0CA562:
						LDX.B r_entityID_processed           ;0CA562|A66C    |00006C;
						RTS                                  ;0CA564|60      |      ;
	
	
			DATA8_0CA565:
						db $02                               ;0CA565|        |      ;
	
			DATA8_0CA566:
						db $03                               ;0CA566|        |      ;
	
			DATA8_0CA567:
						db $30,$05,$02,$30,$09,$04,$30,$0A   ;0CA567|        |      ;
						db $06,$30,$08,$05,$30               ;0CA56F|        |      ;
	
			CODE_0CA574: 
						LDA.W r_Player_StateDoubled,X        ;0CA574|BD6505  |0C0565;
						PHA                                  ;0CA577|48      |      ;
						SEC                                  ;0CA578|38      |      ;
						SBC.B #$10                           ;0CA579|E910    |      ;
						TAY                                  ;0CA57B|A8      
						LDA.W DATA8_0CA599,Y                 ;0CA57C|B999A5  |0CA599;
						STA.W r_Player_StateDoubled,X        ;0CA57F|9D6505  |0C0565;
						LDA.W r_entity_Counter,X             ;0CA582|BD3306  |0C0633;
						STA.W r_entity_ID,X                  ;0CA585|9D4E05  |0C054E;
						LDA.B #$05                           ;0CA588|A905    |      ;
						JSR.W loadBank0e_jump                ;0CA58A|204CA4  |0CA44C;
						LDX.B r_entityID_processed           ;0CA58D|A66C    |00006C;
						PLA                                  ;0CA58F|68      |      ;
						STA.W r_Player_StateDoubled,X        ;0CA590|9D6505  |0C0565;
						LDA.B #$0B                           ;0CA593|A90B    |      ;
						STA.W r_entity_ID,X                  ;0CA595|9D4E05  |0C054E;
						RTS                                  ;0CA598|60      |      ;
	
	
			DATA8_0CA599:
						db $20,$22                           ;0CA599|        |      ;

; -- boss states and other things ----------------------------------------

	
		entetyChecks_CC:
						LDX.B r_entityID_processed           ;0CA66E|A66C    |00006C;
						LDA.W r_Player_StateDoubled,X        ;0CA670|BD6505  |0C0565;
						CMP.B #$0B                           ;0CA673|C90B    |      ;
						BCC CODE_0CA685                      ;0CA675|900E    |0CA685;
						CMP.B #$19                           ;0CA677|C919    |      ;
						BCS CODE_0CA685                      ;0CA679|B00A    |0CA685;
						LDA.W r_entity_ID                    ;0CA67B|AD4E05  |0C054E;
						CMP.W r_entity_Counter,X             ;0CA67E|DD3306  |0C0633;
						BEQ CODE_0CA685                      ;0CA681|F002    |0CA685;
						SEC                                  ;0CA683|38      |      ;
						RTS                                  ;0CA684|60      |      ;
	
	
			CODE_0CA685:
						CLC                                  ;0CA685|18      |      ;
						RTS                                  ;0CA686|60      |      ;
	
	
			CODE_0CA687:
						LDX.B #$02                           ;0CA687|A202    |      ;
						LDA.B #$00                           ;0CA689|A900    |      ;
	
			CODE_0CA68B:
						STA.W r_entity_spriteID,X            ;0CA68B|9D0004  |0C0400;
						STA.W r_entity_ID,X                  ;0CA68E|9D4E05  |0C054E;
						STA.W r_entity_XPos,X                ;0CA691|9D3804  |0C0438;
						STA.W r_entity_YPos,X                ;0CA694|9D1C04  |0C041C;
						STA.W r_entity_mask,X                ;0CA697|9D7004  |0C0470;
						INX                                  ;0CA69A|E8      |      ;
						CPX.B #$06                           ;0CA69B|E006    |      ;
						BCC CODE_0CA68B                      ;0CA69D|90EC    |0CA68B;
						LDX.B r_entityID_processed           ;0CA69F|A66C    |00006C;
						RTS                                  ;0CA6A1|60      |      ;
	
	
			CODE_0CA6A2:
						LDA.W r_entity_XPos,X                ;0CA6A2|BD3804  |0C0438;
						STA.B $00                            ;0CA6A5|8500    |000000;
						LDA.W r_entity_YPos,X                ;0CA6A7|BD1C04  |0C041C;
						STA.B $01                            ;0CA6AA|8501    |000001;
						LDX.B #$03                           ;0CA6AC|A203    |      ;
						LDA.B #$00                           ;0CA6AE|A900    |      ;
						STA.B $02                            ;0CA6B0|8502    |000002;
	
			CODE_0CA6B2:
						LDY.B $02                            ;0CA6B2|A402    |000002;
						CLC                                  ;0CA6B4|18      |      ;
						LDA.B $00                            ;0CA6B5|A500    |000000;
						ADC.W DATA8_0CA6DF,Y                 ;0CA6B7|79DFA6  |0CA6DF;
						STA.W r_entity_XPos,X                ;0CA6BA|9D3804  |0C0438;
						CLC                                  ;0CA6BD|18      |      ;
						LDA.B $01                            ;0CA6BE|A501    |000001;
						ADC.W DATA8_0CA6DF+1,Y                 ;0CA6C0|79E0A6  |0CA6E0;
						STA.W r_entity_YPos,X                ;0CA6C3|9D1C04  |0C041C;
						JSR.W CODE_0CA8B4                    ;0CA6C6|20B4A8  |0CA8B4;
						LDA.B #$0E                           ;0CA6C9|A90E    |      ;
						LDY.B #$08                           ;0CA6CB|A008    |      ;
						db $20                               ;0CA6CD|        |      ;
						dw setSpriteAndAnimGroup_AY                 ;0CA6CE|        |0FEF5C;
	
						LDA.B #$00                           ;0CA6D0|A900    |      ;
						STA.W r_entity_PaletteOverride,X     ;0CA6D2|9D5404  |0C0454;
						INC.B $02                            ;0CA6D5|E602    |000002;
						INC.B $02                            ;0CA6D7|E602    |000002;
						INX                                  ;0CA6D9|E8      |      ;
						CPX.B #$07                           ;0CA6DA|E007    |      ;
						BCC CODE_0CA6B2                      ;0CA6DC|90D4    |0CA6B2;
						RTS                                  ;0CA6DE|60      |      ;
	
	
			DATA8_0CA6DF:
						db $00                               ;0CA6DF|        |      ;
	
			DATA8_0CA6E0:
						db $00,$00,$E8,$F8,$F4,$08,$F4       ;0CA6E0|        |      ;
	
	bossDoubleState__19:
						LDA.B #$7B                           ;0CA6E7|A97B    |      ;
						db $20                               ;0CA6E9|        |      ;
						dw lunchMusic                        ;0CA6EA|        |0FE25F;
						db $20                               ;0CA6EC|        |      ;
						dw setAutoPlayFlag                   ;0CA6ED|        |0FE5CE;
						LDA.B #$00                           ;0CA6EF|A900    |      ;
						STA.B $03                            ;0CA6F1|8503    |000003;
						STA.B $01                            ;0CA6F3|8501    |000001;
						LDA.B #$50                           ;0CA6F5|A950    |      ;
						STA.B $02                            ;0CA6F7|8502    |000002;
						db $20                               ;0CA6F9|        |      ;
						dw CODE_0FE777                       ;0CA6FA|        |0FE777;
						JSR.W CODE_0CA687                    ;0CA6FC|2087A6  |0CA687;
						JSR.W CODE_0CA6A2                    ;0CA6FF|20A2A6  |0CA6A2;
						LDX.B r_entityID_processed           ;0CA702|A66C    |00006C;
						JSR.W CODE_0CA8AC                    ;0CA704|20ACA8  |0CA8AC;
						LDA.B #$00                           ;0CA707|A900    |      ;
						TAY                                  ;0CA709|A8      |      ;
						JSR.W CODE_0CA89C                    ;0CA70A|209CA8  |0CA89C;
						JSR.W CODE_0CA8A4                    ;0CA70D|20A4A8  |0CA8A4;
						LDA.B #$B4                           ;0CA710|A9B4    |      ;
						STA.W r_entity_target,X              ;0CA712|9D0606  |0C0606;
						INC.W r_Player_StateDoubled,X        ;0CA715|FE6505  |0C0565;
						RTS                                  ;0CA718|60      |      ;
	
	
	bossDoubleState__1a:
						DEC.W r_entity_target,X              ;0CA719|DE0606  |0C0606;
						BNE CODE_0CA721                      ;0CA71C|D003    |0CA721;
						INC.W r_Player_StateDoubled,X        ;0CA71E|FE6505  |0C0565;
	
			CODE_0CA721:
						LDX.B #$03                           ;0CA721|A203    |      ;
	
			DATA8_0CA723:
						db $20                               ;0CA723|        |      ;
						dw updateSpriteLoop                  ;0CA724|        |0FEF75;
						INX                                  ;0CA726|E8      |      ;
						CPX.B #$07                           ;0CA727|E007    |      ;
						BCC DATA8_0CA723                     ;0CA729|90F8    |0CA723;
						LDX.B r_entityID_processed           ;0CA72B|A66C    |00006C;
						LDA.B r_frameCount                   ;0CA72D|A51A    |00001A;
						LSR A                                ;0CA72F|4A      |      ;
						LSR A                                ;0CA730|4A      |      ;
						AND.B #$03                           ;0CA731|2903    |      ;
						STA.W r_entity_Counter,X             ;0CA733|9D3306  |0C0633;
						JMP.W CODE_0CA7FC                    ;0CA736|4CFCA7  |0CA7FC;
	
	
	bossDoubleState__1b:
						LDA.B #$00                           ;0CA739|A900    |      ;
						STA.W $0401                          ;0CA73B|8D0104  |0C0401;
						STA.W $0403                          ;0CA73E|8D0304  |0C0403;
						STA.W $0404                          ;0CA741|8D0404  |0C0404;
						STA.W $0405                          ;0CA744|8D0504  |0C0405;
						STA.W $0406                          ;0CA747|8D0604  |0C0406;
						LDA.B #$02                           ;0CA74A|A902    |      ;
						STA.W r_orb_flagsTimer               ;0CA74C|8DF307  |0C07F3;
						LDA.W DATA8_0CA769                   ;0CA74F|AD69A7  |0CA769;
						STA.B $00                            ;0CA752|8500    |000000;
						LDA.W DATA8_0CA769+1                   ;0CA754|AD6AA7  |0CA76A;
						STA.B $01                            ;0CA757|8501    |000001;
						LDA.B #$92                           ;0CA759|A992    |      ;
						db $20                               ;0CA75B|        |      ;
						dw runRAM_00_inBankA                 ;0CA75C|        |0FE62F;
						LDX.B r_entityID_processed           ;0CA75E|A66C    |00006C;
						LDA.B #$00                           ;0CA760|A900    |      ;
						STA.W r_entity_spriteID,X            ;0CA762|9D0004  |0C0400;
						STA.W r_entity_ID,X                  ;0CA765|9D4E05  |0C054E;
						RTS                                  ;0CA768|60      |      ;
	
	
			DATA8_0CA769:
							dw setEntity_stats_03
	
	bossDoubleState_rts_1c:
						RTS                                  ;0CA76B|60      |      ;
	
	
	bossDoubleState__05:
						JSR.W CODE_0CA687                    ;0CA76C|2087A6  |0CA687;
						LDX.B r_entityID_processed           ;0CA76F|A66C    |00006C;
						LDA.B #$18                           ;0CA771|A918    |      ;
						STA.W r_entity_target,X              ;0CA773|9D0606  |0C0606;
						JSR.W CODE_0CA8AC                    ;0CA776|20ACA8  |0CA8AC;
						INC.W r_Player_StateDoubled,X        ;0CA779|FE6505  |0C0565;
	
			CODE_0CA77C:
						RTS                                  ;0CA77C|60      |      ;
	
	
	bossDoubleState__06:
						DEC.W r_entity_target,X              ;0CA77D|DE0606  |0C0606;
						BNE CODE_0CA77C                      ;0CA780|D0FA    |0CA77C;
						LDA.B #$2F                           ;0CA782|A92F    |      ;
						STA.B r_CHR_BankSpr_0c00             ;0CA784|8549    |000049;
						LDA.B #$45                           ;0CA786|A945    |      ;
						db $20                               ;0CA788|        |      ;
						dw lunchMusic                        ;0CA789|        |0FE25F;
	
	bossDoubleState__00:
						JSR.W CODE_0CA8B4                    ;0CA78B|20B4A8  |0CA8B4;
						LDA.B #$20                           ;0CA78E|A920    |      ;
						STA.W r_entity_target,X              ;0CA790|9D0606  |0C0606;
						INC.W r_Player_StateDoubled,X        ;0CA793|FE6505  |0C0565;
						LDA.B #$00                           ;0CA796|A900    |      ;
						LDY.B #$0E                           ;0CA798|A00E    |      ;
						db $4C                               ;0CA79A|        |      ;
	
						dw setSpriteAndAnimGroup_AY                 ;0CA79B|        |0FEF5C;
	
	
	bossDoubleState__01:
						DEC.W r_entity_target,X              ;0CA79D|DE0606  |0C0606;
						BEQ CODE_0CA7A3                      ;0CA7A0|F001    |0CA7A3;
						RTS                                  ;0CA7A2|60      |      ;
	
	
			CODE_0CA7A3:
						JSR.W CODE_0CA8B0                    ;0CA7A3|20B0A8  |0CA8B0;
						INC.W r_Player_StateDoubled,X        ;0CA7A6|FE6505  |0C0565;
						RTS                                  ;0CA7A9|60      |      ;
	
	
	bossDoubleState__02:
						LDA.B #$2F                           ;0CA7AA|A92F    |      ;
						STA.B r_CHR_BankSpr_0c00             ;0CA7AC|8549    |000049;
						JSR.W CODE_0CA8B4                    ;0CA7AE|20B4A8  |0CA8B4;
						LDA.B #$10                           ;0CA7B1|A910    |      ;
						STA.W r_entity_target,X              ;0CA7B3|9D0606  |0C0606;
						INC.W r_Player_StateDoubled,X        ;0CA7B6|FE6505  |0C0565;
						LDA.B #$00                           ;0CA7B9|A900    |      ;
						LDY.B #$0F                           ;0CA7BB|A00F    |      ;
						db $4C                               ;0CA7BD|        |      ;
	
						dw setSpriteAndAnimGroup_AY                 ;0CA7BE|        |0FEF5C;
	
	
	bossDoubleState__04:
						LDA.W r_entity_ID                    ;0CA7C0|AD4E05  |0C054E;
						JSR.W CODE_0CA7DA                    ;0CA7C3|20DAA7  |0CA7DA;
						LDA.B $00                            ;0CA7C6|A500    |000000;
						STA.W r_Player_StateDoubled,X        ;0CA7C8|9D6505  |0C0565;
						LDA.B #$04                           ;0CA7CB|A904    |      ;
						STA.W r_entity_target,X              ;0CA7CD|9D0606  |0C0606;
						LDY.W r_entity_Counter,X             ;0CA7D0|BC3306  |0C0633;
						LDA.W DATA8_0CA830,Y                 ;0CA7D3|B930A8  |0CA830;
						STA.W r_entity_damage,X              ;0CA7D6|9D5706  |0C0657;
						RTS                                  ;0CA7D9|60      |      ;
	
	
			CODE_0CA7DA:
						PHA                                  ;0CA7DA|48      |      ;
						LDA.W r_entity_Counter,X             ;0CA7DB|BD3306  |0C0633;
						CMP.B #$02                           ;0CA7DE|C902    |      ;
						BNE CODE_0CA7EB                      ;0CA7E0|D009    |0CA7EB;
						LDA.W r_entity_YPos,X                ;0CA7E2|BD1C04  |0C041C;
						SEC                                  ;0CA7E5|38      |      ;
						SBC.B #$04                           ;0CA7E6|E904    |      ;
						STA.W r_entity_YPos,X                ;0CA7E8|9D1C04  |0C041C;
	
			CODE_0CA7EB:
						PLA                                  ;0CA7EB|68      |      ;
						STA.W r_entity_Counter,X             ;0CA7EC|9D3306  |0C0633;
						CMP.B #$02                           ;0CA7EF|C902    |      ;
						BNE CODE_0CA7FC                      ;0CA7F1|D009    |0CA7FC;
						LDA.W r_entity_YPos,X                ;0CA7F3|BD1C04  |0C041C;
						CLC                                  ;0CA7F6|18      |      ;
						ADC.B #$04                           ;0CA7F7|6904    |      ;
						STA.W r_entity_YPos,X                ;0CA7F9|9D1C04  |0C041C;
	
			CODE_0CA7FC:
						LDA.W r_entity_Counter,X             ;0CA7FC|BD3306  |0C0633;
						ASL A                                ;0CA7FF|0A      |      ;
						CLC                                  ;0CA800|18      |      ;
						ADC.W r_entity_Counter,X             ;0CA801|7D3306  |0C0633;
						TAY                                  ;0CA804|A8      |      ;
						LDA.W DATA8_0CA824,Y                 ;0CA805|B924A8  |0CA824;
						STA.W r_entity_spriteGroup,X         ;0CA808|9D8C04  |0C048C;
						LDA.W DATA8_0CA825,Y                 ;0CA80B|B925A8  |0CA825;
						STA.B $00                            ;0CA80E|8500    |000000;
						LDA.W DATA8_0CA826,Y                 ;0CA810|B926A8  |0CA826;
						STA.B r_CHR_BankSpr_0800             ;0CA813|8548    |000048;
						TAY                                  ;0CA815|A8      |      ;
						INY                                  ;0CA816|C8      |      ;
						STY.B r_CHR_BankSpr_0c00             ;0CA817|8449    |000049;
						LDA.B #$02                           ;0CA819|A902    |      ;
						STA.W r_entity_spriteID,X            ;0CA81B|9D0004  |0C0400;
						LDA.B #$02                           ;0CA81E|A902    |      ;
						STA.W r_entity_PaletteOverride,X     ;0CA820|9D5404  |0C0454;
						RTS                                  ;0CA823|60      |      ;
	
	
			DATA8_0CA824:
						db $16                               ;0CA824|        |      ;
	
			DATA8_0CA825:
						db $0C                               ;0CA825|        |      ;
	
			DATA8_0CA826:
						db $00,$18,$0C,$04,$1A,$0C,$02,$1C   ;0CA826|        |      ;
						db $0C,$06                           ;0CA82E|        |      ;
	
			DATA8_0CA830:
						db $30,$30,$30,$30                   ;0CA830|        |      ;
	
			CODE_0CA834:
						LDA.W r_entity_XPos,X                ;0CA834|BD3804  |0C0438;
						CMP.B #$E8                           ;0CA837|C9E8    |      ;
						BCS CODE_0CA845                      ;0CA839|B00A    |0CA845;
						CMP.B #$18                           ;0CA83B|C918    |      ;
						BCC CODE_0CA841                      ;0CA83D|9002    |0CA841;
						CLC                                  ;0CA83F|18      |      ;
						RTS                                  ;0CA840|60      |      ;
	
	
			CODE_0CA841:
						LDY.B #$00                           ;0CA841|A000    |      ;
						SEC                                  ;0CA843|38      |      ;
						RTS                                  ;0CA844|60      |      ;
	
	
			CODE_0CA845:
						LDY.B #$01                           ;0CA845|A001    |      ;
						SEC                                  ;0CA847|38      |      ;
						RTS                                  ;0CA848|60      |      ;
	
	
			CODE_0CA849:
						LDA.W r_entity_XPos                  ;0CA849|AD3804  |0C0438;
						SEC                                  ;0CA84C|38      |      ;
						SBC.W r_entity_XPos,X                ;0CA84D|FD3804  |0C0438;
						BCS CODE_0CA855                      ;0CA850|B003    |0CA855;
						EOR.B #$FF                           ;0CA852|49FF    |      ;
						CLC                                  ;0CA854|18      |      ;
	
			CODE_0CA855:
						RTS                                  ;0CA855|60      |      ;
	
	
			CODE_0CA856:
						JSR.W CODE_0CA849                    ;0CA856|2049A8  |0CA849;
						PHA                                  ;0CA859|48      |      ;
						BCS CODE_0CA860                      ;0CA85A|B004    |0CA860;
						LDA.B #$01                           ;0CA85C|A901    |      ;
						BNE CODE_0CA862                      ;0CA85E|D002    |0CA862;
	
			CODE_0CA860:
						LDA.B #$00                           ;0CA860|A900    |      ;
	
			CODE_0CA862:
						STA.W r_entity_FacingLeft,X          ;0CA862|9DA804  |0C04A8;
						PLA                                  ;0CA865|68      |      ;
						RTS                                  ;0CA866|60      |      ;
	
	
			CODE_0CA867:
						LDA.W r_entity_Xspd,X                ;0CA867|BDF204  |0C04F2;
						BPL CODE_0CA870                      ;0CA86A|1004    |0CA870;
						LDA.B #$F8                           ;0CA86C|A9F8    |      ;
						BNE CODE_0CA872                      ;0CA86E|D002    |0CA872;
	
			CODE_0CA870:
						LDA.B #$08                           ;0CA870|A908    |      ;
	
			CODE_0CA872:
						STA.B $07                            ;0CA872|8507    |000007;
						LDY.B #$F8                           ;0CA874|A0F8    |      ;
						db $20                               ;0CA876|        |      ;
						dw getCollusionBasedOnOffset         ;0CA877|        |0FFC1E;
						BNE CODE_0CA89A                      ;0CA879|D01F    |0CA89A;
						LDA.B $07                            ;0CA87B|A507    |000007;
						LDY.B #$00                           ;0CA87D|A000    |      ;
						db $20                               ;0CA87F|        |      ;
						dw getCollusionBasedOnOffset         ;0CA880|        |0FFC1E;
						BNE CODE_0CA89A                      ;0CA882|D016    |0CA89A;
						CLC                                  ;0CA884|18      |      ;
						RTS                                  ;0CA885|60      |      ;
	
	
			CODE_0CA886:
						LDA.B #$05                           ;0CA886|A905    |      ;
						LDY.B #$10                           ;0CA888|A010    |      ;
						db $20                               ;0CA88A|        |      ;
						dw getCollusionBasedOnOffset         ;0CA88B|        |0FFC1E;
						BNE CODE_0CA89A                      ;0CA88D|D00B    |0CA89A;
						LDA.B #$FB                           ;0CA88F|A9FB    |      ;
						LDY.B #$10                           ;0CA891|A010    |      ;
						db $20                               ;0CA893|        |      ;
						dw getCollusionBasedOnOffset         ;0CA894|        |0FFC1E;
						BNE CODE_0CA89A                      ;0CA896|D002    |0CA89A;
						CLC                                  ;0CA898|18      |      ;
						RTS                                  ;0CA899|60      |      ;
	
	
			CODE_0CA89A:
						SEC                                  ;0CA89A|38      |      ;
						RTS                                  ;0CA89B|60      |      ;
	
	
			CODE_0CA89C:
						STA.W r_entity_Xspd,X                ;0CA89C|9DF204  |0C04F2;
						TYA                                  ;0CA89F|98      |      ;
						STA.W r_entity_XsubSpd,X             ;0CA8A0|9D0905  |0C0509;
						RTS                                  ;0CA8A3|60      |      ;
	
	
			CODE_0CA8A4:
						STA.W r_entity_Yspd,X                ;0CA8A4|9D2005  |0C0520;
						TYA                                  ;0CA8A7|98      |      ;
						STA.W r_entity_YsubSpd,X             ;0CA8A8|9D3705  |0C0537;
						RTS                                  ;0CA8AB|60      |      ;
	
	
			CODE_0CA8AC:
						LDA.B #$30                           ;0CA8AC|A930    |      ;
						BNE CODE_0CA8C2                      ;0CA8AE|D012    |0CA8C2;
	
			CODE_0CA8B0:
						LDA.B #$50                           ;0CA8B0|A950    |      ;
						BNE CODE_0CA8C2                      ;0CA8B2|D00E    |0CA8C2;
	
			CODE_0CA8B4:
						LDA.B #$10                           ;0CA8B4|A910    |      ;
						BNE CODE_0CA8C2                      ;0CA8B6|D00A    |0CA8C2;
	
			CODE_0CA8B8:
						LDA.B #$60                           ;0CA8B8|A960    |      ;
						BNE CODE_0CA8C2                      ;0CA8BA|D006    |0CA8C2;
	
			CODE_0CA8BC:
						LDA.B #$40                           ;0CA8BC|A940    |      ;
						BNE CODE_0CA8C2                      ;0CA8BE|D002    |0CA8C2;
	
			CODE_0CA8C0:
						LDA.B #$20                           ;0CA8C0|A920    |      ;
	
			CODE_0CA8C2:
						STA.W r_entity_mask,X                ;0CA8C2|9D7004  |0C0470;
						RTS                                  ;0CA8C5|60      |      ;
	
	
			CODE_0CA8C6:
						LDA.W r_Player_StateDoubled,X        ;0CA8C6|BD6505  |0C0565;
						CMP.B #$11                           ;0CA8C9|C911    |      ;
						BEQ CODE_0CA8D1                      ;0CA8CB|F004    |0CA8D1;
						CMP.B #$12                           ;0CA8CD|C912    |      ;
						BNE CODE_0CA8D9                      ;0CA8CF|D008    |0CA8D9;
	
			CODE_0CA8D1:
						LDA.W r_entity_Counter,X             ;0CA8D1|BD3306  |0C0633;
						CLC                                  ;0CA8D4|18      |      ;
						ADC.B #$04                           ;0CA8D5|6904    |      ;
						BNE CODE_0CA8DC                      ;0CA8D7|D003    |0CA8DC;
	
			CODE_0CA8D9:
						LDA.W r_entity_ID                    ;0CA8D9|AD4E05  |0C054E;
	
			CODE_0CA8DC:
						STA.W r_bossPieces       ;0CA8DC|8DEC07  |0C07EC;
						RTS                                  ;0CA8DF|60      |      ;
	
	
			CODE_0CA8E0:
						LDA.W r_entity_Counter,X             ;0CA8E0|BD3306  |0C0633;
						ASL A                                ;0CA8E3|0A      |      ;
						ASL A                                ;0CA8E4|0A      |      ;
						ASL A                                ;0CA8E5|0A      |      ;
						STA.B $00                            ;0CA8E6|8500    |000000;
						LDA.B r_frameCount                   ;0CA8E8|A51A    |00001A;
						AND.B #$07                           ;0CA8EA|2907    |      ;
						CLC                                  ;0CA8EC|18      |      ;
						ADC.B $00                            ;0CA8ED|6500    |000000;
						TAY                                  ;0CA8EF|A8      |      ;
						LDA.W DATA8_0CA8F7,Y                 ;0CA8F0|B9F7A8  |0CA8F7;
						STA.W r_entity_target,X              ;0CA8F3|9D0606  |0C0606;
						RTS                                  ;0CA8F6|60      |      ;
	
	
			DATA8_0CA8F7:
						db $09,$13,$03,$14,$0C,$1F,$11,$0F   ;0CA8F7|        |      ;
						db $09,$13,$03,$14,$0C,$1F,$11,$0F   ;0CA8FF|        |      ;
						db $09,$13,$03,$14,$0C,$1F,$11,$0F   ;0CA907|        |      ;
						db $09,$13,$03,$14,$0C,$1F,$11,$0F   ;0CA90F|        |      ;
	
			CODE_0CA917:
						LDA.B #$13                           ;0CA917|A913    |      ;
						STA.W r_Player_StateDoubled,X        ;0CA919|9D6505  |0C0565;
						LDA.W r_entity_Counter,X             ;0CA91C|BD3306  |0C0633;
						TAY                                  ;0CA91F|A8      |      ;
						LDX.B #$05                           ;0CA920|A205    |      ;
						LDA.W DATA8_0CA93B,Y                 ;0CA922|B93BA9  |0CA93B;
						STA.W r_misc_movementState,X         ;0CA925|9D4506  |0C0645;
						LDA.B #$0F                           ;0CA928|A90F    |      ;
						STA.W r_entity_ID,X                  ;0CA92A|9D4E05  |0C054E;
						LDA.B #$00                           ;0CA92D|A900    |      ;
						STA.W r_Player_StateDoubled,X        ;0CA92F|9D6505  |0C0565;
						STA.W r_entity_damage,X              ;0CA932|9D5706  |0C0657;
						JSR.W CODE_0CA8C0                    ;0CA935|20C0A8  |0CA8C0;
						LDX.B r_entityID_processed           ;0CA938|A66C    |00006C;
						RTS                                  ;0CA93A|60      |      ;
	
	
			DATA8_0CA93B:
						db $00,$01                           ;0CA93B|        |      ;
	
			CODE_0CA93D:
						LDX.B #$02                           ;0CA93D|A202    |      ;
	
			CODE_0CA93F:
						LDA.W r_entity_ID,X                  ;0CA93F|BD4E05  |0C054E;
						BNE CODE_0CA94D                      ;0CA942|D009    |0CA94D;
						INX                                  ;0CA944|E8      |      ;
						CPX.B #$05                           ;0CA945|E005    |      ;
						BCC CODE_0CA93F                      ;0CA947|90F6    |0CA93F;
						LDX.B r_entityID_processed           ;0CA949|A66C    |00006C;
						CLC                                  ;0CA94B|18      |      ;
						RTS                                  ;0CA94C|60      |      ;
	
	
			CODE_0CA94D:
						LDX.B r_entityID_processed           ;0CA94D|A66C    |00006C;
						SEC                                  ;0CA94F|38      |      ;
						RTS                                  ;0CA950|60      |      ;
	
	
			CODE_0CA951:
						JSR.W CODE_0CA849                    ;0CA951|2049A8  |0CA849;
						CMP.B #$30                           ;0CA954|C930    |      ;
						BCS CODE_0CA96D                      ;0CA956|B015    |0CA96D;
						LDA.W r_entity_Counter,X             ;0CA958|BD3306  |0C0633;
						CMP.B #$02                           ;0CA95B|C902    |      ;
						BCS CODE_0CA96D                      ;0CA95D|B00E    |0CA96D;
						JSR.W CODE_0CA93D                    ;0CA95F|203DA9  |0CA93D;
						BCS CODE_0CA96B                      ;0CA962|B007    |0CA96B;
						JSR.W CODE_0CA917                    ;0CA964|2017A9  |0CA917;
						LDY.B #$00                           ;0CA967|A000    |      ;
						SEC                                  ;0CA969|38      |      ;
						RTS                                  ;0CA96A|60      |      ;
	
	
			CODE_0CA96B:
						CLC                                  ;0CA96B|18      |      ;
						RTS                                  ;0CA96C|60      |      ;
	
	
			CODE_0CA96D:
						JSR.W CODE_0CA4B2                    ;0CA96D|20B2A4  |0CA4B2;
						BCC CODE_0CA96B                      ;0CA970|90F9    |0CA96B;
						LDY.B #$01                           ;0CA972|A001    |      ;
						SEC                                  ;0CA974|38      |      ;
						RTS                                  ;0CA975|60      |      ;
	
	
			CODE_0CA976:
						LDA.W r_entity_Counter,X             ;0CA976|BD3306  |0C0633;
						STA.W r_entity_ID,X                  ;0CA979|9D4E05  |0C054E;
						LDA.W r_Player_StateDoubled,X        ;0CA97C|BD6505  |0C0565;
						PHA                                  ;0CA97F|48      |      ;
						LDA.B #$18                           ;0CA980|A918    |      ;
						STA.W r_Player_StateDoubled,X        ;0CA982|9D6505  |0C0565;
						LDX.B #$05                           ;0CA985|A205    |      ;
						LDA.W r_entity_Counter,X             ;0CA987|BD3306  |0C0633;
						STA.W r_entity_ID,X                  ;0CA98A|9D4E05  |0C054E;
						LDA.B #$07                           ;0CA98D|A907    |      ;
						JSR.W loadBank0e_jump                ;0CA98F|204CA4  |0CA44C;
						BCS CODE_0CA998                      ;0CA992|B004    |0CA998;
						LDA.B #$00                           ;0CA994|A900    |      ;
						BEQ CODE_0CA99A                      ;0CA996|F002    |0CA99A;
	
			CODE_0CA998:
						LDA.B #$01                           ;0CA998|A901    |      ;
	
			CODE_0CA99A:
						STA.B $01                            ;0CA99A|8501    |000001;
						LDA.W r_entity_ID,X                  ;0CA99C|BD4E05  |0C054E;
						STA.W r_entity_Counter,X             ;0CA99F|9D3306  |0C0633;
						LDA.B #$0F                           ;0CA9A2|A90F    |      ;
						STA.W r_entity_ID,X                  ;0CA9A4|9D4E05  |0C054E;
						LDA.W r_damagActionFlag,X            ;0CA9A7|BD1D06  |0C061D;
						BEQ CODE_0CA9C6                      ;0CA9AA|F01A    |0CA9C6;
						LDY.W r_entity_Counter,X             ;0CA9AC|BC3306  |0C0633;
						LDA.W DATA8_0CA9D4,Y                 ;0CA9AF|B9D4A9  |0CA9D4;
						STA.W r_entity_damage,X              ;0CA9B2|9D5706  |0C0657;
						LDA.B #$40                           ;0CA9B5|A940    |      ;
						STA.B r_bossSpecialHitbox            ;0CA9B7|85BA    |0000BA;
						LDY.W r_entity_Counter,X             ;0CA9B9|BC3306  |0C0633;
						LDA.W DATA8_0CA9D8,Y                 ;0CA9BC|B9D8A9  |0CA9D8;
						STA.B r_bossDopplegangerHitbox       ;0CA9BF|85BC    |0000BC;
						LDA.W DATA8_0CA9DC,Y                 ;0CA9C1|B9DCA9  |0CA9DC;
						STA.B r_bossMeleeHitbox              ;0CA9C4|85BB    |0000BB;
	
			CODE_0CA9C6:
						LDX.B r_entityID_processed           ;0CA9C6|A66C    |00006C;
						PLA                                  ;0CA9C8|68      |      ;
						STA.W r_Player_StateDoubled,X        ;0CA9C9|9D6505  |0C0565;
						LDA.B #$0B                           ;0CA9CC|A90B    |      ;
						STA.W r_entity_ID,X                  ;0CA9CE|9D4E05  |0C054E;
						LSR.B $01                            ;0CA9D1|4601    |000001;
						RTS                                  ;0CA9D3|60      |      ;
	
	
			DATA8_0CA9D4:
						db $20,$30,$30,$20                   ;0CA9D4|        |      ;
	
			DATA8_0CA9D8:
						db $00,$01,$02,$00                   ;0CA9D8|        |      ;
	
			DATA8_0CA9DC:
						db $01,$02,$03,$04                   ;0CA9DC|        |      ;
	
			CODE_0CA9E0:
						CLC                                  ;0CA9E0|18      |      ;
						RTS                                  ;0CA9E1|60      |      ;
	
	
	bossDoubleState__0b:
						JSR.W CODE_0CA8C6                    ;0CA9E2|20C6A8  |0CA8C6;
						JSR.W CODE_0CA856                    ;0CA9E5|2056A8  |0CA856;
						JSR.W CODE_0CA8E0                    ;0CA9E8|20E0A8  |0CA8E0;
						LDA.B #$0C                           ;0CA9EB|A90C    |      ;
						STA.W r_Player_StateDoubled,X        ;0CA9ED|9D6505  |0C0565;
						RTS                                  ;0CA9F0|60      |      ;
	
	
	bossDoubleState__0c:
						JSR.W CODE_0CA8C6                    ;0CA9F1|20C6A8  |0CA8C6;
						JSR.W CODE_0CA856                    ;0CA9F4|2056A8  |0CA856;
						JSR.W CODE_0CA8C0                    ;0CA9F7|20C0A8  |0CA8C0;
						JSR.W CODE_0CA886                    ;0CA9FA|2086A8  |0CA886;
						BCS CODE_0CAA0D                      ;0CA9FD|B00E    |0CAA0D;
						JSR.W CODE_0CA8B8                    ;0CA9FF|20B8A8  |0CA8B8;
						LDA.B #$02                           ;0CAA02|A902    |      ;
						JSR.W loadBank0e_jump                ;0CAA04|204CA4  |0CA44C;
						LDA.B #$0F                           ;0CAA07|A90F    |      ;
						STA.W r_Player_StateDoubled,X        ;0CAA09|9D6505  |0C0565;
						RTS                                  ;0CAA0C|60      |      ;
	
	
			CODE_0CAA0D:
						LDA.B #$02                           ;0CAA0D|A902    |      ;
						STA.W r_entity_spriteID,X            ;0CAA0F|9D0004  |0C0400;
						LDA.W r_entity_target,X              ;0CAA12|BD0606  |0C0606;
						BEQ CODE_0CAA1C                      ;0CAA15|F005    |0CAA1C;
						DEC.W r_entity_target,X              ;0CAA17|DE0606  |0C0606;
						BNE CODE_0CAA60                      ;0CAA1A|D044    |0CAA60;
	
			CODE_0CAA1C:
						JSR.W CODE_0CA8E0                    ;0CAA1C|20E0A8  |0CA8E0;
						JSR.W CODE_0CA9E0                    ;0CAA1F|20E0A9  |0CA9E0;
						BCS CODE_0CAA2F                      ;0CAA22|B00B    |0CAA2F;
						LDA.W $07EF                          ;0CAA24|ADEF07  |0C07EF;
						BNE CODE_0CAA61                      ;0CAA27|D038    |0CAA61;
						LDA.B r_frameCount                   ;0CAA29|A51A    |00001A;
						AND.B #$01                           ;0CAA2B|2901    |      ;
						BNE CODE_0CAA61                      ;0CAA2D|D032    |0CAA61;
	
			CODE_0CAA2F:
						LDY.W r_entity_Counter,X             ;0CAA2F|BC3306  |0C0633;
						LDA.B #$00                           ;0CAA32|A900    |      ;
						db $20                               ;0CAA34|        |      ;
						dw setAnimGroup_A             ;0CAA35|        |0FEF60;
						JSR.W CODE_0CA8BC                    ;0CAA37|20BCA8  |0CA8BC;
						JSR.W CODE_0CA834                    ;0CAA3A|2034A8  |0CA834;
						BCC CODE_0CAA4B                      ;0CAA3D|900C    |0CAA4B;
						STY.B $00                            ;0CAA3F|8400    |000000;
						EOR.W r_entity_FacingLeft,X          ;0CAA41|5DA804  |0C04A8;
						BEQ CODE_0CAA4B                      ;0CAA44|F005    |0CAA4B;
						LDA.B $00                            ;0CAA46|A500    |000000;
						STA.W r_entity_FacingLeft,X          ;0CAA48|9DA804  |0C04A8;
	
			CODE_0CAA4B:
						LDA.W r_entity_FacingLeft,X          ;0CAA4B|BDA804  |0C04A8;
						BEQ CODE_0CAA54                      ;0CAA4E|F004    |0CAA54;
						LDA.B #$FF                           ;0CAA50|A9FF    |      ;
						BNE CODE_0CAA56                      ;0CAA52|D002    |0CAA56;
	
			CODE_0CAA54:
						LDA.B #$01                           ;0CAA54|A901    |      ;
	
			CODE_0CAA56:
						LDY.B #$00                           ;0CAA56|A000    |      ;
						JSR.W CODE_0CA89C                    ;0CAA58|209CA8  |0CA89C;
						LDA.B #$0D                           ;0CAA5B|A90D    |      ;
						STA.W r_Player_StateDoubled,X        ;0CAA5D|9D6505  |0C0565;
	
			CODE_0CAA60:
						RTS                                  ;0CAA60|60      |      ;
	
	
			CODE_0CAA61:
						LDA.B #$00                           ;0CAA61|A900    |      ;
						STA.W $07EF                          ;0CAA63|8DEF07  |0C07EF;
						JSR.W CODE_0CA951                    ;0CAA66|2051A9  |0CA951;
						BCC CODE_0CAA2F                      ;0CAA69|90C4    |0CAA2F;
						DEY                                  ;0CAA6B|88      |      ;
						BEQ CODE_0CAA6F                      ;0CAA6C|F001    |0CAA6F;
						RTS                                  ;0CAA6E|60      |      ;
	
	
			CODE_0CAA6F:
						LDA.B #$10                           ;0CAA6F|A910    |      ;
						STA.W r_Player_StateDoubled,X        ;0CAA71|9D6505  |0C0565;
						JSR.W CODE_0CA8C0                    ;0CAA74|20C0A8  |0CA8C0;
						RTS                                  ;0CAA77|60      |      ;
	
	
	bossDoubleState__0d:
						JSR.W CODE_0CA8C6                    ;0CAA78|20C6A8  |0CA8C6;
						JSR.W CODE_0CA886                    ;0CAA7B|2086A8  |0CA886;
						BCS CODE_0CAAAD                      ;0CAA7E|B02D    |0CAAAD;
						LDA.W r_entity_YPos                  ;0CAA80|AD1C04  |0C041C;
						CMP.W r_entity_YPos,X                ;0CAA83|DD1C04  |0C041C;
						BCS CODE_0CAA8B                      ;0CAA86|B003    |0CAA8B;
						JMP.W CODE_0CAAE7                    ;0CAA88|4CE7AA  |0CAAE7;
	
	
			CODE_0CAA8B:
						LDA.B #$02                           ;0CAA8B|A902    |      ;
						JSR.W loadBank0e_jump                ;0CAA8D|204CA4  |0CA44C;
						LDA.B #$0F                           ;0CAA90|A90F    |      ;
						STA.W r_Player_StateDoubled,X        ;0CAA92|9D6505  |0C0565;
						RTS                                  ;0CAA95|60      |      ;
	
	
			CODE_0CAA96:
						DEY                                  ;0CAA96|88      |      ;
						BEQ CODE_0CAA9D                      ;0CAA97|F004    |0CAA9D;
						LDA.B #$18                           ;0CAA99|A918    |      ;
						BNE CODE_0CAA9F                      ;0CAA9B|D002    |0CAA9F;
	
			CODE_0CAA9D:
						LDA.B #$E8                           ;0CAA9D|A9E8    |      ;
	
			CODE_0CAA9F:
						STA.W r_entity_XPos,X                ;0CAA9F|9D3804  |0C0438;
						LDA.B #$10                           ;0CAAA2|A910    |      ;
						STA.W r_entity_target,X              ;0CAAA4|9D0606  |0C0606;
						LDA.B #$0C                           ;0CAAA7|A90C    |      ;
						STA.W r_Player_StateDoubled,X        ;0CAAA9|9D6505  |0C0565;
						RTS                                  ;0CAAAC|60      |      ;
	
	
			CODE_0CAAAD:
						JSR.W CODE_0CA834                    ;0CAAAD|2034A8  |0CA834;
						BCS CODE_0CAA96                      ;0CAAB0|B0E4    |0CAA96;
						JSR.W CODE_0CA867                    ;0CAAB2|2067A8  |0CA867;
						BCS CODE_0CAAE7                      ;0CAAB5|B030    |0CAAE7;
						DEC.W r_entity_target,X              ;0CAAB7|DE0606  |0C0606;
						BNE CODE_0CAAE6                      ;0CAABA|D02A    |0CAAE6;
						JSR.W CODE_0CA9E0                    ;0CAABC|20E0A9  |0CA9E0;
						BCS CODE_0CAAE1                      ;0CAABF|B020    |0CAAE1;
						LDA.B r_frameCount                   ;0CAAC1|A51A    |00001A;
						AND.B #$07                           ;0CAAC3|2907    |      ;
						TAY                                  ;0CAAC5|A8      |      ;
						LDA.W DATA16_0CAAFC,Y                ;0CAAC6|B9FCAA  |0CAAFC;
						STA.W r_Player_StateDoubled,X        ;0CAAC9|9D6505  |0C0565;
						CMP.B #$10                           ;0CAACC|C910    |      ;
						BEQ CODE_0CAAF1                      ;0CAACE|F021    |0CAAF1;
						CMP.B #$0C                           ;0CAAD0|C90C    |      ;
						BEQ CODE_0CAAE6                      ;0CAAD2|F012    |0CAAE6;
						JSR.W CODE_0CA856                    ;0CAAD4|2056A8  |0CA856;
						CMP.B #$40                           ;0CAAD7|C940    |      ;
						BCS CODE_0CAAE7                      ;0CAAD9|B00C    |0CAAE7;
						LDA.B #$00                           ;0CAADB|A900    |      ;
						STA.W r_orb_statesGlobal             ;0CAADD|8DED07  |0C07ED;
						RTS                                  ;0CAAE0|60      |      ;
	
	
			CODE_0CAAE1:
						LDA.B #$0E                           ;0CAAE1|A90E    |      ;
						STA.W r_Player_StateDoubled,X        ;0CAAE3|9D6505  |0C0565;
	
			CODE_0CAAE6:
						RTS                                  ;0CAAE6|60      |      ;
	
	
			CODE_0CAAE7:
						LDA.W r_entity_FacingLeft,X          ;0CAAE7|BDA804  |0C04A8;
						TAY                                  ;0CAAEA|A8      |      ;
						INY                                  ;0CAAEB|C8      |      ;
						STY.W r_orb_statesGlobal             ;0CAAEC|8CED07  |0C07ED;
						BNE CODE_0CAAE1                      ;0CAAEF|D0F0    |0CAAE1;
	
			CODE_0CAAF1:
						JSR.W CODE_0CA951                    ;0CAAF1|2051A9  |0CA951;
						BCC CODE_0CAAE7                      ;0CAAF4|90F1    |0CAAE7;
						DEY                                  ;0CAAF6|88      |      ;
						BNE CODE_0CAAE6                      ;0CAAF7|D0ED    |0CAAE6;
						JMP.W CODE_0CA8C0                    ;0CAAF9|4CC0A8  |0CA8C0;
	
	
			DATA16_0CAAFC:
						dw $100C,$100E,$100C,$0C0E           ;0CAAFC|        |      ;
	
	bossDoubleState__0e:
						JSR.W CODE_0CA8C6                    ;0CAB04|20C6A8  |0CA8C6;
						JSR.W CODE_0CA8B8                    ;0CAB07|20B8A8  |0CA8B8;
						LDY.W r_orb_statesGlobal             ;0CAB0A|ACED07  |0C07ED;
						LDA.W DATA8_0CAB1B,Y                 ;0CAB0D|B91BAB  |0CAB1B;
						STA.B r_index                        ;0CAB10|8510    |000010;
						LDA.B #$00                           ;0CAB12|A900    |      ;
						JSR.W loadBank0e_jump                ;0CAB14|204CA4  |0CA44C;
						INC.W r_Player_StateDoubled,X        ;0CAB17|FE6505  |0C0565;
						RTS                                  ;0CAB1A|60      |      ;
	
	
			DATA8_0CAB1B:
						db $00,$01,$02,$04,$08,$40,$80       ;0CAB1B|        |      ;
	
	bossDoubleState__0f:
						JSR.W CODE_0CA8C6                    ;0CAB22|20C6A8  |0CA8C6;
						JSR.W CODE_0CA834                    ;0CAB25|2034A8  |0CA834;
						BCC CODE_0CAB36                      ;0CAB28|900C    |0CAB36;
						DEY                                  ;0CAB2A|88      |      ;
						BEQ CODE_0CAB31                      ;0CAB2B|F004    |0CAB31;
						LDA.B #$18                           ;0CAB2D|A918    |      ;
						BNE CODE_0CAB33                      ;0CAB2F|D002    |0CAB33;
	
			CODE_0CAB31:
						LDA.B #$E8                           ;0CAB31|A9E8    |      ;
	
			CODE_0CAB33:
						STA.W r_entity_XPos,X                ;0CAB33|9D3804  |0C0438;
	
			CODE_0CAB36:
						LDA.B #$01                           ;0CAB36|A901    |      ;
						JSR.W loadBank0e_jump                ;0CAB38|204CA4  |0CA44C;
						LDA.W r_entity_AI_IDX,X              ;0CAB3B|BDC105  |0C05C1;
						BEQ CODE_0CAB57                      ;0CAB3E|F017    |0CAB57;
						LDA.W r_entity_YPos,X                ;0CAB40|BD1C04  |0C041C;
						CMP.B #$B4                           ;0CAB43|C9B4    |      ;
						BCC CODE_0CAB4E                      ;0CAB45|9007    |0CAB4E;
						LDA.B #$B4                           ;0CAB47|A9B4    |      ;
						STA.W r_entity_YPos,X                ;0CAB49|9D1C04  |0C041C;
						BNE CODE_0CAB58                      ;0CAB4C|D00A    |0CAB58;
	
			CODE_0CAB4E:
						LDA.B #$00                           ;0CAB4E|A900    |      ;
						LDY.B #$10                           ;0CAB50|A010    |      ;
						db $20                               ;0CAB52|        |      ;
						dw getCollusionBasedOnOffset         ;0CAB53|        |0FFC1E;
						BNE CODE_0CAB58                      ;0CAB55|D001    |0CAB58;
	
			CODE_0CAB57:
						RTS                                  ;0CAB57|60      |      ;
	
	
			CODE_0CAB58:
						LDA.B #$00                           ;0CAB58|A900    |      ;
						TAY                                  ;0CAB5A|A8      |      ;
						JSR.W CODE_0CA8A4                    ;0CAB5B|20A4A8  |0CA8A4;
						JSR.W CODE_0CA89C                    ;0CAB5E|209CA8  |0CA89C;
						LDA.W r_entity_YPos,X                ;0CAB61|BD1C04  |0C041C;
						AND.B #$F0                           ;0CAB64|29F0    |      ;
						STA.W r_entity_YPos,X                ;0CAB66|9D1C04  |0C041C;
						LDA.W r_entity_Counter,X             ;0CAB69|BD3306  |0C0633;
						CMP.B #$02                           ;0CAB6C|C902    |      ;
						BNE CODE_0CAB79                      ;0CAB6E|D009    |0CAB79;
						LDA.W r_entity_YPos,X                ;0CAB70|BD1C04  |0C041C;
						CLC                                  ;0CAB73|18      |      ;
						ADC.B #$04                           ;0CAB74|6904    |      ;
						STA.W r_entity_YPos,X                ;0CAB76|9D1C04  |0C041C;
	
			CODE_0CAB79:
						LDA.B #$0B                           ;0CAB79|A90B    |      ;
						STA.W r_Player_StateDoubled,X        ;0CAB7B|9D6505  |0C0565;
						RTS                                  ;0CAB7E|60      |      ;
	
	
	bossDoubleState__10:
						JSR.W CODE_0CA8C6                    ;0CAB7F|20C6A8  |0CA8C6;
						JSR.W CODE_0CA574                   ;0CAB82|2074A5  |0CA574;
						BCS CODE_0CAB88                      ;0CAB85|B001    |0CAB88;
						RTS                                  ;0CAB87|60      |      ;
	
	
			CODE_0CAB88:
						LDA.B #$0C                           ;0CAB88|A90C    |      ;
						STA.W r_Player_StateDoubled,X        ;0CAB8A|9D6505  |0C0565;
						LDA.B #$02                           ;0CAB8D|A902    |      ;
						STA.W r_entity_spriteID,X            ;0CAB8F|9D0004  |0C0400;
						RTS                                  ;0CAB92|60      |      ;
	
	
	bossDoubleState_rts_12:
						RTS                                  ;0CAB93|60      |      ;
	
	
	bossDoubleState__13:
						JSR.W CODE_0CA8C0                    ;0CAB94|20C0A8  |0CA8C0;
						JSR.W CODE_0CA976                    ;0CAB97|2076A9  |0CA976;
						BCS CODE_0CAB9D                      ;0CAB9A|B001    |0CAB9D;
						RTS                                  ;0CAB9C|60      |      ;
	
	
			CODE_0CAB9D:
						LDA.B #$0B                           ;0CAB9D|A90B    |      ;
						STA.W r_Player_StateDoubled,X        ;0CAB9F|9D6505  |0C0565;
						LDA.B #$02                           ;0CABA2|A902    |      ;
						STA.W r_entity_spriteID,X            ;0CABA4|9D0004  |0C0400;
						RTS                                  ;0CABA7|60      |      ;
		
																;	RLE_tilemap_map00_06: DELETEME!						
																;	RLE_tilemap_0f_castleIntro: DELETEME!
	
		generalBank0C__00:
						LDA.B #$00                           ;0CAFDA|A900    |      ;
						STA.W r_entity_damageRelated,X       ;0CAFDC|9D6906  |0C0669;
						LDA.W r_entity_target,X              ;0CAFDF|BD0606  |0C0606;
						TAY                                  ;0CAFE2|A8      |      ;
						BNE CODE_0CB02C                      ;0CAFE3|D047    |0CB02C;
						LDA.B #$01                           ;0CAFE5|A901    |      ;
						STA.W r_entity_damage,X              ;0CAFE7|9D5706  |0C0657;
						LDA.B #$00                           ;0CAFEA|A900    |      ;
						STA.W r_misc_movementState,X         ;0CAFEC|9D4506  |0C0645;
						LDY.W r_entity_Counter,X             ;0CAFEF|BC3306  |0C0633;
						LDA.W DATA8_0CB2C1,Y                 ;0CAFF2|B9C1B2  |0CB2C1;
						STA.W r_entity_XPos,X                ;0CAFF5|9D3804  |0C0438;
						BMI CODE_0CAFFD                      ;0CAFF8|3003    |0CAFFD;
						INC.W r_misc_movementState,X         ;0CAFFA|FE4506  |0C0645;
	
			CODE_0CAFFD:
						LDY.B #$00                           ;0CAFFD|A000    |      ;
						JSR.W CODE_0CB211                    ;0CAFFF|2011B2  |0CB211;
						LDY.B #$00                           ;0CB002|A000    |      ;
						JSR.W CODE_0CB263                    ;0CB004|2063B2  |0CB263;
						LDA.B #$C8                           ;0CB007|A9C8    |      ;
						STA.W r_entity_YPos,X                ;0CB009|9D1C04  |0C041C;
						LDA.B #$20                           ;0CB00C|A920    |      ;
						STA.W r_entity_YsubSpd,X             ;0CB00E|9D3705  |0C0537;
						LDA.B #$FF                           ;0CB011|A9FF    |      ;
						STA.W r_entity_Yspd,X                ;0CB013|9D2005  |0C0520;
						LDA.B #$00                           ;0CB016|A900    |      ;
						STA.W r_entity_Xspd,X                ;0CB018|9DF204  |0C04F2;
						STA.W r_entity_XsubSpd,X             ;0CB01B|9D0905  |0C0509;
						INC.W r_entity_target,X              ;0CB01E|FE0606  |0C0606;
						LDA.B #$6E                           ;0CB021|A96E    |      ;
						STA.W r_entity_spriteID,X            ;0CB023|9D0004  |0C0400;
						LDA.B #$0E                           ;0CB026|A90E    |      ;
						STA.W r_entity_spriteGroup,X         ;0CB028|9D8C04  |0C048C;
						RTS                                  ;0CB02B|60      |      ;
	
	
			CODE_0CB02C:
						DEY                                  ;0CB02C|88      |      ;
						BNE CODE_0CB059                      ;0CB02D|D02A    |0CB059;
						LDA.B #$B0                           ;0CB02F|A9B0    |      ;
						CMP.W r_entity_YPos,X                ;0CB031|DD1C04  |0C041C;
						BCC CODE_0CB058                      ;0CB034|9022    |0CB058;
						LDA.B #$E0                           ;0CB036|A9E0    |      ;
						STA.W r_entity_XsubSpd,X             ;0CB038|9D0905  |0C0509;
						LDA.B #$00                           ;0CB03B|A900    |      ;
						STA.W r_entity_Xspd,X                ;0CB03D|9DF204  |0C04F2;
						LDA.W r_misc_movementState,X         ;0CB040|BD4506  |0C0645;
						BNE CODE_0CB04F                      ;0CB043|D00A    |0CB04F;
						LDA.B #$20                           ;0CB045|A920    |      ;
						STA.W r_entity_XsubSpd,X             ;0CB047|9D0905  |0C0509;
						LDA.B #$FF                           ;0CB04A|A9FF    |      ;
						STA.W r_entity_Xspd,X                ;0CB04C|9DF204  |0C04F2;
	
			CODE_0CB04F:
						INC.W r_entity_target,X              ;0CB04F|FE0606  |0C0606;
						LDA.W r_misc_movementState,X         ;0CB052|BD4506  |0C0645;
						STA.W r_damagActionFlag,X            ;0CB055|9D1D06  |0C061D;
	
			CODE_0CB058:
						RTS                                  ;0CB058|60      |      ;
	
	
			CODE_0CB059:
						DEY                                  ;0CB059|88      |      ;
						BNE CODE_0CB073                      ;0CB05A|D017    |0CB073;
						JSR.W CODE_0CB114                    ;0CB05C|2014B1  |0CB114;
						LDA.B r_collisionPointYinScreen      ;0CB05F|A511    |000011;
						EOR.B #$FF                           ;0CB061|49FF    |      ;
						CLC                                  ;0CB063|18      |      ;
						ADC.B #$01                           ;0CB064|6901    |      ;
						STA.B r_collisionPointYinScreen      ;0CB066|8511    |000011;
						LDA.B r_index                        ;0CB068|A510    |000010;
						EOR.B #$FF                           ;0CB06A|49FF    |      ;
						ADC.B #$00                           ;0CB06C|6900    |      ;
						STA.B r_index                        ;0CB06E|8510    |000010;
						JMP.W CODE_0CB126                    ;0CB070|4C26B1  |0CB126;
	
	
			CODE_0CB073:
						DEY                                  ;0CB073|88      |      ;
						BNE CODE_0CB081                      ;0CB074|D00B    |0CB081;
						LDA.W r_misc_movementState,X         ;0CB076|BD4506  |0C0645;
						BEQ CODE_0CB07E                      ;0CB079|F003    |0CB07E;
						JMP.W CODE_0CB17D                    ;0CB07B|4C7DB1  |0CB17D;
	
	
			CODE_0CB07E:
						JMP.W move2Possition                 ;0CB07E|4C51B1  |0CB151;
	
	
			CODE_0CB081:
						DEY                                  ;0CB081|88      |      ;
						BNE CODE_0CB08A                      ;0CB082|D006    |0CB08A;
						JSR.W CODE_0CB114                    ;0CB084|2014B1  |0CB114;
						JMP.W CODE_0CB126                    ;0CB087|4C26B1  |0CB126;
	
	
			CODE_0CB08A:
						DEY                                  ;0CB08A|88      |      ;
						BNE CODE_0CB098                      ;0CB08B|D00B    |0CB098;
						LDA.W r_misc_movementState,X         ;0CB08D|BD4506  |0C0645;
						BNE CODE_0CB095                      ;0CB090|D003    |0CB095;
						JMP.W CODE_0CB17D                    ;0CB092|4C7DB1  |0CB17D;
	
	
			CODE_0CB095:
						JMP.W move2Possition                 ;0CB095|4C51B1  |0CB151;
	
	
			CODE_0CB098:
						DEY                                  ;0CB098|88      |      ;
						BNE CODE_0CB0C2                      ;0CB099|D027    |0CB0C2;
						LDA.B #$00                           ;0CB09B|A900    |      ;
						STA.W r_entity_Yspd,X                ;0CB09D|9D2005  |0C0520;
						STA.W r_entity_YsubSpd,X             ;0CB0A0|9D3705  |0C0537;
						LDY.W r_entity_Counter,X             ;0CB0A3|BC3306  |0C0633;
						LDA.W DATA8_0CB2C1,Y                 ;0CB0A6|B9C1B2  |0CB2C1;
						SEC                                  ;0CB0A9|38      |      ;
						SBC.W r_entity_XPos,X                ;0CB0AA|FD3804  |0C0438;
						BCS CODE_0CB0B4                      ;0CB0AD|B005    |0CB0B4;
						EOR.B #$FF                           ;0CB0AF|49FF    |      ;
						CLC                                  ;0CB0B1|18      |      ;
						ADC.B #$01                           ;0CB0B2|6901    |      ;
	
			CODE_0CB0B4:
						CMP.B #$02                           ;0CB0B4|C902    |      ;
						BCS CODE_0CB0C1                      ;0CB0B6|B009    |0CB0C1;
						LDA.W DATA8_0CB2C1,Y                 ;0CB0B8|B9C1B2  |0CB2C1;
						STA.W r_entity_XPos,X                ;0CB0BB|9D3804  |0C0438;
						INC.W r_entity_target,X              ;0CB0BE|FE0606  |0C0606;
	
			CODE_0CB0C1:
						RTS                                  ;0CB0C1|60      |      ;
	
	
			CODE_0CB0C2:
						DEY                                  ;0CB0C2|88      |      ;
						BNE CODE_0CB0D9                      ;0CB0C3|D014    |0CB0D9;
						LDA.B #$E0                           ;0CB0C5|A9E0    |      ;
						STA.W r_entity_YsubSpd,X             ;0CB0C7|9D3705  |0C0537;
						LDA.B #$00                           ;0CB0CA|A900    |      ;
						STA.W r_entity_Yspd,X                ;0CB0CC|9D2005  |0C0520;
						STA.W r_entity_Xspd,X                ;0CB0CF|9DF204  |0C04F2;
						STA.W r_entity_XsubSpd,X             ;0CB0D2|9D0905  |0C0509;
						INC.W r_entity_target,X              ;0CB0D5|FE0606  |0C0606;
						RTS                                  ;0CB0D8|60      |      ;
	
	
			CODE_0CB0D9:
						LDA.W r_entity_YPos,X                ;0CB0D9|BD1C04  |0C041C;
						CMP.B #$C8                           ;0CB0DC|C9C8    |      ;
						BCC CODE_0CB0F2                      ;0CB0DE|9012    |0CB0F2;
						LDA.B #$C8                           ;0CB0E0|A9C8    |      ;
						STA.W r_entity_YPos,X                ;0CB0E2|9D1C04  |0C041C;
						LDY.B #$02                           ;0CB0E5|A002    |      ;
						JSR.W CODE_0CB211                    ;0CB0E7|2011B2  |0CB211;
						LDY.B #$02                           ;0CB0EA|A002    |      ;
						JSR.W CODE_0CB263                    ;0CB0EC|2063B2  |0CB263;
						JMP.W CODE_0CB0F3                    ;0CB0EF|4CF3B0  |0CB0F3;
	
	
			CODE_0CB0F2:
						RTS                                  ;0CB0F2|60      |      ;
	
	
			CODE_0CB0F3:
						LDA.B #$00                           ;0CB0F3|A900    |      ;
						STA.W r_entity_target,X              ;0CB0F5|9D0606  |0C0606;
						STA.W r_damagActionFlag,X            ;0CB0F8|9D1D06  |0C061D;
						INC.W r_entity_Counter,X             ;0CB0FB|FE3306  |0C0633;
						LDA.W r_entity_Counter,X             ;0CB0FE|BD3306  |0C0633;
						AND.B #$07                           ;0CB101|2907    |      ;
						STA.W r_entity_Counter,X             ;0CB103|9D3306  |0C0633;
						LDA.W r_orb_flagsTimer               ;0CB106|ADF307  |0C07F3;
						CMP.B #$01                           ;0CB109|C901    |      ;
						BEQ CODE_0CB10E                      ;0CB10B|F001    |0CB10E;
						RTS                                  ;0CB10D|60      |      ;
	
	
			CODE_0CB10E:
						INC.W $07F0                          ;0CB10E|EEF007  |0C07F0;
						JMP.W CODE_0CB2A9                    ;0CB111|4CA9B2  |0CB2A9;
	
	
			CODE_0CB114:
						LDA.W r_entity_Counter,X             ;0CB114|BD3306  |0C0633;
						AND.B #$01                           ;0CB117|2901    |      ;
						ASL A                                ;0CB119|0A      |      ;
						TAY                                  ;0CB11A|A8      |      ;
						LDA.W DATA8_0CB2E1,Y                 ;0CB11B|B9E1B2  |0CB2E1;
						STA.B r_collisionPointYinScreen      ;0CB11E|8511    |000011;
						LDA.W DATA8_0CB2E2,Y                 ;0CB120|B9E2B2  |0CB2E2;
						STA.B r_index                        ;0CB123|8510    |000010;
						RTS                                  ;0CB125|60      |      ;
	
	
			CODE_0CB126:
						LDA.B #$00                           ;0CB126|A900    |      ;
						STA.W r_entity_Yspd,X                ;0CB128|9D2005  |0C0520;
						STA.W r_entity_YsubSpd,X             ;0CB12B|9D3705  |0C0537;
						LDA.W r_damagActionFlag,X            ;0CB12E|BD1D06  |0C061D;
						BEQ CODE_0CB148                      ;0CB131|F015    |0CB148;
						LDA.W r_entity_XPos,X                ;0CB133|BD3804  |0C0438;
						CMP.B #$C8                           ;0CB136|C9C8    |      ;
						BCC CODE_0CB147                      ;0CB138|900D    |0CB147;
	
			CODE_0CB13A:
						INC.W r_entity_target,X              ;0CB13A|FE0606  |0C0606;
						LDA.B r_index                        ;0CB13D|A510    |000010;
						STA.W r_entity_Yspd,X                ;0CB13F|9D2005  |0C0520;
						LDA.B r_collisionPointYinScreen      ;0CB142|A511    |000011;
						STA.W r_entity_YsubSpd,X             ;0CB144|9D3705  |0C0537;
	
			CODE_0CB147:
						RTS                                  ;0CB147|60      |      ;
	
	
			CODE_0CB148:
						LDA.W r_entity_XPos,X                ;0CB148|BD3804  |0C0438;
						CMP.B #$38                           ;0CB14B|C938    |      ;
						BCS CODE_0CB147                      ;0CB14D|B0F8    |0CB147;
						BCC CODE_0CB13A                      ;0CB14F|90E9    |0CB13A;
	
		move2Possition:
						LDA.W r_damagActionFlag,X            ;0CB151|BD1D06  |0C061D;
						BEQ CODE_0CB164                      ;0CB154|F00E    |0CB164;
						LDA.B #$04                           ;0CB156|A904    |      ;
						JSR.W CODE_0CB1A9                    ;0CB158|20A9B1  |0CB1A9;
						JSR.W CODE_0CB1F5                    ;0CB15B|20F5B1  |0CB1F5;
						BCC CODE_0CB163                      ;0CB15E|9003    |0CB163;
						INC.W r_entity_target,X              ;0CB160|FE0606  |0C0606;
	
			CODE_0CB163:
						RTS                                  ;0CB163|60      |      ;
	
	
			CODE_0CB164:
						LDA.B #$04                           ;0CB164|A904    |      ;
						JSR.W CODE_0CB1A9                    ;0CB166|20A9B1  |0CB1A9;
						LDA.W r_entity_Xspd,X                ;0CB169|BDF204  |0C04F2;
						ORA.W r_entity_XsubSpd,X             ;0CB16C|1D0905  |0C0509;
						BNE CODE_0CB163                      ;0CB16F|D0F2    |0CB163;
						INC.W r_damagActionFlag,X            ;0CB171|FE1D06  |0C061D;
						LDA.W r_damagActionFlag,X            ;0CB174|BD1D06  |0C061D;
						AND.B #$01                           ;0CB177|2901    |      ;
						STA.W r_damagActionFlag,X            ;0CB179|9D1D06  |0C061D;
						RTS                                  ;0CB17C|60      |      ;
	
	
			CODE_0CB17D:
						LDA.W r_damagActionFlag,X            ;0CB17D|BD1D06  |0C061D;
						BNE CODE_0CB190                      ;0CB180|D00E    |0CB190;
						LDA.B #$04                           ;0CB182|A904    |      ;
						JSR.W CODE_0CB1C3                    ;0CB184|20C3B1  |0CB1C3;
						JSR.W CODE_0CB1D7                    ;0CB187|20D7B1  |0CB1D7;
						BCC CODE_0CB18F                      ;0CB18A|9003    |0CB18F;
						INC.W r_entity_target,X              ;0CB18C|FE0606  |0C0606;
	
			CODE_0CB18F:
						RTS                                  ;0CB18F|60      |      ;
	
	
			CODE_0CB190:
						LDA.B #$04                           ;0CB190|A904    |      ;
						JSR.W CODE_0CB1C3                    ;0CB192|20C3B1  |0CB1C3;
						LDA.W r_entity_Xspd,X                ;0CB195|BDF204  |0C04F2;
						ORA.W r_entity_XsubSpd,X             ;0CB198|1D0905  |0C0509;
						BNE CODE_0CB163                      ;0CB19B|D0C6    |0CB163;
						INC.W r_damagActionFlag,X            ;0CB19D|FE1D06  |0C061D;
						LDA.W r_damagActionFlag,X            ;0CB1A0|BD1D06  |0C061D;
						AND.B #$01                           ;0CB1A3|2901    |      ;
						STA.W r_damagActionFlag,X            ;0CB1A5|9D1D06  |0C061D;
						RTS                                  ;0CB1A8|60      |      ;
	
	
			CODE_0CB1A9:
						CLC                                  ;0CB1A9|18      |      ;
						ADC.W r_entity_XsubSpd,X             ;0CB1AA|7D0905  |0C0509;
						STA.W r_entity_XsubSpd,X             ;0CB1AD|9D0905  |0C0509;
						LDA.W r_entity_Xspd,X                ;0CB1B0|BDF204  |0C04F2;
						ADC.B #$00                           ;0CB1B3|6900    |      ;
						STA.W r_entity_Xspd,X                ;0CB1B5|9DF204  |0C04F2;
						BCC CODE_0CB1C2                      ;0CB1B8|9008    |0CB1C2;
						LDA.B #$00                           ;0CB1BA|A900    |      ;
						STA.W r_entity_XsubSpd,X             ;0CB1BC|9D0905  |0C0509;
						STA.W r_entity_Xspd,X                ;0CB1BF|9DF204  |0C04F2;
	
			CODE_0CB1C2:
						RTS                                  ;0CB1C2|60      |      ;
	
	
			CODE_0CB1C3:
						STA.B $00                            ;0CB1C3|8500    |000000;
						LDA.W r_entity_XsubSpd,X             ;0CB1C5|BD0905  |0C0509;
						SEC                                  ;0CB1C8|38      |      ;
						SBC.B $00                            ;0CB1C9|E500    |000000;
						STA.W r_entity_XsubSpd,X             ;0CB1CB|9D0905  |0C0509;
						LDA.W r_entity_Xspd,X                ;0CB1CE|BDF204  |0C04F2;
						SBC.B #$00                           ;0CB1D1|E900    |      ;
						STA.W r_entity_Xspd,X                ;0CB1D3|9DF204  |0C04F2;
						RTS                                  ;0CB1D6|60      |      ;
	
	
			CODE_0CB1D7:
						LDA.W r_entity_Xspd,X                ;0CB1D7|BDF204  |0C04F2;
						BPL CODE_0CB1F3                      ;0CB1DA|1017    |0CB1F3;
						CMP.B #$FF                           ;0CB1DC|C9FF    |      ;
						BNE CODE_0CB1E7                      ;0CB1DE|D007    |0CB1E7;
						LDA.W r_entity_XsubSpd,X             ;0CB1E0|BD0905  |0C0509;
						CMP.B #$80                           ;0CB1E3|C980    |      ;
						BCS CODE_0CB1F3                      ;0CB1E5|B00C    |0CB1F3;
	
			CODE_0CB1E7:
						LDA.B #$FF                           ;0CB1E7|A9FF    |      ;
						STA.W r_entity_Xspd,X                ;0CB1E9|9DF204  |0C04F2;
						LDA.B #$80                           ;0CB1EC|A980    |      ;
						STA.W r_entity_XsubSpd,X             ;0CB1EE|9D0905  |0C0509;
						SEC                                  ;0CB1F1|38      |      ;
						RTS                                  ;0CB1F2|60      |      ;
	
	
			CODE_0CB1F3:
						CLC                                  ;0CB1F3|18      |      ;
						RTS                                  ;0CB1F4|60      |      ;
	
	
			CODE_0CB1F5:
						LDA.W r_entity_Xspd,X                ;0CB1F5|BDF204  |0C04F2;
						BMI CODE_0CB20F                      ;0CB1F8|3015    |0CB20F;
						BNE CODE_0CB203                      ;0CB1FA|D007    |0CB203;
						LDA.W r_entity_XsubSpd,X             ;0CB1FC|BD0905  |0C0509;
						CMP.B #$80                           ;0CB1FF|C980    |      ;
						BCC CODE_0CB20F                      ;0CB201|900C    |0CB20F;
	
			CODE_0CB203:
						LDA.B #$00                           ;0CB203|A900    |      ;
						STA.W r_entity_Xspd,X                ;0CB205|9DF204  |0C04F2;
						LDA.B #$80                           ;0CB208|A980    |      ;
						STA.W r_entity_XsubSpd,X             ;0CB20A|9D0905  |0C0509;
						SEC                                  ;0CB20D|38      |      ;
						RTS                                  ;0CB20E|60      |      ;
	
	
			CODE_0CB20F:
						CLC                                  ;0CB20F|18      |      ;
						RTS                                  ;0CB210|60      |      ;
	
	
			CODE_0CB211:
						LDA.W r_entity_Counter,X             ;0CB211|BD3306  |0C0633;
						STA.B r_roomSectionChrBanksDataOffset;0CB214|850F    |00000F;
						STX.B $17                            ;0CB216|8617    |000017;
						STY.B r_coreLoadingFuncAddr          ;0CB218|8416    |000016;
						LDA.B #$00                           ;0CB21A|A900    |      ;
						STA.B r_bossScript__14                 ;0CB21C|8514    |000014;
						STA.B r_bossScript__15                           ;0CB21E|8515    |000015;
						LDX.B r_sceneDrawQueue               ;0CB220|A61D    |00001D;
	
			CODE_0CB222:
						LDA.B #$01                           ;0CB222|A901    |      ;
						JSR.W CODE_0CB2BC                    ;0CB224|20BCB2  |0CB2BC;
						LDA.B r_bossScript__15                           ;0CB227|A515    |000015;
						BEQ CODE_0CB22D                      ;0CB229|F002    |0CB22D;
						LDA.B #$20                           ;0CB22B|A920    |      ;
	
			CODE_0CB22D:
						LDY.B r_roomSectionChrBanksDataOffset;0CB22D|A40F    |00000F;
						CLC                                  ;0CB22F|18      |      ;
						ADC.W DATA8_0CB2D1,Y                 ;0CB230|79D1B2  |0CB2D1;
						JSR.W CODE_0CB2BC                    ;0CB233|20BCB2  |0CB2BC;
						LDA.B #$23                           ;0CB236|A923    |      ;
						JSR.W CODE_0CB2BC                    ;0CB238|20BCB2  |0CB2BC;
						LDA.B #$04                           ;0CB23B|A904    |      ;
						STA.B r_bossState__12      ;0CB23D|8512    |000012;
	
			CODE_0CB23F:
						LDA.B r_coreLoadingFuncAddr          ;0CB23F|A516    |000016;
						BEQ CODE_0CB24A                      ;0CB241|F007    |0CB24A;
						LDY.B r_bossScript__14                 ;0CB243|A414    |000014;
						LDA.W DATA8_0CB2D9,Y                 ;0CB245|B9D9B2  |0CB2D9;
						INC.B r_bossScript__14                 ;0CB248|E614    |000014;
	
			CODE_0CB24A:
						JSR.W CODE_0CB2BC                    ;0CB24A|20BCB2  |0CB2BC;
						DEC.B r_bossState__12      ;0CB24D|C612    |000012;
						BNE CODE_0CB23F                      ;0CB24F|D0EE    |0CB23F;
						LDA.B #$FF                           ;0CB251|A9FF    |      ;
						JSR.W CODE_0CB2BC                    ;0CB253|20BCB2  |0CB2BC;
						INC.B r_bossScript__15                           ;0CB256|E615    |000015;
						LDA.B r_bossScript__15                           ;0CB258|A515    |000015;
						CMP.B #$02                           ;0CB25A|C902    |      ;
						BNE CODE_0CB222                      ;0CB25C|D0C4    |0CB222;
						STX.B r_sceneDrawQueue               ;0CB25E|861D    |00001D;
						LDX.B $17                            ;0CB260|A617    |000017;
						RTS                                  ;0CB262|60      |      ;
	
	
			CODE_0CB263:
						STY.B r_bossState__12      ;0CB263|8412    |000012;
						LDY.B r_roomSectionChrBanksDataOffset;0CB265|A40F    |00000F;
						LDA.W DATA8_0CB2C9,Y                 ;0CB267|B9C9B2  |0CB2C9;
						TAY                                  ;0CB26A|A8      |      ;
						LDA.B r_bossState__12      ;0CB26B|A512    |000012;
						BEQ CODE_0CB271                      ;0CB26D|F002    |0CB271;
						LDA.B #$66                           ;0CB26F|A966    |      ;
	
			CODE_0CB271:
						STA.B r_index                        ;0CB271|8510    |000010;
						LDA.W r_entity_XPos,X                ;0CB273|BD3804  |0C0438;
						SEC                                  ;0CB276|38      |      ;
						SBC.B #$10                           ;0CB277|E910    |      ;
						AND.B #$10                           ;0CB279|2910    |      ;
						BNE CODE_0CB283                      ;0CB27B|D006    |0CB283;
						LDA.B r_index                        ;0CB27D|A510    |000010;
						STA.W r_collisionMap,Y               ;0CB27F|99E006  |0C06E0;
						RTS                                  ;0CB282|60      |      ;
	
	
			CODE_0CB283:
						LDA.B r_index                        ;0CB283|A510    |000010;
						AND.B #$0F                           ;0CB285|290F    |      ;
						STA.B r_collisionPointYinScreen      ;0CB287|8511    |000011;
						LDA.W r_collisionMap,Y               ;0CB289|B9E006  |0C06E0;
						AND.B #$F0                           ;0CB28C|29F0    |      ;
						ORA.B r_collisionPointYinScreen      ;0CB28E|0511    |000011;
						STA.W r_collisionMap,Y               ;0CB290|99E006  |0C06E0;
						TYA                                  ;0CB293|98      |      ;
						CLC                                  ;0CB294|18      |      ;
						ADC.B #$0C                           ;0CB295|690C    |      ;
						TAY                                  ;0CB297|A8      |      ;
						LDA.B r_index                        ;0CB298|A510    |000010;
						AND.B #$F0                           ;0CB29A|29F0    |      ;
						STA.B r_collisionPointYinScreen      ;0CB29C|8511    |000011;
						LDA.W r_collisionMap,Y               ;0CB29E|B9E006  |0C06E0;
						AND.B #$0F                           ;0CB2A1|290F    |      ;
						ORA.B r_collisionPointYinScreen      ;0CB2A3|0511    |000011;
						STA.W r_collisionMap,Y               ;0CB2A5|99E006  |0C06E0;
						RTS                                  ;0CB2A8|60      |      ;
	
	
			CODE_0CB2A9:
						LDY.B #$00                           ;0CB2A9|A000    |      ;
						LDA.W DATA8_0CB2BA,Y                 ;0CB2AB|B9BAB2  |0CB2BA;
						STA.B $00                            ;0CB2AE|8500    |000000;
						LDA.W DATA8_0CB2BA+1,Y                 ;0CB2B0|B9BBB2  |0CB2BB;
						STA.B $01                            ;0CB2B3|8501    |000001;
						LDA.B #$92                           ;0CB2B5|A992    |      ;
						db $4C                               ;0CB2B7|        |      ;
	
						dw runRAM_00_inBankA                 ;0CB2B8|        |0FE62F;
	
			DATA8_0CB2BA:
						dw clear_bossSlot_02
	
	
			CODE_0CB2BC:
						STA.W r_VramQueue,X                  ;0CB2BC|9D0003  |0C0300;
						INX                                  ;0CB2BF|E8      |      ;
						RTS                                  ;0CB2C0|60      |      ;
	
	
			DATA8_0CB2C1:
						db $80,$A0,$40,$90,$B0,$60,$50,$70   ;0CB2C1|        |      ;
	
	
			DATA8_0CB2C9:
						db $2E,$3A,$16,$3A,$46,$22,$22,$2E   ;0CB2C9|        |      ;
	
			DATA8_0CB2D1:
						db $0E,$12,$06,$10,$14,$0A,$08,$0C   ;0CB2D1|        |      ;
	
			DATA8_0CB2D9:
						db $BC,$BE,$BC,$BE,$BD,$BF,$BD,$BF   ;0CB2D9|        |      ;
	
			DATA8_0CB2E1:
						db $E0                               ;0CB2E1|        |      ;
	
			DATA8_0CB2E2:
						db $00,$40,$00                       ;0CB2E2|        |      ;
						
			skullBoss_routine:			
						LDY.B #$05                           ;0CB2E5|A005    |      ;
	
			DATA8_0CB2E7:
						db $20                               ;0CB2E7|        |      ;
						dw findEmptyEntitySlot               ;0CB2E8|        |0FFEB9;
						db $20                               ;0CB2EA|        |      ;
						dw clearEntityAll                    ;0CB2EB|        |0FFED7;
						LDA.B #$8B                           ;0CB2ED|A98B    |      ;
						STA.W r_entity_ID,X                  ;0CB2EF|9D4E05  |0C054E;
						LDA.B #$0E                           ;0CB2F2|A90E    |      ;
						STA.W r_entity_spriteGroup,X         ;0CB2F4|9D8C04  |0C048C;
						LDA.B #$50                           ;0CB2F7|A950    |      ;
						STA.W r_entity_spriteID,X            ;0CB2F9|9D0004  |0C0400;
						LDA.B #$70                           ;0CB2FC|A970    |      ;
						STA.W r_entity_mask,X                ;0CB2FE|9D7004  |0C0470;
						LDA.B #$02                           ;0CB301|A902    |      ;
						STA.W r_entity_PaletteOverride,X     ;0CB303|9D5404  |0C0454;
						LDA.B #$80                           ;0CB306|A980    |      ;
						STA.W r_entity_AI,X                  ;0CB308|9DEF05  |0C05EF;
						LDA.W DATA8_0CB31B,Y                 ;0CB30B|B91BB3  |0CB31B;
						STA.W r_entity_YPos,X                ;0CB30E|9D1C04  |0C041C;
						LDA.W DATA8_0CB321,Y                 ;0CB311|B921B3  |0CB321;
						STA.W r_entity_XPos,X                ;0CB314|9D3804  |0C0438;
						DEY                                  ;0CB317|88      |      ;
						BPL DATA8_0CB2E7                     ;0CB318|10CD    |0CB2E7;
						RTS                                  ;0CB31A|60      |      ;
	
	
			DATA8_0CB31B:
						db $75,$B5,$95,$85,$65,$A5           ;0CB31B|        |      ;
	
			DATA8_0CB321:
						db $38,$38,$58,$B8,$D8,$D8           ;0CB321|        |      ;



} 
 
 	
	
	

; -- free space bank c 




assert pc() <= $C000						
pad $34000

}


{ ; -- main boss bank 09 -----------------------------------------------------------			

org $24000
base $8000
				bank_92:
						db $92                               ;098000|        |      ; NES PRG 24000


;				; !!FIXME 			
;						LDA.B $00                            ;099AE7|A500    |000000;
;						SEC                                  ;099AE9|38      |      ;
;						SBC.B $01                            ;099AEA|E501    |000001;
;						BPL CODE_099AF2                      ;099AEC|1004    |099AF2;
;						INC.W r_Player_StateDoubled,X        ;099AEE|FE6505  |090565; 
;						RTS                                  ;099AF1|60      |      ;
;
;				CODE_099AF2:
;						DEC.W r_Player_StateDoubled,X        ;099AF2|DE6505  |090565;
;						RTS                                  ;099AF5|60      |      ;
	

{ ; -- data tabels -----------------------------------------------------------------		
		

		bossEntityAllowFlags:		 ; 09849D|        |      ;
				db $00,$01,$01,$01,$00,$00,$00,$01,$00,$01,$01,$00,$00,$00,$00,$00                   
	
		RAM_790stuff:				 ; 0984AD|        |      ;
				db $00,$08,$08,$08,$00,$00,$00,$08                             
				db $00,$04,$08,$00,$0C,$00,$08,$00                                   

		
		weapDamage2Bosses: 
				db $00                               ;	098953|        |      ;
				db $00                               ;	??
				db $00                               ;
				db $00                               ;
				db $00                               ;
				db $00                               ;
				db $00                               ;
				db $00                               ;
				
				db $04                               ;
				db $03                               ;
				db $03                               ;
				db $02                               ;
				db $01                               ;
				db $01                               ;
				db $00                               ;
				db $00                               ;
				
				db $06                               ;
				db $05                               ; small whip, holyWater, dagger
				db $04                               ;
				db $03                               ;
				db $02                               ;
				db $01                               ;
				db $00                               ;
				db $00                               ;
				
				db $08                               ;
				db $07                               ; grantkife, whip, axe, cross 
				db $06                               ;
				db $04                               ;
				db $03                               ;
				db $02                               ;
				db $00                               ;
				db $00                               ;
				
				db $0A                               ;
				db $09                               ;
				db $08                               ;
				db $05                               ;
				db $04                               ;
				db $02                               ;
				db $00                               ;
				db $00                               ;
				
				db $0C                               ;
				db $0B                               ;
				db $0A                               ;
				db $06                               ;
				db $05                               ;
				db $03                               ;
				db $00                               ;
				db $00                               ;
				
				db $0E                               ;	sympha 
				db $0D                               ; 	fire, orb  
				db $0C                               ;
				db $08                               ;
				db $06                               ;
				db $04                               ;
				db $00                               ;
				db $00                               ;
		
		
		boss_entity_AI_IDX: 						; 0990A7
;		not a other script table right?
;				 	+----------------------------	| r_bossScript__13  => ?? 
;			    	|   +------------------------	| r_bossScript__14  => ??
;			    	|   |   +--------------------	| r_bossScript__15	=> ??
;			    	|   |   |	
;				 	|   |   |				
				db $0C,$00,$00               		; 00
				db $00,$00,$00               		; 01
				db $06,$00,$00               		; 02
				db $00,$00,$30               		; 03
				db $01,$00,$20               		; 04
				db $04,$04,$00               		; 05
				db $05,$20,$00               		; 06
				db $04,$03,$00               		; 07
				db $05,$FF,$00               		; 08
				db $01,$38,$00               		; 09
				db $00,$00,$20               		; 0A
				db $10,$00,$00               		; 0B
				db $18,$00,$00               		; 0C
				db $01,$00,$00               		; 0D
				db $14,$00,$00               		; 0E
				db $08,$00,$00               		; 0F
				db $00,$80,$08               		; 10
				db $00,$C0,$20               		; 11
				db $3C,$00,$00               		; 12
				db $2A,$00,$00               		; 13
				db $40,$00,$00               		; 14
				db $0C,$00,$00               		; 15
				db $03,$01,$02               		; 16
				db $04,$00,$00               		; 17
				db $F9,$00,$00               		; 18
				db $30,$00,$00               		; 19
				db $01,$80,$20               		; 1A
				db $FE,$00,$00               		; 1B
				db $03,$01,$20               		; 1C
				db $00,$14,$00               		; 1D
				db $01,$06,$00               		; 1E
				db $02,$02,$20               		; 1F
				db $12,$00,$00               		; 20
				db $03,$00,$10               		; 21
				db $07,$08,$00               		; 22
				db $07,$20,$00               		; 23
				db $19,$1B,$00               		; 24
				db $17,$03,$00               		; 25
				db $04,$01,$01               		; 26
				db $03,$00,$00               		; 27
				db $22,$00,$00               		; 28
				db $04,$01,$00               		; 29
				db $04,$08,$00               		; 2A
				db $05,$00,$00               		; 2B
				db $0A,$00,$00               		; 2C
				db $39,$00,$00               		; 2D
				db $19,$08,$01               		; 2E
				db $19,$04,$01               		; 2F
				db $00,$FD,$FF               		; 30
				db $0E,$06,$00               		; 31
				db $00,$00,$03               		; 32
				db $1A,$08,$02               		; 33
				db $01,$00,$40               		; 34
				db $28,$08,$02               		; 35
				db $00,$08,$00               		; 36
				db $01,$08,$00               		; 37
				db $02,$08,$00               		; 38
				db $A8,$00,$00               		; 39
				db $0E,$04,$00               		; 3A
				db $04,$60,$00               		; 3B
				db $37,$00,$00               		; 3C
				db $00,$F0,$00               		; 3D
				db $0A,$43,$00               		; 3E
				db $F8,$F0,$00               		; 3F
				db $00,$E0,$50               		; 40
				db $00,$A0,$10               		; 41
				db $18,$00,$00               		; 42
				db $06,$00,$00               		; 43
				db $00,$A0,$20               		; 44
				db $00,$80,$10               		; 45
				db $0A,$12,$00               		; 46
				db $15,$00,$00               		; 47
				db $0A,$15,$00               		; 48
				db $00,$03,$00               		; 49
				db $07,$40,$00               		; 4A
				db $04,$01,$08               		; 4B
				db $04,$01,$09               		; 4C
				db $FD,$00,$00               		; 4D
				db $FA,$00,$00               		; 4E
				db $03,$00,$70               		; 4F
				db $10,$34,$00               		; 50
				db $10,$36,$00               		; 51
				db $10,$30,$00               		; 52
				db $00,$80,$00               		; 53
				db $08,$05,$00               		; 54
				db $10,$8C,$01               		; 55
				db $FF,$00,$00               		; 56
				db $10,$90,$FF               		; 57
				db $FF,$00,$FF               		; 58
				db $FE,$00,$FF               		; 59
				db $10,$96,$00               		; 5A
				db $00,$F8,$00               		; 5B
				db $FF,$00,$01               		; 5C
				db $10,$A0,$01               		; 5D
				db $10,$A0,$00               		; 5E
				db $FE,$00,$01               		; 5F
				db $FE,$00,$00               		; 60
				db $10,$A2,$00               		; 61
				db $10,$A8,$00               		; 62
				db $10,$A8,$01               		; 63
				db $08,$08,$00               		; 64
				db $10,$D6,$00               		; 65
				db $2C,$01,$04               		; 66
				db $10,$4C,$00               		; 67
				db $42,$00,$00               		; 68
				db $44,$00,$00               		; 69
				db $0E,$08,$00               		; 6A
				db $00,$D0,$00               		; 6B
				db $00,$30,$00               		; 6C
				db $F0,$00,$00               		; 6D
				db $08,$20,$00               		; 6E
				db $0A,$20,$00               		; 6F
				db $09,$08,$00               		; 70
				db $04,$04,$00               		; 71
				db $09,$20,$00               		; 72
				db $10,$00,$00               		; 73
				db $02,$00,$00               		; 74
				db $0C,$00,$00               		; 75
				db $14,$00,$00               		; 76


}


{ ; -- main boss handler				
				
				
				
				bossMain:
					; endStopWatchAction:
						LDA.B r_bossActiveFlag               ;098240|A578    |000078;
						BEQ bossOrbStuff                     
						LDA.B r_stopWatchActive              
						BEQ bossOrbStuff                     
						LDY.B r_stopWatchTimer               
						DEY                                  
						BEQ bossOrbStuff                     
						LDA.B #$01                           
						STA.B r_stopWatchTimer               
	
				bossOrbStuff:	
						LDY.W r_entity_ID,X                  ;098004|BC4E05  |09054E;
						CPY.B #$2D                         	 ;snakeKing neckpieces  
						BEQ entity_2D_stuff                
						CPY.B #$10                         
						BCS nonMainBossStuff               
	
				entity_2D_stuff:
						JSR.W bossReadyChecks                ;09800F|207884  |098478;
						BEQ runBossChecks                   
						JSR.W whileBossStuff_03             
						BCC runBossChecks                   
						RTS                                 
	
				nonMainBossStuff:
						JSR.W whileBossStuff_00              ;09801A|205282  |098252;
						BCC runBossChecks                   
						RTS                                 
		
				runBossChecks:
						JSR.W bossPreview_CC                 ;098020|204F83  |09834F;
						BCC runOrbCheck                    
						RTS                                
		
				runOrbCheck:
						LDA.W r_orb_flagsTimer               ;098026|ADF307  |0907F3;
						AND.B #$7F                          
						CMP.B #$02                          
						BCC CODE_09803B                     
						LDA.W r_entity_ID,X                 
						CMP.B #$16                          
						BEQ CODE_09803B                     
						CMP.B #$1A                          
						BEQ CODE_09803B                     
						RTS                                 
		
				CODE_09803B:
						LDA.W r_entity_ID,X                  ;09803B|BD4E05  |09054E;
						CMP.B #$10                          
						BCC CODE_098054                     
						CMP.B #$2D                          
						BEQ CODE_098054                     
						LDA.W r_entity_AI,X                 
						BMI CODE_09804E                     
						jsr bossCode_bank8                  
	
				CODE_09804E:
						LDA.W r_entity_ID,X                  ;09804E|BD4E05  |09054E;
						BNE CODE_098054                      ;098051|D001    |098054;
						RTS                                  ;098053|60      |      ;
		
				CODE_098054:
						LDA.B r_bossActiveFlag               ;098054|A578    |000078;
						BNE bossPreviewState                 ;098056|D022    |09807A;
						JSR.W bossRoomTables_CHRload         ;098058|20BF84  |0984BF;
						BCS bossPreviewState                 ;09805B|B01D    |09807A;
						LDA.B r_sceneScrollOffsetLo          ;09805D|A556    |000056;
						BNE bossPreviewState                 ;09805F|D019    |09807A;
	
				initBoss:
						LDA.B #$01                           ;098061|A901    |      ;
						STA.B r_bossActiveFlag               ;098063|8578    |000078;
						jsr initBoss_setSoundBank             ;098066|        |0FE2D6;
						jsr moreBossInitStuff                 ;098069|        |0FFFBA;
						LDA.B #$00                           ;09806B|A900    |      ; region C000-DFFF is swapped with bank 7
						STA.B r_scrollSpd                    ;09806D|856E    |00006E;
						LDA.B r_stage                        ;09806F|A532    |000032;
						CMP.B #$0E                           ;098071|C90E    |      ;
						BEQ bossPreviewState                 ;098073|F005    |09807A;
						LDA.B #$5F                           ;098075|A95F    |      ;
						jsr lunchMusic                        ;098078|        |0FE25F;
	
		bossPreviewState:
						LDA.W r_orb_flagsTimer               ;09807A|ADF307  |0907F3;
						AND.B #$80                           ;09807D|2980    |      ;
						BEQ scrollPos00_check                      ;09807F|F02D    |0980AE;
						
						LDA.W r_entity_ID,X                  ;098081|BD4E05  |09054E;
						CMP.B #$26                           ;098084|C926    |      ;
						BEQ scrollPos00_check                      ;098086|F026    |0980AE;
						
						ASL A                                ;098088|0A      |      ;
						TAY                                  ;098089|A8      |      ;
						LDA.W bossID_preview,Y               ;09808A|B97881  |098178;
						STA.B $00                            ;09808D|8500    |000000;
						LDA.W bossID_preview+1,Y             ;09808F|B97981  |098179;
						STA.B $01                            ;098092|8501    |000001;
						JSR.W loadEnityIndex_jmp             ;098094|203D81  |09813D;
						
						LDA.B #$00                           ;098097|A900    |      ;
						STA.W r_entity_damage,X              ;098099|9D5706  |090657;
						LDA.W r_orb_flagsTimer               ;09809C|ADF307  |0907F3;
						AND.B #$BF                           ;09809F|29BF    |      ;
						BNE afterBoss_00                      ;0980A1|D022    |0980C5;
						
						LDA.W r_entity_mask,X                ;0980A3|BD7004  |090470;
						AND.B #$EF                           ;0980A6|29EF    |      ;
						STA.W r_entity_mask,X                ;0980A8|9D7004  |090470;
						JMP.W afterBoss_01                    ;0980AB|4CD480  |0980D4;
	
	
			scrollPos00_check:
						LDA.B r_sceneScrollOffsetLo          ;0980AE|A556    |000056;
						BEQ runBossMain                      ;0980B0|F001    |0980B3;	
				endBoss:
						RTS                                  ;0980B2|60      |      ;
				
			runBossMain:
						LDA.W r_entity_ID,X                  ;0980B3|BD4E05  |00054E; screen looked and initiated
						ASL A                                ;0980B6|0A      |      ;
						TAY                                  ;0980B7|A8      |      ;
						LDA.W bossID,Y                       ;0980B8|B9D481  |0981D4;
						STA.B $00                            ;0980BB|8500    |000000;
						LDA.W bossID+1,Y                     ;0980BD|B9D581  |0981D5;
						STA.B $01                            ;0980C0|8501    |000001;
						JSR.W loadEnityIndex_jmp             ;0980C2|203D81  |09813D;
	
			
			afterBoss_00:
						LDA.W r_orb_flagsTimer               ;0980C5|ADF307  |0907F3;
						AND.B #$BF                           ;0980C8|29BF    |      ;
						BEQ afterBoss_01                      ;0980CA|F008    |0980D4;
						LDA.W r_entity_mask,X                ;0980CC|BD7004  |090470;
						ORA.B #$10                           ;0980CF|0910    |      ;
						STA.W r_entity_mask,X                ;0980D1|9D7004  |090470;
	
			afterBoss_01:
						LDY.W r_entity_ID,X                  ;0980D4|BC4E05  |09054E;
						CPY.B #$2D                           ;0980D7|C02D    |      ;
						BEQ whileBossEntity                  ;0980D9|F004    |0980DF;
						CPY.B #$10                           ;0980DB|C010    |      ;
						BCS bossEntityHandler                ;0980DD|B006    |0980E5;
	
		whileBossEntity:
						JSR.W whileBossStuff_00              ;0980DF|205282  |098252;
						JSR.W whileBossStuff_01              ;0980E2|203784  |098437;
	
		bossEntityHandler:									 ;0980E5|BDEF05  |0905EF;
						LDA.W r_entity_AI,X                  
						ASL A                                
						BEQ endBoss                      
						TAY                                  
						LDA.W boss_entity_AI,Y            	; get pointer of 2 bossIDX to RAM $04  
						STA.B $04                            
						LDA.W boss_entity_AI+1,Y             
						STA.B $05                            
						
						LDA.W r_entity_AI_IDX,X      		
						ASL A                                
						TAY                                  
						LDA.B ($04),Y                        
						STA.B r_bossState__12     			; store first value of boss_entity_AI as "bossState"  
						
						INY                                	
						LDA.B ($04),Y                        
						TAY                                  
						ASL A                                
						CLC                                  
						ADC.W getBoss_entity_AI_IDX   		; add IDX 2 base 	     
						STA.B $00                            
						LDA.W getBoss_entity_AI_IDX+1        
						ADC.B #$00                           
						STA.B $01                            
						
						LDA.B ($00),Y                        
						STA.B r_bossScript__13               
						INY                                  
						LDA.B ($00),Y                        
						STA.B r_bossScript__14                 
						INY                                  
						LDA.B ($00),Y                        
						STA.B r_bossScript__15                           
						LDA.B #$12                           
						STA.B $02                            
						LDA.B #$00                           
						STA.B $03                            
						
						LDA.B r_bossState__12      			; run current boss state 
						ASL A                                
						TAY                                  
						LDA.W bossState,Y                    
						STA.B $00                            
						LDA.W bossState+1,Y                  
						STA.B $01                            
						JMP.W jmp_00                         
	
		getBoss_entity_AI_IDX: 
						dw boss_entity_AI_IDX                
	
				jmp_00:
						JMP.W ($0000)                        
	
		loadEnityIndex_jmp:
						LDY.W r_entity_ID,X                  
						LDA.W bossBanks,Y          			
						BEQ jmp_00                           
						jmp runRAM_00_inBankA                

		
			
{ ; -- boss initiation routines 			
			
			CODE_0982C8:
						CLC                                  ;0982C8|18      |      ;
						RTS                                  ;0982C9|60      |      ;
	
		whileBossStuff_00:
						LDY.W r_entity_ID,X                  ;098252|BC4E05  |09054E;
						LDA.W uslessBossValues,Y             ;098255|B91783  |098317;
						STA.B $02                            ;098258|8502    |000002;
						BEQ CODE_0982C8                      ;09825A|F06C    |0982C8;
						JSR.W bossReadyChecks                ;09825C|207884  |098478;
						BNE whileBossStuff_03                      ;09825F|D00C    |09826D;
						
						LDA.W r_entity_damageRelated,X       ;098261|BD6906  |090669;
						AND.B #$0F                           ;098264|290F    |      ;
						CMP.B #$02                           ;098266|C902    |      ;
						BNE CODE_0982C8                      ;098268|D05E    |0982C8;

						LDA.W r_entity_ID,X                  ;0983C5|BD4E05  |09054E;
						CMP.B #$08                           ;0983C8|C908    |      ;
						BEQ CODE_0983D9                      ;0983CA|F00D    |0983D9;
						CMP.B #$06                           ;0983CC|C906    |      ;
						BEQ CODE_0983F8                      ;0983CE|F028    |0983F8;
						CMP.B #$2D                           ;0983D0|C92D    |      ;
						BEQ CODE_0983FD                      ;0983D2|F029    |0983FD;
						JSR.W CODE_098412                    ;0983D4|201284  |098412;
						SEC                                  ;0983D7|38      |      ;
						RTS                                  ;0983D8|60      |      ;	
	
	
			CODE_0983D9:
						LDA.W r_misc_movementState,X         ;0983D9|BD4506  |090645;
						STA.B r_tempCurrRoomIdx              ;0983DC|850E    |00000E;
						LDX.B #$01                           ;0983DE|A201    |      ;
	
			CODE_0983E0:
						LDA.W r_entity_ID,X                  ;0983E0|BD4E05  |09054E;
						CMP.B #$08                           ;0983E3|C908    |      ;
						BNE CODE_0983F1                      ;0983E5|D00A    |0983F1;
						LDA.W r_misc_movementState,X         ;0983E7|BD4506  |090645;
						CMP.B r_tempCurrRoomIdx              ;0983EA|C50E    |00000E;
						BNE CODE_0983F1                      ;0983EC|D003    |0983F1;
						JSR.W CODE_09840D                    ;0983EE|200D84  |09840D;
	
			CODE_0983F1:
						INX                                  ;0983F1|E8      |      ;
						CPX.B #$0D                           ;0983F2|E00D    |      ;
						BCC CODE_0983E0                      ;0983F4|90EA    |0983E0;
						BCS CODE_098409                      ;0983F6|B011    |098409;
	
			CODE_0983F8:
						JSR.W CODE_0983A9                    ;0983F8|20A983  |0983A9;
						DEC.B $02                            ;0983FB|C602    |000002;
	
			CODE_0983FD:
						LDX.B #$01                           ;0983FD|A201    |      ;
						LDA.W r_entity_ID,X                  ;0983FF|BD4E05  |09054E;
						CMP.B #$06                           ;098402|C906    |      ;
						BNE CODE_098409                      ;098404|D003    |098409;
						JSR.W CODE_09840D                    ;098406|200D84  |09840D;
	
			CODE_098409:
						LDX.B r_entityID_processed           ;098409|A66C    |00006C;
						SEC                                  ;09840B|38      |      ;
						RTS 
			
			
		whileBossStuff_03:
						LDA.W r_entity_damageRelated,X       ;09826D|BD6906  |090669;
						AND.B #$F0                           ;098270|29F0    |      ;
						BNE CODE_0982CA                      ;098272|D056    |0982CA;
	
			bossFrameCounter:
						DEC.W $0790,X                        ;098274|DE9007  |090790;
						BNE CODE_0982B5                      ;098277|D03C    |0982B5;
	
			CODE_098279:
						LDA.W r_entity_PaletteOverride,X     ;098279|BD5404  |000454;
						AND.B #$F3                           ;09827C|29F3    |      ;
						STA.W r_entity_PaletteOverride,X     ;09827E|9D5404  |090454;
						LDA.W r_entity_ID,X                  ;098281|BD4E05  |09054E;
						CMP.B #$23                           ;098284|C923    |      ;
						BEQ CODE_098290                      ;098286|F008    |098290;
						CMP.B #$06                           ;098288|C906    |      ;
						BEQ CODE_098290                      ;09828A|F004    |098290;
						CMP.B #$2D                           ;09828C|C92D    |      ;
						BNE CODE_098294                      ;09828E|D004    |098294;
	
			CODE_098290:
						LDA.B #$60                           ;098290|A960    |      ;
						BNE CODE_09829B                      ;098292|D007    |09829B;
	
			CODE_098294:
						LDA.W r_entity_mask,X                ;098294|BD7004  |090470;
						AND.B #$DF                           ;098297|29DF    |      ;
						ORA.B #$40                           ;098299|0940    |      ;
	
			CODE_09829B:
						STA.W r_entity_mask,X                ;09829B|9D7004  |090470;
	
			CODE_09829E:
						JSR.W getBossMaskValues              ;09829E|208A84  |09848A;
						LDY.B $00                            ;0982A1|A400    |000000;
						LDA.B #$FF                           ;0982A3|A9FF    |      ;
						SEC                                  ;0982A5|38      |      ;
						SBC.B $01                            ;0982A6|E501    |000001;
						AND.W r_disablePlayer,Y              ;0982A8|39C400  |0900C4;
						STA.W r_disablePlayer,Y              ;0982AB|99C400  |0900C4;
						LDA.B #$00                           ;0982AE|A900    |      ;
						STA.W r_entity_damageRelated,X       ;0982B0|9D6906  |090669;
						SEC                                  ;0982B3|38      |      ;
						RTS                                  ;0982B4|60      |      ;
	
	
			CODE_0982B5:
						LDY.W $0790,X                        ;0982B5|BC9007  |090790;
						CPY.B #$0E                           ;0982B8|C00E    |      ;
						BNE CODE_0982C6                      ;0982BA|D00A    |0982C6;
						LDA.W r_entity_ID,X                  ;0982BC|BD4E05  |09054E;
						CMP.B #$06                           ;0982BF|C906    |      ;
						BNE CODE_0982C6                      ;0982C1|D003    |0982C6;
						JSR.W CODE_0983AD                    ;0982C3|20AD83  |0983AD;
	
			CODE_0982C6:
						SEC                                  ;0982C6|38      |      ;
						RTS                                  ;0982C7|60      |      ;
		
	
			CODE_0982CA:
						LDA.W r_entity_ID,X                  ;0982CA|BD4E05  |09054E;
						CMP.B #$06                           ;0982CD|C906    |      ;
						BEQ CODE_09830F                      ;0982CF|F03E    |09830F;
						CMP.B #$10                           ;0982D1|C910    |      ;
						BCC CODE_0982F0                      ;0982D3|901B    |0982F0;
						CMP.B #$2D                           ;0982D5|C92D    |      ;
						BEQ CODE_09830F                      ;0982D7|F036    |09830F;
						LDA.W PTR16_0984BD                    ;0982D9|ADBD84  |0984BD;
						STA.B $00                            ;0982DC|8500    |000000;
						LDA.W PTR16_0984BD+1                ;0982DE|ADBE84  |0984BE;	
						STA.B $01                            ;0982E1|8501    |000001;
						LDA.B #$8A                           ;0982E3|A98A    |      ;
						jsr runRAM_00_inBankA                 ;0982E6|        |0FE62F;
						
						LDX.B r_entityID_processed           ;0982E8|A66C    |00006C;
						JSR.W clear_bossSlot_02             ;0982EA|203A87  |09873A;
						JMP.W CODE_09829E                    ;0982ED|4C9E82  |09829E;
	
	
			CODE_0982F0:
						CMP.B #$0C                           ;0982F0|C90C    |      ;
						BEQ CODE_09830F                      ;0982F2|F01B    |09830F;
						CMP.B #$08                           ;0982F4|C908    |      ;
						BNE CODE_0982FD                      ;0982F6|D005    |0982FD;
						LDA.W r_entity_target,X              ;0982F8|BD0606  |090606;
						BMI CODE_09830F                      ;0982FB|3012    |09830F;
	
			CODE_0982FD:
						LDA.B #$01                           ;0982FD|A901    |      ;
						JSR.W setEntity__05                  ;0982FF|200589  |098905;
						LDA.W r_entity_Health,X              ;098302|BD7B06  |09067B;
						BNE CODE_09830F                      ;098305|D008    |09830F;
						LDA.B #$00                           ;098307|A900    |      ;
						STA.W $0790,X                        ;098309|9D9007  |090790;
						JMP.W CODE_098279                    ;09830C|4C7982  |098279;
	
	
			CODE_09830F:
						LDA.B #$00                           ;09830F|A900    |      ;
						STA.W r_entity_damageRelated,X       ;098311|9D6906  |090669;
						JMP.W bossFrameCounter               ;098314|4C7482  |098274;
	
	
			uslessBossValues:
							db $00,$20,$20,$20                   ;098317|        |      ;
							db $10,$20,$10,$20                   ;09831B|        |      ;
							db $20,$20,$20,$20                   ;09831F|        |      ;
							db $3C,$20,$20,$00                   ;098323|        |      ;
							db $00,$40,$00,$00                   ;098327|        |      ;
							db $40,$40,$00,$40                   ;09832B|        |      ;
							db $40,$40,$00,$00                   ;09832F|        |      ;
							db $00,$40,$00,$00                   ;098333|        |      ;
							db $00,$00,$00,$40                   ;098337|        |      ;
							db $00,$00,$00,$20                   ;09833B|        |      ;
							db $00,$00,$00,$40                   ;09833F|        |      ;
							db $00,$10,$00,$00                   ;098343|        |      ;
		
			bossMaskValues:
							db $01,$02,$04,$08                   ;098347|        |      ;
							db $10,$20,$40,$80                   ;09834B|        |      ;
	
		
		bossPreview_CC:
						JSR.W CODE_098481                    ;09834F|208184  |098481;
						BEQ bossOk_CC                        ;098352|F053    |0983A7;
						LDA.W r_entity_mask,X                ;098354|BD7004  |090470;
						ORA.B #$20                           ;098357|0920    |      ;
						STA.W r_entity_mask,X                ;098359|9D7004  |090470;
						DEC.W $0790,X                        ;09835C|DE9007  |090790;
						BNE CODE_09837E                      ;09835F|D01D    |09837E;
						LDA.W r_entity_mask,X                ;098361|BD7004  |090470;
						AND.B #$DF                           ;098364|29DF    |      ;
						ORA.B #$40                           ;098366|0940    |      ;
						STA.W r_entity_mask,X                ;098368|9D7004  |090470;
						JSR.W getBossMaskValues              ;09836B|208A84  |09848A;
						LDY.B $00                            ;09836E|A400    |000000;
						LDA.B #$FF                           ;098370|A9FF    |      ;
						SEC                                  ;098372|38      |      ;
						SBC.B $01                            ;098373|E501    |000001;
						AND.W $00CC,Y                        ;098375|39CC00  |0900CC;
						STA.W $00CC,Y                        ;098378|99CC00  |0900CC;
						JMP.W bossNo_CS                      ;09837B|4CA583  |0983A5;
	
	
			CODE_09837E:
						LDY.W r_entity_ID,X                  ;09837E|BC4E05  |09054E;
						LDA.W bossEntityAllowFlags,Y         ;098381|B99D84  |09849D;
						BEQ bossNo_CS                        ;098384|F01F    |0983A5;
						LDA.W $0790,X                        ;098386|BD9007  |090790;
						AND.B #$03                           ;098389|2903    |      ;
						BNE bossNo_CS                        ;09838B|D018    |0983A5;
						LDA.B #$02                           ;09838D|A902    |      ;
						STA.B $00                            ;09838F|8500    |000000;
						LDA.W $0790,X                        ;098391|BD9007  |090790;
						AND.B #$04                           ;098394|2904    |      ;
						BEQ CODE_09839C                      ;098396|F004    |09839C;
						LDA.B #$FE                           ;098398|A9FE    |      ;
						STA.B $00                            ;09839A|8500    |000000;
	
			CODE_09839C:
						LDA.W r_entity_XPos,X                ;09839C|BD3804  |090438;
						CLC                                  ;09839F|18      |      ;
						ADC.B $00                            ;0983A0|6500    |000000;
						STA.W r_entity_XPos,X                ;0983A2|9D3804  |090438;
	
				bossNo_CS:
						SEC                                  ;0983A5|38      |      ;
						RTS                                  ;0983A6|60      |      ;
	
	
				bossOk_CC:
						CLC                                  ;0983A7|18      |      ;
						RTS                                  ;0983A8|60      |      ;
	
	
			CODE_0983A9:
						LDA.B #$11                           ;0983A9|A911    |      ;
						BNE CODE_0983AF                      ;0983AB|D002    |0983AF;
	
			CODE_0983AD:
						LDA.B #$10                           ;0983AD|A910    |      ;
	
			CODE_0983AF:
						STA.B $02                            ;0983AF|8502    |000002;
						LDX.B #$02                           ;0983B1|A202    |      ;
	
			CODE_0983B3:
						LDA.W r_entity_ID,X                  ;0983B3|BD4E05  |09054E;
						CMP.B #$2D                           ;0983B6|C92D    |      ;
						BNE CODE_0983C2                      ;0983B8|D008    |0983C2;
						JSR.W CODE_09840D                    ;0983BA|200D84  |09840D;
						INX                                  ;0983BD|E8      |      ;
						CPX.B #$0D                           ;0983BE|E00D    |      ;
						BNE CODE_0983B3                      ;0983C0|D0F1    |0983B3;
	
			CODE_0983C2:
						LDX.B r_entityID_processed           ;0983C2|A66C    |00006C;
						RTS                                  ;0983C4|60      |      ;
	
	

	
	
			CODE_09840D:
						JSR.W bossReadyChecks                ;09840D|207884  |098478;
						BNE +
	
			CODE_098412:
						LDA.B $01                            ;098412|A501    |000001;
						ORA.W r_disablePlayer,Y              ;098414|19C400  |0900C4;
						STA.W r_disablePlayer,Y              ;098417|99C400  |0900C4;
						LDA.B $02                            ;09841A|A502    |000002;
						STA.W $0790,X                        ;09841C|9D9007  |090790;
						LDA.W r_entity_PaletteOverride,X     ;09841F|BD5404  |090454;
						ORA.B #$04                           ;098422|0904    |      ;
						STA.W r_entity_PaletteOverride,X     ;098424|9D5404  |090454;
						LDA.W r_entity_mask,X                ;098427|BD7004  |090470;
						AND.B #$BF                           ;09842A|29BF    |      ;
						ORA.B #$20                           ;09842C|0920    |      ;
						STA.W r_entity_mask,X                ;09842E|9D7004  |090470;
						LDA.B #$00                           ;098431|A900    |      ;
						STA.W r_entity_damageRelated,X       ;098433|9D6906  |090669;
					+	
						RTS                                  ;098436|60      |      ;
	
	
		whileBossStuff_01:
						LDY.W r_entity_ID,X                  ;098437|BC4E05  |09054E;
						CPY.B #$2D                           ;09843A|C02D    |      ;
						BEQ CODE_098442                      ;09843C|F004    |098442;
						CPY.B #$10                           ;09843E|C010    |      ;
						BCS CODE_098472                      ;098440|B030    |098472;
	
			CODE_098442:
						LDA.W RAM_790stuff,Y                 ;098442|B9AD84  |0984AD;
						STA.B $02                            ;098445|8502    |000002;
						BEQ CODE_098472                      ;098447|F029    |098472;
						JSR.W bossReadyChecks                ;098449|207884  |098478;
						BNE CODE_098472                      ;09844C|D024    |098472;
						JSR.W CODE_098481                    ;09844E|208184  |098481;
						BNE CODE_098472                      ;098451|D01F    |098472;
						LDA.W r_entity_damageRelated,X       ;098453|BD6906  |090669;
						AND.B #$F0                           ;098456|29F0    |      ;
						BEQ CODE_098472                      ;098458|F018    |098472;
						JSR.W getBossMaskValues              ;09845A|208A84  |09848A;
						LDY.B $00                            ;09845D|A400    |000000;
						ORA.W $00CC,Y                        ;09845F|19CC00  |0900CC;
						STA.W $00CC,Y                        ;098462|99CC00  |0900CC;
						LDA.B $02                            ;098465|A502    |000002;
						STA.W $0790,X                        ;098467|9D9007  |090790;
						LDA.W r_entity_mask,X                ;09846A|BD7004  |090470;
						AND.B #$BF                           ;09846D|29BF    |      ;
						STA.W r_entity_mask,X                ;09846F|9D7004  |090470;
	
			CODE_098472:
						LDA.B #$00                           ;098472|A900    |      ;
						STA.W r_entity_damageRelated,X       ;098474|9D6906  |090669;
						RTS                                  ;098477|60      |      ;
	
	
		bossReadyChecks:
						JSR.W getBossMaskValues              ;098478|208A84  |09848A;
						LDY.B $00                            ;09847B|A400    |000000;
						AND.W r_disablePlayer,Y              ;09847D|39C400  |0900C4;
						RTS                                  ;098480|60      |      ;
	
	
			CODE_098481:
						JSR.W getBossMaskValues              ;098481|208A84  |09848A;
						LDY.B $00                            ;098484|A400    |000000;
						AND.W $00CC,Y                        ;098486|39CC00  |0900CC;
						RTS                                  ;098489|60      |      ;
	
	
		getBossMaskValues:
						LDY.B #$00                           ;09848A|A000    |      ;
						CPX.B #$08                           ;09848C|E008    |      ;
						BCC CODE_098491                      ;09848E|9001    |098491;
						INY                                  ;098490|C8      |      ;
	
			CODE_098491:
						STY.B $00                            ;098491|8400    |000000;
						TXA                                  ;098493|8A      |      ;
						AND.B #$07                           ;098494|2907    |      ;
						TAY                                  ;098496|A8      |      ;
						LDA.W bossMaskValues,Y               ;098497|B94783  |098347;
						STA.B $01                            ;09849A|8501    |000001;
						RTS                                  ;09849C|60      |      ;
		
			PTR16_0984BD: 
						dw someBossBank_5_thing
	
			
			
			bossRoomTables_CHRload:
						LDY.W r_entity_ID,X                  ;0984BF|BC4E05  |09054E;
						CPY.B #$2D                           ;0984C2|C02D    |      ;
						BNE CODE_0984CA                      ;0984C4|D004    |0984CA;
						LDY.B #$06                           ;0984C6|A006    |      ;
						BNE CODE_0984D0                      ;0984C8|D006    |0984D0;
	
			CODE_0984CA:
						CPY.B #$10                           ;0984CA|C010    |      ;
						BCC CODE_0984D0                      ;0984CC|9002    |0984D0;
						CLC                                  ;0984CE|18      |      ;
						RTS                                  ;0984CF|60      |      ;
	
	
			CODE_0984D0:
						LDA.W boss_CHR_allowedEntity_IDoffset,Y   ;0984D0|B99A85  |09859A;
						BEQ +
						JMP.W scrollBlockAndStage_testCHRreload                    ;0984D5|4C5585  |098555;
	
	
					+
						LDA.W r_entity_mask,X                ;0984D8|BD7004  |090470;
						AND.B #$01                           ;0984DB|2901    |      ;
						BEQ endBossST_CHR_CC                      ;0984DD|F074    |098553;
						TAY                                  ;0984DF|A8      |      ;
						LDA.W bossEntityMask_CHRstage,Y                 ;0984E0|B9AE85  |0985AE;
						BEQ endBossST_CHR_CC                      ;0984E3|F06E    |098553;
						LDA.B r_stage                        ;0984E5|A532    |000032;
						CMP.W boss_CHRstage,Y                 ;0984E7|D9CE85  |0985CE;
						BEQ CODE_0984F2                      ;0984EA|F006    |0984F2;
						LDA.W boss_CHRstageFlagsFirst,Y                 ;0984EC|B9DE85  |0985DE;
						JMP.W CODE_0984F5                    ;0984EF|4CF584  |0984F5;
	
	
			CODE_0984F2:
						LDA.W boss_CHRstageFlags,Y                 ;0984F2|B9BE85  |0985BE;
	
			CODE_0984F5:
						BEQ CODE_098505                      ;0984F5|F00E    |098505;
						CMP.B #$FF                           ;0984F7|C9FF    |      ;
						BEQ endBossST_CHR_CC                      ;0984F9|F058    |098553;
						LDA.W r_entity_XPos,X                ;0984FB|BD3804  |090438;
						CMP.B #$20                           ;0984FE|C920    |      ;
						BCC endBossST_CHR_CC                      ;098500|9051    |098553;
						JMP.W reloadStageCHR                    ;098502|4C0C85  |09850C;
	
	
			CODE_098505:
						LDA.W r_entity_XPos,X                ;098505|BD3804  |090438;
						CMP.B #$E0                           ;098508|C9E0    |      ;
						BCS endBossST_CHR_CC                      ;09850A|B047    |098553;
	
			reloadStageCHR:
						LDY.B r_bossSpawner                  ;09850C|A4C3    |0000C3;
						LDA.W r_spawnerID,Y                  ;09850E|B9C207  |0907C2;
						CMP.B #$05                           ;098511|C905    |      ;
						BCC CODE_098526                      ;098513|9011    |098526;
						CMP.B #$0B                           ;098515|C90B    |      ;
						BCC CODE_098521                      ;098517|9008    |098521;
						CMP.B #$1B                           ;098519|C91B    |      ;
						BCC CODE_098526                      ;09851B|9009    |098526;
						CMP.B #$27                           ;09851D|C927    |      ;
						BCS CODE_098526                      ;09851F|B005    |098526;
	
			CODE_098521:
						LDA.B #$00                           ;098521|A900    |      ;
						STA.W r_spawner_var7c8,Y             ;098523|99C807  |0907C8;
	
			CODE_098526:
						LDA.B #$00                           ;098526|A900    |      ;
						STA.B r_bossObject                   ;098528|85C1    |0000C1;
						
						LDY.B #$02                           ;09852A|A002    |      ;
						JSR.W getCHR_stageReload             ;09852C|207F85  |09857F;

						LDY.B #$00                           ;098534|A000    |      ;
						JSR.W getCHR_stageReload             ;098536|207F85  |09857F;


						LDX.B #$01                           ;09853E|A201    |      ;
			clearEntity_bossLoop:
						LDA.W r_entity_ID,X                  ;098540|BD4E05  |09054E;
						CMP.B #$40                           ;098543|C940    |      ;
						BCS +
						JSR.W clear_bossSlot_02             ;098547|203A87  |09873A;
					+
						INX                                  ;09854A|E8      |      ;
						CPX.B #$0D                           ;09854B|E00D    |      ;
						BNE clearEntity_bossLoop                      ;09854D|D0F1    |098540;
						LDX.B r_entityID_processed           ;09854F|A66C    |00006C;
			
						SEC                                  ;098551|38      |      ;
						RTS                                  ;098552|60      |      ;
			endBossST_CHR_CC:
						CLC                                  ;098553|18      |      ;
						RTS                                  ;098554|60      |      ;
			
			getCHR_stageReload:
						LDA.W CHR_stageReload,Y         ;09857F|B9AA85  |0985AA;
						STA.B $00                            ;098582|8500    |000000;
						LDA.W CHR_stageReload+1,Y        ;098584|B9AB85  |0985AB;
						STA.B $01                            ;098587|8501    |000001;
						
						LDA.B #$80                          
						jsr runRAM_00_inBankA               
						
						RTS                                 
         
		 CHR_stageReload: 
						dw getCurrRoomsChrBanks            ;0985AA|        |008013;
						dw getStageCHR_enemy               ;0985AC|        |00859E;	
		

			scrollBlockAndStage_testCHRreload:
						LDA.B r_sceneScrollOffsetLo          ;098555|A556    |000056;
						BNE endBossST_CHR_CC                 ;098557|D0FA    |098553;
						CPY.B #$06                           ;098559|C006    |      ;
						BNE CODE_098567                      ;09855B|D00A    |098567;
						LDA.B r_blockLevel                   ;09855D|A533    |000033;
						CMP.B #$02                           ;09855F|C902    |      ;
						BEQ CODE_098575                      ;098561|F012    |098575;
						LDA.B #$00                           ;098563|A900    |      ;
						BEQ CODE_098578                      ;098565|F011    |098578;
	
			CODE_098567:
						CPY.B #$07                           ;098567|C007    |      ;
						BNE CODE_098575                      ;098569|D00A    |098575;
						LDA.B r_stage                        ;09856B|A532    |000032;
						CMP.B #$04                           ;09856D|C904    |      ;
						BEQ CODE_098575                      ;09856F|F004    |098575;
						LDA.B #$01                           ;098571|A901    |      ;
						BNE CODE_098578                      ;098573|D003    |098578;
	
			CODE_098575:
						LDA.W boss_CHR_scrollHi_Pos,Y                 ;098575|B98A85  |09858A;
	
			CODE_098578:
						CMP.B r_sceneScrollOffsetHi          ;098578|C557    |000057;
						BEQ endBossST_CHR_CC                 ;09857A|F0D7    |098553;
						JMP.W reloadStageCHR                 ;09857C|4C0C85  |09850C;
	
        
        boss_CHR_allowedEntity_IDoffset: 	
									db $00,$00,$00,$00,$00,$01,$01,$01,$01,$00,$01,$00,$00,$00,$00,$00   ;09859A
		bossEntityMask_CHRstage:	db $00,$02,$01,$01,$02,$01,$01,$02,$01,$01,$01,$01,$01,$01,$00,$00   ;0985AE
        
		
		boss_CHRstage:	 			db $00,$00,$00,$00,$06,$00,$00,$04,$00,$00,$00,$00,$00,$00,$00,$00   ;0985CE
		boss_CHR_scrollHi_Pos: 		db $00,$00,$00,$00,$00,$01,$02,$02,$01,$00,$01,$00,$00,$00,$00,$00   ;09858A
		boss_CHRstageFlagsFirst: 	db $00,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ;0985DE
		boss_CHRstageFlags: 		db $00,$00,$00,$01,$FF,$00,$00,$00,$00,$00,$00,$01,$00,$01,$00,$00   ;0985BE
	
}                              

}


{ ; -- main boss pointers, IDXs

		
			bossBanks: 	                               
						db $00,$00,$00,$86,$00,$00,$00,$86,$86,$86,$86,$98,$86,$00,$86,$98,$00,$00,$00,$00,$86,$86,$90,$00  ; 18
						db $86,$86,$00,$86,$86,$86,$86,$00,$00,$00,$00,$86,$00,$00,$00,$86,$00,$00,$86,$86,$8A,$00  		; 2e

		bossID_preview:
						dw boss00__RTS                       ;098178| 	$00 00	|098230;
						dw bossPreview_skullKing_01          ;09817A| 	$00 01	|09A14F;
						dw bossPreview_hammerGuy_02          ;09817C| 	$00 02	|09A4C9;
						dw bossPreview_grant_03              ;09817E| 	$86 03	|038DD7;
						dw bossPreview_mamaBat_04            ;098180| 	$00 04	|09A931;
						dw bossPreview_alucard_05            ;098182| 	$00 05	|09ABAF;
						dw bossPreview_snakeKing_06          ;098184| 	$00 06	|09AEE9;
						dw bossPreview_monster_07            ;098186| 	$86 07	|03931B;
						dw bossPreview_vipers_08             ;098188| 	$86 08	|038004;
						dw bossPreview_devil_09              ;09818A| 	$86 09	|03851A;
						dw bossPreview_medusa_0A             ;09818C| 	$86 0A	|03950F;
						dw bossPreview_doupleGanger_0B       ;09818E| 	$98 0B	|0CA59B;
						dw bossPreview_death_0C              ;098190| 	$86 0C	|0399BE;
						dw bossPreview_dracula_0D            ;098192| 	$00 0D	|09B4EF;
						dw bossPre_RTS__2a                   ;098194| 	$86 0E	|038020;
						dw boss00__RTS                       ;098196| 	$98 0F	|098230; 0C in theory
						dw boss00__RTS                       ;098198| 	$00 10	|098230;
						dw boss00__RTS                       ;09819A| 	$00 11	|098230;
						dw boss00__RTS                       ;09819C| 	$00 12	|098230;
						dw boss00__RTS                       ;09819E| 	$00 13	|098230;
						dw bossPre_RTS__2a                   ;0981A0| 	$86 14	|038020;
						dw bossPre_RTS__2a                   ;0981A2| 	$86 15	|038020;
						dw boss00__RTS                       ;0981A4| 	$90 16	|098230; 08 in theory
						dw boss00__RTS                       ;0981A6| 	$00 17	|098230;
						dw boss00__RTS                       ;0981A8| 	$86 18	|098230; 03 in theory
						dw boss00__RTS                       ;0981AA| 	$86 19	|098230; 03 in theory
						dw bossPr1a__1a                      ;0981AC| 	$00 1A	|0989B3;
						dw boss00__RTS                       ;0981AE| 	$86 1B	|098230; 03 in theory
						dw boss00__RTS                       ;0981B0| 	$86 1C	|098230; 03 in theory
						dw bossPre_RTS__2a                   ;0981B2| 	$86 1D	|038020;
						dw bossPre_RTS__2a                   ;0981B4| 	$86 1E	|038020;
						dw boss00__RTS                       ;0981B6| 	$00 1F	|098230;
						dw boss00__RTS                       ;0981B8| 	$00 20	|098230;
						dw boss00__RTS                       ;0981BA| 	$00 21	|098230;
						dw boss00__RTS                       ;0981BC| 	$00 22	|098230;
						dw bossPre_RTS__2a                   ;0981BE| 	$86 23	|038020;
						dw boss00__RTS                       ;0981C0| 	$00 24	|098230;
						dw boss00__RTS                       ;0981C2| 	$00 25	|098230;
						dw runBossChecks                     ;0981C4| 	$00 26	|098020;
						dw bossPre_RTS__2a                   ;0981C6| 	$86 27	|038020;
						dw bossPre__28__28                   ;0981C8| 	$00 	|09898B;
						dw bossPreview__29                   ;0981CA| 	$00 	|09BCB8;
						dw bossPre_RTS__2a                   ;0981CC| 	$86 	|038020;
						dw bossID__2b                        ;0981CE| 	$86 	|039CF6;
						dw bossID__2c                        ;0981D0| 	$8A 	|05BC75;
						dw bossPreview_snakeKing_06          ;0981D2| 	$00 	|09AEE9;
	
				bossID:
						dw boss00__RTS                       ;0981D4| 	$00 00  |098230;
						dw bossID_skullKing_01               ;0981D6| 	$00 01  |09A1F5;
						dw bossID_hammerGuy_02               ;0981D8| 	$00 02  |09A5DF;
						dw bossID_grant_03                   ;0981DA| 	$86 03  |038E12;
						dw bossID_mamaBat_04                 ;0981DC| 	$00 04  |09A992;
						dw bossID_alucard_05                 ;0981DE| 	$00 05  |09AC3D;
						dw bossID_SnakeKing_06           	 ;0981E0| 	$00 06  |09AF86;
						dw bossID_monster_07                 ;0981E2| 	$86 07  |03937C;	
						dw bossID_vipers_08                  ;0981E4| 	$86 08  |038021;
						dw bossID_Devil_09                   ;0981E6| 	$86 09  |038A34;
						dw bossID_medusa_0a                  ;0981E8| 	$86 0A  |03968F;
						dw bossID_doupleGanger_0b            ;0981EA| 	$98 0B  |0CA610;
						dw bossID_death_0c                   ;0981EC| 	$86 0C  |039A14;
						dw bossID_dracula_0d                 ;0981EE| 	$00 0D  |09B5AC;
						dw bossID_mummy_0e                   ;0981F0| 	$86 0E  |038A3F;
						dw bossID__0f                        ;0981F2| 	$98 0F  |0CA464; 0C in theory
						dw bossID__10                        ;0981F4| 	$00 10  |0CA49A; 09 in theory
						dw bossID__11                        ;0981F6| 	$00 11  |09A44B;
						dw bossID__12                        ;0981F8| 	$00 12  |09A803;
						dw bossID__13                        ;0981FA| 	$00 13  |09A87F;
						dw bossID_granDagger_14              ;0981FC| 	$86 14  |039275;
						dw bossID__15                        ;0981FE| 	$86 15  |0392B9;
						dw bossID_winOrb_16                  ;098200| 	$90 16  |08BED9; 08 in theory
						dw bossID__17                        ;098202| 	$00 17  |09AEBB;
						dw bossID_blockThrow_18              ;098204| 	$86 18  |0394BB; 03 in theory
						dw bossID_blockCelling_19            ;098206| 	$86 19  |0394D4; 03 in theory
						dw bossPr1a__1a                      ;098208| 	$00 1A  |0989B3;
						dw bossID__1b                        ;09820A| 	$86 1B  |038416; 03 in theory
						dw bossID__1c                        ;09820C| 	$86 1C  |0384CA; 03 in theory
						dw bossID__1d                        ;09820E| 	$86 1D  |03986A;
						dw bossID__1e                        ;098210| 	$86 1E  |0398EA;
						dw bossID__1f                        ;098212| 	$00 1F  |09A530;
						dw bossID__20                        ;098214| 	$00 20  |09A584;
						dw bossID__21                        ;098216| 	$00 21  |09AC01;
						dw bossID__22                        ;098218| 	$00 22  |09A193;
						dw bossID__23                        ;09821A| 	$86 23  |038DA2;
						dw bossID__24                        ;09821C| 	$00 24  |09B8A9;
						dw bossID__25                        ;09821E| 	$00 25  |09B56E;
						dw bossID_crumble_26                 ;098220| 	$00 26  |09B49F;
						dw bossID__27                        ;098222| 	$86 27  |038C02;
						dw bossPre__28__28                   ;098224| 	$00     |09898B;
						dw bossPreview__29                   ;098226| 	$00     |09BCB8;
						dw bossPre_RTS__2a                   ;098228| 	$86     |038020;
						dw bossID__2b                        ;09822A| 	$86     |039CF6;
						dw bossID__2c                        ;09822C| 	$8A     |05BC75;
						dw bossID_boneKingNeck_2d            ;09822E| 	$00     |09B046;

				bossState:
						dw bossState__00                     ;098671|        	|099584; enity script execution??
						dw bossState__01                     ;098673|        	|099619;
						dw bossState_ySpdScript_02           ;098675|        	|099653;
						dw bossState__03                     ;098677|        	|099571;
						dw bossState__04                     ;098679|        	|099560;
						dw bossState__05                     ;09867B|        	|099707;
						dw bossState__06                     ;09867D|        	|099710;
						dw bossState__07                     ;09867F|        	|099779;
						dw bossState__08                     ;098681|        	|099831;
						dw bossState__09                     ;098683|        	|09974A;
						dw bossState__0a                     ;098685|        	|09972B;
						dw bossState__0b                     ;098687|        	|099552;
						dw bossState__0c                     ;098689|        	|099517;
						dw bossState__0d                     ;09868B|        	|099555;
						dw bossState__0e                     ;09868D|        	|0995E0;
						dw bossState__0f                     ;09868F|        	|099577;
						dw bossState__10                     ;098691|        	|0994F4;
						dw bossState__11                     ;098693|        	|099473;
						dw bossState__12                     ;098695|        	|09949D;
						dw bossState__13                     ;098697|        	|09945B;
						dw bossState__14                     ;098699|        	|099441;
						dw bossState__15                     ;09869B|        	|09944C;
						dw bossState__16                     ;09869D|        	|0993BA;
						dw bossState__17                     ;09869F|        	|099401;
						dw bossState_ySpdScript_02           ;0986A1|        	|099653;
						dw bossState__19                     ;0986A3|        	|099B00;	
						dw bossState__1a                     ;0986A5|        	|099BE4;
						dw bossState__1b                     ;0986A7|        	|09971F;
						dw bossState__1c                     ;0986A9|        	|099569;
						dw bossState__1d                     ;0986AB|        	|09920C;
						dw bossState__1e                     ;0986AD|        	|09934C;
						dw bossState__1f                     ;0986AF|        	|099369;
						dw bossState__20                     ;0986B1|        	|099E48;
						dw boss_RTS_21                       ;0986B3|        	|09870A;
						dw bossState__22                     ;0986B5|        	|09995A;
						dw bossState__24                     ;0986B7|        	|099921;
						dw bossState__24                     ;0986B9|        	|099921;
						dw bossState__25                     ;0986BB|        	|099F00;
						dw bossState__26                     ;0986BD|        	|099F76;
						dw bossState__27                     ;0986BF|        	|099FC4;
						dw bossState__28                     ;0986C1|        	|099FF7;
						dw clear_bossSlot_02                 ;0986C3|        	|09A009;
						dw boss_INC_AI_IDX_2a                ;0986C5|        	|098707;
						dw bossState__2b                     ;0986C7|        	|099E40;
						dw bossState__2c                     ;0986C9|        	|09A00C;
						dw bossState__2d                     ;0986CB|        	|09A082;
						dw bossState_hammerGut_2e            ;0986CD|        	|09A0EB;
						dw bossState__2f                     ;0986CF|        	|09A0F5;
						dw bossState__30                     ;0986D1|        	|09A101;
						dw bossState__31                     ;0986D3|        	|09A126;
						dw bossState__32                     ;0986D5|        	|099DEF;
						dw bossState__33                     ;0986D7|        	|099DD7;
						dw bossState__34                     ;0986D9|        	|099DB9;
						dw bossState__35                     ;0986DB|        	|099DA3;
						dw bossState__36                     ;0986DD|        	|099DAE;
						dw bossState__37                     ;0986DF|        	|099D96;
						dw bossState__38                     ;0986E1|        	|099D6A;
						dw bossState__39                     ;0986E3|        	|099D5E;
						dw bossState__3a                     ;0986E5|        	|099D54;
						dw bossState__3b                     ;0986E7|        	|099D2C;
						dw bossState__3c                     ;0986E9|        	|099D36;
						dw bossState__3d                     ;0986EB|        	|099D40;
						dw bossState__3e                     ;0986ED|        	|099D21;
						dw bossState__3f                     ;0986EF|        	|099CC4;
						dw bossState__47                     ;0986F1|        	|099D45;
						dw bossState__41                     ;0986F3|        	|099C5E;
						dw bossState__42                     ;0986F5|        	|099961;
						dw bossState__43                     ;0986F7|        	|099AF6;
						dw bossState_ySpdScript_02           ;0986F9|        	|099653;
						dw bossState__45                     ;0986FB|        	|099D78;
						dw bossState__46                     ;0986FD|        	|099C2C;
						dw bossState__47                     ;0986FF|        	|099D45;
						dw bossState__48                     ;098701|        	|09A027;
						dw bossState__49                     ;098703|        	|099C04;
						dw bossState__4a                     ;098705|        	|099C18; 


		boss_entity_AI:	 
						dw bossAI__65                      ;0989EF|        	|098ABB;
						dw bossAI__01                      ;0989F1|        	|098ABD;
						dw bossAI__02                      ;0989F3|        	|098AD5;
						dw bossAI__03                      ;0989F5|        	|098AE1;
						dw bossAI__04                      ;0989F7|        	|098AEB;
						dw bossAI__05                      ;0989F9|        	|098AF3;
						dw bossAI__06                      ;0989FB|        	|098AFD;
						dw bossAI__07                      ;0989FD|        	|098B03;
						dw bossAI__08                      ;0989FF|        	|098B0B;
						dw bossAI__09                      ;098A01|        	|098B11;
						dw bossAI__0a                      ;098A03|        	|098B17;
						dw bossAI__0b                      ;098A05|        	|098B2B;
						dw bossAI__0c                      ;098A07|        	|098B31;
						dw bossAI__0d                      ;098A09|        	|098B37;
						dw bossAI__0e                      ;098A0B|        	|098B3D;
						dw bossAI__0f                      ;098A0D|        	|098B7B;
						dw bossAI__10                      ;098A0F|        	|098B71;
						dw bossAI__11                      ;098A11|        	|098B4B;
						dw bossAI__12                      ;098A13|        	|098B8D;
						dw bossAI__13                      ;098A15|        	|098BAD;
						dw bossAI__14                      ;098A17|        	|098B9B;
						dw bossAI__15                      ;098A19|        	|098BA7;
						dw bossAI__16                      ;098A1B|        	|098BAF;
						dw bossAI__17                      ;098A1D|        	|098BB9;
						dw bossAI__18                      ;098A1F|        	|098BBF;
						dw bossAI__19                      ;098A21|        	|098BCD;
						dw bossAI__1a                      ;098A23|        	|098BDB;
						dw bossAI__1b                      ;098A25|        	|098BE5;
						dw bossAI__1c                      ;098A27|        	|098BED;
						dw bossAI__1d                      ;098A29|        	|098C05;
						dw bossAI__1e                      ;098A2B|        	|098C0B;
						dw bossAI__1f                      ;098A2D|        	|098C15;
						dw bossAI__20                      ;098A2F|        	|098C1F;
						dw bossAI__21                      ;098A31|        	|098C33;
						dw bossAI__22                      ;098A33|        	|098C39;
						dw bossAI__23                      ;098A35|        	|098C3B;
						dw bossAI__24                      ;098A37|        	|098C4D;
						dw bossAI__25                      ;098A39|        	|098C69;
						dw bossAI__26                      ;098A3B|        	|098C5B;
						dw bossAI__27                      ;098A3D|        	|098C89;
						dw bossAI__28                      ;098A3F|        	|098C97;
						dw bossAI__29                      ;098A41|        	|098CB5;
						dw bossAI__2a                      ;098A43|        	|098CCD;
						dw bossAI__2b                      ;098A45|        	|098CE5;
						dw bossAI__2c                      ;098A47|        	|098CEB;
						dw bossAI__2d                      ;098A49|        	|098D03;
						dw bossAI__2e                      ;098A4B|        	|098D1B;
						dw bossAI__2f                      ;098A4D|        	|098D21;
						dw bossAI__30                      ;098A4F|        	|098D69;
						dw bossAI__31                      ;098A51|        	|098D85;
						dw bossAI__32                      ;098A53|        	|098DA1;
						dw bossAI__33                      ;098A55|        	|098DAD;
						dw bossAI__34                      ;098A57|        	|098DB5;
						dw bossAI__35                      ;098A59|        	|098DBB;
						dw bossAI__36                      ;098A5B|        	|098DC1;
						dw bossAI__37                      ;098A5D|        	|098DC7;
						dw bossAI__38                      ;098A5F|        	|098DEB;
						dw bossAI__39                      ;098A61|        	|098E09;
						dw bossAI__3a                      ;098A63|        	|098E0F;
						dw bossAI__3b                      ;098A65|        	|098E21;
						dw bossAI__3c                      ;098A67|        	|098E2B;
						dw bossAI__3d                      ;098A69|        	|098E33;
						dw bossAI__3e                      ;098A6B|        	|098E49;
						dw bossAI__3f                      ;098A6D|        	|098E57;
						dw bossAI__40                      ;098A6F|        	|098E5D;
						dw bossAI__41                      ;098A71|        	|098E63;
						dw bossAI__42                      ;098A73|        	|098E77;
						dw bossAI__43                      ;098A75|        	|098E89;
						dw bossAI__44                      ;098A77|        	|098E8F;
						dw bossAI__45                      ;098A79|        	|098EA1;
						dw bossAI__46                      ;098A7B|        	|098EAB;
						dw bossAI__47                      ;098A7D|        	|098EB1;
						dw bossAI__48                      ;098A7F|        	|098EB7;
						dw bossAI__49                      ;098A81|        	|098EBD;
						dw bossAI__4a                      ;098A83|        	|098ED7;
						dw bossAI__4e                      ;098A85|        	|098EF5;
						dw bossAI__4c                      ;098A87|        	|098EFB;
						dw bossAI__4d                      ;098A89|        	|098F27;
						dw bossAI__4e                      ;098A8B|        	|098EF5;
						dw bossAI__4f                      ;098A8D|        	|098F4F;
						dw bossAI__50                      ;098A8F|        	|098F53;
						dw bossAI__51                      ;098A91|        	|098F57;
						dw bossAI__52                      ;098A93|        	|098F67;
						dw bossAI__53                      ;098A95|        	|098F83;
						dw bossAI__54                      ;098A97|        	|098FD3;
						dw bossAI__55                      ;098A99|        	|099011;
						dw bossAI__56                      ;098A9B|        	|098BB7;
						dw bossAI__57                      ;098A9D|        	|099015;
						dw bossAI__58                      ;098A9F|        	|09902D;
						dw bossAI__59                      ;098AA1|        	|099031;
						dw bossAI__5a                      ;098AA3|        	|099049;
						dw bossAI__5b                      ;098AA5|        	|098D37;
						dw bossAI__5c                      ;098AA7|        	|098D4D;
						dw bossAI__5d                      ;098AA9|        	|09904D;
						dw bossAI__5e                      ;098AAB|        	|09905B;
						dw bossAI__5f                      ;098AAD|        	|09905F;
						dw bossAI__60                      ;098AAF|        	|09907B;
						dw bossAI__62                      ;098AB1|        	|099095;
						dw bossAI__62                      ;098AB3|        	|099095;
						dw bossAI__63                      ;098AB5|        	|0990A1;
						dw bossAI__64                      ;098AB7|        	|098E53;
						dw bossAI__65                      ;098AB9|        	|098ABB;


;							+-------------------------------- bossState IDX  			=> bossState
;							|	+---------------------------- getBoss_entity_AI_IDX  	=> boss_entity_AI_IDX
;							|	|			
			bossAI__65:
						db $4A,$01                           ;098ABB|        |      ;	
			bossAI__01:
						db $0B,$0F                           ;098ABD|        |      ;
						db $05,$01                           ;098ABF|        |      ;
						db $0C,$02                           ;098AC1|        |      ;
						db $0D,$0F                           ;098AC3|        |      ;
						db $05,$01                           ;098AC5|        |      ;
						db $0C,$02                           ;098AC7|        |      ;
						db $0D,$0F                           ;098AC9|        |      ;
						db $05,$01                           ;098ACB|        |      ;
						db $0C,$02                           ;098ACD|        |      ;
						db $0D,$0F                           ;098ACF|        |      ;
						db $05,$01                           ;098AD1|        |      ;
						db $1C,$01                           ;098AD3|        |      ;
	
			bossAI__02:
						db $01,$03                           ;098AD5|        |      ;
						db $02,$03                           ;098AD7|        |      ;
						db $28,$67                           ;098AD9|        |      ;
						db $0B,$0F                           ;098ADB|        |      ;
						db $05,$01                           ;098ADD|        |      ;
						db $04,$01                           ;098ADF|        |      ;
	
			bossAI__03:
						db $00,$04                           ;098AE1|        |      ;
						db $05,$01                           ;098AE3|        |      ;
						db $06,$01                           ;098AE5|        |      ;
						db $00,$04                           ;098AE7|        |      ;
						db $07,$05                           ;098AE9|        |      ;
	
			bossAI__04:
						db $08,$06                           ;098AEB|        |      ;
						db $05,$01                           ;098AED|        |      ;
						db $06,$01                           ;098AEF|        |      ;
						db $03,$01                           ;098AF1|        |      ;
	
			bossAI__05:
						db $00,$04                           ;098AF3|        |      ;
						db $05,$01                           ;098AF5|        |      ;
						db $06,$01                           ;098AF7|        |      ;
						db $00,$04                           ;098AF9|        |      ;
						db $09,$07                           ;098AFB|        |      ;
	
			bossAI__06:
						db $08,$08                           ;098AFD|        |      ;
						db $05,$01                           ;098AFF|        |      ;
						db $04,$01                           ;098B01|        |      ;
	
			bossAI__07:
						db $41,$09                           ;098B03|        |      ;
						db $42,$22                           ;098B05|        |      ;
						db $05,$01                           ;098B07|        |      ;
						db $03,$01                           ;098B09|        |      ;
	
			bossAI__08:
						db $0E,$01                           ;098B0B|        |      ;
						db $02,$0A                           ;098B0D|        |      ;
						db $04,$01                           ;098B0F|        |      ;
	
			bossAI__09:
						db $0B,$0B                           ;098B11|        |      ;
						db $05,$01                           ;098B13|        |      ;
						db $04,$01                           ;098B15|        |      ;
	
			bossAI__0a:
						db $0B,$0D                           ;098B17|        |      ;
						db $05,$01                           ;098B19|        |      ;
						db $0C,$01                           ;098B1B|        |      ;
						db $0D,$00                           ;098B1D|        |      ;
						db $05,$01                           ;098B1F|        |      ;
						db $0C,$0B                           ;098B21|        |      ;
						db $0D,$0E                           ;098B23|        |      ;
						db $05,$01                           ;098B25|        |      ;
						db $0C,$6D                           ;098B27|        |      ;
						db $04,$01                           ;098B29|        |      ;
	
			bossAI__0b:
						db $01,$04                           ;098B2B|        |      ;
						db $02,$04                           ;098B2D|        |      ;
						db $04,$01                           ;098B2F|        |      ;
	
			bossAI__0c:
						db $0F,$10                           ;098B31|        |      ;
						db $05,$01                           ;098B33|        |      ;
						db $04,$01                           ;098B35|        |      ;
	
			bossAI__0d:
						db $00,$11                           ;098B37|        |      ;
						db $05,$01                           ;098B39|        |      ;
						db $03,$01                           ;098B3B|        |      ;
	
			bossAI__0e:
						db $0B,$76                           ;098B3D|        |      ;
						db $05,$01                           ;098B3F|        |      ;
						db $3A,$13                           ;098B41|        |      ;
						db $0C,$01                           ;098B43|        |      ;
						db $0D,$14                           ;098B45|        |      ;
						db $05,$01                           ;098B47|        |      ;
						db $04,$01                           ;098B49|        |      ;
	
			bossAI__11:
						db $0B,$15                           ;098B4B|        |      ;
						db $3F,$16                           ;098B4D|        |      ;
						db $0B,$15                           ;098B4F|        |      ;
						db $39,$01                           ;098B51|        |      ;
						db $05,$01                           ;098B53|        |      ;
						db $3E,$01                           ;098B55|        |      ;
						db $0D,$17                           ;098B57|        |      ;
						db $05,$01                           ;098B59|        |      ;
						db $3C,$15                           ;098B5B|        |      ;
						db $39,$01                           ;098B5D|        |      ;
						db $3B,$15                           ;098B5F|        |      ;
						db $0D,$0D                           ;098B61|        |      ;
						db $05,$01                           ;098B63|        |      ;
						db $3E,$01                           ;098B65|        |      ;
						db $0D,$15                           ;098B67|        |      ;
						db $05,$01                           ;098B69|        |      ;
						db $3D,$18                           ;098B6B|        |      ;
						db $3B,$01                           ;098B6D|        |      ;
						db $04,$01                           ;098B6F|        |      ;
	
			bossAI__10:
						db $0B,$19                           ;098B71|        |      ;
						db $05,$01                           ;098B73|        |      ;
						db $00,$1A                           ;098B75|        |      ;
						db $05,$01                           ;098B77|        |      ;
						db $40,$1B                           ;098B79|        |      ;
	
			bossAI__0f:
						db $0D,$19                           ;098B7B|        |      ;
						db $05,$01                           ;098B7D|        |      ;
						db $3F,$1C                           ;098B7F|        |      ;
						db $11,$01                           ;098B81|        |      ;
						db $12,$15                           ;098B83|        |      ;
						db $3F,$16                           ;098B85|        |      ;
						db $0B,$0D                           ;098B87|        |      ;
						db $05,$01                           ;098B89|        |      ;
						db $04,$01                           ;098B8B|        |      ;
	
			bossAI__12:
						db $17,$1D                           ;098B8D|        |      ;
						db $16,$01                           ;098B8F|        |      ;
						db $05,$01                           ;098B91|        |      ;
						db $17,$1E                           ;098B93|        |      ;
						db $16,$0B                           ;098B95|        |      ;
						db $05,$01                           ;098B97|        |      ;
						db $03,$01                           ;098B99|        |      ;
	
			bossAI__14:
						db $0B,$0F                           ;098B9B|        |      ;
						db $05,$01                           ;098B9D|        |      ;
						db $14,$01                           ;098B9F|        |      ;
						db $01,$1F                           ;098BA1|        |      ;
						db $02,$1F                           ;098BA3|        |      ;
						db $04,$01                           ;098BA5|        |      ;
	
			bossAI__15:
						db $0E,$01                           ;098BA7|        |      ;
						db $02,$0A                           ;098BA9|        |      ;
						db $04,$01                           ;098BAB|        |      ;
	
			bossAI__13:
						db $15,$20                           ;098BAD|        |      ;
	
			bossAI__16:
						db $0B,$0B                           ;098BAF|        |      ;
						db $05,$01                           ;098BB1|        |      ;
						db $00,$21                           ;098BB3|        |      ;
						db $21,$01                           ;098BB5|        |      ;
	
			bossAI__56:
						db $05,$01                           ;098BB7|        |      ;
	
			bossAI__17:
						db $0E,$01                           ;098BB9|        |      ;
						db $18,$03                           ;098BBB|        |      ;
						db $21,$01                           ;098BBD|        |      ;
	
			bossAI__18:
						db $19,$17                           ;098BBF|        |      ;
						db $08,$22                           ;098BC1|        |      ;
						db $05,$01                           ;098BC3|        |      ;
						db $03,$01                           ;098BC5|        |      ;
						db $08,$22                           ;098BC7|        |      ;
						db $05,$01                           ;098BC9|        |      ;
						db $1C,$01                           ;098BCB|        |      ;
	
			bossAI__19:
						db $1A,$17                           ;098BCD|        |      ;
						db $08,$22                           ;098BCF|        |      ;
						db $05,$01                           ;098BD1|        |      ;
						db $03,$01                           ;098BD3|        |      ;
						db $08,$23                           ;098BD5|        |      ;
						db $05,$01                           ;098BD7|        |      ;
						db $1C,$01                           ;098BD9|        |      ;
	
			bossAI__1a:
						db $1D,$17                           ;098BDB|        |      ;
						db $08,$22                           ;098BDD|        |      ;
						db $05,$01                           ;098BDF|        |      ;
						db $03,$01                           ;098BE1|        |      ;
						db $1E,$24                           ;098BE3|        |      ;
	
			bossAI__1b:
						db $1F,$17                           ;098BE5|        |      ;
						db $08,$22                           ;098BE7|        |      ;
						db $05,$01                           ;098BE9|        |      ;
						db $03,$01                           ;098BEB|        |      ;
	
			bossAI__1c:
						db $0B,$0F                           ;098BED|        |      ;
						db $05,$01                           ;098BEF|        |      ;
						db $0C,$01                           ;098BF1|        |      ;
						db $0D,$0F                           ;098BF3|        |      ;
						db $05,$01                           ;098BF5|        |      ;
						db $0C,$01                           ;098BF7|        |      ;
						db $0D,$0E                           ;098BF9|        |      ;
						db $05,$01                           ;098BFB|        |      ;
						db $20,$25                           ;098BFD|        |      ;
						db $0D,$0E                           ;098BFF|        |      ;
						db $05,$01                           ;098C01|        |      ;
						db $04,$01                           ;098C03|        |      ;
	
			bossAI__1d:
						db $08,$6E                           ;098C05|        |      ;
						db $05,$01                           ;098C07|        |      ;
						db $03,$01                           ;098C09|        |      ;
	
			bossAI__1e:
						db $1D,$26                           ;098C0B|        |      ;
						db $08,$22                           ;098C0D|        |      ;
						db $05,$01                           ;098C0F|        |      ;
						db $03,$01                           ;098C11|        |      ;
						db $1E,$24                           ;098C13|        |      ;
	
			bossAI__1f:
						db $1D,$26                           ;098C15|        |      ;
						db $08,$22                           ;098C17|        |      ;
						db $05,$01                           ;098C19|        |      ;
						db $03,$01                           ;098C1B|        |      ;
						db $04,$01                           ;098C1D|        |      ;
	
			bossAI__20:
						db $0B,$17                           ;098C1F|        |      ;
						db $05,$01                           ;098C21|        |      ;
						db $0C,$01                           ;098C23|        |      ;
						db $0D,$17                           ;098C25|        |      ;
						db $05,$01                           ;098C27|        |      ;
						db $0C,$01                           ;098C29|        |      ;
						db $0D,$27                           ;098C2B|        |      ;
						db $05,$01                           ;098C2D|        |      ;
						db $0C,$01                           ;098C2F|        |      ;
						db $04,$01                           ;098C31|        |      ;
	
			bossAI__21:
						db $0E,$01                           ;098C33|        |      ;
						db $18,$0A                           ;098C35|        |      ;
						db $15,$28                           ;098C37|        |      ;
	
			bossAI__22:
						db $21,$01                           ;098C39|        |      ;
	
			bossAI__23:
						db $0B,$0F                           ;098C3B|        |      ;
						db $05,$01                           ;098C3D|        |      ;
						db $0C,$01                           ;098C3F|        |      ;
						db $0D,$0F                           ;098C41|        |      ;
						db $05,$01                           ;098C43|        |      ;
						db $0C,$01                           ;098C45|        |      ;
						db $0D,$0F                           ;098C47|        |      ;
						db $05,$01                           ;098C49|        |      ;
						db $15,$28                           ;098C4B|        |      ;
	
			bossAI__24:
						db $1A,$29                           ;098C4D|        |      ;
						db $23,$2A                           ;098C4F|        |      ;
						db $05,$01                           ;098C51|        |      ;
						db $03,$01                           ;098C53|        |      ;
						db $24,$2A                           ;098C55|        |      ;
						db $05,$01                           ;098C57|        |      ;
						db $1C,$01                           ;098C59|        |      ;
	
			bossAI__26:
						db $19,$29                           ;098C5B|        |      ;
						db $23,$22                           ;098C5D|        |      ;
						db $05,$01                           ;098C5F|        |      ;
						db $03,$01                           ;098C61|        |      ;
						db $23,$22                           ;098C63|        |      ;
						db $05,$01                           ;098C65|        |      ;
						db $1C,$01                           ;098C67|        |      ;
	
			bossAI__25:
						db $0B,$2B                           ;098C69|        |      ;
						db $05,$01                           ;098C6B|        |      ;
						db $0C,$01                           ;098C6D|        |      ;
						db $0D,$2B                           ;098C6F|        |      ;
						db $05,$01                           ;098C71|        |      ;
						db $0C,$01                           ;098C73|        |      ;
						db $0D,$2B                           ;098C75|        |      ;
						db $05,$01                           ;098C77|        |      ;
						db $0C,$01                           ;098C79|        |      ;
						db $0D,$2B                           ;098C7B|        |      ;
						db $05,$01                           ;098C7D|        |      ;
						db $0C,$01                           ;098C7F|        |      ;
						db $0D,$2B                           ;098C81|        |      ;
						db $05,$01                           ;098C83|        |      ;
						db $0C,$01                           ;098C85|        |      ;
						db $04,$01                           ;098C87|        |      ;
	
			bossAI__27:
						db $0B,$2C                           ;098C89|        |      ;
						db $25,$01                           ;098C8B|        |      ;
						db $05,$01                           ;098C8D|        |      ;
						db $0C,$01                           ;098C8F|        |      ;
						db $0D,$0F                           ;098C91|        |      ;
						db $05,$01                           ;098C93|        |      ;
						db $04,$01                           ;098C95|        |      ;
	
			bossAI__28:
						db $0B,$0F                           ;098C97|        |      ;
						db $05,$01                           ;098C99|        |      ;
						db $0C,$01                           ;098C9B|        |      ;
						db $0D,$0F                           ;098C9D|        |      ;
						db $05,$01                           ;098C9F|        |      ;
						db $0C,$01                           ;098CA1|        |      ;
						db $3A,$2D                           ;098CA3|        |      ;
						db $0D,$0F                           ;098CA5|        |      ;
						db $05,$01                           ;098CA7|        |      ;
						db $0D,$12                           ;098CA9|        |      ;
						db $26,$01                           ;098CAB|        |      ;
						db $20,$2E                           ;098CAD|        |      ;
						db $0D,$12                           ;098CAF|        |      ;
						db $26,$01                           ;098CB1|        |      ;
						db $04,$01                           ;098CB3|        |      ;
	
			bossAI__29:
						db $0B,$0B                           ;098CB5|        |      ;
						db $05,$01                           ;098CB7|        |      ;
						db $0C,$01                           ;098CB9|        |      ;
						db $3A,$2D                           ;098CBB|        |      ;
						db $0D,$2B                           ;098CBD|        |      ;
						db $05,$01                           ;098CBF|        |      ;
						db $0D,$12                           ;098CC1|        |      ;
						db $26,$0D                           ;098CC3|        |      ;
						db $20,$2F                           ;098CC5|        |      ;
						db $0D,$12                           ;098CC7|        |      ;
						db $26,$0D                           ;098CC9|        |      ;
						db $04,$01                           ;098CCB|        |      ;
	
			bossAI__2a:
						db $0B,$0B                           ;098CCD|        |      ;
						db $05,$01                           ;098CCF|        |      ;
						db $0C,$0F                           ;098CD1|        |      ;
						db $0D,$0B                           ;098CD3|        |      ;
						db $05,$01                           ;098CD5|        |      ;
						db $0C,$0F                           ;098CD7|        |      ;
						db $0D,$0B                           ;098CD9|        |      ;
						db $05,$01                           ;098CDB|        |      ;
						db $0C,$0F                           ;098CDD|        |      ;
						db $0D,$0B                           ;098CDF|        |      ;
						db $05,$01                           ;098CE1|        |      ;
						db $1C,$01                           ;098CE3|        |      ;
	
			bossAI__2b:
						db $0B,$0B                           ;098CE5|        |      ;
						db $05,$01                           ;098CE7|        |      ;
						db $04,$01                           ;098CE9|        |      ;
	
			bossAI__2c:
						db $2A,$0D                           ;098CEB|        |      ;
						db $2A,$0D                           ;098CED|        |      ;
						db $2A,$0D                           ;098CEF|        |      ;
						db $0E,$30                           ;098CF1|        |      ;
						db $18,$0A                           ;098CF3|        |      ;
						db $28,$31                           ;098CF5|        |      ;
						db $0B,$0F                           ;098CF7|        |      ;
						db $05,$01                           ;098CF9|        |      ;
						db $0C,$01                           ;098CFB|        |      ;
						db $0D,$0F                           ;098CFD|        |      ;
						db $05,$01                           ;098CFF|        |      ;
						db $29,$01                           ;098D01|        |      ;
	
			bossAI__2d:
						db $27,$01                           ;098D03|        |      ;
						db $05,$01                           ;098D05|        |      ;
						db $2B,$01                           ;098D07|        |      ;
						db $0E,$32                           ;098D09|        |      ;
						db $18,$0A                           ;098D0B|        |      ;
						db $28,$31                           ;098D0D|        |      ;
						db $0B,$0F                           ;098D0F|        |      ;
						db $05,$01                           ;098D11|        |      ;
						db $0C,$01                           ;098D13|        |      ;
						db $0D,$0F                           ;098D15|        |      ;
						db $05,$01                           ;098D17|        |      ;
						db $29,$01                           ;098D19|        |      ;
	
			bossAI__2e:
						db $0B,$19                           ;098D1B|        |      ;
						db $05,$01                           ;098D1D|        |      ;
						db $04,$01                           ;098D1F|        |      ;
	
			bossAI__2f:
						db $0B,$14                           ;098D21|        |      ;
						db $05,$01                           ;098D23|        |      ;
						db $20,$33                           ;098D25|        |      ;
						db $0D,$14                           ;098D27|        |      ;
						db $05,$01                           ;098D29|        |      ;
						db $0C,$01                           ;098D2B|        |      ;
						db $2E,$0F                           ;098D2D|        |      ;
						db $00,$34                           ;098D2F|        |      ;
						db $2C,$01                           ;098D31|        |      ;
						db $05,$01                           ;098D33|        |      ;
						db $29,$01                           ;098D35|        |      ;
	
			bossAI__5b:
						db $0B,$14                           ;098D37|        |      ;
						db $05,$01                           ;098D39|        |      ;
						db $20,$35                           ;098D3B|        |      ;
						db $0D,$14                           ;098D3D|        |      ;
						db $05,$01                           ;098D3F|        |      ;
						db $0C,$01                           ;098D41|        |      ;
						db $2E,$0F                           ;098D43|        |      ;
						db $00,$34                           ;098D45|        |      ;
						db $2C,$01                           ;098D47|        |      ;
						db $05,$01                           ;098D49|        |      ;
						db $29,$01                           ;098D4B|        |      ;
	
			bossAI__5c:
						db $48,$36                           ;098D4D|        |      ;
						db $05,$01                           ;098D4F|        |      ;
						db $48,$37                           ;098D51|        |      ;
						db $05,$01                           ;098D53|        |      ;
						db $48,$38                           ;098D55|        |      ;
						db $05,$01                           ;098D57|        |      ;
						db $0B,$39                           ;098D59|        |      ;
						db $05,$01                           ;098D5B|        |      ;
						db $2F,$01                           ;098D5D|        |      ;
						db $05,$01                           ;098D5F|        |      ;
						db $30,$01                           ;098D61|        |      ;
						db $0D,$0B                           ;098D63|        |      ;
						db $05,$01                           ;098D65|        |      ;
						db $31,$01                           ;098D67|        |      ;
	
			bossAI__30:
						db $2D,$36                           ;098D69|        |      ;
						db $05,$01                           ;098D6B|        |      ;
						db $2D,$37                           ;098D6D|        |      ;
						db $05,$01                           ;098D6F|        |      ;
						db $2D,$38                           ;098D71|        |      ;
						db $05,$01                           ;098D73|        |      ;
						db $0B,$39                           ;098D75|        |      ;
						db $05,$01                           ;098D77|        |      ;
						db $2F,$01                           ;098D79|        |      ;
						db $05,$01                           ;098D7B|        |      ;
						db $30,$01                           ;098D7D|        |      ;
						db $0D,$0B                           ;098D7F|        |      ;
						db $05,$01                           ;098D81|        |      ;
						db $31,$01                           ;098D83|        |      ;
	
			bossAI__31:
						db $0B,$0F                           ;098D85|        |      ;
						db $05,$01                           ;098D87|        |      ;
						db $0C,$01                           ;098D89|        |      ;
						db $0D,$0F                           ;098D8B|        |      ;
						db $05,$01                           ;098D8D|        |      ;
						db $0C,$01                           ;098D8F|        |      ;
						db $0D,$12                           ;098D91|        |      ;
						db $05,$01                           ;098D93|        |      ;
						db $0B,$14                           ;098D95|        |      ;
						db $05,$01                           ;098D97|        |      ;
						db $20,$33                           ;098D99|        |      ;
						db $0D,$0B                           ;098D9B|        |      ;
						db $05,$01                           ;098D9D|        |      ;
						db $29,$01                           ;098D9F|        |      ;
	
			bossAI__32:
						db $0B,$0F                           ;098DA1|        |      ;
						db $05,$01                           ;098DA3|        |      ;
						db $28,$3A                           ;098DA5|        |      ;
						db $0D,$14                           ;098DA7|        |      ;
						db $05,$01                           ;098DA9|        |      ;
						db $29,$01                           ;098DAB|        |      ;
	
			bossAI__33:
						db $32,$01                           ;098DAD|        |      ;
						db $22,$3B                           ;098DAF|        |      ;
						db $05,$01                           ;098DB1|        |      ;
						db $29,$01                           ;098DB3|        |      ;
	
			bossAI__34:
						db $0E,$32                           ;098DB5|        |      ;
						db $18,$0A                           ;098DB7|        |      ;
						db $29,$01                           ;098DB9|        |      ;
	
			bossAI__35:
						db $0E,$32                           ;098DBB|        |      ;
						db $18,$0A                           ;098DBD|        |      ;
						db $15,$3C                           ;098DBF|        |      ;
	
			bossAI__36:
						db $0E,$32                           ;098DC1|        |      ;
						db $18,$0A                           ;098DC3|        |      ;
						db $15,$3C                           ;098DC5|        |      ;
	
			bossAI__37:
						db $33,$3D                           ;098DC7|        |      ;
						db $28,$3E                           ;098DC9|        |      ;
						db $0B,$2B                           ;098DCB|        |      ;
						db $05,$01                           ;098DCD|        |      ;
						db $0C,$01                           ;098DCF|        |      ;
						db $0D,$2B                           ;098DD1|        |      ;
						db $05,$01                           ;098DD3|        |      ;
						db $0C,$01                           ;098DD5|        |      ;
						db $0D,$2B                           ;098DD7|        |      ;
						db $05,$01                           ;098DD9|        |      ;
						db $0C,$01                           ;098DDB|        |      ;
						db $0D,$2B                           ;098DDD|        |      ;
						db $05,$01                           ;098DDF|        |      ;
						db $0C,$01                           ;098DE1|        |      ;
						db $0D,$2B                           ;098DE3|        |      ;
						db $05,$01                           ;098DE5|        |      ;
						db $0C,$01                           ;098DE7|        |      ;
						db $21,$01                           ;098DE9|        |      ;
	
			bossAI__38:
						db $0B,$12                           ;098DEB|        |      ;
						db $05,$01                           ;098DED|        |      ;
						db $0C,$01                           ;098DEF|        |      ;
						db $0D,$00                           ;098DF1|        |      ;
						db $05,$01                           ;098DF3|        |      ;
						db $0C,$01                           ;098DF5|        |      ;
						db $0D,$00                           ;098DF7|        |      ;
						db $05,$01                           ;098DF9|        |      ;
						db $0C,$01                           ;098DFB|        |      ;
						db $0D,$00                           ;098DFD|        |      ;
						db $05,$01                           ;098DFF|        |      ;
						db $0C,$3F                           ;098E01|        |      ;
						db $0D,$17                           ;098E03|        |      ;
						db $05,$01                           ;098E05|        |      ;
						db $21,$01                           ;098E07|        |      ;
	
			bossAI__39:
						db $0B,$14                           ;098E09|        |      ;
						db $05,$01                           ;098E0B|        |      ;
						db $04,$01                           ;098E0D|        |      ;
	
			bossAI__3a:
						db $0B,$0B                           ;098E0F|        |      ;
						db $05,$01                           ;098E11|        |      ;
						db $0C,$01                           ;098E13|        |      ;
						db $0D,$0F                           ;098E15|        |      ;
						db $05,$01                           ;098E17|        |      ;
						db $0C,$01                           ;098E19|        |      ;
						db $0D,$0B                           ;098E1B|        |      ;
						db $05,$01                           ;098E1D|        |      ;
						db $04,$01                           ;098E1F|        |      ;
	
			bossAI__3b:
						db $0B,$12                           ;098E21|        |      ;
						db $05,$01                           ;098E23|        |      ;
						db $00,$40                           ;098E25|        |      ;
						db $05,$01                           ;098E27|        |      ;
						db $04,$01                           ;098E29|        |      ;
	
			bossAI__3c:
						db $00,$41                           ;098E2B|        |      ;
						db $05,$01                           ;098E2D|        |      ;
						db $38,$01                           ;098E2F|        |      ;
						db $03,$01                           ;098E31|        |      ;
	
			bossAI__3d:
						db $05,$01                           ;098E33|        |      ;
						db $22,$72                           ;098E35|        |      ;
						db $0D,$0B                           ;098E37|        |      ;
						db $05,$01                           ;098E39|        |      ;
						db $0C,$01                           ;098E3B|        |      ;
						db $0D,$0B                           ;098E3D|        |      ;
						db $05,$01                           ;098E3F|        |      ;
						db $0C,$01                           ;098E41|        |      ;
						db $0D,$0F                           ;098E43|        |      ;
						db $05,$01                           ;098E45|        |      ;
						db $21,$01                           ;098E47|        |      ;
	
			bossAI__3e:
						db $0B,$42                           ;098E49|        |      ;
						db $05,$01                           ;098E4B|        |      ;
						db $3A,$43                           ;098E4D|        |      ;
						db $22,$6F                           ;098E4F|        |      ;
						db $21,$01                           ;098E51|        |      ;
	
			bossAI__64:
						db $22,$23                           ;098E53|        |      ;
						db $49,$0B                           ;098E55|        |      ;
	
			bossAI__3f:
						db $00,$44                           ;098E57|        |      ;
						db $05,$01                           ;098E59|        |      ;
						db $04,$01                           ;098E5B|        |      ;
	
			bossAI__40:
						db $00,$45                           ;098E5D|        |      ;
						db $05,$01                           ;098E5F|        |      ;
						db $04,$01                           ;098E61|        |      ;
	
			bossAI__41:
						db $35,$01                           ;098E63|        |      ;
						db $34,$0E                           ;098E65|        |      ;
						db $0D,$0B                           ;098E67|        |      ;
						db $05,$01                           ;098E69|        |      ;
						db $0C,$01                           ;098E6B|        |      ;
						db $0D,$0F                           ;098E6D|        |      ;
						db $05,$01                           ;098E6F|        |      ;
						db $36,$01                           ;098E71|        |      ;
						db $28,$46                           ;098E73|        |      ;
						db $15,$14                           ;098E75|        |      ;
	
			bossAI__42:
						db $35,$01                           ;098E77|        |      ;
						db $0D,$12                           ;098E79|        |      ;
						db $05,$01                           ;098E7B|        |      ;
						db $34,$47                           ;098E7D|        |      ;
						db $0D,$0F                           ;098E7F|        |      ;
						db $05,$01                           ;098E81|        |      ;
						db $36,$01                           ;098E83|        |      ;
						db $28,$48                           ;098E85|        |      ;
						db $15,$20                           ;098E87|        |      ;
	
			bossAI__43:
						db $0E,$49                           ;098E89|        |      ;
						db $02,$0A                           ;098E8B|        |      ;
						db $04,$01                           ;098E8D|        |      ;
	
			bossAI__44:
						db $0B,$14                           ;098E8F|        |      ;
						db $05,$01                           ;098E91|        |      ;
						db $0C,$01                           ;098E93|        |      ;
						db $0D,$0F                           ;098E95|        |      ;
						db $05,$01                           ;098E97|        |      ;
						db $0C,$01                           ;098E99|        |      ;
						db $0D,$0F                           ;098E9B|        |      ;
						db $05,$01                           ;098E9D|        |      ;
						db $21,$01                           ;098E9F|        |      ;
	
			bossAI__45:
						db $05,$01                           ;098EA1|        |      ;
						db $39,$01                           ;098EA3|        |      ;
						db $08,$4A                           ;098EA5|        |      ;
						db $05,$01                           ;098EA7|        |      ;
						db $21,$01                           ;098EA9|        |      ;
	
			bossAI__46:
						db $0D,$0C                           ;098EAB|        |      ;
						db $05,$01                           ;098EAD|        |      ;
						db $21,$01                           ;098EAF|        |      ;
	
			bossAI__47:
						db $22,$2A                           ;098EB1|        |      ;
						db $05,$01                           ;098EB3|        |      ;
						db $21,$01                           ;098EB5|        |      ;
	
			bossAI__48:
						db $0B,$12                           ;098EB7|        |      ;
						db $05,$01                           ;098EB9|        |      ;
						db $21,$01                           ;098EBB|        |      ;
	
			bossAI__49:
						db $43,$4B                           ;098EBD|        |      ;
						db $23,$22                           ;098EBF|        |      ;
						db $05,$01                           ;098EC1|        |      ;
						db $03,$01                           ;098EC3|        |      ;
						db $23,$4A                           ;098EC5|        |      ;
						db $05,$01                           ;098EC7|        |      ;
						db $43,$4C                           ;098EC9|        |      ;
						db $23,$22                           ;098ECB|        |      ;
						db $05,$01                           ;098ECD|        |      ;
						db $47,$4D                           ;098ECF|        |      ;
						db $23,$22                           ;098ED1|        |      ;
						db $05,$01                           ;098ED3|        |      ;
						db $47,$4E                           ;098ED5|        |      ;
	
			bossAI__4a:
						db $0B,$0F                           ;098ED7|        |      ;
						db $05,$01                           ;098ED9|        |      ;
						db $0C,$01                           ;098EDB|        |      ;
						db $0D,$0F                           ;098EDD|        |      ;
						db $05,$01                           ;098EDF|        |      ;
						db $0C,$01                           ;098EE1|        |      ;
						db $0D,$0F                           ;098EE3|        |      ;
						db $05,$01                           ;098EE5|        |      ;
						db $0C,$01                           ;098EE7|        |      ;
						db $0D,$0F                           ;098EE9|        |      ;
						db $05,$01                           ;098EEB|        |      ;
						db $0C,$01                           ;098EED|        |      ;
						db $0D,$0F                           ;098EEF|        |      ;
						db $05,$01                           ;098EF1|        |      ;
						db $04,$01                           ;098EF3|        |      ;
	
			bossAI__4e:
						db $0B,$12                           ;098EF5|        |      ;
						db $05,$01                           ;098EF7|        |      ;
						db $04,$01                           ;098EF9|        |      ;
	
			bossAI__4c:
						db $0B,$0F                           ;098EFB|        |      ;
						db $05,$01                           ;098EFD|        |      ;
						db $0C,$01                           ;098EFF|        |      ;
						db $0D,$0F                           ;098F01|        |      ;
						db $05,$01                           ;098F03|        |      ;
						db $0C,$01                           ;098F05|        |      ;
						db $01,$4F                           ;098F07|        |      ;
						db $44,$4F                           ;098F09|        |      ;
						db $28,$50                           ;098F0B|        |      ;
						db $0D,$15                           ;098F0D|        |      ;
						db $05,$01                           ;098F0F|        |      ;
						db $0C,$01                           ;098F11|        |      ;
						db $0D,$15                           ;098F13|        |      ;
						db $05,$01                           ;098F15|        |      ;
						db $28,$51                           ;098F17|        |      ;
						db $0E,$27                           ;098F19|        |      ;
						db $18,$4F                           ;098F1B|        |      ;
						db $0C,$01                           ;098F1D|        |      ;
						db $0D,$12                           ;098F1F|        |      ;
						db $26,$01                           ;098F21|        |      ;
						db $0C,$01                           ;098F23|        |      ;
						db $04,$01                           ;098F25|        |      ;
	
			bossAI__4d:
						db $0B,$0F                           ;098F27|        |      ;
						db $05,$01                           ;098F29|        |      ;
						db $0C,$01                           ;098F2B|        |      ;
						db $0D,$0F                           ;098F2D|        |      ;
						db $05,$01                           ;098F2F|        |      ;
						db $0C,$01                           ;098F31|        |      ;
						db $01,$4F                           ;098F33|        |      ;
						db $44,$4F                           ;098F35|        |      ;
						db $28,$52                           ;098F37|        |      ;
						db $00,$53                           ;098F39|        |      ;
						db $0D,$19                           ;098F3B|        |      ;
						db $05,$01                           ;098F3D|        |      ;
						db $28,$51                           ;098F3F|        |      ;
						db $0E,$27                           ;098F41|        |      ;
						db $18,$4F                           ;098F43|        |      ;
						db $0C,$01                           ;098F45|        |      ;
						db $0D,$12                           ;098F47|        |      ;
						db $26,$01                           ;098F49|        |      ;
						db $0C,$01                           ;098F4B|        |      ;
						db $04,$01                           ;098F4D|        |      ;
	
			bossAI__4f:
						db $08,$70                           ;098F4F|        |      ;
						db $21,$01                           ;098F51|        |      ;
	
			bossAI__50:
						db $07,$54                           ;098F53|        |      ;
						db $03,$01                           ;098F55|        |      ;
	
			bossAI__51:
						db $46,$55                           ;098F57|        |      ;
						db $0B,$75                           ;098F59|        |      ;
						db $05,$01                           ;098F5B|        |      ;
						db $46,$5C                           ;098F5D|        |      ;
						db $0D,$75                           ;098F5F|        |      ;
						db $05,$01                           ;098F61|        |      ;
						db $46,$5C                           ;098F63|        |      ;
						db $21,$01                           ;098F65|        |      ;
	
			bossAI__52:
						db $46,$57                           ;098F67|        |      ;
						db $0B,$15                           ;098F69|        |      ;
						db $05,$01                           ;098F6B|        |      ;
						db $46,$58                           ;098F6D|        |      ;
						db $0D,$15                           ;098F6F|        |      ;
						db $05,$01                           ;098F71|        |      ;
						db $46,$58                           ;098F73|        |      ;
						db $0D,$12                           ;098F75|        |      ;
						db $05,$01                           ;098F77|        |      ;
						db $46,$59                           ;098F79|        |      ;
						db $0D,$15                           ;098F7B|        |      ;
						db $05,$01                           ;098F7D|        |      ;
						db $46,$59                           ;098F7F|        |      ;
						db $21,$01                           ;098F81|        |      ;
	
			bossAI__53:
						db $46,$5A                           ;098F83|        |      ;
						db $0B,$73                           ;098F85|        |      ;
						db $05,$01                           ;098F87|        |      ;
						db $46,$56                           ;098F89|        |      ;
						db $33,$5B                           ;098F8B|        |      ;
						db $3A,$68                           ;098F8D|        |      ;
						db $0D,$74                           ;098F8F|        |      ;
						db $05,$01                           ;098F91|        |      ;
						db $46,$56                           ;098F93|        |      ;
						db $0D,$74                           ;098F95|        |      ;
						db $05,$01                           ;098F97|        |      ;
						db $46,$5C                           ;098F99|        |      ;
						db $0D,$74                           ;098F9B|        |      ;
						db $05,$01                           ;098F9D|        |      ;
						db $33,$6B                           ;098F9F|        |      ;
						db $46,$56                           ;098FA1|        |      ;
						db $0D,$74                           ;098FA3|        |      ;
						db $05,$01                           ;098FA5|        |      ;
						db $3C,$0B                           ;098FA7|        |      ;
						db $46,$5D                           ;098FA9|        |      ;
						db $0D,$74                           ;098FAB|        |      ;
						db $05,$01                           ;098FAD|        |      ;
						db $46,$5E                           ;098FAF|        |      ;
						db $0D,$74                           ;098FB1|        |      ;
						db $05,$01                           ;098FB3|        |      ;
						db $3D,$4E                           ;098FB5|        |      ;
						db $46,$5F                           ;098FB7|        |      ;
						db $0D,$17                           ;098FB9|        |      ;
						db $05,$01                           ;098FBB|        |      ;
						db $46,$60                           ;098FBD|        |      ;
						db $33,$6C                           ;098FBF|        |      ;
						db $0D,$17                           ;098FC1|        |      ;
						db $05,$01                           ;098FC3|        |      ;
						db $46,$5F                           ;098FC5|        |      ;
						db $0D,$17                           ;098FC7|        |      ;
						db $05,$01                           ;098FC9|        |      ;
						db $46,$60                           ;098FCB|        |      ;
						db $0D,$17                           ;098FCD|        |      ;
						db $05,$01                           ;098FCF|        |      ;
						db $29,$01                           ;098FD1|        |      ;
	
			bossAI__54:
						db $46,$5A                           ;098FD3|        |      ;
						db $0D,$73                           ;098FD5|        |      ;
						db $05,$01                           ;098FD7|        |      ;
						db $46,$61                           ;098FD9|        |      ;
						db $33,$5B                           ;098FDB|        |      ;
						db $0D,$74                           ;098FDD|        |      ;
						db $05,$01                           ;098FDF|        |      ;
						db $46,$56                           ;098FE1|        |      ;
						db $0D,$74                           ;098FE3|        |      ;
						db $05,$01                           ;098FE5|        |      ;
						db $46,$56                           ;098FE7|        |      ;
						db $0D,$74                           ;098FE9|        |      ;
						db $05,$01                           ;098FEB|        |      ;
						db $3C,$0B                           ;098FED|        |      ;
						db $46,$62                           ;098FEF|        |      ;
						db $0D,$17                           ;098FF1|        |      ;
						db $05,$01                           ;098FF3|        |      ;
						db $46,$63                           ;098FF5|        |      ;
						db $0D,$17                           ;098FF7|        |      ;
						db $05,$01                           ;098FF9|        |      ;
						db $3D,$4E                           ;098FFB|        |      ;
						db $0D,$17                           ;098FFD|        |      ;
						db $05,$01                           ;098FFF|        |      ;
						db $46,$60                           ;099001|        |      ;
						db $0D,$17                           ;099003|        |      ;
						db $05,$01                           ;099005|        |      ;
						db $46,$60                           ;099007|        |      ;
						db $0D,$17                           ;099009|        |      ;
						db $05,$01                           ;09900B|        |      ;
						db $46,$60                           ;09900D|        |      ;
						db $29,$01                           ;09900F|        |      ;
	
			bossAI__55:
						db $18,$0A                           ;099011|        |      ;
						db $29,$01                           ;099013|        |      ;
	
			bossAI__57:
						db $0B,$0F                           ;099015|        |      ;
						db $05,$01                           ;099017|        |      ;
						db $0C,$02                           ;099019|        |      ;
						db $0D,$0F                           ;09901B|        |      ;
						db $05,$01                           ;09901D|        |      ;
						db $0C,$02                           ;09901F|        |      ;
						db $0D,$0F                           ;099021|        |      ;
						db $05,$01                           ;099023|        |      ;
						db $0C,$02                           ;099025|        |      ;
						db $0D,$0F                           ;099027|        |      ;
						db $05,$01                           ;099029|        |      ;
						db $1C,$01                           ;09902B|        |      ;
	
			bossAI__58:
						db $00,$1A                           ;09902D|        |      ;
						db $07,$71                           ;09902F|        |      ;
	
			bossAI__59:
						db $0B,$17                           ;099031|        |      ;
						db $05,$01                           ;099033|        |      ;
						db $0C,$01                           ;099035|        |      ;
						db $0D,$17                           ;099037|        |      ;
						db $05,$01                           ;099039|        |      ;
						db $0C,$01                           ;09903B|        |      ;
						db $0D,$17                           ;09903D|        |      ;
						db $05,$01                           ;09903F|        |      ;
						db $0C,$01                           ;099041|        |      ;
						db $0D,$17                           ;099043|        |      ;
						db $05,$01                           ;099045|        |      ;
						db $21,$01                           ;099047|        |      ;
	
			bossAI__5a:
						db $22,$22                           ;099049|        |      ;
						db $21,$01                           ;09904B|        |      ;
	
			bossAI__5d:
						db $18,$0A                           ;09904D|        |      ;
						db $0B,$0F                           ;09904F|        |      ;
						db $05,$01                           ;099051|        |      ;
						db $28,$6A                           ;099053|        |      ;
						db $0D,$14                           ;099055|        |      ;
						db $05,$01                           ;099057|        |      ;
						db $21,$01                           ;099059|        |      ;
	
			bossAI__5e:
						db $22,$64                           ;09905B|        |      ;
						db $21,$01                           ;09905D|        |      ;
	
			bossAI__5f:
						db $46,$65                           ;09905F|        |      ;
						db $0B,$0F                           ;099061|        |      ;
						db $05,$00                           ;099063|        |      ;
						db $46,$56                           ;099065|        |      ;
						db $0E,$32                           ;099067|        |      ;
						db $18,$0A                           ;099069|        |      ;
						db $0B,$0F                           ;09906B|        |      ;
						db $46,$56                           ;09906D|        |      ;
						db $05,$00                           ;09906F|        |      ;
						db $46,$56                           ;099071|        |      ;
						db $0B,$0F                           ;099073|        |      ;
						db $05,$00                           ;099075|        |      ;
						db $46,$56                           ;099077|        |      ;
						db $29,$01                           ;099079|        |      ;
	
			bossAI__60:
						db $39,$01                           ;09907B|        |      ;
						db $0B,$0F                           ;09907D|        |      ;
						db $05,$00                           ;09907F|        |      ;
						db $46,$58                           ;099081|        |      ;
						db $0B,$0F                           ;099083|        |      ;
						db $05,$00                           ;099085|        |      ;
						db $46,$59                           ;099087|        |      ;
						db $0B,$0F                           ;099089|        |      ;
						db $05,$00                           ;09908B|        |      ;
						db $46,$58                           ;09908D|        |      ;
						db $20,$66                           ;09908F|        |      ;
						db $3E,$01                           ;099091|        |      ;
						db $1C,$01                           ;099093|        |      ;
	
			bossAI__62:
						db $0E,$01                           ;099095|        |      ;
						db $02,$0A                           ;099097|        |      ;
						db $28,$67                           ;099099|        |      ;
						db $0B,$0F                           ;09909B|        |      ;
						db $05,$01                           ;09909D|        |      ;
						db $04,$01                           ;09909F|        |      ;
	
			bossAI__63:
						db $0E,$01                           ;0990A1|        |      ;
						db $18,$0A                           ;0990A3|        |      ;
						db $04,$01                           ;0990A5|        |      ;

}



	
{ ; -- 01 skullKing boss code 	
		
		bossPreview_skullKing_01:
						LDA.B #$00                           ;09A14F|A900    |      ;
						STA.W r_entity_damage,X              ;09A151|9D5706  |090657;
						JSR.W getLowAI                       ;09A154|20C3A4  |09A4C3;
						BNE CODE_09A178                      ;09A157|D01F    |09A178;
						LDA.B #$40                           ;09A159|A940    |      ;
						STA.W r_entity_mask,X                ;09A15B|9D7004  |090470;
						LDA.B #$01                           ;09A15E|A901    |      ;
						STA.W r_entity_FacingLeft,X          ;09A160|9DA804  |0904A8;
						LDA.B #$0C                           ;09A163|A90C    |      ;
						STA.W r_Player_StateDoubled,X        ;09A165|9D6505  |090565;
						LDA.B #$10                           ;09A168|A910    |      ;
						LDY.B #$26                           ;09A16A|A026    |      ;
						jsr setSpriteAndAnimGroup_AY_update                       ;09A16D|        |0FEF6E;
						LDA.B r_bossActiveFlag               ;09A16F|A578    |000078;
						BEQ +                
						LDA.B #$44                           ;09A173|A944    |      ;
						JMP.W setEnityAi_scriptIDX_01        ;09A175|4C4F86  |09864F;
	
	
			CODE_09A178:
						LDA.W r_entity_AI_IDX,X              ;09A178|BDC105  |0905C1;
						CMP.B #$08                           ;09A17B|C908    |      ;
						BNE +                     
						LDA.B #$00                           ;09A17F|A900    |      ;
						STA.W r_entity_Counter,X             ;09A181|9D3306  |090633;
						STA.W r_entity_AI,X                  ;09A184|9DEF05  |0905EF;
						STA.W r_entity_AI_IDX,X              ;09A187|9DC105  |0905C1;
	
			AND_7F_r_orb_flagsTimer:
						LDA.W r_orb_flagsTimer               ;09A18A|ADF307  |0907F3;
						AND.B #$7F                           ;09A18D|297F    |      ;
						STA.W r_orb_flagsTimer               ;09A18F|8DF307  |0907F3;						
					+
						RTS                                  ;09A192|60      |      ;	
		

	bossID_skullKing_01:
						JSR.W CODE_09A1DE                    ;09A1F5|20DEA1  |09A1DE;
						LDY.W r_orb_flagsTimer               ;09A1F8|ACF307  |0907F3;
						DEY                                  ;09A1FB|88      |      ;
						BNE CODE_09A21F                      ;09A1FC|D021    |09A21F;
						JSR.W getLowAI                       ;09A1FE|20C3A4  |09A4C3;
						CMP.B #$31                           ;09A201|C931    |      ;
						BEQ CODE_09A219                      ;09A203|F014    |09A219;
						LDA.B #$10                           ;09A205|A910    |      ;
						JSR.W setEntity__09                  ;09A207|206186  |098661;
						db $20                               ;09A20A|        |      ;
						dw setMovmentSpdZero                 ;09A20B|        |0FFEC8;
						LDA.B #$10                           ;09A20D|A910    |      ;
						LDY.B #$03                           ;09A20F|A003    |      ;
						db $20                               ;09A211|        |      ;
						dw setSpriteAndAnimGroup_AY_update                       ;09A212|        |0FEF6E;
						LDA.B #$31                           ;09A214|A931    |      ;
						JMP.W setEnityAi_scriptIDX_01        ;09A216|4C4F86  |09864F;
	
	
			CODE_09A219:
						LDA.B #$00                           ;09A219|A900    |      ;
						STA.W r_entity_damage,X              ;09A21B|9D5706  |090657;
						RTS                                  ;09A21E|60      |      ;
	
	
			CODE_09A21F:
						LDA.B #$00                           ;09A21F|A900    |      ;
						JSR.W setEntity_stats_03             ;09A221|20F487  |0987F4;
						LDA.B r_stage                        ;09A224|A532    |000032;
						BEQ CODE_09A246                      ;09A226|F01E    |09A246;
						LDA.W r_entity_damageRelated,X       ;09A228|BD6906  |090669;
						BEQ CODE_09A246                      ;09A22B|F019    |09A246;
						JSR.W CODE_09870B                    ;09A22D|200B87  |09870B;
						BCC CODE_09A246                      ;09A230|9014    |09A246;
						TXA                                  ;09A232|8A      |      ;
						STA.W r_entity_target,Y              ;09A233|990606  |090606;
						LDA.W r_player_WeaImpact,X           ;09A236|BD8D06  |09068D;
						STA.W r_player_WeaImpact,Y           ;09A239|998D06  |09068D;
						LDA.B #$80                           ;09A23C|A980    |      ;
						STA.W r_entity_AI,Y                  ;09A23E|99EF05  |0905EF;
						LDA.B #$88                           ;09A241|A988    |      ;
						STA.W r_entity_mask,Y                ;09A243|997004  |090470;
	
			CODE_09A246:
						LDA.B r_stage                        ;09A246|A532    |000032;
						BEQ CODE_09A24C                      ;09A248|F002    |09A24C;
						LDA.B #$03                           ;09A24A|A903    |      ;
	
			CODE_09A24C:
						STA.B $00                            ;09A24C|8500    |000000;
						LDA.W r_entity_damage,X              ;09A24E|BD5706  |090657;
						AND.B #$03                           ;09A251|2903    |      ;
						BNE CODE_09A25A                      ;09A253|D005    |09A25A;
						LDA.B $00                            ;09A255|A500    |000000;
						CLC                                  ;09A257|18      |      ;
						ADC.B #$01                           ;09A258|6901    |      ;
	
			CODE_09A25A:
						JSR.W setEntity__04                  ;09A25A|20E088  |0988E0;
						LDA.W r_entity_damageRelated,X       ;09A25D|BD6906  |090669;
						AND.B #$0F                           ;09A260|290F    |      ;
						CMP.B #$02                           ;09A262|C902    |      ;
						BEQ CODE_09A272                      ;09A264|F00C    |09A272;
						JSR.W getLowAI                       ;09A266|20C3A4  |09A4C3;
						CMP.B #$0A                           ;09A269|C90A    |      ;
						BNE CODE_09A272                      ;09A26B|D005    |09A272;
						LDA.B #$00                           ;09A26D|A900    |      ;
						STA.W r_entity_damageRelated,X       ;09A26F|9D6906  |090669;
	
			CODE_09A272:
						LDA.W r_entity_XPos,X                ;09A272|BD3804  |090438;
						BPL CODE_09A285                      ;09A275|100E    |09A285;
						CMP.B #$FB                           ;09A277|C9FB    |      ;
						BCC CODE_09A28E                      ;09A279|9013    |09A28E;
						JSR.W CODE_09A2FD                    ;09A27B|20FDA2  |09A2FD;
						LDA.B #$FA                           ;09A27E|A9FA    |      ;
						STA.W r_entity_XPos,X                ;09A280|9D3804  |090438;
						BNE CODE_09A28E                      ;09A283|D009    |09A28E;
	
			CODE_09A285:
						CMP.B #$02                           ;09A285|C902    |      ;
						BCS CODE_09A28E                      ;09A287|B005    |09A28E;
						LDA.B #$02                           ;09A289|A902    |      ;
						STA.W r_entity_XPos,X                ;09A28B|9D3804  |090438;
	
			CODE_09A28E:
						JSR.W setEntity__0B                  ;09A28E|200886  |098608;
						JSR.W getLowAI                       ;09A291|20C3A4  |09A4C3;
						BNE CODE_09A299                      ;09A294|D003    |09A299;
						JMP.W CODE_09A329                    ;09A296|4C29A3  |09A329;
	
	
			CODE_09A299:
						CMP.B #$01                           ;09A299|C901    |      ;
						BNE CODE_09A2E6                      ;09A29B|D049    |09A2E6;
						LDA.W r_entity_YPos,X                ;09A29D|BD1C04  |09041C;
						CMP.B #$A8                           ;09A2A0|C9A8    |      ;
						BCS CODE_09A2B8                      ;09A2A2|B014    |09A2B8;
						LDA.B $17                            ;09A2A4|A517    |000017;
						BEQ CODE_09A2AC                      ;09A2A6|F004    |09A2AC;
						LDA.B #$FC                           ;09A2A8|A9FC    |      ;
						BNE CODE_09A2AE                      ;09A2AA|D002    |09A2AE;
	
			CODE_09A2AC:
						LDA.B #$04                           ;09A2AC|A904    |      ;
	
			CODE_09A2AE:
						LDY.B #$1C                           ;09A2AE|A01C    |      ;
						db $20                               ;09A2B0|        |      ;
						dw getCollusionBasedOnOffset         ;09A2B1|        |0FFC1E;
						BNE CODE_09A2B8                      ;09A2B3|D003    |09A2B8;
						JMP.W CODE_09A42A                    ;09A2B5|4C2AA4  |09A42A;
	
	
			CODE_09A2B8:
						LDA.W r_entity_FacingLeft,X          ;09A2B8|BDA804  |0904A8;
						BEQ CODE_09A2C1                      ;09A2BB|F004    |09A2C1;
						LDA.B #$F4                           ;09A2BD|A9F4    |      ;
						BNE CODE_09A2C3                      ;09A2BF|D002    |09A2C3;
	
			CODE_09A2C1:
						LDA.B #$0C                           ;09A2C1|A90C    |      ;
	
			CODE_09A2C3:
						STA.B $00                            ;09A2C3|8500    |000000;
						LDY.B #$10                           ;09A2C5|A010    |      ;
						db $20                               ;09A2C7|        |      ;
						dw getCollusionBasedOnOffset         ;09A2C8|        |0FFC1E;
						BEQ CODE_09A2D5                      ;09A2CA|F009    |09A2D5;
						JSR.W CODE_09A2F0                    ;09A2CC|20F0A2  |09A2F0;
						BCC CODE_09A2D2                      ;09A2CF|9001    |09A2D2;
						RTS                                  ;09A2D1|60      |      ;
	
	
			CODE_09A2D2:
						JMP.W CODE_09A435                    ;09A2D2|4C35A4  |09A435;
	
	
			CODE_09A2D5:
						LDA.B $00                            ;09A2D5|A500    |000000;
						LDY.B #$04                           ;09A2D7|A004    |      ;
						db $20                               ;09A2D9|        |      ;
						dw getCollusionBasedOnOffset         ;09A2DA|        |0FFC1E;
						BEQ CODE_09A2EF                      ;09A2DC|F011    |09A2EF;
						JSR.W CODE_09A2F0                    ;09A2DE|20F0A2  |09A2F0;
						BCS CODE_09A2EF                      ;09A2E1|B00C    |09A2EF;
						JMP.W CODE_09A43C                    ;09A2E3|4C3CA4  |09A43C;
	
	
			CODE_09A2E6:
						CMP.B #$0A                           ;09A2E6|C90A    |      ;
						BEQ CODE_09A2EF                      ;09A2E8|F005    |09A2EF;
						LDA.B #$00                           ;09A2EA|A900    |      ;
						STA.W r_entity_Counter,X             ;09A2EC|9D3306  |090633;
	
			CODE_09A2EF:
						RTS                                  ;09A2EF|60      |      ;
	
	
			CODE_09A2F0:
						LDA.B r_stage                        ;09A2F0|A532    |000032;
						CMP.B #$07                           ;09A2F2|C907    |      ;
						BNE CODE_09A327                      ;09A2F4|D031    |09A327;
						LDA.W r_entity_XPos,X                ;09A2F6|BD3804  |090438;
						CMP.B #$30                           ;09A2F9|C930    |      ;
						BCS CODE_09A327                      ;09A2FB|B02A    |09A327;
	
			CODE_09A2FD:
						LDA.W r_entity_FacingLeft,X          ;09A2FD|BDA804  |0904A8;
						EOR.B #$01                           ;09A300|4901    |      ;
						STA.W r_entity_FacingLeft,X          ;09A302|9DA804  |0904A8;
						LDA.W r_Player_StateDoubled,X        ;09A305|BD6505  |090565;
						CLC                                  ;09A308|18      |      ;
						ADC.B #$08                           ;09A309|6908    |      ;
						AND.B #$0F                           ;09A30B|290F    |      ;
						STA.W r_Player_StateDoubled,X        ;09A30D|9D6505  |090565;
						LDA.W r_entity_XsubSpd,X             ;09A310|BD0905  |090509;
						EOR.B #$FF                           ;09A313|49FF    |      ;
						CLC                                  ;09A315|18      |      ;
						ADC.B #$01                           ;09A316|6901    |      ;
						STA.W r_entity_XsubSpd,X             ;09A318|9D0905  |090509;
						LDA.W r_entity_Xspd,X                ;09A31B|BDF204  |0904F2;
						EOR.B #$FF                           ;09A31E|49FF    |      ;
						ADC.B #$00                           ;09A320|6900    |      ;
						STA.W r_entity_Xspd,X                ;09A322|9DF204  |0904F2;
						SEC                                  ;09A325|38      |      ;
						RTS                                  ;09A326|60      |      ;
	
	
			CODE_09A327:
						CLC                                  ;09A327|18      |      ;
						RTS                                  ;09A328|60      |      ;
	
	
			CODE_09A329:
						LDA.B $17                            ;09A329|A517    |000017;
						CMP.W r_entity_FacingLeft,X          ;09A32B|DDA804  |0904A8;
						BEQ CODE_09A333                      ;09A32E|F003    |09A333;
						JMP.W CODE_09A3C5                    ;09A330|4CC5A3  |09A3C5;
	
	
			CODE_09A333:
						LDA.B $00                            ;09A333|A500    |000000;
						CMP.B #$50                           ;09A335|C950    |      ;
						BCC CODE_09A33C                      ;09A337|9003    |09A33C;
						JMP.W CODE_09A3C5                    ;09A339|4CC5A3  |09A3C5;
	
	
			CODE_09A33C:
						CMP.B #$30                           ;09A33C|C930    |      ;
						BCC CODE_09A38A                      ;09A33E|904A    |09A38A;
						SEC                                  ;09A340|38      |      ;
						LDA.W r_entity_YPos                  ;09A341|AD1C04  |09041C;
						SBC.B #$08                           ;09A344|E908    |      ;
						SBC.W r_entity_YPos,X                ;09A346|FD1C04  |09041C;
						BCS CODE_09A350                      ;09A349|B005    |09A350;
						EOR.B #$FF                           ;09A34B|49FF    |      ;
						CLC                                  ;09A34D|18      |      ;
						ADC.B #$01                           ;09A34E|6901    |      ;
	
			CODE_09A350:
						CMP.B #$08                           ;09A350|C908    |      ;
						BCC CODE_09A356                      ;09A352|9002    |09A356;
						BCS CODE_09A3C5                      ;09A354|B06F    |09A3C5;
	
			CODE_09A356:
						LDA.B r_Joy1Held_t                   ;09A356|A528    |000028;
						AND.B #$40                           ;09A358|2940    |      ;
						BNE CODE_09A3B0                      ;09A35A|D054    |09A3B0;
						LDA.W r_entity_Counter,X             ;09A35C|BD3306  |090633;
						BNE CODE_09A3C5                      ;09A35F|D064    |09A3C5;
						LDA.B #$22                           ;09A361|A922    |      ;
						JSR.W setEntity_pos_06               ;09A363|206687  |098766;
						BCC CODE_09A371                      ;09A366|9009    |09A371;
						TXA                                  ;09A368|8A      |      ;
						STA.W r_damagActionFlag,Y            ;09A369|991D06  |09061D;
						LDA.B #$C8                           ;09A36C|A9C8    |      ;
						STA.W r_entity_mask,Y                ;09A36E|997004  |090470;
	
			CODE_09A371:
						LDA.W r_damagActionFlag,X            ;09A371|BD1D06  |09061D;
						AND.B #$7F                           ;09A374|297F    |      ;
						STA.W r_damagActionFlag,X            ;09A376|9D1D06  |09061D;
						LDA.B #$01                           ;09A379|A901    |      ;
						STA.W r_entity_Counter,X             ;09A37B|9D3306  |090633;
						LDA.B #$0A                           ;09A37E|A90A    |      ;
						LDY.B #$01                           ;09A380|A001    |      ;
						db $20                               ;09A382|        |      ;
						dw setSpriteAndAnimGroup_AY_update                       ;09A383|        |0FEF6E;
						LDA.B #$0A                           ;09A385|A90A    |      ;
						JMP.W setEnityAi_scriptIDX_01        ;09A387|4C4F86  |09864F;
	
	
			CODE_09A38A:
						LDA.W r_damagActionFlag,X            ;09A38A|BD1D06  |09061D;
						AND.B #$80                           ;09A38D|2980    |      ;
						BNE CODE_09A3C5                      ;09A38F|D034    |09A3C5;
						LDA.W r_damagActionFlag,X            ;09A391|BD1D06  |09061D;
						ORA.B #$80                           ;09A394|0980    |      ;
						STA.W r_damagActionFlag,X            ;09A396|9D1D06  |09061D;
						LDA.B $17                            ;09A399|A517    |000017;
						STA.W r_entity_FacingLeft,X          ;09A39B|9DA804  |0904A8;
						JSR.W CODE_098643                    ;09A39E|204386  |098643;
						STA.W r_Player_StateDoubled,X        ;09A3A1|9D6505  |090565;
						LDA.B #$0A                           ;09A3A4|A90A    |      ;
						LDY.B #$00                           ;09A3A6|A000    |      ;
						db $20                               ;09A3A8|        |      ;
						dw setSpriteAndAnimGroup_AY_update                       ;09A3A9|        |0FEF6E;
						LDA.B #$0C                           ;09A3AB|A90C    |      ;
						JMP.W setEnityAi_scriptIDX_01        ;09A3AD|4C4F86  |09864F;
	
	
			CODE_09A3B0:
						LDA.B r_stage                        ;09A3B0|A532    |000032;
						BEQ CODE_09A3B9                      ;09A3B2|F005    |09A3B9;
						LDA.B #$13                           ;09A3B4|A913    |      ;
						STA.W r_entity_damage,X              ;09A3B6|9D5706  |090657;
	
			CODE_09A3B9:
						LDA.B #$10                           ;09A3B9|A910    |      ;
						LDY.B #$4B                           ;09A3BB|A04B    |      ;
						db $20                               ;09A3BD|        |      ;
						dw setSpriteAndAnimGroup_AY_update                       ;09A3BE|        |0FEF6E;
						LDA.B #$09                           ;09A3C0|A909    |      ;
						JMP.W setEnityAi_scriptIDX_01        ;09A3C2|4C4F86  |09864F;
	
	
			CODE_09A3C5:
						LDA.W r_entity_ID,X                  ;09A3C5|BD4E05  |09054E;
						AND.B #$1F                           ;09A3C8|291F    |      ;
						CMP.B #$01                           ;09A3CA|C901    |      ;
						BNE CODE_09A408                      ;09A3CC|D03A    |09A408;
						LDA.B r_stage                        ;09A3CE|A532    |000032;
						BNE CODE_09A3ED                      ;09A3D0|D01B    |09A3ED;
						LDA.W r_entity_XPos,X                ;09A3D2|BD3804  |090438;
						CMP.B #$18                           ;09A3D5|C918    |      ;
						BCS CODE_09A408                      ;09A3D7|B02F    |09A408;
						LDA.W r_entity_YPos,X                ;09A3D9|BD1C04  |09041C;
						CMP.B #$8C                           ;09A3DC|C98C    |      ;
						BCS CODE_09A40E                      ;09A3DE|B02E    |09A40E;
						LDA.B #$04                           ;09A3E0|A904    |      ;
						STA.W r_Player_StateDoubled,X        ;09A3E2|9D6505  |090565;
						LDA.B #$00                           ;09A3E5|A900    |      ;
						STA.W r_entity_FacingLeft,X          ;09A3E7|9DA804  |0904A8;
						JMP.W CODE_09A43C                    ;09A3EA|4C3CA4  |09A43C;
	
	
			CODE_09A3ED:
						LDA.W r_entity_XPos,X                ;09A3ED|BD3804  |090438;
						CMP.B #$E8                           ;09A3F0|C9E8    |      ;
						BCC CODE_09A408                      ;09A3F2|9014    |09A408;
						LDA.W r_entity_YPos,X                ;09A3F4|BD1C04  |09041C;
						CMP.B #$8C                           ;09A3F7|C98C    |      ;
						BCS CODE_09A40E                      ;09A3F9|B013    |09A40E;
						LDA.B #$0C                           ;09A3FB|A90C    |      ;
						STA.W r_Player_StateDoubled,X        ;09A3FD|9D6505  |090565;
						LDA.B #$01                           ;09A400|A901    |      ;
						STA.W r_entity_FacingLeft,X          ;09A402|9DA804  |0904A8;
						JMP.W CODE_09A43C                    ;09A405|4C3CA4  |09A43C;
	
	
			CODE_09A408:
						LDA.B r_RNG                          ;09A408|A51F    |00001F;
						CMP.B #$80                           ;09A40A|C980    |      ;
						BCC CODE_09A41F                      ;09A40C|9011    |09A41F;
	
			CODE_09A40E:
						LDA.B $00                            ;09A40E|A500    |000000;
						CMP.B #$08                           ;09A410|C908    |      ;
						BCC CODE_09A41F                      ;09A412|900B    |09A41F;
						LDA.B $17                            ;09A414|A517    |000017;
						STA.W r_entity_FacingLeft,X          ;09A416|9DA804  |0904A8;
						JSR.W CODE_098643                    ;09A419|204386  |098643;
						STA.W r_Player_StateDoubled,X        ;09A41C|9D6505  |090565;
	
			CODE_09A41F:
						LDA.B #$0A                           ;09A41F|A90A    |      ;
						LDY.B #$0D                           ;09A421|A00D    |      ;
						db $20                               ;09A423|        |      ;
						dw setSpriteAndAnimGroup_AY_update                       ;09A424|        |0FEF6E;
						LDA.B #$01                           ;09A426|A901    |      ;
						BNE CODE_09A441                      ;09A428|D017    |09A441;
	
			CODE_09A42A:
						LDA.B #$0A                           ;09A42A|A90A    |      ;
						LDY.B #$04                           ;09A42C|A004    |      ;
						db $20                               ;09A42E|        |      ;
						dw setSpriteAndAnimGroup_AY_update                       ;09A42F|        |0FEF6E;
						LDA.B #$62                           ;09A431|A962    |      ;
						BNE CODE_09A441                      ;09A433|D00C    |09A441;
	
			CODE_09A435:
						JSR.W CODE_09A444                    ;09A435|2044A4  |09A444;
						LDA.B #$0B                           ;09A438|A90B    |      ;
						BNE CODE_09A441                      ;09A43A|D005    |09A441;
	
			CODE_09A43C:
						JSR.W CODE_09A444                    ;09A43C|2044A4  |09A444;
						LDA.B #$02                           ;09A43F|A902    |      ;
	
			CODE_09A441:
						JMP.W setEnityAi_scriptIDX_01        ;09A441|4C4F86  |09864F;
	
	
			CODE_09A444:
						LDA.B #$0A                           ;09A444|A90A    |      ;
						LDY.B #$04                           ;09A446|A004    |      ;	
						jmp setSpriteAndAnimGroup_AY_update                       ;09A449|        |0FEF6E;
	

			CODE_09870B:
						LDA.W r_entity_target,X              ;09870B|BD0606  |090606;
						CMP.B #$02                           ;09870E|C902    |      ;
						BCC CODE_098714                      ;098710|9002    |098714;
						CLC                                  ;098712|18      |      ;
						RTS                                  ;098713|60      |      ;
	
	
			CODE_098714:
						STX.B r_index                        ;098714|8610    |000010;
						db $20                               ;098716|        |      ;
						dw findEmptyEntitySlot               ;098717|        |0FFEB9;
						BNE CODE_098736                      ;098719|D01B    |098736;
						LDA.B #$00                           ;09871B|A900    |      ;
						STA.W r_entity_PaletteOverride,X     ;09871D|9D5404  |090454;
						LDA.B #$11                           ;098720|A911    |      ;
						STA.W r_entity_ID,X                  ;098722|9D4E05  |09054E;
						JSR.W CODE_098779                    ;098725|207987  |098779;
						LDA.B #$04                           ;098728|A904    |      ;
						STA.W r_Player_StateDoubled,X        ;09872A|9D6505  |090565;
						TXA                                  ;09872D|8A      |      ;
						TAY                                  ;09872E|A8      |      ;
						LDX.B r_index                        ;09872F|A610    |000010;
						INC.W r_entity_target,X              ;098731|FE0606  |090606;
						SEC                                  ;098734|38      |      ;
						RTS                                  ;098735|60      |      ;
			CODE_098736:
						LDX.B r_index                        ;098736|A610    |000010;
						CLC                                  ;098738|18      |      ;
						RTS                                  ;098739|60      |      ;

}						


{ ; -- 02 bossID_hammerGuy

		bossPreview_hammerGuy_02:
						LDA.B r_bossActiveFlag               ;09A4C9|A578    |000078;
						BEQ CODE_09A4DA                      ;09A4CB|F00D    |09A4DA;
						LDA.W r_entity_extra,X               ;09A4CD|BDD805  |0905D8;
						CMP.B #$80                           ;09A4D0|C980    |      ;
						BCS CODE_09A4F2
						INC.W r_entity_extra,X               ;09A4D4|FED805  |0905D8;	
		
		set_faceLeft_stateC:
						LDA.B #$01                           ;09A4E7|A901    |      ;
						STA.W r_entity_FacingLeft,X          ;09A4E9|9DA804  |0904A8;
						LDA.B #$0C                           ;09A4EC|A90C    |      ;
						STA.W r_Player_StateDoubled,X        ;09A4EE|9D6505  |090565;
					-	
						RTS 

			CODE_09A4DA:
						JSR.W CODE_0985EE                    ;09A4DA|20EE85  |0985EE;
						JSR.W set_faceLeft_stateC            ;09A4DD|20E7A4  |09A4E7;
						LDA.B #$10                           ;09A4E0|A910    |      ;
						LDY.B #$06                           ;09A4E2|A006    |      ;	
						jmp setSpriteAndAnimGroup_AY_update                       ;09A4E5|        |0FEF6E;


			CODE_09A4F2:
						JSR.W setEntity__08                  ;09A4F2|2000A5  |09A500;
						LDA.B #$00                           ;09A4F5|A900    |      ;
						STA.W r_entity_target,X              ;09A4F7|9D0606  |090606;
						STA.W r_entity_extra,X               ;09A4FA|9DD805  |0905D8;
						JMP.W AND_7F_r_orb_flagsTimer        ;09A4FD|4C8AA1  |09A18A;
	
	
			setEntity__08:
						LDA.B #$02                           ;09A500|A902    |      ;
						STA.B r_bossState__12      ;09A502|8512    |000012;
						LDA.B #$1F                           ;09A504|A91F    |      ;
						STA.B r_bossScript__13               ;09A506|8513    |000013;
	
				entity__8_Loop:
						LDA.B r_bossScript__13               ;09A508|A513    |000013;
						JSR.W setEntity_pos_06               ;09A50A|206687  |098766;
						BCC -
						LDA.B r_bossState__12      ;09A50F|A512    |000012;
						STA.W r_damagActionFlag,Y            ;09A511|991D06  |09061D;
						LDA.B #$C8                           ;09A514|A9C8    |      ;
						STA.W r_entity_mask,Y                ;09A516|997004  |090470;
						TXA                                  ;09A519|8A      |      ;
						STA.W r_entity_Counter,Y             ;09A51A|993306  |090633;
						LDA.B #$40                           ;09A51D|A940    |      ;
						STA.W r_entity_Health,Y              ;09A51F|997B06  |09067B;
						INC.B r_bossScript__13               ;09A522|E613    |000013;
						DEC.B r_bossState__12      ;09A524|C612    |000012;
						BNE entity__8_Loop                      ;09A526|D0E0    |09A508;
						
						LDA.B r_bossState__12      ;09A528|A512    |000012;
						STA.W r_damagActionFlag,X            ;09A52A|9D1D06  |09061D;
						JMP.W set_faceLeft_stateC            ;09A52D|4CE7A4  |09A4E7;


			CODE_0985EE:
						LDA.W r_entity_mask,X                ;0985EE|BD7004  |090470;
						AND.B #$01                           ;0985F1|2901    |      ;
						BNE CODE_0985FF                      ;0985F3|D00A    |0985FF;
						LDA.W r_entity_mask,X                ;0985F5|BD7004  |090470;
						AND.B #$77                           ;0985F8|2977    |      ;
						ORA.B #$40                           ;0985FA|0940    |      ;
						JMP.W CODE_098604                    ;0985FC|4C0486  |098604;
	
	
			CODE_0985FF:
						LDA.W r_entity_mask,X                ;0985FF|BD7004  |090470;
						ORA.B #$88                           ;098602|0988    |      ;
	
			CODE_098604:
						STA.W r_entity_mask,X                ;098604|9D7004  |090470;
						RTS  




		bossID_hammerGuy_02:
						JSR.W getLowAI                       ;09A5DF|20C3A4  |09A4C3;
						CMP.B #$2F                           ;09A5E2|C92F    |      ;
						BEQ CODE_09A665                      ;09A5E4|F07F    |09A665;
						LDA.B #$00                           ;09A5E6|A900    |      ;
						STA.W r_entity_PaletteOverride,X     ;09A5E8|9D5404  |090454;
						LDA.W r_entity_target,X              ;09A5EB|BD0606  |090606;
						BEQ CODE_09A636                      ;09A5EE|F046    |09A636;
						LDA.B #$20                           ;09A5F0|A920    |      ;
						STA.W r_entity_mask,X                ;09A5F2|9D7004  |090470;
						LDA.W r_entity_target,X              ;09A5F5|BD0606  |090606;
						AND.B #$04                           ;09A5F8|2904    |      ;
						BEQ CODE_09A600                      ;09A5FA|F004    |09A600;
						LDA.B #$00                           ;09A5FC|A900    |      ;
						BEQ CODE_09A602                      ;09A5FE|F002    |09A602;
	
			CODE_09A600:
						LDA.B #$02                           ;09A600|A902    |      ;
	
			CODE_09A602:
						STA.W r_entity_PaletteOverride,X     ;09A602|9D5404  |090454;
						DEC.W r_entity_target,X              ;09A605|DE0606  |090606;
						BNE CODE_09A635                      ;09A608|D02B    |09A635;
						LDA.W r_entity_Health,X              ;09A60A|BD7B06  |09067B;
						SEC                                  ;09A60D|38      |      ;
						SBC.B #$10                           ;09A60E|E910    |      ;
						BCS CODE_09A614                      ;09A610|B002    |09A614;
						LDA.B #$00                           ;09A612|A900    |      ;
	
			CODE_09A614:
						STA.W r_entity_Health,X              ;09A614|9D7B06  |09067B;
						STA.B r_HUD_healthBoss               ;09A617|853D    |00003D;
						LDY.B #$0D                           ;09A619|A00D    |      ;
	
			CODE_09A61B:
						LDA.W r_entity_ID,Y                  ;09A61B|B94E05  |09054E;
						CMP.B #$02                           ;09A61E|C902    |      ;
						BNE CODE_09A632                      ;09A620|D010    |09A632;
						LDA.W r_damagActionFlag,X            ;09A622|BD1D06  |09061D;
						CMP.B #$01                           ;09A625|C901    |      ;
						BNE CODE_09A632                      ;09A627|D009    |09A632;
						LDA.W r_entity_Health,X              ;09A629|BD7B06  |09067B;
						STA.W r_entity_Health,Y              ;09A62C|997B06  |09067B;
						JMP.W CODE_09A636                    ;09A62F|4C36A6  |09A636;
	
	
			CODE_09A632:
						DEY                                  ;09A632|88      |      ;
						BNE CODE_09A61B                      ;09A633|D0E6    |09A61B;
	
			CODE_09A635:
						RTS                                  ;09A635|60      |      ;
	
	
			CODE_09A636:
						LDA.B #$40                           ;09A636|A940    |      ;
						STA.W r_entity_mask,X                ;09A638|9D7004  |090470;
						LDA.W r_bossPieces       ;09A63B|ADEC07  |0907EC;
						BEQ CODE_09A665                      ;09A63E|F025    |09A665;
						LDA.W $05F6                          ;09A640|ADF605  |0905F6;
						CMP.B #$91                           ;09A643|C991    |      ;
						BEQ CODE_09A665                      ;09A645|F01E    |09A665;
						LDA.W $05C8                          ;09A647|ADC805  |0905C8;
						CMP.B #$05                           ;09A64A|C905    |      ;
						BCC CODE_09A665                      ;09A64C|9017    |09A665;
						LDA.W $043F                          ;09A64E|AD3F04  |09043F;
						SEC                                  ;09A651|38      |      ;
						SBC.W r_entity_XPos,X                ;09A652|FD3804  |090438;
						BCS CODE_09A65C                      ;09A655|B005    |09A65C;
						EOR.B #$FF                           ;09A657|49FF    |      ;
						CLC                                  ;09A659|18      |      ;
						ADC.B #$01                           ;09A65A|6901    |      ;
	
			CODE_09A65C:
						CMP.B #$10                           ;09A65C|C910    |      ;
						BCS CODE_09A665                      ;09A65E|B005    |09A665;
						LDA.B #$40                           ;09A660|A940    |      ;
						STA.W r_entity_target,X              ;09A662|9D0606  |090606;
	
			CODE_09A665:
						LDA.W r_orb_flagsTimer               ;09A665|ADF307  |0907F3;
						CMP.B #$01                           ;09A668|C901    |      ;
						BEQ CODE_09A674                      ;09A66A|F008    |09A674;
						LDA.B #$30                           ;09A66C|A930    |      ;
						STA.W r_entity_damage,X              ;09A66E|9D5706  |090657;
						JMP.W CODE_09A6FD                    ;09A671|4CFDA6  |09A6FD;
	
	
			CODE_09A674:
						JSR.W getLowAI                       ;09A674|20C3A4  |09A4C3;
						CMP.B #$2F                           ;09A677|C92F    |      ;
						BEQ CODE_09A6C5                      ;09A679|F04A    |09A6C5;
						LDA.B r_stage                        ;09A67B|A532    |000032;
						CMP.B #$02                           ;09A67D|C902    |      ;
						BEQ CODE_09A6AA                      ;09A67F|F029    |09A6AA;
						LDY.B #$01                           ;09A681|A001    |      ;
						STX.B $00                            ;09A683|8600    |000000;
	
			CODE_09A685:
						CPY.B $00                            ;09A685|C400    |000000;
						BEQ CODE_09A6A3                      ;09A687|F01A    |09A6A3;
						LDA.B #$00                           ;09A689|A900    |      ;
						STA.W r_entity_ID,Y                  ;09A68B|994E05  |09054E;
						STA.W r_entity_AI,Y                  ;09A68E|99EF05  |0905EF;
						STA.W r_entity_spriteID,Y            ;09A691|990004  |090400;
						STA.W r_entity_spriteGroup,Y         ;09A694|998C04  |09048C;
						STA.W r_entity_target,Y              ;09A697|990606  |090606;
						STA.W r_damagActionFlag,Y            ;09A69A|991D06  |09061D;
						STA.W r_entity_Counter,Y             ;09A69D|993306  |090633;
						STA.W r_misc_movementState,Y         ;09A6A0|994506  |090645;
	
			CODE_09A6A3:
						INY                                  ;09A6A3|C8      |      ;
						CPY.B #$0D                           ;09A6A4|C00D    |      ;
						BNE CODE_09A685                      ;09A6A6|D0DD    |09A685;
						BEQ CODE_09A6B1                      ;09A6A8|F007    |09A6B1;
	
			CODE_09A6AA:
						TXA                                  ;09A6AA|8A      |      ;
						PHA                                  ;09A6AB|48      |      ;
						JSR.W CODE_099D04                    ;09A6AC|20049D  |099D04;
						PLA                                  ;09A6AF|68      |      ;
						TAX                                  ;09A6B0|AA      |      ;
	
			CODE_09A6B1:
						LDA.B #$30                           ;09A6B1|A930    |      ;
						JSR.W setEntity__09                  ;09A6B3|206186  |098661;
						db $20                               ;09A6B6|        |      ;
						dw setMovmentSpdZero                 ;09A6B7|        |0FFEC8;
						LDA.B #$10                           ;09A6B9|A910    |      ;
						LDY.B #$06                           ;09A6BB|A006    |      ;
						db $20                               ;09A6BD|        |      ;
						dw setSpriteAndAnimGroup_AY_update                       ;09A6BE|        |0FEF6E;
						LDA.B #$2F                           ;09A6C0|A92F    |      ;
						JMP.W setEnityAi_scriptIDX_01        ;09A6C2|4C4F86  |09864F;
	
	
			CODE_09A6C5:
						LDA.B r_stage                        ;09A6C5|A532    |000032;
						CMP.B #$02                           ;09A6C7|C902    |      ;
						BEQ CODE_09A6FC                      ;09A6C9|F031    |09A6FC;
						LDA.W r_entity_AI_IDX,X              ;09A6CB|BDC105  |0905C1;
						CMP.B #$09                           ;09A6CE|C909    |      ;
						BNE CODE_09A6FC                      ;09A6D0|D02A    |09A6FC;
						INC.W $07EE                          ;09A6D2|EEEE07  |0907EE;
						LDA.W r_orb_flagsTimer               ;09A6D5|ADF307  |0907F3;
						ORA.B #$81                           ;09A6D8|0981    |      ;
						STA.W r_orb_flagsTimer               ;09A6DA|8DF307  |0907F3;
						LDA.B #$00                           ;09A6DD|A900    |      ;
						STA.W r_entity_target,X              ;09A6DF|9D0606  |090606;
						STA.W r_damagActionFlag,X            ;09A6E2|9D1D06  |09061D;
						STA.W r_entity_Counter,X             ;09A6E5|9D3306  |090633;
						STA.W r_entity_AI,X                  ;09A6E8|9DEF05  |0905EF;
						STA.W r_entity_AI_IDX,X              ;09A6EB|9DC105  |0905C1;
						LDA.B #$09                           ;09A6EE|A909    |      ;
						STA.W r_entity_ID,X                  ;09A6F0|9D4E05  |09054E;
						LDA.W r_entity_YPos,X                ;09A6F3|BD1C04  |09041C;
						SEC                                  ;09A6F6|38      |      ;
						SBC.B #$10                           ;09A6F7|E910    |      ;
						STA.W r_entity_YPos,X                ;09A6F9|9D1C04  |09041C;
	
			CODE_09A6FC:
						RTS                                  ;09A6FC|60      |      ;
	
	
			CODE_09A6FD:
						LDA.B #$00                           ;09A6FD|A900    |      ;
						JSR.W setEntity_stats_03             ;09A6FF|20F487  |0987F4;
						LDA.W r_orb_flagsTimer               ;09A702|ADF307  |0907F3;
						AND.B #$40                           ;09A705|2940    |      ;
						BEQ CODE_09A710                      ;09A707|F007    |09A710;
						LDA.B #$20                           ;09A709|A920    |      ;
						STA.W r_entity_mask,X                ;09A70B|9D7004  |090470;
						BNE CODE_09A715                      ;09A70E|D005    |09A715;
	
			CODE_09A710:
						LDA.B #$40                           ;09A710|A940    |      ;
						STA.W r_entity_mask,X                ;09A712|9D7004  |090470;
	
			CODE_09A715:
						LDA.W r_entity_damageRelated,X       ;09A715|BD6906  |090669;
						AND.B #$0F                           ;09A718|290F    |      ;
						CMP.B #$02                           ;09A71A|C902    |      ;
						BEQ CODE_09A721                      ;09A71C|F003    |09A721;
						JSR.W setEntity__0A                  ;09A71E|203182  |098231;
	
			CODE_09A721:
						JSR.W setEntity__0B                  ;09A721|200886  |098608;
						JSR.W getLowAI                       ;09A724|20C3A4  |09A4C3;
						CMP.B #$0E                           ;09A727|C90E    |      ;
						BEQ CODE_09A6FC
						CMP.B #$10                           ;09A72B|C910    |      ;
						BEQ CODE_09A753                      ;09A72D|F024    |09A753;
						LDA.B $00                            ;09A72F|A500    |000000;
						CMP.B #$1A                           ;09A731|C91A    |      ;
						BCS CODE_09A753                      ;09A733|B01E    |09A753;
						JSR.W CODE_09A7F2                    ;09A735|20F2A7  |09A7F2;
						CMP.B #$10                           ;09A738|C910    |      ;
						BCS CODE_09A753                      ;09A73A|B017    |09A753;
						LDA.W r_entity_FacingLeft,X          ;09A73C|BDA804  |0904A8;
						CMP.B $17                            ;09A73F|C517    |000017;
						BEQ CODE_09A746                      ;09A741|F003    |09A746;
						JSR.W CODE_09A7E0                    ;09A743|20E0A7  |09A7E0;
	
			CODE_09A746:
						LDA.B #$0A                           ;09A746|A90A    |      ;
						LDY.B #$08                           ;09A748|A008    |      ;
						db $20                               ;09A74A|        |      ;
						dw setSpriteAndAnimGroup_AY_update                       ;09A74B|        |0FEF6E;
						LDA.B #$0E                           ;09A74D|A90E    |      ;
						JMP.W setEnityAi_scriptIDX_01        ;09A74F|4C4F86  |09864F;
	

			CODE_09A753:
						JSR.W getLowAI                       ;09A753|20C3A4  |09A4C3;
						BEQ CODE_09A779                      ;09A756|F021    |09A779;
						LDY.W r_entity_XPos,X                ;09A758|BC3804  |090438;
						LDA.W r_entity_FacingLeft,X          ;09A75B|BDA804  |0904A8;
						BEQ CODE_09A766                      ;09A75E|F006    |09A766;
						CPY.B #$10                           ;09A760|C010    |      ;
						BCC CODE_09A76A                      ;09A762|9006    |09A76A;
						BCS CODE_09A779                      ;09A764|B013    |09A779;
	
			CODE_09A766:
						CPY.B #$F0                           ;09A766|C0F0    |      ;
						BCC CODE_09A779                      ;09A768|900F    |09A779;
	
			CODE_09A76A:
						JSR.W CODE_09A7E0                    ;09A76A|20E0A7  |09A7E0;
	
			CODE_09A76D:
						LDA.B #$0A                           ;09A76D|A90A    |      ;
						LDY.B #$06                           ;09A76F|A006    |      ;
						db $20                               ;09A771|        |      ;
						dw setSpriteAndAnimGroup_AY_update                       ;09A772|        |0FEF6E;
						LDA.B #$0D                           ;09A774|A90D    |      ;
						JMP.W setEnityAi_scriptIDX_01        ;09A776|4C4F86  |09864F;
	
	
			CODE_09A779:
						JSR.W getLowAI                       ;09A779|20C3A4  |09A4C3;
						CMP.B #$10                           ;09A77C|C910    |      ;
						BNE CODE_09A781                      ;09A77E|D001    |09A781;
						RTS                                  ;09A780|60      |      ;
	
	
			CODE_09A781:
						LDA.W r_entity_Counter,X             ;09A781|BD3306  |090633;
						BNE CODE_09A79F                      ;09A784|D019    |09A79F;
						LDA.W r_entity_XPos,X                ;09A786|BD3804  |090438;
						CMP.B #$18                           ;09A789|C918    |      ;
						BCC CODE_09A7A2                      ;09A78B|9015    |09A7A2;
						CMP.B #$E8                           ;09A78D|C9E8    |      ;
						BCS CODE_09A7A2                      ;09A78F|B011    |09A7A2;
						LDA.B #$48                           ;09A791|A948    |      ;
						STA.W r_entity_Counter,X             ;09A793|9D3306  |090633;
						JSR.W setEnityAi_RNG_00              ;09A796|203BA1  |09A13B;
						CMP.B #$0A                           ;09A799|C90A    |      ;
						BCS CODE_09A79F                      ;09A79B|B002    |09A79F;
						BCC CODE_09A7C7                      ;09A79D|9028    |09A7C7;
	
			CODE_09A79F:
						DEC.W r_entity_Counter,X             ;09A79F|DE3306  |090633;
	
			CODE_09A7A2:
						LDA.B $17                            ;09A7A2|A517    |000017;
						CMP.W r_entity_FacingLeft,X          ;09A7A4|DDA804  |0904A8;
						BEQ CODE_09A7BA                      ;09A7A7|F011    |09A7BA;
						LDA.W r_misc_movementState,X         ;09A7A9|BD4506  |090645;
						BNE CODE_09A7B5                      ;09A7AC|D007    |09A7B5;
						LDA.B r_RNG                          ;09A7AE|A51F    |00001F;
						ASL A                                ;09A7B0|0A      |      ;
						ASL A                                ;09A7B1|0A      |      ;
						STA.W r_misc_movementState,X         ;09A7B2|9D4506  |090645;
	
			CODE_09A7B5:
						DEC.W r_misc_movementState,X         ;09A7B5|DE4506  |090645;
						BEQ CODE_09A76A                      ;09A7B8|F0B0    |09A76A;
	
			CODE_09A7BA:
						JSR.W getLowAI                       ;09A7BA|20C3A4  |09A4C3;
						BEQ CODE_09A7C3                      ;09A7BD|F004    |09A7C3;
						CMP.B #$0D                           ;09A7BF|C90D    |      ;
						BEQ CODE_09A7C6                      ;09A7C1|F003    |09A7C6;
	
			CODE_09A7C3:
						JMP.W CODE_09A76D                    ;09A7C3|4C6DA7  |09A76D;
	
	
			CODE_09A7C6:
						RTS                                  ;09A7C6|60      |      ;
	
	
			CODE_09A7C7:
						JSR.W CODE_09A7F2                    ;09A7C7|20F2A7  |09A7F2;
						CMP.B #$08                           ;09A7CA|C908    |      ;
						BCS CODE_09A7A2                      ;09A7CC|B0D4    |09A7A2;
						JSR.W CODE_098643                    ;09A7CE|204386  |098643;
						STA.W r_Player_StateDoubled,X        ;09A7D1|9D6505  |090565;
						LDA.B #$0A                           ;09A7D4|A90A    |      ;
						LDY.B #$07                           ;09A7D6|A007    |      ;
						db $20                               ;09A7D8|        |      ;
						dw setSpriteAndAnimGroup_AY_update                       ;09A7D9|        |0FEF6E;
						LDA.B #$10                           ;09A7DB|A910    |      ;
						JMP.W setEnityAi_scriptIDX_01        ;09A7DD|4C4F86  |09864F;
	
	
			CODE_09A7E0:
						LDA.W r_entity_FacingLeft,X          ;09A7E0|BDA804  |0904A8;
						EOR.B #$01                           ;09A7E3|4901    |      ;
						AND.B #$01                           ;09A7E5|2901    |      ;
						STA.W r_entity_FacingLeft,X          ;09A7E7|9DA804  |0904A8;
						TAY                                  ;09A7EA|A8      |      ;
						LDA.W DATA8_09A801,Y                 ;09A7EB|B901A8  |09A801;
						STA.W r_Player_StateDoubled,X        ;09A7EE|9D6505  |090565;
						RTS                                  ;09A7F1|60      |      ;
	
	
			CODE_09A7F2:
						LDA.W r_entity_YPos                  ;09A7F2|AD1C04  |09041C;
						SEC                                  ;09A7F5|38      |      ;
						SBC.W r_entity_YPos,X                ;09A7F6|FD1C04  |09041C;
						BCS CODE_09A800                      ;09A7F9|B005    |09A800;
						EOR.B #$FF                           ;09A7FB|49FF    |      ;
						CLC                                  ;09A7FD|18      |      ;
						ADC.B #$01                           ;09A7FE|6901    |      ;
	
			CODE_09A800:
						RTS                                  ;09A800|60      |      ;
	
	
			DATA8_09A801:
						db $04,$0C                           ;09A801|        |      ;


}

	
{ ; -- 04 boss mamaBat 

		
		bossPreview_mamaBat_04:
						LDA.B r_bossActiveFlag               ;09A931|A578    |000078;
						BEQ CODE_09A953                      ;09A933|F01E    |09A953;
						JSR.W getLowAI                       ;09A935|20C3A4  |09A4C3;
						BNE CODE_09A94B                      ;09A938|D011    |09A94B;
						DEC.W r_entity_extra,X               ;09A93A|DED805  |0905D8;
						BNE CODE_09A95B                      ;09A93D|D01C    |09A95B;
						LDA.B #$0A                           ;09A93F|A90A    |      ;
						LDY.B #$20                           ;09A941|A020    |      ;
						db $20                               ;09A943|        |      ;
						dw setSpriteAndAnimGroup_AY                 ;09A944|        |0FEF5C;
						LDA.B #$46                           ;09A946|A946    |      ;
						JMP.W setEnityAi_scriptIDX_01        ;09A948|4C4F86  |09864F;
	
	
			CODE_09A94B:
						LDA.W r_entity_AI_IDX,X              ;09A94B|BDC105  |0905C1;
						CMP.B #$02                           ;09A94E|C902    |      ;
						BEQ CODE_09A96C                      ;09A950|F01A    |09A96C;
						RTS                                  ;09A952|60      |      ;
	
	
			CODE_09A953:
						JSR.W CODE_0985EE                    ;09A953|20EE85  |0985EE;
						LDA.B #$80                           ;09A956|A980    |      ;
						STA.W r_entity_extra,X               ;09A958|9DD805  |0905D8;
	
			CODE_09A95B:
						LDA.B #$00                           ;09A95B|A900    |      ;
						STA.W r_entity_FacingLeft,X          ;09A95D|9DA804  |0904A8;
						LDA.B #$04                           ;09A960|A904    |      ;
						STA.W r_Player_StateDoubled,X        ;09A962|9D6505  |090565;
						LDA.B #$0A                           ;09A965|A90A    |      ;
						LDY.B #$1F                           ;09A967|A01F    |      ;
						db $4C                               ;09A969|        |      ;
	
						dw setSpriteAndAnimGroup_AY                 ;09A96A|        |0FEF5C;
	
			CODE_09A96C:
						LDA.B #$40                           ;09A96C|A940    |      ;
						STA.W r_entity_mask,X                ;09A96E|9D7004  |090470;
						JSR.W AND_7F_r_orb_flagsTimer                    ;09A971|208AA1  |09A18A;
						LDA.B #$00                           ;09A974|A900    |      ;
						STA.W r_entity_extra,X               ;09A976|9DD805  |0905D8;
	
			CODE_09A979:
						STA.W r_entity_AI,X                  ;09A979|9DEF05  |0905EF;
						STA.W r_entity_AI_IDX,X              ;09A97C|9DC105  |0905C1;
						RTS                                  ;09A97F|60      |      ;
	
	
			CODE_09A980:
						LDA.B #$00                           ;09A980|A900    |      ;
						STA.W r_entity_ID,X                  ;09A982|9D4E05  |09054E;
						STA.W r_entity_spriteID,X            ;09A985|9D0004  |090400;
						STA.W r_entity_spriteGroup,X         ;09A988|9D8C04  |09048C;
						BEQ CODE_09A979                      ;09A98B|F0EC    |09A979;
						STA.W r_VramQueue,X                  ;09A98D|9D0003  |090300;
						INX                                  ;09A990|E8      |      ;
						RTS                                  ;09A991|60      |      ;
					
		
		
		bossID_mamaBat_04:
						LDA.B r_HUD_healthBoss               ;09A992|A53D    |00003D;
						BNE CODE_09A999                      ;09A994|D003    |09A999;       |      ;
						jmp mamaBat_bossRoutine                       ;09A997|        |0FE6A5;
	
			CODE_09A999:
						JSR.W getLowAI                       ;09A999|20C3A4  |09A4C3;
						CMP.B #$48                           ;09A99C|C948    |      ;
						BNE CODE_09A9A7                      ;09A99E|D007    |09A9A7;
						LDA.B #$00                           ;09A9A0|A900    |      ;
						STA.B r_bossSpecialHitbox            ;09A9A2|85BA    |0000BA;
						JMP.W CODE_09AB56                    ;09A9A4|4C56AB  |09AB56;
	
	
			CODE_09A9A7:
						LDA.B #$FF                           ;09A9A7|A9FF    |      ;
						STA.B r_bossSpecialHitbox            ;09A9A9|85BA    |0000BA;
						LDA.W r_entity_target,X              ;09A9AB|BD0606  |090606;
						BNE CODE_09A9B6                      ;09A9AE|D006    |09A9B6;
						STA.W r_bossPieces       ;09A9B0|8DEC07  |0907EC;
						STA.W $07EE                          ;09A9B3|8DEE07  |0907EE;
	
			CODE_09A9B6:
						LDY.B #$02                           ;09A9B6|A002    |      ;
						LDA.W r_damagActionFlag,X            ;09A9B8|BD1D06  |09061D;
						BEQ CODE_09A9C6                      ;09A9BB|F009    |09A9C6;
						AND.B #$08                           ;09A9BD|2908    |      ;
						BNE CODE_09A9C2                      ;09A9BF|D001    |09A9C2;
						DEY                                  ;09A9C1|88      |      ;
	
			CODE_09A9C2:
						TYA                                  ;09A9C2|98      |      ;
						STA.W r_entity_PaletteOverride,X     ;09A9C3|9D5404  |090454;
	
			CODE_09A9C6:
						LDA.W r_entity_XPos,X                ;09A9C6|BD3804  |090438;
						CMP.B #$04                           ;09A9C9|C904    |      ;
						BCS CODE_09A9CF                      ;09A9CB|B002    |09A9CF;
						LDA.B #$04                           ;09A9CD|A904    |      ;
	
			CODE_09A9CF:
						CMP.B #$FC                           ;09A9CF|C9FC    |      ;
						BCC CODE_09A9D5                      ;09A9D1|9002    |09A9D5;
						LDA.B #$FB                           ;09A9D3|A9FB    |      ;
	
			CODE_09A9D5:
						STA.W r_entity_XPos,X                ;09A9D5|9D3804  |090438;
						LDA.W r_entity_YPos,X                ;09A9D8|BD1C04  |09041C;
						CMP.B #$40                           ;09A9DB|C940    |      ;
						BCS CODE_09A9E1                      ;09A9DD|B002    |09A9E1;
						LDA.B #$40                           ;09A9DF|A940    |      ;
	
			CODE_09A9E1:
						CMP.B #$A0                           ;09A9E1|C9A0    |      ;
						BCC CODE_09A9E7                      ;09A9E3|9002    |09A9E7;
						LDA.B #$9F                           ;09A9E5|A99F    |      ;
	
			CODE_09A9E7:
						STA.W r_entity_YPos,X                ;09A9E7|9D1C04  |09041C;
						LDY.W r_damagActionFlag,X            ;09A9EA|BC1D06  |09061D;
						BEQ CODE_09A9FC                      ;09A9ED|F00D    |09A9FC;
						DEY                                  ;09A9EF|88      |      ;
						BEQ CODE_09AA68                      ;09A9F0|F076    |09AA68;
						TYA                                  ;09A9F2|98      |      ;
						STA.W r_damagActionFlag,X            ;09A9F3|9D1D06  |09061D;
						LDA.B #$0F                           ;09A9F6|A90F    |      ;
						STA.W r_player_WeaImpact,X           ;09A9F8|9D8D06  |09068D;
						RTS                                  ;09A9FB|60      |      ;
	
	
			CODE_09A9FC:
						LDA.W r_Player_StateDoubled,X        ;09A9FC|BD6505  |090565;
						AND.B #$08                           ;09A9FF|2908    |      ;
						BEQ CODE_09AA05                      ;09AA01|F002    |09AA05;
						LDA.B #$01                           ;09AA03|A901    |      ;
	
			CODE_09AA05:
						STA.W r_entity_FacingLeft,X          ;09AA05|9DA804  |0904A8;
						LDA.W r_entity_damageRelated,X       ;09AA08|BD6906  |090669;
						AND.B #$F0                           ;09AA0B|29F0    |      ;
						BNE CODE_09AA12                      ;09AA0D|D003    |09AA12;
						JMP.W CODE_09AAA0                    ;09AA0F|4CA0AA  |09AAA0;
	
	
			CODE_09AA12:
						LDA.B #$2B                           ;09AA12|A92B    |      ;
						db $20                               ;09AA14|        |      ;
						dw lunchMusic                        ;09AA15|        |0FE25F;
						LDA.B #$00                           ;09AA17|A900    |      ;
						STA.W $07EE                          ;09AA19|8DEE07  |0907EE;
						STA.W r_entity_damageRelated,X       ;09AA1C|9D6906  |090669;
						db $20                               ;09AA1F|        |      ;
						dw setMovmentSpdZero                 ;09AA20|        |0FFEC8;
						LDA.W r_entity_AI,X                  ;09AA22|BDEF05  |0905EF;
						AND.B #$80                           ;09AA25|2980    |      ;
						STA.W r_entity_AI,X                  ;09AA27|9DEF05  |0905EF;
						LDY.B #$04                           ;09AA2A|A004    |      ;
						LDA.W r_entity_target,X              ;09AA2C|BD0606  |090606;
						BNE CODE_09AA33                      ;09AA2F|D002    |09AA33;
						LDY.B #$08                           ;09AA31|A008    |      ;
	
			CODE_09AA33:
						STY.B $00                            ;09AA33|8400    |000000;
						LDA.B r_HUD_healthBoss               ;09AA35|A53D    |00003D;
						SEC                                  ;09AA37|38      |      ;
						SBC.B $00                            ;09AA38|E500    |000000;
						BCS CODE_09AA3E                      ;09AA3A|B002    |09AA3E;
						LDA.B #$00                           ;09AA3C|A900    |      ;
	
			CODE_09AA3E:
						STA.B r_HUD_healthBoss               ;09AA3E|853D    |00003D;
						LDA.W r_entity_target,X              ;09AA40|BD0606  |090606;
						CMP.B #$03                           ;09AA43|C903    |      ;
						BNE CODE_09AA5D                      ;09AA45|D016    |09AA5D;
						CPX.W r_bossPieces       ;09AA47|ECEC07  |0907EC;
						BNE CODE_09AA51                      ;09AA4A|D005    |09AA51;
						LDA.B #$00                           ;09AA4C|A900    |      ;
						STA.W r_bossPieces       ;09AA4E|8DEC07  |0907EC;
	
			CODE_09AA51:
						LDY.B #$04                           ;09AA51|A004    |      ;
						LDA.B #$0E                           ;09AA53|A90E    |      ;
						db $20                               ;09AA55|        |      ;
						dw setSpriteAndAnimGroup_AY                 ;09AA56|        |0FEF5C;
						LDA.B #$C8                           ;09AA58|A9C8    |      ;
						JMP.W setEnityAi_scriptIDX_01        ;09AA5A|4C4F86  |09864F;
	
	
			CODE_09AA5D:
						LDA.B #$40                           ;09AA5D|A940    |      ;
						STA.W r_damagActionFlag,X            ;09AA5F|9D1D06  |09061D;
						LDA.B #$0F                           ;09AA62|A90F    |      ;
						STA.W r_player_WeaImpact,X           ;09AA64|9D8D06  |09068D;
						RTS                                  ;09AA67|60      |      ;
	
	
			CODE_09AA68:
						LDA.B #$04                           ;09AA68|A904    |      ;
						JSR.W setEntity_pos_06               ;09AA6A|206687  |098766;
						INC.W r_entity_target,X              ;09AA6D|FE0606  |090606;
						LDA.W r_entity_target,X              ;09AA70|BD0606  |090606;
						STA.W r_entity_target,Y              ;09AA73|990606  |090606;
						LDA.B #$40                           ;09AA76|A940    |      ;
						STA.W r_entity_mask,Y                ;09AA78|997004  |090470;
						LDA.B #$00                           ;09AA7B|A900    |      ;
						STA.W r_damagActionFlag,X            ;09AA7D|9D1D06  |09061D;
						STA.W r_damagActionFlag,Y            ;09AA80|991D06  |09061D;
						STA.W r_entity_PaletteOverride,X     ;09AA83|9D5404  |090454;
						STA.W r_entity_PaletteOverride,Y     ;09AA86|995404  |090454;
						LDA.W r_player_WeaImpact,X           ;09AA89|BD8D06  |09068D;
						AND.B #$F0                           ;09AA8C|29F0    |      ;
						STA.W r_player_WeaImpact,X           ;09AA8E|9D8D06  |09068D;
						STA.W r_player_WeaImpact,Y           ;09AA91|998D06  |09068D;
						STX.B $17                            ;09AA94|8617    |000017;
						TYA                                  ;09AA96|98      |      ;
						TAX                                  ;09AA97|AA      |      ;
						JSR.W CODE_09AB29                    ;09AA98|2029AB  |09AB29;
						LDX.B $17                            ;09AA9B|A617    |000017;
						JMP.W CODE_09AB29                    ;09AA9D|4C29AB  |09AB29;
	
	
			CODE_09AAA0:
						JSR.W CODE_09A1DE                    ;09AAA0|20DEA1  |09A1DE;
						LDA.W r_entity_target,X              ;09AAA3|BD0606  |090606;
						ASL A                                ;09AAA6|0A      |      ;
						TAY                                  ;09AAA7|A8      |      ;
						LDA.W DATA8_09AB86,Y                 ;09AAA8|B986AB  |09AB86;
						STA.B $00                            ;09AAAB|8500    |000000;
						LDA.W DATA8_09AB87,Y                 ;09AAAD|B987AB  |09AB87;
						LDY.B $00                            ;09AAB0|A400    |000000;
						db $20                               ;09AAB2|        |      ;
						dw getCollusionBasedOnOffset         ;09AAB3|        |0FFC1E;
						STA.B $00                            ;09AAB5|8500    |000000;
						LDA.W r_entity_target,X              ;09AAB7|BD0606  |090606;
						BNE CODE_09AAD7                      ;09AABA|D01B    |09AAD7;
						LDA.B $00                            ;09AABC|A500    |000000;
						BEQ CODE_09AAD7                      ;09AABE|F017    |09AAD7;
						JSR.W getLowAI                       ;09AAC0|20C3A4  |09A4C3;
						BNE CODE_09AAD7                      ;09AAC3|D012    |09AAD7;
						LDA.B r_RNG                          ;09AAC5|A51F    |00001F;
						AND.B #$01                           ;09AAC7|2901    |      ;
						BEQ CODE_09AAD7                      ;09AAC9|F00C    |09AAD7;
						LDA.B #$0A                           ;09AACB|A90A    |      ;
						LDY.B #$1F                           ;09AACD|A01F    |      ;
						db $20                               ;09AACF|        |      ;
						dw setSpriteAndAnimGroup_AY                 ;09AAD0|        |0FEF5C;
						LDA.B #$09                           ;09AAD2|A909    |      ;
						JMP.W setEnityAi_scriptIDX_01        ;09AAD4|4C4F86  |09864F;
	
	
			CODE_09AAD7:
						JSR.W getLowAI                       ;09AAD7|20C3A4  |09A4C3;
						BNE CODE_09AB30                      ;09AADA|D054    |09AB30;
						LDY.B #$01                           ;09AADC|A001    |      ;
	
			CODE_09AADE:
						LDA.W r_entity_ID,Y                  ;09AADE|B94E05  |09054E;
						BNE CODE_09AAE8                      ;09AAE1|D005    |09AAE8;
						INY                                  ;09AAE3|C8      |      ;
						CPY.B #$0D                           ;09AAE4|C00D    |      ;
						BNE CODE_09AADE                      ;09AAE6|D0F6    |09AADE;
	
			CODE_09AAE8:
						STY.B $00                            ;09AAE8|8400    |000000;
						CPX.B $00                            ;09AAEA|E400    |000000;
						BNE CODE_09AB16                      ;09AAEC|D028    |09AB16;
						LDA.W $07EE                          ;09AAEE|ADEE07  |0907EE;
						BEQ CODE_09AAF8                      ;09AAF1|F005    |09AAF8;
						CMP.B #$03                           ;09AAF3|C903    |      ;
						BEQ CODE_09AB16                      ;09AAF5|F01F    |09AB16;
						RTS                                  ;09AAF7|60      |      ;
	
	
			CODE_09AAF8:
						LDA.B r_RNG                          ;09AAF8|A51F    |00001F;
						CMP.B #$20                           ;09AAFA|C920    |      ;
						BCS CODE_09AB16                      ;09AAFC|B018    |09AB16;
						LDA.W r_entity_target,X              ;09AAFE|BD0606  |090606;
						BEQ CODE_09AB16                      ;09AB01|F013    |09AB16;
						LDA.B #$01                           ;09AB03|A901    |      ;
						STA.W $07EE                          ;09AB05|8DEE07  |0907EE;
						JSR.W CODE_09AB3D                    ;09AB08|203DAB  |09AB3D;
						JSR.W getLowAI                       ;09AB0B|20C3A4  |09A4C3;
						CMP.B #$1A                           ;09AB0E|C91A    |      ;
						BEQ CODE_09AB30                      ;09AB10|F01E    |09AB30;
						LDA.B #$1A                           ;09AB12|A91A    |      ;
						BNE CODE_09AB26                      ;09AB14|D010    |09AB26;
	
			CODE_09AB16:
						LDA.B #$00                           ;09AB16|A900    |      ;
						STA.W r_entity_Counter,X             ;09AB18|9D3306  |090633;
						LDA.B r_RNG                          ;09AB1B|A51F    |00001F;
						AND.B #$01                           ;09AB1D|2901    |      ;
						BEQ CODE_09AB29                      ;09AB1F|F008    |09AB29;
						JSR.W CODE_09AB31                    ;09AB21|2031AB  |09AB31;
						LDA.B #$19                           ;09AB24|A919    |      ;
	
			CODE_09AB26:
						JMP.W setEnityAi_scriptIDX_01        ;09AB26|4C4F86  |09864F;
	
	
			CODE_09AB29:
						JSR.W CODE_09AB31                    ;09AB29|2031AB  |09AB31;
						LDA.B #$18                           ;09AB2C|A918    |      ;
						BNE CODE_09AB26                      ;09AB2E|D0F6    |09AB26;
	
			CODE_09AB30:
						RTS                                  ;09AB30|60      |      ;
	
	
			CODE_09AB31:
						LDA.B #$1B                           ;09AB31|A91B    |      ;
						CLC                                  ;09AB33|18      |      ;
						ADC.W r_entity_target,X              ;09AB34|7D0606  |090606;
						TAY                                  ;09AB37|A8      |      ;
						LDA.B #$0A                           ;09AB38|A90A    |      ;
						db $4C                               ;09AB3A|        |      ;
	
						dw setSpriteAndAnimGroup_AY                 ;09AB3B|        |0FEF5C;
	
			CODE_09AB3D:
						LDY.B #$01                           ;09AB3D|A001    |      ;
	
			CODE_09AB3F:
						LDA.W r_entity_ID,Y                  ;09AB3F|B94E05  |09054E;
						CMP.B #$04                           ;09AB42|C904    |      ;
						BNE CODE_09AB50                      ;09AB44|D00A    |09AB50;
						LDA.B #$9A                           ;09AB46|A99A    |      ;
						STA.W r_entity_AI,Y                  ;09AB48|99EF05  |0905EF;
						LDA.B #$00                           ;09AB4B|A900    |      ;
						STA.W r_entity_AI_IDX,Y              ;09AB4D|99C105  |0905C1;
	
			CODE_09AB50:
						INY                                  ;09AB50|C8      |      ;
						CPY.B #$0D                           ;09AB51|C00D    |      ;
						BNE CODE_09AB3F                      ;09AB53|D0EA    |09AB3F;
	
			CODE_09AB55:
						RTS                                  ;09AB55|60      |      ;
	
	
			CODE_09AB56:
						LDA.W r_entity_AI_IDX,X              ;09AB56|BDC105  |0905C1;
						CMP.B #$02                           ;09AB59|C902    |      ;
						BEQ CODE_09AB55                      ;09AB5B|F0F8    |09AB55;
						LDA.B #$00                           ;09AB5D|A900    |      ;
						STA.B r_index                        ;09AB5F|8510    |000010;
						LDY.B #$01                           ;09AB61|A001    |      ;
	
			CODE_09AB63:
						LDA.W r_entity_ID,Y                  ;09AB63|B94E05  |09054E;
						CMP.B #$04                           ;09AB66|C904    |      ;
						BNE CODE_09AB6C                      ;09AB68|D002    |09AB6C;
						INC.B r_index                        ;09AB6A|E610    |000010;
	
			CODE_09AB6C:
						INY                                  ;09AB6C|C8      |      ;
						CPY.B #$0D                           ;09AB6D|C00D    |      ;
						BNE CODE_09AB63                      ;09AB6F|D0F2    |09AB63;
						DEC.B r_index                        ;09AB71|C610    |000010;
						BNE CODE_09AB78                      ;09AB73|D003    |09AB78;
						JSR.W mamaBatLastBatDefeated                    ;09AB75|2098AB  |09AB98;
	
			CODE_09AB78:
						JSR.W CODE_09A980                    ;09AB78|2080A9  |09A980;
						LDA.B #$68                           ;09AB7B|A968    |      ;
						STA.W r_entity_ID,X                  ;09AB7D|9D4E05  |09054E;
						LDA.B #$65                           ;09AB80|A965    |      ;
						STA.W r_entity_AI,X                  ;09AB82|9DEF05  |0905EF;
						RTS                                  ;09AB85|60      |      ;
	
	
			DATA8_09AB86:
						db $F0                               ;09AB86|        |      ;
	
			DATA8_09AB87:
						db $08,$F8,$08,$F8                   ;09AB87|        |      ;
						db $04,$FC,$04,$0F                   ;09AB8B|        |      ;
						db $0F,$23,$1B,$FF                   ;09AB8F|        |      ;
						db $0F,$31,$23,$13                   ;09AB93|        |      ;
						db $FF                               ;09AB97|        |      ;
	
			mamaBatLastBatDefeated:
						LDA.B #$50                           ;09AB98|A950    |      ;
						JSR.W setEntity__09                  ;09AB9A|206186  |098661;
						LDA.B #$02                           ;09AB9D|A902    |      ;
						STA.W r_orb_flagsTimer               ;09AB9F|8DF307  |0907F3;
						db $20                               ;09ABA2|        |      ;
						dw setAutoPlayFlag                   ;09ABA3|        |0FE5CE;
						LDA.B #$01                           ;09ABA5|A901    |      ;
						JSR.W setEntity_stats_03             ;09ABA7|20F487  |0987F4;
						LDA.B #$7B                           ;09ABAA|A97B    |      ;
						jmp lunchMusic                        ;09ABAD|        |0FE25F;
	


}

	
{ ; -- 05 boss Alucard

		
		bossPreview_alucard_05:
						LDA.B r_bossActiveFlag               ;09ABAF|A578    |000078;
						BEQ CODE_09ABBB                      ;09ABB1|F008    |09ABBB;
						LDA.W r_entity_AI_IDX,X              ;09ABB3|BDC105  |0905C1;
						CMP.B #$04                           ;09ABB6|C904    |      ;
						BEQ CODE_09ABD4                      ;09ABB8|F01A    |09ABD4;
						RTS                                  ;09ABBA|60      |      ;
	
	
			CODE_09ABBB:
						LDA.B #$CC                           ;09ABBB|A9CC    |      ;
						STA.W r_entity_mask,X                ;09ABBD|9D7004  |090470;
						LDA.B #$00                           ;09ABC0|A900    |      ;
						STA.W r_entity_FacingLeft,X          ;09ABC2|9DA804  |0904A8;
						STA.W r_Player_StateDoubled,X        ;09ABC5|9D6505  |090565;
						LDA.B #$0A                           ;09ABC8|A90A    |      ;
						LDY.B #$24                           ;09ABCA|A024    |      ;
						db $20                               ;09ABCC|        |      ;
						dw setSpriteAndAnimGroup_AY                 ;09ABCD|        |0FEF5C;
						LDA.B #$45                           ;09ABCF|A945    |      ;
						JMP.W setEnityAi_scriptIDX_01        ;09ABD1|4C4F86  |09864F;
	
	
			CODE_09ABD4:
						TXA                                  ;09ABD4|8A      |      ;
						CMP.B #$06                           ;09ABD5|C906    |      ;
						BNE CODE_09ABEE                      ;09ABD7|D015    |09ABEE;
						JSR.W AND_7F_r_orb_flagsTimer      	 ;09ABD9|208AA1  |09A18A;
						LDY.B #$00                           ;09ABDC|A000    |      ;
						STY.W $07EE                          ;09ABDE|8CEE07  |0907EE;
						INY                                  ;09ABE1|C8      |      ;
						STY.W r_bossPieces       ;09ABE2|8CEC07  |0907EC;
						INY                                  ;09ABE5|C8      |      ;
						STY.W $07EF                          ;09ABE6|8CEF07  |0907EF;
						LDA.B #$06                           ;09ABE9|A906    |      ;
						STA.W $07F0                          ;09ABEB|8DF007  |0907F0;
	
			CODE_09ABEE:
						LDA.B #$00                           ;09ABEE|A900    |      ;
						STA.W r_entity_extra,X               ;09ABF0|9DD805  |0905D8;
						STA.W r_entity_AI,X                  ;09ABF3|9DEF05  |0905EF;
						STA.W r_entity_AI_IDX,X              ;09ABF6|9DC105  |0905C1;
						LDA.B #$40                           ;09ABF9|A940    |      ;
						STA.W r_entity_mask,X                ;09ABFB|9D7004  |090470;
						JMP.W CODE_09ADAF                    ;09ABFE|4CAFAD  |09ADAF;
			
		
		
		
		bossID_alucard_05:
						JSR.W CODE_09A1DE                    ;09AC3D|20DEA1  |09A1DE;
						LDA.B #$50                           ;09AC40|A950    |      ;
						STA.W r_entity_mask,X                ;09AC42|9D7004  |090470;
						JSR.W getLowAI                       ;09AC45|20C3A4  |09A4C3;
						CMP.B #$1E                           ;09AC48|C91E    |      ;
						BEQ CODE_09AC70                      ;09AC4A|F024    |09AC70;
						LDA.W r_entity_XPos,X                ;09AC4C|BD3804  |090438;
						CMP.B #$10                           ;09AC4F|C910    |      ;
						BCS CODE_09AC55                      ;09AC51|B002    |09AC55;
						LDA.B #$10                           ;09AC53|A910    |      ;
	
			CODE_09AC55:
						CMP.B #$F0                           ;09AC55|C9F0    |      ;
						BCC CODE_09AC5B                      ;09AC57|9002    |09AC5B;
						LDA.B #$EF                           ;09AC59|A9EF    |      ;
	
			CODE_09AC5B:
						STA.W r_entity_XPos,X                ;09AC5B|9D3804  |090438;
						LDA.W r_entity_YPos,X                ;09AC5E|BD1C04  |09041C;
						CMP.B #$40                           ;09AC61|C940    |      ;
						BCS CODE_09AC67                      ;09AC63|B002    |09AC67;
						LDA.B #$40                           ;09AC65|A940    |      ;
	
			CODE_09AC67:
						CMP.B #$F0                           ;09AC67|C9F0    |      ;
						BCC CODE_09AC6D                      ;09AC69|9002    |09AC6D;
						LDA.B #$EF                           ;09AC6B|A9EF    |      ;
	
			CODE_09AC6D:
						STA.W r_entity_YPos,X                ;09AC6D|9D1C04  |09041C;
	
			CODE_09AC70:
						LDA.W r_entity_damageRelated,X       ;09AC70|BD6906  |090669;
						STA.B $00                            ;09AC73|8500    |000000;
						LDA.W r_entity_damageRelated,X       ;09AC75|BD6906  |090669;
						AND.B #$02                           ;09AC78|2902    |      ;
						BNE CODE_09AC8E                      ;09AC7A|D012    |09AC8E;
						LDA.W $07EF                          ;09AC7C|ADEF07  |0907EF;
						BNE CODE_09AC89                      ;09AC7F|D008    |09AC89;
						JSR.W setEntity__0A                  ;09AC81|203182  |098231;
						LDA.B #$40                           ;09AC84|A940    |      ;
						STA.W r_entity_mask,X                ;09AC86|9D7004  |090470;
	
			CODE_09AC89:
						LDA.B #$00                           ;09AC89|A900    |      ;
						STA.W r_entity_damageRelated,X       ;09AC8B|9D6906  |090669;
	
			CODE_09AC8E:
						LDY.W $07EF                          ;09AC8E|ACEF07  |0907EF;
						BNE CODE_09ACFC                      ;09AC91|D069    |09ACFC;
						LDY.W r_orb_flagsTimer               ;09AC93|ACF307  |0907F3;
						DEY                                  ;09AC96|88      |      ;
						BNE CODE_09ACA1                      ;09AC97|D008    |09ACA1;
						LDA.B #$00                           ;09AC99|A900    |      ;
						STA.W r_entity_damage,X              ;09AC9B|9D5706  |090657;
						JMP.W CODE_09AE64                    ;09AC9E|4C64AE  |09AE64;
	
	
			CODE_09ACA1:
						LDA.B #$01                           ;09ACA1|A901    |      ;
						JSR.W setEntity_stats_03             ;09ACA3|20F487  |0987F4;
						LDA.W r_orb_flagsTimer               ;09ACA6|ADF307  |0907F3;
						BNE CODE_09ACBA                      ;09ACA9|D00F    |09ACBA;
						LDA.W r_entity_target,X              ;09ACAB|BD0606  |090606;
						BEQ CODE_09ACBB                      ;09ACAE|F00B    |09ACBB;
						JSR.W getLowAI                       ;09ACB0|20C3A4  |09A4C3;
						BNE CODE_09ACBA                      ;09ACB3|D005    |09ACBA;
						LDA.B #$01                           ;09ACB5|A901    |      ;
						STA.W $07EF                          ;09ACB7|8DEF07  |0907EF;
	
			CODE_09ACBA:
						RTS                                  ;09ACBA|60      |      ;
	
	
			CODE_09ACBB:
						LDA.B #$21                           ;09ACBB|A921    |      ;
						JSR.W setEntity_pos_06               ;09ACBD|206687  |098766;
						LDA.B r_HUD_healthBoss               ;09ACC0|A53D    |00003D;
						STA.W r_entity_Health,Y              ;09ACC2|997B06  |09067B;
						LDA.B #$C8                           ;09ACC5|A9C8    |      ;
						STA.W r_entity_mask,Y                ;09ACC7|997004  |090470;
						TXA                                  ;09ACCA|8A      |      ;
						STA.W r_entity_target,Y              ;09ACCB|990606  |090606;
						STA.W r_bossPieces       ;09ACCE|8DEC07  |0907EC;
						LDA.B #$01                           ;09ACD1|A901    |      ;
						STA.W r_entity_target,X              ;09ACD3|9D0606  |090606;
						LDA.W r_entity_XPos                  ;09ACD6|AD3804  |090438;
						CMP.W r_entity_XPos,X                ;09ACD9|DD3804  |090438;
						BCS CODE_09ACE2                      ;09ACDC|B004    |09ACE2;
						LDA.B #$0C                           ;09ACDE|A90C    |      ;
						BNE CODE_09ACE4                      ;09ACE0|D002    |09ACE4;
	
			CODE_09ACE2:
						LDA.B #$04                           ;09ACE2|A904    |      ;
	
			CODE_09ACE4:
						STA.W r_Player_StateDoubled,X        ;09ACE4|9D6505  |090565;
						AND.B #$08                           ;09ACE7|2908    |      ;
						BEQ CODE_09ACED                      ;09ACE9|F002    |09ACED;
						LDA.B #$01                           ;09ACEB|A901    |      ;
	
			CODE_09ACED:
						STA.W r_entity_FacingLeft,X          ;09ACED|9DA804  |0904A8;
						LDA.B #$0A                           ;09ACF0|A90A    |      ;
						LDY.B #$21                           ;09ACF2|A021    |      ;
						db $20                               ;09ACF4|        |      ;
						dw setSpriteAndAnimGroup_AY                 ;09ACF5|        |0FEF5C;
						LDA.B #$1C                           ;09ACF7|A91C    |      ;
						JMP.W setEnityAi_scriptIDX_01        ;09ACF9|4C4F86  |09864F;
	
	
			CODE_09ACFC:
						DEY                                  ;09ACFC|88      |      ;
						BNE CODE_09AD6F                      ;09ACFD|D070    |09AD6F;
						CPX.W r_bossPieces       ;09ACFF|ECEC07  |0907EC;
						BNE CODE_09AD58                      ;09AD02|D054    |09AD58;
						LDA.W r_entity_target,X              ;09AD04|BD0606  |090606;
						CMP.B #$01                           ;09AD07|C901    |      ;
						BEQ CODE_09AD59                      ;09AD09|F04E    |09AD59;
						JSR.W getLowAI                       ;09AD0B|20C3A4  |09A4C3;
						BNE CODE_09AD58                      ;09AD0E|D048    |09AD58;
	
			CODE_09AD10:
						LDA.B #$05                           ;09AD10|A905    |      ;
						JSR.W setEntity_pos_06               ;09AD12|206687  |098766;
						BCC CODE_09AD3D                      ;09AD15|9026    |09AD3D;
						LDA.B #$00                           ;09AD17|A900    |      ;
						STA.W r_entity_damageRelated,Y       ;09AD19|996906  |090669;
						LDA.B #$02                           ;09AD1C|A902    |      ;
						STA.W r_entity_target,Y              ;09AD1E|990606  |090606;
						LDA.B #$40                           ;09AD21|A940    |      ;
						STA.W r_entity_mask,Y                ;09AD23|997004  |090470;
						LDA.B #$80                           ;09AD26|A980    |      ;
						STA.W r_entity_AI,X                  ;09AD28|9DEF05  |0905EF;
						STX.B $00                            ;09AD2B|8600    |000000;
						TYA                                  ;09AD2D|98      |      ;
						TAX                                  ;09AD2E|AA      |      ;
						LDA.B #$0A                           ;09AD2F|A90A    |      ;
						LDY.B #$24                           ;09AD31|A024    |      ;
						db $20                               ;09AD33|        |      ;
						dw setSpriteAndAnimGroup_AY                 ;09AD34|        |0FEF5C;
						LDX.B $00                            ;09AD36|A600    |000000;
						DEC.W $07F0                          ;09AD38|CEF007  |0907F0;
						BNE CODE_09AD10                      ;09AD3B|D0D3    |09AD10;
	
			CODE_09AD3D:
						LDA.B #$0A                           ;09AD3D|A90A    |      ;
						LDY.B #$24                           ;09AD3F|A024    |      ;
						db $20                               ;09AD41|        |      ;
						dw setSpriteAndAnimGroup_AY                 ;09AD42|        |0FEF5C;
						LDA.B #$02                           ;09AD44|A902    |      ;
						STA.W $07EF                          ;09AD46|8DEF07  |0907EF;
						LDA.B #$00                           ;09AD49|A900    |      ;
						STA.W $07EE                          ;09AD4B|8DEE07  |0907EE;
						LDA.B #$80                           ;09AD4E|A980    |      ;
						STA.W r_entity_AI,X                  ;09AD50|9DEF05  |0905EF;
						LDA.B #$C0                           ;09AD53|A9C0    |      ;
						STA.W r_damagActionFlag,X            ;09AD55|9D1D06  |09061D;
	
			CODE_09AD58:
						RTS                                  ;09AD58|60      |      ;
	
	
			CODE_09AD59:
						LDA.B #$02                           ;09AD59|A902    |      ;
						STA.W r_entity_target,X              ;09AD5B|9D0606  |090606;
						LDA.B #$06                           ;09AD5E|A906    |      ;
						STA.W $07F0                          ;09AD60|8DF007  |0907F0;
						LDA.B #$0A                           ;09AD63|A90A    |      ;
						LDY.B #$28                           ;09AD65|A028    |      ;
						db $20                               ;09AD67|        |      ;
						dw setSpriteAndAnimGroup_AY                 ;09AD68|        |0FEF5C;
						LDA.B #$20                           ;09AD6A|A920    |      ;
						JMP.W setEnityAi_scriptIDX_01        ;09AD6C|4C4F86  |09864F;
	
	
			CODE_09AD6F:
						LDA.B #$00                           ;09AD6F|A900    |      ;
						STA.W r_entity_damage,X              ;09AD71|9D5706  |090657;
						DEY                                  ;09AD74|88      |      ;
						BNE CODE_09ADED                      ;09AD75|D076    |09ADED;
						LDA.W $07EE                          ;09AD77|ADEE07  |0907EE;
						CMP.B #$02                           ;09AD7A|C902    |      ;
						BCC CODE_09AD8A                      ;09AD7C|900C    |09AD8A;
						LDA.W r_miscTicker                   ;09AD7E|AD1E06  |09061E;
						BEQ CODE_09ADC6                      ;09AD81|F043    |09ADC6;
						DEC.W r_damagActionFlag,X            ;09AD83|DE1D06  |09061D;
						LDA.B $00                            ;09AD86|A500    |000000;
						BNE CODE_09ADC6                      ;09AD88|D03C    |09ADC6;
	
			CODE_09AD8A:
						TXA                                  ;09AD8A|8A      |      ;
						CMP.W r_bossPieces       ;09AD8B|CDEC07  |0907EC;
						BNE CODE_09AD9D                      ;09AD8E|D00D    |09AD9D;
						LDA.W $07EE                          ;09AD90|ADEE07  |0907EE;
						BNE CODE_09ADAF                      ;09AD93|D01A    |09ADAF;
						LDA.B #$01                           ;09AD95|A901    |      ;
						STA.W $07EE                          ;09AD97|8DEE07  |0907EE;
						JSR.W CODE_09AE4B                    ;09AD9A|204BAE  |09AE4B;
	
			CODE_09AD9D:
						JSR.W getLowAI                       ;09AD9D|20C3A4  |09A4C3;
						CMP.B #$1E                           ;09ADA0|C91E    |      ;
						BEQ CODE_09ADC0                      ;09ADA2|F01C    |09ADC0;
						CMP.B #$1B                           ;09ADA4|C91B    |      ;
						BEQ CODE_09ADC0                      ;09ADA6|F018    |09ADC0;
						LDA.B #$0A                           ;09ADA8|A90A    |      ;
						LDY.B #$24                           ;09ADAA|A024    |      ;
						db $4C                               ;09ADAC|        |      ;
	
						dw setSpriteAndAnimGroup_AY                 ;09ADAD|        |0FEF5C;
	
			CODE_09ADAF:
						JSR.W getLowAI                       ;09ADAF|20C3A4  |09A4C3;
						BNE CODE_09ADC0                      ;09ADB2|D00C    |09ADC0;
						LDA.B #$0A                           ;09ADB4|A90A    |      ;
						LDY.B #$24                           ;09ADB6|A024    |      ;
						db $20                               ;09ADB8|        |      ;
						dw setSpriteAndAnimGroup_AY                 ;09ADB9|        |0FEF5C;
						LDA.B #$19                           ;09ADBB|A919    |      ;
						JMP.W setEnityAi_scriptIDX_01        ;09ADBD|4C4F86  |09864F;
	
	
			CODE_09ADC0:
						LDA.B #$03                           ;09ADC0|A903    |      ;
						STA.W r_entity_target,X              ;09ADC2|9D0606  |090606;
						RTS                                  ;09ADC5|60      |      ;
	
	
			CODE_09ADC6:
						LDA.B #$03                           ;09ADC6|A903    |      ;
						STA.W $07EF                          ;09ADC8|8DEF07  |0907EF;
						LDY.W r_bossPieces       ;09ADCB|ACEC07  |0907EC;
	
			CODE_09ADCE:
						LDA.W r_entity_ID,Y                  ;09ADCE|B94E05  |09054E;
						CMP.B #$05                           ;09ADD1|C905    |      ;
						BNE CODE_09ADDF                      ;09ADD3|D00A    |09ADDF;
						LDA.B #$9F                           ;09ADD5|A99F    |      ;
						STA.W r_entity_AI,Y                  ;09ADD7|99EF05  |0905EF;
						LDA.B #$00                           ;09ADDA|A900    |      ;
						STA.W r_entity_AI_IDX,Y              ;09ADDC|99C105  |0905C1;
	
			CODE_09ADDF:
						INY                                  ;09ADDF|C8      |      ;
						CPY.B #$0D                           ;09ADE0|C00D    |      ;
						BNE CODE_09ADCE                      ;09ADE2|D0EA    |09ADCE;
						LDA.B #$00                           ;09ADE4|A900    |      ;
						STA.W r_orb_statesGlobal             ;09ADE6|8DED07  |0907ED;
						STA.W $07EE                          ;09ADE9|8DEE07  |0907EE;
						RTS                                  ;09ADEC|60      |      ;
	
	
			CODE_09ADED:
						DEY                                  ;09ADED|88      |      ;
						BNE CODE_09AE00                      ;09ADEE|D010    |09AE00;
						LDA.W $07EE                          ;09ADF0|ADEE07  |0907EE;
						BEQ CODE_09ADFF                      ;09ADF3|F00A    |09ADFF;
						CPX.W r_bossPieces       ;09ADF5|ECEC07  |0907EC;
						BNE CODE_09ADFF                      ;09ADF8|D005    |09ADFF;
						LDA.B #$04                           ;09ADFA|A904    |      ;
						STA.W $07EF                          ;09ADFC|8DEF07  |0907EF;
	
			CODE_09ADFF:
						RTS                                  ;09ADFF|60      |      ;
	
	
			CODE_09AE00:
						CPX.W r_bossPieces       ;09AE00|ECEC07  |0907EC;
						BEQ CODE_09AE17                      ;09AE03|F012    |09AE17;
						LDA.B #$00                           ;09AE05|A900    |      ;
						STA.W r_entity_ID,X                  ;09AE07|9D4E05  |09054E;
						STA.W r_entity_spriteID,X            ;09AE0A|9D0004  |090400;
						STA.W r_entity_spriteGroup,X         ;09AE0D|9D8C04  |09048C;
						STA.W r_entity_target,X              ;09AE10|9D0606  |090606;
						STA.W r_entity_AI,X                  ;09AE13|9DEF05  |0905EF;
						RTS                                  ;09AE16|60      |      ;
	
	
			CODE_09AE17:
						LDA.W r_entity_target,X              ;09AE17|BD0606  |090606;
						CMP.B #$03                           ;09AE1A|C903    |      ;
						BEQ CODE_09AE35                      ;09AE1C|F017    |09AE35;
						JSR.W getLowAI                       ;09AE1E|20C3A4  |09A4C3;
						BNE CODE_09AE34                      ;09AE21|D011    |09AE34;
						LDA.B #$00                           ;09AE23|A900    |      ;
						STA.W r_bossPieces       ;09AE25|8DEC07  |0907EC;
						STA.W r_orb_statesGlobal             ;09AE28|8DED07  |0907ED;
						STA.W $07EE                          ;09AE2B|8DEE07  |0907EE;
						STA.W $07EF                          ;09AE2E|8DEF07  |0907EF;
						STA.W r_entity_target,X              ;09AE31|9D0606  |090606;
	
			CODE_09AE34:
						RTS                                  ;09AE34|60      |      ;
	
	
			CODE_09AE35:
						LDA.B #$04                           ;09AE35|A904    |      ;
						STA.W r_entity_target,X              ;09AE37|9D0606  |090606;
						LDA.B #$06                           ;09AE3A|A906    |      ;
						STA.W $07F0                          ;09AE3C|8DF007  |0907F0;
						LDA.B #$0A                           ;09AE3F|A90A    |      ;
						LDY.B #$2C                           ;09AE41|A02C    |      ;
						db $20                               ;09AE43|        |      ;
						dw setSpriteAndAnimGroup_AY                 ;09AE44|        |0FEF5C;
						LDA.B #$20                           ;09AE46|A920    |      ;
						JMP.W setEnityAi_scriptIDX_01        ;09AE48|4C4F86  |09864F;
	
	
			CODE_09AE4B:
						LDY.B #$01                           ;09AE4B|A001    |      ;
	
			CODE_09AE4D:
						LDA.W r_entity_ID,Y                  ;09AE4D|B94E05  |09054E;
						CMP.B #$05                           ;09AE50|C905    |      ;
						BNE CODE_09AE5E                      ;09AE52|D00A    |09AE5E;
						LDA.B #$9E                           ;09AE54|A99E    |      ;
						STA.W r_entity_AI,Y                  ;09AE56|99EF05  |0905EF;
						LDA.B #$00                           ;09AE59|A900    |      ;
						STA.W r_entity_AI_IDX,Y              ;09AE5B|99C105  |0905C1;
	
			CODE_09AE5E:
						INY                                  ;09AE5E|C8      |      ;
						CPY.B #$0D                           ;09AE5F|C00D    |      ;
						BNE CODE_09AE4D                      ;09AE61|D0EA    |09AE4D;
	
			CODE_09AE63:
						RTS                                  ;09AE63|60      |      ;
	
	
			CODE_09AE64:
						JSR.W getLowAI                       ;09AE64|20C3A4  |09A4C3;
						CMP.B #$22                           ;09AE67|C922    |      ;
						BEQ CODE_09AE80                      ;09AE69|F015    |09AE80;
						CMP.B #$23                           ;09AE6B|C923    |      ;
						BEQ CODE_09AE63                      ;09AE6D|F0F4    |09AE63;
						LDA.B #$50                           ;09AE6F|A950    |      ;
						JSR.W setEntity__09                  ;09AE71|206186  |098661;
						LDA.B #$0A                           ;09AE74|A90A    |      ;
						LDY.B #$30                           ;09AE76|A030    |      ;
						db $20                               ;09AE78|        |      ;
						dw setSpriteAndAnimGroup_AY                 ;09AE79|        |0FEF5C;
						LDA.B #$23                           ;09AE7B|A923    |      ;
						JMP.W setEnityAi_scriptIDX_01        ;09AE7D|4C4F86  |09864F;
	
	
			CODE_09AE80:
						LDA.B #$06                           ;09AE80|A906    |      ;
						STA.B r_CHR_BankSpr_0800             ;09AE82|8548    |000048;
						LDA.B #$1F                           ;09AE84|A91F    |      ;
						STA.B r_CHR_BankSpr_0c00             ;09AE86|8549    |000049;
						db $20                               ;09AE88|        |      ;
						dw updateCHR_enemyCHR                ;09AE89|        |0FE33C;
						JSR.W CODE_09AE96                    ;09AE8B|2096AE  |09AE96;
						INC.W r_orb_flagsTimer               ;09AE8E|EEF307  |0907F3;
						LDA.B #$01                           ;09AE91|A901    |      ;
						JMP.W setEntity_stats_03             ;09AE93|4CF487  |0987F4;
	
	
			CODE_09AE96:
						LDY.B #$01                           ;09AE96|A001    |      ;
	
			CODE_09AE98:
						LDA.W r_entity_ID,Y                  ;09AE98|B94E05  |09054E;
						BEQ CODE_09AEB5                      ;09AE9B|F018    |09AEB5;
						CMP.B #$05                           ;09AE9D|C905    |      ;
						BEQ CODE_09AEB5                      ;09AE9F|F014    |09AEB5;
						LDA.B #$00                           ;09AEA1|A900    |      ;
						STA.W r_entity_ID,Y                  ;09AEA3|994E05  |09054E;
						STA.W r_entity_AI,Y                  ;09AEA6|99EF05  |0905EF;
						STA.W r_entity_spriteID,Y            ;09AEA9|990004  |090400;
						STA.W r_entity_spriteGroup,Y         ;09AEAC|998C04  |09048C;
						STA.W r_entity_XPos,Y                ;09AEAF|993804  |090438;
						STA.W r_entity_YPos,Y                ;09AEB2|991C04  |09041C;
	
			CODE_09AEB5:
						INY                                  ;09AEB5|C8      |      ;
						CPY.B #$0D                           ;09AEB6|C00D    |      ;
						BNE CODE_09AE98                      ;09AEB8|D0DE    |09AE98;
						RTS                                  ;09AEBA|60      |      ;
	
	
			bossID__17:
						JSR.W CODE_09A1DE                    ;09AEBB|20DEA1  |09A1DE;
						LDA.W r_entity_damageRelated,X       ;09AEBE|BD6906  |090669;
						BEQ CODE_09AECB                      ;09AEC1|F008    |09AECB;
						LDA.B #$33                           ;09AEC3|A933    |      ;
						db $20                               ;09AEC5|        |      ;
						dw lunchMusic                        ;09AEC6|        |0FE25F;
						JMP.W clear_bossSlot_02             ;09AEC8|4C3A87  |09873A;
	
	
			CODE_09AECB:
						LDA.W r_entity_XPos,X                ;09AECB|BD3804  |090438;
						CMP.B #$08                           ;09AECE|C908    |      ;
						BCC CODE_09AEE6                      ;09AED0|9014    |09AEE6;
						CMP.B #$F8                           ;09AED2|C9F8    |      ;
						BCS CODE_09AEE6                      ;09AED4|B010    |09AEE6;
						LDA.W r_entity_YPos,X                ;09AED6|BD1C04  |09041C;
						CMP.B #$40                           ;09AED9|C940    |      ;
						BCC CODE_09AEE6                      ;09AEDB|9009    |09AEE6;
						CMP.B #$F0                           ;09AEDD|C9F0    |      ;
						BCS CODE_09AEE6                      ;09AEDF|B005    |09AEE6;
						LDA.B #$1D                           ;09AEE1|A91D    |      ;
						JMP.W setEnityAi_scriptIDX_01        ;09AEE3|4C4F86  |09864F;
	
	
			CODE_09AEE6:
						JMP.W clear_bossSlot_02             ;09AEE6|4C3A87  |09873A;



}
	

{ ; -- 06 boss snakeKing


		bossPreview_snakeKing_06:
						LDA.B r_bossActiveFlag               ;09AEE9|A578    |000078;
						BEQ CODE_09AF20                      ;09AEEB|F033    |09AF20;
						LDA.W r_entity_target,X              ;09AEED|BD0606  |090606;
						BEQ CODE_09AEF8                      ;09AEF0|F006    |09AEF8;
						JSR.W CODE_09AF62                    ;09AEF2|2062AF  |09AF62;
						JMP.W CODE_09B04E                    ;09AEF5|4C4EB0  |09B04E;
	
	
			CODE_09AEF8:
						LDA.W r_entity_AI,X                  ;09AEF8|BDEF05  |0905EF;
						AND.B #$7F                           ;09AEFB|297F    |      ;
						BNE CODE_09AF15                      ;09AEFD|D016    |09AF15;
						LDA.B r_blockLevel                   ;09AEFF|A533    |000033;
						CMP.B #$02                           ;09AF01|C902    |      ;
						BEQ CODE_09AF10                      ;09AF03|F00B    |09AF10;
						LDA.B #$06                           ;09AF05|A906    |      ;
						STA.B $17                            ;09AF07|8517    |000017;
	
			CODE_09AF09:
						JSR.W CODE_09B454                    ;09AF09|2054B4  |09B454;
						DEC.B $17                            ;09AF0C|C617    |000017;
						BNE CODE_09AF09                      ;09AF0E|D0F9    |09AF09;
	
			CODE_09AF10:
						LDA.B #$47                           ;09AF10|A947    |      ;
						JMP.W setEnityAi_scriptIDX_01        ;09AF12|4C4F86  |09864F;
	
	
			CODE_09AF15:
						JSR.W CODE_09AF62                    ;09AF15|2062AF  |09AF62;
						BCS CODE_09AF1B                      ;09AF18|B001    |09AF1B;
						RTS                                  ;09AF1A|60      |      ;
	
	
			CODE_09AF1B:
						CMP.B #$80                           ;09AF1B|C980    |      ;
						BEQ CODE_09AF42                      ;09AF1D|F023    |09AF42;
						RTS                                  ;09AF1F|60      |      ;
	
	
			CODE_09AF20:
						LDA.B #$E9                           ;09AF20|A9E9    |      ;
						STA.W r_entity_mask,X                ;09AF22|9D7004  |090470;
						LDA.B #$00                           ;09AF25|A900    |      ;
						STA.W r_entity_FacingLeft,X          ;09AF27|9DA804  |0904A8;
						LDA.B #$08                           ;09AF2A|A908    |      ;
						STA.W r_Player_StateDoubled,X        ;09AF2C|9D6505  |090565;
						LDA.W r_entity_target,X              ;09AF2F|BD0606  |090606;
						BEQ CODE_09AF37                      ;09AF32|F003    |09AF37;
						JMP.W CODE_09B03F                    ;09AF34|4C3FB0  |09B03F;
	
	
			CODE_09AF37:
						LDA.B #$9E                           ;09AF37|A99E    |      ;
						STA.W r_entity_spriteID,X            ;09AF39|9D0004  |090400;
						LDA.B #$0A                           ;09AF3C|A90A    |      ;
						STA.W r_entity_spriteGroup,X         ;09AF3E|9D8C04  |09048C;
						RTS                                  ;09AF41|60      |      ;
	
	
			CODE_09AF42:
						LDA.W r_entity_mask,X                ;09AF42|BD7004  |090470;
						AND.B #$01                           ;09AF45|2901    |      ;
						BNE CODE_09AF61                      ;09AF47|D018    |09AF61;
						LDA.B #$00                           ;09AF49|A900    |      ;
						STA.W r_entity_extra,X               ;09AF4B|9DD805  |0905D8;
						STA.W r_entity_AI,X                  ;09AF4E|9DEF05  |0905EF;
						STA.W r_entity_AI_IDX,X              ;09AF51|9DC105  |0905C1;
						LDA.B #$60                           ;09AF54|A960    |      ;
						STA.W r_entity_mask,X                ;09AF56|9D7004  |090470;
						jsr AND_7F_r_orb_flagsTimer
	
			CODE_09AF61:
						RTS                                  ;09AF61|60      |      ;
	
	
			CODE_09AF62:
						LDA.B r_blockLevel                   ;09AF62|A533    |000033;
	
						CMP.B #$02                           ;09AF64|C902    |      ;
						BEQ CODE_09AF73                      ;09AF66|F00B    |09AF73;
						LDA.W r_entity_XPos,X                ;09AF68|BD3804  |090438;
						AND.B #$F0                           ;09AF6B|29F0    |      ;
						CMP.B #$20                           ;09AF6D|C920    |      ;
						BEQ CODE_09AF7A                      ;09AF6F|F009    |09AF7A;
						BNE CODE_09AF84                      ;09AF71|D011    |09AF84;
	
			CODE_09AF73:
						LDA.W r_entity_XPos,X                ;09AF73|BD3804  |090438;
						AND.B #$F0                           ;09AF76|29F0    |      ;
						BNE CODE_09AF84                      ;09AF78|D00A    |09AF84;
	
			CODE_09AF7A:
						LDA.W r_entity_mask,X                ;09AF7A|BD7004  |090470;
						AND.B #$76                           ;09AF7D|2976    |      ;
						STA.W r_entity_mask,X                ;09AF7F|9D7004  |090470;
						CLC                                  ;09AF82|18      |      ;
						RTS                                  ;09AF83|60      |      ;
	
	
			CODE_09AF84:
						SEC                                  ;09AF84|38      |      ;
						RTS                                  ;09AF85|60      |      ;
	
	




	bossID_SnakeKing_06:
						LDA.B #$60                           ;09AF86|A960    |      ;
						STA.W r_entity_mask,X                ;09AF88|9D7004  |090470;
						JSR.W CODE_09A1DE                    ;09AF8B|20DEA1  |09A1DE;
						LDA.B r_blockLevel                   ;09AF8E|A533    |000033;
						CMP.B #$02                           ;09AF90|C902    |      ;
						BNE CODE_09AFB6                      ;09AF92|D022    |09AFB6;
						LDA.B r_HUD_healthBoss               ;09AF94|A53D    |00003D;
						CMP.B #$18                           ;09AF96|C918    |      ;
						BCS CODE_09AFB6                      ;09AF98|B01C    |09AFB6;
						LDA.B #$17                           ;09AF9A|A917    |      ;
						STA.B r_HUD_healthBoss               ;09AF9C|853D    |00003D;
						STA.W r_entity_Health,X              ;09AF9E|9D7B06  |09067B;
						JSR.W CODE_09B01C                    ;09AFA1|201CB0  |09B01C;
						LDA.W r_entity_AI,X                  ;09AFA4|BDEF05  |0905EF;
						AND.B #$7F                           ;09AFA7|297F    |      ;
						BNE CODE_09AFB0                      ;09AFA9|D005    |09AFB0;
						LDA.B #$49                           ;09AFAB|A949    |      ;
						JMP.W setEnityAi_scriptIDX_01        ;09AFAD|4C4F86  |09864F;
	
	
			CODE_09AFB0:
						JSR.W CODE_09B416                    ;09AFB0|2016B4  |09B416;
						JMP.W CODE_09B2DB                    ;09AFB3|4CDBB2  |09B2DB;
	
	
			CODE_09AFB6:
						LDA.W r_damagActionFlag,X            ;09AFB6|BD1D06  |09061D;
						CMP.B #$FF                           ;09AFB9|C9FF    |      ;
						BNE CODE_09AFD7                      ;09AFBB|D01A    |09AFD7;
						JSR.W CODE_09B07D                    ;09AFBD|207DB0  |09B07D;
						BCC CODE_09AFD6                      ;09AFC0|9014    |09AFD6;
						LDA.B #$30                           ;09AFC2|A930    |      ;
						JSR.W setEntity__09                  ;09AFC4|206186  |098661;
						LDA.B #$06                           ;09AFC7|A906    |      ;
						STA.W r_entity_ID,X                  ;09AFC9|9D4E05  |09054E;
						LDA.B #$02                           ;09AFCC|A902    |      ;
						STA.W r_orb_flagsTimer               ;09AFCE|8DF307  |0907F3;
						LDA.B #$00                           ;09AFD1|A900    |      ;
						JSR.W setEntity_stats_03             ;09AFD3|20F487  |0987F4;
	
			CODE_09AFD6:
						RTS                                  ;09AFD6|60      |      ;
	
	
			CODE_09AFD7:
						LDA.W r_orb_flagsTimer               ;09AFD7|ADF307  |0907F3;
						CMP.B #$01                           ;09AFDA|C901    |      ;
						BNE CODE_09AFDF                      ;09AFDC|D001    |09AFDF;
	
			CODE_09AFDE:
						RTS                                  ;09AFDE|60      |      ;
	
	
			CODE_09AFDF:
						LDA.B #$00                           ;09AFDF|A900    |      ;
						JSR.W setEntity_stats_03             ;09AFE1|20F487  |0987F4;
						LDA.W r_entity_damageRelated,X       ;09AFE4|BD6906  |090669;
						AND.B #$F0                           ;09AFE7|29F0    |      ;
						BEQ CODE_09AFF3                      ;09AFE9|F008    |09AFF3;
						LDA.B #$01                           ;09AFEB|A901    |      ;
						JSR.W setEntity__04                  ;09AFED|20E088  |0988E0;
						JSR.W CODE_09B364                    ;09AFF0|2064B3  |09B364;
	
			CODE_09AFF3:
						LDA.B r_HUD_healthBoss               ;09AFF3|A53D    |00003D;
						BNE CODE_09AFFF                      ;09AFF5|D008    |09AFFF;
						LDA.B #$7B                           ;09AFF7|A97B    |      ;
						db $20                               ;09AFF9|        |      ;
						dw lunchMusic                        ;09AFFA|        |0FE25F;
						JMP.W CODE_09B3C2                    ;09AFFC|4CC2B3  |09B3C2;
	
	
			CODE_09AFFF:
						JSR.W CODE_09B416                    ;09AFFF|2016B4  |09B416;
						JSR.W CODE_09B01C                    ;09B002|201CB0  |09B01C;
						LDA.W r_entity_AI,X                  ;09B005|BDEF05  |0905EF;
						AND.B #$7F                           ;09B008|297F    |      ;
						BNE CODE_09AFDE                      ;09B00A|D0D2    |09AFDE;
						LDA.B r_RNG                          ;09B00C|A51F    |00001F;
						CMP.B #$A0                           ;09B00E|C9A0    |      ;
						BCS CODE_09B017                      ;09B010|B005    |09B017;
						LDA.B #$24                           ;09B012|A924    |      ;
						JMP.W setEnityAi_scriptIDX_01        ;09B014|4C4F86  |09864F;
	
	
			CODE_09B017:
						LDA.B #$26                           ;09B017|A926    |      ;
						JMP.W setEnityAi_scriptIDX_01        ;09B019|4C4F86  |09864F;
	
	
			CODE_09B01C:
						LDA.W r_Player_StateDoubled,X        ;09B01C|BD6505  |090565;
						AND.B #$10                           ;09B01F|2910    |      ;
						BEQ CODE_09B025                      ;09B021|F002    |09B025;
						LDA.B #$01                           ;09B023|A901    |      ;
	
			CODE_09B025:
						STA.W r_entity_FacingLeft,X          ;09B025|9DA804  |0904A8;
						LDA.W r_Player_StateDoubled,X        ;09B028|BD6505  |090565;
						CMP.B #$12                           ;09B02B|C912    |      ;
						BCC CODE_09B035                      ;09B02D|9006    |09B035;
						LDA.B #$1F                           ;09B02F|A91F    |      ;
						SEC                                  ;09B031|38      |      ;
						SBC.W r_Player_StateDoubled,X        ;09B032|FD6505  |090565;
	
			CODE_09B035:
						LSR A                                ;09B035|4A      |      ;
						AND.B #$FE                           ;09B036|29FE    |      ;
						CLC                                  ;09B038|18      |      ;
						ADC.B #$9A                           ;09B039|699A    |      ;
						STA.W r_entity_spriteID,X            ;09B03B|9D0004  |090400;
						RTS                                  ;09B03E|60      |      ;
	
	
			CODE_09B03F:
						LDA.B #$0A                           ;09B03F|A90A    |      ;
						STA.W r_entity_spriteGroup,X         ;09B041|9D8C04  |09048C;
						BNE CODE_09B04E                      ;09B044|D008    |09B04E;
	
			
			bossID_boneKingNeck_2d:
						LDA.B #$60                           ;09B046|A960    |      ;
						STA.W r_entity_mask,X                ;09B048|9D7004  |090470;
						JSR.W CODE_09A1DE                    ;09B04B|20DEA1  |09A1DE;
	
			CODE_09B04E:
						LDA.B r_blockLevel                   ;09B04E|A533    |000033;
						CMP.B #$02                           ;09B050|C902    |      ;
						BNE CODE_09B072                      ;09B052|D01E    |09B072;
						LDA.W r_entity_target,X              ;09B054|BD0606  |090606;
						CMP.B #$FF                           ;09B057|C9FF    |      ;
						BEQ CODE_09B07D                      ;09B059|F022    |09B07D;
						LDA.B r_HUD_healthBoss               ;09B05B|A53D    |00003D;
						CMP.B #$18                           ;09B05D|C918    |      ;
						BCS CODE_09B072                      ;09B05F|B011    |09B072;
						JSR.W CODE_09B2BD                    ;09B061|20BDB2  |09B2BD;
						LDA.W r_entity_ID,X                  ;09B064|BD4E05  |09054E;
						BNE CODE_09B06A                      ;09B067|D001    |09B06A;
						RTS                                  ;09B069|60      |      ;
	
	
			CODE_09B06A:
						LDA.B #$00                           ;09B06A|A900    |      ;
						STA.W r_entity_damageRelated,X       ;09B06C|9D6906  |090669;
						JMP.W CODE_09B105                    ;09B06F|4C05B1  |09B105;
	
	
			CODE_09B072:
						LDA.W r_entity_target,X              ;09B072|BD0606  |090606;
						CMP.B #$80                           ;09B075|C980    |      ;
						BCC CODE_09B0F4                      ;09B077|907B    |09B0F4;
						CMP.B #$FE                           ;09B079|C9FE    |      ;
						BEQ CODE_09B0DC                      ;09B07B|F05F    |09B0DC;
	
			CODE_09B07D:
						LDA.B #$00                           ;09B07D|A900    |      ;
						STA.W r_entity_damage,X              ;09B07F|9D5706  |090657;
						STA.W r_entity_XsubSpd,X             ;09B082|9D0905  |090509;
						STA.W r_entity_Xspd,X                ;09B085|9DF204  |0904F2;
						LDA.B r_blockLevel                   ;09B088|A533    |000033;
						CMP.B #$02                           ;09B08A|C902    |      ;
						BNE CODE_09B09A                      ;09B08C|D00C    |09B09A;
						LDA.W r_entity_YPos,X                ;09B08E|BD1C04  |09041C;
						CMP.B #$F8                           ;09B091|C9F8    |      ;
						BCC CODE_09B0DA                      ;09B093|9045    |09B0DA;
						JSR.W clear_bossSlot_02             ;09B095|203A87  |09873A;
						SEC                                  ;09B098|38      |      ;
						RTS                                  ;09B099|60      |      ;
	
	
			CODE_09B09A:
						LDA.W r_entity_AI,X                  ;09B09A|BDEF05  |0905EF;
						AND.B #$7F                           ;09B09D|297F    |      ;
						CMP.B #$56                           ;09B09F|C956    |      ;
						BNE CODE_09B0AB                      ;09B0A1|D008    |09B0AB;
						LDA.W r_entity_AI_IDX,X              ;09B0A3|BDC105  |0905C1;
						CMP.B #$02                           ;09B0A6|C902    |      ;
						BEQ CODE_09B0AB                      ;09B0A8|F001    |09B0AB;
						RTS                                  ;09B0AA|60      |      ;
	
	
			CODE_09B0AB:
						LDA.W r_entity_YPos,X                ;09B0AB|BD1C04  |09041C;
						CMP.B r_floodHight                   ;09B0AE|C5CA    |0000CA;
						BCC CODE_09B0DA                      ;09B0B0|9028    |09B0DA;
						LDA.W r_entity_AI,X                  ;09B0B2|BDEF05  |0905EF;
						AND.B #$7F                           ;09B0B5|297F    |      ;
						CMP.B #$25                           ;09B0B7|C925    |      ;
						BNE CODE_09B0C4                      ;09B0B9|D009    |09B0C4;
						LDA.W r_entity_AI_IDX,X              ;09B0BB|BDC105  |0905C1;
						CMP.B #$0F                           ;09B0BE|C90F    |      ;
						BNE CODE_09B0DA                      ;09B0C0|D018    |09B0DA;
						SEC                                  ;09B0C2|38      |      ;
						RTS                                  ;09B0C3|60      |      ;
	
	
			CODE_09B0C4:
						TXA                                  ;09B0C4|8A      |      ;
						CMP.B #$01                           ;09B0C5|C901    |      ;
						BEQ CODE_09B0CE                      ;09B0C7|F005    |09B0CE;
						LDA.B #$FE                           ;09B0C9|A9FE    |      ;
						STA.W r_entity_target,X              ;09B0CB|9D0606  |090606;
	
			CODE_09B0CE:
						LDA.B #$0A                           ;09B0CE|A90A    |      ;
						LDY.B #$43                           ;09B0D0|A043    |      ;
						db $20                               ;09B0D2|        |      ;
						dw setSpriteAndAnimGroup_AY                 ;09B0D3|        |0FEF5C;
						LDA.B #$25                           ;09B0D5|A925    |      ;
						JSR.W setEnityAi_scriptIDX_01        ;09B0D7|204F86  |09864F;
	
			CODE_09B0DA:
						CLC                                  ;09B0DA|18      |      ;
						RTS                                  ;09B0DB|60      |      ;
	
	
			CODE_09B0DC:
						LDA.B #$00                           ;09B0DC|A900    |      ;
						STA.W r_entity_damage,X              ;09B0DE|9D5706  |090657;
						LDA.W r_entity_AI,X                  ;09B0E1|BDEF05  |0905EF;
						AND.B #$7F                           ;09B0E4|297F    |      ;
						BNE CODE_09B0F3                      ;09B0E6|D00B    |09B0F3;
						LDA.B #$00                           ;09B0E8|A900    |      ;
						STA.W r_entity_ID,X                  ;09B0EA|9D4E05  |09054E;
						STA.W r_entity_spriteID,X            ;09B0ED|9D0004  |090400;
						STA.W r_entity_spriteGroup,X         ;09B0F0|9D8C04  |09048C;
	
			CODE_09B0F3:
						RTS                                  ;09B0F3|60      |      ;
	
	
			CODE_09B0F4:
						LDA.W r_entity_damageRelated,X       ;09B0F4|BD6906  |090669;
						AND.B #$F0                           ;09B0F7|29F0    |      ;
						BEQ CODE_09B105                      ;09B0F9|F00A    |09B105;
						LDA.B #$28                           ;09B0FB|A928    |      ;
						db $20                               ;09B0FD|        |      ;
						dw lunchMusic                        ;09B0FE|        |0FE25F;
						LDA.B #$00                           ;09B100|A900    |      ;
						STA.W r_entity_damageRelated,X       ;09B102|9D6906  |090669;
	
			CODE_09B105:
						LDA.W r_orb_flagsTimer               ;09B105|ADF307  |0907F3;
						AND.B #$80                           ;09B108|2980    |      ;
						BNE CODE_09B10F                      ;09B10A|D003    |09B10F;
						JSR.W CODE_09B416                    ;09B10C|2016B4  |09B416;
	
			CODE_09B10F:
						LDA.W r_entity_Xspd,X                ;09B10F|BDF204  |0904F2;
						ORA.W r_entity_XsubSpd,X             ;09B112|1D0905  |090509;
						ORA.W r_entity_Yspd,X                ;09B115|1D2005  |090520;
						ORA.W r_entity_YsubSpd,X             ;09B118|1D3705  |090537;
						BNE CODE_09B188                      ;09B11B|D06B    |09B188;
						LDA.W $04F3                          ;09B11D|ADF304  |0904F3;
						ORA.W $050A                          ;09B120|0D0A05  |09050A;
						ORA.W $0521                          ;09B123|0D2105  |090521;
						ORA.W $0538                          ;09B126|0D3805  |090538;
						BEQ CODE_09B14F                      ;09B129|F024    |09B14F;
						LDA.W $04F3                          ;09B12B|ADF304  |0904F3;
						STA.W r_entity_Xspd,X                ;09B12E|9DF204  |0904F2;
						STA.W r_entity_AI_IDX,X              ;09B131|9DC105  |0905C1;
						LDA.W $050A                          ;09B134|AD0A05  |09050A;
						STA.W r_entity_XsubSpd,X             ;09B137|9D0905  |090509;
						STA.W r_entity_extra,X               ;09B13A|9DD805  |0905D8;
						LDA.W $0521                          ;09B13D|AD2105  |090521;
						STA.W r_entity_Yspd,X                ;09B140|9D2005  |090520;
						STA.W r_entity_Counter,X             ;09B143|9D3306  |090633;
						LDA.W $0538                          ;09B146|AD3805  |090538;
						STA.W r_entity_YsubSpd,X             ;09B149|9D3705  |090537;
						STA.W r_misc_movementState,X         ;09B14C|9D4506  |090645;
	
			CODE_09B14F:
						LDA.W $0566                          ;09B14F|AD6605  |090566;
						STA.W r_Player_StateDoubled,X        ;09B152|9D6505  |090565;
						JSR.W CODE_09B43B                    ;09B155|203BB4  |09B43B;
	
			CODE_09B158:
						LDA.W r_Player_StateDoubled,X        ;09B158|BD6505  |090565;
						CLC                                  ;09B15B|18      |      ;
						ADC.B #$10                           ;09B15C|6910    |      ;
						AND.B #$1F                           ;09B15E|291F    |      ;
						ASL A                                ;09B160|0A      |      ;
						CPX.B #$02                           ;09B161|E002    |      ;
						BNE CODE_09B168                      ;09B163|D003    |09B168;
						CLC                                  ;09B165|18      |      ;
						ADC.B #$40                           ;09B166|6940    |      ;
	
			CODE_09B168:
						TAY                                  ;09B168|A8      |      ;
						LDA.W DATA8_09B223,Y                 ;09B169|B923B2  |09B223;
						STA.B r_pointerQueue                 ;09B16C|8508    |000008;
						LDA.W DATA8_09B224,Y                 ;09B16E|B924B2  |09B224;
						STA.B $09                            ;09B171|8509    |000009;
						LDY.B $00                            ;09B173|A400    |000000;
						LDA.W r_entity_XPos,Y                ;09B175|B93804  |090438;
						CLC                                  ;09B178|18      |      ;
						ADC.B r_pointerQueue                 ;09B179|6508    |000008;
						STA.W r_entity_XPos,X                ;09B17B|9D3804  |090438;
						LDA.W r_entity_YPos,Y                ;09B17E|B91C04  |09041C;
						CLC                                  ;09B181|18      |      ;
						ADC.B $09                            ;09B182|6509    |000009;
						STA.W r_entity_YPos,X                ;09B184|9D1C04  |09041C;
						RTS                                  ;09B187|60      |      ;
	
	
			CODE_09B188:
						LDA.W r_entity_target,X              ;09B188|BD0606  |090606;
						CMP.B #$0B                           ;09B18B|C90B    |      ;
						BNE CODE_09B1A5                      ;09B18D|D016    |09B1A5;
						LDA.B #$40                           ;09B18F|A940    |      ;
						ORA.W r_entity_mask,X                ;09B191|1D7004  |090470;
						STA.W r_entity_mask,X                ;09B194|9D7004  |090470;
						JSR.W CODE_09B2B7                    ;09B197|20B7B2  |09B2B7;
						JSR.W CODE_09B158                    ;09B19A|2058B1  |09B158;
						LDA.W r_entity_ID,Y                  ;09B19D|B94E05  |09054E;
						BNE CODE_09B1A5                      ;09B1A0|D003    |09B1A5;
						JSR.W CODE_09B33D                    ;09B1A2|203DB3  |09B33D;
	
			CODE_09B1A5:
						JSR.W CODE_09B2B7                    ;09B1A5|20B7B2  |09B2B7;
						LDA.W r_damagActionFlag,X            ;09B1A8|BD1D06  |09061D;
						BNE CODE_09B1EC                      ;09B1AB|D03F    |09B1EC;
						LDA.W r_entity_AI_IDX,X              ;09B1AD|BDC105  |0905C1;
						STA.W r_entity_Xspd,X                ;09B1B0|9DF204  |0904F2;
						LDA.W r_entity_extra,X               ;09B1B3|BDD805  |0905D8;
						STA.W r_entity_XsubSpd,X             ;09B1B6|9D0905  |090509;
						LDA.W r_entity_Counter,X             ;09B1B9|BD3306  |090633;
						STA.W r_entity_Yspd,X                ;09B1BC|9D2005  |090520;
						LDA.W r_misc_movementState,X         ;09B1BF|BD4506  |090645;
						STA.W r_entity_YsubSpd,X             ;09B1C2|9D3705  |090537;
						LDA.W r_entity_Xspd,Y                ;09B1C5|B9F204  |0904F2;
						STA.W r_entity_AI_IDX,X              ;09B1C8|9DC105  |0905C1;
						LDA.W r_entity_XsubSpd,Y             ;09B1CB|B90905  |090509;
						STA.W r_entity_extra,X               ;09B1CE|9DD805  |0905D8;
						LDA.W r_entity_Yspd,Y                ;09B1D1|B92005  |090520;
						STA.W r_entity_Counter,X             ;09B1D4|9D3306  |090633;
						LDA.W r_entity_YsubSpd,Y             ;09B1D7|B93705  |090537;
						STA.W r_misc_movementState,X         ;09B1DA|9D4506  |090645;
						JSR.W CODE_09B43B                    ;09B1DD|203BB4  |09B43B;
						LDY.W r_miscTicker                   ;09B1E0|AC1E06  |09061E;
						LDA.W DATA8_099940,Y                 ;09B1E3|B94099  |099940;
						STA.W r_damagActionFlag,X            ;09B1E6|9D1D06  |09061D;
						JMP.W CODE_09B1F3                    ;09B1E9|4CF3B1  |09B1F3;
	
	
			CODE_09B1EC:
						JSR.W CODE_09B44A                    ;09B1EC|204AB4  |09B44A;
						DEC.W r_damagActionFlag,X            ;09B1EF|DE1D06  |09061D;
						RTS                                  ;09B1F2|60      |      ;
	
	
			CODE_09B1F3:
						LDY.B #$A4                           ;09B1F3|A0A4    |      ;
						LDA.W r_entity_target,X              ;09B1F5|BD0606  |090606;
						CMP.B #$0B                           ;09B1F8|C90B    |      ;
						BNE CODE_09B1FE                      ;09B1FA|D002    |09B1FE;
						LDY.B #$AE                           ;09B1FC|A0AE    |      ;
	
			CODE_09B1FE:
						STY.B $02                            ;09B1FE|8402    |000002;
						LDA.W r_Player_StateDoubled,X        ;09B200|BD6505  |090565;
						AND.B #$10                           ;09B203|2910    |      ;
						BEQ CODE_09B209                      ;09B205|F002    |09B209;
						LDA.B #$01                           ;09B207|A901    |      ;
	
			CODE_09B209:
						STA.W r_entity_FacingLeft,X          ;09B209|9DA804  |0904A8;
						LDA.W r_Player_StateDoubled,X        ;09B20C|BD6505  |090565;
						CMP.B #$12                           ;09B20F|C912    |      ;
						BCC CODE_09B219                      ;09B211|9006    |09B219;
						LDA.B #$1F                           ;09B213|A91F    |      ;
						SEC                                  ;09B215|38      |      ;
						SBC.W r_Player_StateDoubled,X        ;09B216|FD6505  |090565;
	
			CODE_09B219:
						LSR A                                ;09B219|4A      |      ;
						AND.B #$FE                           ;09B21A|29FE    |      ;
						CLC                                  ;09B21C|18      |      ;
						ADC.B $02                            ;09B21D|6502    |000002;
						STA.W r_entity_spriteID,X            ;09B21F|9D0004  |090400;
						RTS                                  ;09B222|60      |      ;
	
	
			DATA8_09B223:
						db $00                               ;09B223|        |      ;
	
			DATA8_09B224:
						db $F6,$02,$F6,$04                   ;09B224|        |      ;
						db $F7,$06,$F8,$07                   ;09B228|        |      ;
						db $F9,$08,$FA,$09                   ;09B22C|        |      ;
						db $FC,$0A,$FE,$0A                   ;09B230|        |      ;
						db $00,$0A,$02,$09                   ;09B234|        |      ;
						db $04,$08,$06,$07                   ;09B238|        |      ;
						db $07,$06,$08,$04                   ;09B23C|        |      ;
						db $09,$02,$0A,$00                   ;09B240|        |      ;
						db $0A,$FE,$0A,$FC                   ;09B244|        |      ;
						db $09,$FA,$08,$F9                   ;09B248|        |      ;
						db $07,$F8,$06,$F7                   ;09B24C|        |      ;
						db $04,$F6,$02,$F6                   ;09B250|        |      ;
						db $00,$F6,$FE,$F7                   ;09B254|        |      ;
						db $FC,$F8,$FA,$F9                   ;09B258|        |      ;
						db $F9,$FA,$F8,$FC                   ;09B25C|        |      ;
						db $F7,$FE,$F6,$00                   ;09B260|        |      ;
						db $F2,$03,$F2,$06                   ;09B264|        |      ;
						db $F3,$08,$F5,$0A                   ;09B268|        |      ;
						db $F6,$0B,$F8,$0D                   ;09B26C|        |      ;
						db $FA,$0E,$FD,$0E                   ;09B270|        |      ;
						db $00,$0E,$03,$0D                   ;09B274|        |      ;
						db $06,$0B,$08,$0A                   ;09B278|        |      ;
						db $0A,$08,$0B,$06                   ;09B27C|        |      ;
						db $0D,$03,$0E,$00                   ;09B280|        |      ;
						db $0E,$FD,$0E,$FA                   ;09B284|        |      ;
						db $0D,$F8,$0B,$F6                   ;09B288|        |      ;
						db $0A,$F5,$08,$F3                   ;09B28C|        |      ;
						db $06,$F2,$03,$F2                   ;09B290|        |      ;
						db $00,$F2,$FD,$F3                   ;09B294|        |      ;
						db $FA,$F2,$FD,$F6                   ;09B298|        |      ;
						db $F6,$F8,$F5,$FA                   ;09B29C|        |      ;
						db $F3,$FD,$F2,$08                   ;09B2A0|        |      ;
						db $08,$08,$08,$08                   ;09B2A4|        |      ;
						db $08,$08,$08,$08                   ;09B2A8|        |      ;
						db $08,$08,$08,$08                   ;09B2AC|        |      ;
						db $08,$08,$08,$08                   ;09B2B0|        |      ;
						db $08,$08,$08                       ;09B2B4|        |      ;
	
			CODE_09B2B7:
						TXA                                  ;09B2B7|8A      |      ;
						TAY                                  ;09B2B8|A8      |      ;
						DEY                                  ;09B2B9|88      |      ;
						STY.B $00                            ;09B2BA|8400    |000000;
						RTS                                  ;09B2BC|60      |      ;
	
	
			CODE_09B2BD:
						LDA.W $054F                          ;09B2BD|AD4F05  |09054F;
						BNE CODE_09B2DA                      ;09B2C0|D018    |09B2DA;
						LDA.W r_entity_XPos,X                ;09B2C2|BD3804  |090438;
						STA.B $00                            ;09B2C5|8500    |000000;
						LDA.B $D1                            ;09B2C7|A5D1    |0000D1;
						AND.B #$80                           ;09B2C9|2980    |      ;
						BEQ CODE_09B2D2                      ;09B2CB|F005    |09B2D2;
						LDA.W r_entity_YPos,X                ;09B2CD|BD1C04  |09041C;
						STA.B $00                            ;09B2D0|8500    |000000;
	
			CODE_09B2D2:
						LDA.B $D1                            ;09B2D2|A5D1    |0000D1;
						ASL A                                ;09B2D4|0A      |      ;
						STA.B $01                            ;09B2D5|8501    |000001;
						JMP.W CODE_09B307                    ;09B2D7|4C07B3  |09B307;
	
	
			CODE_09B2DA:
						RTS                                  ;09B2DA|60      |      ;
	
	
			CODE_09B2DB:
						LDA.W $05F0                          ;09B2DB|ADF005  |0905F0;
						AND.B #$7F                           ;09B2DE|297F    |      ;
						CMP.B #$49                           ;09B2E0|C949    |      ;
						BNE CODE_09B2EB                      ;09B2E2|D007    |09B2EB;
						LDA.W $05C2                          ;09B2E4|ADC205  |0905C2;
						CMP.B #$06                           ;09B2E7|C906    |      ;
						BCS CODE_09B2EC                      ;09B2E9|B001    |09B2EC;
	
			CODE_09B2EB:
						RTS                                  ;09B2EB|60      |      ;
	
	
			CODE_09B2EC:
						LDA.W r_entity_XPos,X                ;09B2EC|BD3804  |090438;
						STA.B $00                            ;09B2EF|8500    |000000;
						LDA.B #$80                           ;09B2F1|A980    |      ;
						STA.B $01                            ;09B2F3|8501    |000001;
						LDA.B #$38                           ;09B2F5|A938    |      ;
						STA.B $02                            ;09B2F7|8502    |000002;
						JSR.W CODE_09B355                    ;09B2F9|2055B3  |09B355;
						BCS CODE_09B2EB                      ;09B2FC|B056    |09B354;
						LDA.W r_entity_YPos,X                ;09B2FE|BD1C04  |09041C;
						STA.B $00                            ;09B301|8500    |000000;
						LDA.B #$40                           ;09B303|A940    |      ;
						STA.B $01                            ;09B305|8501    |000001;
	
			CODE_09B307:
						LDA.B #$04                           ;09B307|A904    |      ;
						STA.B $02                            ;09B309|8502    |000002;
						JSR.W CODE_09B355                    ;09B30B|2055B3  |09B355;
						BCS CODE_09B2EB                      ;09B30E|B044    |09B354;
						CPX.B #$01                           ;09B310|E001    |      ;
						BNE CODE_09B33D                      ;09B312|D029    |09B33D;
						LDA.W r_entity_Yspd,X                ;09B314|BD2005  |090520;
						BEQ CODE_09B326                      ;09B317|F00D    |09B326;
						CMP.B #$FF                           ;09B319|C9FF    |      ;
						BNE CODE_09B32D                      ;09B31B|D010    |09B32D;
						LDA.W r_entity_YsubSpd,X             ;09B31D|BD3705  |090537;
						CMP.B #$C0                           ;09B320|C9C0    |      ;
						BCS CODE_09B337                      ;09B322|B013    |09B337;
						BCC CODE_09B32D                      ;09B324|9007    |09B32D;
	
			CODE_09B326:
						LDA.W r_entity_YsubSpd,X             ;09B326|BD3705  |090537;
						CMP.B #$40                           ;09B329|C940    |      ;
						BCC CODE_09B337                      ;09B32B|900A    |09B337;
	
			CODE_09B32D:
						LDA.W r_entity_YPos,X                ;09B32D|BD1C04  |09041C;
						LSR A                                ;09B330|4A      |      ;
						ORA.B #$80                           ;09B331|0980    |      ;
						STA.B $D1                            ;09B333|85D1    |0000D1;
						BNE CODE_09B33D                      ;09B335|D006    |09B33D;
	
			CODE_09B337:
						LDA.W r_entity_XPos,X                ;09B337|BD3804  |090438;
						LSR A                                ;09B33A|4A      |      ;
						STA.B $D1                            ;09B33B|85D1    |0000D1;
	
			CODE_09B33D:
						LDA.B #$00                           ;09B33D|A900    |      ;
						STA.W r_entity_ID,X                  ;09B33F|9D4E05  |09054E;
						STA.W r_entity_spriteID,X            ;09B342|9D0004  |090400;
						STA.W r_entity_AnimGroup,X           ;09B345|9DAA05  |0905AA;
						STA.W r_entity_spriteGroup,X         ;09B348|9D8C04  |09048C;
						STA.W r_entity_AI,X                  ;09B34B|9DEF05  |0905EF;
						STA.W r_entity_AI_IDX,X              ;09B34E|9DC105  |0905C1;


			CODE_09B39E:
						LDA.B #$00                           ;09B39E|A900    |      ;
						STA.B $00                            ;09B3A0|8500    |000000;
						LDY.B #$01                           ;09B3A2|A001    |      ;
	
			CODE_09B3A4:
						LDA.W r_entity_ID,Y                  ;09B3A4|B94E05  |09054E;
						BEQ CODE_09B3AB                      ;09B3A7|F002    |09B3AB;
						INC.B $00                            ;09B3A9|E600    |000000;
	
			CODE_09B3AB:
						INY                                  ;09B3AB|C8      |      ;
						CPY.B #$0D                           ;09B3AC|C00D    |      ;
						BNE CODE_09B3A4                      ;09B3AE|D0F4    |09B3A4;
						LDA.B $00                            ;09B3B0|A500    |000000;
						BNE CODE_09B3C1                      ;09B3B2|D00D    |09B3C1;
						LDA.W r_miscTicker                   ;09B3B4|AD1E06  |09061E;
						STA.B r_bossDragonMisc               ;09B3B7|85BE    |0000BE;
						LDA.B #$1C                           ;09B3B9|A91C    |      ;
						STA.B r_gameTransition               ;09B3BB|852A    |00002A;
						LDA.B r_HUD_healthBoss               ;09B3BD|A53D    |00003D;
						STA.B r_bossDragonKingHP             ;09B3BF|85BD    |0000BD;
	
			CODE_09B3C1:
						RTS                                  ;09B3C1|60      |      ;
	
	
			CODE_09B355:
						LDA.B $00                            ;09B355|A500    |000000;
						SEC                                  ;09B357|38      |      ;
						SBC.B $01                            ;09B358|E501    |000001;
						BCS CODE_09B361                      ;09B35A|B005    |09B361;
						EOR.B #$FF                           ;09B35C|49FF    |      ;
						CLC                                  ;09B35E|18      |      ;
						ADC.B #$01                           ;09B35F|6901    |      ;
	
			CODE_09B361:
						CMP.B $02                            ;09B361|C502    |000002;
	
			CODE_09B363:
						RTS                                  ;09B363|60      |      ;
	
	
			CODE_09B364:
						LDY.W r_damagActionFlag,X            ;09B364|BC1D06  |09061D;
						DEY                                  ;09B367|88      |      ;
						BEQ CODE_09B363                      ;09B368|F0F9    |09B363;
						TYA                                  ;09B36A|98      |      ;
						STA.W r_damagActionFlag,X            ;09B36B|9D1D06  |09061D;
						LDY.B #$02                           ;09B36E|A002    |      ;
	
			CODE_09B370:
						LDA.W r_entity_ID,Y                  ;09B370|B94E05  |09054E;
						CMP.B #$2D                           ;09B373|C92D    |      ;
						BNE CODE_09B38E                      ;09B375|D017    |09B38E;
						LDA.W r_entity_target,Y              ;09B377|B90606  |090606;
						CMP.B #$80                           ;09B37A|C980    |      ;
						BCS CODE_09B38E                      ;09B37C|B010    |09B38E;
						LDA.B #$00                           ;09B37E|A900    |      ;
						STA.W r_entity_damageRelated,Y       ;09B380|996906  |090669;
						LDA.W r_player_WeaImpact,X           ;09B383|BD8D06  |09068D;
						STA.W r_player_WeaImpact,Y           ;09B386|998D06  |09068D;
						INY                                  ;09B389|C8      |      ;
						CPY.B #$0E                           ;09B38A|C00E    |      ;
						BNE CODE_09B370                      ;09B38C|D0E2    |09B370;
	
			CODE_09B38E:
						DEY                                  ;09B38E|88      |      ;
						LDA.B #$FF                           ;09B38F|A9FF    |      ;
						STA.W r_entity_target,Y              ;09B391|990606  |090606;
						TYA                                  ;09B394|98      |      ;
						TAX                                  ;09B395|AA      |      ;
						LDA.B #$17                           ;09B396|A917    |      ;
						JSR.W setEnityAi_scriptIDX_01        ;09B398|204F86  |09864F;
						LDX.B r_entityID_processed           ;09B39B|A66C    |00006C;
						RTS                                  ;09B39D|60      |      ;
	
	
			CODE_09B3C2:
						LDY.B #$01                           ;09B3C2|A001    |      ;
	
			CODE_09B3C4:
						LDA.W r_entity_ID,Y                  ;09B3C4|B94E05  |09054E;
						CMP.B #$06                           ;09B3C7|C906    |      ;
						BEQ CODE_09B3CF                      ;09B3C9|F004    |09B3CF;
						CMP.B #$2D                           ;09B3CB|C92D    |      ;
						BNE CODE_09B400                      ;09B3CD|D031    |09B400;
	
			CODE_09B3CF:
						LDA.B #$00                           ;09B3CF|A900    |      ;
						STA.W r_entity_damageRelated,Y       ;09B3D1|996906  |090669;
						CPY.B #$01                           ;09B3D4|C001    |      ;
						BNE CODE_09B3DF                      ;09B3D6|D007    |09B3DF;
						LDA.B #$FF                           ;09B3D8|A9FF    |      ;
						STA.W r_damagActionFlag,Y            ;09B3DA|991D06  |09061D;
						BNE CODE_09B3E4                      ;09B3DD|D005    |09B3E4;
	
			CODE_09B3DF:
						LDA.B #$FF                           ;09B3DF|A9FF    |      ;
						STA.W r_entity_target,Y              ;09B3E1|990606  |090606;
	
			CODE_09B3E4:
						LDA.W DATA8_09B406,Y                 ;09B3E4|B906B4  |09B406;
						STA.W r_entity_extra,Y               ;09B3E7|99D805  |0905D8;
						LDA.B #$D6                           ;09B3EA|A9D6    |      ;
						STA.W r_entity_AI,Y                  ;09B3EC|99EF05  |0905EF;
						LDA.B #$00                           ;09B3EF|A900    |      ;
						STA.W r_entity_AI_IDX,Y              ;09B3F1|99C105  |0905C1;
						STA.W r_entity_Xspd,Y                ;09B3F4|99F204  |0904F2;
						STA.W r_entity_XsubSpd,Y             ;09B3F7|990905  |090509;
						STA.W r_entity_Yspd,Y                ;09B3FA|992005  |090520;
						STA.W r_entity_YsubSpd,Y             ;09B3FD|993705  |090537;
	
			CODE_09B400:
						INY                                  ;09B400|C8      |      ;
						CPY.B #$0E                           ;09B401|C00E    |      ;
						BNE CODE_09B3C4                      ;09B403|D0BF    |09B3C4;
						RTS                                  ;09B405|60      |      ;
	
	
			DATA8_09B406:
						db $C0,$B0,$A0,$90                   ;09B406|        |      ;
						db $80,$70,$60,$50                   ;09B40A|        |      ;
						db $40,$30,$20,$10                   ;09B40E|        |      ;
						db $10,$10,$10,$10                   ;09B412|        |      ;
	
			CODE_09B416:
						LDA.W r_entity_XPos,X                ;09B416|BD3804  |090438;
						CMP.B #$04                           ;09B419|C904    |      ;
						BCS CODE_09B41F                      ;09B41B|B002    |09B41F;
						LDA.B #$04                           ;09B41D|A904    |      ;
	
			CODE_09B41F:
						CMP.B #$FC                           ;09B41F|C9FC    |      ;
						BCC CODE_09B425                      ;09B421|9002    |09B425;
						LDA.B #$FB                           ;09B423|A9FB    |      ;
	
			CODE_09B425:
						STA.W r_entity_XPos,X                ;09B425|9D3804  |090438;
						LDA.W r_entity_YPos,X                ;09B428|BD1C04  |09041C;
						CMP.B #$30                           ;09B42B|C930    |      ;
						BCS CODE_09B431                      ;09B42D|B002    |09B431;
						LDA.B #$30                           ;09B42F|A930    |      ;
	
			CODE_09B431:
						CMP.B #$F0                           ;09B431|C9F0    |      ;
						BCC CODE_09B437                      ;09B433|9002    |09B437;
						LDA.B #$EF                           ;09B435|A9EF    |      ;
	
			CODE_09B437:
						STA.W r_entity_YPos,X                ;09B437|9D1C04  |09041C;
						RTS                                  ;09B43A|60      |      ;
	
	
			CODE_09B43B:
						TXA                                  ;09B43B|8A      |      ;
						TAY                                  ;09B43C|A8      |      ;
						DEY                                  ;09B43D|88      |      ;
						STY.B $00                            ;09B43E|8400    |000000;
						LDA.W r_Player_StateDoubled,Y        ;09B440|B96505  |090565;
						LDY.W r_entity_target,X              ;09B443|BC0606  |090606;
						STA.W r_FogParallelPos,Y             ;09B446|998207  |090782;
						RTS                                  ;09B449|60      |      ;
	
	
			CODE_09B44A:
						LDY.W r_entity_target,X              ;09B44A|BC0606  |090606;
						LDA.W r_FogParallelPos,Y             ;09B44D|B98207  |090782;
						STA.W r_Player_StateDoubled,X        ;09B450|9D6505  |090565;
						RTS                                  ;09B453|60      |      ;
	
	
			CODE_09B454:
						LDA.B #$26                           ;09B454|A926    |      ;
						JSR.W setEntity__07                  ;09B456|20C587  |0987C5;
						LDA.B #$88                           ;09B459|A988    |      ;
						STA.W r_entity_mask,Y                ;09B45B|997004  |090470;
						LDA.B #$48                           ;09B45E|A948    |      ;
						STA.W r_entity_YPos,Y                ;09B460|991C04  |09041C;
						LDA.B #$20                           ;09B463|A920    |      ;
						STA.W r_entity_XPos,Y                ;09B465|993804  |090438;
						STY.B r_coreLoadingFuncAddr          ;09B468|8416    |000016;
						LDA.B $17                            ;09B46A|A517    |000017;
						AND.B #$07                           ;09B46C|2907    |      ;
						ASL A                                ;09B46E|0A      |      ;
						TAY                                  ;09B46F|A8      |      ;
						LDA.W DATA8_09B4D3,Y                 ;09B470|B9D3B4  |09B4D3;
						STA.B $00                            ;09B473|8500    |000000;
						LDA.W DATA8_09B4D4,Y                 ;09B475|B9D4B4  |09B4D4;
						STA.B $01                            ;09B478|8501    |000001;
						LDA.W DATA8_09B4E1,Y                 ;09B47A|B9E1B4  |09B4E1;
						STA.B $02                            ;09B47D|8502    |000002;
						LDA.W DATA8_09B4E2,Y                 ;09B47F|B9E2B4  |09B4E2;
						STA.B $03                            ;09B482|8503    |000003;
						LDY.B r_coreLoadingFuncAddr          ;09B484|A416    |000016;
						LDA.B $00                            ;09B486|A500    |000000;
						STA.W r_entity_XsubSpd,Y             ;09B488|990905  |090509;
						LDA.B $01                            ;09B48B|A501    |000001;
						STA.W r_entity_Xspd,Y                ;09B48D|99F204  |0904F2;
						LDA.B $02                            ;09B490|A502    |000002;
						STA.W r_entity_YsubSpd,Y             ;09B492|993705  |090537;
						LDA.B $03                            ;09B495|A503    |000003;
						STA.W r_entity_Yspd,Y                ;09B497|992005  |090520;
						TXA                                  ;09B49A|8A      |      ;
						STA.W r_entity_target,Y              ;09B49B|990606  |090606;
	
			CODE_09B49E:
						RTS                                  ;09B49E|60      |      ;
	
	
			bossID_crumble_26:
						LDY.W r_entity_target,X              ;09B49F|BC0606  |090606;
						LDA.W r_entity_mask,Y                ;09B4A2|B97004  |090470;
						AND.B #$88                           ;09B4A5|2988    |      ;
						BNE CODE_09B49E                      ;09B4A7|D0F5    |09B49E;
						LDA.W r_entity_AI,X                  ;09B4A9|BDEF05  |0905EF;
						AND.B #$7F                           ;09B4AC|297F    |      ;
						BNE CODE_09B4C9                      ;09B4AE|D019    |09B4C9;
						LDA.B #$34                           ;09B4B0|A934    |      ;
						db $20                               ;09B4B2|        |      ;
						dw lunchMusic                        ;09B4B3|        |0FE25F;
						LDA.B #$0E                           ;09B4B5|A90E    |      ;
						STA.W r_entity_spriteGroup,X         ;09B4B7|9D8C04  |09048C;
						LDA.B #$18                           ;09B4BA|A918    |      ;
						STA.W r_entity_spriteID,X            ;09B4BC|9D0004  |090400;
						LDA.B #$60                           ;09B4BF|A960    |      ;
						STA.W r_entity_mask,X                ;09B4C1|9D7004  |090470;
						LDA.B #$55                           ;09B4C4|A955    |      ;
						JMP.W setEnityAi_scriptIDX_01        ;09B4C6|4C4F86  |09864F;
	
	
			CODE_09B4C9:
						LDA.W r_entity_YPos,X                ;09B4C9|BD1C04  |09041C;
						CMP.B #$F8                           ;09B4CC|C9F8    |      ;
						BCC CODE_09B49E                      ;09B4CE|90CE    |09B49E;
						JMP.W clear_bossSlot_02             ;09B4D0|4C3A87  |09873A;
	
	
			DATA8_09B4D3:
						db $10                               ;09B4D3|        |      ;
	
			DATA8_09B4D4:
						db $00,$20,$00,$30                   ;09B4D4|        |      ;
						db $00,$40,$00,$50                   ;09B4D8|        |      ;
						db $00,$60,$00,$70                   ;09B4DC|        |      ;
						db $00                               ;09B4E0|        |      ;
	
			DATA8_09B4E1:
						db $00                               ;09B4E1|        |      ;
	
			DATA8_09B4E2:
						db $FF,$E0,$FF,$D0                   ;09B4E2|        |      ;
						db $FE,$C0,$FF,$B0                   ;09B4E6|        |      ;
						db $FE,$A0,$FF,$90                   ;09B4EA|        |      ;
						db $FD                               ;09B4EE|        |      ;


}


{ ; -- 0e dracla 


		bossPreview_dracula_0D:
						LDA.W r_bossPieces       ;09B4EF|ADEC07  |0907EC;
						BEQ CODE_09B4F7                      ;09B4F2|F003    |09B4F7;
						JMP.W CODE_09B5B7                    ;09B4F4|4CB7B5  |09B5B7;
	
	
			CODE_09B4F7:
						LDA.B r_bossActiveFlag               ;09B4F7|A578    |000078;
						BNE CODE_09B515                      ;09B4F9|D01A    |09B515;
						LDA.B #$3C                           ;09B4FB|A93C    |      ;
						STA.W r_entity_target,X              ;09B4FD|9D0606  |090606;
						LDA.B #$01                           ;09B500|A901    |      ;
						STA.W r_entity_FacingLeft,X          ;09B502|9DA804  |0904A8;
						LDA.B #$A8                           ;09B505|A9A8    |      ;
						STA.W r_entity_YPos,X                ;09B507|9D1C04  |09041C;
						LDA.B #$10                           ;09B50A|A910    |      ;
						LDY.B #$44                           ;09B50C|A044    |      ;
						db $4C                               ;09B50E|        |      ;
	
						dw setSpriteAndAnimGroup_AY                 ;09B50F|        |0FEF5C;
	
			CODE_09B511:
						DEC.W r_entity_target,X              ;09B511|DE0606  |090606;
						RTS                                  ;09B514|60      |      ;
	
	
			CODE_09B515:
						LDA.W r_entity_target,X              ;09B515|BD0606  |090606;
						BNE CODE_09B511                      ;09B518|D0F7    |09B511;
						LDA.B #$60                           ;09B51A|A960    |      ;
						STA.W r_entity_mask,X                ;09B51C|9D7004  |090470;
						LDA.W r_entity_AI,X                  ;09B51F|BDEF05  |0905EF;
						AND.B #$7F                           ;09B522|297F    |      ;
						BNE CODE_09B54B                      ;09B524|D025    |09B54B;
						LDA.B #$25                           ;09B526|A925    |      ;
						JSR.W setEntity_pos_06               ;09B528|206687  |098766;
						LDA.B #$80                           ;09B52B|A980    |      ;
						STA.W r_entity_AI,Y                  ;09B52D|99EF05  |0905EF;
						LDA.B #$E8                           ;09B530|A9E8    |      ;
						STA.W r_entity_mask,Y                ;09B532|997004  |090470;
						TXA                                  ;09B535|8A      |      ;
						STA.W r_entity_target,Y              ;09B536|990606  |090606;
						LDA.B #$02                           ;09B539|A902    |      ;
						STA.W r_entity_spriteID,Y            ;09B53B|990004  |090400;
						LDA.B #$40                           ;09B53E|A940    |      ;
						STA.W r_entity_Health,Y              ;09B540|997B06  |09067B;
						STA.W r_entity_Health,X              ;09B543|9D7B06  |09067B;
						LDA.B #$D1                           ;09B546|A9D1    |      ;
						JMP.W setEnityAi_scriptIDX_01        ;09B548|4C4F86  |09864F;
	
	
			CODE_09B54B:
						LDA.W r_entity_AI_IDX,X              ;09B54B|BDC105  |0905C1;
						CMP.B #$07                           ;09B54E|C907    |      ;
						BEQ CODE_09B553                      ;09B550|F001    |09B553;
						RTS                                  ;09B552|60      |      ;
	
	
			CODE_09B553:
						jsr AND_7F_r_orb_flagsTimer
						JSR.W setEntity_resetTarget_0C       ;09B55B|2062B5  |09B562;
						STA.W r_entity_AI,X                  ;09B55E|9DEF05  |0905EF;
						RTS                                  ;09B561|60      |      ;
	
	
	setEntity_resetTarget_0C:
						LDA.B #$00                           ;09B562|A900    |      ;
						STA.W r_entity_target,X              ;09B564|9D0606  |090606;
						STA.W r_damagActionFlag,X            ;09B567|9D1D06  |09061D;
						STA.W r_entity_Counter,X             ;09B56A|9D3306  |090633;
						RTS                                  ;09B56D|60      |      ;
	
	
			bossID__25:
						LDA.B #$E8                           ;09B56E|A9E8    |      ;
						STA.W r_entity_mask,X                ;09B570|9D7004  |090470;
						LDA.B #$02                           ;09B573|A902    |      ;
						STA.W r_entity_spriteID,X            ;09B575|9D0004  |090400;
						LDY.W r_entity_target,X              ;09B578|BC0606  |090606;
						LDA.W r_entity_target,Y              ;09B57B|B90606  |090606;
						CMP.B #$03                           ;09B57E|C903    |      ;
						BCS CODE_09B58B                      ;09B580|B009    |09B58B;
						LDA.B #$01                           ;09B582|A901    |      ;
						JSR.W setEntity__04                  ;09B584|20E088  |0988E0;
						LDA.B r_HUD_healthBoss               ;09B587|A53D    |00003D;
						BEQ CODE_09B5A9                      ;09B589|F01E    |09B5A9;
	
			CODE_09B58B:
						LDA.B #$00                           ;09B58B|A900    |      ;
						STA.W r_entity_damageRelated,X       ;09B58D|9D6906  |090669;
						LDY.W r_entity_target,X              ;09B590|BC0606  |090606;
						LDA.W r_entity_YPos,Y                ;09B593|B91C04  |09041C;
						SEC                                  ;09B596|38      |      ;
						SBC.B #$10                           ;09B597|E910    |      ;
						STA.W r_entity_YPos,X                ;09B599|9D1C04  |09041C;
						LDA.W r_entity_XPos,Y                ;09B59C|B93804  |090438;
						STA.W r_entity_XPos,X                ;09B59F|9D3804  |090438;
						LDA.W r_entity_damage,Y              ;09B5A2|B95706  |090657;
						STA.W r_entity_damage,X              ;09B5A5|9D5706  |090657;
						RTS                                  ;09B5A8|60      |      ;
	
	
			CODE_09B5A9:
						JMP.W clear_bossSlot_02             ;09B5A9|4C3A87  |09873A;
	
	
		bossID_dracula_0d:
						LDA.B #$00                           ;09B5AC|A900    |      ;
						STA.B r_bossMeleeHitbox              ;09B5AE|85BB    |0000BB;
						STA.B r_bossSpecialHitbox            ;09B5B0|85BA    |0000BA;
						LDA.W r_bossPieces       ;09B5B2|ADEC07  |0907EC;
						BEQ CODE_09B5CD                      ;09B5B5|F016    |09B5CD;
	
			CODE_09B5B7:
						LDA.B #$03                           ;09B5B7|A903    |      ;
						STA.B r_bossSpecialHitbox            ;09B5B9|85BA    |0000BA;
						LDY.W r_bossPieces       ;09B5BB|ACEC07  |0907EC;
						DEY                                  ;09B5BE|88      |      ;
						STY.B r_bossDopplegangerHitbox       ;09B5BF|84BC    |0000BC;
						LDY.W r_bossPieces       ;09B5C1|ACEC07  |0907EC;
						DEY                                  ;09B5C4|88      |      ;
						BNE CODE_09B5CA                      ;09B5C5|D003    |09B5CA;
						JMP.W CODE_09B963                    ;09B5C7|4C63B9  |09B963;
	
	
			CODE_09B5CA:
						JMP.W CODE_09BD5F                    ;09B5CA|4C5FBD  |09BD5F;
	
	
			CODE_09B5CD:
						JSR.W setEntity__0A                  ;09B5CD|203182  |098231;
						LDA.B r_HUD_healthBoss               ;09B5D0|A53D    |00003D;
						BEQ CODE_09B5D7                      ;09B5D2|F003    |09B5D7;
						JMP.W CODE_09B6A1                    ;09B5D4|4CA1B6  |09B6A1;
	
	
			CODE_09B5D7:
						LDA.W r_orb_statesGlobal             ;09B5D7|ADED07  |0907ED;
						BNE CODE_09B654                      ;09B5DA|D078    |09B654;
						LDA.B #$00                           ;09B5DC|A900    |      ;
						STA.W $07EE                          ;09B5DE|8DEE07  |0907EE;
						LDA.B #$06                           ;09B5E1|A906    |      ;
						STA.B $17                            ;09B5E3|8517    |000017;
	
			CODE_09B5E5:
						LDA.B #$0D                           ;09B5E5|A90D    |      ;
						JSR.W setEntity_pos_06               ;09B5E7|206687  |098766;
						LDA.B $17                            ;09B5EA|A517    |000017;
						STA.W r_entity_target,Y              ;09B5EC|990606  |090606;
						LDA.B #$DE                           ;09B5EF|A9DE    |      ;
						STA.W r_entity_AI,Y                  ;09B5F1|99EF05  |0905EF;
						LDA.B #$60                           ;09B5F4|A960    |      ;
						STA.W r_entity_mask,Y                ;09B5F6|997004  |090470;
						LDA.B #$10                           ;09B5F9|A910    |      ;
						STA.W r_entity_spriteGroup,Y         ;09B5FB|998C04  |09048C;
						LDA.B #$00                           ;09B5FE|A900    |      ;
						STA.W r_entity_AI_IDX,Y              ;09B600|99C105  |0905C1;
						STY.B r_coreLoadingFuncAddr          ;09B603|8416    |000016;
						LDY.B $17                            ;09B605|A417    |000017;
						DEY                                  ;09B607|88      |      ;
						LDA.W DATA8_09B895,Y                 ;09B608|B995B8  |09B895;
						STA.B r_bossScript__15                           ;09B60B|8515    |000015;
						LDA.W DATA8_09B89B,Y                 ;09B60D|B99BB8  |09B89B;
						LDY.B r_coreLoadingFuncAddr          ;09B610|A416    |000016;
						STA.W r_Player_StateDoubled,Y        ;09B612|996505  |090565;
						LDA.B r_bossScript__15                           ;09B615|A515    |000015;
						STA.W r_entity_spriteID,Y            ;09B617|990004  |090400;
						INC.W $07EE                          ;09B61A|EEEE07  |0907EE;
						DEC.B $17                            ;09B61D|C617    |000017;
						BNE CODE_09B5E5                      ;09B61F|D0C4    |09B5E5;
						LDA.B $17                            ;09B621|A517    |000017;
						STA.W r_entity_target,X              ;09B623|9D0606  |090606;
						LDA.W r_entity_YPos,X                ;09B626|BD1C04  |09041C;
						SEC                                  ;09B629|38      |      ;
						SBC.B #$10                           ;09B62A|E910    |      ;
						STA.W r_entity_YPos,X                ;09B62C|9D1C04  |09041C;
						LDA.B #$80                           ;09B62F|A980    |      ;
						STA.W r_entity_AI,X                  ;09B631|9DEF05  |0905EF;
						LDA.B #$F0                           ;09B634|A9F0    |      ;
						STA.W r_entity_spriteID,X            ;09B636|9D0004  |090400;
						LDA.B #$10                           ;09B639|A910    |      ;
						STA.W r_entity_spriteGroup,X         ;09B63B|9D8C04  |09048C;
						LDA.B #$20                           ;09B63E|A920    |      ;
						STA.W r_entity_mask,X                ;09B640|9D7004  |090470;
						INC.W r_orb_statesGlobal             ;09B643|EEED07  |0907ED;
						LDA.B #$7B                           ;09B646|A97B    |      ;
						db $20                               ;09B648|        |      ;
						dw lunchMusic                        ;09B649|        |0FE25F;
						LDA.B #$43                           ;09B64B|A943    |      ;
						db $4C                               ;09B64D|        |      ;
	
						dw lunchMusic                        ;09B64E|        |0FE25F;
	
			CODE_09B650:
						STA.W r_entity_YPos,X                ;09B650|9D1C04  |09041C;
	
			CODE_09B653:
						RTS                                  ;09B653|60      |      ;
	
	
			CODE_09B654:
						LDA.W r_entity_target,X              ;09B654|BD0606  |090606;
						BNE CODE_09B684                      ;09B657|D02B    |09B684;
						LDA.W r_entity_YPos,X                ;09B659|BD1C04  |09041C;
						SEC                                  ;09B65C|38      |      ;
						SBC.B #$01                           ;09B65D|E901    |      ;
						CMP.B #$80                           ;09B65F|C980    |      ;
						BCS CODE_09B650                      ;09B661|B0ED    |09B650;
						LDA.W $07EE                          ;09B663|ADEE07  |0907EE;
						BNE CODE_09B653                      ;09B666|D0EB    |09B653;
						INC.W r_bossPieces       ;09B668|EEEC07  |0907EC;
						LDA.B #$80                           ;09B66B|A980    |      ;
						STA.W r_orb_flagsTimer               ;09B66D|8DF307  |0907F3;
						LDA.B #$40                           ;09B670|A940    |      ;
						STA.B r_HUD_healthBoss               ;09B672|853D    |00003D;
						STA.W r_entity_Health,X              ;09B674|9D7B06  |09067B;
						LDA.B #$00                           ;09B677|A900    |      ;
						STA.W r_misc_movementState,X         ;09B679|9D4506  |090645;
						JSR.W setEntity_resetTarget_0C       ;09B67C|2062B5  |09B562;
						LDA.B #$30                           ;09B67F|A930    |      ;
						JMP.W setEntity__09                  ;09B681|4C6186  |098661;
	
	
			CODE_09B684:
						LDA.W r_entity_YPos,X                ;09B684|BD1C04  |09041C;
						AND.B #$F8                           ;09B687|29F8    |      ;
						BEQ CODE_09B69B                      ;09B689|F010    |09B69B;
						CMP.B #$F8                           ;09B68B|C9F8    |      ;
						BEQ CODE_09B69B                      ;09B68D|F00C    |09B69B;
						LDA.W r_entity_XPos,X                ;09B68F|BD3804  |090438;
						AND.B #$F8                           ;09B692|29F8    |      ;
						BEQ CODE_09B69B                      ;09B694|F005    |09B69B;
						CMP.B #$F8                           ;09B696|C9F8    |      ;
						BEQ CODE_09B69B                      ;09B698|F001    |09B69B;
						RTS                                  ;09B69A|60      |      ;
	
	
			CODE_09B69B:
						DEC.W $07EE                          ;09B69B|CEEE07  |0907EE;
						JMP.W clear_bossSlot_02             ;09B69E|4C3A87  |09873A;
	
	
			CODE_09B6A1:
						LDA.B #$60                           ;09B6A1|A960    |      ;
						STA.W r_entity_mask,X                ;09B6A3|9D7004  |090470;
						LDA.B #$30                           ;09B6A6|A930    |      ;
						STA.W r_entity_damage,X              ;09B6A8|9D5706  |090657;
						LDY.W r_entity_target,X              ;09B6AB|BC0606  |090606;
						BNE CODE_09B700                      ;09B6AE|D050    |09B700;
						LDA.W r_entity_AI,X                  ;09B6B0|BDEF05  |0905EF;
						AND.B #$7F                           ;09B6B3|297F    |      ;
						BNE CODE_09B6BF                      ;09B6B5|D008    |09B6BF;
						JSR.W CODE_09B885                    ;09B6B7|2085B8  |09B885;
						LDA.B #$D2                           ;09B6BA|A9D2    |      ;
						JMP.W setEnityAi_scriptIDX_01        ;09B6BC|4C4F86  |09864F;
	
	
			CODE_09B6BF:
						LDA.W r_entity_AI_IDX,X              ;09B6BF|BDC105  |0905C1;
						CMP.B #$07                           ;09B6C2|C907    |      ;
						BEQ CODE_09B6CB                      ;09B6C4|F005    |09B6CB;
						CMP.B #$0D                           ;09B6C6|C90D    |      ;
						BEQ CODE_09B6F2                      ;09B6C8|F028    |09B6F2;
						RTS                                  ;09B6CA|60      |      ;
	
	
			CODE_09B6CB:
						LDA.B #$01                           ;09B6CB|A901    |      ;
						STA.B $17                            ;09B6CD|8517    |000017;
	
			CODE_09B6CF:
						LDA.B #$24                           ;09B6CF|A924    |      ;
						JSR.W setEntity_pos_06               ;09B6D1|206687  |098766;
						LDA.B #$00                           ;09B6D4|A900    |      ;
						STA.W r_entity_target,Y              ;09B6D6|990606  |090606;
						LDA.B $17                            ;09B6D9|A517    |000017;
						STA.W r_damagActionFlag,Y            ;09B6DB|991D06  |09061D;
						LDA.B #$60                           ;09B6DE|A960    |      ;
						STA.W r_entity_mask,Y                ;09B6E0|997004  |090470;
						LDA.B #$80                           ;09B6E3|A980    |      ;
						STA.W r_entity_AI,Y                  ;09B6E5|99EF05  |0905EF;
						LDA.B #$C0                           ;09B6E8|A9C0    |      ;
						STA.W r_entity_YPos,Y                ;09B6EA|991C04  |09041C;
						DEC.B $17                            ;09B6ED|C617    |000017;
						BPL CODE_09B6CF                      ;09B6EF|10DE    |09B6CF;
						RTS                                  ;09B6F1|60      |      ;
	
	
			CODE_09B6F2:
						INC.W r_entity_target,X              ;09B6F2|FE0606  |090606;
						LDA.B #$30                           ;09B6F5|A930    |      ;
						STA.W r_damagActionFlag,X            ;09B6F7|9D1D06  |09061D;
						LDA.B #$80                           ;09B6FA|A980    |      ;
						STA.W r_entity_AI,X                  ;09B6FC|9DEF05  |0905EF;
						RTS                                  ;09B6FF|60      |      ;
	
	
			CODE_09B700:
						DEY                                  ;09B700|88      |      ;
						BNE CODE_09B754                      ;09B701|D051    |09B754;
						LDA.W r_damagActionFlag,X            ;09B703|BD1D06  |09061D;
						BNE CODE_09B750                      ;09B706|D048    |09B750;
						LDA.W r_entity_AI,X                  ;09B708|BDEF05  |0905EF;
						AND.B #$7F                           ;09B70B|297F    |      ;
						BNE CODE_09B717                      ;09B70D|D008    |09B717;
						JSR.W CODE_09B885                    ;09B70F|2085B8  |09B885;
						LDA.B #$D2                           ;09B712|A9D2    |      ;
						JMP.W setEnityAi_scriptIDX_01        ;09B714|4C4F86  |09864F;
	
	
			CODE_09B717:
						LDA.W r_entity_AI_IDX,X              ;09B717|BDC105  |0905C1;
						CMP.B #$07                           ;09B71A|C907    |      ;
						BEQ CODE_09B723                      ;09B71C|F005    |09B723;
						CMP.B #$0D                           ;09B71E|C90D    |      ;
						BEQ CODE_09B742                      ;09B720|F020    |09B742;
						RTS                                  ;09B722|60      |      ;
	
	
			CODE_09B723:
						LDA.B #$24                           ;09B723|A924    |      ;
						JSR.W setEntity_pos_06               ;09B725|206687  |098766;
						LDA.B #$01                           ;09B728|A901    |      ;
						STA.W r_entity_target,Y              ;09B72A|990606  |090606;
						LDA.B #$00                           ;09B72D|A900    |      ;
						STA.W r_damagActionFlag,Y            ;09B72F|991D06  |09061D;
						LDA.B #$60                           ;09B732|A960    |      ;
						STA.W r_entity_mask,Y                ;09B734|997004  |090470;
						LDA.B #$80                           ;09B737|A980    |      ;
						STA.W r_entity_AI,Y                  ;09B739|99EF05  |0905EF;
						LDA.B #$C0                           ;09B73C|A9C0    |      ;
						STA.W r_entity_YPos,Y                ;09B73E|991C04  |09041C;
						RTS                                  ;09B741|60      |      ;
	
	
			CODE_09B742:
						INC.W r_entity_target,X              ;09B742|FE0606  |090606;
						LDA.B #$20                           ;09B745|A920    |      ;
						STA.W r_damagActionFlag,X            ;09B747|9D1D06  |09061D;
						LDA.B #$80                           ;09B74A|A980    |      ;
						STA.W r_entity_AI,X                  ;09B74C|9DEF05  |0905EF;
						RTS                                  ;09B74F|60      |      ;
	
	
			CODE_09B750:
						DEC.W r_damagActionFlag,X            ;09B750|DE1D06  |09061D;
						RTS                                  ;09B753|60      |      ;
	
	
			CODE_09B754:
						DEY                                  ;09B754|88      |      ;
						BNE CODE_09B781                      ;09B755|D02A    |09B781;
						LDA.W r_damagActionFlag,X            ;09B757|BD1D06  |09061D;
						BNE CODE_09B750                      ;09B75A|D0F4    |09B750;
						LDA.W r_entity_XPos,X                ;09B75C|BD3804  |090438;
						STA.W r_damagActionFlag,X            ;09B75F|9D1D06  |09061D;
						AND.B #$F0                           ;09B762|29F0    |      ;
						STA.W r_misc_movementState,X         ;09B764|9D4506  |090645;
						LDA.B #$00                           ;09B767|A900    |      ;
						STA.W r_Player_StateDoubled,X        ;09B769|9D6505  |090565;
						STA.W r_entity_AI_IDX,X              ;09B76C|9DC105  |0905C1;
						LDY.W r_entity_Counter,X             ;09B76F|BC3306  |090633;
						LDA.W DATA8_09B8A1,Y                 ;09B772|B9A1B8  |09B8A1;
						CMP.W r_damagActionFlag,X            ;09B775|DD1D06  |09061D;
						BCS CODE_09B77D                      ;09B778|B003    |09B77D;
						INC.W r_Player_StateDoubled,X        ;09B77A|FE6505  |090565;
	
			CODE_09B77D:
						INC.W r_entity_target,X              ;09B77D|FE0606  |090606;
						RTS                                  ;09B780|60      |      ;
	
	
			CODE_09B781:
						LDA.B #$00                           ;09B781|A900    |      ;
						STA.W r_entity_damage,X              ;09B783|9D5706  |090657;
						DEY                                  ;09B786|88      |      ;
						BNE CODE_09B805                      ;09B787|D07C    |09B805;
						LDA.W r_entity_extra,X               ;09B789|BDD805  |0905D8;
						BNE CODE_09B801                      ;09B78C|D073    |09B801;
						LDA.W r_Player_StateDoubled,X        ;09B78E|BD6505  |090565;
						BEQ CODE_09B7A9                      ;09B791|F016    |09B7A9;
						LDA.W r_entity_XPos,X                ;09B793|BD3804  |090438;
						SEC                                  ;09B796|38      |      ;
						SBC.B #$10                           ;09B797|E910    |      ;
						STA.W r_entity_XPos,X                ;09B799|9D3804  |090438;
						AND.B #$F0                           ;09B79C|29F0    |      ;
						CMP.W r_misc_movementState,X         ;09B79E|DD4506  |090645;
						BEQ CODE_09B7FB                      ;09B7A1|F058    |09B7FB;
						BCC CODE_09B7BF                      ;09B7A3|901A    |09B7BF;
						LDA.B #$00                           ;09B7A5|A900    |      ;
						BEQ CODE_09B7FD                      ;09B7A7|F054    |09B7FD;
	
			CODE_09B7A9:
						LDA.W r_entity_XPos,X                ;09B7A9|BD3804  |090438;
						CLC                                  ;09B7AC|18      |      ;
						ADC.B #$10                           ;09B7AD|6910    |      ;
						STA.W r_entity_XPos,X                ;09B7AF|9D3804  |090438;
						AND.B #$F0                           ;09B7B2|29F0    |      ;
						CMP.W r_misc_movementState,X         ;09B7B4|DD4506  |090645;
						BEQ CODE_09B7FB                      ;09B7B7|F042    |09B7FB;
						BCS CODE_09B7BF                      ;09B7B9|B004    |09B7BF;
						LDA.B #$00                           ;09B7BB|A900    |      ;
						BEQ CODE_09B7FD                      ;09B7BD|F03E    |09B7FD;
	
			CODE_09B7BF:
						LDA.W r_damagActionFlag,X            ;09B7BF|BD1D06  |09061D;
						STA.W r_entity_XPos,X                ;09B7C2|9D3804  |090438;
						INC.W r_entity_AI_IDX,X              ;09B7C5|FEC105  |0905C1;
						LDA.W r_entity_AI_IDX,X              ;09B7C8|BDC105  |0905C1;
						CMP.B #$04                           ;09B7CB|C904    |      ;
						BNE CODE_09B7FB                      ;09B7CD|D02C    |09B7FB;
						LDA.B #$00                           ;09B7CF|A900    |      ;
						STA.W r_entity_AI_IDX,X              ;09B7D1|9DC105  |0905C1;
						LDY.W r_entity_Counter,X             ;09B7D4|BC3306  |090633;
						LDA.W DATA8_09B8A1,Y                 ;09B7D7|B9A1B8  |09B8A1;
						CMP.W r_misc_movementState,X         ;09B7DA|DD4506  |090645;
						BNE CODE_09B7E3                      ;09B7DD|D004    |09B7E3;
						INC.W r_entity_target,X              ;09B7DF|FE0606  |090606;
						RTS                                  ;09B7E2|60      |      ;
	
	
			CODE_09B7E3:
						LDA.B #$10                           ;09B7E3|A910    |      ;
						STA.B $00                            ;09B7E5|8500    |000000;
						LDA.W r_Player_StateDoubled,X        ;09B7E7|BD6505  |090565;
						BEQ CODE_09B7F0                      ;09B7EA|F004    |09B7F0;
						LDA.B #$F0                           ;09B7EC|A9F0    |      ;
						STA.B $00                            ;09B7EE|8500    |000000;
	
			CODE_09B7F0:
						LDA.W r_misc_movementState,X         ;09B7F0|BD4506  |090645;
						CLC                                  ;09B7F3|18      |      ;
						ADC.B $00                            ;09B7F4|6500    |000000;
						AND.B #$F0                           ;09B7F6|29F0    |      ;
						STA.W r_misc_movementState,X         ;09B7F8|9D4506  |090645;
	
			CODE_09B7FB:
						LDA.B #$00                           ;09B7FB|A900    |      ;
	
			CODE_09B7FD:
						STA.W r_entity_extra,X               ;09B7FD|9DD805  |0905D8;
						RTS                                  ;09B800|60      |      ;
	
	
			CODE_09B801:
						DEC.W r_entity_extra,X               ;09B801|DED805  |0905D8;
						RTS                                  ;09B804|60      |      ;
	
	
			CODE_09B805:
						JSR.W CODE_09B885                    ;09B805|2085B8  |09B885;
						LDA.W r_entity_extra,X               ;09B808|BDD805  |0905D8;
						BNE CODE_09B801                      ;09B80B|D0F4    |09B801;
						LDA.W r_Player_StateDoubled,X        ;09B80D|BD6505  |090565;
						BEQ CODE_09B828                      ;09B810|F016    |09B828;
						LDA.W r_entity_XPos,X                ;09B812|BD3804  |090438;
						SEC                                  ;09B815|38      |      ;
						SBC.B #$10                           ;09B816|E910    |      ;
						STA.W r_entity_XPos,X                ;09B818|9D3804  |090438;
						AND.B #$F0                           ;09B81B|29F0    |      ;
						CMP.W r_misc_movementState,X         ;09B81D|DD4506  |090645;
						BEQ CODE_09B7FB                      ;09B820|F0D9    |09B7FB;
						BCC CODE_09B83E                      ;09B822|901A    |09B83E;
						LDA.B #$00                           ;09B824|A900    |      ;
						BEQ CODE_09B7FD                      ;09B826|F0D5    |09B7FD;
	
			CODE_09B828:
						LDA.W r_entity_XPos,X                ;09B828|BD3804  |090438;
						CLC                                  ;09B82B|18      |      ;
						ADC.B #$10                           ;09B82C|6910    |      ;
						STA.W r_entity_XPos,X                ;09B82E|9D3804  |090438;
						AND.B #$F0                           ;09B831|29F0    |      ;
						CMP.W r_misc_movementState,X         ;09B833|DD4506  |090645;
						BEQ CODE_09B7FB                      ;09B836|F0C3    |09B7FB;
						BCS CODE_09B83E                      ;09B838|B004    |09B83E;
						LDA.B #$00                           ;09B83A|A900    |      ;
						BEQ CODE_09B7FD                      ;09B83C|F0BF    |09B7FD;
	
			CODE_09B83E:
						LDA.W r_damagActionFlag,X            ;09B83E|BD1D06  |09061D;
						STA.W r_entity_XPos,X                ;09B841|9D3804  |090438;
						INC.W r_entity_AI_IDX,X              ;09B844|FEC105  |0905C1;
						LDA.W r_entity_AI_IDX,X              ;09B847|BDC105  |0905C1;
						CMP.B #$04                           ;09B84A|C904    |      ;
						BNE CODE_09B7FB                      ;09B84C|D0AD    |09B7FB;
						LDA.B #$00                           ;09B84E|A900    |      ;
						STA.W r_entity_AI_IDX,X              ;09B850|9DC105  |0905C1;
						LDA.W r_damagActionFlag,X            ;09B853|BD1D06  |09061D;
						AND.B #$F0                           ;09B856|29F0    |      ;
						CMP.W r_misc_movementState,X         ;09B858|DD4506  |090645;
						BNE CODE_09B86E                      ;09B85B|D011    |09B86E;
						LDA.B #$00                           ;09B85D|A900    |      ;
						STA.W r_entity_target,X              ;09B85F|9D0606  |090606;
						INC.W r_entity_Counter,X             ;09B862|FE3306  |090633;
						LDA.W r_entity_Counter,X             ;09B865|BD3306  |090633;
						AND.B #$07                           ;09B868|2907    |      ;
						STA.W r_entity_Counter,X             ;09B86A|9D3306  |090633;
						RTS                                  ;09B86D|60      |      ;
	
	
			CODE_09B86E:
						LDA.B #$10                           ;09B86E|A910    |      ;
						STA.B $00                            ;09B870|8500    |000000;
						LDA.W r_Player_StateDoubled,X        ;09B872|BD6505  |090565;
						BEQ CODE_09B87B                      ;09B875|F004    |09B87B;
						LDA.B #$F0                           ;09B877|A9F0    |      ;
						STA.B $00                            ;09B879|8500    |000000;
	
			CODE_09B87B:
						LDA.W r_damagActionFlag,X            ;09B87B|BD1D06  |09061D;
						CLC                                  ;09B87E|18      |      ;
						ADC.B $00                            ;09B87F|6500    |000000;
						STA.W r_damagActionFlag,X            ;09B881|9D1D06  |09061D;
						RTS                                  ;09B884|60      |      ;
	
	
			CODE_09B885:
						LDY.B #$00                           ;09B885|A000    |      ;
						LDA.W r_entity_XPos                  ;09B887|AD3804  |090438;
						CMP.W r_entity_XPos,X                ;09B88A|DD3804  |090438;
						BCS CODE_09B890                      ;09B88D|B001    |09B890;
						INY                                  ;09B88F|C8      |      ;
	
			CODE_09B890:
						TYA                                  ;09B890|98      |      ;
						STA.W r_entity_FacingLeft,X          ;09B891|9DA804  |0904A8;
						RTS                                  ;09B894|60      |      ;
	
	
			DATA8_09B895:
						db $F4,$F6,$F8,$FA                   ;09B895|        |      ;
						db $FC,$FE                           ;09B899|        |      ;
	
			DATA8_09B89B:
						db $04,$08,$0C,$14                   ;09B89B|        |      ;
						db $18,$1C                           ;09B89F|        |      ;
	
			DATA8_09B8A1:
						db $80,$30,$80,$D0                   ;09B8A1|        |      ;
						db $A0,$50,$A0,$D0                   ;09B8A5|        |      ;
	
			bossID__24:
						LDA.B r_HUD_healthBoss               ;09B8A9|A53D    |00003D;
						BNE CODE_09B8B0                      ;09B8AB|D003    |09B8B0;
						JMP.W clear_bossSlot_02             ;09B8AD|4C3A87  |09873A;
	
	
			CODE_09B8B0:
						LDA.B #$00                           ;09B8B0|A900    |      ;
						STA.W r_entity_damage,X              ;09B8B2|9D5706  |090657;
						db $20                               ;09B8B5|        |      ;
						dw setMovmentSpdZero                 ;09B8B6|        |0FFEC8;
						LDA.W r_entity_AI,X                  ;09B8B8|BDEF05  |0905EF;
						AND.B #$7F                           ;09B8BB|297F    |      ;
						BNE CODE_09B908                      ;09B8BD|D049    |09B908;
						LDA.W r_entity_target,X              ;09B8BF|BD0606  |090606;
						BEQ CODE_09B8CF                      ;09B8C2|F00B    |09B8CF;
						LDA.W r_entity_XPos                  ;09B8C4|AD3804  |090438;
						STA.W r_entity_XPos,X                ;09B8C7|9D3804  |090438;
						LDA.B #$D3                           ;09B8CA|A9D3    |      ;
						JMP.W setEnityAi_scriptIDX_01        ;09B8CC|4C4F86  |09864F;
	
	
			CODE_09B8CF:
						LDA.W r_entity_XPos                  ;09B8CF|AD3804  |090438;
						SEC                                  ;09B8D2|38      |      ;
						SBC.W r_entity_XPos,X                ;09B8D3|FD3804  |090438;
						BCS CODE_09B8EE                      ;09B8D6|B016    |09B8EE;
						EOR.B #$FF                           ;09B8D8|49FF    |      ;
						CLC                                  ;09B8DA|18      |      ;
						ADC.B #$01                           ;09B8DB|6901    |      ;
						LSR A                                ;09B8DD|4A      |      ;
						STA.B $00                            ;09B8DE|8500    |000000;
						LDA.W r_damagActionFlag,X            ;09B8E0|BD1D06  |09061D;
						BNE CODE_09B8F6                      ;09B8E3|D011    |09B8F6;
	
			CODE_09B8E5:
						LDA.W r_entity_XPos                  ;09B8E5|AD3804  |090438;
						SEC                                  ;09B8E8|38      |      ;
						SBC.B $00                            ;09B8E9|E500    |000000;
						JMP.W CODE_09B8FC                    ;09B8EB|4CFCB8  |09B8FC;
	
	
			CODE_09B8EE:
						LSR A                                ;09B8EE|4A      |      ;
						STA.B $00                            ;09B8EF|8500    |000000;
						LDA.W r_damagActionFlag,X            ;09B8F1|BD1D06  |09061D;
						BNE CODE_09B8E5                      ;09B8F4|D0EF    |09B8E5;
	
			CODE_09B8F6:
						LDA.W r_entity_XPos                  ;09B8F6|AD3804  |090438;
						CLC                                  ;09B8F9|18      |      ;
						ADC.B $00                            ;09B8FA|6500    |000000;
	
			CODE_09B8FC:
						AND.B #$F0                           ;09B8FC|29F0    |      ;
						ORA.B #$08                           ;09B8FE|0908    |      ;
						STA.W r_entity_XPos,X                ;09B900|9D3804  |090438;
						LDA.B #$D4                           ;09B903|A9D4    |      ;
						JMP.W setEnityAi_scriptIDX_01        ;09B905|4C4F86  |09864F;
	
	
			CODE_09B908:
						LDA.B r_invincableFrames             ;09B908|A580    |000080;
						BNE CODE_09B959                      ;09B90A|D04D    |09B959;
						LDA.W r_entity_AI_IDX,X              ;09B90C|BDC105  |0905C1;
						CMP.B #$04                           ;09B90F|C904    |      ;
						BCC CODE_09B959                      ;09B911|9046    |09B959;
						LDA.W r_entity_XPos                  ;09B913|AD3804  |090438;
						SEC                                  ;09B916|38      |      ;
						SBC.W r_entity_XPos,X                ;09B917|FD3804  |090438;
						BCS CODE_09B921                      ;09B91A|B005    |09B921;
						EOR.B #$FF                           ;09B91C|49FF    |      ;
						CLC                                  ;09B91E|18      |      ;
						ADC.B #$01                           ;09B91F|6901    |      ;
	
			CODE_09B921:
						STA.B $00                            ;09B921|8500    |000000;
						LDA.W r_entity_target,X              ;09B923|BD0606  |090606;
						BEQ CODE_09B930                      ;09B926|F008    |09B930;
						LDA.B $00                            ;09B928|A500    |000000;
						CMP.B #$10                           ;09B92A|C910    |      ;
						BCS CODE_09B959                      ;09B92C|B02B    |09B959;
						BCC CODE_09B936                      ;09B92E|9006    |09B936;
	
			CODE_09B930:
						LDA.B $00                            ;09B930|A500    |000000;
						CMP.B #$08                           ;09B932|C908    |      ;
						BCS CODE_09B959                      ;09B934|B023    |09B959;
	
			CODE_09B936:
						LDA.W r_entity_spriteID,X            ;09B936|BD0004  |090400;
						SEC                                  ;09B939|38      |      ;
						SBC.B #$98                           ;09B93A|E998    |      ;
						LSR A                                ;09B93C|4A      |      ;
						TAY                                  ;09B93D|A8      |      ;
						LDA.W DATA8_09B95A,Y                 ;09B93E|B95AB9  |09B95A;
						STA.B $00                            ;09B941|8500    |000000;
						LDA.W r_entity_YPos,X                ;09B943|BD1C04  |09041C;
						SEC                                  ;09B946|38      |      ;
						SBC.W r_entity_YPos                  ;09B947|ED1C04  |09041C;
						BCS CODE_09B951                      ;09B94A|B005    |09B951;
						EOR.B #$FF                           ;09B94C|49FF    |      ;
						CLC                                  ;09B94E|18      |      ;
						ADC.B #$01                           ;09B94F|6901    |      ;
	
			CODE_09B951:
						CMP.B $00                            ;09B951|C500    |000000;
						BCS CODE_09B959                      ;09B953|B004    |09B959;
						LDA.B #$30                           ;09B955|A930    |      ;
						STA.B r_damagePlayer                 ;09B957|8581    |000081;
	
			CODE_09B959:
						RTS                                  ;09B959|60      |      ;
	
	
			DATA8_09B95A:
						db $08,$18,$38,$58                   ;09B95A|        |      ;
						db $90,$08,$10,$28                   ;09B95E|        |      ;
						db $2E                               ;09B962|        |      ;
	
			CODE_09B963:
						LDA.W r_entity_target,X              ;09B963|BD0606  |090606;
						BEQ CODE_09B96B                      ;09B966|F003    |09B96B;
						JMP.W CODE_09BABE                    ;09B968|4CBEBA  |09BABE;
	
	
			CODE_09B96B:
						LDA.W r_orb_flagsTimer               ;09B96B|ADF307  |0907F3;
						AND.B #$80                           ;09B96E|2980    |      ;
						BNE CODE_09B975                      ;09B970|D003    |09B975;
						JMP.W CODE_09BA13                    ;09B972|4C13BA  |09BA13;
	
	
			CODE_09B975:
						LDA.W r_misc_movementState,X         ;09B975|BD4506  |090645;
						BNE CODE_09B9EA                      ;09B978|D070    |09B9EA;
						STA.W r_entity_damageRelated,X       ;09B97A|9D6906  |090669;
						STA.W r_entity_damage,X              ;09B97D|9D5706  |090657;
						LDY.B #$32                           ;09B980|A032    |      ;
						STY.B r_CHR_BankBG_0400              ;09B982|844B    |00004B;
						INY                                  ;09B984|C8      |      ;
						STY.B r_CHR_BankBG_0800              ;09B985|844C    |00004C;
						INY                                  ;09B987|C8      |      ;
						STY.B r_CHR_BankSpr_0800             ;09B988|8448    |000048;
						INY                                  ;09B98A|C8      |      ;
						STY.B r_CHR_BankSpr_0c00             ;09B98B|8449    |000049;
						db $20                               ;09B98D|        |      ;
						dw updateCHR_enemyCHR                ;09B98E|        |0FE33C;
						db $20                               ;09B990|        |      ;
						dw BG_CHR_Bank2REG                   ;09B991|        |0FE35D;
						LDA.B #$F0                           ;09B993|A9F0    |      ;
						JSR.W CODE_09BBCB                    ;09B995|20CBBB  |09BBCB;
						LDA.B #$05                           ;09B998|A905    |      ;
						STA.B $17                            ;09B99A|8517    |000017;
	
			CODE_09B99C:
						LDA.B #$0D                           ;09B99C|A90D    |      ;
						JSR.W setEntity_pos_06               ;09B99E|206687  |098766;
						TXA                                  ;09B9A1|8A      |      ;
						STA.W r_entity_extra,Y               ;09B9A2|99D805  |0905D8;
						LDA.B $17                            ;09B9A5|A517    |000017;
						STA.W r_entity_target,Y              ;09B9A7|990606  |090606;
						LDA.B #$F0                           ;09B9AA|A9F0    |      ;
						JSR.W CODE_09BBD4                    ;09B9AC|20D4BB  |09BBD4;
						LDA.B #$80                           ;09B9AF|A980    |      ;
						STA.W r_entity_AI,Y                  ;09B9B1|99EF05  |0905EF;
						LDA.B $17                            ;09B9B4|A517    |000017;
						STA.W r_entity_Counter,Y             ;09B9B6|993306  |090633;
						LDA.B #$01                           ;09B9B9|A901    |      ;
						STA.W r_damagActionFlag,Y            ;09B9BB|991D06  |09061D;
						LDA.B #$20                           ;09B9BE|A920    |      ;
						STA.W r_entity_mask,Y                ;09B9C0|997004  |090470;
						LDA.B #$0D                           ;09B9C3|A90D    |      ;
						STA.W r_entity_Health,Y              ;09B9C5|997B06  |09067B;
						DEC.B $17                            ;09B9C8|C617    |000017;
						BNE CODE_09B99C                      ;09B9CA|D0D0    |09B99C;
						LDA.B #$00                           ;09B9CC|A900    |      ;
						STA.W r_entity_Counter,X             ;09B9CE|9D3306  |090633;
						LDA.B #$01                           ;09B9D1|A901    |      ;
						STA.W r_damagActionFlag,X            ;09B9D3|9D1D06  |09061D;
						INC.W r_misc_movementState,X         ;09B9D6|FE4506  |090645;
						LDA.B #$60                           ;09B9D9|A960    |      ;
						STA.W r_entity_mask,X                ;09B9DB|9D7004  |090470;
						LDA.B #$40                           ;09B9DE|A940    |      ;
						STA.B r_HUD_healthBoss               ;09B9E0|853D    |00003D;
						STA.W r_entity_Health,X              ;09B9E2|9D7B06  |09067B;
						LDA.B #$60                           ;09B9E5|A960    |      ;
						db $4C                               ;09B9E7|        |      ;
	
						dw lunchMusic                        ;09B9E8|        |0FE25F;
	
			CODE_09B9EA:
						LDY.B #$D2                           ;09B9EA|A0D2    |      ;
						JSR.W CODE_09BBDD                    ;09B9EC|20DDBB  |09BBDD;
						JSR.W CODE_09BBED                    ;09B9EF|20EDBB  |09BBED;
						BNE CODE_09BA12                      ;09B9F2|D01E    |09BA12;
						LDA.B #$D2                           ;09B9F4|A9D2    |      ;
						JSR.W CODE_09BBCB                    ;09B9F6|20CBBB  |09BBCB;
						jsr AND_7F_r_orb_flagsTimer
						LDA.B #$30                           ;09BA01|A930    |      ;
						STA.W $0658,X                        ;09BA03|9D5806  |090658;
						STA.W $0659,X                        ;09BA06|9D5906  |090659;
						STA.W $065A,X                        ;09BA09|9D5A06  |09065A;
						STA.W $065B,X                        ;09BA0C|9D5B06  |09065B;
						STA.W $065C,X                        ;09BA0F|9D5C06  |09065C;
	
			CODE_09BA12:
						RTS                                  ;09BA12|60      |      ;
	
	
			CODE_09BA13:
						LDA.B #$60                           ;09BA13|A960    |      ;
						STA.W r_entity_mask,X                ;09BA15|9D7004  |090470;
						LDY.B r_HUD_healthBoss               ;09BA18|A43D    |00003D;
						BNE CODE_09BA39                      ;09BA1A|D01D    |09BA39;
						INY                                  ;09BA1C|C8      |      ;
						STY.W r_orb_flagsTimer               ;09BA1D|8CF307  |0907F3;
						LDA.W r_entity_AI,X                  ;09BA20|BDEF05  |0905EF;
						AND.B #$7F                           ;09BA23|297F    |      ;
						CMP.B #$5D                           ;09BA25|C95D    |      ;
						BEQ CODE_09BA36                      ;09BA27|F00D    |09BA36;
						LDA.B #$40                           ;09BA29|A940    |      ;
						JSR.W setEntity__09                  ;09BA2B|206186  |098661;
						LDA.B #$7B                           ;09BA2E|A97B    |      ;
						db $20                               ;09BA30|        |      ;
						dw lunchMusic                        ;09BA31|        |0FE25F;
						JMP.W CODE_09BC04                    ;09BA33|4C04BC  |09BC04;
	
	
			CODE_09BA36:
						JMP.W CODE_09BC2C                    ;09BA36|4C2CBC  |09BC2C;
	
	
			CODE_09BA39:
						LDA.B #$00                           ;09BA39|A900    |      ;
						STA.W r_entity_Xspd,X                ;09BA3B|9DF204  |0904F2;
						LDA.B #$60                           ;09BA3E|A960    |      ;
						STA.W r_entity_XsubSpd,X             ;09BA40|9D0905  |090509;
						LDA.W r_misc_movementState,X         ;09BA43|BD4506  |090645;
						AND.B #$0F                           ;09BA46|290F    |      ;
						TAY                                  ;09BA48|A8      |      ;
						LDA.W DATA8_09BD1B,Y                 ;09BA49|B91BBD  |09BD1B;
						CMP.B #$FF                           ;09BA4C|C9FF    |      ;
						BNE CODE_09BA53                      ;09BA4E|D003    |09BA53;
						LDA.W r_entity_XPos                  ;09BA50|AD3804  |090438;
	
			CODE_09BA53:
						SEC                                  ;09BA53|38      |      ;
						SBC.W r_entity_XPos,X                ;09BA54|FD3804  |090438;
						STA.B $00                            ;09BA57|8500    |000000;
						BCS CODE_09BA6C                      ;09BA59|B011    |09BA6C;
						EOR.B #$FF                           ;09BA5B|49FF    |      ;
						CLC                                  ;09BA5D|18      |      ;
						ADC.B #$01                           ;09BA5E|6901    |      ;
						STA.B $00                            ;09BA60|8500    |000000;
						LDA.B #$FF                           ;09BA62|A9FF    |      ;
						STA.W r_entity_Xspd,X                ;09BA64|9DF204  |0904F2;
						LDA.B #$A0                           ;09BA67|A9A0    |      ;
						STA.W r_entity_XsubSpd,X             ;09BA69|9D0905  |090509;
	
			CODE_09BA6C:
						LDA.B $00                            ;09BA6C|A500    |000000;
						CMP.B #$04                           ;09BA6E|C904    |      ;
						BCS CODE_09BA7D                      ;09BA70|B00B    |09BA7D;
						INC.W r_misc_movementState,X         ;09BA72|FE4506  |090645;
						LDA.W r_misc_movementState,X         ;09BA75|BD4506  |090645;
						AND.B #$F3                           ;09BA78|29F3    |      ;
						STA.W r_misc_movementState,X         ;09BA7A|9D4506  |090645;
	
			CODE_09BA7D:
						JSR.W CODE_09BBED                    ;09BA7D|20EDBB  |09BBED;
						BNE CODE_09BAAB                      ;09BA80|D029    |09BAAB;
						LDA.W r_misc_movementState,X         ;09BA82|BD4506  |090645;
						CLC                                  ;09BA85|18      |      ;
						ADC.B #$10                           ;09BA86|6910    |      ;
						AND.B #$3F                           ;09BA88|293F    |      ;
						STA.W r_misc_movementState,X         ;09BA8A|9D4506  |090645;
						AND.B #$F0                           ;09BA8D|29F0    |      ;
						LSR A                                ;09BA8F|4A      |      ;
						LSR A                                ;09BA90|4A      |      ;
						LSR A                                ;09BA91|4A      |      ;
						TAY                                  ;09BA92|A8      |      ;
						LDA.W DATA8_09BD1F,Y                 ;09BA93|B91FBD  |09BD1F;
						STA.W r_entity_Counter,X             ;09BA96|9D3306  |090633;
						LDA.W DATA8_09BD20,Y                 ;09BA99|B920BD  |09BD20;
						STA.W r_damagActionFlag,X            ;09BA9C|9D1D06  |09061D;
						LDA.W DATA8_09BD27,Y                 ;09BA9F|B927BD  |09BD27;
						STA.W r_entity_YsubSpd,X             ;09BAA2|9D3705  |090537;
						LDA.W DATA8_09BD28,Y                 ;09BAA5|B928BD  |09BD28;
						STA.W r_entity_Yspd,X                ;09BAA8|9D2005  |090520;
	
			CODE_09BAAB:
						LDA.W r_entity_YPos,X                ;09BAAB|BD1C04  |09041C;
						CMP.B #$30                           ;09BAAE|C930    |      ;
						BCS CODE_09BAB4                      ;09BAB0|B002    |09BAB4;
						LDA.B #$30                           ;09BAB2|A930    |      ;
	
			CODE_09BAB4:
						CMP.B #$80                           ;09BAB4|C980    |      ;
						BCC CODE_09BABA                      ;09BAB6|9002    |09BABA;
						LDA.B #$7F                           ;09BAB8|A97F    |      ;
	
			CODE_09BABA:
						STA.W r_entity_YPos,X                ;09BABA|9D1C04  |09041C;
	
			CODE_09BABD:
						RTS                                  ;09BABD|60      |      ;
	
	
			CODE_09BABE:
						LDA.W r_orb_flagsTimer               ;09BABE|ADF307  |0907F3;
						AND.B #$80                           ;09BAC1|2980    |      ;
						BEQ CODE_09BAD7                      ;09BAC3|F012    |09BAD7;
						LDA.B #$00                           ;09BAC5|A900    |      ;
						STA.W r_misc_movementState,X         ;09BAC7|9D4506  |090645;
						JSR.W CODE_09BC86                    ;09BACA|2086BC  |09BC86;
						JSR.W CODE_09BBED                    ;09BACD|20EDBB  |09BBED;
						JSR.W CODE_09BCAB                    ;09BAD0|20ABBC  |09BCAB;
						TAY                                  ;09BAD3|A8      |      ;
						JMP.W CODE_09BBDD                    ;09BAD4|4CDDBB  |09BBDD;
	
	
			CODE_09BAD7:
						LDA.B #$20                           ;09BAD7|A920    |      ;
						STA.W r_entity_mask,X                ;09BAD9|9D7004  |090470;
						LDY.W r_orb_flagsTimer               ;09BADC|ACF307  |0907F3;
						DEY                                  ;09BADF|88      |      ;
						BNE CODE_09BB0E                      ;09BAE0|D02C    |09BB0E;
						LDA.B #$60                           ;09BAE2|A960    |      ;
						STA.W r_entity_mask,X                ;09BAE4|9D7004  |090470;
						LDA.W r_entity_AI,X                  ;09BAE7|BDEF05  |0905EF;
						AND.B #$7F                           ;09BAEA|297F    |      ;
						CMP.B #$5D                           ;09BAEC|C95D    |      ;
						BEQ CODE_09BAF3                      ;09BAEE|F003    |09BAF3;
						JMP.W CODE_09BC09                    ;09BAF0|4C09BC  |09BC09;
	
	
			CODE_09BAF3:
						JSR.W CODE_09BC2C                    ;09BAF3|202CBC  |09BC2C;
						BCC CODE_09BABD                      ;09BAF6|90C5    |09BABD;
						JMP.W clear_bossSlot_02             ;09BAF8|4C3A87  |09873A;
	
	
			CODE_09BAFB:
						LDA.W r_entity_damageRelated,X       ;09BAFB|BD6906  |090669;
						AND.B #$F0                           ;09BAFE|29F0    |      ;
						BEQ CODE_09BB23                      ;09BB00|F021    |09BB23;
						LDA.B #$28                           ;09BB02|A928    |      ;
	
			DATA8_09BB04:
						db $20                               ;09BB04|        |      ;
						dw lunchMusic                        ;09BB05|        |0FE25F;
						JMP.W CODE_09BB23                    ;09BB07|4C23BB  |09BB23;
	
	
			CODE_09BB0A:
						LDA.B #$7A                           ;09BB0A|A97A    |      ;
						BNE DATA8_09BB04                     ;09BB0C|D0F6    |09BB04;
	
			CODE_09BB0E:
						JSR.W CODE_09BC86                    ;09BB0E|2086BC  |09BC86;
						LDA.W r_entity_Health,X              ;09BB11|BD7B06  |09067B;
						BEQ CODE_09BAFB                      ;09BB14|F0E5    |09BAFB;
						LDA.B #$04                           ;09BB16|A904    |      ;
						JSR.W setEntity__05                  ;09BB18|200589  |098905;
						LDA.W r_entity_Health,X              ;09BB1B|BD7B06  |09067B;
						BEQ CODE_09BB0A                      ;09BB1E|F0EA    |09BB0A;
						JSR.W CODE_09BBAC                    ;09BB20|20ACBB  |09BBAC;
	
			CODE_09BB23:
						LDA.B #$00                           ;09BB23|A900    |      ;
						STA.W r_entity_damageRelated,X       ;09BB25|9D6906  |090669;
						LDA.W r_entity_Health,X              ;09BB28|BD7B06  |09067B;
						BNE CODE_09BB37                      ;09BB2B|D00A    |09BB37;
						JSR.W CODE_09BCAB                    ;09BB2D|20ABBC  |09BCAB;
						CLC                                  ;09BB30|18      |      ;
						ADC.B #$04                           ;09BB31|6904    |      ;
						STA.W r_entity_spriteID,X            ;09BB33|9D0004  |090400;
						RTS                                  ;09BB36|60      |      ;
	
	
			CODE_09BB37:
						LDY.W r_misc_movementState,X         ;09BB37|BC4506  |090645;
						BNE CODE_09BB48                      ;09BB3A|D00C    |09BB48;
						JSR.W CODE_09BCAB                    ;09BB3C|20ABBC  |09BCAB;
						STA.W r_entity_spriteID,X            ;09BB3F|9D0004  |090400;
						INC.W r_misc_movementState,X         ;09BB42|FE4506  |090645;
						JMP.W CODE_09BB98                    ;09BB45|4C98BB  |09BB98;
	
	
			CODE_09BB48:
						DEY                                  ;09BB48|88      |      ;
						BNE CODE_09BB62                      ;09BB49|D017    |09BB62;
						JSR.W CODE_09BBED                    ;09BB4B|20EDBB  |09BBED;
						BNE CODE_09BB61                      ;09BB4E|D011    |09BB61;
						LDA.B #$08                           ;09BB50|A908    |      ;
						STA.W r_entity_Counter,X             ;09BB52|9D3306  |090633;
						JSR.W CODE_09BCAB                    ;09BB55|20ABBC  |09BCAB;
						CLC                                  ;09BB58|18      |      ;
						ADC.B #$02                           ;09BB59|6902    |      ;
						STA.W r_entity_spriteID,X            ;09BB5B|9D0004  |090400;
						INC.W r_misc_movementState,X         ;09BB5E|FE4506  |090645;
	
			CODE_09BB61:
						RTS                                  ;09BB61|60      |      ;
	
	
			CODE_09BB62:
						DEY                                  ;09BB62|88      |      ;
						BNE CODE_09BB87                      ;09BB63|D022    |09BB87;
						DEC.W r_entity_Counter,X             ;09BB65|DE3306  |090633;
						BNE CODE_09BB61                      ;09BB68|D0F7    |09BB61;
						LDA.B #$40                           ;09BB6A|A940    |      ;
						STA.W r_entity_Counter,X             ;09BB6C|9D3306  |090633;
						LDA.B #$29                           ;09BB6F|A929    |      ;
						JSR.W setEntity_pos_06               ;09BB71|206687  |098766;
						LDA.B #$DF                           ;09BB74|A9DF    |      ;
						STA.W r_entity_AI,Y                  ;09BB76|99EF05  |0905EF;
						LDA.B #$00                           ;09BB79|A900    |      ;
						STA.W r_entity_AI_IDX,Y              ;09BB7B|99C105  |0905C1;
						LDA.B #$60                           ;09BB7E|A960    |      ;
						STA.W r_entity_mask,Y                ;09BB80|997004  |090470;
						INC.W r_misc_movementState,X         ;09BB83|FE4506  |090645;
						RTS                                  ;09BB86|60      |      ;
	
	
			CODE_09BB87:
						DEC.W r_entity_Counter,X             ;09BB87|DE3306  |090633;
						BNE CODE_09BB61                      ;09BB8A|D0D5    |09BB61;
						LDA.B #$00                           ;09BB8C|A900    |      ;
						STA.W r_misc_movementState,X         ;09BB8E|9D4506  |090645;
						JSR.W CODE_09BCAB                    ;09BB91|20ABBC  |09BCAB;
						STA.W r_entity_spriteID,X            ;09BB94|9D0004  |090400;
						RTS                                  ;09BB97|60      |      ;
	
	
			CODE_09BB98:
						LDA.W r_entity_target,X              ;09BB98|BD0606  |090606;
						AND.B #$03                           ;09BB9B|2903    |      ;
						ASL A                                ;09BB9D|0A      |      ;
						TAY                                  ;09BB9E|A8      |      ;
						LDA.W DATA8_09BD53,Y                 ;09BB9F|B953BD  |09BD53;
						STA.W r_entity_Counter,X             ;09BBA2|9D3306  |090633;
						LDA.W DATA8_09BD54,Y                 ;09BBA5|B954BD  |09BD54;
						STA.W r_damagActionFlag,X            ;09BBA8|9D1D06  |09061D;
						RTS                                  ;09BBAB|60      |      ;
	
	
			CODE_09BBAC:
						LDA.W r_entity_damageRelated,X       ;09BBAC|BD6906  |090669;
						BEQ CODE_09BBCA                      ;09BBAF|F019    |09BBCA;
						LDY.B #$01                           ;09BBB1|A001    |      ;
	
			CODE_09BBB3:
						LDA.W r_entity_ID,Y                  ;09BBB3|B94E05  |09054E;
						CMP.B #$0D                           ;09BBB6|C90D    |      ;
						BNE CODE_09BBC5                      ;09BBB8|D00B    |09BBC5;
						LDA.B #$00                           ;09BBBA|A900    |      ;
						STA.W r_entity_damageRelated,Y       ;09BBBC|996906  |090669;
						LDA.W r_player_WeaImpact,X           ;09BBBF|BD8D06  |09068D;
						STA.W r_player_WeaImpact,Y           ;09BBC2|998D06  |09068D;
	
			CODE_09BBC5:
						INY                                  ;09BBC5|C8      |      ;
						CPY.B #$0D                           ;09BBC6|C00D    |      ;
						BNE CODE_09BBB3                      ;09BBC8|D0E9    |09BBB3;
	
			CODE_09BBCA:
						RTS                                  ;09BBCA|60      |      ;
	
	
			CODE_09BBCB:
						STA.W r_entity_spriteID,X            ;09BBCB|9D0004  |090400;
						LDA.B #$10                           ;09BBCE|A910    |      ;
						STA.W r_entity_spriteGroup,X         ;09BBD0|9D8C04  |09048C;
						RTS                                  ;09BBD3|60      |      ;
	
	
			CODE_09BBD4:
						STA.W r_entity_spriteID,Y            ;09BBD4|990004  |090400;
						LDA.B #$10                           ;09BBD7|A910    |      ;
						STA.W r_entity_spriteGroup,Y         ;09BBD9|998C04  |09048C;
						RTS                                  ;09BBDC|60      |      ;
	
	
			CODE_09BBDD:
						LDA.W r_entity_Counter,X             ;09BBDD|BD3306  |090633;
						AND.B #$03                           ;09BBE0|2903    |      ;
						BNE CODE_09BBE7                      ;09BBE2|D003    |09BBE7;
						TYA                                  ;09BBE4|98      |      ;
						BNE CODE_09BBE9                      ;09BBE5|D002    |09BBE9;
	
			CODE_09BBE7:
						LDA.B #$F0                           ;09BBE7|A9F0    |      ;
	
			CODE_09BBE9:
						STA.W r_entity_spriteID,X            ;09BBE9|9D0004  |090400;
						RTS                                  ;09BBEC|60      |      ;
	
	
			CODE_09BBED:
						LDA.W r_damagActionFlag,X            ;09BBED|BD1D06  |09061D;
						ORA.W r_entity_Counter,X             ;09BBF0|1D3306  |090633;
						BEQ CODE_09BC03                      ;09BBF3|F00E    |09BC03;
						DEC.W r_entity_Counter,X             ;09BBF5|DE3306  |090633;
						LDY.W r_entity_Counter,X             ;09BBF8|BC3306  |090633;
						INY                                  ;09BBFB|C8      |      ;
						BNE CODE_09BC01                      ;09BBFC|D003    |09BC01;
						DEC.W r_damagActionFlag,X            ;09BBFE|DE1D06  |09061D;
	
			CODE_09BC01:
						LDA.B #$01                           ;09BC01|A901    |      ;
	
			CODE_09BC03:
						RTS                                  ;09BC03|60      |      ;
	
	
			CODE_09BC04:
						LDA.B #$3F                           ;09BC04|A93F    |      ;
						STA.W r_orb_statesGlobal             ;09BC06|8DED07  |0907ED;
	
			CODE_09BC09:
						LDA.B #$00                           ;09BC09|A900    |      ;
						STA.W r_entity_damageRelated,X       ;09BC0B|9D6906  |090669;
						STA.W r_entity_damage,X              ;09BC0E|9D5706  |090657;
						LDA.B #$60                           ;09BC11|A960    |      ;
						STA.W r_entity_mask,X                ;09BC13|9D7004  |090470;
						LDA.W r_entity_target,X              ;09BC16|BD0606  |090606;
						ASL A                                ;09BC19|0A      |      ;
						TAY                                  ;09BC1A|A8      |      ;
						LDA.W DATA8_09BD2F,Y                 ;09BC1B|B92FBD  |09BD2F;
						STA.W r_entity_XsubSpd,X             ;09BC1E|9D0905  |090509;
						LDA.W DATA8_09BD30,Y                 ;09BC21|B930BD  |09BD30;
						STA.W r_entity_Xspd,X                ;09BC24|9DF204  |0904F2;
						LDA.B #$DD                           ;09BC27|A9DD    |      ;
						JMP.W setEnityAi_scriptIDX_01        ;09BC29|4C4F86  |09864F;
	
	
			CODE_09BC2C:
						LDA.B #$00                           ;09BC2C|A900    |      ;
						STA.W r_entity_damageRelated,X       ;09BC2E|9D6906  |090669;
						STA.W r_entity_damage,X              ;09BC31|9D5706  |090657;
						LDA.W r_entity_AI_IDX,X              ;09BC34|BDC105  |0905C1;
						CMP.B #$00                           ;09BC37|C900    |      ;
						BNE CODE_09BC53                      ;09BC39|D018    |09BC53;
						LDA.B #$00                           ;09BC3B|A900    |      ;
						LDY.B #$08                           ;09BC3D|A008    |      ;
						db $20                               ;09BC3F|        |      ;
						dw getCollusionBasedOnOffset         ;09BC40|        |0FFC1E;
						BEQ CODE_09BC53                      ;09BC42|F00F    |09BC53;
						INC.W r_entity_AI_IDX,X              ;09BC44|FEC105  |0905C1;
						LDA.B #$0E                           ;09BC47|A90E    |      ;
						LDY.B #$08                           ;09BC49|A008    |      ;
						db $20                               ;09BC4B|        |      ;
						dw setSpriteAndAnimGroup_AY                 ;09BC4C|        |0FEF5C;
						LDA.B #$40                           ;09BC4E|A940    |      ;
						STA.W r_entity_mask,X                ;09BC50|9D7004  |090470;
	
			CODE_09BC53:
						LDA.W r_entity_AI_IDX,X              ;09BC53|BDC105  |0905C1;
						CMP.B #$06                           ;09BC56|C906    |      ;
						BNE CODE_09BC84                      ;09BC58|D02A    |09BC84;
						LDY.W r_entity_target,X              ;09BC5A|BC0606  |090606;
						LDA.W DATA8_09BD13,Y                 ;09BC5D|B913BD  |09BD13;
						EOR.B #$FF                           ;09BC60|49FF    |      ;
						AND.W r_orb_statesGlobal             ;09BC62|2DED07  |0907ED;
						STA.W r_orb_statesGlobal             ;09BC65|8DED07  |0907ED;
						BNE CODE_09BC82                      ;09BC68|D018    |09BC82;
						LDA.B #$61                           ;09BC6A|A961    |      ;
						db $20                               ;09BC6C|        |      ;
						dw lunchMusic                        ;09BC6D|        |0FE25F;
						INC.W r_bossPieces       ;09BC6F|EEEC07  |0907EC;
						LDA.B #$80                           ;09BC72|A980    |      ;
						STA.W r_orb_flagsTimer               ;09BC74|8DF307  |0907F3;
						LDA.B #$00                           ;09BC77|A900    |      ;
						STA.W $07EE                          ;09BC79|8DEE07  |0907EE;
						STA.W $07EF                          ;09BC7C|8DEF07  |0907EF;
						JSR.W DATA8_09BF6B                   ;09BC7F|206BBF  |09BF6B;
	
			CODE_09BC82:
						SEC                                  ;09BC82|38      |      ;
						RTS                                  ;09BC83|60      |      ;
	
	
			CODE_09BC84:
						CLC                                  ;09BC84|18      |      ;
						RTS                                  ;09BC85|60      |      ;
	
	
			CODE_09BC86:
						LDA.W r_entity_target,X              ;09BC86|BD0606  |090606;
						ASL A                                ;09BC89|0A      |      ;
						TAY                                  ;09BC8A|A8      |      ;
						LDA.W DATA8_09BD3B,Y                 ;09BC8B|B93BBD  |09BD3B;
						STA.B $00                            ;09BC8E|8500    |000000;
						LDA.W DATA8_09BD3C,Y                 ;09BC90|B93CBD  |09BD3C;
						STA.B $01                            ;09BC93|8501    |000001;
						LDY.W r_entity_extra,X               ;09BC95|BCD805  |0905D8;
						LDA.W r_entity_XPos,Y                ;09BC98|B93804  |090438;
						CLC                                  ;09BC9B|18      |      ;
						ADC.B $00                            ;09BC9C|6500    |000000;
						STA.W r_entity_XPos,X                ;09BC9E|9D3804  |090438;
						LDA.W r_entity_YPos,Y                ;09BCA1|B91C04  |09041C;
						CLC                                  ;09BCA4|18      |      ;
						ADC.B $01                            ;09BCA5|6501    |000001;
						STA.W r_entity_YPos,X                ;09BCA7|9D1C04  |09041C;
						RTS                                  ;09BCAA|60      |      ;
	
	
			CODE_09BCAB:
						LDY.W r_entity_target,X              ;09BCAB|BC0606  |090606;
						LDA.W DATA8_09BD4D,Y                 ;09BCAE|B94DBD  |09BD4D;
						STA.W r_entity_FacingLeft,X          ;09BCB1|9DA804  |0904A8;
						LDA.W DATA8_09BD47,Y                 ;09BCB4|B947BD  |09BD47;
						RTS                                  ;09BCB7|60      |      ;
	
	
		bossPreview__29:
						LDY.W r_orb_flagsTimer               ;09BCB8|ACF307  |0907F3;
						DEY                                  ;09BCBB|88      |      ;
						BNE CODE_09BCC5                      ;09BCBC|D007    |09BCC5;
						LDA.W r_bossPieces       ;09BCBE|ADEC07  |0907EC;
						CMP.B #$02                           ;09BCC1|C902    |      ;
						BEQ CODE_09BCED                      ;09BCC3|F028    |09BCED;
	
			CODE_09BCC5:
						LDA.B #$30                           ;09BCC5|A930    |      ;
						STA.W r_entity_damage,X              ;09BCC7|9D5706  |090657;
						LDY.W r_bossPieces       ;09BCCA|ACEC07  |0907EC;
						DEY                                  ;09BCCD|88      |      ;
						BEQ CODE_09BCF0                      ;09BCCE|F020    |09BCF0;
						LDA.W r_entity_YPos,X                ;09BCD0|BD1C04  |09041C;
						JSR.W CODE_09BCE1                    ;09BCD3|20E1BC  |09BCE1;
						BCS CODE_09BCED                      ;09BCD6|B015    |09BCED;
						LDA.W r_entity_XPos,X                ;09BCD8|BD3804  |090438;
						JSR.W CODE_09BCE1                    ;09BCDB|20E1BC  |09BCE1;
						BCS CODE_09BCED                      ;09BCDE|B00D    |09BCED;
						RTS                                  ;09BCE0|60      |      ;
	
	
			CODE_09BCE1:
						AND.B #$F8                           ;09BCE1|29F8    |      ;
						BEQ CODE_09BCEB                      ;09BCE3|F006    |09BCEB;
						CMP.B #$F8                           ;09BCE5|C9F8    |      ;
						BEQ CODE_09BCEB                      ;09BCE7|F002    |09BCEB;
						CLC                                  ;09BCE9|18      |      ;
						RTS                                  ;09BCEA|60      |      ;
	
	
			CODE_09BCEB:
						SEC                                  ;09BCEB|38      |      ;
						RTS                                  ;09BCEC|60      |      ;
	
	
			CODE_09BCED:
						JMP.W clear_bossSlot_02             ;09BCED|4C3A87  |09873A;
	
	
			CODE_09BCF0:
						LDA.W r_entity_AI_IDX,X              ;09BCF0|BDC105  |0905C1;
						CMP.B #$05                           ;09BCF3|C905    |      ;
						BNE CODE_09BD12                      ;09BCF5|D01B    |09BD12;
						LDA.B #$00                           ;09BCF7|A900    |      ;
						LDY.B #$08                           ;09BCF9|A008    |      ;
						db $20                               ;09BCFB|        |      ;
						dw getCollusionBasedOnOffset         ;09BCFC|        |0FFC1E;
						BEQ CODE_09BD12                      ;09BCFE|F012    |09BD12;
						LDA.B #$0A                           ;09BD00|A90A    |      ;
						db $20                               ;09BD02|        |      ;
						dw lunchMusic                        ;09BD03|        |0FE25F;
						LDA.W r_entity_YPos,X                ;09BD05|BD1C04  |09041C;
						AND.B #$F0                           ;09BD08|29F0    |      ;
						ORA.B #$08                           ;09BD0A|0908    |      ;
						STA.W r_entity_YPos,X                ;09BD0C|9D1C04  |09041C;
						INC.W r_entity_AI_IDX,X              ;09BD0F|FEC105  |0905C1;
	
			CODE_09BD12:
						RTS                                  ;09BD12|60      |      ;
	
	
			DATA8_09BD13:
						db $01,$02,$04,$08                   ;09BD13|        |      ;
						db $10,$20,$40,$80                   ;09BD17|        |      ;
	
			DATA8_09BD1B:
						db $80,$D0,$30,$FF                   ;09BD1B|        |      ;
	
			DATA8_09BD1F:
						db $80                               ;09BD1F|        |      ;
	
			DATA8_09BD20:
						db $00,$00,$01,$00                   ;09BD20|        |      ;
						db $01,$C0,$00                       ;09BD24|        |      ;
	
			DATA8_09BD27:
						db $E0                               ;09BD27|        |      ;
	
			DATA8_09BD28:
						db $FF,$20,$00,$C0                   ;09BD28|        |      ;
						db $FF,$40,$00                       ;09BD2C|        |      ;
	
			DATA8_09BD2F:
						db $00                               ;09BD2F|        |      ;
	
			DATA8_09BD30:
						db $FF,$80,$00,$80                   ;09BD30|        |      ;
						db $FF,$00,$FF,$20                   ;09BD34|        |      ;
						db $01,$E0,$FE                       ;09BD38|        |      ;
	
			DATA8_09BD3B:
						db $00                               ;09BD3B|        |      ;
	
			DATA8_09BD3C:
						db $00,$F0,$08,$F8                   ;09BD3C|        |      ;
						db $28,$00,$18,$10                   ;09BD40|        |      ;
						db $08,$08,$28                       ;09BD44|        |      ;
	
			DATA8_09BD47:
						db $D2,$C0,$C6,$CC                   ;09BD47|        |      ;
						db $C0,$C6                           ;09BD4B|        |      ;
	
			DATA8_09BD4D:
						db $00,$01,$01,$00                   ;09BD4D|        |      ;
						db $00,$00                           ;09BD51|        |      ;
	
			DATA8_09BD53:
						db $60                               ;09BD53|        |      ;
	
			DATA8_09BD54:
						db $00,$20,$00,$40                   ;09BD54|        |      ;
						db $00,$70,$00,$80                   ;09BD58|        |      ;
						db $00,$30,$00                       ;09BD5C|        |      ;
	
			CODE_09BD5F:
						LDA.W r_orb_flagsTimer               ;09BD5F|ADF307  |0907F3;
						AND.B #$80                           ;09BD62|2980    |      ;
						BNE CODE_09BD69                      ;09BD64|D003    |09BD69;
						JMP.W CODE_09BE67                    ;09BD66|4C67BE  |09BE67;
	
	
			CODE_09BD69:
						LDA.B #$88                           ;09BD69|A988    |      ;
						STA.W r_entity_mask,X                ;09BD6B|9D7004  |090470;
						LDA.W r_orb_statesGlobal             ;09BD6E|ADED07  |0907ED;
						CMP.B #$0E                           ;09BD71|C90E    |      ;
						BCS CODE_09BDDE                      ;09BD73|B069    |09BDDE;
						LDA.B #$02                           ;09BD75|A902    |      ;
						STA.B $04                            ;09BD77|8504    |000004;
						STX.B r_coreLoadingFuncAddr          ;09BD79|8616    |000016;
	
			CODE_09BD7B:
						LDA.B #$00                           ;09BD7B|A900    |      ;
						STA.B $00                            ;09BD7D|8500    |000000;
						STA.B r_VRAM_QueueDestHi             ;09BD7F|8562    |000062;
						LDA.W r_orb_statesGlobal             ;09BD81|ADED07  |0907ED;
						LDY.B #$05                           ;09BD84|A005    |      ;
	
			CODE_09BD86:
						ASL A                                ;09BD86|0A      |      ;
						ROL.B r_VRAM_QueueDestHi             ;09BD87|2662    |000062;
						DEY                                  ;09BD89|88      |      ;
						BNE CODE_09BD86                      ;09BD8A|D0FA    |09BD86;
						CLC                                  ;09BD8C|18      |      ;
						ADC.B #$4A                           ;09BD8D|694A    |      ;
						STA.B r_VRAM_QueueDestLo             ;09BD8F|8561    |000061;
						LDA.B r_VRAM_QueueDestHi             ;09BD91|A562    |000062;
						ADC.B #$21                           ;09BD93|6921    |      ;
						STA.B r_VRAM_QueueDestHi             ;09BD95|8562    |000062;
						db $20                               ;09BD97|        |      ;
						dw updateVRAM_1                      ;09BD98|        |0FE8B5;
						LDY.W $07EE                          ;09BD9A|ACEE07  |0907EE;
	
			CODE_09BD9D:
						LDA.W DATA8_09BF6E,Y                 ;09BD9D|B96EBF  |09BF6E;
						CMP.B #$C0                           ;09BDA0|C9C0    |      ;
						BCC CODE_09BDB3                      ;09BDA2|900F    |09BDB3;
						AND.B #$0F                           ;09BDA4|290F    |      ;
						STA.B $03                            ;09BDA6|8503    |000003;
						LDA.B #$00                           ;09BDA8|A900    |      ;
	
			CODE_09BDAA:
						JSR.W CODE_09BF66                    ;09BDAA|2066BF  |09BF66;
						DEC.B $03                            ;09BDAD|C603    |000003;
						BNE CODE_09BDAA                      ;09BDAF|D0F9    |09BDAA;
						BEQ CODE_09BDB6                      ;09BDB1|F003    |09BDB6;
	
			CODE_09BDB3:
						JSR.W CODE_09BF66                    ;09BDB3|2066BF  |09BF66;
	
			CODE_09BDB6:
						INY                                  ;09BDB6|C8      |      ;
						LDA.B $00                            ;09BDB7|A500    |000000;
						CMP.B #$0C                           ;09BDB9|C90C    |      ;
						BNE CODE_09BD9D                      ;09BDBB|D0E0    |09BD9D;
						STY.W $07EE                          ;09BDBD|8CEE07  |0907EE;
						INC.W r_orb_statesGlobal             ;09BDC0|EEED07  |0907ED;
						db $20                               ;09BDC3|        |      ;
						dw closeVramQueue                    ;09BDC4|        |0FED12;
						DEC.B $04                            ;09BDC6|C604    |000004;
						BNE CODE_09BD7B                      ;09BDC8|D0B1    |09BD7B;
						LDA.W r_orb_statesGlobal             ;09BDCA|ADED07  |0907ED;
						CMP.B #$0E                           ;09BDCD|C90E    |      ;
						BCC CODE_09BDDB                      ;09BDCF|900A    |09BDDB;
						LDA.B #$00                           ;09BDD1|A900    |      ;
						STA.W $07EE                          ;09BDD3|8DEE07  |0907EE;
						LDA.B #$08                           ;09BDD6|A908    |      ;
						STA.W $07EF                          ;09BDD8|8DEF07  |0907EF;
	
			CODE_09BDDB:
						LDX.B r_coreLoadingFuncAddr          ;09BDDB|A616    |000016;
						RTS                                  ;09BDDD|60      |      ;
	
	
			CODE_09BDDE:
						DEC.W $07EF                          ;09BDDE|CEEF07  |0907EF;
						BNE CODE_09BDFB                      ;09BDE1|D018    |09BDFB;
						LDA.W $07EE                          ;09BDE3|ADEE07  |0907EE;
						JSR.W DATA8_09BF6B                   ;09BDE6|206BBF  |09BF6B;
						LDA.W $07EE                          ;09BDE9|ADEE07  |0907EE;
						CLC                                  ;09BDEC|18      |      ;
						ADC.B #$08                           ;09BDED|6908    |      ;
						CMP.B #$20                           ;09BDEF|C920    |      ;
						BCS CODE_09BDFC                      ;09BDF1|B009    |09BDFC;
						STA.W $07EE                          ;09BDF3|8DEE07  |0907EE;
						LDA.B #$08                           ;09BDF6|A908    |      ;
						STA.W $07EF                          ;09BDF8|8DEF07  |0907EF;
	
			CODE_09BDFB:
						RTS                                  ;09BDFB|60      |      ;
	
	
			CODE_09BDFC:
						LDA.B #$31                           ;09BDFC|A931    |      ;
						STA.B r_CHR_BankSpr_0c00             ;09BDFE|8549    |000049;
						db $20                               ;09BE00|        |      ;
						dw updateCHR_enemyCHR                ;09BE01|        |0FE33C;
						LDA.B #$00                           ;09BE03|A900    |      ;
						STA.W r_orb_flagsTimer               ;09BE05|8DF307  |0907F3;
						STA.W $07F1                          ;09BE08|8DF107  |0907F1;
						STA.W $07F0                          ;09BE0B|8DF007  |0907F0;
						STA.W $07EE                          ;09BE0E|8DEE07  |0907EE;
						STA.W r_orb_statesGlobal             ;09BE11|8DED07  |0907ED;
						STA.W r_entity_target,X              ;09BE14|9D0606  |090606;
						LDA.B #$88                           ;09BE17|A988    |      ;
						STA.W r_entity_mask,X                ;09BE19|9D7004  |090470;
						LDA.B #$80                           ;09BE1C|A980    |      ;
						STA.W r_entity_XPos,X                ;09BE1E|9D3804  |090438;
						LDA.B #$60                           ;09BE21|A960    |      ;
						STA.W r_entity_YPos,X                ;09BE23|9D1C04  |09041C;
						LDA.B #$40                           ;09BE26|A940    |      ;
						STA.B r_HUD_healthBoss               ;09BE28|853D    |00003D;
						STA.W r_entity_Health,X              ;09BE2A|9D7B06  |09067B;
						LDA.B #$0D                           ;09BE2D|A90D    |      ;
						JSR.W setEntity_pos_06               ;09BE2F|206687  |098766;
						LDA.B #$01                           ;09BE32|A901    |      ;
						STA.W r_entity_target,Y              ;09BE34|990606  |090606;
						STA.B $17                            ;09BE37|8517    |000017;
						LDA.B #$88                           ;09BE39|A988    |      ;
						STA.W r_entity_mask,Y                ;09BE3B|997004  |090470;
	
			CODE_09BE3E:
						LDA.B #$8A                           ;09BE3E|A98A    |      ;
						JSR.W setEntity_pos_06               ;09BE40|206687  |098766;
						LDA.B #$80                           ;09BE43|A980    |      ;
						STA.W r_entity_AI,Y                  ;09BE45|99EF05  |0905EF;
						LDA.B #$00                           ;09BE48|A900    |      ;
						STA.W r_entity_AI_IDX,Y              ;09BE4A|99C105  |0905C1;
						STA.W r_misc_movementState,Y         ;09BE4D|994506  |090645;
						LDA.B $17                            ;09BE50|A517    |000017;
						BEQ CODE_09BE56                      ;09BE52|F002    |09BE56;
						LDA.B #$04                           ;09BE54|A904    |      ;
	
			CODE_09BE56:
						STA.W r_entity_Counter,Y             ;09BE56|993306  |090633;
						LDA.B #$60                           ;09BE59|A960    |      ;
						STA.W r_entity_mask,Y                ;09BE5B|997004  |090470;
						DEC.B $17                            ;09BE5E|C617    |000017;
						BPL CODE_09BE3E                      ;09BE60|10DC    |09BE3E;
						RTS                                  ;09BE62|60      |      ;
	
						DEC.W $07EF                          ;09BE63|CEEF07  |0907EF;
						RTS                                  ;09BE66|60      |      ;
	
	
			CODE_09BE67:
						LDA.W r_entity_target,X              ;09BE67|BD0606  |090606;
						BEQ CODE_09BED5                      ;09BE6A|F069    |09BED5;
						LDA.B #$00                           ;09BE6C|A900    |      ;
						STA.W r_entity_damage,X              ;09BE6E|9D5706  |090657;
						LDA.W r_orb_flagsTimer               ;09BE71|ADF307  |0907F3;
						BNE CODE_09BECC                      ;09BE74|D056    |09BECC;
						JSR.W CODE_09BBED                    ;09BE76|20EDBB  |09BBED;
						BNE CODE_09BECC                      ;09BE79|D051    |09BECC;
						LDA.B #$00                           ;09BE7B|A900    |      ;
						STA.W r_entity_FacingLeft,X          ;09BE7D|9DA804  |0904A8;
						LDY.W $07F1                          ;09BE80|ACF107  |0907F1;
						LDA.W DATA8_09BF55,Y                 ;09BE83|B955BF  |09BF55;
						CMP.B #$01                           ;09BE86|C901    |      ;
						BNE CODE_09BE8D                      ;09BE88|D003    |09BE8D;
						STA.W r_entity_FacingLeft,X          ;09BE8A|9DA804  |0904A8;
	
			CODE_09BE8D:
						TAY                                  ;09BE8D|A8      |      ;
						LDA.W DATA8_09BF5D,Y                 ;09BE8E|B95DBF  |09BF5D;
						STA.B r_index                        ;09BE91|8510    |000010;
						LDA.W DATA8_09BF60,Y                 ;09BE93|B960BF  |09BF60;
						STA.B r_collisionPointYinScreen      ;09BE96|8511    |000011;
						LDA.W DATA8_09BF63,Y                 ;09BE98|B963BF  |09BF63;
						JSR.W CODE_09BBCB                    ;09BE9B|20CBBB  |09BBCB;
						LDA.B #$E0                           ;09BE9E|A9E0    |      ;
						STA.W r_entity_AI,X                  ;09BEA0|9DEF05  |0905EF;
						LDA.B #$00                           ;09BEA3|A900    |      ;
						STA.W r_entity_AI_IDX,X              ;09BEA5|9DC105  |0905C1;
						LDA.B r_index                        ;09BEA8|A510    |000010;
						STA.W r_entity_XPos,X                ;09BEAA|9D3804  |090438;
						LDA.B r_collisionPointYinScreen      ;09BEAD|A511    |000011;
						STA.W r_entity_YPos,X                ;09BEAF|9D1C04  |09041C;
						INC.W $07F1                          ;09BEB2|EEF107  |0907F1;
						LDA.W $07F1                          ;09BEB5|ADF107  |0907F1;
						AND.B #$07                           ;09BEB8|2907    |      ;
						STA.W $07F1                          ;09BEBA|8DF107  |0907F1;
						LDA.B #$C0                           ;09BEBD|A9C0    |      ;
						STA.W r_entity_Counter,X             ;09BEBF|9D3306  |090633;
						LDA.B #$00                           ;09BEC2|A900    |      ;
						STA.W r_damagActionFlag,X            ;09BEC4|9D1D06  |09061D;
						LDA.B #$20                           ;09BEC7|A920    |      ;
						STA.W r_entity_mask,X                ;09BEC9|9D7004  |090470;
	
			CODE_09BECC:
						LDY.W r_orb_flagsTimer               ;09BECC|ACF307  |0907F3;
						DEY                                  ;09BECF|88      |      ;
						BNE CODE_09BEF6                      ;09BED0|D024    |09BEF6;
						JMP.W clear_bossSlot_02             ;09BED2|4C3A87  |09873A;
	
	
			CODE_09BED5:
						LDY.W r_orb_flagsTimer               ;09BED5|ACF307  |0907F3;
						DEY                                  ;09BED8|88      |      ;
						BNE CODE_09BF0D                      ;09BED9|D032    |09BF0D;
						DEC.W $07EF                          ;09BEDB|CEEF07  |0907EF;
						BNE CODE_09BEF6                      ;09BEDE|D016    |09BEF6;
						LDA.W $07EE                          ;09BEE0|ADEE07  |0907EE;
						JSR.W DATA8_09BF6B                   ;09BEE3|206BBF  |09BF6B;
						LDA.W $07EE                          ;09BEE6|ADEE07  |0907EE;
						SEC                                  ;09BEE9|38      |      ;
						SBC.B #$08                           ;09BEEA|E908    |      ;
						BCC CODE_09BEF7                      ;09BEEC|9009    |09BEF7;
						STA.W $07EE                          ;09BEEE|8DEE07  |0907EE;
						LDA.B #$08                           ;09BEF1|A908    |      ;
						STA.W $07EF                          ;09BEF3|8DEF07  |0907EF;
	
			CODE_09BEF6:
						RTS                                  ;09BEF6|60      |      ;
	
	
			CODE_09BEF7:
						LDA.W $07F0                          ;09BEF7|ADF007  |0907F0;
						CMP.B #$02                           ;09BEFA|C902    |      ;
						BNE CODE_09BF54                      ;09BEFC|D056    |09BF54;
						LDA.B #$80                           ;09BEFE|A980    |      ;
						JSR.W setEntity__09                  ;09BF00|206186  |098661;
						LDA.B #$02                           ;09BF03|A902    |      ;
						STA.W r_orb_flagsTimer               ;09BF05|8DF307  |0907F3;
						LDA.B #$00                           ;09BF08|A900    |      ;
						JMP.W setEntity_stats_03             ;09BF0A|4CF487  |0987F4;
	
	
			CODE_09BF0D:
						LDA.W r_damagActionFlag,X            ;09BF0D|BD1D06  |09061D;
						BEQ CODE_09BF29                      ;09BF10|F017    |09BF29;
						AND.B #$04                           ;09BF12|2904    |      ;
						BEQ CODE_09BF1A                      ;09BF14|F004    |09BF1A;
						LDA.B #$28                           ;09BF16|A928    |      ;
						BNE CODE_09BF1C                      ;09BF18|D002    |09BF1C;
	
			CODE_09BF1A:
						LDA.B #$20                           ;09BF1A|A920    |      ;
	
			CODE_09BF1C:
						DEC.W r_damagActionFlag,X            ;09BF1C|DE1D06  |09061D;
						BNE CODE_09BF23                      ;09BF1F|D002    |09BF23;
						LDA.B #$18                           ;09BF21|A918    |      ;
	
			CODE_09BF23:
						JSR.W DATA8_09BF6B                   ;09BF23|206BBF  |09BF6B;
						JMP.W CODE_09BF4C                    ;09BF26|4C4CBF  |09BF4C;
	
	
			CODE_09BF29:
						LDA.B #$03                           ;09BF29|A903    |      ;
						JSR.W setEntity__04                  ;09BF2B|20E088  |0988E0;
						LDA.B #$00                           ;09BF2E|A900    |      ;
						JSR.W setEntity_stats_03             ;09BF30|20F487  |0987F4;
						LDA.W r_orb_flagsTimer               ;09BF33|ADF307  |0907F3;
						BEQ CODE_09BF42                      ;09BF36|F00A    |09BF42;
						LDA.B #$18                           ;09BF38|A918    |      ;
						STA.W $07EE                          ;09BF3A|8DEE07  |0907EE;
						LDA.B #$01                           ;09BF3D|A901    |      ;
						STA.W $07EF                          ;09BF3F|8DEF07  |0907EF;
	
			CODE_09BF42:
						LDA.W r_entity_damageRelated,X       ;09BF42|BD6906  |090669;
						BEQ CODE_09BF4C                      ;09BF45|F005    |09BF4C;
						LDA.B #$20                           ;09BF47|A920    |      ;
						STA.W r_damagActionFlag,X            ;09BF49|9D1D06  |09061D;
	
			CODE_09BF4C:
						LDA.B #$00                           ;09BF4C|A900    |      ;
						STA.W r_entity_damageRelated,X       ;09BF4E|9D6906  |090669;
						STA.W r_entity_damage,X              ;09BF51|9D5706  |090657;
	
			CODE_09BF54:
						RTS                                  ;09BF54|60      |      ;
	
	
			DATA8_09BF55:
						db $00,$01,$02,$01                   ;09BF55|        |      ;
						db $00,$02,$01,$02                   ;09BF59|        |      ;
	
			DATA8_09BF5D:
						db $80,$60,$A0                       ;09BF5D|        |      ;
	
			DATA8_09BF60:
						db $60,$8C,$8C                       ;09BF60|        |      ;
	
			DATA8_09BF63:
						db $E4,$E0,$E0                       ;09BF63|        |      ;
	
			CODE_09BF66:
						INC.B $00                            ;09BF66|E600    |000000;
						jmp storeByteVramQueue                ;09BF69|        |0FED16;
	
			DATA8_09BF6B:
						jmp CODE_0FE5A0                       ;09BF6C|        |0FE5A0;
	
			DATA8_09BF6E:
						db $40,$53,$C3,$41                   ;09BF6E|        |      ;
						db $42,$C3,$8E,$7A                   ;09BF72|        |      ;
						db $50,$4A,$6C,$C2                   ;09BF76|        |      ;
						db $51,$52,$C2,$80                   ;09BF7A|        |      ;
						db $9E,$89,$43,$4D                   ;09BF7E|        |      ;
						db $7C,$6F,$60,$61                   ;09BF82|        |      ;
						db $62,$63,$75,$98                   ;09BF86|        |      ;
						db $9E,$88,$00,$5C                   ;09BF8A|        |      ;
						db $5F,$7F,$70,$71                   ;09BF8E|        |      ;
						db $72,$73,$83,$84                   ;09BF92|        |      ;
						db $96,$00,$00,$43                   ;09BF96|        |      ;
						db $44,$45,$46,$47                   ;09BF9A|        |      ;
						db $48,$49,$00,$4B                   ;09BF9E|        |      ;
						db $C2,$C2,$54,$55                   ;09BFA2|        |      ;
						db $56,$57,$58,$59                   ;09BFA6|        |      ;
						db $5A,$5B,$C2,$8A                   ;09BFAA|        |      ;
						db $8B,$64,$65,$66                   ;09BFAE|        |      ;
						db $67,$68,$69,$6A                   ;09BFB2|        |      ;
						db $6B,$8C,$8D,$9A                   ;09BFB6|        |      ;
						db $9B,$74,$00,$76                   ;09BFBA|        |      ;
						db $77,$78,$79,$00                   ;09BFBE|        |      ;
						db $7B,$9C,$9D,$C4                   ;09BFC2|        |      ;
						db $4E,$4F,$88,$89                   ;09BFC6|        |      ;
						db $C4,$C3,$5D,$5E                   ;09BFCA|        |      ;
						db $4F,$00,$99,$C4                   ;09BFCE|        |      ;
						db $C3,$6D,$6E,$C2                   ;09BFD2|        |      ;
						db $87,$C4,$C3,$7D                   ;09BFD6|        |      ;
						db $7E,$C2,$97,$C4                   ;09BFDA|        |      ;
						db $C3,$81,$82,$C2                   ;09BFDE|        |      ;
						db $85,$C4,$C2,$90                   ;09BFE2|        |      ;
						db $91,$92,$00,$94                   ;09BFE6|        |      ;
						db $95,$C4,$FF 


}




{ ; -- shared boss entities?? 			
			boss00__RTS:
						RTS                                  ;098230|60      |      ;


	
		clear_bossSlot_02:
						LDA.B #$00                           ;09873A|A900    |      ;
						STA.W r_entity_ID,X                  ;09873C|9D4E05  |09054E;
						STA.W r_entity_spriteID,X            ;09873F|9D0004  |090400;
						STA.W r_entity_spriteGroup,X         ;098742|9D8C04  |09048C;
	
			CODE_098745:
						LDA.B #$00                           ;098745|A900    |      ;
						STA.W r_entity_extra,X               ;098747|9DD805  |0905D8;
						STA.W r_entity_AI,X                  ;09874A|9DEF05  |0905EF;
						STA.W r_entity_target,X              ;09874D|9D0606  |090606;
						STA.W r_damagActionFlag,X            ;098750|9D1D06  |09061D;
						STA.W r_entity_Counter,X             ;098753|9D3306  |090633;
						STA.W r_misc_movementState,X         ;098756|9D4506  |090645;
						STA.W r_entity_damage,X              ;098759|9D5706  |090657;
						STA.W r_entity_damageRelated,X       ;09875C|9D6906  |090669;
						STA.W r_entity_Health,X              ;09875F|9D7B06  |09067B;
						STA.W r_player_WeaImpact,X           ;098762|9D8D06  |09068D;
						RTS                                  ;098765|60      |      ;
	
	
		setEntity_pos_06:
						STA.B r_collisionPointYinScreen      ;098766|8511    |000011;
						STX.B r_index                        ;098768|8610    |000010;
        
						jsr findEmptyEntitySlot               ;09876B|        |0FFEB9;
						BNE CODE_098775                      ;09876D|D006    |098775;
						JSR.W CODE_098779                    ;09876F|207987  |098779;
						JMP.W CODE_0987D1                    ;098772|4CD187  |0987D1;
	
	
			CODE_098775:
						LDX.B r_index                        ;098775|A610    |000010;
						CLC                                  ;098777|18      |      ;
						RTS                                  ;098778|60      |      ;
	
	
			CODE_098779:
						JSR.W CODE_098745                    ;098779|204587  |098745;
						LDY.B r_index                        ;09877C|A410    |000010;
						LDA.W r_entity_XPos,Y                ;09877E|B93804  |090438;
						STA.W r_entity_XPos,X                ;098781|9D3804  |090438;
						LDA.B r_collisionPointYinScreen      ;098784|A511    |000011;
						CMP.B #$29                           ;098786|C929    |      ;
						BEQ transYX_add_18toYpos                      ;098788|F013    |09879D;
						CMP.B #$18                           ;09878A|C918    |      ;
						BEQ transYX_add_10toYpos                      ;09878C|F023    |0987B1;
						CMP.B #$1A                           ;09878E|C91A    |      ;
						BEQ stage_0_7_rulesYX                      ;098790|F029    |0987BB;
						CMP.B #$1B                           ;098792|C91B    |      ;
						BEQ transYX_add_8toYpos                      ;098794|F011    |0987A7;
	
			transYX_yPos:
						LDA.W r_entity_YPos,Y                ;098796|B91C04  |09041C;
						STA.W r_entity_YPos,X                ;098799|9D1C04  |09041C;
						RTS                                  ;09879C|60      |      ;
	
	
			transYX_add_18toYpos:
						CLC                                  ;09879D|18      |      ;
						LDA.W r_entity_YPos,Y                ;09879E|B91C04  |09041C;
						ADC.B #$18                           ;0987A1|6918    |      ;
						STA.W r_entity_YPos,X                ;0987A3|9D1C04  |09041C;
						RTS                                  ;0987A6|60      |      ;
	
	
			transYX_add_8toYpos:
						CLC                                  ;0987A7|18      |      ;
						LDA.W r_entity_YPos,Y                ;0987A8|B91C04  |09041C;
						ADC.B #$08                           ;0987AB|6908    |      ;
						STA.W r_entity_YPos,X                ;0987AD|9D1C04  |09041C;
						RTS                                  ;0987B0|60      |      ;
	
	
			transYX_add_10toYpos:
						CLC                                  ;0987B1|18      |      ;
						LDA.W r_entity_YPos,Y                ;0987B2|B91C04  |09041C;
						ADC.B #$10                           ;0987B5|6910    |      ;
						STA.W r_entity_YPos,X                ;0987B7|9D1C04  |09041C;
						RTS                                  ;0987BA|60      |      ;

			stage_0_7_rulesYX:
						LDA.B r_stage                        ;0987BB|A532    |000032;
						BEQ transYX_add_8toYpos                      ;0987BD|F0E8    |0987A7;
						CMP.B #$07                           ;0987BF|C907    |      ;
						BEQ transYX_add_8toYpos                      ;0987C1|F0E4    |0987A7;
						BNE transYX_yPos                      ;0987C3|D0D1    |098796;




			setEntity__07:
						STA.B r_collisionPointYinScreen      ;0987C5|8511    |000011;
						STX.B r_index                        ;0987C7|8610    |000010;
						JSR.W CODE_0987E5                    ;0987C9|20E587  |0987E5;
						BNE CODE_0987E1                      ;0987CC|D013    |0987E1;
						JSR.W CODE_098779                    ;0987CE|207987  |098779;
	
			CODE_0987D1:
						LDA.B #$00                           ;0987D1|A900    |      ;
						STA.W r_entity_PaletteOverride,X     ;0987D3|9D5404  |090454;
						TXA                                  ;0987D6|8A      |      ;
						TAY                                  ;0987D7|A8      |      ;
						LDA.B r_collisionPointYinScreen      ;0987D8|A511    |000011;
						STA.W r_entity_ID,X                  ;0987DA|9D4E05  |09054E;
						LDX.B r_index                        ;0987DD|A610    |000010;
						SEC                                  ;0987DF|38      |      ;
						RTS                                  ;0987E0|60      |      ;
	
	
			CODE_0987E1:
						LDX.B r_index                        ;0987E1|A610    |000010;
						CLC                                  ;0987E3|18      |      ;
						RTS                                  ;0987E4|60      |      ;
	
	
			CODE_0987E5:
						LDX.B #$01                           ;0987E5|A201    |      ;
	
			CODE_0987E7:
						LDA.W r_entity_ID,X                  ;0987E7|BD4E05  |09054E;
						BEQ CODE_0987F3                      ;0987EA|F007    |0987F3;
						INX                                  ;0987EC|E8      |      ;
						CPX.B #$13                           ;0987ED|E013    |      ;
						BNE CODE_0987E7                      ;0987EF|D0F6    |0987E7;
						LDA.B #$01                           ;0987F1|A901    |      ;
	
			CODE_0987F3:
						RTS                                  ;0987F3|60      |      ;
	
	
	setEntity_stats_03:
						STA.B r_pointerQueue                 ;0987F4|8508    |000008;
						LDA.W r_orb_flagsTimer               ;0987F6|ADF307  |0907F3;
						BNE CODE_098829                      ;0987F9|D02E    |098829;
						LDA.W r_entity_Health,X              ;0987FB|BD7B06  |09067B;
						BEQ CODE_098803                      ;0987FE|F003    |098803;
						JMP.W clc_rts                        ;098800|4CCB88  |0988CB;
	
	
			CODE_098803:
						LDA.B r_stage                        ;098803|A532    |000032;
						CMP.B #$0E                           ;098805|C90E    |      ;
						BNE CODE_098814                      ;098807|D00B    |098814;
						LDA.W r_bossPieces       ;098809|ADEC07  |0907EC;
						CMP.B #$02                           ;09880C|C902    |      ;
						BNE CODE_098814                      ;09880E|D004    |098814;
						LDA.B #$7C                           ;098810|A97C    |      ;
						BNE DATA8_098816                     ;098812|D002    |098816;
	
			CODE_098814:
						LDA.B #$7B                           ;098814|A97B    |      ;
	
			DATA8_098816:
						db $20                               ;098816|        |      ;
						dw lunchMusic                        ;098817|        |0FE25F;
						LDA.B #$01                           ;098819|A901    |      ;
						STA.W r_orb_flagsTimer               ;09881B|8DF307  |0907F3;
						LDA.B #$00                           ;09881E|A900    |      ;
						STA.W r_entity_damage,X              ;098820|9D5706  |090657;
						STA.W r_entity_AI,X                  ;098823|9DEF05  |0905EF;
						db $4C                               ;098826|        |      ;
	
						dw setMovmentSpdZero                 ;098827|        |0FFEC8;
	
			CODE_098829:
						LDA.W r_orb_flagsTimer               ;098829|ADF307  |0907F3;
						CMP.B #$02                           ;09882C|C902    |      ;
						BEQ CODE_098833                      ;09882E|F003    |098833;
						JMP.W sec_rts                        ;098830|4CC988  |0988C9;
	
	
			CODE_098833:
						LDA.B r_stage                        ;098833|A532    |000032;
						CMP.B #$0A                           ;098835|C90A    |      ;
						BNE CODE_098842                      ;098837|D009    |098842;
						LDA.B r_blockLevel                   ;098839|A533    |000033;
						CMP.B #$03                           ;09883B|C903    |      ;
						BNE CODE_098842                      ;09883D|D003    |098842;
						JMP.W CODE_0988CD                    ;09883F|4CCD88  |0988CD;
	
	
			CODE_098842:
						LDA.B r_stage                        ;098842|A532    |000032;
						CMP.B #$03                           ;098844|C903    |      ;
						BNE CODE_098877                      ;098846|D02F    |098877;
						LDA.B r_blockLevel                   ;098848|A533    |000033;
						CMP.B #$02                           ;09884A|C902    |      ;
						BNE CODE_098877                      ;09884C|D029    |098877;
						LDA.B #$74                           ;09884E|A974    |      ;
						JSR.W setEntity_pos_06               ;098850|206687  |098766;
						LDA.B #$B0                           ;098853|A9B0    |      ;
						STA.W r_entity_XPos,Y                ;098855|993804  |090438;
						STA.W r_entity_YPos,Y                ;098858|991C04  |09041C;
	
			CODE_09885B:
						LDA.B #$A8                           ;09885B|A9A8    |      ;
						STA.W r_entity_mask,Y                ;09885D|997004  |090470;
						LDA.B #$00                           ;098860|A900    |      ;
						STA.W r_entity_AI,Y                  ;098862|99EF05  |0905EF;
						LDA.B #$02                           ;098865|A902    |      ;
						STA.W r_entity_spriteID,Y            ;098867|990004  |090400;
						LDA.B #$0E                           ;09886A|A90E    |      ;
						STA.W r_entity_damage,Y              ;09886C|995706  |090657;
						LDA.B #$03                           ;09886F|A903    |      ;
						STA.W r_orb_flagsTimer               ;098871|8DF307  |0907F3;
						JMP.W setEntity_stats_03             ;098874|4CF487  |0987F4;
	
	
			CODE_098877:
						LDA.B #$16                           ;098877|A916    |      ;
						JSR.W setEntity_pos_06               ;098879|206687  |098766;
						BCC clc_rts                          ;09887C|904D    |0988CB;
						LDA.B #$03                           ;09887E|A903    |      ;
						STA.W r_orb_flagsTimer               ;098880|8DF307  |0907F3;
						LDA.B #$63                           ;098883|A963    |      ;
						STA.W r_entity_AI,Y                  ;098885|99EF05  |0905EF;
						LDA.B #$80                           ;098888|A980    |      ;
						STA.W r_entity_XPos,Y                ;09888A|993804  |090438;
						STA.W r_entity_YPos,Y                ;09888D|991C04  |09041C;
						LDA.B r_stage                        ;098890|A532    |000032;
						CMP.B #$08                           ;098892|C908    |      ;
						BNE CODE_0988A6                      ;098894|D010    |0988A6;
						LDA.B r_blockLevel                   ;098896|A533    |000033;
						CMP.B #$02                           ;098898|C902    |      ;
						BEQ CODE_0988A6                      ;09889A|F00A    |0988A6;
						LDA.B #$60                           ;09889C|A960    |      ;
						STA.W r_entity_YPos,Y                ;09889E|991C04  |09041C;
						LDA.B #$90                           ;0988A1|A990    |      ;
						STA.W r_entity_XPos,Y                ;0988A3|993804  |090438;
	
			CODE_0988A6:
						LDA.B #$48                           ;0988A6|A948    |      ;
						db $20                               ;0988A8|        |      ;
						dw lunchMusic                        ;0988A9|        |0FE25F;
						db $20                               ;0988AB|        |      ;
						dw setAutoPlayFlag                   ;0988AC|        |0FE5CE;
						LDA.B #$00                           ;0988AE|A900    |      ;
						STA.W r_entity_AI_IDX,Y              ;0988B0|99C105  |0905C1;
						db $20                               ;0988B3|        |      ;
						dw setMovmentSpdZero                 ;0988B4|        |0FFEC8;
						STA.W r_entity_AI,X                  ;0988B6|9DEF05  |0905EF;
						STA.W r_entity_damage,X              ;0988B9|9D5706  |090657;
						LDA.B r_pointerQueue                 ;0988BC|A508    |000008;
						BNE sec_rts                          ;0988BE|D009    |0988C9;
						STA.W r_entity_ID,X                  ;0988C0|9D4E05  |09054E;
						STA.W r_entity_mask,X                ;0988C3|9D7004  |090470;
						STA.W r_entity_spriteID,X            ;0988C6|9D0004  |090400;
	
				sec_rts:
						SEC                                  ;0988C9|38      |      ;
						RTS                                  ;0988CA|60      |      ;
	
	
				clc_rts:
						CLC                                  ;0988CB|18      |      ;
						RTS                                  ;0988CC|60      |      ;
	
	
			CODE_0988CD:
						LDA.B #$73                           ;0988CD|A973    |      ;
						JSR.W setEntity_pos_06               ;0988CF|206687  |098766;
						LDA.B #$D0                           ;0988D2|A9D0    |      ;
						STA.W r_entity_XPos,Y                ;0988D4|993804  |090438;
						LDA.B #$B0                           ;0988D7|A9B0    |      ;
						STA.W r_entity_YPos,Y                ;0988D9|991C04  |09041C;
						JMP.W CODE_09885B                    ;0988DC|4C5B88  |09885B;
	
			bossDoupleGanger_grant_08:
						TYA                                  ;0988DF|98      |      ;
	
			setEntity__04:
						STA.B $00                            ;0988E0|8500    |000000;
						LDA.W r_entity_damageRelated,X       ;0988E2|BD6906  |090669;
						AND.B #$F0                           ;0988E5|29F0    |      ;
						BEQ CODE_098904                      ;0988E7|F01B    |098904;
						LDA.B r_stage                        ;0988E9|A532    |000032;
						CMP.B #$0E                           ;0988EB|C90E    |      ;
						BNE CODE_0988FA                      ;0988ED|D00B    |0988FA;
						LDA.W r_bossPieces       ;0988EF|ADEC07  |0907EC;
						CMP.B #$02                           ;0988F2|C902    |      ;
						BNE CODE_0988FA                      ;0988F4|D004    |0988FA;
						LDA.B #$47                           ;0988F6|A947    |      ;
						BNE DATA8_0988FC                     ;0988F8|D002    |0988FC;
	
			CODE_0988FA:
						LDA.B #$2B                           ;0988FA|A92B    |      ;
	
			DATA8_0988FC:
						db $20                               ;0988FC|        |      ;
						dw lunchMusic                        ;0988FD|        |0FE25F;
						JSR.W CODE_098922                    ;0988FF|202289  |098922;
						STA.B r_HUD_healthBoss               ;098902|853D    |00003D;
	
			CODE_098904:
						RTS                                  ;098904|60      |      ;
	
	
			setEntity__05:
						STA.B $00                            ;098905|8500    |000000;
						LDA.W r_entity_damageRelated,X       ;098907|BD6906  |090669;
						AND.B #$F0                           ;09890A|29F0    |      ;
						BEQ CODE_098921                      ;09890C|F013    |098921;
						LDA.B #$2B                           ;09890E|A92B    |      ;
						db $20                               ;098910|        |      ;
						dw lunchMusic                        ;098911|        |0FE25F;
						JSR.W CODE_098922                    ;098913|202289  |098922;
						LDA.B r_HUD_healthBoss               ;098916|A53D    |00003D;
						SEC                                  ;098918|38      |      ;
						SBC.B $00                            ;098919|E500    |000000;
						BCS CODE_09891F                      ;09891B|B002    |09891F;
						LDA.B #$00                           ;09891D|A900    |      ;
	
			CODE_09891F:
						STA.B r_HUD_healthBoss               ;09891F|853D    |00003D;
	
			CODE_098921:
						RTS                                  ;098921|60      |      ;
	
	
			CODE_098922:
						LDA.W r_entity_damageRelated,X       ;098922|BD6906  |090669;
						CLC                                  ;098925|18      |      ;
						ADC.B #$10                           ;098926|6910    |      ;
						LSR A                                ;098928|4A      |      ;
						LSR A                                ;098929|4A      |      ;
						AND.B #$F8                           ;09892A|29F8    |      ;
						CLC                                  ;09892C|18      |      ;
						ADC.B $00                            ;09892D|6500    |000000;
						TAY                                  ;09892F|A8      |      ;
						LDA.W weapDamage2Bosses,Y                   ;098930|B95389  |098953;
						STA.B $00                            ;098933|8500    |000000;
						LDA.W r_entity_Health,X              ;098935|BD7B06  |09067B;
						SEC                                  ;098938|38      |      ;
						SBC.B $00                            ;098939|E500    |000000;
						BCS CODE_09894F                      ;09893B|B012    |09894F;
						CLC                                  ;09893D|18      |      ;
						ADC.B $00                            ;09893E|6500    |000000;
						STA.B $00                            ;098940|8500    |000000;
						LDA.W r_entity_Health,X              ;098942|BD7B06  |09067B;
						BNE CODE_09894D                      ;098945|D006    |09894D;
						LDA.B #$00                           ;098947|A900    |      ;
						STA.B $00                            ;098949|8500    |000000;
						BEQ CODE_09894F                      ;09894B|F002    |09894F;
	
			CODE_09894D:
						LDA.B #$00                           ;09894D|A900    |      ;
	
			CODE_09894F:
						STA.W r_entity_Health,X              ;09894F|9D7B06  |09067B;
						RTS                                  ;098952|60      |      ;
	

	
			setEntity__0A:
						LDA.W r_entity_damageRelated,X       ;098231|BD6906  |090669;
						BEQ endSet__A_B                      ;098234|F0FA    |098230;
						LDA.B #$00                           ;098236|A900    |      ;
						STA.W r_entity_damageRelated,X       ;098238|9D6906  |090669;
						LDA.B #$28                           ;09823B|A928    |      ;
						jmp lunchMusic                        ;09823E|        |0FE25F;			
	
			setEntity__0B:
						LDA.B #$00                           ;098608|A900    |      ;
						STA.B $17                            ;09860A|8517    |000017;
						LDA.W r_entity_XPos                  ;09860C|AD3804  |090438;
						SEC                                  ;09860F|38      |      ;
						SBC.W r_entity_XPos,X                ;098610|FD3804  |090438;
						STA.B $00                            ;098613|8500    |000000;
						BCS CODE_098624                      ;098615|B00D    |098624;
						LDA.B #$01                           ;098617|A901    |      ;
						STA.B $17                            ;098619|8517    |000017;
						LDA.B $00                            ;09861B|A500    |000000;
						EOR.B #$FF                           ;09861D|49FF    |      ;
						CLC                                  ;09861F|18      |      ;
						ADC.B #$01                           ;098620|6901    |      ;
						STA.B $00                            ;098622|8500    |000000;
	
			CODE_098624:
						LDA.W r_entity_YPos                  ;098624|AD1C04  |09041C;
						SEC                                  ;098627|38      |      ;
						SBC.W r_entity_YPos,X                ;098628|FD1C04  |09041C;
						BCS CODE_098632                      ;09862B|B005    |098632;
						EOR.B #$FF                           ;09862D|49FF    |      ;
						CLC                                  ;09862F|18      |      ;
						ADC.B #$01                           ;098630|6901    |      ;
	
			CODE_098632:
						CMP.B #$28                           ;098632|C928    |      ;
						BCC endSet__A_B                      ;098634|900C    |098642;
						LDA.W r_entity_ID,X                  ;098636|BD4E05  |09054E;
						CMP.B #$01                           ;098639|C901    |      ;
						BNE endSet__A_B                      ;09863B|D005    |098642;
						LDA.W r_entity_FacingLeft,X          ;09863D|BDA804  |0904A8;
						STA.B $17                            ;098640|8517    |000017;
	
			endSet__A_B:
						RTS                                  ;098642|60      |      ;
	
	
			CODE_098643:
						LDA.B $17                            ;098643|A517    |000017;
						STA.W r_entity_FacingLeft,X          ;098645|9DA804  |0904A8;
						TAY                                  ;098648|A8      |      ;
						LDA.W DATA8_09864D,Y                 ;098649|B94D86  |09864D;
						RTS                                  ;09864C|60      |      ;	
			DATA8_09864D:
						db $04,$0C                           ;09864D|        |      ;


	setEnityAi_scriptIDX_01:
						STA.B $00                            ;09864F|8500    |000000;
						LDA.W r_entity_AI,X                  ;098651|BDEF05  |0905EF;
						AND.B #$80                           ;098654|2980    |      ;
						ORA.B $00                            ;098656|0500    |000000;
						STA.W r_entity_AI,X                  ;098658|9DEF05  |0905EF;
						LDA.B #$00                           ;09865B|A900    |      ;
						STA.W r_entity_AI_IDX,X              ;09865D|9DC105  |0905C1;
						RTS                                  ;098660|60      |      ;
	
	
			setEntity__09:
						STA.B $02                            ;098661|8502    |000002;
						TXA                                  ;098663|8A      |      ;
						PHA                                  ;098664|48      |      ;
						LDA.B #$00                           ;098665|A900    |      ;
						STA.B $01                            ;098667|8501    |000001;
						STA.B $03                            ;098669|8503    |000003;
						jsr CODE_0FE777                       ;09866C|        |0FE777;
						PLA                                  ;09866E|68      |      ;
						TAX                                  ;09866F|AA      |      ;
						RTS                                  ;098670|60      |      ;
	
	

	
	boss_INC_AI_IDX_2a:
						INC.W r_entity_AI_IDX,X              ;098707|FEC105  |0005C1;
	
			boss_RTS_21:
						RTS                                  ;09870A|60      |      ;



		
		
		
		bossPre__28__28:
						LDA.W r_entity_AI,X                  ;09898B|BDEF05  |0905EF;
						AND.B #$7F                           ;09898E|297F    |      ;
						CMP.B #$5C                           ;098990|C95C    |      ;
						BEQ CODE_0989C8                      ;098992|F034    |0989C8;
						LDA.B #$00                           ;098994|A900    |      ;
						STA.W r_entity_PaletteOverride,X     ;098996|9D5404  |090454;
						LDA.B #$40                           ;098999|A940    |      ;
						STA.W r_entity_mask,X                ;09899B|9D7004  |090470;
						LDA.W r_entity_YPos,X                ;09899E|BD1C04  |09041C;
						CLC                                  ;0989A1|18      |      ;
						ADC.B #$10                           ;0989A2|6910    |      ;
						STA.W r_entity_YPos,X                ;0989A4|9D1C04  |09041C;
						LDA.B #$0E                           ;0989A7|A90E    |      ;
						LDY.B #$08                           ;0989A9|A008    |      ;
						db $20                               ;0989AB|        |      ;
						dw setSpriteAndAnimGroup_AY                 ;0989AC|        |0FEF5C;
						LDA.B #$DC                           ;0989AE|A9DC    |      ;
						JMP.W setEnityAi_scriptIDX_01        ;0989B0|4C4F86  |09864F;
	
	
			bossPr1a__1a:
						LDA.W r_entity_AI,X                  ;0989B3|BDEF05  |0905EF;
						AND.B #$7F                           ;0989B6|297F    |      ;
						CMP.B #$30                           ;0989B8|C930    |      ;
						BEQ CODE_0989C8                      ;0989BA|F00C    |0989C8;
						LDA.B #$0E                           ;0989BC|A90E    |      ;
						LDY.B #$08                           ;0989BE|A008    |      ;
						db $20                               ;0989C0|        |      ;
						dw setSpriteAndAnimGroup_AY                 ;0989C1|        |0FEF5C;
						LDA.B #$30                           ;0989C3|A930    |      ;
						JMP.W setEnityAi_scriptIDX_01        ;0989C5|4C4F86  |09864F;
	
	
			CODE_0989C8:
						LDA.W r_entity_AI_IDX,X              ;0989C8|BDC105  |0905C1;
						CMP.B #$0D                           ;0989CB|C90D    |      ;
						BNE CODE_0989EE                      ;0989CD|D01F    |0989EE;
						LDA.B r_stage                        ;0989CF|A532    |000032;
						CMP.B #$0A                           ;0989D1|C90A    |      ;
						BEQ CODE_0989E3                      ;0989D3|F00E    |0989E3;
						CMP.B #$0B                           ;0989D5|C90B    |      ;
						BEQ CODE_0989E3                      ;0989D7|F00A    |0989E3;
						CMP.B #$03                           ;0989D9|C903    |      ;
						BNE CODE_0989EE                      ;0989DB|D011    |0989EE;
						LDA.B r_blockLevel                   ;0989DD|A533    |000033;
						CMP.B #$04                           ;0989DF|C904    |      ;
						BNE CODE_0989EE                      ;0989E1|D00B    |0989EE;
	
			CODE_0989E3:
						JMP.W clear_bossSlot_02             ;0989E3|4C3A87  |09873A;
	
						LDA.W r_entity_AI,X                  ;0989E6|BDEF05  |0905EF;
						AND.B #$80                           ;0989E9|2980    |      ;
						STA.W r_entity_AI,X                  ;0989EB|9DEF05  |0905EF;
	
			CODE_0989EE:
						RTS                                  ;0989EE|60      |      ;
	
	
			bossState__1d:
						LDA.W r_bossPieces       ;09920C|ADEC07  |0907EC;
						BNE CODE_099214                      ;09920F|D003    |099214;
						JSR.W CODE_0992FF                    ;099211|20FF92  |0992FF;
	
			CODE_099214:
						TXA                                  ;099214|8A      |      ;
						CMP.W r_bossPieces       ;099215|CDEC07  |0907EC;
						BEQ CODE_09921C                      ;099218|F002    |09921C;
						BCS CODE_09924A                      ;09921A|B02E    |09924A;
	
			CODE_09921C:
						STA.W r_bossPieces       ;09921C|8DEC07  |0907EC;
						LDY.B #$00                           ;09921F|A000    |      ;
						STY.W r_orb_statesGlobal             ;099221|8CED07  |0907ED;
						INY                                  ;099224|C8      |      ;
						STY.W $07F1                          ;099225|8CF107  |0907F1;
						LDY.W r_bossPieces       ;099228|ACEC07  |0907EC;
	
			CODE_09922B:
						LDA.W r_entity_ID,Y                  ;09922B|B94E05  |09054E;
						BEQ CODE_099244                      ;09922E|F014    |099244;
						LDA.W r_entity_AI,Y                  ;099230|B9EF05  |0905EF;
						AND.B #$7F                           ;099233|297F    |      ;
						CMP.B #$1F                           ;099235|C91F    |      ;
						BEQ CODE_099241                      ;099237|F008    |099241;
						CMP.B #$1E                           ;099239|C91E    |      ;
						BEQ CODE_099241                      ;09923B|F004    |099241;
						CMP.B #$1A                           ;09923D|C91A    |      ;
						BNE CODE_099244                      ;09923F|D003    |099244;
	
			CODE_099241:
						INC.W r_orb_statesGlobal             ;099241|EEED07  |0907ED;
	
			CODE_099244:
						INY                                  ;099244|C8      |      ;
						CPY.B #$0D                           ;099245|C00D    |      ;
						BNE CODE_09922B                      ;099247|D0E2    |09922B;
						TXA                                  ;099249|8A      |      ;
	
			CODE_09924A:
						SEC                                  ;09924A|38      |      ;
						SBC.B #$01                           ;09924B|E901    |      ;
						ASL A                                ;09924D|0A      |      ;
						STA.B $04                            ;09924E|8504    |000004;
						LDY.B #$02                           ;099250|A002    |      ;
						LDA.B ($02),Y                        ;099252|B102    |000002;
						ASL A                                ;099254|0A      |      ;
						TAY                                  ;099255|A8      |      ;
						LDA.W PTR16_099318,Y                 ;099256|B91893  |099318;
						STA.B $00                            ;099259|8500    |000000;
						LDA.W PTR16_099318+1,Y                 ;09925B|B91993  |099319;
						STA.B $01                            ;09925E|8501    |000001;
						LDY.B $04                            ;099260|A404    |000004;
						LDA.B ($00),Y                        ;099262|B100    |000000;
						STA.B $04                            ;099264|8504    |000004;
						INY                                  ;099266|C8      |      ;
						LDA.B ($00),Y                        ;099267|B100    |000000;
						STA.B $05                            ;099269|8505    |000005;
						LDY.B #$03                           ;09926B|A003    |      ;
						LDA.B ($02),Y                        ;09926D|B102    |000002;
						BEQ CODE_099283                      ;09926F|F012    |099283;
						LDY.W r_bossPieces       ;099271|ACEC07  |0907EC;
						LDA.W r_entity_XPos,Y                ;099274|B93804  |090438;
						CLC                                  ;099277|18      |      ;
						ADC.B $04                            ;099278|6504    |000004;
						STA.B $04                            ;09927A|8504    |000004;
						LDA.B #$B0                           ;09927C|A9B0    |      ;
						CLC                                  ;09927E|18      |      ;
						ADC.B $05                            ;09927F|6505    |000005;
						STA.B $05                            ;099281|8505    |000005;
	
			CODE_099283:
						LDA.W r_entity_XPos,X                ;099283|BD3804  |090438;
						SEC                                  ;099286|38      |      ;
						SBC.B $04                            ;099287|E504    |000004;
						BCS CODE_099290                      ;099289|B005    |099290;
						EOR.B #$FF                           ;09928B|49FF    |      ;
						CLC                                  ;09928D|18      |      ;
						ADC.B #$01                           ;09928E|6901    |      ;
	
			CODE_099290:
						CMP.B #$08                           ;099290|C908    |      ;
						BCS DATA8_0992C1                     ;099292|B02D    |0992C1;
						LDA.W r_entity_YPos,X                ;099294|BD1C04  |09041C;
						SEC                                  ;099297|38      |      ;
						SBC.B $05                            ;099298|E505    |000005;
						BCS CODE_0992A1                      ;09929A|B005    |0992A1;
						EOR.B #$FF                           ;09929C|49FF    |      ;
						CLC                                  ;09929E|18      |      ;
						ADC.B #$01                           ;09929F|6901    |      ;
	
			CODE_0992A1:
						CMP.B #$08                           ;0992A1|C908    |      ;
						BCS DATA8_0992C1                     ;0992A3|B01C    |0992C1;
						LDA.B $05                            ;0992A5|A505    |000005;
						STA.W r_entity_YPos,X                ;0992A7|9D1C04  |09041C;
						CPX.W r_bossPieces       ;0992AA|ECEC07  |0907EC;
						BEQ CODE_0992B4                      ;0992AD|F005    |0992B4;
						LDA.W $07F1                          ;0992AF|ADF107  |0907F1;
						BNE DATA8_0992BE                     ;0992B2|D00A    |0992BE;
	
			CODE_0992B4:
						DEC.W r_orb_statesGlobal             ;0992B4|CEED07  |0907ED;
						BEQ CODE_0992D0                      ;0992B7|F017    |0992D0;
						LDA.B #$00                           ;0992B9|A900    |      ;
						STA.W $07F1                          ;0992BB|8DF107  |0907F1;
	
			DATA8_0992BE:
						db $4C                               ;0992BE|        |      ;
	
						dw setMovmentSpdZero                 ;0992BF|        |0FFEC8;
	
			DATA8_0992C1:
						db $20                               ;0992C1|        |      ;
						dw pushCurBankGo6                    ;0992C2|        |0FFF30;
						LDA.B $00                            ;0992C4|A500    |000000;
						LSR A                                ;0992C6|4A      |      ;
						AND.B #$0F                           ;0992C7|290F    |      ;
						STA.W r_Player_StateDoubled,X        ;0992C9|9D6505  |090565;
						INC.W r_entity_AI_IDX,X              ;0992CC|FEC105  |0905C1;
						RTS                                  ;0992CF|60      |      ;
	
	
			CODE_0992D0:
						LDY.B #$01                           ;0992D0|A001    |      ;
						LDA.B ($02),Y                        ;0992D2|B102    |000002;
						STA.B $00                            ;0992D4|8500    |000000;
						LDY.W r_bossPieces       ;0992D6|ACEC07  |0907EC;
	
			CODE_0992D9:
						LDA.W r_entity_ID,Y                  ;0992D9|B94E05  |09054E;
						BEQ CODE_0992F4                      ;0992DC|F016    |0992F4;
						LDA.W r_entity_AI,X                  ;0992DE|BDEF05  |0905EF;
						AND.B #$7F                           ;0992E1|297F    |      ;
						CMP.B #$1F                           ;0992E3|C91F    |      ;
						BEQ CODE_0992EF                      ;0992E5|F008    |0992EF;
						CMP.B #$1E                           ;0992E7|C91E    |      ;
						BEQ CODE_0992EF                      ;0992E9|F004    |0992EF;
						CMP.B #$1A                           ;0992EB|C91A    |      ;
						BNE CODE_0992F4                      ;0992ED|D005    |0992F4;
	
			CODE_0992EF:
						LDA.B $00                            ;0992EF|A500    |000000;
						STA.W r_entity_AI_IDX,Y              ;0992F1|99C105  |0905C1;
	
			CODE_0992F4:
						INY                                  ;0992F4|C8      |      ;
						CPY.B #$0D                           ;0992F5|C00D    |      ;
						BNE CODE_0992D9                      ;0992F7|D0E0    |0992D9;
						LDA.B #$02                           ;0992F9|A902    |      ;
						STA.W $07EE                          ;0992FB|8DEE07  |0907EE;
						RTS                                  ;0992FE|60      |      ;
	
	
			CODE_0992FF:
						LDY.B #$01                           ;0992FF|A001    |      ;
	
			CODE_099301:
						LDA.W r_entity_ID,Y                  ;099301|B94E05  |09054E;
						BEQ CODE_09930F                      ;099304|F009    |09930F;
						LDA.W r_entity_AI,Y                  ;099306|B9EF05  |0905EF;
						AND.B #$7F                           ;099309|297F    |      ;
						CMP.B #$48                           ;09930B|C948    |      ;
						BNE CODE_099314                      ;09930D|D005    |099314;
	
			CODE_09930F:
						INY                                  ;09930F|C8      |      ;
						CPY.B #$0D                           ;099310|C00D    |      ;
						BNE CODE_099301                      ;099312|D0ED    |099301;
	
			CODE_099314:
						STY.W r_bossPieces       ;099314|8CEC07  |0907EC;
						RTS                                  ;099317|60      |      ;
	
			PTR16_099318:
						dw DATA8_09931C                      ;099318|        |09931C;
						dw DATA8_099334                      ;09931A|        |099334;
	
			DATA8_09931C: 
						db $60,$50,$70,$60,$70,$50,$70,$40   ;09931C|        |      ;	
						db $80,$80,$80,$60,$80,$50,$80,$40   ;099324|        |      ;
						db $80,$30,$00,$00,$00,$00,$00,$00   ;09932C|        |      ;
	
			DATA8_099334: 
						db $00,$00,$00,$00,$00,$00,$00,$00   ;099334|        |      ;
						db $00,$E0,$00,$F0,$00,$E0,$00,$F0   ;09933C|        |      ;
						db $00,$E0,$00,$F0,$00,$E0,$00,$F0   ;099344|        |      ;
			
			bossState__1e:
						LDY.B #$03                           ;09934C|A003    |      ;
						STY.W $07EE                          ;09934E|8CEE07  |0907EE;
						DEY                                  ;099351|88      |      ;
						TXA                                  ;099352|8A      |      ;
						CMP.W r_bossPieces       ;099353|CDEC07  |0907EC;
						BNE CODE_099359                      ;099356|D001    |099359;
						DEY                                  ;099358|88      |      ;
	
			CODE_099359:
						LDA.W r_entity_AI,X                  ;099359|BDEF05  |0905EF;
						AND.B #$80                           ;09935C|2980    |      ;
						ORA.B ($02),Y                        ;09935E|1102    |000002;
						STA.W r_entity_AI,X                  ;099360|9DEF05  |0905EF;
						LDA.B #$00                           ;099363|A900    |      ;
						STA.W r_entity_AI_IDX,X              ;099365|9DC105  |0905C1;
						RTS                                  ;099368|60      |      ;
	
	
			bossState__1f:
						INC.W r_entity_AI_IDX,X              ;099369|FEC105  |0905C1;
						LDY.W r_bossPieces       ;09936C|ACEC07  |0907EC;
						BEQ CODE_0993B7                      ;09936F|F046    |0993B7;
						LDA.W r_entity_ID,Y                  ;099371|B94E05  |09054E;
						BNE CODE_09937B                      ;099374|D005    |09937B;
						LDA.B #$03                           ;099376|A903    |      ;
						STA.W $07EE                          ;099378|8DEE07  |0907EE;
	
			CODE_09937B:
						LDA.W $07EE                          ;09937B|ADEE07  |0907EE;
						BEQ CODE_0993B4                      ;09937E|F034    |0993B4;
	
			CODE_099380:
						INY                                  ;099380|C8      |      ;
						LDA.W r_entity_AI,Y                  ;099381|B9EF05  |0905EF;
						AND.B #$7F                           ;099384|297F    |      ;
						CMP.B #$1B                           ;099386|C91B    |      ;
						BNE CODE_099380                      ;099388|D0F6    |099380;
						LDA.W r_entity_ID,Y                  ;09938A|B94E05  |09054E;
						BEQ CODE_099380                      ;09938D|F0F1    |099380;
						STX.B $00                            ;09938F|8600    |000000;
						TYA                                  ;099391|98      |      ;
						CMP.B $00                            ;099392|C500    |000000;
						BNE CODE_0993A3                      ;099394|D00D    |0993A3;
						LDY.W r_bossPieces       ;099396|ACEC07  |0907EC;
						LDA.W r_Player_StateDoubled,Y        ;099399|B96505  |090565;
						STA.W r_Player_StateDoubled,X        ;09939C|9D6505  |090565;
						STA.W r_orb_statesGlobal             ;09939F|8DED07  |0907ED;
						RTS                                  ;0993A2|60      |      ;
	
	
			CODE_0993A3:
						LDA.W r_orb_statesGlobal             ;0993A3|ADED07  |0907ED;
						STA.B $00                            ;0993A6|8500    |000000;
						LDA.W r_Player_StateDoubled,X        ;0993A8|BD6505  |090565;
						STA.W r_orb_statesGlobal             ;0993AB|8DED07  |0907ED;
						LDA.B $00                            ;0993AE|A500    |000000;
						STA.W r_Player_StateDoubled,X        ;0993B0|9D6505  |090565;
						RTS                                  ;0993B3|60      |      ;
	
	
			CODE_0993B4:
						JMP.W bossState__1c                  ;0993B4|4C6995  |099569;
	
	
			CODE_0993B7:
						JMP.W bossState__04                  ;0993B7|4C6095  |099560;
	
	
			bossState__16: db $20                               ;0993BA|        |      ;
						dw setMovmentSpdZero                 ;0993BB|        |0FFEC8;
						INC.W r_entity_AI_IDX,X              ;0993BD|FEC105  |0905C1;
						LDY.B #$01                           ;0993C0|A001    |      ;
						LDA.B ($02),Y                        ;0993C2|B102    |000002;
						STA.B $00                            ;0993C4|8500    |000000;
						LDA.W r_Player_StateDoubled,X        ;0993C6|BD6505  |090565;
						AND.B #$04                           ;0993C9|2904    |      ;
						BEQ CODE_0993E7                      ;0993CB|F01A    |0993E7;
						LDA.W r_Player_StateDoubled,X        ;0993CD|BD6505  |090565;
						AND.B #$08                           ;0993D0|2908    |      ;
						BEQ CODE_0993DD                      ;0993D2|F009    |0993DD;
						LDA.B $00                            ;0993D4|A500    |000000;
						EOR.B #$FF                           ;0993D6|49FF    |      ;
						CLC                                  ;0993D8|18      |      ;
						ADC.B #$01                           ;0993D9|6901    |      ;
						STA.B $00                            ;0993DB|8500    |000000;
	
			CODE_0993DD: LDA.W r_entity_XPos,X                ;0993DD|BD3804  |090438;
						CLC                                  ;0993E0|18      |      ;
						ADC.B $00                            ;0993E1|6500    |000000;
						STA.W r_entity_XPos,X                ;0993E3|9D3804  |090438;
						RTS                                  ;0993E6|60      |      ;
	
	
			CODE_0993E7: LDA.W r_Player_StateDoubled,X        ;0993E7|BD6505  |090565;
						AND.B #$08                           ;0993EA|2908    |      ;
						BNE CODE_0993F7                      ;0993EC|D009    |0993F7;
						LDA.B $00                            ;0993EE|A500    |000000;
						EOR.B #$FF                           ;0993F0|49FF    |      ;
						CLC                                  ;0993F2|18      |      ;
						ADC.B #$01                           ;0993F3|6901    |      ;
						STA.B $00                            ;0993F5|8500    |000000;
	
			CODE_0993F7: LDA.W r_entity_YPos,X                ;0993F7|BD1C04  |09041C;
						CLC                                  ;0993FA|18      |      ;
						ADC.B $00                            ;0993FB|6500    |000000;
						STA.W r_entity_YPos,X                ;0993FD|9D1C04  |09041C;
						RTS                                  ;099400|60      |      ;
	
	
			bossState__17: 
						LDY.B #$0A                           ;099401|A00A    |      ;
						lda spriteAnimIndex,Y 
						STA.B $00                            ;099406|8500    |000000;
						lda spriteAnimIndex+1,Y                  ;099409|        |0FEFB5;
						STA.B $01                            ;09940B|8501    |000001;
						LDA.W r_entity_Counter,X             ;09940D|BD3306  |090633;
						ASL A                                ;099410|0A      |      ;
						CLC                                  ;099411|18      |      ;
						ADC.W r_entity_Counter,X             ;099412|7D3306  |090633;
						CLC                                  ;099415|18      |      ;
						ADC.B $00                            ;099416|6500    |000000;
						STA.B $00                            ;099418|8500    |000000;
						LDA.B $01                            ;09941A|A501    |000001;
						ADC.B #$00                           ;09941C|6900    |      ;
						STA.B $01                            ;09941E|8501    |000001;
						INC.W r_entity_AI_IDX,X              ;099420|FEC105  |0905C1;
						LDY.B #$01                           ;099423|A001    |      ;
						LDA.B ($02),Y                        ;099425|B102    |000002;
						DEY                                  ;099427|88      |      ;
						ASL A                                ;099428|0A      |      ;
						CLC                                  ;099429|18      |      ;
						ADC.B ($00),Y                        ;09942A|7100    |000000;
						STA.W r_entity_spriteID,X            ;09942C|9D0004  |090400;
						LDA.W r_entity_mask,X                ;09942F|BD7004  |090470;
						AND.B #$40                           ;099432|2940    |      ;
						ORA.B #$20                           ;099434|0920    |      ;
						STA.W r_entity_mask,X                ;099436|9D7004  |090470;
						LDY.B #$02                           ;099439|A002    |      ;
						LDA.B ($02),Y                        ;09943B|B102    |000002;
						STA.W r_entity_extra,X               ;09943D|9DD805  |0905D8;
						RTS                                  ;099440|60      |      ;
	
	
			bossState__14: INC.W r_entity_AI_IDX,X              ;099441|FEC105  |0905C1;
						LDY.W r_misc_movementState,X         ;099444|BC4506  |090645;
						LDA.B #$0A                           ;099447|A90A    |      ;
						db $4C                               ;099449|        |      ;
	
						dw setSpriteAndAnimGroup_AY                 ;09944A|        |0FEF5C;
	
			bossState__15: LDY.B #$01                           ;09944C|A001    |      ;
						LDA.B ($02),Y                        ;09944E|B102    |000002;
						ORA.B #$80                           ;099450|0980    |      ;
						STA.W r_entity_AI,X                  ;099452|9DEF05  |0905EF;
						LDA.B #$00                           ;099455|A900    |      ;
						STA.W r_entity_AI_IDX,X              ;099457|9DC105  |0905C1;
						RTS                                  ;09945A|60      |      ;
	
	
			bossState__13: INC.W r_entity_AI_IDX,X              ;09945B|FEC105  |0905C1;
						LDA.W r_Player_StateDoubled,X        ;09945E|BD6505  |090565;
						CLC                                  ;099461|18      |      ;
						ADC.B #$08                           ;099462|6908    |      ;
						AND.B #$0F                           ;099464|290F    |      ;
						STA.W r_Player_StateDoubled,X        ;099466|9D6505  |090565;
						AND.B #$08                           ;099469|2908    |      ;
						BEQ CODE_09946F                      ;09946B|F002    |09946F;
						LDA.B #$01                           ;09946D|A901    |      ;
	
			CODE_09946F: STA.W r_entity_FacingLeft,X          ;09946F|9DA804  |0904A8;
						RTS                                  ;099472|60      |      ;
	
	
			bossState__11: INC.W r_entity_AI_IDX,X              ;099473|FEC105  |0905C1;
						JSR.W CODE_0994DE                    ;099476|20DE94  |0994DE;
						BCC CODE_099481                      ;099479|9006    |099481;
						LDA.W $044C,Y                        ;09947B|B94C04  |09044C;
						JMP.W CODE_099484                    ;09947E|4C8494  |099484;
	
	
			CODE_099481: LDA.W r_entity_XPos                  ;099481|AD3804  |090438;
	
			CODE_099484: STA.B $00                            ;099484|8500    |000000;
						LDA.W r_entity_FacingLeft,X          ;099486|BDA804  |0904A8;
						BEQ CODE_09948F                      ;099489|F004    |09948F;
						LDA.B #$FC                           ;09948B|A9FC    |      ;
						BNE CODE_099491                      ;09948D|D002    |099491;
	
			CODE_09948F: LDA.B #$04                           ;09948F|A904    |      ;
	
			CODE_099491: CLC                                  ;099491|18      |      ;
						ADC.B $00                            ;099492|6500    |000000;
						STA.W r_entity_XPos,X                ;099494|9D3804  |090438;
						LDA.B #$30                           ;099497|A930    |      ;
						STA.W r_entity_YPos,X                ;099499|9D1C04  |09041C;
						RTS                                  ;09949C|60      |      ;
	
	
			bossState__12: JSR.W CODE_0994DE                    ;09949D|20DE94  |0994DE;
						BCC CODE_0994C0                      ;0994A0|901E    |0994C0;
						LDA.B #$70                           ;0994A2|A970    |      ;
						STA.W r_entity_YPos,X                ;0994A4|9D1C04  |09041C;
						INC.W r_entity_AI_IDX,X              ;0994A7|FEC105  |0905C1;
						LDY.B #$01                           ;0994AA|A001    |      ;
						LDA.B ($02),Y                        ;0994AC|B102    |000002;
						STA.W r_entity_extra,X               ;0994AE|9DD805  |0905D8;
						LDA.W r_entity_mask,X                ;0994B1|BD7004  |090470;
						AND.B #$77                           ;0994B4|2977    |      ;
						STA.W r_entity_mask,X                ;0994B6|9D7004  |090470;
						LDA.B #$0A                           ;0994B9|A90A    |      ;
						LDY.B #$0C                           ;0994BB|A00C    |      ;
						db $4C                               ;0994BD|        |      ;
	
						dw setSpriteAndAnimGroup_AY                 ;0994BE|        |0FEF5C;
	
			CODE_0994C0: LDA.B #$01                           ;0994C0|A901    |      ;
						STA.W r_entity_AI_IDX,X              ;0994C2|9DC105  |0905C1;
						LDA.W r_entity_mask,X                ;0994C5|BD7004  |090470;
						AND.B #$77                           ;0994C8|2977    |      ;
						STA.W r_entity_mask,X                ;0994CA|9D7004  |090470;
						LDA.B #$10                           ;0994CD|A910    |      ;
						STA.W r_entity_extra,X               ;0994CF|9DD805  |0905D8;
						LDA.B #$91                           ;0994D2|A991    |      ;
						STA.W r_entity_AI,X                  ;0994D4|9DEF05  |0905EF;
						LDA.B #$0A                           ;0994D7|A90A    |      ;
						LDY.B #$0B                           ;0994D9|A00B    |      ;
						db $4C                               ;0994DB|        |      ;
	
						dw setSpriteAndAnimGroup_AY                 ;0994DC|        |0FEF5C;
	
			CODE_0994DE: LDY.B #$02                           ;0994DE|A002    |      ;
	
			CODE_0994E0: LDA.W r_player_subWeID_01,Y          ;0994E0|B96205  |090562;
						CMP.B #$03                           ;0994E3|C903    |      ;
						BEQ CODE_0994F2                      ;0994E5|F00B    |0994F2;
						CMP.B #$08                           ;0994E7|C908    |      ;
						BEQ CODE_0994F2                      ;0994E9|F007    |0994F2;
						DEY                                  ;0994EB|88      |      ;
						CPY.B #$FF                           ;0994EC|C0FF    |      ;
						BNE CODE_0994E0                      ;0994EE|D0F0    |0994E0;
						CLC                                  ;0994F0|18      |      ;
						RTS                                  ;0994F1|60      |      ;
	
	
			CODE_0994F2: SEC                                  ;0994F2|38      |      ;
						RTS                                  ;0994F3|60      |      ;
	
	
			bossState__10: LDA.B #$FF                           ;0994F4|A9FF    |      ;
						SEC                                  ;0994F6|38      |      ;
						SBC.W r_entity_XPos,X                ;0994F7|FD3804  |090438;
						STA.B $01                            ;0994FA|8501    |000001;
						LDA.B #$00                           ;0994FC|A900    |      ;
						ASL.B $01                            ;0994FE|0601    |000001;
						ROL A                                ;099500|2A      |      ;
						STA.W r_entity_Xspd,X                ;099501|9DF204  |0904F2;
						LDA.B $01                            ;099504|A501    |000001;
						STA.W r_entity_XsubSpd,X             ;099506|9D0905  |090509;
						INC.W r_entity_AI_IDX,X              ;099509|FEC105  |0905C1;
						LDA.B #$00                           ;09950C|A900    |      ;
						STA.W r_entity_FacingLeft,X          ;09950E|9DA804  |0904A8;
						LDA.B #$04                           ;099511|A904    |      ;
						STA.W r_Player_StateDoubled,X        ;099513|9D6505  |090565;
						RTS                                  ;099516|60      |      ;
	
	
			bossState__0c: LDA.W r_entity_spriteGroup,X         ;099517|BD8C04  |09048C;
						LDY.W r_entity_AnimGroup,X           ;09951A|BCAA05  |0905AA;
						INY                                  ;09951D|C8      |      ;
						db $20                               ;09951E|        |      ;
						dw setSpriteAndAnimGroup_AY                 ;09951F|        |0FEF5C;
						INC.W r_entity_AI_IDX,X              ;099521|FEC105  |0905C1;
						LDY.B #$01                           ;099524|A001    |      ;
						LDA.B ($02),Y                        ;099526|B102    |000002;
						STA.B $00                            ;099528|8500    |000000;
						BEQ CODE_09953A                      ;09952A|F00E    |09953A;
						LDA.W r_entity_FacingLeft,X          ;09952C|BDA804  |0904A8;
						BEQ CODE_09953D                      ;09952F|F00C    |09953D;
						LDA.W r_entity_XPos,X                ;099531|BD3804  |090438;
						SEC                                  ;099534|38      |      ;
						SBC.B $00                            ;099535|E500    |000000;
						STA.W r_entity_XPos,X                ;099537|9D3804  |090438;
	
			CODE_09953A: JMP.W CODE_099546                    ;09953A|4C4695  |099546;
	
	
			CODE_09953D: LDA.W r_entity_XPos,X                ;09953D|BD3804  |090438;
						CLC                                  ;099540|18      |      ;
						ADC.B $00                            ;099541|6500    |000000;
						STA.W r_entity_XPos,X                ;099543|9D3804  |090438;
	
			CODE_099546: LDY.B #$02                           ;099546|A002    |      ;
						LDA.B ($02),Y                        ;099548|B102    |000002;
						CLC                                  ;09954A|18      |      ;
						ADC.W r_entity_YPos,X                ;09954B|7D1C04  |09041C;
						STA.W r_entity_YPos,X                ;09954E|9D1C04  |09041C;
						RTS                                  ;099551|60      |      ;
 
	
			bossState__0b:
						db $20                               ;099552|        |      ;
						dw setMovmentSpdZero                 ;099553|        |0FFEC8;
	
			bossState__0d:
						INC.W r_entity_AI_IDX,X              ;099555|FEC105  |0905C1;
						LDY.B #$01                           ;099558|A001    |      ;
						LDA.B ($02),Y                        ;09955A|B102    |000002;
						STA.W r_entity_extra,X               ;09955C|9DD805  |0905D8;
						RTS                                  ;09955F|60      |      ;
	
	
			bossState__04:
						LDA.B #$00                           ;099560|A900    |      ;
						STA.W r_entity_AI,X                  ;099562|9DEF05  |0905EF;
						STA.W r_entity_AI_IDX,X              ;099565|9DC105  |0905C1;
						RTS                                  ;099568|60      |      ;
	
	
			bossState__1c:
						LDA.W r_entity_AI,X                  ;099569|BDEF05  |0905EF;
						AND.B #$80                           ;09956C|2980    |      ;
						STA.W r_entity_AI,X                  ;09956E|9DEF05  |0905EF;
	
			bossState__03:
						LDA.B #$00                           ;099571|A900    |      ;
						STA.W r_entity_AI_IDX,X              ;099573|9DC105  |0905C1;
						RTS                                  ;099576|60      |      ;
	
	
			bossState__0f:
						LDA.W r_Player_StateDoubled,X        ;099577|BD6505  |090565;
						CLC                                  ;09957A|18      |      ;
						ADC.B #$08                           ;09957B|6908    |      ;
						AND.B #$0F                           ;09957D|290F    |      ;
						STA.B $05                            ;09957F|8505    |000005;
						JMP.W CODE_099589                    ;099581|4C8995  |099589;
	
	
			bossState__00:
						LDA.W r_Player_StateDoubled,X        ;099584|BD6505  |090565;
						STA.B $05                            ;099587|8505    |000005;
	
			CODE_099589:
						INC.W r_entity_AI_IDX,X              ;099589|FEC105  |0905C1;
						db $20                               ;09958C|        |      ;
						dw setMovmentSpdZero                 ;09958D|        |0FFEC8;
						LDY.B #$01                           ;09958F|A001    |      ;
						LDA.B ($02),Y                        ;099591|B102    |000002;
						STA.B $00                            ;099593|8500    |000000;
						INY                                  ;099595|C8      |      ;
						LDA.B ($02),Y                        ;099596|B102    |000002;
						STA.B $01                            ;099598|8501    |000001;
						INY                                  ;09959A|C8      |      ;
						LDA.B ($02),Y                        ;09959B|B102    |000002;
						STA.W r_entity_extra,X               ;09959D|9DD805  |0905D8;
						LDA.B $05                            ;0995A0|A505    |000005;
						AND.B #$07                           ;0995A2|2907    |      ;
						BEQ CODE_0995BA                      ;0995A4|F014    |0995BA;
						LDA.B $05                            ;0995A6|A505    |000005;
						AND.B #$08                           ;0995A8|2908    |      ;
						BEQ CODE_0995AF                      ;0995AA|F003    |0995AF;
						JSR.W CODE_0995CE                    ;0995AC|20CE95  |0995CE;
	
			CODE_0995AF:
						LDA.B $00                            ;0995AF|A500    |000000;
						STA.W r_entity_Xspd,X                ;0995B1|9DF204  |0904F2;
						LDA.B $01                            ;0995B4|A501    |000001;
						STA.W r_entity_XsubSpd,X             ;0995B6|9D0905  |090509;
						RTS                                  ;0995B9|60      |      ;
	
	
			CODE_0995BA:
						LDA.B $05                            ;0995BA|A505    |000005;
						AND.B #$08                           ;0995BC|2908    |      ;
						BNE CODE_0995C3                      ;0995BE|D003    |0995C3;
						JSR.W CODE_0995CE                    ;0995C0|20CE95  |0995CE;
	
			CODE_0995C3:
						LDA.B $00                            ;0995C3|A500    |000000;
						STA.W r_entity_Yspd,X                ;0995C5|9D2005  |090520;
						LDA.B $01                            ;0995C8|A501    |000001;
						STA.W r_entity_YsubSpd,X             ;0995CA|9D3705  |090537;
						RTS                                  ;0995CD|60      |      ;
	
	
			CODE_0995CE:
						LDA.B $01                            ;0995CE|A501    |000001;
						EOR.B #$FF                           ;0995D0|49FF    |      ;
						CLC                                  ;0995D2|18      |      ;
						ADC.B #$01                           ;0995D3|6901    |      ;
						STA.B $01                            ;0995D5|8501    |000001;
						LDA.B $00                            ;0995D7|A500    |000000;
						EOR.B #$FF                           ;0995D9|49FF    |      ;
						ADC.B #$00                           ;0995DB|6900    |      ;
						STA.B $00                            ;0995DD|8500    |000000;
						RTS                                  ;0995DF|60      |      ;
	
	
			bossState__0e:
						LDY.B #$03                           ;0995E0|A003    |      ;
						LDA.B ($02),Y                        ;0995E2|B102    |000002;
						CMP.B #$FF                           ;0995E4|C9FF    |      ;
						BEQ CODE_099608                      ;0995E6|F020    |099608;
						ASL A                                ;0995E8|0A      |      ;
						TAY                                  ;0995E9|A8      |      ;
						LDA.W DATA16_0996DB,Y                ;0995EA|B9DB96  |0996DB;
						STA.B $00                            ;0995ED|8500    |000000;
						LDA.W DATA16_0996DB+1,Y                ;0995EF|B9DC96  |0996DC;
						STA.B $01                            ;0995F2|8501    |000001;
						LDA.W r_Player_StateDoubled,X        ;0995F4|BD6505  |090565;
						AND.B #$08                           ;0995F7|2908    |      ;
						BEQ CODE_0995FE                      ;0995F9|F003    |0995FE;
						JSR.W CODE_0995CE                    ;0995FB|20CE95  |0995CE;
	
			CODE_0995FE:
						LDA.B $00                            ;0995FE|A500    |000000;
						STA.W r_entity_Xspd,X                ;099600|9DF204  |0904F2;
						LDA.B $01                            ;099603|A501    |000001;
						STA.W r_entity_XsubSpd,X             ;099605|9D0905  |090509;
	
			CODE_099608:
						LDY.B #$01                           ;099608|A001    |      ;
						LDA.B ($02),Y                        ;09960A|B102    |000002;
						STA.W r_entity_YsubSpd,X             ;09960C|9D3705  |090537;
						INY                                  ;09960F|C8      |      ;
						LDA.B ($02),Y                        ;099610|B102    |000002;
						STA.W r_entity_Yspd,X                ;099612|9D2005  |090520;
						INC.W r_entity_AI_IDX,X              ;099615|FEC105  |0905C1;
						RTS                                  ;099618|60      |      ;
	
	
			bossState__01:
						LDY.B #$02                           ;099619|A002    |      ;
						LDA.B ($02),Y                        ;09961B|B102    |000002;
						ASL A                                ;09961D|0A      |      ;
						TAY                                  ;09961E|A8      |      ;
						LDA.W DATA16_0996DB,Y                ;09961F|B9DB96  |0996DB;
						STA.B $00                            ;099622|8500    |000000;
						LDA.W DATA16_0996DB+1,Y                ;099624|B9DC96  |0996DC;
						STA.B $01                            ;099627|8501    |000001;
						LDA.W r_Player_StateDoubled,X        ;099629|BD6505  |090565;
						AND.B #$08                           ;09962C|2908    |      ;
						BEQ CODE_099633                      ;09962E|F003    |099633;
						JSR.W CODE_0995CE                    ;099630|20CE95  |0995CE;
	
			CODE_099633:
						LDA.B $00                            ;099633|A500    |000000;
						STA.W r_entity_Xspd,X                ;099635|9DF204  |0904F2;
						LDA.B $01                            ;099638|A501    |000001;
						STA.W r_entity_XsubSpd,X             ;09963A|9D0905  |090509;
						LDY.B #$01                           ;09963D|A001    |      ;
						LDA.B ($02),Y                        ;09963F|B102    |000002;
						ASL A                                ;099641|0A      |      ;
						TAY                                  ;099642|A8      |      ;
						LDA.W DATA16_0996D3,Y                ;099643|B9D396  |0996D3;
						STA.W r_entity_YsubSpd,X             ;099646|9D3705  |090537;
						LDA.W DATA16_0996D3+1,Y                ;099649|B9D496  |0996D4;
						STA.W r_entity_Yspd,X                ;09964C|9D2005  |090520;
						INC.W r_entity_AI_IDX,X              ;09964F|FEC105  |0905C1;
						RTS                                  ;099652|60      |      ;
	
	
	bossState_ySpdScript_02:
						LDY.B #$03                           ;099653|A003    |      ;
						LDA.B ($02),Y                        ;099655|B102    |000002;
						STA.B $00                            ;099657|8500    |000000;
						LDA.W r_entity_YsubSpd,X             ;099659|BD3705  |090537;
						CLC                                  ;09965C|18      |      ;
						ADC.B $00                            ;09965D|6500    |000000;
						STA.W r_entity_YsubSpd,X             ;09965F|9D3705  |090537;
						LDA.W r_entity_Yspd,X                ;099662|BD2005  |090520;
						ADC.B #$00                           ;099665|6900    |      ;
						STA.W r_entity_Yspd,X                ;099667|9D2005  |090520;
						LDA.W r_entity_Yspd,X                ;09966A|BD2005  |090520;
						BMI CODE_0996D2                      ;09966D|3063    |0996D2;
						LDY.B #$00                           ;09966F|A000    |      ;
						LDA.B ($02),Y                        ;099671|B102    |000002;
						CMP.B #$44                           ;099673|C944    |      ;
						BEQ CODE_099699                      ;099675|F022    |099699;
						CMP.B #$02                           ;099677|C902    |      ;
						BNE CODE_0996A5                      ;099679|D02A    |0996A5;
						LDY.B #$10                           ;09967B|A010    |      ;
						LDA.W r_entity_ID,X                  ;09967D|BD4E05  |09054E;
						CMP.B #$01                           ;099680|C901    |      ;
						BNE CODE_099686                      ;099682|D002    |099686;
						LDY.B #$18                           ;099684|A018    |      ;
	
			CODE_099686:
						LDA.W r_entity_FacingLeft,X          ;099686|BDA804  |0904A8;
						BEQ CODE_09968F                      ;099689|F004    |09968F;
						LDA.B #$FC                           ;09968B|A9FC    |      ;
						BNE DATA8_099691                     ;09968D|D002    |099691;
	
			CODE_09968F:
						LDA.B #$04                           ;09968F|A904    |      ;
	
			DATA8_099691:
						db $20                               ;099691|        |      ;
						dw getCollusionBasedOnOffset         ;099692|        |0FFC1E;
						BEQ CODE_0996A5                      ;099694|F00F    |0996A5;
						JMP.W CODE_0996E3                    ;099696|4CE396  |0996E3;
	
	
			CODE_099699:
						INC.W r_entity_AI_IDX,X              ;099699|FEC105  |0905C1;
						LDA.B #$00                           ;09969C|A900    |      ;
						STA.W r_entity_Yspd,X                ;09969E|9D2005  |090520;
						STA.W r_entity_YsubSpd,X             ;0996A1|9D3705  |090537;
						RTS                                  ;0996A4|60      |      ;
	
	
			CODE_0996A5:
						LDY.B #$01                           ;0996A5|A001    |      ;
						LDA.B ($02),Y                        ;0996A7|B102    |000002;
						ASL A                                ;0996A9|0A      |      ;
						TAY                                  ;0996AA|A8      |      ;
						LDA.W DATA16_0996D3,Y                ;0996AB|B9D396  |0996D3;
						STA.B $01                            ;0996AE|8501    |000001;
						LDA.W DATA16_0996D3+1,Y                ;0996B0|B9D496  |0996D4;
						STA.B $00                            ;0996B3|8500    |000000;
						JSR.W CODE_0995CE                    ;0996B5|20CE95  |0995CE;
						LDA.W r_entity_Yspd,X                ;0996B8|BD2005  |090520;
						CMP.B $00                            ;0996BB|C500    |000000;
						BCS CODE_0996C8                      ;0996BD|B009    |0996C8;
						BNE CODE_0996D2                      ;0996BF|D011    |0996D2;
						LDA.W r_entity_YsubSpd,X             ;0996C1|BD3705  |090537;
						CMP.B $01                            ;0996C4|C501    |000001;
						BCS CODE_0996D2                      ;0996C6|B00A    |0996D2;
	
			CODE_0996C8:
						LDA.B $00                            ;0996C8|A500    |000000;
						STA.W r_entity_Yspd,X                ;0996CA|9D2005  |090520;
						LDA.B $01                            ;0996CD|A501    |000001;
						STA.W r_entity_YsubSpd,X             ;0996CF|9D3705  |090537;
	
			CODE_0996D2:
						RTS                                  ;0996D2|60      |      ;
	
	
			DATA16_0996D3:
						dw $FC00,$FE00                       ;0996D3|        |      ;
						dw $FD00,$F800                       ;0996D7|        |      ;
	
			DATA16_0996DB:
						dw $8000,$4000                       ;0996DB|        |      ;
						dw $E000,$0000                       ;0996DF|        |      ;
	
			CODE_0996E3:
						INC.W r_entity_AI_IDX,X              ;0996E3|FEC105  |0905C1;
						LDA.B #$00                           ;0996E6|A900    |      ;
						STA.W r_entity_Yspd,X                ;0996E8|9D2005  |090520;
						STA.W r_entity_YsubSpd,X             ;0996EB|9D3705  |090537;
						LDA.W r_entity_ID,X                  ;0996EE|BD4E05  |09054E;
						CMP.B #$01                           ;0996F1|C901    |      ;
						BEQ CODE_0996FE                      ;0996F3|F009    |0996FE;
						LDA.W r_entity_YPos,X                ;0996F5|BD1C04  |09041C;
						AND.B #$F0                           ;0996F8|29F0    |      ;
						STA.W r_entity_YPos,X                ;0996FA|9D1C04  |09041C;
						RTS                                  ;0996FD|60      |      ;
	
	
			CODE_0996FE:
						LDA.W r_entity_YPos,X                ;0996FE|BD1C04  |09041C;
						AND.B #$F8                           ;099701|29F8    |      ;
						STA.W r_entity_YPos,X                ;099703|9D1C04  |09041C;
						RTS                                  ;099706|60      |      ;
	
	
			bossState__05:
						DEC.W r_entity_extra,X               ;099707|DED805  |0905D8;
						BNE CODE_09970F                      ;09970A|D003    |09970F;
						INC.W r_entity_AI_IDX,X              ;09970C|FEC105  |0905C1;
	
			CODE_09970F:
						RTS                                  ;09970F|60      |      ;
	
	
			bossState__06:
						LDA.W r_Player_StateDoubled,X        ;099710|BD6505  |090565;
						CLC                                  ;099713|18      |      ;
						ADC.B #$04                           ;099714|6904    |      ;
						AND.B #$0F                           ;099716|290F    |      ;
						STA.W r_Player_StateDoubled,X        ;099718|9D6505  |090565;
						INC.W r_entity_AI_IDX,X              ;09971B|FEC105  |0905C1;
						RTS                                  ;09971E|60      |      ;
	
	
			bossState__1b:
						DEC.W r_entity_extra,X               ;09971F|DED805  |0905D8;
						BEQ CODE_099727                      ;099722|F003    |099727;
						JMP.W bossState__07                  ;099724|4C7997  |099779;
	
	
			CODE_099727:
						INC.W r_entity_AI_IDX,X              ;099727|FEC105  |0905C1;
						RTS                                  ;09972A|60      |      ;
	
	
			bossState__0a:
						LDA.W r_misc_movementState,X         ;09972B|BD4506  |090645;
						CMP.B #$10                           ;09972E|C910    |      ;
						BCC CODE_099774                      ;099730|9042    |099774;
						JSR.W CODE_099753                    ;099732|205397  |099753;
						LDA.W r_misc_movementState,X         ;099735|BD4506  |090645;
						CMP.B #$10                           ;099738|C910    |      ;
						BCS CODE_099749                      ;09973A|B00D    |099749;
						LDA.W r_entity_Xspd,X                ;09973C|BDF204  |0904F2;
						BMI CODE_099749                      ;09973F|3008    |099749;
						INC.W r_entity_AI_IDX,X              ;099741|FEC105  |0905C1;
						LDA.B #$00                           ;099744|A900    |      ;
						STA.W r_misc_movementState,X         ;099746|9D4506  |090645;
	
			CODE_099749:
						RTS                                  ;099749|60      |      ;
	
	
			bossState__09:
						LDA.W r_misc_movementState,X         ;09974A|BD4506  |090645;
						AND.B #$7F                           ;09974D|297F    |      ;
						CMP.B #$10                           ;09974F|C910    |      ;
						BCC CODE_099774                      ;099751|9021    |099774;
	
			CODE_099753:
						LDA.W r_entity_Counter,X             ;099753|BD3306  |090633;
						BNE bossState__07                    ;099756|D021    |099779;
						LDA.W r_entity_XsubSpd,X             ;099758|BD0905  |090509;
						EOR.B #$FF                           ;09975B|49FF    |      ;
						CLC                                  ;09975D|18      |      ;
						ADC.B #$01                           ;09975E|6901    |      ;
						STA.W r_entity_XsubSpd,X             ;099760|9D0905  |090509;
						LDA.W r_entity_Xspd,X                ;099763|BDF204  |0904F2;
						EOR.B #$FF                           ;099766|49FF    |      ;
						ADC.B #$00                           ;099768|6900    |      ;
						STA.W r_entity_Xspd,X                ;09976A|9DF204  |0904F2;
						LDA.B #$01                           ;09976D|A901    |      ;
						STA.W r_entity_Counter,X             ;09976F|9D3306  |090633;
						BNE bossState__07                    ;099772|D005    |099779;
	
			CODE_099774:
						LDA.B #$00                           ;099774|A900    |      ;
						STA.W r_entity_Counter,X             ;099776|9D3306  |090633;
	
			bossState__07:
						LDA.B #$00                           ;099779|A900    |      ;
						STA.B $00                            ;09977B|8500    |000000;
						JSR.W CODE_0997D6                    ;09977D|20D697  |0997D6;
						STA.B $01                            ;099780|8501    |000001;
						LDY.B #$01                           ;099782|A001    |      ;
						LDA.B ($02),Y                        ;099784|B102    |000002;
						CLC                                  ;099786|18      |      ;
						ADC.W r_misc_movementState,X         ;099787|7D4506  |090645;
						STA.W r_misc_movementState,X         ;09978A|9D4506  |090645;
						JSR.W CODE_0997D6                    ;09978D|20D697  |0997D6;
						SEC                                  ;099790|38      |      ;
						SBC.B $01                            ;099791|E501    |000001;
						STA.B $01                            ;099793|8501    |000001;
						BCS CODE_0997A4                      ;099795|B00D    |0997A4;
						LDA.B $01                            ;099797|A501    |000001;
						EOR.B #$FF                           ;099799|49FF    |      ;
						CLC                                  ;09979B|18      |      ;
						ADC.B #$01                           ;09979C|6901    |      ;
						STA.B $01                            ;09979E|8501    |000001;
						LDA.B #$FF                           ;0997A0|A9FF    |      ;
						STA.B $00                            ;0997A2|8500    |000000;
	
			CODE_0997A4:
						LDY.B #$02                           ;0997A4|A002    |      ;
						LDA.B ($02),Y                        ;0997A6|B102    |000002;
						STA.B $02                            ;0997A8|8502    |000002;
						BEQ CODE_0997B2                      ;0997AA|F006    |0997B2;
	
			CODE_0997AC:
						LSR.B $01                            ;0997AC|4601    |000001;
						DEC.B $02                            ;0997AE|C602    |000002;
						BNE CODE_0997AC                      ;0997B0|D0FA    |0997AC;
	
			CODE_0997B2:
						LDA.W r_misc_movementState,X         ;0997B2|BD4506  |090645;
						AND.B #$80                           ;0997B5|2980    |      ;
						BEQ CODE_0997BF                      ;0997B7|F006    |0997BF;
						LDA.B $00                            ;0997B9|A500    |000000;
						EOR.B #$FF                           ;0997BB|49FF    |      ;
						STA.B $00                            ;0997BD|8500    |000000;
	
			CODE_0997BF:
						LDA.B $00                            ;0997BF|A500    |000000;
						BEQ CODE_0997CC                      ;0997C1|F009    |0997CC;
						LDA.B $01                            ;0997C3|A501    |000001;
						EOR.B #$FF                           ;0997C5|49FF    |      ;
						CLC                                  ;0997C7|18      |      ;
						ADC.B #$01                           ;0997C8|6901    |      ;
						STA.B $01                            ;0997CA|8501    |000001;
	
			CODE_0997CC:
						LDA.W r_entity_YPos,X                ;0997CC|BD1C04  |09041C;
						CLC                                  ;0997CF|18      |      ;
						ADC.B $01                            ;0997D0|6501    |000001;
						STA.W r_entity_YPos,X                ;0997D2|9D1C04  |09041C;
						RTS                                  ;0997D5|60      |      ;
	
	
			CODE_0997D6:
						LDA.W r_misc_movementState,X         ;0997D6|BD4506  |090645;
						AND.B #$3F                           ;0997D9|293F    |      ;
						STA.B r_pointerQueue                 ;0997DB|8508    |000008;
						LDA.W r_misc_movementState,X         ;0997DD|BD4506  |090645;
						AND.B #$40                           ;0997E0|2940    |      ;
						BEQ CODE_0997EB                      ;0997E2|F007    |0997EB;
						LDA.B #$3F                           ;0997E4|A93F    |      ;
						SEC                                  ;0997E6|38      |      ;
						SBC.B r_pointerQueue                 ;0997E7|E508    |000008;
						STA.B r_pointerQueue                 ;0997E9|8508    |000008;
	
			CODE_0997EB:
						LDY.B r_pointerQueue                 ;0997EB|A408    |000008;
						LDA.W DATA8_0997F1,Y                 ;0997ED|B9F197  |0997F1;
						RTS                                  ;0997F0|60      |      ;
	
	
			DATA8_0997F1:									;0997F1|        |  
						db $00,$06,$0D,$13,$19,$1F,$25,$2C,$32,$38,$3E,$44,$4A,$50,$56,$5C,$62,$67,$6D,$73      
						db $78,$7E,$83,$88,$8E,$93,$98,$9D,$A2,$A7,$AB,$B0,$B4,$B9,$BD,$C1,$C5,$C9,$CD,$D0
						db $D4,$D7,$DB,$DE,$E1,$E4,$E7,$E9,$EC,$EE,$F0,$F2,$F4,$F6,$F7,$F9,$FA,$FB,$FC,$FD
						db $FE,$FE,$FF,$FF
	
			bossState__08:
						LDY.B #$02                           ;099831|A002    |      ;
						LDA.B ($02),Y                        ;099833|B102    |000002;
						STA.W r_entity_extra,X               ;099835|9DD805  |0905D8;
						DEY                                  ;099838|88      |      ;
						LDA.B ($02),Y                        ;099839|B102    |000002;
						ASL A                                ;09983B|0A      |      ;
						ASL A                                ;09983C|0A      |      ;
						STA.B r_pointerQueue                 ;09983D|8508    |000008;
						INC.W r_entity_AI_IDX,X              ;09983F|FEC105  |0905C1;
						LDY.W r_Player_StateDoubled,X        ;099842|BC6505  |090565;
						TYA                                  ;099845|98      |      ;
						PHA                                  ;099846|48      |      ;
						LDA.W DATA8_099893,Y                 ;099847|B99398  |099893;
						PHA                                  ;09984A|48      |      ;
						ASL A                                ;09984B|0A      |      ;
						TAY                                  ;09984C|A8      |      ;
						LDA.W PTR16_0998A3,Y                 ;09984D|B9A398  |0998A3;
						STA.B $00                            ;099850|8500    |000000;
						LDA.W PTR16_0998A3+1,Y                 ;099852|B9A498  |0998A4;
						STA.B $01                            ;099855|8501    |000001;
						LDY.B r_pointerQueue                 ;099857|A408    |000008;
						JSR.W CODE_099866                    ;099859|206698  |099866;
						PLA                                  ;09985C|68      |      ;
						BPL CODE_099862                      ;09985D|1003    |099862;
						JSR.W CODE_09987A                    ;09985F|207A98  |09987A;
	
			CODE_099862:
						PLA                                  ;099862|68      |      ;
						JMP.W CODE_099991                    ;099863|4C9199  |099991;
	
	
			CODE_099866:
						LDA.B ($00),Y                        ;099866|B100    |000000;
						STA.B r_pointerQueue                 ;099868|8508    |000008;
						INY                                  ;09986A|C8      |      ;
						LDA.B ($00),Y                        ;09986B|B100    |000000;
						STA.B $09                            ;09986D|8509    |000009;
						INY                                  ;09986F|C8      |      ;
						LDA.B ($00),Y                        ;099870|B100    |000000;
						STA.B r_temp_Xpos                    ;099872|850A    |00000A;
						INY                                  ;099874|C8      |      ;
						LDA.B ($00),Y                        ;099875|B100    |000000;
						STA.B $0B                            ;099877|850B    |00000B;
						RTS                                  ;099879|60      |      ;
	
	
			CODE_09987A:
						LDA.B r_pointerQueue                 ;09987A|A508    |000008;
						LDY.B r_temp_Xpos                    ;09987C|A40A    |00000A;
						STY.B r_pointerQueue                 ;09987E|8408    |000008;
						STA.B r_temp_Xpos                    ;099880|850A    |00000A;
						LDA.B $09                            ;099882|A509    |000009;
						LDY.B $0B                            ;099884|A40B    |00000B;
						STY.B $09                            ;099886|8409    |000009;
						STA.B $0B                            ;099888|850B    |00000B;
						RTS                                  ;09988A|60      |      ;
	
	
			DATA8_09988B:
						db $01,$00,$00,$01                   ;09988B|        |      ;
	
			DATA8_09988F:
						db $00,$00,$01,$01                   ;09988F|        |      ;
	
			DATA8_099893:
						db $00,$01,$02,$81                   ;099893|        |      ;
						db $80,$81,$02,$01                   ;099897|        |      ;
						db $00,$01,$02,$81                   ;09989B|        |      ;
						db $80,$81,$02,$01                   ;09989F|        |      ;
	
			PTR16_0998A3: 
						dw DATA8_0998A9                      ;0998A3|        |0998A9;
						dw DATA8_0998D1                      ;0998A5|        |0998D1;
						dw DATA8_0998F9                      ;0998A7|        |0998F9;
	
			DATA8_0998A9: 
						db $00,$00,$00,$00,$00,$00,$00,$20   ;0998A9|        |      ;
						db $00,$00,$00,$40,$00,$00,$00,$60   ;0998B1|        |      ;
						db $00,$00,$00,$80,$00,$00,$00,$A0   ;0998B9|        |      ;
						db $00,$00,$00,$C0,$00,$00,$00,$E0   ;0998C1|        |      ;
						db $00,$00,$01,$80,$00,$00,$02,$00   ;0998C9|        |      ;
	
			DATA8_0998D1: 
						db $00,$00,$00,$00,$00,$0C,$00,$1E   ;0998D1|        |      ;
						db $00,$18,$00,$3B,$00,$25,$00,$59   ;0998D9|        |      ;
						db $00,$31,$00,$76,$00,$3D,$00,$94   ;0998E1|        |      ;
						db $00,$49,$00,$B1,$00,$56,$00,$CF   ;0998E9|        |      ;
						db $00,$93,$01,$63,$00,$C3,$01,$D9   ;0998F1|        |      ;
	
			DATA8_0998F9: 
						db $00,$00,$00,$00,$00,$17,$00,$17   ;0998F9|        |      ;
						db $00,$2D,$00,$2D,$00,$44,$00,$44   ;099901|        |      ;
						db $00,$5B,$00,$5B,$00,$71,$00,$71   ;099909|        |      ;
						db $00,$88,$00,$88,$00,$9E,$00,$9E   ;099911|        |      ;
						db $01,$10,$01,$10,$01,$6A,$01,$6A   ;099919|        |      ;
	
			bossState__24:
						LDA.B #$00                           ;099921|A900    |      ;
						STA.B $00                            ;099923|8500    |000000;
						LDY.W r_miscTicker                   ;099925|AC1E06  |09061E;
						LDA.W DATA8_099940,Y                 ;099928|B94099  |099940;
						STA.W r_entity_extra,X               ;09992B|9DD805  |0905D8;
						LDA.W DATA8_09994D,Y                 ;09992E|B94D99  |09994D;
						STA.B $05                            ;099931|8505    |000005;
						LDA.B $00                            ;099933|A500    |000000;
						BEQ CODE_099967                      ;099935|F030    |099967;
						ASL.W r_entity_extra,X               ;099937|1ED805  |0905D8;
						ASL.W r_entity_extra,X               ;09993A|1ED805  |0905D8;
						JMP.W CODE_099967                    ;09993D|4C6799  |099967;
	
	
			DATA8_099940:
						db $05,$05,$05,$05                   ;099940|        |      ;
						db $06,$06,$06,$07                   ;099944|        |      ;
						db $07,$07,$08,$08                   ;099948|        |      ;
						db $08                               ;09994C|        |      ;
	
			DATA8_09994D:
						db $07,$07,$07,$07                   ;09994D|        |      ;
						db $06,$06,$06,$05                   ;099951|        |      ;
						db $05,$05,$04,$04                   ;099955|        |      ;
						db $04                               ;099959|        |      ;
	
			bossState__22:
						LDY.B #$02                           ;09995A|A002    |      ;
						LDA.B ($02),Y                        ;09995C|B102    |000002;
						STA.W r_entity_extra,X               ;09995E|9DD805  |0905D8;
	
			bossState__42:
						LDY.B #$01                           ;099961|A001    |      ;
						LDA.B ($02),Y                        ;099963|B102    |000002;
						STA.B $05                            ;099965|8505    |000005;
	
			CODE_099967:
						INC.W r_entity_AI_IDX,X              ;099967|FEC105  |0905C1;
						LDY.W r_Player_StateDoubled,X        ;09996A|BC6505  |090565;
	
			deathSkull_routine:
						TYA                                  ;09996D|98      |      ;
						PHA                                  ;09996E|48      |      ;
						LDA.W DATA8_0999CD,Y                 ;09996F|B9CD99  |0999CD;
						STA.B $04                            ;099972|8504    |000004;
						ASL A                                ;099974|0A      |      ;
						TAY                                  ;099975|A8      |      ;
						LDA.W PTR16_0999ED,Y                 ;099976|B9ED99  |0999ED;
						STA.B $00                            ;099979|8500    |000000;
						LDA.W PTR16_0999ED+1,Y                 ;09997B|B9EE99  |0999EE;
						STA.B $01                            ;09997E|8501    |000001;
						LDA.B $05                            ;099980|A505    |000005;
						ASL A                                ;099982|0A      |      ;
						ASL A                                ;099983|0A      |      ;
						TAY                                  ;099984|A8      |      ;
						JSR.W CODE_099866                    ;099985|206698  |099866;
						LDA.B $04                            ;099988|A504    |000004;
						BPL CODE_09998F                      ;09998A|1003    |09998F;
						JSR.W CODE_09987A                    ;09998C|207A98  |09987A;
	
			CODE_09998F:
						PLA                                  ;09998F|68      |      ;
						LSR A                                ;099990|4A      |      ;
	
			CODE_099991:
						LSR A                                ;099991|4A      |      ;
						LSR A                                ;099992|4A      |      ;
						TAY                                  ;099993|A8      |      ;
						LDA.W DATA8_09988B,Y                 ;099994|B98B98  |09988B;
						BEQ CODE_0999A6                      ;099997|F00D    |0999A6;
						SEC                                  ;099999|38      |      ;
						LDA.B #$00                           ;09999A|A900    |      ;
						SBC.B $0B                            ;09999C|E50B    |00000B;
						STA.B $0B                            ;09999E|850B    |00000B;
						LDA.B #$00                           ;0999A0|A900    |      ;
						SBC.B r_temp_Xpos                    ;0999A2|E50A    |00000A;
						STA.B r_temp_Xpos                    ;0999A4|850A    |00000A;
	
			CODE_0999A6:
						LDA.W DATA8_09988F,Y                 ;0999A6|B98F98  |09988F;
						BEQ CODE_0999B8                      ;0999A9|F00D    |0999B8;
						SEC                                  ;0999AB|38      |      ;
						LDA.B #$00                           ;0999AC|A900    |      ;
						SBC.B $09                            ;0999AE|E509    |000009;
						STA.B $09                            ;0999B0|8509    |000009;
						LDA.B #$00                           ;0999B2|A900    |      ;
						SBC.B r_pointerQueue                 ;0999B4|E508    |000008;
						STA.B r_pointerQueue                 ;0999B6|8508    |000008;
	
			CODE_0999B8:
						LDA.B r_pointerQueue                 ;0999B8|A508    |000008;
						STA.W r_entity_Xspd,X                ;0999BA|9DF204  |0904F2;
						LDA.B $09                            ;0999BD|A509    |000009;
						STA.W r_entity_XsubSpd,X             ;0999BF|9D0905  |090509;
						LDA.B r_temp_Xpos                    ;0999C2|A50A    |00000A;
						STA.W r_entity_Yspd,X                ;0999C4|9D2005  |090520;
						LDA.B $0B                            ;0999C7|A50B    |00000B;
						STA.W r_entity_YsubSpd,X             ;0999C9|9D3705  |090537;
						RTS                                  ;0999CC|60      |      ;
	
	
			DATA8_0999CD:
						db $00,$01,$02,$03                   ;0999CD|        |      ;
						db $04,$83,$82,$81                   ;0999D1|        |      ;
						db $80,$81,$82,$83                   ;0999D5|        |      ;
						db $04,$03,$02,$01                   ;0999D9|        |      ;
						db $00,$01,$02,$03                   ;0999DD|        |      ;
						db $04,$83,$82,$81                   ;0999E1|        |      ;
						db $80,$81,$82,$83                   ;0999E5|        |      ;
						db $04,$03,$02,$01                   ;0999E9|        |      ;
	

				PTR16_0999ED: 		
						dw DATA8_0999F7                      ;0999ED|        |0999F7;
						dw DATA8_099A27                      ;0999EF|        |099A27;
						dw DATA8_099A57                      ;0999F1|        |099A57;
						dw DATA8_099A87                      ;0999F3|        |099A87;
						dw DATA8_099AB7                      ;0999F5|        |099AB7;
	
			DATA8_0999F7: 
						db $00,$00,$00,$00,$00,$00,$00,$40   ;0999F7|        |      ;
						db $00,$00,$00,$80,$00,$00,$00,$C0   ;0999FF|        |      ;
						db $00,$00,$01,$00,$00,$00,$01,$40   ;099A07|        |      ;
						db $00,$00,$01,$80,$00,$00,$01,$C0   ;099A0F|        |      ;
						db $00,$00,$04,$00,$00,$00,$02,$00   ;099A17|        |      ;
						db $00,$00,$02,$80,$00,$00,$03,$00   ;099A1F|        |      ;
	
			DATA8_099A27: 
						db $00,$00,$00,$00,$00,$0C,$00,$3F   ;099A27|        |      ;
						db $00,$19,$00,$7E,$00,$25,$00,$BC   ;099A2F|        |      ;
						db $00,$32,$00,$FB,$00,$3E,$01,$3A   ;099A37|        |      ;
						db $00,$4B,$01,$79,$00,$57,$01,$B7   ;099A3F|        |      ;
						db $00,$C7,$03,$EC,$00,$63,$01,$F6   ;099A47|        |      ;
						db $00,$7C,$02,$73,$00,$95,$02,$F1   ;099A4F|        |      ;
	
			DATA8_099A57: 
						db $00,$00,$00,$00,$00,$18,$00,$3B   ;099A57|        |      ;
						db $00,$31,$00,$76,$00,$49,$00,$B1   ;099A5F|        |      ;
						db $00,$62,$00,$ED,$00,$7A,$01,$28   ;099A67|        |      ;
						db $00,$93,$01,$63,$00,$AB,$01,$9E   ;099A6F|        |      ;
						db $01,$87,$03,$B2,$00,$C3,$01,$D9   ;099A77|        |      ;
						db $00,$F4,$02,$4F,$01,$25,$02,$C5   ;099A7F|        |      ;
	
			DATA8_099A87: 
						db $00,$00,$00,$00,$00,$24,$00,$35   ;099A87|        |      ;
						db $00,$47,$00,$6A,$00,$6B,$00,$A0   ;099A8F|        |      ;
						db $00,$8E,$00,$D5,$00,$B2,$01,$0A   ;099A97|        |      ;
						db $00,$D5,$01,$3F,$00,$F9,$01,$74   ;099A9F|        |      ;
						db $02,$38,$03,$53,$01,$1C,$01,$A9   ;099AA7|        |      ;
						db $01,$63,$02,$14,$01,$AA,$02,$7E   ;099AAF|        |      ;
	
			DATA8_099AB7: 
						db $00,$00,$00,$00,$00,$2D,$00,$2D   ;099AB7|        |      ;
						db $00,$5B,$00,$5B,$00,$88,$00,$88   ;099ABF|        |      ;
						db $00,$B5,$00,$B5,$00,$E2,$00,$E2   ;099AC7|        |      ;
						db $01,$10,$01,$10,$01,$3D,$01,$3D   ;099ACF|        |      ;
						db $02,$D4,$02,$D4,$01,$6A,$01,$6A   ;099AD7|        |      ;
						db $01,$C4,$01,$C4,$02,$1F,$02,$1F   ;099ADF|        |      ;
						

			bossState__43:
						LDY.B #$02                           ;099AF6|A002    |      ;
						STY.B $17                            ;099AF8|8417    |000017;
						INY                                  ;099AFA|C8      |      ;
						LDA.B ($02),Y                        ;099AFB|B102    |000002;
						JMP.W CODE_099B08                    ;099AFD|4C089B  |099B08;
	
	
			bossState__19:
						LDA.B #$01                           ;099B00|A901    |      ;
						STA.B $17                            ;099B02|8517    |000017;
						LDA.B r_RNG                          ;099B04|A51F    |00001F;
						AND.B #$07                           ;099B06|2907    |      ;
	
			CODE_099B08:
						STA.B $00                            ;099B08|8500    |000000;
						LDA.W r_entity_Counter,X             ;099B0A|BD3306  |090633;
						AND.B #$80                           ;099B0D|2980    |      ;
						BEQ CODE_099B14                      ;099B0F|F003    |099B14;
						JMP.W CODE_099BC7                    ;099B11|4CC79B  |099BC7;
	
	
			CODE_099B14:
						LDA.W r_entity_Counter,X             ;099B14|BD3306  |090633;
						ORA.B #$80                           ;099B17|0980    |      ;
						STA.W r_entity_Counter,X             ;099B19|9D3306  |090633;
						LDA.B $00                            ;099B1C|A500    |000000;
						ASL A                                ;099B1E|0A      |      ;
						TAY                                  ;099B1F|A8      |      ;
						LDA.W DATA8_099BD0,Y                 ;099B20|B9D09B  |099BD0;
						STA.B $04                            ;099B23|8504    |000004;
						LDA.W DATA8_099BD1,Y                 ;099B25|B9D19B  |099BD1;
						STA.B $05                            ;099B28|8505    |000005;
	
			DATA8_099B2A:
						db $20                               ;099B2A|        |      ;
						dw pushCurBankGo6                    ;099B2B|        |0FFF30;
						LDY.B #$02                           ;099B2D|A002    |      ;
						LDA.B ($02),Y                        ;099B2F|B102    |000002;
						BNE CODE_099B36                      ;099B31|D003    |099B36;
						JMP.W CODE_099B7B                    ;099B33|4C7B9B  |099B7B;
	
	
			CODE_099B36:
						LDA.B $00                            ;099B36|A500    |000000;
						AND.B #$1F                           ;099B38|291F    |      ;
						ORA.B #$80                           ;099B3A|0980    |      ;
						STA.W r_entity_Counter,X             ;099B3C|9D3306  |090633;
	
			CODE_099B3F:
						LDA.W r_entity_Counter,X             ;099B3F|BD3306  |090633;
						AND.B #$7F                           ;099B42|297F    |      ;
						SEC                                  ;099B44|38      |      ;
						SBC.W r_Player_StateDoubled,X        ;099B45|FD6505  |090565;
						BEQ CODE_099BB3                      ;099B48|F069    |099BB3;
						BPL CODE_099B68                      ;099B4A|101C    |099B68;
						EOR.B #$FF                           ;099B4C|49FF    |      ;
						CLC                                  ;099B4E|18      |      ;
						ADC.B #$01                           ;099B4F|6901    |      ;
						CMP.B #$03                           ;099B51|C903    |      ;
						BCC CODE_099BB3                      ;099B53|905E    |099BB3;
						CMP.B #$10                           ;099B55|C910    |      ;
						BCS CODE_099B70                      ;099B57|B017    |099B70;
	
			CODE_099B59:
						LDA.W r_Player_StateDoubled,X        ;099B59|BD6505  |090565;
						SEC                                  ;099B5C|38      |      ;
						SBC.B $17                            ;099B5D|E517    |000017;
						AND.B #$1F                           ;099B5F|291F    |      ;
	
			CODE_099B61:
						STA.W r_Player_StateDoubled,X        ;099B61|9D6505  |090565;
						INC.W r_entity_AI_IDX,X              ;099B64|FEC105  |0905C1;
						RTS                                  ;099B67|60      |      ;
	
	
			CODE_099B68:
						CMP.B #$03                           ;099B68|C903    |      ;
						BCC CODE_099BB3                      ;099B6A|9047    |099BB3;
						CMP.B #$10                           ;099B6C|C910    |      ;
						BCS CODE_099B59                      ;099B6E|B0E9    |099B59;
	
			CODE_099B70:
						LDA.W r_Player_StateDoubled,X        ;099B70|BD6505  |090565;
						CLC                                  ;099B73|18      |      ;
						ADC.B $17                            ;099B74|6517    |000017;
						AND.B #$1F                           ;099B76|291F    |      ;
						JMP.W CODE_099B61                    ;099B78|4C619B  |099B61;
	
	
			CODE_099B7B:
						LDA.B $00                            ;099B7B|A500    |000000;
						LSR A                                ;099B7D|4A      |      ;
						AND.B #$0F                           ;099B7E|290F    |      ;
						ORA.B #$80                           ;099B80|0980    |      ;
						STA.W r_entity_Counter,X             ;099B82|9D3306  |090633;
	
			CODE_099B85:
						LDA.W r_entity_Counter,X             ;099B85|BD3306  |090633;
						AND.B #$7F                           ;099B88|297F    |      ;
						SEC                                  ;099B8A|38      |      ;
						SBC.W r_Player_StateDoubled,X        ;099B8B|FD6505  |090565;
						BEQ CODE_099BB3                      ;099B8E|F023    |099BB3;
						BPL CODE_099BA5                      ;099B90|1013    |099BA5;
						EOR.B #$FF                           ;099B92|49FF    |      ;
						CLC                                  ;099B94|18      |      ;
						ADC.B #$01                           ;099B95|6901    |      ;
						CMP.B #$08                           ;099B97|C908    |      ;
						BCS CODE_099BA9                      ;099B99|B00E    |099BA9;
	
			CODE_099B9B:
						LDY.W r_Player_StateDoubled,X        ;099B9B|BC6505  |090565;
						DEY                                  ;099B9E|88      |      ;
						TYA                                  ;099B9F|98      |      ;
						AND.B #$0F                           ;099BA0|290F    |      ;
						JMP.W CODE_099B61                    ;099BA2|4C619B  |099B61;
	
	
			CODE_099BA5:
						CMP.B #$08                           ;099BA5|C908    |      ;
						BCS CODE_099B9B                      ;099BA7|B0F2    |099B9B;
	
			CODE_099BA9:
						LDY.W r_Player_StateDoubled,X        ;099BA9|BC6505  |090565;
						INY                                  ;099BAC|C8      |      ;
						TYA                                  ;099BAD|98      |      ;
						AND.B #$0F                           ;099BAE|290F    |      ;
						JMP.W CODE_099B61                    ;099BB0|4C619B  |099B61;
	
	
			CODE_099BB3:
						LDY.B #$01                           ;099BB3|A001    |      ;
						LDA.B ($02),Y                        ;099BB5|B102    |000002;
						CLC                                  ;099BB7|18      |      ;
						ADC.W r_entity_AI_IDX,X              ;099BB8|7DC105  |0905C1;
						STA.W r_entity_AI_IDX,X              ;099BBB|9DC105  |0905C1;
						LDA.W r_entity_Counter,X             ;099BBE|BD3306  |090633;
						AND.B #$7F                           ;099BC1|297F    |      ;
						STA.W r_entity_Counter,X             ;099BC3|9D3306  |090633;
						RTS                                  ;099BC6|60      |      ;
	
	
			CODE_099BC7:
						LDY.B #$02                           ;099BC7|A002    |      ;
						LDA.B ($02),Y                        ;099BC9|B102    |000002;
						BEQ CODE_099B85                      ;099BCB|F0B8    |099B85;
						JMP.W CODE_099B3F                    ;099BCD|4C3F9B  |099B3F;
	
	
			DATA8_099BD0:
						db $40                               ;099BD0|        |      ;
	
			DATA8_099BD1:
						db $50,$70,$50,$A0                   ;099BD1|        |      ;
						db $50,$D0,$50,$40                   ;099BD5|        |      ;
						db $70,$70,$70,$A0                   ;099BD9|        |      ;
						db $70,$D0,$70,$80                   ;099BDD|        |      ;
						db $A0,$80,$50                       ;099BE1|        |      ;
	
			bossState__1a:
						LDA.B #$02                           ;099BE4|A902    |      ;
						STA.B $17                            ;099BE6|8517    |000017;
						LDA.W r_entity_Counter,X             ;099BE8|BD3306  |090633;
						AND.B #$80                           ;099BEB|2980    |      ;
						BNE CODE_099BC7                      ;099BED|D0D8    |099BC7;
						LDA.W r_entity_Counter,X             ;099BEF|BD3306  |090633;
						ORA.B #$80                           ;099BF2|0980    |      ;
						STA.W r_entity_Counter,X             ;099BF4|9D3306  |090633;
						LDA.W r_entity_XPos                  ;099BF7|AD3804  |090438;
						STA.B $04                            ;099BFA|8504    |000004;
						LDA.W r_entity_YPos                  ;099BFC|AD1C04  |09041C;
						STA.B $05                            ;099BFF|8505    |000005;
						JMP.W DATA8_099B2A                   ;099C01|4C2A9B  |099B2A;
	
	
			bossState__49:
						LDY.B #$01                           ;099C04|A001    |      ;
						LDA.B ($02),Y                        ;099C06|B102    |000002;
						CLC                                  ;099C08|18      |      ;
						ADC.W r_entity_YsubSpd,X             ;099C09|7D3705  |090537;
						STA.W r_entity_YsubSpd,X             ;099C0C|9D3705  |090537;
						LDA.B #$00                           ;099C0F|A900    |      ;
						ADC.W r_entity_Yspd,X                ;099C11|7D2005  |090520;
						STA.W r_entity_Yspd,X                ;099C14|9D2005  |090520;
						RTS                                  ;099C17|60      |      ;
	
	
			bossState__4a:
						LDA.B #$18                           ;099C18|A918    |      ;
						STA.W r_entity_AI,X                  ;099C1A|9DEF05  |0905EF;
						LDA.B #$00                           ;099C1D|A900    |      ;
						STA.W r_entity_AI_IDX,X              ;099C1F|9DC105  |0905C1;
						STA.W r_entity_damage,X              ;099C22|9D5706  |090657;
						STA.W r_entity_mask,X                ;099C25|9D7004  |090470;
						STA.W r_entity_spriteID,X            ;099C28|9D0004  |090400;
						RTS                                  ;099C2B|60      |      ;
	
	
			bossState__46:
						INC.W r_entity_AI_IDX,X              ;099C2C|FEC105  |0905C1;
						LDY.B #$03                           ;099C2F|A003    |      ;
						LDA.B ($02),Y                        ;099C31|B102    |000002;
						CMP.B #$FF                           ;099C33|C9FF    |      ;
						BEQ CODE_099C3A                      ;099C35|F003    |099C3A;
						STA.W r_entity_FacingLeft,X          ;099C37|9DA804  |0904A8;
	
			CODE_099C3A:
						LDY.B #$01                           ;099C3A|A001    |      ;
						LDA.B ($02),Y                        ;099C3C|B102    |000002;
						CMP.B #$FF                           ;099C3E|C9FF    |      ;
						BEQ INC_entitySpriteID                     ;099C40|F015    |099C57;
						CMP.B #$FE                           ;099C42|C9FE    |      ;
						BEQ DEC_entitySpriteID                      ;099C44|F00A    |099C50;
						STA.W r_entity_spriteGroup,X         ;099C46|9D8C04  |09048C;
						INY                                  ;099C49|C8      |      ;
						LDA.B ($02),Y                        ;099C4A|B102    |000002;
						STA.W r_entity_spriteID,X            ;099C4C|9D0004  |090400;
						RTS                                  ;099C4F|60      |      ;
	
	
			DEC_entitySpriteID:
						DEC.W r_entity_spriteID,X            ;099C50|DE0004  |090400;
						DEC.W r_entity_spriteID,X            ;099C53|DE0004  |090400;
						RTS                                  ;099C56|60      |      ;
	
	
	          INC_entitySpriteID: 
						INC.W r_entity_spriteID,X            ;099C57|FE0004  |090400;
						INC.W r_entity_spriteID,X            ;099C5A|FE0004  |090400;
						RTS                                  ;099C5D|60      |      ;
	
	
			bossState__41:
						LDA.W r_entity_Counter,X             ;099C5E|BD3306  |090633;
						BNE CODE_099C7C                      ;099C61|D019    |099C7C;
						LDA.W r_entity_XPos                  ;099C63|AD3804  |090438;
						STA.B $04                            ;099C66|8504    |000004;
						LDA.W r_entity_YPos                  ;099C68|AD1C04  |09041C;
						STA.B $05                            ;099C6B|8505    |000005;
						db $20                               ;099C6D|        |      ;
						dw pushCurBankGo6                    ;099C6E|        |0FFF30;
						LDA.B $00                            ;099C70|A500    |000000;
						AND.B #$1E                           ;099C72|291E    |      ;
						STA.W r_misc_movementState,X         ;099C74|9D4506  |090645;
						LDA.B #$01                           ;099C77|A901    |      ;
						STA.W r_entity_Counter,X             ;099C79|9D3306  |090633;
	
			CODE_099C7C:
						LDA.W r_misc_movementState,X         ;099C7C|BD4506  |090645;
						CMP.W r_Player_StateDoubled,X        ;099C7F|DD6505  |090565;
						BEQ CODE_099CAA                      ;099C82|F026    |099CAA;
						LDA.W r_damagActionFlag,X            ;099C84|BD1D06  |09061D;
						BEQ CODE_099C92                      ;099C87|F009    |099C92;
						INC.W r_Player_StateDoubled,X        ;099C89|FE6505  |090565;
						INC.W r_Player_StateDoubled,X        ;099C8C|FE6505  |090565;
						JMP.W CODE_099C98                    ;099C8F|4C989C  |099C98;
	
	
			CODE_099C92:
						DEC.W r_Player_StateDoubled,X        ;099C92|DE6505  |090565;
						DEC.W r_Player_StateDoubled,X        ;099C95|DE6505  |090565;
	
			CODE_099C98:
						LDA.W r_Player_StateDoubled,X        ;099C98|BD6505  |090565;
						AND.B #$1E                           ;099C9B|291E    |      ;
						STA.W r_Player_StateDoubled,X        ;099C9D|9D6505  |090565;
						LDY.B #$01                           ;099CA0|A001    |      ;
						LDA.B ($02),Y                        ;099CA2|B102    |000002;
						STA.W r_entity_extra,X               ;099CA4|9DD805  |0905D8;
						JMP.W INC_bossAI_IDX                    ;099CA7|4C669D  |099D66;
	
	
			CODE_099CAA:
						INC.W r_damagActionFlag,X            ;099CAA|FE1D06  |09061D;
						LDA.W r_damagActionFlag,X            ;099CAD|BD1D06  |09061D;
						AND.B #$01                           ;099CB0|2901    |      ;
						STA.W r_damagActionFlag,X            ;099CB2|9D1D06  |09061D;
						LDA.B #$00                           ;099CB5|A900    |      ;
						STA.W r_entity_Counter,X             ;099CB7|9D3306  |090633;
						LDY.B #$02                           ;099CBA|A002    |      ;
						LDA.B ($02),Y                        ;099CBC|B102    |000002;
						STA.W r_entity_extra,X               ;099CBE|9DD805  |0905D8;
						JMP.W INC_bossAI_IDX                    ;099CC1|4C669D  |099D66;
	
	
			bossState__3f:
						STX.B r_index                        ;099CC4|8610    |000010;
						LDY.B #$01                           ;099CC6|A001    |      ;
						LDA.B ($02),Y                        ;099CC8|B102    |000002;
						ASL A                                ;099CCA|0A      |      ;
						ASL A                                ;099CCB|0A      |      ;
						INY                                  ;099CCC|C8      |      ;
						CLC                                  ;099CCD|18      |      ;
						ADC.B ($02),Y                        ;099CCE|7102    |000002;
						CLC                                  ;099CD0|18      |      ;
						ADC.B #$03                           ;099CD1|6903    |      ;
						CLC                                  ;099CD3|18      |      ;
						ADC.B r_sceneDrawQueue               ;099CD4|651D    |00001D;
						STA.B r_coreLoadingFuncAddr          ;099CD6|8516    |000016;
						INY                                  ;099CD8|C8      |      ;
						LDA.B ($02),Y                        ;099CD9|B102    |000002;
						STA.B r_bossScript__15                           ;099CDB|8515    |000015;
						JSR.W CODE_099D04                    ;099CDD|20049D  |099D04;
						LDX.B r_coreLoadingFuncAddr          ;099CE0|A616    |000016;
						LDA.B r_bossScript__15                           ;099CE2|A515    |000015;
						JSR.W CODE_099CEC                    ;099CE4|20EC9C  |099CEC;
						LDX.B r_index                        ;099CE7|A610    |000010;
						JMP.W INC_bossAI_IDX                    ;099CE9|4C669D  |099D66;
	
	
			CODE_099CEC:
						STA.W r_VramQueue,X                  ;099CEC|9D0003  |090300;
						INX                                  ;099CEF|E8      |      ;
						RTS                                  ;099CF0|60      |      ;
	
	
			DATA16_099CF1:
						dw $3F00                             ;099CF1|        |      ;
						db $0F,$16,$26,$20                   ;099CF3|        |      ;
						db $0F,$0B,$1C,$2A                   ;099CF7|        |      ;
						db $0F,$02,$09,$08                   ;099CFB|        |      ;
						db $0F,$02,$31,$12                   ;099CFF|        |      ;
						db $FF                               ;099D03|        |      ;
	
			CODE_099D04:
						LDX.B r_sceneDrawQueue               ;099D04|A61D    |00001D;
						LDA.B #$01                           ;099D06|A901    |      ;
						JSR.W CODE_099CEC                    ;099D08|20EC9C  |099CEC;
						LDY.B #$00                           ;099D0B|A000    |      ;
	
			CODE_099D0D:
						LDA.W DATA16_099CF1,Y                ;099D0D|B9F19C  |099CF1;
						JSR.W CODE_099CEC                    ;099D10|20EC9C  |099CEC;
						CMP.B #$FF                           ;099D13|C9FF    |      ;
						BEQ CODE_099D1A                      ;099D15|F003    |099D1A;
						INY                                  ;099D17|C8      |      ;
						BNE CODE_099D0D                      ;099D18|D0F3    |099D0D;
	
			CODE_099D1A:
						STX.B r_sceneDrawQueue               ;099D1A|861D    |00001D;
						LDA.B #$04                           ;099D1C|A904    |      ;
						db $4C                               ;099D1E|        |      ;
	
						dw screenLoad_A_CHR                  ;099D1F|        |0FECE9;
	
			bossState__3e:
						LDA.W r_entity_mask,X                ;099D21|BD7004  |090470;
						ORA.B #$88                           ;099D24|0988    |      ;
						STA.W r_entity_mask,X                ;099D26|9D7004  |090470;
						JMP.W INC_bossAI_IDX                    ;099D29|4C669D  |099D66;
	
	
			bossState__3b:
						LDY.B #$01                           ;099D2C|A001    |      ;
						LDA.B ($02),Y                        ;099D2E|B102    |000002;
						STA.W r_entity_PaletteOverride,X     ;099D30|9D5404  |090454;
						JMP.W INC_bossAI_IDX                    ;099D33|4C669D  |099D66;
	
	
			bossState__3c:
						LDY.B #$01                           ;099D36|A001    |      ;
						LDA.B ($02),Y                        ;099D38|B102    |000002;
						STA.W r_entity_Counter,X             ;099D3A|9D3306  |090633;
						JMP.W INC_bossAI_IDX                    ;099D3D|4C669D  |099D66;
			
			bossState__3d:
						DEC.W r_entity_Counter,X             ;099D40|DE3306  |090633;
						BEQ INC_bossAI_IDX                      ;099D43|F00C    |099D51;	
			bossState__47:
						LDY.B #$01                           ;099D45|A001    |      ;
						LDA.B ($02),Y                        ;099D47|B102    |000002;
						CLC                                  ;099D49|18      |      ;
						ADC.W r_entity_AI_IDX,X              ;099D4A|7DC105  |0905C1;
						STA.W r_entity_AI_IDX,X              ;099D4D|9DC105  |0905C1;
						RTS                                  ;099D50|60      |      ;
	
			bossState__3a:
						LDY.B #$01                           ;099D54|A001    |      ;
						LDA.B ($02),Y                        ;099D56|B102    |000002;
						jsr lunchMusic                        ;099D59|        |0FE25F;
						JMP.W INC_bossAI_IDX                    ;099D5B|4C669D  |099D66;
	
			bossState__39:
						LDA.W r_entity_mask,X                ;099D5E|BD7004  |090470;
						AND.B #$77                           ;099D61|2977    |      ;
						STA.W r_entity_mask,X                ;099D63|9D7004  |090470;
	
			INC_bossAI_IDX:
						INC.W r_entity_AI_IDX,X              ;099D66|FEC105  |0905C1;
						RTS                                  ;099D69|60      |      ;
	
	
			bossState__38:
						LDA.W r_Player_StateDoubled,X        ;099D6A|BD6505  |090565;
						CLC                                  ;099D6D|18      |      ;
						ADC.B #$08                           ;099D6E|6908    |      ;
						AND.B #$0F                           ;099D70|290F    |      ;
						STA.W r_Player_StateDoubled,X        ;099D72|9D6505  |090565;
						JMP.W INC_bossAI_IDX                    ;099D75|4C669D  |099D66;
	
	
			bossState__45:
						LDA.W r_entity_AI,X                  ;099D78|BDEF05  |0905EF;
						STA.W r_misc_movementState,X         ;099D7B|9D4506  |090645;
						INC.W r_entity_AI_IDX,X              ;099D7E|FEC105  |0905C1;
						LDA.W r_entity_AI_IDX,X              ;099D81|BDC105  |0905C1;
						STA.W r_entity_Counter,X             ;099D84|9D3306  |090633;
						LDA.B #$00                           ;099D87|A900    |      ;
						STA.W r_entity_AI_IDX,X              ;099D89|9DC105  |0905C1;
						LDY.B #$01                           ;099D8C|A001    |      ;
						LDA.B ($02),Y                        ;099D8E|B102    |000002;
						AND.B #$80                           ;099D90|2980    |      ;
						STA.W r_entity_AI,X                  ;099D92|9DEF05  |0905EF;
						RTS                                  ;099D95|60      |      ;
	
	
			bossState__37:
						LDA.W r_misc_movementState,X         ;099D96|BD4506  |090645;
						STA.W r_entity_AI,X                  ;099D99|9DEF05  |0905EF;
						LDA.W r_entity_Counter,X             ;099D9C|BD3306  |090633;
						STA.W r_entity_AI_IDX,X              ;099D9F|9DC105  |0905C1;
						RTS                                  ;099DA2|60      |      ;
	
	
			bossState__35:
						LDA.W r_entity_mask,X                ;099DA3|BD7004  |090470;
						AND.B #$BF                           ;099DA6|29BF    |      ;
						STA.W r_entity_mask,X                ;099DA8|9D7004  |090470;
						JMP.W INC_bossAI_IDX                    ;099DAB|4C669D  |099D66;
	
	
			bossState__36:
						LDA.W r_entity_mask,X                ;099DAE|BD7004  |090470;
						ORA.B #$40                           ;099DB1|0940    |      ;
						STA.W r_entity_mask,X                ;099DB3|9D7004  |090470;
						JMP.W INC_bossAI_IDX                    ;099DB6|4C669D  |099D66;
	
	
			bossState__34:
						LDY.B #$01                           ;099DB9|A001    |      ;
						LDA.B ($02),Y                        ;099DBB|B102    |000002;
						JSR.W setEntity_pos_06               ;099DBD|206687  |098766;
						LDA.W r_entity_FacingLeft,X          ;099DC0|BDA804  |0904A8;
						STA.W r_entity_FacingLeft,Y          ;099DC3|99A804  |0904A8;
						LDA.W r_Player_StateDoubled,X        ;099DC6|BD6505  |090565;
						STA.W r_Player_StateDoubled,Y        ;099DC9|996505  |090565;
						LDA.B #$00                           ;099DCC|A900    |      ;
						STA.W r_entity_target,Y              ;099DCE|990606  |090606;
						STA.W r_entity_AI_IDX,Y              ;099DD1|99C105  |0905C1;
						JMP.W INC_bossAI_IDX                    ;099DD4|4C669D  |099D66;
	
	
			bossState__33:
						LDY.B #$01                           ;099DD7|A001    |      ;
						LDA.B ($02),Y                        ;099DD9|B102    |000002;
						CLC                                  ;099DDB|18      |      ;
						ADC.W r_entity_XPos,X                ;099DDC|7D3804  |090438;
						STA.W r_entity_XPos,X                ;099DDF|9D3804  |090438;
						INY                                  ;099DE2|C8      |      ;
						LDA.B ($02),Y                        ;099DE3|B102    |000002;
						CLC                                  ;099DE5|18      |      ;
						ADC.W r_entity_YPos,X                ;099DE6|7D1C04  |09041C;
						STA.W r_entity_YPos,X                ;099DE9|9D1C04  |09041C;
						JMP.W INC_bossAI_IDX                    ;099DEC|4C669D  |099D66;
	
	
			bossState__32:
						LDA.W r_entity_XPos                  ;099DEF|AD3804  |090438;
						STA.B $04                            ;099DF2|8504    |000004;
						LDA.W r_entity_YPos                  ;099DF4|AD1C04  |09041C;
						STA.B $05                            ;099DF7|8505    |000005;
						db $20                               ;099DF9|        |      ;
						dw pushCurBankGo6                    ;099DFA|        |0FFF30;
						LDA.B $00                            ;099DFC|A500    |000000;
						AND.B #$10                           ;099DFE|2910    |      ;
						BEQ CODE_099E04                      ;099E00|F002    |099E04;
						LDA.B #$01                           ;099E02|A901    |      ;
	
			CODE_099E04:
						CMP.W r_entity_FacingLeft,X          ;099E04|DDA804  |0904A8;
						BEQ CODE_099E12                      ;099E07|F009    |099E12;
						LDA.B $00                            ;099E09|A500    |000000;
						CLC                                  ;099E0B|18      |      ;
						ADC.B #$10                           ;099E0C|6910    |      ;
						AND.B #$1F                           ;099E0E|291F    |      ;
						STA.B $00                            ;099E10|8500    |000000;
	
			CODE_099E12:
						LDA.B $00                            ;099E12|A500    |000000;
						AND.B #$10                           ;099E14|2910    |      ;
						BEQ CODE_099E2A                      ;099E16|F012    |099E2A;
						LDA.B $00                            ;099E18|A500    |000000;
						CMP.B #$15                           ;099E1A|C915    |      ;
						BCS CODE_099E22                      ;099E1C|B004    |099E22;
						LDA.B #$15                           ;099E1E|A915    |      ;
						BNE CODE_099E3A                      ;099E20|D018    |099E3A;
	
			CODE_099E22:
						CMP.B #$1C                           ;099E22|C91C    |      ;
						BCC CODE_099E3A                      ;099E24|9014    |099E3A;
						LDA.B #$1B                           ;099E26|A91B    |      ;
						BNE CODE_099E3A                      ;099E28|D010    |099E3A;
	
			CODE_099E2A:
						LDA.B $00                            ;099E2A|A500    |000000;
						CMP.B #$05                           ;099E2C|C905    |      ;
						BCS CODE_099E34                      ;099E2E|B004    |099E34;
						LDA.B #$05                           ;099E30|A905    |      ;
						BNE CODE_099E3A                      ;099E32|D006    |099E3A;
	
			CODE_099E34:
						CMP.B #$0C                           ;099E34|C90C    |      ;
						BCC CODE_099E3A                      ;099E36|9002    |099E3A;
						LDA.B #$0B                           ;099E38|A90B    |      ;
	
			CODE_099E3A:
						STA.W r_Player_StateDoubled,X        ;099E3A|9D6505  |090565;
						JMP.W INC_bossAI_IDX                    ;099E3D|4C669D  |099D66;
	
	
			bossState__2b:
						LDA.B #$40                           ;099E40|A940    |      ;
						STA.W r_entity_mask,X                ;099E42|9D7004  |090470;
						JMP.W INC_bossAI_IDX                    ;099E45|4C669D  |099D66;
	
	
			bossState__20:
						LDA.W r_entity_YPos                  ;099E48|AD1C04  |09041C;
						STA.B $05                            ;099E4B|8505    |000005;
						LDA.W r_entity_XPos                  ;099E4D|AD3804  |090438;
						STA.B $04                            ;099E50|8504    |000004;
						db $20                               ;099E52|        |      ;
						dw pushCurBankGo6                    ;099E53|        |0FFF30;
						LDA.B $00                            ;099E55|A500    |000000;
						STA.B $06                            ;099E57|8506    |000006;
						LSR A                                ;099E59|4A      |      ;
						AND.B #$0F                           ;099E5A|290F    |      ;
						STA.B $05                            ;099E5C|8505    |000005;
						LDY.B #$01                           ;099E5E|A001    |      ;
						LDA.B ($02),Y                        ;099E60|B102    |000002;
						STA.B $00                            ;099E62|8500    |000000;
						INY                                  ;099E64|C8      |      ;
						LDA.B ($02),Y                        ;099E65|B102    |000002;
						STA.B $01                            ;099E67|8501    |000001;
						INY                                  ;099E69|C8      |      ;
						LDA.B ($02),Y                        ;099E6A|B102    |000002;
						STA.B $02                            ;099E6C|8502    |000002;
	
			CODE_099E6E:
						LDA.B $00                            ;099E6E|A500    |000000;
						JSR.W setEntity_pos_06               ;099E70|206687  |098766;
						BCS CODE_099E78                      ;099E73|B003    |099E78;
						JMP.W CODE_099EEA                    ;099E75|4CEA9E  |099EEA;
	
	
			CODE_099E78:
						STY.B $04                            ;099E78|8404    |000004;
						LDA.B $02                            ;099E7A|A502    |000002;
						BEQ CODE_099EB0                      ;099E7C|F032    |099EB0;
						CMP.B #$01                           ;099E7E|C901    |      ;
						BNE CODE_099E85                      ;099E80|D003    |099E85;
						JMP.W CODE_099EE3                    ;099E82|4CE39E  |099EE3;
	
	
			CODE_099E85:
						CMP.B #$04                           ;099E85|C904    |      ;
						BEQ CODE_099ECC                      ;099E87|F043    |099ECC;
						LDA.B #$00                           ;099E89|A900    |      ;
						STA.W r_entity_Xspd,Y                ;099E8B|99F204  |0904F2;
						STA.W r_entity_XsubSpd,Y             ;099E8E|990905  |090509;
						STA.W r_entity_Yspd,Y                ;099E91|992005  |090520;
						STA.W r_entity_YsubSpd,Y             ;099E94|993705  |090537;
						LDA.B $01                            ;099E97|A501    |000001;
						SEC                                  ;099E99|38      |      ;
						SBC.B #$01                           ;099E9A|E901    |      ;
						STA.W r_entity_target,Y              ;099E9C|990606  |090606;
						LDA.B $02                            ;099E9F|A502    |000002;
						CMP.B #$03                           ;099EA1|C903    |      ;
						BEQ CODE_099EA8                      ;099EA3|F003    |099EA8;
						JMP.W CODE_099EE3                    ;099EA5|4CE39E  |099EE3;
	
	
			CODE_099EA8:
						LDA.B $05                            ;099EA8|A505    |000005;
						STA.W r_Player_StateDoubled,Y        ;099EAA|996505  |090565;
						JMP.W CODE_099EE3                    ;099EAD|4CE39E  |099EE3;
	
	
			CODE_099EB0:
						LDY.B $01                            ;099EB0|A401    |000001;
						DEY                                  ;099EB2|88      |      ;
						LDA.W DATA8_099EED,Y                 ;099EB3|B9ED9E  |099EED;
						CLC                                  ;099EB6|18      |      ;
						ADC.B $05                            ;099EB7|6505    |000005;
						AND.B #$0F                           ;099EB9|290F    |      ;
						LDY.B $04                            ;099EBB|A404    |000004;
						STA.W r_Player_StateDoubled,Y        ;099EBD|996505  |090565;
						AND.B #$08                           ;099EC0|2908    |      ;
						BEQ CODE_099EC6                      ;099EC2|F002    |099EC6;
						LDA.B #$01                           ;099EC4|A901    |      ;
	
			CODE_099EC6:
						STA.W r_entity_FacingLeft,Y          ;099EC6|99A804  |0904A8;
						JMP.W CODE_099EE3                    ;099EC9|4CE39E  |099EE3;
	
	
			CODE_099ECC:
						LDY.B $04                            ;099ECC|A404    |000004;
						LDA.B #$00                           ;099ECE|A900    |      ;
						STA.W r_entity_AI_IDX,Y              ;099ED0|99C105  |0905C1;
						STA.W r_entity_spriteID,Y            ;099ED3|990004  |090400;
						STA.W r_entity_mask,Y                ;099ED6|997004  |090470;
						LDA.B $06                            ;099ED9|A506    |000006;
						STA.W r_Player_StateDoubled,Y        ;099EDB|996505  |090565;
						LDA.B #$80                           ;099EDE|A980    |      ;
						STA.W r_entity_AI,Y                  ;099EE0|99EF05  |0905EF;
	
			CODE_099EE3:
						DEC.B $01                            ;099EE3|C601    |000001;
						BEQ CODE_099EEA                      ;099EE5|F003    |099EEA;
						JMP.W CODE_099E6E                    ;099EE7|4C6E9E  |099E6E;
	
	
			CODE_099EEA:
						JMP.W INC_bossAI_IDX                    ;099EEA|4C669D  |099D66;
	
	
			DATA8_099EED:
						db $FF,$00,$01,$03                   ;099EED|        |      ;
						db $03,$03,$03,$04                   ;099EF1|        |      ;
						db $04,$04,$04,$0C                   ;099EF5|        |      ;
						db $0C,$0C,$0C,$0D                   ;099EF9|        |      ;
						db $0D,$0D,$0D                       ;099EFD|        |      ;
	
			bossState__25:
						LDA.B #$18                           ;099F00|A918    |      ;
						JSR.W setEntity_pos_06               ;099F02|206687  |098766;
						BCC CODE_099F55                      ;099F05|904E    |099F55;
						LDA.W r_entity_YPos,Y                ;099F07|B91C04  |09041C;
						SEC                                  ;099F0A|38      |      ;
						SBC.B #$20                           ;099F0B|E920    |      ;
						STA.W r_entity_YPos,Y                ;099F0D|991C04  |09041C;
						LDA.W r_entity_XPos                  ;099F10|AD3804  |090438;
						SEC                                  ;099F13|38      |      ;
						SBC.W r_entity_XPos,Y                ;099F14|F93804  |090438;
						BCS CODE_099F1E                      ;099F17|B005    |099F1E;
						EOR.B #$FF                           ;099F19|49FF    |      ;
						CLC                                  ;099F1B|18      |      ;
						ADC.B #$01                           ;099F1C|6901    |      ;
	
			CODE_099F1E:
						AND.B #$F0                           ;099F1E|29F0    |      ;
						LSR A                                ;099F20|4A      |      ;
						LSR A                                ;099F21|4A      |      ;
						LSR A                                ;099F22|4A      |      ;
						STY.B $05                            ;099F23|8405    |000005;
						TAY                                  ;099F25|A8      |      ;
						LDA.W DATA8_099F56,Y                 ;099F26|B9569F  |099F56;
						STA.B $00                            ;099F29|8500    |000000;
						LDA.W DATA8_099F57,Y                 ;099F2B|B9579F  |099F57;
						STA.B $01                            ;099F2E|8501    |000001;
						LDA.W r_entity_FacingLeft,X          ;099F30|BDA804  |0904A8;
						BEQ CODE_099F46                      ;099F33|F011    |099F46;
						LDA.B $00                            ;099F35|A500    |000000;
						EOR.B #$FF                           ;099F37|49FF    |      ;
						CLC                                  ;099F39|18      |      ;
						ADC.B #$01                           ;099F3A|6901    |      ;
						STA.B $00                            ;099F3C|8500    |000000;
						LDA.B $01                            ;099F3E|A501    |000001;
						EOR.B #$FF                           ;099F40|49FF    |      ;
						ADC.B #$00                           ;099F42|6900    |      ;
						STA.B $01                            ;099F44|8501    |000001;
	
			CODE_099F46:
						LDY.B $05                            ;099F46|A405    |000005;
						LDA.B $00                            ;099F48|A500    |000000;
						STA.W r_entity_XsubSpd,Y             ;099F4A|990905  |090509;
						LDA.B $01                            ;099F4D|A501    |000001;
						STA.W r_entity_Xspd,Y                ;099F4F|99F204  |0904F2;
						INC.W r_entity_AI_IDX,X              ;099F52|FEC105  |0905C1;
	
			CODE_099F55:
						RTS                                  ;099F55|60      |      ;
	
	
			DATA8_099F56:
						db $40                               ;099F56|        |      ;
	
			DATA8_099F57:
						db $00,$50,$00,$A0                   ;099F57|        |      ;
						db $00,$F0,$00,$40                   ;099F5B|        |      ;
						db $01,$90,$01,$E0                   ;099F5F|        |      ;
						db $01,$30,$02,$80                   ;099F63|        |      ;
						db $02,$D0,$02,$20                   ;099F67|        |      ;
						db $03,$70,$03,$C0                   ;099F6B|        |      ;
						db $03,$10,$04,$60                   ;099F6F|        |      ;
						db $04,$B0,$04                       ;099F73|        |      ;
	
			bossState__26:
						LDA.B #$16                           ;099F76|A916    |      ;
						STA.B r_IRQFuncIdx                   ;099F78|853F    |00003F;
						LDA.W r_entity_extra,X               ;099F7A|BDD805  |0905D8;
						BNE CODE_099F87                      ;099F7D|D008    |099F87;
						INC.W r_entity_AI_IDX,X              ;099F7F|FEC105  |0905C1;
						LDA.B #$01                           ;099F82|A901    |      ;
						STA.B r_IRQFuncIdx                   ;099F84|853F    |00003F;
						RTS                                  ;099F86|60      |      ;
	
	
			CODE_099F87:
						LDY.B #$01                           ;099F87|A001    |      ;
						LDA.B ($02),Y                        ;099F89|B102    |000002;
						BNE CODE_099F9C                      ;099F8B|D00F    |099F9C;
						LDA.W r_entity_extra,X               ;099F8D|BDD805  |0905D8;
						AND.B #$0F                           ;099F90|290F    |      ;
						TAY                                  ;099F92|A8      |      ;
						LDA.W DATA8_099FAC,Y                 ;099F93|B9AC9F  |099FAC;
						STA.W r_orb_statesGlobal             ;099F96|8DED07  |0907ED;
						JMP.W CODE_099FA8                    ;099F99|4CA89F  |099FA8;
	
	
			CODE_099F9C:
						LDA.W r_entity_extra,X               ;099F9C|BDD805  |0905D8;
						AND.B #$07                           ;099F9F|2907    |      ;
						TAY                                  ;099FA1|A8      |      ;
						LDA.W DATA8_099FBC,Y                 ;099FA2|B9BC9F  |099FBC;
						STA.W r_orb_statesGlobal             ;099FA5|8DED07  |0907ED;
	
			CODE_099FA8:
						DEC.W r_entity_extra,X               ;099FA8|DED805  |0905D8;
						RTS                                  ;099FAB|60      |      ;
	
	
			DATA8_099FAC:
						db $02,$03,$01,$07                   ;099FAC|        |      ;
						db $03,$06,$01,$09                   ;099FB0|        |      ;
						db $00,$05,$04,$01                   ;099FB4|        |      ;
						db $08,$02,$06,$00                   ;099FB8|        |      ;
	
			DATA8_099FBC:
						db $00,$03,$01,$02                   ;099FBC|        |      ;
						db $02,$01,$03,$00                   ;099FC0|        |      ;
	
			bossState__27:
						JSR.W setEnityAi_RNG_00              ;099FC4|203BA1  |09A13B;
						LDA.B r_RNG                          ;099FC7|A51F    |00001F;
						ASL A                                ;099FC9|0A      |      ;
						ASL A                                ;099FCA|0A      |      ;
						ASL A                                ;099FCB|0A      |      ;
						ASL A                                ;099FCC|0A      |      ;
						CMP.B #$D0                           ;099FCD|C9D0    |      ;
						BCC CODE_099FD4                      ;099FCF|9003    |099FD4;
						CLC                                  ;099FD1|18      |      ;
						ADC.B #$80                           ;099FD2|6980    |      ;
	
			CODE_099FD4:
						STA.W r_entity_XPos,X                ;099FD4|9D3804  |090438;
						LDA.B #$40                           ;099FD7|A940    |      ;
						STA.W r_entity_YPos,X                ;099FD9|9D1C04  |09041C;
						LDA.B #$00                           ;099FDC|A900    |      ;
						STA.W r_entity_Xspd,X                ;099FDE|9DF204  |0904F2;
						STA.W r_entity_XsubSpd,X             ;099FE1|9D0905  |090509;
						INC.W r_entity_AI_IDX,X              ;099FE4|FEC105  |0905C1;
						JSR.W setEnityAi_RNG_00              ;099FE7|203BA1  |09A13B;
						BNE CODE_099FEE                      ;099FEA|D002    |099FEE;
						LDA.B #$01                           ;099FEC|A901    |      ;
	
			CODE_099FEE:
						STA.W r_entity_extra,X               ;099FEE|9DD805  |0905D8;
						LDA.B #$88                           ;099FF1|A988    |      ;
						STA.W r_entity_mask,X                ;099FF3|9D7004  |090470;
						RTS                                  ;099FF6|60      |      ;
	
	
			bossState__28:
						INC.W r_entity_AI_IDX,X              ;099FF7|FEC105  |0905C1;
						LDY.B #$01                           ;099FFA|A001    |      ;
						LDA.B ($02),Y                        ;099FFC|B102    |000002;
						STA.B $00                            ;099FFE|8500    |000000;
						INY                                  ;09A000|C8      |      ;
						LDA.B ($02),Y                        ;09A001|B102    |000002;
						TAY                                  ;09A003|A8      |      ;
						LDA.B $00                            ;09A004|A500    |000000;
						jmp setSpriteAndAnimGroup_AY                 ;09A007|        |0FEF5C;

	
	
			bossState__2c:
						DEC.W r_entity_extra,X               ;09A00C|DED805  |0905D8;
						BEQ CODE_09A023                      ;09A00F|F012    |09A023;
						LDA.B #$50                           ;09A011|A950    |      ;
						STA.W r_entity_mask,X                ;09A013|9D7004  |090470;
						LDA.W r_entity_extra,X               ;09A016|BDD805  |0905D8;
						AND.B #$03                           ;09A019|2903    |      ;
						BEQ CODE_09A026                      ;09A01B|F009    |09A026;
						LDA.B #$98                           ;09A01D|A998    |      ;
						STA.W r_entity_mask,X                ;09A01F|9D7004  |090470;
						RTS                                  ;09A022|60      |      ;
	
	
			CODE_09A023:
						INC.W r_entity_AI_IDX,X              ;09A023|FEC105  |0905C1;
	
			CODE_09A026:
						RTS                                  ;09A026|60      |      ;
	
	
			bossState__48:
						LDY.B #$01                           ;09A027|A001    |      ;
						LDA.B ($02),Y                        ;09A029|B102    |000002;
						ASL A                                ;09A02B|0A      |      ;
						TAY                                  ;09A02C|A8      |      ;
						LDA.W PTR16_09A03A,Y                 ;09A02D|B93AA0  |09A03A;
						STA.B $00                            ;09A030|8500    |000000;
						LDA.W PTR16_09A03A+1,Y                 ;09A032|B93BA0  |09A03B;
						STA.B $01                            ;09A035|8501    |000001;
						JMP.W CODE_09A092                    ;09A037|4C92A0  |09A092;
	
	
			PTR16_09A03A:
						dw DATA8_09A040                      ;09A03A|        |09A040;
						dw DATA8_09A056                      ;09A03C|        |09A056;
						dw DATA8_09A06C                      ;09A03E|        |09A06C;
	
			DATA8_09A040:
						db $04,$00,$FC,$00                   ;09A040|        |      ;
						db $FA,$00,$06,$00                   ;09A044|        |      ;
						db $00,$00,$F6,$00                   ;09A048|        |      ;
						db $0A,$00,$F8,$00                   ;09A04C|        |      ;
						db $FE,$00,$02,$00                   ;09A050|        |      ;
						db $08,$00                           ;09A054|        |      ;
	
			DATA8_09A056:
						db $00,$00,$00,$00                   ;09A056|        |      ;
						db $FE,$F8,$02,$F9                   ;09A05A|        |      ;
						db $00,$F7,$00,$F8                   ;09A05E|        |      ;
						db $00,$F9,$00,$F8                   ;09A062|        |      ;
						db $00,$F7,$00,$F8                   ;09A066|        |      ;
						db $00,$F9                           ;09A06A|        |      ;
	
			DATA8_09A06C:
						db $00,$00,$00,$00                   ;09A06C|        |      ;
						db $00,$00,$00,$00                   ;09A070|        |      ;
						db $00,$00,$00,$F0                   ;09A074|        |      ;
						db $00,$F9,$00,$F9                   ;09A078|        |      ;
						db $00,$F9,$00,$F0                   ;09A07C|        |      ;
						db $00,$F9                           ;09A080|        |      ;
	
		bossState__2d: 
						LDY.B #$01                           ;09A082|A001    |      ;
						LDA.B ($02),Y                        ;09A084|B102    |000002;
						ASL A                                ;09A086|0A      |      ;
						TAY                                  ;09A087|A8      |      ;
						LDA.W PTR16_09A0B5,Y                 ;09A088|B9B5A0  |09A0B5;
						STA.B $00                            ;09A08B|8500    |000000;
						LDA.W PTR16_09A0B5+1,Y                ;09A08D|B9B6A0  |09A0B6;
						STA.B $01                            ;09A090|8501    |000001;
	
			CODE_09A092:
						LDA.W r_entity_target,X              ;09A092|BD0606  |090606;
						ASL A                                ;09A095|0A      |      ;
						TAY                                  ;09A096|A8      |      ;
						LDA.B ($00),Y                        ;09A097|B100    |000000;
						CLC                                  ;09A099|18      |      ;
						ADC.W r_entity_XPos,X                ;09A09A|7D3804  |090438;
						STA.W r_entity_XPos,X                ;09A09D|9D3804  |090438;
						INY                                  ;09A0A0|C8      |      ;
						LDA.B ($00),Y                        ;09A0A1|B100    |000000;
						CLC                                  ;09A0A3|18      |      ;
						ADC.W r_entity_YPos,X                ;09A0A4|7D1C04  |09041C;
						STA.W r_entity_YPos,X                ;09A0A7|9D1C04  |09041C;
						INC.W r_entity_AI_IDX,X              ;09A0AA|FEC105  |0905C1;
						LDY.B #$02                           ;09A0AD|A002    |      ;
						LDA.B ($02),Y                        ;09A0AF|B102    |000002;
						STA.W r_entity_extra,X               ;09A0B1|9DD805  |0905D8;
						RTS                                  ;09A0B4|60      |      ;
	
	
			PTR16_09A0B5:
						dw DATA8_09A0BB                      ;09A0B5|        |09A0BB;
						dw DATA8_09A0CB                      ;09A0B7|        |09A0CB;
						dw DATA8_09A0DB                      ;09A0B9|        |09A0DB;
	
			DATA8_09A0BB:
						db $04,$00,$FC,$00                   ;09A0BB|        |      ;
						db $FA,$00,$06,$00                   ;09A0BF|        |      ;
						db $00,$00,$FC,$00                   ;09A0C3|        |      ;
						db $06,$00,$FA,$00                   ;09A0C7|        |      ;
	
			DATA8_09A0CB:
						db $00,$00,$00,$00                   ;09A0CB|        |      ;
						db $FE,$F8,$02,$F9                   ;09A0CF|        |      ;
						db $00,$F7,$00,$F8                   ;09A0D3|        |      ;
						db $00,$F9,$00,$F8                   ;09A0D7|        |      ;
	
			DATA8_09A0DB:
						db $00,$00,$00,$00                   ;09A0DB|        |      ;
						db $00,$00,$00,$00                   ;09A0DF|        |      ;
						db $00,$00,$00,$F0                   ;09A0E3|        |      ;
						db $00,$F9,$00,$F9                   ;09A0E7|        |      ;
	
			bossState_hammerGut_2e:
						LDY.B #$01                           ;09A0EB|A001    |      ;
						LDA.B ($02),Y                        ;09A0ED|B102    |000002;
						STA.W r_Player_StateDoubled,X        ;09A0EF|9D6505  |090565;
						JMP.W INC_bossAI_IDX                    ;09A0F2|4CFEA0  |09A0FE;
	
			bossState__2f:
						JSR.W setEnityAi_RNG_00              ;09A0F5|203BA1  |09A13B;
						CLC                                  ;09A0F8|18      |      ;
						ADC.B #$01                           ;09A0F9|6901    |      ;
						STA.W r_entity_extra,X               ;09A0FB|9DD805  |0905D8;
						JMP.W INC_bossAI_IDX                    ;09A0FE|4C669D  |099D66;
	
	
			bossState__30:
						LDA.B #$00                           ;09A101|A900    |      ;
						STA.B $00                            ;09A103|8500    |000000;
						LDY.B #$01                           ;09A105|A001    |      ;
	
			CODE_09A107:
						LDA.W r_entity_ID,Y                  ;09A107|B94E05  |09054E;
						CMP.B #$1A                           ;09A10A|C91A    |      ;
						BNE CODE_09A110                      ;09A10C|D002    |09A110;
						INC.B $00                            ;09A10E|E600    |000000;
	
			CODE_09A110:
						INY                                  ;09A110|C8      |      ;
						CPY.B #$0D                           ;09A111|C00D    |      ;
						BNE CODE_09A107                      ;09A113|D0F2    |09A107;
						LDY.B $00                            ;09A115|A400    |000000;
						DEY                                  ;09A117|88      |      ;
						BNE CODE_09A123                      ;09A118|D009    |09A123;
						LDA.B #$88                           ;09A11A|A988    |      ;
						STA.W r_entity_mask,X                ;09A11C|9D7004  |090470;
						INC.W r_entity_AI_IDX,X              ;09A11F|FEC105  |0905C1;
						RTS                                  ;09A122|60      |      ;
	
	
			CODE_09A123:
						JMP.W clear_bossSlot_02             ;09A123|4C3A87  |09873A;
	
	
			bossState__31:
						LDA.B #$02                           ;09A126|A902    |      ;
						STA.W r_orb_flagsTimer               ;09A128|8DF307  |0907F3;
						LDA.B #$00                           ;09A12B|A900    |      ;
						JSR.W setEntity_stats_03             ;09A12D|20F487  |0987F4;
						BCC CODE_09A135                      ;09A130|9003    |09A135;
						JMP.W clear_bossSlot_02             ;09A132|4C3A87  |09873A;
	
	
			CODE_09A135:
						LDA.B #$01                           ;09A135|A901    |      ;
						STA.W r_orb_flagsTimer               ;09A137|8DF307  |0907F3;
						RTS                                  ;09A13A|60      |      ;
	
	
		setEnityAi_RNG_00:
						LDA.B r_RNG                          ;09A13B|A51F    |00001F;
						BNE CODE_09A141                      ;09A13D|D002    |09A141;
						LDA.B #$65                           ;09A13F|A965    |      ;
	
			CODE_09A141:
						ASL A                                ;09A141|0A      |      ;
						STA.B $00                            ;09A142|8500    |000000;
						LDA.B r_RNG                          ;09A144|A51F    |00001F;
						LSR A                                ;09A146|4A      |      ;
						CLC                                  ;09A147|18      |      ;
						ADC.B $00                            ;09A148|6500    |000000;
						STA.B r_RNG                          ;09A14A|851F    |00001F;
						AND.B #$0F                           ;09A14C|290F    |      ;
						RTS                                  ;09A14E|60      |      ;
	
	

	
	
			bossID__22:
						LDA.B #$00                           ;09A193|A900    |      ;
						STA.W r_entity_damageRelated,X       ;09A195|9D6906  |090669;
						STA.W r_entity_damage,X              ;09A198|9D5706  |090657;
						LDA.B #$C8                           ;09A19B|A9C8    |      ;
						STA.W r_entity_mask,X                ;09A19D|9D7004  |090470;
						LDY.W r_damagActionFlag,X            ;09A1A0|BC1D06  |09061D;
						LDA.W r_entity_AI,Y                  ;09A1A3|B9EF05  |0905EF;
						AND.B #$7F                           ;09A1A6|297F    |      ;
						CMP.B #$0A                           ;09A1A8|C90A    |      ;
						BNE CODE_09A1DB                      ;09A1AA|D02F    |09A1DB;
						LDA.W r_entity_AI_IDX,Y              ;09A1AC|B9C105  |0905C1;
						CMP.B #$06                           ;09A1AF|C906    |      ;
						BNE CODE_09A1D2                      ;09A1B1|D01F    |09A1D2;
						LDA.B #$1C                           ;09A1B3|A91C    |      ;
						STA.B $00                            ;09A1B5|8500    |000000;
						LDA.W r_entity_FacingLeft,Y          ;09A1B7|B9A804  |0904A8;
						BEQ CODE_09A1C0                      ;09A1BA|F004    |09A1C0;
						LDA.B #$E4                           ;09A1BC|A9E4    |      ;
						STA.B $00                            ;09A1BE|8500    |000000;
	
			CODE_09A1C0:
						LDA.W r_entity_XPos,Y                ;09A1C0|B93804  |090438;
						CLC                                  ;09A1C3|18      |      ;
						ADC.B $00                            ;09A1C4|6500    |000000;
						STA.W r_entity_XPos,X                ;09A1C6|9D3804  |090438;
						LDA.W r_entity_YPos,Y                ;09A1C9|B91C04  |09041C;
						STA.W r_entity_YPos,X                ;09A1CC|9D1C04  |09041C;
						JMP.W CODE_09A1DE                    ;09A1CF|4CDEA1  |09A1DE;
	
	
			CODE_09A1D2:
						LDA.B #$20                           ;09A1D2|A920    |      ;
						STA.W r_entity_XPos,X                ;09A1D4|9D3804  |090438;
						STA.W r_entity_YPos,X                ;09A1D7|9D1C04  |09041C;
						RTS                                  ;09A1DA|60      |      ;
	
	
			CODE_09A1DB:
						JMP.W clear_bossSlot_02             ;09A1DB|4C3A87  |09873A;
	
	
			CODE_09A1DE:
						LDA.W r_hardMode                     ;09A1DE|ADF607  |0907F6;
						BNE CODE_09A1F1                      ;09A1E1|D00E    |09A1F1;
						LDA.B r_stage                        ;09A1E3|A532    |000032;
						BEQ CODE_09A1EB                      ;09A1E5|F004    |09A1EB;
						LDA.B #$20                           ;09A1E7|A920    |      ;
						BNE CODE_09A1ED                      ;09A1E9|D002    |09A1ED;
	
			CODE_09A1EB:
						LDA.B #$10                           ;09A1EB|A910    |      ;
	
			CODE_09A1ED:
						STA.W r_entity_damage,X              ;09A1ED|9D5706  |090657;
						RTS                                  ;09A1F0|60      |      ;
	
	
			CODE_09A1F1:
						LDA.B #$30                           ;09A1F1|A930    |      ;
						BNE CODE_09A1ED                      ;09A1F3|D0F8    |09A1ED;
	

			bossID__11:
						JSR.W CODE_09A4B6                    ;09A44B|20B6A4  |09A4B6;
						LDA.W r_entity_damageRelated,X       ;09A44E|BD6906  |090669;
						BNE CODE_09A493                      ;09A451|D040    |09A493;
						LDA.W r_orb_flagsTimer               ;09A453|ADF307  |0907F3;
						BNE CODE_09A493                      ;09A456|D03B    |09A493;
						JSR.W getLowAI                       ;09A458|20C3A4  |09A4C3;
						BNE CODE_09A46E                      ;09A45B|D011    |09A46E;
						LDA.B #$87                           ;09A45D|A987    |      ;
						JSR.W setEnityAi_scriptIDX_01        ;09A45F|204F86  |09864F;
						LDA.B #$0A                           ;09A462|A90A    |      ;
						LDY.B #$05                           ;09A464|A005    |      ;
						db $20                               ;09A466|        |      ;
						dw setSpriteAndAnimGroup_AY_update                       ;09A467|        |0FEF6E;
						LDA.B #$40                           ;09A469|A940    |      ;
						STA.W r_entity_mask,X                ;09A46B|9D7004  |090470;
	
			CODE_09A46E:
						LDA.W r_entity_XPos,X                ;09A46E|BD3804  |090438;
						CMP.B #$FC                           ;09A471|C9FC    |      ;
						BCC CODE_09A477                      ;09A473|9002    |09A477;
						LDA.B #$FB                           ;09A475|A9FB    |      ;
	
			CODE_09A477:
						CMP.B #$04                           ;09A477|C904    |      ;
						BCS CODE_09A47D                      ;09A479|B002    |09A47D;
						LDA.B #$04                           ;09A47B|A904    |      ;
	
			CODE_09A47D:
						STA.W r_entity_XPos,X                ;09A47D|9D3804  |090438;
						LDA.W r_entity_YPos,X                ;09A480|BD1C04  |09041C;
						CMP.B #$F8                           ;09A483|C9F8    |      ;
						BCC CODE_09A489                      ;09A485|9002    |09A489;
						LDA.B #$F7                           ;09A487|A9F7    |      ;
	
			CODE_09A489:
						CMP.B #$40                           ;09A489|C940    |      ;
						BCS CODE_09A48F                      ;09A48B|B002    |09A48F;
						LDA.B #$40                           ;09A48D|A940    |      ;
	
			CODE_09A48F:
						STA.W r_entity_YPos,X                ;09A48F|9D1C04  |09041C;
	
			CODE_09A492:
						RTS                                  ;09A492|60      |      ;
	
	
			CODE_09A493:
						LDA.B #$00                           ;09A493|A900    |      ;
						STA.W r_entity_damage,X              ;09A495|9D5706  |090657;
						LDY.W r_entity_target,X              ;09A498|BC0606  |090606;
						LDA.W r_entity_target,Y              ;09A49B|B90606  |090606;
						BEQ CODE_09A4AA                      ;09A49E|F00A    |09A4AA;
						SEC                                  ;09A4A0|38      |      ;
						SBC.B #$01                           ;09A4A1|E901    |      ;
						BCS CODE_09A4A7                      ;09A4A3|B002    |09A4A7;
						LDA.B #$00                           ;09A4A5|A900    |      ;
	
			CODE_09A4A7:
						STA.W r_entity_target,Y              ;09A4A7|990606  |090606;
	
			CODE_09A4AA:
						JSR.W getLowAI                       ;09A4AA|20C3A4  |09A4C3;
						CMP.B #$32                           ;09A4AD|C932    |      ;
						BEQ CODE_09A492                      ;09A4AF|F0E1    |09A492;
						LDA.B #$32                           ;09A4B1|A932    |      ;
						JMP.W setEnityAi_scriptIDX_01        ;09A4B3|4C4F86  |09864F;
	
	
			CODE_09A4B6:
						LDA.B #$20                           ;09A4B6|A920    |      ;
						LDY.W r_hardMode                     ;09A4B8|ACF607  |0907F6;
						BEQ CODE_09A4BF                      ;09A4BB|F002    |09A4BF;
						LDA.B #$30                           ;09A4BD|A930    |      ;
	
			CODE_09A4BF:
						STA.W r_entity_damage,X              ;09A4BF|9D5706  |090657;
						RTS                                  ;09A4C2|60      |      ;
	
	
				getLowAI:
						LDA.W r_entity_AI,X                  ;09A4C3|BDEF05  |0905EF;
						AND.B #$7F                           ;09A4C6|297F    |      ;	
						RTS                                  ;09A4F1|60      |      ;
	
	

	
	
			bossID__1f:
						LDA.W r_orb_flagsTimer               ;09A530|ADF307  |0907F3;
						BEQ CODE_09A538                      ;09A533|F003    |09A538;
						JMP.W CODE_09A5DC                    ;09A535|4CDCA5  |09A5DC;
	
	
			CODE_09A538:
						LDA.B #$00                           ;09A538|A900    |      ;
						STA.W r_entity_damage,X              ;09A53A|9D5706  |090657;
						STA.W r_entity_damageRelated,X       ;09A53D|9D6906  |090669;
						LDY.W r_entity_Counter,X             ;09A540|BC3306  |090633;
						LDA.W r_entity_AI,Y                  ;09A543|B9EF05  |0905EF;
						AND.B #$7F                           ;09A546|297F    |      ;
						CMP.B #$0E                           ;09A548|C90E    |      ;
						BNE CODE_09A57B                      ;09A54A|D02F    |09A57B;
						LDA.W r_entity_AI_IDX,Y              ;09A54C|B9C105  |0905C1;
						CMP.B #$05                           ;09A54F|C905    |      ;
						BCC CODE_09A57B                      ;09A551|9028    |09A57B;
						LDA.B #$30                           ;09A553|A930    |      ;
						STA.W r_entity_damage,X              ;09A555|9D5706  |090657;
						LDY.W r_entity_Counter,X             ;09A558|BC3306  |090633;
						LDA.B #$10                           ;09A55B|A910    |      ;
						STA.B $00                            ;09A55D|8500    |000000;
						LDA.W r_entity_FacingLeft,Y          ;09A55F|B9A804  |0904A8;
						BEQ CODE_09A568                      ;09A562|F004    |09A568;
						LDA.B #$F0                           ;09A564|A9F0    |      ;
						STA.B $00                            ;09A566|8500    |000000;
	
			CODE_09A568:
						LDA.W r_entity_XPos,Y                ;09A568|B93804  |090438;
						CLC                                  ;09A56B|18      |      ;
						ADC.B $00                            ;09A56C|6500    |000000;
						STA.W r_entity_XPos,X                ;09A56E|9D3804  |090438;
						LDA.W r_entity_YPos,Y                ;09A571|B91C04  |09041C;
						CLC                                  ;09A574|18      |      ;
						ADC.B #$10                           ;09A575|6910    |      ;
						STA.W r_entity_YPos,X                ;09A577|9D1C04  |09041C;
						RTS                                  ;09A57A|60      |      ;
	
	
			CODE_09A57B:
						LDA.B #$00                           ;09A57B|A900    |      ;
						STA.W r_entity_XPos,X                ;09A57D|9D3804  |090438;
						STA.W r_entity_YPos,X                ;09A580|9D1C04  |09041C;
						RTS                                  ;09A583|60      |      ;
	
	
			bossID__20:
						LDA.W r_orb_flagsTimer               ;09A584|ADF307  |0907F3;
						BNE CODE_09A5DC                      ;09A587|D053    |09A5DC;
						LDY.W r_entity_Counter,X             ;09A589|BC3306  |090633;
						LDA.W r_entity_AI,Y                  ;09A58C|B9EF05  |0905EF;
						AND.B #$7F                           ;09A58F|297F    |      ;
						CMP.B #$2F                           ;09A591|C92F    |      ;
						BEQ CODE_09A5DB                      ;09A593|F046    |09A5DB;
						LDA.W r_entity_XPos,Y                ;09A595|B93804  |090438;
						STA.W r_entity_XPos,X                ;09A598|9D3804  |090438;
						LDA.W r_entity_YPos,Y                ;09A59B|B91C04  |09041C;
						SEC                                  ;09A59E|38      |      ;
						SBC.B #$18                           ;09A59F|E918    |      ;
						STA.W r_entity_YPos,X                ;09A5A1|9D1C04  |09041C;
						JSR.W CODE_09A1DE                    ;09A5A4|20DEA1  |09A1DE;
						LDA.B r_HUD_healthBoss               ;09A5A7|A53D    |00003D;
						STA.W r_entity_Health,X              ;09A5A9|9D7B06  |09067B;
						LDA.B #$02                           ;09A5AC|A902    |      ;
						JSR.W setEntity__04                  ;09A5AE|20E088  |0988E0;
						LDY.W r_entity_Counter,X             ;09A5B1|BC3306  |090633;
						LDA.W r_entity_Health,X              ;09A5B4|BD7B06  |09067B;
						STA.W r_entity_Health,Y              ;09A5B7|997B06  |09067B;
						LDA.B #$00                           ;09A5BA|A900    |      ;
						STA.W r_entity_damageRelated,X       ;09A5BC|9D6906  |090669;
						LDA.W r_entity_damageRelated,Y       ;09A5BF|B96906  |090669;
						AND.B #$0F                           ;09A5C2|290F    |      ;
						CMP.B #$02                           ;09A5C4|C902    |      ;
						BEQ CODE_09A5D6                      ;09A5C6|F00E    |09A5D6;
						LDA.W r_entity_AI,Y                  ;09A5C8|B9EF05  |0905EF;
						AND.B #$7F                           ;09A5CB|297F    |      ;
						CMP.B #$0D                           ;09A5CD|C90D    |      ;
						BNE CODE_09A5D6                      ;09A5CF|D005    |09A5D6;
						LDA.B #$00                           ;09A5D1|A900    |      ;
						STA.W r_entity_damageRelated,X       ;09A5D3|9D6906  |090669;
	
			CODE_09A5D6:
						LDA.B #$C8                           ;09A5D6|A9C8    |      ;
						STA.W r_entity_mask,X                ;09A5D8|9D7004  |090470;
	
			CODE_09A5DB:
						RTS                                  ;09A5DB|60      |      ;
	
	
			CODE_09A5DC:
						JMP.W clear_bossSlot_02             ;09A5DC|4C3A87  |09873A;
	
	

	
			bossID__12:
						LDA.W r_orb_flagsTimer               ;09A803|ADF307  |0907F3;
						BPL DATA8_09A80B                     ;09A806|1003    |09A80B;
						JMP.W clear_bossSlot_02             ;09A808|4C3A87  |09873A;
	
	
			DATA8_09A80B:
						db $20                               ;09A80B|        |      ;
						dw setMovmentSpdZero                 ;09A80C|        |0FFEC8;
						LDA.B #$80                           ;09A80E|A980    |      ;
						STA.W r_entity_AI,X                  ;09A810|9DEF05  |0905EF;
						LDA.W r_bossPieces       ;09A813|ADEC07  |0907EC;
						BEQ CODE_09A828                      ;09A816|F010    |09A828;
						CMP.B #$02                           ;09A818|C902    |      ;
						BCC CODE_09A822                      ;09A81A|9006    |09A822;
						LDA.B #$58                           ;09A81C|A958    |      ;
						STA.W r_entity_mask,X                ;09A81E|9D7004  |090470;
						RTS                                  ;09A821|60      |      ;
	
	
			CODE_09A822:
						LDA.B #$50                           ;09A822|A950    |      ;
						STA.W r_entity_mask,X                ;09A824|9D7004  |090470;
						RTS                                  ;09A827|60      |      ;
	
	
			CODE_09A828:
						LDA.W r_misc_movementState,X         ;09A828|BD4506  |090645;
						AND.B #$80                           ;09A82B|2980    |      ;
						BNE CODE_09A84B                      ;09A82D|D01C    |09A84B;
						LDA.W r_entity_Counter,X             ;09A82F|BD3306  |090633;
						BNE CODE_09A847                      ;09A832|D013    |09A847;
						LDA.B #$08                           ;09A834|A908    |      ;
						STA.W r_entity_Counter,X             ;09A836|9D3306  |090633;
						LDA.B #$50                           ;09A839|A950    |      ;
						STA.W r_entity_mask,X                ;09A83B|9D7004  |090470;
						LDA.W r_misc_movementState,X         ;09A83E|BD4506  |090645;
						ORA.B #$80                           ;09A841|0980    |      ;
						STA.W r_misc_movementState,X         ;09A843|9D4506  |090645;
						RTS                                  ;09A846|60      |      ;
	
	
			CODE_09A847:
						DEC.W r_entity_Counter,X             ;09A847|DE3306  |090633;
						RTS                                  ;09A84A|60      |      ;
	
	
			CODE_09A84B:
						LDA.W r_entity_Counter,X             ;09A84B|BD3306  |090633;
						BNE CODE_09A847                      ;09A84E|D0F7    |09A847;
						LDA.B #$58                           ;09A850|A958    |      ;
						STA.W r_entity_mask,X                ;09A852|9D7004  |090470;
						INC.W r_misc_movementState,X         ;09A855|FE4506  |090645;
						LDA.W r_misc_movementState,X         ;09A858|BD4506  |090645;
						AND.B #$7F                           ;09A85B|297F    |      ;
						TAY                                  ;09A85D|A8      |      ;
						CPY.B #$10                           ;09A85E|C010    |      ;
						BNE CODE_09A864                      ;09A860|D002    |09A864;
						LDY.B #$00                           ;09A862|A000    |      ;
	
			CODE_09A864:
						TYA                                  ;09A864|98      |      ;
						STA.W r_misc_movementState,X         ;09A865|9D4506  |090645;
						LDA.W DATA8_09A86F,Y                 ;09A868|B96FA8  |09A86F;
						STA.W r_entity_Counter,X             ;09A86B|9D3306  |090633;
						RTS                                  ;09A86E|60      |      ;
	
	
			DATA8_09A86F:
						db $40,$20,$80,$10                   ;09A86F|        |      ;
						db $60,$90,$30,$C0                   ;09A873|        |      ;
						db $08,$70,$F0,$50                   ;09A877|        |      ;
						db $D0,$A0,$E0,$B0                   ;09A87B|        |      ;
	
			bossID__13:
						JSR.W CODE_09A1DE                    ;09A87F|20DEA1  |09A1DE;
						LDA.W r_orb_flagsTimer               ;09A882|ADF307  |0907F3;
						BEQ CODE_09A88A                      ;09A885|F003    |09A88A;
						JMP.W clear_bossSlot_02             ;09A887|4C3A87  |09873A;
	
	
			CODE_09A88A:
						JSR.W getLowAI                       ;09A88A|20C3A4  |09A4C3;
						CMP.B #$0F                           ;09A88D|C90F    |      ;
						BNE CODE_09A892                      ;09A88F|D001    |09A892;
						RTS                                  ;09A891|60      |      ;
	
	
			CODE_09A892:
						LDA.W r_bossPieces       ;09A892|ADEC07  |0907EC;
						BNE CODE_09A8D1                      ;09A895|D03A    |09A8D1;
						JSR.W CODE_09A91D                    ;09A897|201DA9  |09A91D;
						BNE CODE_09A8BD                      ;09A89A|D021    |09A8BD;
						LDA.W r_entity_mask,X                ;09A89C|BD7004  |090470;
						ORA.B #$98                           ;09A89F|0998    |      ;
						STA.W r_entity_mask,X                ;09A8A1|9D7004  |090470;
						LDA.B #$00                           ;09A8A4|A900    |      ;
						STA.W r_entity_extra,X               ;09A8A6|9DD805  |0905D8;
						LDA.B #$80                           ;09A8A9|A980    |      ;
						STA.W r_misc_movementState,X         ;09A8AB|9D4506  |090645;
						LDA.B #$01                           ;09A8AE|A901    |      ;
						STA.W r_bossPieces       ;09A8B0|8DEC07  |0907EC;
						LDA.B #$D8                           ;09A8B3|A9D8    |      ;
						STA.W r_entity_mask,X                ;09A8B5|9D7004  |090470;
						LDA.B #$0F                           ;09A8B8|A90F    |      ;
						JMP.W setEnityAi_scriptIDX_01        ;09A8BA|4C4F86  |09864F;
	
	
			CODE_09A8BD:
						DEC.W r_misc_movementState,X         ;09A8BD|DE4506  |090645;
						BPL CODE_09A8D0                      ;09A8C0|100E    |09A8D0;
						LDY.W r_misc_movementState,X         ;09A8C2|BC4506  |090645;
						INY                                  ;09A8C5|C8      |      ;
						BNE CODE_09A8D0                      ;09A8C6|D008    |09A8D0;
						LDA.W r_entity_extra,X               ;09A8C8|BDD805  |0905D8;
						BEQ CODE_09A8D0                      ;09A8CB|F003    |09A8D0;
						DEC.W r_entity_extra,X               ;09A8CD|DED805  |0905D8;
	
			CODE_09A8D0:
						RTS                                  ;09A8D0|60      |      ;
	
	
			CODE_09A8D1:
						LDA.W r_entity_AI_IDX,X              ;09A8D1|BDC105  |0905C1;
						STA.W r_bossPieces       ;09A8D4|8DEC07  |0907EC;
						JSR.W getLowAI                       ;09A8D7|20C3A4  |09A4C3;
						BNE CODE_09A8F9                      ;09A8DA|D01D    |09A8F9;
						LDA.B #$00                           ;09A8DC|A900    |      ;
						STA.W r_bossPieces       ;09A8DE|8DEC07  |0907EC;
						STA.W r_misc_movementState,X         ;09A8E1|9D4506  |090645;
						LDA.B #$01                           ;09A8E4|A901    |      ;
						STA.W r_entity_extra,X               ;09A8E6|9DD805  |0905D8;
						LDA.B #$D8                           ;09A8E9|A9D8    |      ;
						STA.W r_entity_mask,X                ;09A8EB|9D7004  |090470;
						LDA.B #$48                           ;09A8EE|A948    |      ;
						STA.W r_entity_XPos,X                ;09A8F0|9D3804  |090438;
						STA.W r_entity_YPos,X                ;09A8F3|9D1C04  |09041C;
						JSR.W CODE_09A926                    ;09A8F6|2026A9  |09A926;
	
			CODE_09A8F9:
						LDA.W r_entity_AI,X                  ;09A8F9|BDEF05  |0905EF;
						CMP.B #$0F                           ;09A8FC|C90F    |      ;
						BNE CODE_09A914                      ;09A8FE|D014    |09A914;
						LDA.W r_entity_AI_IDX,X              ;09A900|BDC105  |0905C1;
						CMP.B #$05                           ;09A903|C905    |      ;
						BCC CODE_09A914                      ;09A905|900D    |09A914;
						CMP.B #$08                           ;09A907|C908    |      ;
						BCS CODE_09A914                      ;09A909|B009    |09A914;
						LDA.W r_entity_mask,X                ;09A90B|BD7004  |090470;
						AND.B #$EF                           ;09A90E|29EF    |      ;
						STA.W r_entity_mask,X                ;09A910|9D7004  |090470;
						RTS                                  ;09A913|60      |      ;
	
	
			CODE_09A914:
						LDA.W r_entity_mask,X                ;09A914|BD7004  |090470;
						ORA.B #$10                           ;09A917|0910    |      ;
						STA.W r_entity_mask,X                ;09A919|9D7004  |090470;
						RTS                                  ;09A91C|60      |      ;
	
	
			CODE_09A91D:
						LDA.W r_misc_movementState,X         ;09A91D|BD4506  |090645;
						BNE CODE_09A925                      ;09A920|D003    |09A925;
						LDA.W r_entity_extra,X               ;09A922|BDD805  |0905D8;
	
			CODE_09A925:
						RTS                                  ;09A925|60      |      ;
	
	
			CODE_09A926:
						LDA.B #$03                           ;09A926|A903    |      ;
						STA.W r_entity_extra,X               ;09A928|9DD805  |0905D8;
						LDA.B #$80                           ;09A92B|A980    |      ;
						STA.W r_misc_movementState,X         ;09A92D|9D4506  |090645;
						RTS                                  ;09A930|60      |      ;
	
	


	
			bossID__21:
						LDY.W $07EF                          ;09AC01|ACEF07  |0907EF;
						DEY                                  ;09AC04|88      |      ;
						BEQ CODE_09AC3A                      ;09AC05|F033    |09AC3A;
						LDA.B #$01                           ;09AC07|A901    |      ;
						JSR.W setEntity__04                  ;09AC09|20E088  |0988E0;
						LDY.W r_entity_target,X              ;09AC0C|BC0606  |090606;
						LDA.B #$04                           ;09AC0F|A904    |      ;
						STA.B $00                            ;09AC11|8500    |000000;
						LDA.W r_entity_FacingLeft,Y          ;09AC13|B9A804  |0904A8;
						BNE CODE_09AC1C                      ;09AC16|D004    |09AC1C;
						LDA.B #$FC                           ;09AC18|A9FC    |      ;
						STA.B $00                            ;09AC1A|8500    |000000;
	
			CODE_09AC1C:
						LDA.W r_entity_XPos,Y                ;09AC1C|B93804  |090438;
						CLC                                  ;09AC1F|18      |      ;
						ADC.B $00                            ;09AC20|6500    |000000;
						STA.W r_entity_XPos,X                ;09AC22|9D3804  |090438;
						LDA.W r_entity_YPos,Y                ;09AC25|B91C04  |09041C;
						SEC                                  ;09AC28|38      |      ;
						SBC.B #$20                           ;09AC29|E920    |      ;
						STA.W r_entity_YPos,X                ;09AC2B|9D1C04  |09041C;
						LDA.W r_entity_Health,X              ;09AC2E|BD7B06  |09067B;
						STA.W r_entity_Health,Y              ;09AC31|997B06  |09067B;
						LDA.B #$00                           ;09AC34|A900    |      ;
						STA.W r_entity_damageRelated,X       ;09AC36|9D6906  |090669;
						RTS                                  ;09AC39|60      |      ;
	
	
			CODE_09AC3A:
						JMP.W clear_bossSlot_02             ;09AC3A|4C3A87  |09873A;                      

}



; -- free space bank 9 



assert pc() <= $C000
pad $28000
}					

