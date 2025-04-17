

; -- hijacks ------------------------------------------------------------------------
org LAST_BANK+$153E
base $F53E
		jsr processColWeapons             
org LAST_BANK+$15EA
base $F5EA
		jsr processColWeapons
org LAST_BANK+$17FF
base $F7FF
		jsr processColWeapons 		
org LAST_BANK+$1914
base $F914
		jsr processColWeapons            


org $067B1
base $A7B1
		thunderTitleScreen: 							
			dw titleLighning_screenLoad_00      ;01A7B1|        |02B6CA;
			dw thunderTitleScreen_02            ;01A7B3|        |02B7E1;
			dw thunderTitleScreen_04            ;01A7B5|        |02B99A;
			dw thunderTitleScreen_06            ;01A7B7|        |02BA77;
			dw thunderTitleScreen_08            ;01A7B9|        |02BA7C;
			dw thunderTitleScreen_0A            ;01A7BB|        |02BABC;
			dw thunderTitleScreen_0C            ;01A7BD|        |02BADD;
			dw thunderTitleScreen_0E            ;01A7BF|        |02B8C5;
			dw newScreenLoad					;01A7C1|        |0FEC04;

org $08332
base $8332
			JSR.W CODE_02AF64                    ;028332|2064AF  |02AF64;
			
org $08063
base $8063
			dw CODE_02AC02                       ;028063|        |02AC02;
			dw CODE_02ABF1                       ;028065|        |02ABF1;
			dw CODE_02AC13                       ;028067|        |02AC13;
			dw CODE_02AAE7                       ;028069|        |02AAE7;

			getMiscDataPointer = $9EA5
			CODE_0294E2 = $94E2
			CODE_0294E7 = $94E7
			miscID_breakableWall_10 = $9CC0         
			miscID_breakableWall_highRoom_11 = $9CA4 

   

{ ; -- misc spawn tabels    
org $0A04F       
base $A04F	
		miscID_routine:
                       dw miscID_blockPlatform_00           ;02A04F|        |02A6EA;
                       dw miscID_scalePlatform_01           ;02A051|        |02A738;
                       dw miscID_turningPlatform_02         ;02A053|        |02A78B;
                       dw miscID_turningSpikePlatform_03    ;02A055|        |02A787;
                       dw miscID_gear_04                    ;02A057|        |02A874;
                       dw miscID_pandelum_05                ;02A059|        |02A95C;
                       dw miscID_spikePlatform_06           ;02A05B|        |02A9C6;
                       dw miscID_crusher_07                 ;02A05D|        |02A9CA;
                       dw miscID_fallingBlocks_08           ;02A05F|        |02AA3A;
                       dw miscID_drips_09                   ;02A061|        |02AA36;
                       dw miscID_gear_0A_0E_0F              ;02A063|        |02A870;
                       dw miscID_movingPlatform_0B          ;02A065|        |02AB09;
                       dw miscID__0C                        ;02A067|        |02AB18;
                       dw miscID__0D                        ;02A069|        |02AB1C;
                       dw miscID_gear_0A_0E_0F              ;02A06B|        |02A870;
                       dw miscID_gear_0A_0E_0F              ;02A06D|        |02A870;
                       dw miscID_breakableWall_10           ;02A06F|        |029CC0;
                       dw miscID_breakableWall_highRoom_11  ;02A071|        |029CA4;
		
		!prePatch = 0
			incsrc "code/prePatch/miscAssigne.asm" 	

		!miscSpawnData_manualEdit = 0 
		
		if !miscSpawnData_manualEdit == 0  		
		; this will copie what you have done with the revamp 	
			incbin "rom/Castlevania_3.nes":($A199)+$10..($A6E9)+$10 	
		else 
		; revamp could handle pointer changes and it can be solved more elegant to edit expanded tables in revamp.
		; But you need to understand what you are doing. This example should give you the right idea.

		
		miscEventID_spawnData:
                       dw miscID_spawn__00                  ;02A199|        |02A21F;
                       dw miscID_spawn__01                  ;02A19B|        |02A230;
                       dw miscID_spawn__02                  ;02A19D|        |02A269;
                       dw miscID_spawn__03                  ;02A19F|        |02A28A;
                       dw miscID_spawn__04                  ;02A1A1|        |02A29B;
                       dw miscID_spawn__05                  ;02A1A3|        |02A2AC;
                       dw miscID_spawn__06                  ;02A1A5|        |02A2B5;
                       dw miscID_spawn__07                  ;02A1A7|        |02A2BE;
                       dw miscID_spawn__08                  ;02A1A9|        |02A2CF;
                       dw miscID_spawn__09                  ;02A1AB|        |02A2F0;
                       dw miscID_spawn__0A                  ;02A1AD|        |02A2F9;
                       dw miscID_spawn__0B                  ;02A1AF|        |02A32C;
                       dw miscID_spawn__0C                  ;02A1B1|        |02A347;
                       dw miscID_spawn__0D                  ;02A1B3|        |02A372;
                       dw miscID_spawn__0E                  ;02A1B5|        |02A38C;
                       dw miscID_spawn__0F                  ;02A1B7|        |02A3C7;
                       dw miscID_spawn__10                  ;02A1B9|        |02A3FA;
                       dw miscID_spawn__11                  ;02A1BB|        |02A403;
                       dw miscID_spawn__12                  ;02A1BD|        |02A41C;
                       dw miscID_spawn__13                  ;02A1BF|        |02A42E;
                       dw miscID_spawn__14                  ;02A1C1|        |02A470;
                       dw miscID_spawn__FF_15               ;02A1C3|        |02A491;
                       dw miscID_spawn__16                  ;02A1C5|        |02A492;
                       dw miscID_spawn__FF_17               ;02A1C7|        |02A49B;
                       dw miscID_spawn__18                  ;02A1C9|        |02A49C;
                       dw miscID_spawn__FF_19               ;02A1CB|        |02A4A5;
                       dw miscID_spawn__00                  ;02A1CD|        |02A21F;
                       dw miscID_spawn__1A                  ;02A1CF|        |02A323;
                       dw miscID_spawn__1B                  ;02A1D1|        |02A335;
                       dw miscID_spawn__1C                  ;02A1D3|        |02A33E;
                       dw miscID_spawn__1D                  ;02A1D5|        |02A383;
                       dw miscID_spawn__1E                  ;02A1D7|        |02A3B5;
                       dw miscID_spawn__1F                  ;02A1D9|        |02A3BE;
                       dw miscID_spawn__20                  ;02A1DB|        |02A3D0;
                       dw miscID_spawn__21                  ;02A1DD|        |02A3D9;
                       dw miscID_spawn__22                  ;02A1DF|        |02A425;
                       dw miscID_spawn__23                  ;02A1E1|        |02A361;
                       dw miscID_spawn__24                  ;02A1E3|        |02A31A;
                       dw miscID_spawn__25                  ;02A1E5|        |02A467;
                       dw miscID_spawn__26                  ;02A1E7|        |02A5AC;
                       dw miscID_spawn__27                  ;02A1E9|        |02A358;
                       dw miscID_spawn__28                  ;02A1EB|        |02A577;
                       dw miscID_spawn__29                  ;02A1ED|        |02A588;
                       dw miscID_spawn__2A                  ;02A1EF|        |02A591;
                       dw miscID_spawn__2B                  ;02A1F1|        |02A59A;
                       dw miscID_spawn__2C                  ;02A1F3|        |02A5BD;
                       dw miscID_spawn__2D                  ;02A1F5|        |02A5CF;
                       dw miscID_spawn__2E                  ;02A1F7|        |02A5C6;
                       dw miscID_spawn__2F                  ;02A1F9|        |02A5D8;
                       dw miscID_spawn__30                  ;02A1FB|        |02A54D;
                       dw miscID_spawn__31                  ;02A1FD|        |02A53B;
                       dw miscID_spawn__32                  ;02A1FF|        |02A621;
                       dw miscID_spawn__33                  ;02A201|        |02A52A;
                       dw miscID_spawn__34                  ;02A203|        |02A521;
                       dw miscID_spawn__35                  ;02A205|        |02A4B8;
                       dw miscID_spawn__36                  ;02A207|        |02A64B;
                       dw miscID_spawn__37                  ;02A209|        |02A664;
                       dw miscID_spawn__38                  ;02A20B|        |02A67D;
                       dw miscID_spawn__39                  ;02A20D|        |02A69E;
                       dw miscID_spawn__3A                  ;02A20F|        |02A4AF;
                       dw miscID_spawn__3B                  ;02A211|        |02A6BF;
                       dw miscID_spawn__3C                  ;02A213|        |02A544;
                       dw miscID_spawn__3D                  ;02A215|        |02A56E;
                       dw miscID_spawn__3E                  ;02A217|        |02A5A3;
                       dw miscID_spawn__3F                  ;02A219|        |02A642;
                       dw miscID_spawn__40                  ;02A21B|        |02A6E0;
                       dw miscID_spawn__41                  ;02A21D|        |02A4A6;
	

;						   +-----------------------------	| ??			|	
;					   	   |	+------------------------	| xPosLo	 	|
;					   	   |	|	+--------------------	| xPosHi	 	|	
;					   	   |	|	|	+----------------	| ID		 	|
;						   |	|	|	|                    
;						   |	|	|	|	+------------	| yPosLo		|	
;					   	   |	|	|	|	|	+--------	| yPosHi		|
;					   	   |	|	|	|	|	|	+----	| repeat	 	|	
;					   	   |	|	|	|	|	|	|  +-	| ??		 	|
;						   |	|	|	|	|	|	|  |		
		miscID_spawn__00:
						db $00,$18,$00,$10,$B0,$00,$01,$00   ;02A21F|        |      ;
						db $00,$88,$00,$10,$A8,$01,$00,$01   ;02A227|        |      ;			   
						db $FF                               ;02A22F|        |      ;
	
		miscID_spawn__01:
						db $00,$B0,$10,$02,$64,$01,$00,$00   ;02A230|        |      ;
						db $01,$50,$10,$02,$B4,$01,$01,$00   ;02A238|        |      ;
						db $01,$90,$10,$02,$64,$01,$02,$00   ;02A240|        |      ;
						db $01,$D0,$10,$02,$64,$01,$03,$00   ;02A248|        |      ;
						db $02,$10,$10,$02,$64,$01,$04,$00   ;02A250|        |      ;
						db $02,$10,$10,$02,$B4,$01,$05,$00   ;02A258|        |      ;
						db $02,$30,$10,$02,$64,$01,$06,$00   ;02A260|        |      ;				   
						db $FF                               ;02A268|        |      ;
	
		miscID_spawn__02:
						db $00,$AD,$00,$11,$18,$03,$01,$00   ;02A269|        |      ;
						db $00,$BD,$40,$0A,$60,$00,$01,$00   ;02A271|        |      ;
						db $02,$7D,$40,$0A,$40,$00,$00,$00   ;02A279|        |      ;
						db $02,$AD,$00,$11,$E8,$01,$01,$01   ;02A281|        |      ;
						db $FF                               ;02A289|        |      ;
	
		miscID_spawn__03:
						db $00,$60,$40,$05,$30,$00,$00,$00   ;02A28A|        |      ;
						db $01,$50,$40,$05,$30,$01,$FF,$00   ;02A292|        |      ;
						db $FF                               ;02A29A|        |      ;
	
		miscID_spawn__04:
						db $00,$18,$00,$10,$B0,$01,$01,$00   ;02A29B|        |      ;
						db $01,$20,$40,$04,$DE,$01,$02,$00   ;02A2A3|        |      ;
						db $FF                               ;02A2AB|        |      ;
	
		miscID_spawn__05:
						db $00,$9D,$40,$0A,$80,$00,$03,$00   ;02A2AC|        |      ;
						db $FF                               ;02A2B4|        |      ;
	
		miscID_spawn__06:
						db $00,$E8,$00,$10,$50,$04,$01,$01   ;02A2B5|        |      ;
						db $FF                               ;02A2BD|        |      ;
	
		miscID_spawn__07:
						db $00,$60,$40,$04,$E0,$01,$05,$00   ;02A2BE|        |      ;
						db $00,$E8,$00,$10,$90,$03,$01,$00   ;02A2C6|        |      ;
						db $FF                               ;02A2CE|        |      ;
	
		miscID_spawn__08:
						db $00,$7D,$40,$0A,$C0,$00,$08,$00   ;02A2CF|        |      ;
						db $02,$05,$00,$11,$28,$02,$00,$01   ;02A2D7|        |      ;
						db $02,$5D,$40,$0A,$20,$00,$07,$00   ;02A2DF|        |      ;
						db $02,$7D,$40,$0A,$60,$00,$06,$00   ;02A2E7|        |      ;
						db $FF                               ;02A2EF|        |      ;
	
		miscID_spawn__09:
						db $01,$E8,$00,$10,$70,$00,$01,$02   ;02A2F0|        |      ;
						db $FF                               ;02A2F8|        |      ;
	
		miscID_spawn__0A:
						db $01,$30,$10,$07,$00,$01,$04,$00   ;02A2F9|        |      ;
						db $01,$70,$10,$07,$00,$01,$05,$00   ;02A301|        |      ;
						db $01,$B0,$10,$07,$00,$01,$06,$00   ;02A309|        |      ;
						db $02,$E8,$00,$10,$B0,$03,$01,$00   ;02A311|        |      ;
						db $FF                               ;02A319|        |      ;
	
		miscID_spawn__24:
						db $03,$78,$00,$10,$68,$00,$00,$00   ;02A31A|        |      ;
						db $FF                               ;02A322|        |      ;
	
		miscID_spawn__1A:
						db $01,$28,$00,$10,$A8,$00,$00,$00   ;02A323|        |      ;
						db $FF                               ;02A32B|        |      ;
	
		miscID_spawn__0B:
						db $00,$D0,$30,$01,$50,$00,$00,$00   ;02A32C|        |      ;
						db $FF                               ;02A334|        |      ;
	
		miscID_spawn__1B:
						db $04,$E8,$00,$10,$90,$00,$01,$00   ;02A335|        |      ;
						db $FF                               ;02A33D|        |      ;
	
		miscID_spawn__1C:
						db $02,$E8,$00,$10,$50,$00,$01,$00   ;02A33E|        |      ;
						db $FF                               ;02A346|        |      ;
	
		miscID_spawn__0C:
						db $01,$70,$30,$01,$60,$01,$00,$00   ;02A347|        |      ;
						db $01,$D0,$30,$01,$80,$02,$00,$00   ;02A34F|        |      ;
						db $FF                               ;02A357|        |      ;
	
		miscID_spawn__27:
						db $00,$38,$00,$10,$98,$03,$00,$00   ;02A358|        |      ;
						db $FF                               ;02A360|        |      ;
	
		miscID_spawn__23:
						db $01,$C0,$C0,$0D,$80,$00,$00,$00   ;02A361|        |      ;
						db $03,$70,$80,$0D,$80,$00,$00,$02   ;02A369|        |      ;
						db $FF                               ;02A371|        |      ;
	
		miscID_spawn__0D:
						db $00,$70,$10,$03,$A8,$01,$07,$00   ;02A372|        |      ;
						db $01,$30,$10,$03,$88,$01,$08,$00   ;02A37A|        |      ;
						db $FF                               ;02A382|        |      ;
	
		miscID_spawn__1D:
						db $00,$E8,$00,$10,$58,$00,$00,$00   ;02A383|        |      ;
						db $FF                               ;02A38B|        |      ;
	
		miscID_spawn__0E:
						db $00,$18,$00,$10,$B0,$04,$01,$00   ;02A38C|        |      ;
						db $00,$50,$10,$03,$88,$01,$09,$00   ;02A394|        |      ;
						db $00,$B0,$10,$03,$88,$01,$0A,$00   ;02A39C|        |      ;
						db $00,$D0,$10,$03,$C8,$01,$0B,$00   ;02A3A4|        |      ;
						db $01,$10,$10,$03,$88,$01,$0C,$00   ;02A3AC|        |      ;
						db $FF                               ;02A3B4|        |      ;
	
		miscID_spawn__1E:
						db $02,$48,$00,$10,$88,$00,$00,$00   ;02A3B5|        |      ;
						db $FF                               ;02A3BD|        |      ;
	
		miscID_spawn__1F:
						db $03,$E8,$00,$10,$48,$00,$00,$00   ;02A3BE|        |      ;
						db $FF                               ;02A3C6|        |      ;
	
		miscID_spawn__0F:
						db $00,$C8,$10,$00,$86,$00,$00,$00   ;02A3C7|        |      ;
						db $FF                               ;02A3CF|        |      ;
	
		miscID_spawn__20:
						db $00,$38,$00,$10,$A0,$00,$01,$00   ;02A3D0|        |      ;
						db $FF                               ;02A3D8|        |      ;
	
		miscID_spawn__21:
						db $01,$34,$30,$0C,$98,$30,$83,$00   ;02A3D9|        |      ;
						db $01,$D0,$00,$0B,$88,$02,$02,$00   ;02A3E1|        |      ;
						db $03,$B8,$00,$10,$A8,$00,$00,$00   ;02A3E9|        |      ;
						db $04,$38,$00,$10,$88,$02,$00,$01   ;02A3F1|        |      ;
						db $FF                               ;02A3F9|        |      ;
	
		miscID_spawn__10:
						db $01,$40,$08,$09,$00,$00,$00,$00   ;02A3FA|        |      ;
						db $FF                               ;02A402|        |      ;
	
		miscID_spawn__11:
						db $01,$80,$08,$09,$00,$02,$00,$00   ;02A403|        |      ;
						db $01,$E8,$00,$10,$B0,$02,$01,$00   ;02A40B|        |      ;
						db $01,$E8,$00,$10,$C8,$00,$00,$01   ;02A413|        |      ;
						db $FF                               ;02A41B|        |      ;
	
		miscID_spawn__12:
						db $00,$80,$08,$09,$00,$01,$00,$00   ;02A41C|        |      ;
						db $FF                               ;02A424|        |      ;
	
		miscID_spawn__22:
						db $00,$E0,$00,$0B,$AC,$04,$02,$00   ;02A425|        |      ;
						db $FF                               ;02A42D|        |      ;
	
		miscID_spawn__13:
						db $00,$90,$10,$06,$00,$01,$00,$00   ;02A42E|        |      ;
						db $00,$D0,$10,$06,$00,$01,$03,$00   ;02A436|        |      ;
						db $01,$10,$10,$06,$00,$01,$02,$00   ;02A43E|        |      ;
						db $01,$70,$10,$07,$00,$01,$01,$00   ;02A446|        |      ;
						db $01,$90,$10,$07,$00,$01,$07,$00   ;02A44E|        |      ;
						db $02,$B8,$00,$10,$58,$00,$00,$00   ;02A456|        |      ;
						db $03,$D0,$20,$0B,$90,$20,$02,$00   ;02A45E|        |      ;
						db $FF                               ;02A466|        |      ;
	
		miscID_spawn__25:
						db $03,$A8,$00,$10,$90,$01,$01,$00   ;02A467|        |      ;
						db $FF                               ;02A46F|        |      ;
	
		miscID_spawn__14:
						db $00,$D8,$00,$10,$88,$03,$00,$00   ;02A470|        |      ;
						db $01,$80,$08,$08,$30,$03,$00,$00   ;02A478|        |      ;
						db $02,$18,$00,$10,$88,$01,$00,$01   ;02A480|        |      ;
						db $03,$C0,$08,$08,$30,$04,$00,$00   ;02A488|        |      ;
						db $FF                               ;02A490|        |      ;
		miscID_spawn__FF_15: 
						db $FF                               ;02A491|     	
	
		miscID_spawn__16:
						db $04,$A8,$00,$10,$88,$01,$00,$00   ;02A492|        |      ;
						db $FF                               ;02A49A|        |      ;
		miscID_spawn__FF_17: 
						db $FF                               ;02A49B|  
		miscID_spawn__18:
						db $03,$08,$00,$10,$88,$00,$00,$00   ;02A49C|        |      ;
						db $FF                               ;02A4A4|        |      ;
		miscID_spawn__FF_19: 
						db $FF                               ;02A4A5|  
		miscID_spawn__41:
						db $04,$E8,$00,$10,$50,$04,$01,$00   ;02A4A6|        |      ;
						db $FF                               ;02A4AE|        |      ;
	
		miscID_spawn__3A:
						db $01,$40,$08,$08,$80,$07,$00,$00   ;02A4AF|        |      ;
						db $FF                               ;02A4B7|        |      ;
	
		miscID_spawn__35:
						db $00,$B0,$10,$03,$88,$01,$0D,$00   ;02A4B8|        |      ;
						db $00,$D0,$10,$02,$84,$01,$0E,$00   ;02A4C0|        |      ;
						db $00,$F0,$10,$02,$84,$01,$0F,$00   ;02A4C8|        |      ;
						db $01,$10,$10,$03,$88,$01,$10,$00   ;02A4D0|        |      ;
						db $01,$30,$10,$02,$84,$01,$11,$00   ;02A4D8|        |      ;
						db $01,$50,$10,$03,$88,$01,$12,$00   ;02A4E0|        |      ;
						db $01,$70,$10,$02,$84,$01,$13,$00   ;02A4E8|        |      ;
						db $01,$B0,$10,$02,$84,$01,$14,$00   ;02A4F0|        |      ;
						db $01,$D0,$10,$03,$88,$01,$15,$00   ;02A4F8|        |      ;
						db $02,$10,$10,$02,$A4,$01,$16,$00   ;02A500|        |      ;
						db $02,$50,$10,$03,$A8,$01,$17,$00   ;02A508|        |      ;
						db $02,$70,$10,$02,$A4,$01,$18,$00   ;02A510|        |      ;
						db $02,$90,$10,$03,$A8,$01,$19,$00   ;02A518|        |      ;
						db $FF                               ;02A520|        |      ;
	
		miscID_spawn__34:
						db $00,$80,$08,$09,$00,$06,$00,$00   ;02A521|        |      ;
						db $FF                               ;02A529|        |      ;
	
		miscID_spawn__33:
						db $00,$18,$00,$10,$B0,$01,$01,$00   ;02A52A|        |      ;
						db $00,$80,$08,$09,$00,$05,$00,$00   ;02A532|        |      ;
						db $FF                               ;02A53A|        |      ;
	
		miscID_spawn__31:
						db $01,$80,$C0,$0D,$80,$00,$00,$04   ;02A53B|        |      ;
						db $FF                               ;02A543|        |      ;
	
		miscID_spawn__3C:
						db $00,$18,$00,$10,$B0,$00,$01,$00   ;02A544|        |      ;
						db $FF                               ;02A54C|        |      ;
	
		miscID_spawn__30:
						db $00,$18,$00,$10,$B0,$04,$01,$00   ;02A54D|        |      ;
						db $00,$40,$00,$0B,$A8,$08,$02,$00   ;02A555|        |      ;
						db $00,$A0,$60,$0C,$78,$18,$02,$00   ;02A55D|        |      ;
						db $01,$E0,$20,$0B,$A0,$10,$02,$00   ;02A565|        |      ;
						db $FF                               ;02A56D|        |      ;
	
		miscID_spawn__3D:
						db $00,$28,$00,$10,$68,$00,$00,$00   ;02A56E|        |      ;
						db $FF                               ;02A576|        |      ;
	
		miscID_spawn__28:
						db $02,$00,$F0,$0D,$00,$00,$00,$06   ;02A577|        |      ;
						db $03,$E8,$00,$10,$A0,$03,$01,$00   ;02A57F|        |      ;
						db $FF                               ;02A587|        |      ;
	
		miscID_spawn__29:
						db $00,$98,$00,$10,$60,$00,$01,$00   ;02A588|        |      ;
						db $FF                               ;02A590|        |      ;
	
		miscID_spawn__2A:
						db $01,$18,$00,$10,$A8,$01,$00,$00   ;02A591|        |      ;
						db $FF                               ;02A599|        |      ;
	
		miscID_spawn__2B:
						db $01,$E8,$00,$10,$78,$01,$00,$00   ;02A59A|        |      ;
						db $FF                               ;02A5A2|        |      ;
	
		miscID_spawn__3E:
						db $01,$E8,$00,$10,$C0,$00,$01,$00   ;02A5A3|        |      ;
						db $FF                               ;02A5AB|        |      ;
	
		miscID_spawn__26:
						db $00,$18,$00,$10,$C0,$03,$01,$00   ;02A5AC|        |      ;
						db $01,$C8,$10,$00,$96,$00,$00,$00   ;02A5B4|        |      ;
						db $FF                               ;02A5BC|        |      ;
	
		miscID_spawn__2C:
						db $04,$58,$00,$10,$B8,$01,$00,$00   ;02A5BD|        |      ;
						db $FF                               ;02A5C5|        |      ;
	
		miscID_spawn__2E:
						db $00,$E8,$00,$10,$B0,$00,$01,$01   ;02A5C6|        |      ;
						db $FF                               ;02A5CE|        |      ;
	
		miscID_spawn__2D:
						db $02,$2D,$00,$11,$E8,$04,$04,$00   ;02A5CF|        |      ;
						db $FF                               ;02A5D7|        |      ;
	
		miscID_spawn__2F:
						db $01,$28,$00,$10,$B0,$03,$01,$00   ;02A5D8|        |      ;
						db $01,$B0,$10,$02,$A4,$01,$1C,$00   ;02A5E0|        |      ;
						db $01,$D0,$10,$03,$A8,$01,$1D,$00   ;02A5E8|        |      ;
						db $01,$F0,$10,$02,$A4,$01,$1E,$00   ;02A5F0|        |      ;
						db $02,$10,$10,$03,$A8,$01,$1F,$00   ;02A5F8|        |      ;
						db $02,$30,$10,$03,$A8,$01,$20,$00   ;02A600|        |      ;
						db $02,$50,$10,$03,$A8,$01,$21,$00   ;02A608|        |      ;
						db $02,$70,$10,$03,$A8,$01,$22,$00   ;02A610|        |      ;
						db $02,$90,$10,$02,$A4,$01,$23,$00   ;02A618|        |      ;
						db $FF                               ;02A620|        |      ;
	
		miscID_spawn__32:
						db $00,$28,$20,$01,$60,$03,$00,$00   ;02A621|        |      ;
						db $01,$28,$20,$01,$60,$04,$00,$00   ;02A629|        |      ;
						db $01,$98,$20,$01,$70,$05,$00,$00   ;02A631|        |      ;
						db $02,$98,$20,$01,$70,$06,$00,$00   ;02A639|        |      ;
						db $FF                               ;02A641|        |      ;
	
		miscID_spawn__3F:
						db $01,$E8,$00,$10,$B0,$00,$01,$00   ;02A642|        |      ;
						db $FF                               ;02A64A|        |      ;
	
		miscID_spawn__36:
						db $00,$90,$40,$05,$30,$02,$FF,$00   ;02A64B|        |      ;
						db $01,$80,$40,$05,$30,$03,$FF,$00   ;02A653|        |      ;
						db $02,$70,$40,$05,$30,$04,$00,$00   ;02A65B|        |      ;
						db $FF                               ;02A663|        |      ;
	
		miscID_spawn__37:
						db $00,$5D,$40,$0A,$80,$00,$09,$00   ;02A664|        |      ;
						db $00,$7D,$40,$0A,$40,$00,$0A,$00   ;02A66C|        |      ;
						db $02,$9D,$40,$0A,$80,$00,$0B,$00   ;02A674|        |      ;
						db $FF                               ;02A67C|        |      ;
	
		miscID_spawn__38:
						db $00,$D4,$48,$0C,$C8,$28,$02,$00   ;02A67D|        |      ;
						db $01,$30,$F0,$0C,$78,$40,$02,$00   ;02A685|        |      ;
						db $01,$74,$F0,$0C,$C0,$28,$82,$00   ;02A68D|        |      ;
						db $02,$88,$00,$10,$98,$01,$00,$00   ;02A695|        |      ;
						db $FF                               ;02A69D|        |      ;
	
		miscID_spawn__39:
						db $00,$7F,$60,$0C,$A8,$11,$82,$00   ;02A69E|        |      ;
						db $01,$78,$60,$0C,$A8,$30,$02,$00   ;02A6A6|        |      ;
						db $02,$18,$60,$0C,$A8,$20,$02,$00   ;02A6AE|        |      ;
						db $03,$48,$00,$10,$38,$00,$00,$00   ;02A6B6|        |      ;
						db $FF                               ;02A6BE|        |      ;
	
						
		miscID_spawn__3B:
						db $00,$90,$10,$07,$00,$01,$08,$00   ;02A6BF|        |      ;
						db $00,$D0,$10,$06,$00,$01,$09,$00   ;02A6C7|        |      ;
						db $00,$F0,$10,$07,$00,$01,$0A,$00   ;02A6CF|        |      ;
						db $01,$70,$10,$07,$00,$01,$0B,$00   ;02A6D7|        |      ;
						db $FF                               ;02A6DF|        |      ;
	
		miscID_spawn__40:
						db $00,$80,$08,$08,$30,$08,$00,$00   ;02A6E0|        |      ;
						db $FF                               ;02A6E8|        |      ;
		
		
		endif 
		
 
 
{ ; -- misc routines ---------------------------------------------------------------
		CODE_02A6E9:
                       RTS                                  ;02A6E9|60      |      ;
 
 
		miscID_blockPlatform_00:
                       LDA.B r_bridgeTimer                  ;02A6EA|A5B3    |0000B3;
                       BNE CODE_02A71E                      ;02A6EC|D030    |02A71E;
                       LDA.B #$00                           ;02A6EE|A900    |      ;
                       STA.B r_collisionPointYinScreen      ;02A6F0|8511    |000011;
                       LDA.B #$79                           ;02A6F2|A979    |      ;
                       STA.B $01                            ;02A6F4|8501    |000001;
                       JSR.W setCollusionStuff              ;02A6F6|2076AA  |02AA76;
                       jsr findEmptyEntitySlot          ;02A6FA|        |0FFEB9;
                       BNE CODE_02A6E9                      ;02A6FC|D0EB    |02A6E9;
                       LDA.B #$14                           ;02A6FE|A914    |      ;
                       STA.W $07ED                          ;02A700|8DED07  |0207ED;
                       LDA.B r_stage                        ;02A703|A532    |000032;
                       CMP.B #$05                           ;02A705|C905    |      ;
                       BEQ CODE_02A70E                      ;02A707|F005    |02A70E;
                       LDA.B #$30                           ;02A709|A930    |      ;
                       STA.W $07ED                          ;02A70B|8DED07  |0207ED;
 
          CODE_02A70E:
                       JSR.W setColussionAtPos              ;02A70E|209DAA  |02AA9D;
                       LDA.B #$01                           ;02A711|A901    |      ;
                       STA.W r_entity_target,X        ;02A713|9D0606  |020606;
                       LDA.B #$C0                           ;02A716|A9C0    |      ;
                       STA.W r_damagActionFlag,X       ;02A718|9D1D06  |02061D;
                       JMP.W CODE_02AACE                    ;02A71B|4CCEAA  |02AACE;
 
 
          CODE_02A71E:
                       RTS                                  ;02A71E|60      |      ;
 
 
          CODE_02A71F:
                       LDY.B r_scrollDirection              ;02A71F|A465    |000065;
                       BEQ CODE_02A72C                      ;02A721|F009    |02A72C;
                       DEC.W $07A2                          ;02A723|CEA207  |0207A2;
                       LDX.W $07A2                          ;02A726|AEA207  |0207A2;
                       JMP.W CODE_02A732                    ;02A729|4C32A7  |02A732;
 
 
          CODE_02A72C:
                       INC.W $07A1                          ;02A72C|EEA107  |0207A1;
                       LDX.W $07A1                          ;02A72F|AEA107  |0207A1;
 
          CODE_02A732:
                       LDA.B #$00                           ;02A732|A900    |      ;
                       STA.W r_FogParallelPos,X           ;02A734|9D8207  |020782;
                       RTS                                  ;02A737|60      |      ;
 
 
		miscID_scalePlatform_01:
                       LDA.B #$00                           ;02A738|A900    |      ;
                       STA.B r_collisionPointYinScreen      ;02A73A|8511    |000011;
                       LDA.B #$7A                           ;02A73C|A97A    |      ;
                       STA.B $01                            ;02A73E|8501    |000001;
                       JSR.W setCollusionStuff              ;02A740|2076AA  |02AA76;
                       LDA.B $05                            ;02A743|A505    |000005;
                       STA.B r_pointerQueue                 ;02A745|8508    |000008;
                       LDA.B #$00                           ;02A747|A900    |      ;
                       STA.B $09                            ;02A749|8509    |000009;
 
         DATA8_02A74B:
                       db $20                               ;02A74B|        |      ;
                       dw findEmptyEntitySlot          ;02A74C|        |0FFEB9;
                       BNE CODE_02A71F                      ;02A74E|D0CF    |02A71F;
                       JSR.W setColussionAtPos              ;02A750|209DAA  |02AA9D;
                       JSR.W CODE_02AADE                    ;02A753|20DEAA  |02AADE;
                       LDA.B $09                            ;02A756|A509    |000009;
                       BNE CODE_02A75F                      ;02A758|D005    |02A75F;
                       TXA                                  ;02A75A|8A      |      ;
                       STA.B r_temp_Xpos                    ;02A75B|850A    |00000A;
                       LDA.B $09                            ;02A75D|A509    |000009;
 
          CODE_02A75F:
                       STA.W r_entity_target,X        ;02A75F|9D0606  |020606;
                       LDA.B r_pointerQueue                 ;02A762|A508    |000008;
                       STA.W r_damagActionFlag,X       ;02A764|9D1D06  |02061D;
                       LDA.B r_temp_Xpos                    ;02A767|A50A    |00000A;
                       STA.W r_entity_Counter,X           ;02A769|9D3306  |020633;
                       LDY.B r_pointerQueue                 ;02A76C|A408    |000008;
                       LDA.W DATA8_02A780,Y                 ;02A76E|B980A7  |02A780;
                       STA.W r_Player_StateDoubled,X      ;02A771|9D6505  |020565;
                       INC.B $09                            ;02A774|E609    |000009;
                       LDA.B $09                            ;02A776|A509    |000009;
                       CMP.B #$06                           ;02A778|C906    |      ;
                       BNE DATA8_02A74B                     ;02A77A|D0CF    |02A74B;
                       JMP.W CODE_02AACE                    ;02A77C|4CCEAA  |02AACE;
 
                       RTS                                  ;02A77F|60      |      ;
 
 
         DATA8_02A780:
                       db $60,$20,$60,$60,$20,$20,$20       ;02A780|        |      ;
 
 
		miscID_turningSpikePlatform_03:
                       LDA.B #$82                           ;02A787|A982    |      ;
                       BNE CODE_02A78D                      ;02A789|D002    |02A78D;
 
		miscID_turningPlatform_02:
                       LDA.B #$7D                           ;02A78B|A97D    |      ;
 
          CODE_02A78D:
                       STA.B $01                            ;02A78D|8501    |000001;
                       LDA.B #$00                           ;02A78F|A900    |      ;
                       STA.B r_collisionPointYinScreen      ;02A791|8511    |000011;
                       JSR.W setCollusionStuff              ;02A793|2076AA  |02AA76;
                       LDA.B $05                            ;02A796|A505    |000005;
                       STA.B r_pointerQueue                 ;02A798|8508    |000008;
                       LDA.B $06                            ;02A79A|A506    |000006;
                       STA.B $09                            ;02A79C|8509    |000009;
 
         DATA8_02A79E:
                       db $20                               ;02A79E|        |      ;
                       dw findEmptyEntitySlot          ;02A79F|        |0FFEB9;
                       BNE CODE_02A7DF                      ;02A7A1|D03C    |02A7DF;
                       JSR.W setColussionAtPos              ;02A7A3|209DAA  |02AA9D;
                       LDA.B $09                            ;02A7A6|A509    |000009;
                       ASL A                                ;02A7A8|0A      |      ;
                       TAY                                  ;02A7A9|A8      |      ;
                       LDA.W DATA16_02A7E0,Y                ;02A7AA|B9E0A7  |02A7E0;
                       STA.B $0B                            ;02A7AD|850B    |00000B;
                       LDA.W DATA16_02A7E0+1,Y                ;02A7AF|B9E1A7  |02A7E1;
                       STA.B r_temp_Xpos                    ;02A7B2|850A    |00000A;
                       LDA.W DATA16_02A828,Y                ;02A7B4|B928A8  |02A828;
                       STA.B r_tempCurrSection              ;02A7B7|850D    |00000D;
                       LDA.W DATA16_02A828+1,Y                ;02A7B9|B929A8  |02A829;
                       STA.B r_tempCurrGroup                ;02A7BC|850C    |00000C;
                       LDA.B $0B                            ;02A7BE|A50B    |00000B;
                       SEC                                  ;02A7C0|38      |      ;
                       SBC.B r_sceneScrollOffsetLo          ;02A7C1|E556    |000056;
                       STA.W r_entity_XPos,X              ;02A7C3|9D3804  |020438;
                       LDA.B r_temp_Xpos                    ;02A7C6|A50A    |00000A;
                       SBC.B r_sceneScrollOffsetHi          ;02A7C8|E557    |000057;
                       BEQ CODE_02A7D1                      ;02A7CA|F005    |02A7D1;
                       LDA.B #$01                           ;02A7CC|A901    |      ;
                       STA.W r_entity_mask,X            ;02A7CE|9D7004  |020470;
 
          CODE_02A7D1:
                       LDA.B r_tempCurrSection              ;02A7D1|A50D    |00000D;
                       STA.W r_entity_YPos,X              ;02A7D3|9D1C04  |02041C;
                       INC.B $09                            ;02A7D6|E609    |000009;
                       DEC.B r_pointerQueue                 ;02A7D8|C608    |000008;
                       BNE DATA8_02A79E                     ;02A7DA|D0C2    |02A79E;
                       JMP.W CODE_02AACE                    ;02A7DC|4CCEAA  |02AACE;
 
 
          CODE_02A7DF:
                       RTS                                  ;02A7DF|60      |      ;
 
 
        DATA16_02A7E0:
                       dw $00B0,$0150,$0190,$01D0           ;02A7E0|        |      ;
                       dw $0210,$0210,$0230,$0070           ;02A7E8|        |      ;
                       dw $0130,$0050,$00B0,$00D0           ;02A7F0|        |      ;
                       dw $0110,$00B0,$00D0,$00F0           ;02A7F8|        |      ;
                       dw $0110,$0130,$0150,$0170           ;02A800|        |      ;
                       dw $01B0,$01D0,$0210,$0250           ;02A808|        |      ;
                       dw $0270,$0290,$0170,$0190           ;02A810|        |      ;
                       dw $01B0,$01D0,$01F0,$0210           ;02A818|        |      ;
                       dw $0230,$0250,$0270,$0290           ;02A820|        |      ;
 
        DATA16_02A828:
                       dw $0064,$00B4,$0064,$0064           ;02A828|        |      ;
                       dw $0064,$00B4,$0064,$00A8           ;02A830|        |      ;
                       dw $0088,$0088,$0088,$00C8           ;02A838|        |      ;
                       dw $0088,$0088,$0084,$0084           ;02A840|        |      ;
                       dw $0088,$0084,$0088,$0084           ;02A848|        |      ;
                       dw $0084,$0088,$00A4,$00A8           ;02A850|        |      ;
                       dw $00A4,$00A8,$00A8,$00A8           ;02A858|        |      ;
                       dw $00A4,$00A8,$00A4,$00A8           ;02A860|        |      ;
                       dw $00A8,$00A8,$00A8,$00A4           ;02A868|        |      ;
 
		miscID_gear_0A_0E_0F:
                       LDA.B #$01                           ;02A870|A901    |      ;
                       BNE CODE_02A876                      ;02A872|D002    |02A876;
 
       miscID_gear_04:
                       LDA.B #$00                           ;02A874|A900    |      ;
 
          CODE_02A876:
                       STA.B r_collisionPointYinScreen      ;02A876|8511    |000011;
                       LDA.B #$80                           ;02A878|A980    |      ;
                       STA.B $01                            ;02A87A|8501    |000001;
                       JSR.W setCollusionStuff              ;02A87C|2076AA  |02AA76;
                       LDA.B $05                            ;02A87F|A505    |000005;
                       STA.B $0B                            ;02A881|850B    |00000B;
                       LDA.B $06                            ;02A883|A506    |000006;
                       STA.B r_tempCurrGroup                ;02A885|850C    |00000C;
                       LDY.B $0B                            ;02A887|A40B    |00000B;
                       LDA.W DATA8_02A948,Y                 ;02A889|B948A9  |02A948;
                       STA.B r_tempCurrSection              ;02A88C|850D    |00000D;
                       LDA.B $0B                            ;02A88E|A50B    |00000B;
                       ASL A                                ;02A890|0A      |      ;
                       TAY                                  ;02A891|A8      |      ;
                       LDA.W PTR16_02A94A,Y                 ;02A892|B94AA9  |02A94A;
                       STA.B r_tempCurrRoomIdx              ;02A895|850E    |00000E;
                       LDA.W PTR16_02A94A+1,Y                 ;02A897|B94BA9  |02A94B;
                       STA.B r_roomSectionChrBanksDataOffset;02A89A|850F    |00000F;
                       LDA.B #$00                           ;02A89C|A900    |      ;
                       STA.W r_bossPieces     				;02A89E|8DEC07  |0207EC;
                       STA.W $07ED                          ;02A8A1|8DED07  |0207ED;
                       STA.W $07EE                          ;02A8A4|8DEE07  |0207EE;
                       LDA.B r_tempCurrSection              ;02A8A7|A50D    |00000D;
                       STA.B $09                            ;02A8A9|8509    |000009;
 
          CODE_02A8AB:
                       LDA.B r_tempCurrGroup                ;02A8AB|A50C    |00000C;
                       CMP.B #$05                           ;02A8AD|C905    |      ;
                       BCC DATA8_02A8B8                     ;02A8AF|9007    |02A8B8;
                       JSR.W CODE_02AACF                    ;02A8B1|20CFAA  |02AACF;
                       BNE CODE_02A90C                      ;02A8B4|D056    |02A90C;
                       BEQ CODE_02A8BD                      ;02A8B6|F005    |02A8BD;
 
         DATA8_02A8B8:
                       db $20                               ;02A8B8|        |      ;
                       dw findEmptyEntitySlot          ;02A8B9|        |0FFEB9;
                       BNE CODE_02A910                      ;02A8BB|D053    |02A910;
 
          CODE_02A8BD:
                       JSR.W DATA8_02AAA2                   ;02A8BD|20A2AA  |02AAA2;
                       JSR.W CODE_02AADE                    ;02A8C0|20DEAA  |02AADE;
                       LDY.B $09                            ;02A8C3|A409    |000009;
                       CPY.B r_tempCurrSection              ;02A8C5|C40D    |00000D;
                       BNE CODE_02A8EC                      ;02A8C7|D023    |02A8EC;
                       STX.B r_collisionPointXvalDiv32      ;02A8C9|8612    |000012;
                       LDA.B #$85                           ;02A8CB|A985    |      ;
                       STA.W r_entity_ID,X       ;02A8CD|9D4E05  |02054E;
                       LDA.B #$00                           ;02A8D0|A900    |      ;
                       STA.W r_entity_AI,X            ;02A8D2|9DEF05  |0205EF;
                       LDA.B $0B                            ;02A8D5|A50B    |00000B;
                       STA.W r_entity_target,X        ;02A8D7|9D0606  |020606;
                       LDA.B r_collisionPointYinScreen      ;02A8DA|A511    |000011;
                       STA.W r_damagActionFlag,X       ;02A8DC|9D1D06  |02061D;
                       LDA.B r_tempCurrGroup                ;02A8DF|A50C    |00000C;
                       STA.W r_entity_Counter,X           ;02A8E1|9D3306  |020633;
                       LDA.B r_entityID_processed           ;02A8E4|A56C    |00006C;
                       STA.W $078F,X                        ;02A8E6|9D8F07  |02078F;
                       JMP.W CODE_02A905                    ;02A8E9|4C05A9  |02A905;
 
 
          CODE_02A8EC:
                       DEY                                  ;02A8EC|88      |      ;
                       LDA.B (r_tempCurrRoomIdx),Y          ;02A8ED|B10E    |00000E;
                       STA.W r_Player_StateDoubled,X      ;02A8EF|9D6505  |020565;
                       LDA.B r_tempCurrGroup                ;02A8F2|A50C    |00000C;
                       STA.W r_entity_target,X        ;02A8F4|9D0606  |020606;
                       TYA                                  ;02A8F7|98      |      ;
                       STA.W $0645,X                        ;02A8F8|9D4506  |020645;
                       LDA.B #$00                           ;02A8FB|A900    |      ;
                       STA.W r_entity_Counter,X           ;02A8FD|9D3306  |020633;
                       LDA.B r_collisionPointXvalDiv32      ;02A900|A512    |000012;
                       STA.W r_damagActionFlag,X       ;02A902|9D1D06  |02061D;
 
          CODE_02A905:
                       DEC.B $09                            ;02A905|C609    |000009;
                       BNE CODE_02A8AB                      ;02A907|D0A2    |02A8AB;
                       JMP.W CODE_02AACE                    ;02A909|4CCEAA  |02AACE;
 
 
          CODE_02A90C:
                       LDX.B #$03                           ;02A90C|A203    |      ;
                       BNE CODE_02A912                      ;02A90E|D002    |02A912;
 
          CODE_02A910:
                       LDX.B #$01                           ;02A910|A201    |      ;
 
          CODE_02A912:
                       LDA.W r_entity_ID,X       ;02A912|BD4E05  |02054E;
                       CMP.B #$80                           ;02A915|C980    |      ;
                       BEQ CODE_02A926                      ;02A917|F00D    |02A926;
                       CMP.B #$85                           ;02A919|C985    |      ;
                       BNE CODE_02A938                      ;02A91B|D01B    |02A938;
                       LDA.W r_entity_Counter,X           ;02A91D|BD3306  |020633;
                       CMP.B r_tempCurrGroup                ;02A920|C50C    |00000C;
                       BNE CODE_02A938                      ;02A922|D014    |02A938;
                       BEQ CODE_02A92D                      ;02A924|F007    |02A92D;
 
          CODE_02A926:
                       LDA.W r_entity_target,X        ;02A926|BD0606  |020606;
                       CMP.B r_tempCurrGroup                ;02A929|C50C    |00000C;
                       BNE CODE_02A938                      ;02A92B|D00B    |02A938;
 
          CODE_02A92D:
                       LDA.B #$00                           ;02A92D|A900    |      ;
                       STA.W r_entity_ID,X      			 ;02A92F|9D4E05  |02054E;
                       STA.W r_entity_spriteID,X        ;02A932|9D0004  |020400;
                       STA.W r_entity_spriteGroup,X			;02A935|9D8C04  |02048C;
 
          CODE_02A938:
                       INX                                  ;02A938|E8      |      ;
                       CPX.B #$13                           ;02A939|E013    |      ;
                       BNE CODE_02A912                      ;02A93B|D0D5    |02A912;
                       LDX.B r_entityID_processed           ;02A93D|A66C    |00006C;
                       LDA.B #$00                           ;02A93F|A900    |      ;
                       STA.W r_FogParallelPos,X           ;02A941|9D8207  |020782;
                       STX.W $07A1                          ;02A944|8EA107  |0207A1;
                       RTS                                  ;02A947|60      |      ;
 
 
         DATA8_02A948: db $07,$09                           ;02A948|        |      ;
 
         PTR16_02A94A: dw DATA8_02A94E                      ;02A94A|        |02A94E;
                       dw DATA8_02A954                      ;02A94C|        |02A954;
 
         DATA8_02A94E: db $00,$2B,$56,$80,$AB,$D6           ;02A94E|        |      ;
 
         DATA8_02A954: db $00,$15,$2A,$40,$EB,$D6,$C0,$AA   ;02A954|        |      ;
 
   miscID_pandelum_05:
                       LDA.B #$00                           ;02A95C|A900    |      ;
                       STA.B r_collisionPointYinScreen      ;02A95E|8511    |000011;
                       LDA.B #$7F                           ;02A960|A97F    |      ;
                       STA.B $01                            ;02A962|8501    |000001;
                       JSR.W setCollusionStuff              ;02A964|2076AA  |02AA76;
                       LDA.B $05                            ;02A967|A505    |000005;
                       STA.B r_tempCurrGroup                ;02A969|850C    |00000C;
                       TAY                                  ;02A96B|A8      |      ;
                       LDA.B #$00                           ;02A96C|A900    |      ;
                       STA.W r_bossPieces,Y   ;02A96E|99EC07  |0207EC;
                       LDA.B $06                            ;02A971|A506    |000006;
                       STA.B r_temp_Xpos                    ;02A973|850A    |00000A;
                       LDA.B #$80                           ;02A975|A980    |      ;
                       STA.B $0B                            ;02A977|850B    |00000B;
                       LDY.B r_tempCurrGroup                ;02A979|A40C    |00000C;
                       LDA.W DATA8_02A9C1,Y                 ;02A97B|B9C1A9  |02A9C1;
                       STA.B r_tempCurrSection              ;02A97E|850D    |00000D;
                       LDA.B #$00                           ;02A980|A900    |      ;
                       STA.B $09                            ;02A982|8509    |000009;
 
          CODE_02A984:
                       LDA.B r_stage                        ;02A984|A532    |000032;
                       CMP.B #$0B                           ;02A986|C90B    |      ;
                       BNE DATA8_02A991                     ;02A988|D007    |02A991;
                       JSR.W CODE_02AACF                    ;02A98A|20CFAA  |02AACF;
                       BNE CODE_02A9C0                      ;02A98D|D031    |02A9C0;
                       BEQ CODE_02A996                      ;02A98F|F005    |02A996;
 
         DATA8_02A991:
                       db $20                               ;02A991|        |      ;
                       dw findEmptyEntitySlot          ;02A992|        |0FFEB9;
                       BNE CODE_02A9C0                      ;02A994|D02A    |02A9C0;
 
          CODE_02A996:
                       JSR.W setColussionAtPos              ;02A996|209DAA  |02AA9D;
                       JSR.W CODE_02AADE                    ;02A999|20DEAA  |02AADE;
                       LDA.B $09                            ;02A99C|A509    |000009;
                       STA.W r_entity_target,X        ;02A99E|9D0606  |020606;
                       LDA.B r_temp_Xpos                    ;02A9A1|A50A    |00000A;
                       STA.W r_damagActionFlag,X       ;02A9A3|9D1D06  |02061D;
                       LDA.B $0B                            ;02A9A6|A50B    |00000B;
                       STA.W r_Player_StateDoubled,X      ;02A9A8|9D6505  |020565;
                       LDA.B r_tempCurrGroup                ;02A9AB|A50C    |00000C;
                       STA.W r_entity_Counter,X           ;02A9AD|9D3306  |020633;
                       LDA.B #$00                           ;02A9B0|A900    |      ;
                       STA.W $0645,X                        ;02A9B2|9D4506  |020645;
                       INC.B $09                            ;02A9B5|E609    |000009;
                       LDA.B $09                            ;02A9B7|A509    |000009;
                       CMP.B r_tempCurrSection              ;02A9B9|C50D    |00000D;
                       BNE CODE_02A984                      ;02A9BB|D0C7    |02A984;
                       JMP.W CODE_02AACE                    ;02A9BD|4CCEAA  |02AACE;
 
 
          CODE_02A9C0:
                       RTS                                  ;02A9C0|60      |      ;
 
 
         DATA8_02A9C1:
                       db $05,$05,$08,$05,$08               ;02A9C1|        |      ;
 
		miscID_spikePlatform_06:
                       LDA.B #$7E                           ;02A9C6|A97E    |      ;
                       BNE CODE_02A9CC                      ;02A9C8|D002    |02A9CC;
 
		miscID_crusher_07:
                       LDA.B #$84                           ;02A9CA|A984    |      ;
 
          CODE_02A9CC:
                       STA.B $01                            ;02A9CC|8501    |000001;
                       LDA.B #$00                           ;02A9CE|A900    |      ;
                       STA.B r_collisionPointYinScreen      ;02A9D0|8511    |000011;
                       JSR.W setCollusionStuff              ;02A9D2|2076AA  |02AA76;
                       LDA.B $06                            ;02A9D5|A506    |000006;
                       STA.B $0B                            ;02A9D7|850B    |00000B;
                       LDA.B $05                            ;02A9D9|A505    |000005;
                       STA.B r_temp_Xpos                    ;02A9DB|850A    |00000A;
                       db $20                               ;02A9DD|        |      ;
                       dw findEmptyEntitySlot          ;02A9DE|        |0FFEB9;
                       BNE CODE_02A9C0                      ;02A9E0|D0DE    |02A9C0;
                       LDY.B $0B                            ;02A9E2|A40B    |00000B;
                       LDA.W DATA8_02AA2A,Y                 ;02A9E4|B92AAA  |02AA2A;
                       STA.B r_tempCurrGroup                ;02A9E7|850C    |00000C;
                       LDA.B #$00                           ;02A9E9|A900    |      ;
                       STA.B $09                            ;02A9EB|8509    |000009;
 
         DATA8_02A9ED:
                       db $20                               ;02A9ED|        |      ;
                       dw findEmptyEntitySlot          ;02A9EE|        |0FFEB9;
                       BNE CODE_02A9C0                      ;02A9F0|D0CE    |02A9C0;
                       JSR.W setColussionAtPos              ;02A9F2|209DAA  |02AA9D;
                       LDA.B r_tempCurrGroup                ;02A9F5|A50C    |00000C;
                       STA.W r_entity_YPos,X              ;02A9F7|9D1C04  |02041C;
                       LDA.B $09                            ;02A9FA|A509    |000009;
                       ASL A                                ;02A9FC|0A      |      ;
                       ASL A                                ;02A9FD|0A      |      ;
                       ASL A                                ;02A9FE|0A      |      ;
                       ASL A                                ;02A9FF|0A      |      ;
                       ASL A                                ;02AA00|0A      |      ;
                       CLC                                  ;02AA01|18      |      ;
                       ADC.W r_entity_XPos,X              ;02AA02|7D3804  |020438;
                       STA.W r_entity_XPos,X              ;02AA05|9D3804  |020438;
                       BCC CODE_02AA0F                      ;02AA08|9005    |02AA0F;
                       LDA.B #$01                           ;02AA0A|A901    |      ;
                       STA.W r_entity_mask,X            ;02AA0C|9D7004  |020470;
 
          CODE_02AA0F:
                       LDA.B #$04                           ;02AA0F|A904    |      ;
                       STA.W r_entity_extra,X             ;02AA11|9DD805  |0205D8;
                       LDA.B $0B                            ;02AA14|A50B    |00000B;
                       STA.W r_entity_target,X        ;02AA16|9D0606  |020606;
                       LDA.B #$00                           ;02AA19|A900    |      ;
                       STA.W r_damagActionFlag,X       ;02AA1B|9D1D06  |02061D;
                       INC.B $09                            ;02AA1E|E609    |000009;
                       LDA.B $09                            ;02AA20|A509    |000009;
                       CMP.B r_temp_Xpos                    ;02AA22|C50A    |00000A;
                       BNE DATA8_02A9ED                     ;02AA24|D0C7    |02A9ED;
                       JMP.W CODE_02AACE                    ;02AA26|4CCEAA  |02AACE;
 
                       db $60                               ;02AA29|        |      ;
 
         DATA8_02AA2A:
                       db $80,$40,$50,$90,$60,$60,$60,$40   ;02AA2A|        |      ;
                       db $70,$40,$70,$70                   ;02AA32|        |      ;
 
      miscID_drips_09:
                       LDA.B #$7C                           ;02AA36|A97C    |      ;
                       BNE CODE_02AA50                      ;02AA38|D016    |02AA50;
 
	miscID_fallingBlocks_08:
                       LDA.B r_stage                        ;02AA3A|A532    |000032;
                       CMP.B #$0A                           ;02AA3C|C90A    |      ;
                       BNE CODE_02AA4E                      ;02AA3E|D00E    |02AA4E;
                       LDA.B r_blockLevel                   ;02AA40|A533    |000033;
                       CMP.B #$04                           ;02AA42|C904    |      ;
                       BNE CODE_02AA4E                      ;02AA44|D008    |02AA4E;
                       LDA.W $054F                          ;02AA46|AD4F05  |02054F;
                       CMP.B #$7B                           ;02AA49|C97B    |      ;
                       BNE CODE_02AA4E                      ;02AA4B|D001    |02AA4E;
                       RTS                                  ;02AA4D|60      |      ;
 
 
          CODE_02AA4E:
                       LDA.B #$7B                           ;02AA4E|A97B    |      ;
 
          CODE_02AA50:
                       STA.B $01                            ;02AA50|8501    |000001;
                       LDA.B #$00                           ;02AA52|A900    |      ;
                       STA.B r_collisionPointYinScreen      ;02AA54|8511    |000011;
                       JSR.W setCollusionStuff              ;02AA56|2076AA  |02AA76;
                       LDA.B $05                            ;02AA59|A505    |000005;
                       STA.B r_pointerQueue                 ;02AA5B|8508    |000008;
                       db $20                               ;02AA5D|        |      ;
                       dw findEmptyEntitySlot          ;02AA5E|        |0FFEB9;
                       BNE CODE_02AA75                      ;02AA60|D013    |02AA75;
                       JSR.W setColussionAtPos              ;02AA62|209DAA  |02AA9D;
                       LDA.B r_pointerQueue                 ;02AA65|A508    |000008;
                       STA.W r_damagActionFlag,X       ;02AA67|9D1D06  |02061D;
                       LDA.B #$00                           ;02AA6A|A900    |      ;
                       STA.W r_entity_target,X        ;02AA6C|9D0606  |020606;
                       STA.W r_Player_StateDoubled,X      ;02AA6F|9D6505  |020565;
                       JMP.W CODE_02AACE                    ;02AA72|4CCEAA  |02AACE;
 
 
          CODE_02AA75:
                       RTS                                  ;02AA75|60      |      ;
 
 
    setCollusionStuff:
                       LDA.B r_entityID_processed           ;02AA76|A56C    |00006C;
                       ASL A                                ;02AA78|0A      |      ;
                       ASL A                                ;02AA79|0A      |      ;
                       ASL A                                ;02AA7A|0A      |      ;
                       TAY                                  ;02AA7B|A8      |      ;
                       INY                                  ;02AA7C|C8      |      ;
                       INY                                  ;02AA7D|C8      |      ;
                       JSR.W getCollusionByte               ;02AA7E|2099AA  |02AA99;
                       STA.B $00                            ;02AA81|8500    |000000;
                       INY                                  ;02AA83|C8      |      ;
                       JSR.W getCollusionByte               ;02AA84|2099AA  |02AA99;
                       STA.B $04                            ;02AA87|8504    |000004;
                       JSR.W getCollusionByte               ;02AA89|2099AA  |02AA99;
                       STA.B $05                            ;02AA8C|8505    |000005;
                       JSR.W getCollusionByte               ;02AA8E|2099AA  |02AA99;
                       STA.B $06                            ;02AA91|8506    |000006;
                       JSR.W getCollusionByte               ;02AA93|2099AA  |02AA99;
                       STA.B $07                            ;02AA96|8507    |000007;
                       RTS                                  ;02AA98|60      |      ;
 
 
     getCollusionByte:
                       LDA.B (r_roomTerrainDataAddr),Y      ;02AA99|B19A    |00009A;
                       INY                                  ;02AA9B|C8      |      ;
                       RTS                                  ;02AA9C|60      |      ;
 
 
    setColussionAtPos:
                       LDA.B r_entityID_processed           ;02AA9D|A56C    |00006C;
                       STA.W $078F,X                        ;02AA9F|9D8F07  |02078F;
 
         DATA8_02AAA2:
                       db $20                               ;02AAA2|        |      ;
                       dw clearEntityAll                    ;02AAA3|        |0FFED7;
                       LDA.B $03                            ;02AAA5|A503    |000003;
                       BEQ CODE_02AAAE                      ;02AAA7|F005    |02AAAE;
                       LDA.B #$01                           ;02AAA9|A901    |      ;
                       STA.W r_entity_mask,X            ;02AAAB|9D7004  |020470;
 
          CODE_02AAAE:
                       LDA.B r_collisionPointYinScreen      ;02AAAE|A511    |000011;
                       BEQ CODE_02AABA                      ;02AAB0|F008    |02AABA;
                       LDA.B $02                            ;02AAB2|A502    |000002;
                       LDY.B $04                            ;02AAB4|A404    |000004;
                       STA.B $04                            ;02AAB6|8504    |000004;
                       STY.B $02                            ;02AAB8|8402    |000002;
 
          CODE_02AABA:
                       LDA.B $02                            ;02AABA|A502    |000002;
                       STA.W r_entity_XPos,X              ;02AABC|9D3804  |020438;
                       LDA.B $04                            ;02AABF|A504    |000004;
                       STA.W r_entity_YPos,X              ;02AAC1|9D1C04  |02041C;
                       LDA.B #$00                           ;02AAC4|A900    |      ;
                       STA.W r_entity_AI,X            ;02AAC6|9DEF05  |0205EF;
                       LDA.B $01                            ;02AAC9|A501    |000001;
                       STA.W r_entity_ID,X       ;02AACB|9D4E05  |02054E;
 
          CODE_02AACE:
                       RTS                                  ;02AACE|60      |      ;
 
 
          CODE_02AACF:
                       LDX.B #$03                           ;02AACF|A203    |      ;
 
          CODE_02AAD1:
                       LDA.W r_entity_ID,X       ;02AAD1|BD4E05  |02054E;
                       BEQ CODE_02AADD                      ;02AAD4|F007    |02AADD;
                       INX                                  ;02AAD6|E8      |      ;
                       CPX.B #$13                           ;02AAD7|E013    |      ;
                       BNE CODE_02AAD1                      ;02AAD9|D0F6    |02AAD1;
                       LDA.B #$01                           ;02AADB|A901    |      ;
 
          CODE_02AADD:
                       RTS                                  ;02AADD|60      |      ;
 
 
          CODE_02AADE:
                       LDA.W r_entity_mask,X            ;02AADE|BD7004  |020470;
                       ORA.B #$88                           ;02AAE1|0988    |      ;
                       STA.W r_entity_mask,X            ;02AAE3|9D7004  |020470;
                       RTS                                  ;02AAE6|60      |      ;
 
 
          CODE_02AAE7:
                       LDA.W r_entity_YPos,X              ;02AAE7|BD1C04  |02041C;
                       CMP.B #$F0                           ;02AAEA|C9F0    |      ;
                       BCS DATA8_02AAFF                     ;02AAEC|B011    |02AAFF;
                       LDA.W r_entity_YsubSpd,X           ;02AAEE|BD3705  |020537;
                       ADC.B #$20                           ;02AAF1|6920    |      ;
                       STA.W r_entity_YsubSpd,X           ;02AAF3|9D3705  |020537;
                       LDA.W r_entity_Yspd,X              ;02AAF6|BD2005  |020520;
                       ADC.B #$00                           ;02AAF9|6900    |      ;
                       STA.W r_entity_Yspd,X              ;02AAFB|9D2005  |020520;
                       RTS                                  ;02AAFE|60      |      ;
 
 
         DATA8_02AAFF:
                       db $20                               ;02AAFF|        |      ;
                       dw clearEntityAll                    ;02AB00|        |0FFED7;
                       STA.W r_entity_ID,X       ;02AB02|9D4E05  |02054E;
                       STA.W r_entity_spriteID,X        ;02AB05|9D0004  |020400;
                       RTS                                  ;02AB08|60      |      ;
 
 
		miscID_movingPlatform_0B:
                       LDY.B #$86                           ;02AB09|A086    |      ;
 
         DATA8_02AB0B:
                       db $20                               ;02AB0B|        |      ;
                       dw findEmptyEntitySlot          ;02AB0C|        |0FFEB9;
                       TYA                                  ;02AB0E|98      |      ;
                       STA.W r_entity_ID,X       ;02AB0F|9D4E05  |02054E;
                       JSR.W CODE_0294E7                    ;02AB12|20E794  |0294E7;
                       JMP.W CODE_02AE75                    ;02AB15|4C75AE  |02AE75;
 
 
           miscID__0C:
                       LDY.B #$87                           ;02AB18|A087    |      ;
                       BNE DATA8_02AB0B                     ;02AB1A|D0EF    |02AB0B;
 
           miscID__0D:
                       db $20                               ;02AB1C|        |      ;
                       dw findEmptyEntitySlot          ;02AB1D|        |0FFEB9;
                       LDA.B #$88                           ;02AB1F|A988    |      ;
                       STA.W r_entity_ID,X       ;02AB21|9D4E05  |02054E;
                       LDA.B #$00                           ;02AB24|A900    |      ;
                       STA.W r_Player_StateDoubled,X      ;02AB26|9D6505  |020565;
                       LDA.B #$F9                           ;02AB29|A9F9    |      ;
                       STA.W r_entity_mask,X            ;02AB2B|9D7004  |020470;
                       STX.B r_tempCurrSection              ;02AB2E|860D    |00000D;
                       LDA.B r_entityID_processed           ;02AB30|A56C    |00006C;
                       ASL A                                ;02AB32|0A      |      ;
                       ASL A                                ;02AB33|0A      |      ;
                       ASL A                                ;02AB34|0A      |      ;
                       CLC                                  ;02AB35|18      |      ;
                       ADC.B #$07                           ;02AB36|6907    |      ;
                       TAY                                  ;02AB38|A8      |      ;
                       LDA.B (r_roomTerrainDataAddr),Y      ;02AB39|B19A    |00009A;
                       TAY                                  ;02AB3B|A8      |      ;
                       LDA.W PTR16_02ABA1,Y                 ;02AB3C|B9A1AB  |02ABA1;
                       STA.B r_pointerQueue                 ;02AB3F|8508    |000008;
                       LDA.W PTR16_02ABA1+1,Y                 ;02AB41|B9A2AB  |02ABA2;
                       STA.B $09                            ;02AB44|8509    |000009;
                       LDY.B #$00                           ;02AB46|A000    |      ;
                       LDA.B (r_pointerQueue),Y             ;02AB48|B108    |000008;
                       STA.B r_temp_Xpos                    ;02AB4A|850A    |00000A;
                       INY                                  ;02AB4C|C8      |      ;
                       STY.B r_tempCurrGroup                ;02AB4D|840C    |00000C;
 
         DATA8_02AB4F:
                       db $20                               ;02AB4F|        |      ;
                       dw findEmptyEntitySlot          ;02AB50|        |0FFEB9;
                       LDA.B #$88                           ;02AB52|A988    |      ;
                       STA.W r_entity_ID,X       ;02AB54|9D4E05  |02054E;
                       LDA.B #$01                           ;02AB57|A901    |      ;
                       STA.W r_Player_StateDoubled,X      ;02AB59|9D6505  |020565;
                       LDY.B r_tempCurrGroup                ;02AB5C|A40C    |00000C;
                       LDA.B (r_pointerQueue),Y             ;02AB5E|B108    |000008;
                       STA.W r_entity_AI,X            ;02AB60|9DEF05  |0205EF;
                       SEC                                  ;02AB63|38      |      ;
                       SBC.B r_sceneScrollOffsetLo          ;02AB64|E556    |000056;
                       STA.W r_entity_XPos,X              ;02AB66|9D3804  |020438;
                       INY                                  ;02AB69|C8      |      ;
                       LDA.B (r_pointerQueue),Y             ;02AB6A|B108    |000008;
                       STA.W r_entity_target,X        ;02AB6C|9D0606  |020606;
                       INY                                  ;02AB6F|C8      |      ;
                       LDA.B (r_pointerQueue),Y             ;02AB70|B108    |000008;
                       STA.W r_entity_YPos,X              ;02AB72|9D1C04  |02041C;
                       INY                                  ;02AB75|C8      |      ;
                       LDA.B (r_pointerQueue),Y             ;02AB76|B108    |000008;
                       STA.W $0645,X                        ;02AB78|9D4506  |020645;
                       INY                                  ;02AB7B|C8      |      ;
                       STY.B r_tempCurrGroup                ;02AB7C|840C    |00000C;
                       JSR.W CODE_02AE58                    ;02AB7E|2058AE  |02AE58;
                       JSR.W CODE_02AEDE                    ;02AB81|20DEAE  |02AEDE;
                       LDA.B #$00                           ;02AB84|A900    |      ;
                       STA.W r_entity_XsubSpd,X           ;02AB86|9D0905  |020509;
                       STA.W r_entity_Xspd,X              ;02AB89|9DF204  |0204F2;
                       JSR.W CODE_02AD55                    ;02AB8C|2055AD  |02AD55;
                       LDA.W r_entity_target,X        ;02AB8F|BD0606  |020606;
                       AND.B #$01                           ;02AB92|2901    |      ;
                       ORA.W r_entity_mask,X            ;02AB94|1D7004  |020470;
                       STA.W r_entity_mask,X            ;02AB97|9D7004  |020470;
                       DEC.B r_temp_Xpos                    ;02AB9A|C60A    |00000A;
                       BNE DATA8_02AB4F                     ;02AB9C|D0B1    |02AB4F;
                       LDX.B r_tempCurrSection              ;02AB9E|A60D    |00000D;
                       RTS                                  ;02ABA0|60      |      ;
 
 
         PTR16_02ABA1:
                       dw DATA8_02ABA9                      ;02ABA1|        |02ABA9;
                       dw DATA8_02ABBA                      ;02ABA3|        |02ABBA;
                       dw DATA8_02ABC3                      ;02ABA5|        |02ABC3;
                       dw DATA8_02ABDC                      ;02ABA7|        |02ABDC;
 
 
         DATA8_02ABA9:
                       db $04,$50,$01,$60,$01,$90,$01,$50   ;02ABA9|        |      ;
                       db $81,$D0,$01,$30,$01,$10,$02,$40   ;02ABB1|        |      ;
                       db $01                               ;02ABB9|        |      ;
 
         DATA8_02ABBA:
                       db $02,$50,$03,$A0,$06,$90,$03,$90   ;02ABBA|        |      ;
                       db $06                               ;02ABC2|        |      ;
 
         DATA8_02ABC3:
                       db $06,$90,$00,$C0,$05,$D0,$00,$B0   ;02ABC3|        |      ;
                       db $05,$10,$01,$C0,$05,$D0,$01,$30   ;02ABCB|        |      ;
                       db $05,$10,$02,$20,$05,$50,$02,$20   ;02ABD3|        |      ;
                       db $05                               ;02ABDB|        |      ;
 
         DATA8_02ABDC:
                       db $05,$50,$01,$D0,$05,$F0,$01,$C0   ;02ABDC|        |      ;
                       db $05,$30,$02,$D0,$05,$70,$02,$B0   ;02ABE4|        |      ;
                       db $05,$B0,$02,$B0,$05               ;02ABEC|        |      ;
 
          CODE_02ABF1:
                       JSR.W CODE_02AF1C                    ;02ABF1|201CAF  |02AF1C;
                       JSR.W CODE_02ADBE                    ;02ABF4|20BEAD  |02ADBE;
                       LDA.B #$00                           ;02ABF7|A900    |      ;
                       STA.W r_entity_YsubSpd,X           ;02ABF9|9D3705  |020537;
                       STA.W r_entity_Yspd,X              ;02ABFC|9D2005  |020520;
                       JMP.W CODE_02ACA0                    ;02ABFF|4CA0AC  |02ACA0;
 
 
          CODE_02AC02:
                       JSR.W CODE_02AF40                    ;02AC02|2040AF  |02AF40;
                       JSR.W CODE_02AE23                    ;02AC05|2023AE  |02AE23;
                       LDA.B #$00                           ;02AC08|A900    |      ;
                       STA.W r_entity_XsubSpd,X           ;02AC0A|9D0905  |020509;
                       STA.W r_entity_Xspd,X              ;02AC0D|9DF204  |0204F2;
                       JMP.W CODE_02AD2D                    ;02AC10|4C2DAD  |02AD2D;
 
 
          CODE_02AC13:
                       JSR.W CODE_02AC1F                    ;02AC13|201FAC  |02AC1F;
                       LDA.W r_Player_StateDoubled,X      ;02AC16|BD6505  |020565;
                       BNE CODE_02AC1C                      ;02AC19|D001    |02AC1C;
                       RTS                                  ;02AC1B|60      |      ;
 
 
          CODE_02AC1C:
                       JMP.W CODE_02AD55                    ;02AC1C|4C55AD  |02AD55;
 
 
          CODE_02AC1F:
                       LDA.W $0645,X                        ;02AC1F|BD4506  |020645;
                       AND.B #$80                           ;02AC22|2980    |      ;
                       BEQ CODE_02AC2E                      ;02AC24|F008    |02AC2E;
                       LDA.W r_entity_YPos,X              ;02AC26|BD1C04  |02041C;
                       CMP.B #$38                           ;02AC29|C938    |      ;
                       BCC CODE_02AC36                      ;02AC2B|9009    |02AC36;
                       RTS                                  ;02AC2D|60      |      ;
 
 
          CODE_02AC2E:
                       LDA.W r_entity_YPos,X              ;02AC2E|BD1C04  |02041C;
                       CMP.B #$E0                           ;02AC31|C9E0    |      ;
                       BCS CODE_02AC36                      ;02AC33|B001    |02AC36;
                       RTS                                  ;02AC35|60      |      ;
 
 
          CODE_02AC36:
                       STX.B $00                            ;02AC36|8600    |000000;
                       db $20                               ;02AC38|        |      ;
                       dw findEmptyEntitySlot          ;02AC39|        |0FFEB9;
                       STX.B $01                            ;02AC3B|8601    |000001;
                       LDA.B #$88                           ;02AC3D|A988    |      ;
                       STA.W r_entity_ID,X       ;02AC3F|9D4E05  |02054E;
                       JSR.W CODE_0294E7                    ;02AC42|20E794  |0294E7;
                       LDY.B $00                            ;02AC45|A400    |000000;
                       LDA.W r_entity_AI,Y            ;02AC47|B9EF05  |0205EF;
                       STA.W r_entity_AI,X            ;02AC4A|9DEF05  |0205EF;
                       LDA.W r_entity_target,Y        ;02AC4D|B90606  |020606;
                       STA.W r_entity_target,X        ;02AC50|9D0606  |020606;
                       LDA.W $0645,Y                        ;02AC53|B94506  |020645;
                       STA.W $0645,X                        ;02AC56|9D4506  |020645;
                       LDA.W r_Player_StateDoubled,Y      ;02AC59|B96505  |020565;
                       STA.W r_Player_StateDoubled,X      ;02AC5C|9D6505  |020565;
                       LDA.W r_entity_mask,Y            ;02AC5F|B97004  |020470;
                       ORA.B #$80                           ;02AC62|0980    |      ;
                       STA.W r_entity_mask,X            ;02AC64|9D7004  |020470;
                       LDA.W $078F,Y                        ;02AC67|B98F07  |02078F;
                       STA.W $078F,X                        ;02AC6A|9D8F07  |02078F;
                       LDA.W r_entity_XPos,Y              ;02AC6D|B93804  |020438;
                       STA.W r_entity_XPos,X              ;02AC70|9D3804  |020438;
                       LDA.B #$00                           ;02AC73|A900    |      ;
                       STA.W r_entity_XsubSpd,X           ;02AC75|9D0905  |020509;
                       JSR.W CODE_02AEDE                    ;02AC78|20DEAE  |02AEDE;
                       JSR.W CODE_02AE62                    ;02AC7B|2062AE  |02AE62;
                       LDY.B #$38                           ;02AC7E|A038    |      ;
                       LDA.W $0645,X                        ;02AC80|BD4506  |020645;
                       AND.B #$80                           ;02AC83|2980    |      ;
                       BEQ CODE_02AC89                      ;02AC85|F002    |02AC89;
                       LDY.B #$E0                           ;02AC87|A0E0    |      ;
 
          CODE_02AC89:
                       TYA                                  ;02AC89|98      |      ;
                       STA.W r_entity_YPos,X              ;02AC8A|9D1C04  |02041C;
                       LDX.B $00                            ;02AC8D|A600    |000000;
                       LDA.B r_damagePlayer                 ;02AC8F|A581    |000081;
                       CMP.B #$01                           ;02AC91|C901    |      ;
                       BNE CODE_02AC9D                      ;02AC93|D008    |02AC9D;
                       LDA.B r_ConveyorRelated              ;02AC95|A591    |000091;
                       CMP.B $00                            ;02AC97|C500    |000000;
                       BNE CODE_02AC9D                      ;02AC99|D002    |02AC9D;
                       DEC.B r_damagePlayer                 ;02AC9B|C681    |000081;
 
          CODE_02AC9D:
                       JMP.W CODE_0294E2                    ;02AC9D|4CE294  |0294E2;
 
 
          CODE_02ACA0:
                       JSR.W getMiscDataPointer                    ;02ACA0|20A59E  |029EA5;
                       JSR.W CODE_02AD1F                    ;02ACA3|201FAD  |02AD1F;
                       LDA.B #$00                           ;02ACA6|A900    |      ;
                       STA.B $02                            ;02ACA8|8502    |000002;
                       LDA.W $078F,X                        ;02ACAA|BD8F07  |02078F;
                       ASL A                                ;02ACAD|0A      |      ;
                       ASL A                                ;02ACAE|0A      |      ;
                       ASL A                                ;02ACAF|0A      |      ;
                       TAY                                  ;02ACB0|A8      |      ;
                       INY                                  ;02ACB1|C8      |      ;
                       SEC                                  ;02ACB2|38      |      ;
                       LDA.B (r_roomTerrainDataAddr),Y      ;02ACB3|B19A    |00009A;
                       SBC.B $00                            ;02ACB5|E500    |000000;
                       STA.B $00                            ;02ACB7|8500    |000000;
                       DEY                                  ;02ACB9|88      |      ;
                       LDA.B (r_roomTerrainDataAddr),Y      ;02ACBA|B19A    |00009A;
                       SBC.B $01                            ;02ACBC|E501    |000001;
                       STA.B $01                            ;02ACBE|8501    |000001;
                       JSR.W CODE_02AD78                    ;02ACC0|2078AD  |02AD78;
                       LDA.B $01                            ;02ACC3|A501    |000001;
                       BPL CODE_02ACD6                      ;02ACC5|100F    |02ACD6;
                       DEC.B $02                            ;02ACC7|C602    |000002;
                       LDA.B #$00                           ;02ACC9|A900    |      ;
                       SEC                                  ;02ACCB|38      |      ;
                       SBC.B $00                            ;02ACCC|E500    |000000;
                       STA.B $00                            ;02ACCE|8500    |000000;
                       LDA.B #$00                           ;02ACD0|A900    |      ;
                       SBC.B $01                            ;02ACD2|E501    |000001;
                       STA.B $01                            ;02ACD4|8501    |000001;
 
          CODE_02ACD6:
                       CLC                                  ;02ACD6|18      |      ;
                       LDA.B $04                            ;02ACD7|A504    |000004;
                       ADC.B #$80                           ;02ACD9|6980    |      ;
                       STA.B $04                            ;02ACDB|8504    |000004;
                       LDA.B $05                            ;02ACDD|A505    |000005;
                       ADC.B #$01                           ;02ACDF|6901    |      ;
                       STA.B $05                            ;02ACE1|8505    |000005;
                       LDA.B $05                            ;02ACE3|A505    |000005;
                       CMP.B $01                            ;02ACE5|C501    |000001;
                       BNE CODE_02ACED                      ;02ACE7|D004    |02ACED;
                       LDA.B $04                            ;02ACE9|A504    |000004;
                       CMP.B $00                            ;02ACEB|C500    |000000;
 
          CODE_02ACED:
                       BEQ CODE_02ACF1                      ;02ACED|F002    |02ACF1;
                       BCS CODE_02AD11                      ;02ACEF|B020    |02AD11;
 
          CODE_02ACF1:
                       LDA.B $02                            ;02ACF1|A502    |000002;
                       BMI CODE_02AD01                      ;02ACF3|300C    |02AD01;
                       JSR.W CODE_02AD12                    ;02ACF5|2012AD  |02AD12;
                       CPY.W $07A2                          ;02ACF8|CCA207  |0207A2;
                       BCS CODE_02AD11                      ;02ACFB|B014    |02AD11;
                       STY.W $07A2                          ;02ACFD|8CA207  |0207A2;
                       RTS                                  ;02AD00|60      |      ;
 
 
          CODE_02AD01:
                       JSR.W CODE_02AD12                    ;02AD01|2012AD  |02AD12;
                       BIT.W $07A1                          ;02AD04|2CA107  |0207A1;
                       BMI CODE_02AD0E                      ;02AD07|3005    |02AD0E;
                       CPY.W $07A1                          ;02AD09|CCA107  |0207A1;
                       BCC CODE_02AD11                      ;02AD0C|9003    |02AD11;
 
          CODE_02AD0E:
                       STY.W $07A1                          ;02AD0E|8CA107  |0207A1;
 
          CODE_02AD11:
                       RTS                                  ;02AD11|60      |      ;
 
 
          CODE_02AD12:
                       JSR.W CODE_0294E2                    ;02AD12|20E294  |0294E2;
                       LDY.W $078F,X                        ;02AD15|BC8F07  |02078F;
                       STA.W r_FogParallelPos,Y           ;02AD18|998207  |020782;
                       STA.W $078F,X                        ;02AD1B|9D8F07  |02078F;
                       RTS                                  ;02AD1E|60      |      ;
 
 
          CODE_02AD1F:
                       LDA.B r_sceneScrollOffsetLo          ;02AD1F|A556    |000056;
                       CLC                                  ;02AD21|18      |      ;
                       ADC.B #$80                           ;02AD22|6980    |      ;
                       STA.B $00                            ;02AD24|8500    |000000;
                       LDA.B r_sceneScrollOffsetHi          ;02AD26|A557    |000057;
                       ADC.B #$00                           ;02AD28|6900    |      ;
                       STA.B $01                            ;02AD2A|8501    |000001;
                       RTS                                  ;02AD2C|60      |      ;
 
 
          CODE_02AD2D:
                       LDA.W r_entity_mask,X            ;02AD2D|BD7004  |020470;
                       AND.B #$01                           ;02AD30|2901    |      ;
                       BEQ CODE_02AD51                      ;02AD32|F01D    |02AD51;
                       LDA.W r_entity_XPos,X              ;02AD34|BD3804  |020438;
                       CMP.B #$A0                           ;02AD37|C9A0    |      ;
                       BCS CODE_02AD50                      ;02AD39|B015    |02AD50;
                       CMP.B #$60                           ;02AD3B|C960    |      ;
                       BCC CODE_02AD50                      ;02AD3D|9011    |02AD50;
                       CMP.B #$80                           ;02AD3F|C980    |      ;
                       BCS CODE_02AD4A                      ;02AD41|B007    |02AD4A;
                       JSR.W CODE_02AD12                    ;02AD43|2012AD  |02AD12;
                       STY.W $07A2                          ;02AD46|8CA207  |0207A2;
                       RTS                                  ;02AD49|60      |      ;
 
 
          CODE_02AD4A:
                       JSR.W CODE_02AD12                    ;02AD4A|2012AD  |02AD12;
                       STY.W $07A1                          ;02AD4D|8CA107  |0207A1;
 
          CODE_02AD50:
                       RTS                                  ;02AD50|60      |      ;
 
 
          CODE_02AD51:
                       JSR.W CODE_02ADB0                    ;02AD51|20B0AD  |02ADB0;
                       RTS                                  ;02AD54|60      |      ;
 
 
          CODE_02AD55:
                       LDA.B r_sceneScrollOffsetHi          ;02AD55|A557    |000057;
                       CMP.W r_entity_target,X        ;02AD57|DD0606  |020606;
                       BNE CODE_02AD61                      ;02AD5A|D005    |02AD61;
                       LDA.B r_sceneScrollOffsetLo          ;02AD5C|A556    |000056;
                       CMP.W r_entity_AI,X            ;02AD5E|DDEF05  |0205EF;
 
          CODE_02AD61:
                       BCS CODE_02ADA2                      ;02AD61|B03F    |02ADA2;
                       LDA.B r_sceneScrollOffsetHi          ;02AD63|A557    |000057;
                       ADC.B #$01                           ;02AD65|6901    |      ;
                       CMP.W r_entity_target,X        ;02AD67|DD0606  |020606;
                       BNE CODE_02AD71                      ;02AD6A|D005    |02AD71;
                       LDA.B r_sceneScrollOffsetLo          ;02AD6C|A556    |000056;
                       CMP.W r_entity_AI,X            ;02AD6E|DDEF05  |0205EF;
 
          CODE_02AD71:
                       BEQ CODE_02ADA2                      ;02AD71|F02F    |02ADA2;
                       BCC CODE_02ADA2                      ;02AD73|902D    |02ADA2;
                       JMP.W CODE_02ADB0                    ;02AD75|4CB0AD  |02ADB0;
 
 
          CODE_02AD78:
                       CLC                                  ;02AD78|18      |      ;
                       LDA.B $00                            ;02AD79|A500    |000000;
                       ADC.W r_entity_target,X        ;02AD7B|7D0606  |020606;
                       STA.B $04                            ;02AD7E|8504    |000004;
                       LDA.B $01                            ;02AD80|A501    |000001;
                       ADC.W r_damagActionFlag,X       ;02AD82|7D1D06  |02061D;
                       STA.B $05                            ;02AD85|8505    |000005;
                       BPL CODE_02AD96                      ;02AD87|100D    |02AD96;
                       LDA.B #$00                           ;02AD89|A900    |      ;
                       SEC                                  ;02AD8B|38      |      ;
                       SBC.B $04                            ;02AD8C|E504    |000004;
                       STA.B $04                            ;02AD8E|8504    |000004;
                       LDA.B #$00                           ;02AD90|A900    |      ;
                       SBC.B $05                            ;02AD92|E505    |000005;
                       STA.B $05                            ;02AD94|8505    |000005;
 
          CODE_02AD96:
                       LDA.B $05                            ;02AD96|A505    |000005;
                       CMP.B #$00                           ;02AD98|C900    |      ;
                       BNE CODE_02ADA0                      ;02AD9A|D004    |02ADA0;
                       LDA.B $04                            ;02AD9C|A504    |000004;
                       CMP.B #$7F                           ;02AD9E|C97F    |      ;
 
          CODE_02ADA0:
                       BCC CODE_02ADB0                      ;02ADA0|900E    |02ADB0;
 
          CODE_02ADA2:
                       LDA.B #$81                           ;02ADA2|A981    |      ;
                       ORA.W r_entity_mask,X            ;02ADA4|1D7004  |020470;
                       STA.W r_entity_mask,X            ;02ADA7|9D7004  |020470;
                       LDA.B #$00                           ;02ADAA|A900    |      ;
                       STA.W $0657,X                        ;02ADAC|9D5706  |020657;
                       RTS                                  ;02ADAF|60      |      ;
 
 
          CODE_02ADB0:
                       LDA.B #$7E                           ;02ADB0|A97E    |      ;
                       AND.W r_entity_mask,X            ;02ADB2|3D7004  |020470;
                       STA.W r_entity_mask,X            ;02ADB5|9D7004  |020470;
                       LDA.B #$01                           ;02ADB8|A901    |      ;
                       STA.W $0657,X                        ;02ADBA|9D5706  |020657;
                       RTS                                  ;02ADBD|60      |      ;
 
 
          CODE_02ADBE:
                       JSR.W CODE_02ADEB                    ;02ADBE|20EBAD  |02ADEB;
                       JSR.W CODE_02AE05                    ;02ADC1|2005AE  |02AE05;
                       BCC CODE_02ADDD                      ;02ADC4|9017    |02ADDD;
                       JSR.W CODE_02AE11                    ;02ADC6|2011AE  |02AE11;
                       CLC                                  ;02ADC9|18      |      ;
                       LDA.W r_entity_XsubSpd,X           ;02ADCA|BD0905  |020509;
                       ADC.W DATA8_02AE50,Y                 ;02ADCD|7950AE  |02AE50;
                       STA.W r_entity_XsubSpd,X           ;02ADD0|9D0905  |020509;
                       LDA.W r_entity_Xspd,X              ;02ADD3|BDF204  |0204F2;
                       ADC.W DATA8_02AE51,Y                 ;02ADD6|7951AE  |02AE51;
                       STA.W r_entity_Xspd,X              ;02ADD9|9DF204  |0204F2;
                       RTS                                  ;02ADDC|60      |      ;
 
 
          CODE_02ADDD:
                       LDA.W r_entity_Xspd,X              ;02ADDD|BDF204  |0204F2;
                       PHA                                  ;02ADE0|48      |      ;
                       JSR.W CODE_02AECA                    ;02ADE1|20CAAE  |02AECA;
                       PLA                                  ;02ADE4|68      |      ;
                       BPL CODE_02ADEA                      ;02ADE5|1003    |02ADEA;
                       JMP.W CODE_02AEB8                    ;02ADE7|4CB8AE  |02AEB8;
 
 
          CODE_02ADEA:
                       RTS                                  ;02ADEA|60      |      ;
 
 
          CODE_02ADEB:
                       LDA.W r_entity_target,X        ;02ADEB|BD0606  |020606;
                       STA.B $00                            ;02ADEE|8500    |000000;
                       LDA.W r_damagActionFlag,X       ;02ADF0|BD1D06  |02061D;
                       STA.B $01                            ;02ADF3|8501    |000001;
                       BPL CODE_02AE04                      ;02ADF5|100D    |02AE04;
                       SEC                                  ;02ADF7|38      |      ;
                       LDA.B #$00                           ;02ADF8|A900    |      ;
                       SBC.B $00                            ;02ADFA|E500    |000000;
                       STA.B $00                            ;02ADFC|8500    |000000;
                       LDA.B #$00                           ;02ADFE|A900    |      ;
                       SBC.B $01                            ;02AE00|E501    |000001;
                       STA.B $01                            ;02AE02|8501    |000001;
 
          CODE_02AE04:
                       RTS                                  ;02AE04|60      |      ;
 
 
          CODE_02AE05:
                       LDA.B $01                            ;02AE05|A501    |000001;
                       CMP.B #$00                           ;02AE07|C900    |      ;
                       BNE CODE_02AE10                      ;02AE09|D005    |02AE10;
                       LDA.B $00                            ;02AE0B|A500    |000000;
                       CMP.W r_entity_Counter,X           ;02AE0D|DD3306  |020633;
 
          CODE_02AE10:
                       RTS                                  ;02AE10|60      |      ;
 
 
          CODE_02AE11:
                       LDY.B #$00                           ;02AE11|A000    |      ;
                       LDA.W $0645,X                        ;02AE13|BD4506  |020645;
                       AND.B #$30                           ;02AE16|2930    |      ;
                       LSR A                                ;02AE18|4A      |      ;
                       LSR A                                ;02AE19|4A      |      ;
                       TAY                                  ;02AE1A|A8      |      ;
                       LDA.W r_damagActionFlag,X       ;02AE1B|BD1D06  |02061D;
                       BMI CODE_02AE22                      ;02AE1E|3002    |02AE22;
                       INY                                  ;02AE20|C8      |      ;
                       INY                                  ;02AE21|C8      |      ;
 
          CODE_02AE22:
                       RTS                                  ;02AE22|60      |      ;
 
 
          CODE_02AE23:
                       JSR.W CODE_02ADEB                    ;02AE23|20EBAD  |02ADEB;
                       JSR.W CODE_02AE05                    ;02AE26|2005AE  |02AE05;
                       BCC CODE_02AE42                      ;02AE29|9017    |02AE42;
                       JSR.W CODE_02AE11                    ;02AE2B|2011AE  |02AE11;
                       CLC                                  ;02AE2E|18      |      ;
                       LDA.W r_entity_YsubSpd,X           ;02AE2F|BD3705  |020537;
                       ADC.W DATA8_02AE50,Y                 ;02AE32|7950AE  |02AE50;
                       STA.W r_entity_YsubSpd,X           ;02AE35|9D3705  |020537;
                       LDA.W r_entity_Yspd,X              ;02AE38|BD2005  |020520;
                       ADC.W DATA8_02AE51,Y                 ;02AE3B|7951AE  |02AE51;
                       STA.W r_entity_Yspd,X              ;02AE3E|9D2005  |020520;
                       RTS                                  ;02AE41|60      |      ;
 
 
          CODE_02AE42:
                       LDA.W r_entity_Yspd,X              ;02AE42|BD2005  |020520;
                       PHA                                  ;02AE45|48      |      ;
                       JSR.W CODE_02AEF8                    ;02AE46|20F8AE  |02AEF8;
                       PLA                                  ;02AE49|68      |      ;
                       BPL CODE_02AE4F                      ;02AE4A|1003    |02AE4F;
                       JMP.W CODE_02AEE6                    ;02AE4C|4CE6AE  |02AEE6;
 
 
          CODE_02AE4F:
                       RTS                                  ;02AE4F|60      |      ;
 
 
         DATA8_02AE50:
                       db $02                               ;02AE50|        |      ;
 
         DATA8_02AE51:
                       db $00,$FE,$FF,$04,$00,$FC,$FF       ;02AE51|        |      ;
 
          CODE_02AE58:
                       LDA.B r_entityID_processed           ;02AE58|A56C    |00006C;
                       STA.W $078F,X                        ;02AE5A|9D8F07  |02078F;
                       LDA.B #$60                           ;02AE5D|A960    |      ;
                       STA.W r_entity_mask,X            ;02AE5F|9D7004  |020470;
 
          CODE_02AE62:
                       LDA.B #$0E                           ;02AE62|A90E    |      ;
                       STA.W r_entity_spriteGroup,X;02AE64|9D8C04  |02048C;
                       LDA.B #$16                           ;02AE67|A916    |      ;
                       STA.W r_entity_spriteID,X        ;02AE69|9D0004  |020400;
                       LDA.B #$00                           ;02AE6C|A900    |      ;
                       STA.W r_entity_PaletteOverride,X   ;02AE6E|9D5404  |020454;
                       STA.W r_entity_AnimGroup,X         ;02AE71|9DAA05  |0205AA;
                       RTS                                  ;02AE74|60      |      ;
 
 
          CODE_02AE75:
                       JSR.W CODE_02AE58                    ;02AE75|2058AE  |02AE58;
                       LDA.B r_entityID_processed           ;02AE78|A56C    |00006C;
                       ASL A                                ;02AE7A|0A      |      ;
                       ASL A                                ;02AE7B|0A      |      ;
                       ASL A                                ;02AE7C|0A      |      ;
                       TAY                                  ;02AE7D|A8      |      ;
                       INY                                  ;02AE7E|C8      |      ;
                       LDA.B (r_roomTerrainDataAddr),Y      ;02AE7F|B19A    |00009A;
                       SEC                                  ;02AE81|38      |      ;
                       SBC.B r_sceneScrollOffsetLo          ;02AE82|E556    |000056;
                       STA.W r_entity_XPos,X              ;02AE84|9D3804  |020438;
                       DEY                                  ;02AE87|88      |      ;
                       LDA.B (r_roomTerrainDataAddr),Y      ;02AE88|B19A    |00009A;
                       SBC.B r_sceneScrollOffsetHi          ;02AE8A|E557    |000057;
                       BEQ CODE_02AE98                      ;02AE8C|F00A    |02AE98;
                       AND.B #$01                           ;02AE8E|2901    |      ;
                       ORA.B #$80                           ;02AE90|0980    |      ;
                       ORA.W r_entity_mask,X            ;02AE92|1D7004  |020470;
                       STA.W r_entity_mask,X            ;02AE95|9D7004  |020470;
 
          CODE_02AE98:
                       INY                                  ;02AE98|C8      |      ;
                       INY                                  ;02AE99|C8      |      ;
                       INY                                  ;02AE9A|C8      |      ;
                       INY                                  ;02AE9B|C8      |      ;
                       LDA.B (r_roomTerrainDataAddr),Y      ;02AE9C|B19A    |00009A;
                       STA.W r_entity_YPos,X              ;02AE9E|9D1C04  |02041C;
                       INY                                  ;02AEA1|C8      |      ;
                       LDA.B (r_roomTerrainDataAddr),Y      ;02AEA2|B19A    |00009A;
                       STA.W r_entity_Counter,X           ;02AEA4|9D3306  |020633;
                       INY                                  ;02AEA7|C8      |      ;
                       LDA.B (r_roomTerrainDataAddr),Y      ;02AEA8|B19A    |00009A;
                       STA.W $0645,X                        ;02AEAA|9D4506  |020645;
                       JSR.W CODE_02AEDE                    ;02AEAD|20DEAE  |02AEDE;
                       JSR.W CODE_02AECA                    ;02AEB0|20CAAE  |02AECA;
                       LDA.W $0645,X                        ;02AEB3|BD4506  |020645;
                       BPL CODE_02AEC9                      ;02AEB6|1011    |02AEC9;
 
          CODE_02AEB8:
                       SEC                                  ;02AEB8|38      |      ;
                       LDA.B #$00                           ;02AEB9|A900    |      ;
                       SBC.W r_entity_XsubSpd,X           ;02AEBB|FD0905  |020509;
                       STA.W r_entity_XsubSpd,X           ;02AEBE|9D0905  |020509;
                       LDA.B #$00                           ;02AEC1|A900    |      ;
                       SBC.W r_entity_Xspd,X              ;02AEC3|FDF204  |0204F2;
                       STA.W r_entity_Xspd,X              ;02AEC6|9DF204  |0204F2;
 
          CODE_02AEC9:
                       RTS                                  ;02AEC9|60      |      ;
 
 
          CODE_02AECA:
                       LDA.W $0645,X                        ;02AECA|BD4506  |020645;
                       AND.B #$07                           ;02AECD|2907    |      ;
                       ASL A                                ;02AECF|0A      |      ;
                       TAY                                  ;02AED0|A8      |      ;
                       LDA.W DATA8_02AF0C,Y                 ;02AED1|B90CAF  |02AF0C;
                       STA.W r_entity_XsubSpd,X           ;02AED4|9D0905  |020509;
                       LDA.W DATA8_02AF0D,Y                 ;02AED7|B90DAF  |02AF0D;
                       STA.W r_entity_Xspd,X              ;02AEDA|9DF204  |0204F2;
                       RTS                                  ;02AEDD|60      |      ;
 
 
          CODE_02AEDE:
                       JSR.W CODE_02AEF8                    ;02AEDE|20F8AE  |02AEF8;
                       LDA.W $0645,X                        ;02AEE1|BD4506  |020645;
                       BPL CODE_02AEF7                      ;02AEE4|1011    |02AEF7;
 
          CODE_02AEE6:
                       SEC                                  ;02AEE6|38      |      ;
                       LDA.B #$00                           ;02AEE7|A900    |      ;
                       SBC.W r_entity_YsubSpd,X           ;02AEE9|FD3705  |020537;
                       STA.W r_entity_YsubSpd,X           ;02AEEC|9D3705  |020537;
                       LDA.B #$00                           ;02AEEF|A900    |      ;
                       SBC.W r_entity_Yspd,X              ;02AEF1|FD2005  |020520;
                       STA.W r_entity_Yspd,X              ;02AEF4|9D2005  |020520;
 
          CODE_02AEF7:
                       RTS                                  ;02AEF7|60      |      ;
 
 
          CODE_02AEF8:
                       LDA.W $0645,X                        ;02AEF8|BD4506  |020645;
                       AND.B #$07                           ;02AEFB|2907    |      ;
                       ASL A                                ;02AEFD|0A      |      ;
                       TAY                                  ;02AEFE|A8      |      ;
                       LDA.W DATA8_02AF0C,Y                 ;02AEFF|B90CAF  |02AF0C;
                       STA.W r_entity_YsubSpd,X           ;02AF02|9D3705  |020537;
                       LDA.W DATA8_02AF0D,Y                 ;02AF05|B90DAF  |02AF0D;
                       STA.W r_entity_Yspd,X              ;02AF08|9D2005  |020520;
                       RTS                                  ;02AF0B|60      |      ;
 
 
         DATA8_02AF0C:
                       db $00                               ;02AF0C|        |      ;
 
         DATA8_02AF0D:
                       db $00,$80,$00,$A0,$00,$00,$01,$20   ;02AF0D|        |      ;
                       db $00,$40,$00,$60,$00,$00,$00       ;02AF15|        |      ;
 
          CODE_02AF1C:
                       LDY.B #$00                           ;02AF1C|A000    |      ;
                       CLC                                  ;02AF1E|18      |      ;
                       LDA.W r_entity_XsubSpd,X           ;02AF1F|BD0905  |020509;
                       ADC.W r_entity_AI,X            ;02AF22|7DEF05  |0205EF;
                       STA.W r_entity_AI,X            ;02AF25|9DEF05  |0205EF;
                       LDA.W r_entity_Xspd,X              ;02AF28|BDF204  |0204F2;
                       ADC.W r_entity_target,X        ;02AF2B|7D0606  |020606;
                       STA.W r_entity_target,X        ;02AF2E|9D0606  |020606;
                       LDA.W r_entity_Xspd,X              ;02AF31|BDF204  |0204F2;
                       BPL CODE_02AF38                      ;02AF34|1002    |02AF38;
                       LDY.B #$FF                           ;02AF36|A0FF    |      ;
 
          CODE_02AF38:
                       TYA                                  ;02AF38|98      |      ;
                       ADC.W r_damagActionFlag,X       ;02AF39|7D1D06  |02061D;
                       STA.W r_damagActionFlag,X       ;02AF3C|9D1D06  |02061D;
                       RTS                                  ;02AF3F|60      |      ;
 
 
          CODE_02AF40:
                       LDY.B #$00                           ;02AF40|A000    |      ;
                       CLC                                  ;02AF42|18      |      ;
                       LDA.W r_entity_YsubSpd,X           ;02AF43|BD3705  |020537;
                       ADC.W r_entity_AI,X            ;02AF46|7DEF05  |0205EF;
                       STA.W r_entity_AI,X            ;02AF49|9DEF05  |0205EF;
                       LDA.W r_entity_Yspd,X              ;02AF4C|BD2005  |020520;
                       ADC.W r_entity_target,X        ;02AF4F|7D0606  |020606;
                       STA.W r_entity_target,X        ;02AF52|9D0606  |020606;
                       LDA.W r_entity_Yspd,X              ;02AF55|BD2005  |020520;
                       BPL CODE_02AF5C                      ;02AF58|1002    |02AF5C;
                       LDY.B #$FF                           ;02AF5A|A0FF    |      ;
 
          CODE_02AF5C:
                       TYA                                  ;02AF5C|98      |      ;
                       ADC.W r_damagActionFlag,X       ;02AF5D|7D1D06  |02061D;
                       STA.W r_damagActionFlag,X       ;02AF60|9D1D06  |02061D;
                       RTS                                  ;02AF63|60      |      ;
 
 
          CODE_02AF64:
                       LDA.W r_entity_mask,X            ;02AF64|BD7004  |020470;
                       AND.B #$01                           ;02AF67|2901    |      ;
                       BNE CODE_02AF6D                      ;02AF69|D002    |02AF6D;
 
          CODE_02AF6B:
                       CLC                                  ;02AF6B|18      |      ;
                       RTS                                  ;02AF6C|60      |      ;
 
 
          CODE_02AF6D:
                       LDA.W r_entity_XPos,X              ;02AF6D|BD3804  |020438;
                       CMP.B #$80                           ;02AF70|C980    |      ;
                       BCS CODE_02AF6B                      ;02AF72|B0F7    |02AF6B;
                       LDY.B r_sceneScrollOffsetHi          ;02AF74|A457    |000057;
                       INY                                  ;02AF76|C8      |      ;
                       STY.B r_roomSectionChrBanksDataOffset;02AF77|840F    |00000F;
                       CLC                                  ;02AF79|18      |      ;
                       LDA.B r_sceneScrollOffsetLo          ;02AF7A|A556    |000056;
                       ADC.W r_entity_XPos,X              ;02AF7C|7D3804  |020438;
                       STA.B r_tempCurrRoomIdx              ;02AF7F|850E    |00000E;
                       LDA.B r_roomSectionChrBanksDataOffset;02AF81|A50F    |00000F;
                       ADC.B #$00                           ;02AF83|6900    |      ;
                       STA.B r_roomSectionChrBanksDataOffset;02AF85|850F    |00000F;
                       LSR A                                ;02AF87|4A      |      ;
                       ROR.B r_tempCurrRoomIdx              ;02AF88|660E    |00000E;
                       LSR A                                ;02AF8A|4A      |      ;
                       ROR.B r_tempCurrRoomIdx              ;02AF8B|660E    |00000E;
                       LSR A                                ;02AF8D|4A      |      ;
                       ROR.B r_tempCurrRoomIdx              ;02AF8E|660E    |00000E;
                       LSR.B r_tempCurrRoomIdx              ;02AF90|460E    |00000E;
                       LSR.B r_tempCurrRoomIdx              ;02AF92|460E    |00000E;
                       LDY.B r_tempCurrRoomIdx              ;02AF94|A40E    |00000E;
                       DEY                                  ;02AF96|88      |      ;
                       CPY.B $5A                            ;02AF97|C45A    |00005A;
                       BCC CODE_02AF6B                      ;02AF99|90D0    |02AF6B;
                       SEC                                  ;02AF9B|38      |      ;
                       RTS                                  ;02AF9C|60      |      ;
 
 
		processColWeapons:
                       LDX.B #$1A                           ;02AF9D|A21A    |      ;
 
           wepColLoop:
                       LDA.W r_entity_mask,X            ;02AF9F|BD7004  |020470;
                       BEQ nextWeSlot                       ;02AFA2|F003    |02AFA7;
                       JSR.W do_processColWeapons           ;02AFA4|20ADAF  |02AFAD;
 
           nextWeSlot:
                       INX                                  ;02AFA7|E8      |      ;
                       CPX.B #$1C                           ;02AFA8|E01C    |      ;
                       BCC wepColLoop                       ;02AFAA|90F3    |02AF9F;
                       RTS                                  ;02AFAC|60      |      ;
 
 
		do_processColWeapons:
                       STX.B r_entityID_processed           ;02AFAD|866C    |00006C; exept alucard
                       LDY.W $078D,X                        ;02AFAF|BC8D07  |02078D;
                       BMI CODE_02AFBF                      ;02AFB2|300B    |02AFBF;
                       BNE CODE_02AFC2                      ;02AFB4|D00C    |02AFC2;
                       LDA.W r_entity_YPos,X              ;02AFB6|BD1C04  |02041C;
                       STA.W $079F,X                        ;02AFB9|9D9F07  |02079F;
 
          CODE_02AFBC:
                       JSR.W collusionStuff_00              ;02AFBC|206EB1  |02B16E;
 
          CODE_02AFBF:
                       JMP.W CODE_02B08F                    ;02AFBF|4C8FB0  |02B08F;
 
 
          CODE_02AFC2:
                       DEY                                  ;02AFC2|88      |      ;
                       BNE CODE_02AFD8                      ;02AFC3|D013    |02AFD8;
                       LDA.B #$02                           ;02AFC5|A902    |      ;
                       STA.W r_entity_mask,X            ;02AFC7|9D7004  |020470;
                       LDA.B #$00                           ;02AFCA|A900    |      ;
                       STA.W $0793,X                        ;02AFCC|9D9307  |020793;
                       STA.W $0795,X                        ;02AFCF|9D9507  |020795;
                       INC.W $078D,X                        ;02AFD2|FE8D07  |02078D;
                       JMP.W CODE_02B02A                    ;02AFD5|4C2AB0  |02B02A;
 
 
          CODE_02AFD8:
                       DEY                                  ;02AFD8|88      |      ;
                       BNE CODE_02B01C                      ;02AFD9|D041    |02B01C;
                       LDA.B #$40                           ;02AFDB|A940    |      ;
                       CLC                                  ;02AFDD|18      |      ;
                       ADC.W $0795,X                        ;02AFDE|7D9507  |020795;
                       STA.W $0795,X                        ;02AFE1|9D9507  |020795;
                       LDA.B #$00                           ;02AFE4|A900    |      ;
                       ADC.W $0793,X                        ;02AFE6|7D9307  |020793;
                       STA.W $0793,X                        ;02AFE9|9D9307  |020793;
                       LDA.W $0791,X                        ;02AFEC|BD9107  |020791;
                       CLC                                  ;02AFEF|18      |      ;
                       ADC.W $0795,X                        ;02AFF0|7D9507  |020795;
                       STA.W $0791,X                        ;02AFF3|9D9107  |020791;
                       LDA.W r_entity_YPos,X              ;02AFF6|BD1C04  |02041C;
                       ADC.W $0793,X                        ;02AFF9|7D9307  |020793;
                       STA.W r_entity_YPos,X              ;02AFFC|9D1C04  |02041C;
                       CMP.B #$E0                           ;02AFFF|C9E0    |      ;
                       BCC CODE_02B006                      ;02B001|9003    |02B006;
                       JMP.W CODE_02B28C                    ;02B003|4C8CB2  |02B28C;
 
 
          CODE_02B006:
                       LDA.B r_roomOrientation              ;02B006|A568    |000068;
                       BMI CODE_02B01F                      ;02B008|3015    |02B01F;
                       LDA.W r_entity_YPos,X              ;02B00A|BD1C04  |02041C;
                       CLC                                  ;02B00D|18      |      ;
                       ADC.B #$08                           ;02B00E|6908    |      ;
                       TAY                                  ;02B010|A8      |      ;
                       LDA.W r_entity_XPos,X              ;02B011|BD3804  |020438;
                       db $20                               ;02B014|        |      ;
                       dw getCollusion_IDX                       ;02B015|        |0FFC16;
                       BEQ CODE_02B01C                      ;02B017|F003    |02B01C;
 
          CODE_02B019:
                       INC.W $078D,X                        ;02B019|FE8D07  |02078D;
 
          CODE_02B01C:
                       JMP.W CODE_02AFBC                    ;02B01C|4CBCAF  |02AFBC;
 
 
          CODE_02B01F:
                       LDA.B #$00                           ;02B01F|A900    |      ;
                       LDY.B #$08                           ;02B021|A008    |      ;
                       db $20                               ;02B023|        |      ;
                       dw getCollusionBasedOnOffset         ;02B024|        |0FFC1E;
                       BEQ CODE_02B01C                      ;02B026|F0F4    |02B01C;
                       BNE CODE_02B019                      ;02B028|D0EF    |02B019;
 
          CODE_02B02A:
                       LDA.W $078B,X                        ;02B02A|BD8B07  |02078B;
                       CMP.B #$03                           ;02B02D|C903    |      ;
                       BEQ CODE_02B042                      ;02B02F|F011    |02B042;
 
          CODE_02B031:
                       ASL A                                ;02B031|0A      |      ;
                       TAY                                  ;02B032|A8      |      ;
                       LDA.W DATA8_02B077,Y                 ;02B033|B977B0  |02B077;
                       STA.W r_entity_spriteID,X        ;02B036|9D0004  |020400;
                       LDA.W DATA8_02B078,Y                 ;02B039|B978B0  |02B078;
                       STA.W r_entity_spriteGroup,X;02B03C|9D8C04  |02048C;
                       JMP.W CODE_02AFBC                    ;02B03F|4CBCAF  |02AFBC;
 
 
          CODE_02B042:
                       LDY.B r_partnerIdx                   ;02B042|A43B    |00003B;
                       LDA.W r_subweap,Y                  ;02B044|B98500  |020085;
                       TAY                                  ;02B047|A8      |      ;
                       LDA.W DATA8_02B083,Y                 ;02B048|B983B0  |02B083;
                       BEQ CODE_02B058                      ;02B04B|F00B    |02B058;
                       CMP.B #$FF                           ;02B04D|C9FF    |      ;
                       BEQ CODE_02B05F                      ;02B04F|F00E    |02B05F;
                       LDY.B r_partnerIdx                   ;02B051|A43B    |00003B;
                       LDA.W r_subweapMultiplier,Y        ;02B053|B98700  |020087;
                       BEQ CODE_02B05F                      ;02B056|F007    |02B05F;
 
          CODE_02B058:
                       LDA.B #$01                           ;02B058|A901    |      ;
                       STA.W $078B,X                        ;02B05A|9D8B07  |02078B;
                       BNE CODE_02B031                      ;02B05D|D0D2    |02B031;
 
          CODE_02B05F:
                       LDY.B r_partnerIdx                   ;02B05F|A43B    |00003B;
                       LDA.W r_subweapMultiplier,Y        ;02B061|B98700  |020087;
                       BEQ CODE_02B06C                      ;02B064|F006    |02B06C;
                       CMP.B #$01                           ;02B066|C901    |      ;
                       BEQ CODE_02B070                      ;02B068|F006    |02B070;
                       BNE CODE_02B058                      ;02B06A|D0EC    |02B058;
 
          CODE_02B06C:
                       LDA.B #$03                           ;02B06C|A903    |      ;
                       BNE CODE_02B031                      ;02B06E|D0C1    |02B031;
 
          CODE_02B070:
                       LDA.B #$05                           ;02B070|A905    |      ;
                       STA.W $078B,X                        ;02B072|9D8B07  |02078B;
                       BNE CODE_02B031                      ;02B075|D0BA    |02B031;
 
         DATA8_02B077:
                       db $1C                               ;02B077|        |      ;
 
         DATA8_02B078:
                       db $0E,$10,$0E,$00,$00,$58,$0E,$22   ;02B078|        |      ;
                       db $0E,$5A,$0E                       ;02B080|        |      ;
 
         DATA8_02B083:
                       db $00,$FF,$FF,$FF,$FF,$00,$00,$00   ;02B083|        |      ;
                       db $FF,$FF,$00,$00                   ;02B08B|        |      ;
 
          CODE_02B08F:
                       LDA.B r_roomOrientation              ;02B08F|A568    |000068;
                       BPL updateEntity_xPosScroll          ;02B091|1003    |02B096;
                       JMP.W updateEntity_yPosScroll        ;02B093|4C32B1  |02B132;
 
 
		updateEntity_xPosScroll:
                       LDA.W r_entity_mask,X            ;02B096|BD7004  |020470;
                       AND.B #$01                           ;02B099|2901    |      ;
                       STA.B $01                            ;02B09B|8501    |000001;
                       LDA.B #$00                           ;02B09D|A900    |      ;
                       LDY.B r_scrollSpd                    ;02B09F|A46E    |00006E;
                       BPL CODE_02B0A5                      ;02B0A1|1002    |02B0A5;
                       LDA.B #$FF                           ;02B0A3|A9FF    |      ;
 
          CODE_02B0A5:
                       STA.B $00                            ;02B0A5|8500    |000000;
                       LDA.W r_entity_XPos,X              ;02B0A7|BD3804  |020438;
                       SEC                                  ;02B0AA|38      |      ;
                       SBC.B r_scrollSpd                    ;02B0AB|E56E    |00006E;
                       STA.W r_entity_XPos,X              ;02B0AD|9D3804  |020438;
                       LDA.B $01                            ;02B0B0|A501    |000001;
                       SBC.B $00                            ;02B0B2|E500    |000000;
                       AND.B #$01                           ;02B0B4|2901    |      ;
                       STA.B $01                            ;02B0B6|8501    |000001;
                       BNE CODE_02B0CD                      ;02B0B8|D013    |02B0CD;
 
          CODE_02B0BA:
                       LDA.B $01                            ;02B0BA|A501    |000001;
                       BEQ CODE_02B0C2                      ;02B0BC|F004    |02B0C2;
                       ORA.B #$80                           ;02B0BE|0980    |      ;
                       STA.B $01                            ;02B0C0|8501    |000001;
 
          CODE_02B0C2:
                       LDA.W r_entity_mask,X            ;02B0C2|BD7004  |020470;
                       AND.B #$7E                           ;02B0C5|297E    |      ;
                       ORA.B $01                            ;02B0C7|0501    |000001;
                       STA.W r_entity_mask,X            ;02B0C9|9D7004  |020470;
                       RTS                                  ;02B0CC|60      |      ;
 
 
          CODE_02B0CD:
                       LDA.W $078D,X                        ;02B0CD|BD8D07  |02078D;
                       BNE CODE_02B0DF                      ;02B0D0|D00D    |02B0DF;
                       LDY.W $0797,X                        ;02B0D2|BC9707  |020797;
                       BEQ CODE_02B0E4                      ;02B0D5|F00D    |02B0E4;
                       LDA.W $0799,X                        ;02B0D7|BD9907  |020799;
                       ORA.W $079B,X                        ;02B0DA|1D9B07  |02079B;
                       BEQ CODE_02B0E4                      ;02B0DD|F005    |02B0E4;
 
          CODE_02B0DF:
                       LDA.B #$80                           ;02B0DF|A980    |      ;
                       STA.W $078D,X                        ;02B0E1|9D8D07  |02078D;
 
          CODE_02B0E4:
                       LDA.B #$00                           ;02B0E4|A900    |      ;
                       STA.W r_entity_spriteID,X        ;02B0E6|9D0004  |020400;
                       LDA.W r_entity_XPos,X              ;02B0E9|BD3804  |020438;
                       CMP.B #$C0                           ;02B0EC|C9C0    |      ;
                       BCS CODE_02B0BA                      ;02B0EE|B0CA    |02B0BA;
                       CMP.B #$41                           ;02B0F0|C941    |      ;
                       BCC CODE_02B0BA                      ;02B0F2|90C6    |02B0BA;
                       LDA.W r_entity_XPos,X              ;02B0F4|BD3804  |020438;
                       BPL CODE_02B110                      ;02B0F7|1017    |02B110;
                       LDY.B #$00                           ;02B0F9|A000    |      ;
                       LDA.W $07A1,Y                        ;02B0FB|B9A107  |0207A1;
                       BMI CODE_02B10A                      ;02B0FE|300A    |02B10A;
                       LDA.W $078F,X                        ;02B100|BD8F07  |02078F;
                       CMP.W $07A1,Y                        ;02B103|D9A107  |0207A1;
                       BCS CODE_02B11A                      ;02B106|B012    |02B11A;
                       BCC CODE_02B11D                      ;02B108|9013    |02B11D;
 
          CODE_02B10A:
                       LDA.W $078F,X                        ;02B10A|BD8F07  |02078F;
                       JMP.W CODE_02B11A                    ;02B10D|4C1AB1  |02B11A;
 
 
          CODE_02B110:
                       LDY.B #$01                           ;02B110|A001    |      ;
                       LDA.W $078F,X                        ;02B112|BD8F07  |02078F;
                       CMP.W $07A1,Y                        ;02B115|D9A107  |0207A1;
                       BCS CODE_02B11D                      ;02B118|B003    |02B11D;
 
          CODE_02B11A:
                       STA.W $07A1,Y                        ;02B11A|99A107  |0207A1;
 
          CODE_02B11D:
                       TAY                                  ;02B11D|A8      |      ;
                       LDA.B #$00                           ;02B11E|A900    |      ;
                       STA.W r_FogParallelPos,Y           ;02B120|998207  |020782;
 
          CODE_02B123:
                       LDA.B #$00                           ;02B123|A900    |      ;
                       STA.W r_entity_mask,X            ;02B125|9D7004  |020470;
                       STA.W r_entity_spriteID,X        ;02B128|9D0004  |020400;
                       STA.W r_entity_XPos,X              ;02B12B|9D3804  |020438;
                       STA.W r_entity_YPos,X              ;02B12E|9D1C04  |02041C;
                       RTS                                  ;02B131|60      |      ;
 
 
		updateEntity_yPosScroll:
                       LDA.W r_entity_YPos,X              ;02B132|BD1C04  |02041C;
                       CLC                                  ;02B135|18      |      ;
                       ADC.B r_scrollSpd                    ;02B136|656E    |00006E;
                       STA.W r_entity_YPos,X              ;02B138|9D1C04  |02041C;
                       BCS CODE_02B142                      ;02B13B|B005    |02B142;
                       LDA.B r_scrollSpd                    ;02B13D|A56E    |00006E;
                       BMI CODE_02B123                      ;02B13F|30E2    |02B123;
                       RTS                                  ;02B141|60      |      ;
 
 
          CODE_02B142:
                       LDA.B r_scrollSpd                    ;02B142|A56E    |00006E;
                       BPL CODE_02B123                      ;02B144|10DD    |02B123;
                       RTS                                  ;02B146|60      |      ;
 
 
          CODE_02B147:
                       LDA.W r_entity_spriteID,X        ;02B147|BD0004  |020400;
                       BEQ CODE_02B16D                      ;02B14A|F021    |02B16D;
                       LDA.W r_entity_XPos                ;02B14C|AD3804  |020438;
                       SEC                                  ;02B14F|38      |      ;
                       SBC.W r_entity_XPos,X              ;02B150|FD3804  |020438;
                       BCS CODE_02B157                      ;02B153|B002    |02B157;
                       EOR.B #$FF                           ;02B155|49FF    |      ;
 
          CODE_02B157:
                       CMP.B #$0C                           ;02B157|C90C    |      ;
                       BCS CODE_02B16D                      ;02B159|B012    |02B16D;
                       LDA.W r_entity_YPos                ;02B15B|AD1C04  |02041C;
                       SEC                                  ;02B15E|38      |      ;
                       SBC.W r_entity_YPos,X              ;02B15F|FD1C04  |02041C;
                       BCS CODE_02B166                      ;02B162|B002    |02B166;
                       EOR.B #$FF                           ;02B164|49FF    |      ;
 
          CODE_02B166:
                       CMP.B #$10                           ;02B166|C910    |      ;
                       BCS CODE_02B16D                      ;02B168|B003    |02B16D;
                       JMP.W CODE_02B2EB                    ;02B16A|4CEBB2  |02B2EB;
 
 
          CODE_02B16D:
                       RTS                                  ;02B16D|60      |      ;
 
 
    collusionStuff_00:
                       LDA.W r_entity_mask,X            ;02B16E|BD7004  |020470;
                       AND.B #$81                           ;02B171|2981    |      ;
                       BNE CODE_02B16D                      ;02B173|D0F8    |02B16D;
                       LDA.W $078D,X                        ;02B175|BD8D07  |02078D;
                       BNE CODE_02B147                      ;02B178|D0CD    |02B147;
                       JSR.W removeWall_dropWallItem        ;02B17A|20A5B2  |02B2A5;
                       LDA.W r_weaponDamage               ;02B17D|AD3006  |020630;
                       BNE do_weaponBG_collusion            ;02B180|D003    |02B185;
                       JMP.W checkSubWeBG_collusion         ;02B182|4C3EB2  |02B23E;
 
 
		do_weaponBG_collusion:
                       JMP.W weaponBG_collusion             ;02B185|4C8FB1  |02B18F;
 
 
        noBGcollusion:
                       INC.B $06                            ;02B188|E606    |000006;
                       DEC.B $07                            ;02B18A|C607    |000007;
                       BNE weaponBG_collusion               ;02B18C|D001    |02B18F;
 
          CODE_02B18E:
                       RTS                                  ;02B18E|60      |      ;
 
 
		weaponBG_collusion:
                       LDY.B r_currPartnerID                ;02B18F|A482    |000082;
                       LDA.W r_entity_YPos                ;02B191|AD1C04  |02041C;
                       CLC                                  ;02B194|18      |      ;
                       ADC.W DATA8_02B235,Y                 ;02B195|7935B2  |02B235;
                       LDY.B $06                            ;02B198|A406    |000006;
                       SEC                                  ;02B19A|38      |      ;
                       SBC.W r_tempCurrSection,Y          ;02B19B|F90D00  |02000D;
                       BCS CODE_02B1A2                      ;02B19E|B002    |02B1A2;
                       EOR.B #$FF                           ;02B1A0|49FF    |      ;
 
          CODE_02B1A2:
                       CMP.B #$08                           ;02B1A2|C908    |      ;
                       BCS noBGcollusion                    ;02B1A4|B0E2    |02B188;
                       LDA.B #$00                           ;02B1A6|A900    |      ;
                       STA.B $0B                            ;02B1A8|850B    |00000B;
                       LDY.W $0561                          ;02B1AA|AC6105  |020561;
                       LDA.W r_entity_FacingLeft          ;02B1AD|ADA804  |0204A8;
                       BEQ CODE_02B1C2                      ;02B1B0|F010    |02B1C2;
                       LDA.W r_entity_XPos                ;02B1B2|AD3804  |020438;
                       SEC                                  ;02B1B5|38      |      ;
                       SBC.W DATA8_02B22B,Y                 ;02B1B6|F92BB2  |02B22B;
                       STA.B r_temp_Xpos                    ;02B1B9|850A    |00000A;
                       LDA.B $0B                            ;02B1BB|A50B    |00000B;
                       SBC.B #$00                           ;02B1BD|E900    |      ;
                       JMP.W CODE_02B1CF                    ;02B1BF|4CCFB1  |02B1CF;
 
 
          CODE_02B1C2:
                       LDA.W r_entity_XPos                ;02B1C2|AD3804  |020438;
                       CLC                                  ;02B1C5|18      |      ;
                       ADC.W DATA8_02B22B,Y                 ;02B1C6|792BB2  |02B22B;
                       STA.B r_temp_Xpos                    ;02B1C9|850A    |00000A;
                       LDA.B $0B                            ;02B1CB|A50B    |00000B;
                       ADC.B #$00                           ;02B1CD|6900    |      ;
 
          CODE_02B1CF:
                       STA.B $0B                            ;02B1CF|850B    |00000B;
                       LDA.B r_temp_Xpos                    ;02B1D1|A50A    |00000A;
                       SEC                                  ;02B1D3|38      |      ;
                       SBC.W r_entity_XPos,X              ;02B1D4|FD3804  |020438;
                       STA.B r_collisionPointAbsoluteXRoom  ;02B1D7|8514    |000014;
                       LDA.B $0B                            ;02B1D9|A50B    |00000B;
                       SBC.B #$00                           ;02B1DB|E900    |      ;
                       STA.B r_15                           ;02B1DD|8515    |000015;
                       BCS CODE_02B1EE                      ;02B1DF|B00D    |02B1EE;
                       SEC                                  ;02B1E1|38      |      ;
                       LDA.B #$00                           ;02B1E2|A900    |      ;
                       SBC.B r_collisionPointAbsoluteXRoom  ;02B1E4|E514    |000014;
                       STA.B r_collisionPointAbsoluteXRoom  ;02B1E6|8514    |000014;
                       LDA.B #$00                           ;02B1E8|A900    |      ;
                       SBC.B r_15                           ;02B1EA|E515    |000015;
                       STA.B r_15                           ;02B1EC|8515    |000015;
 
          CODE_02B1EE:
                       LDA.B r_15                           ;02B1EE|A515    |000015;
                       BNE noBGcollusion                    ;02B1F0|D096    |02B188;
                       LDA.B r_collisionPointAbsoluteXRoom  ;02B1F2|A514    |000014;
                       CMP.W DATA8_02B230,Y                 ;02B1F4|D930B2  |02B230;
                       BCS CODE_02B18E                      ;02B1F7|B095    |02B18E;
 
          CODE_02B1F9:
                       LDA.B #$34                           ;02B1F9|A934    |      ;
                       db $20                               ;02B1FB|        |      ;
                       dw lunchMusic                        ;02B1FC|        |0FE25F;
                       JSR.W CODE_02B40D                    ;02B1FE|200DB4  |02B40D;
                       LDY.W $0797,X                        ;02B201|BC9707  |020797;
                       BEQ CODE_02B21F                      ;02B204|F019    |02B21F;
                       LDA.B #$FF                           ;02B206|A9FF    |      ;
                       LDY.B $06                            ;02B208|A406    |000006;
                       BNE CODE_02B212                      ;02B20A|D006    |02B212;
                       STA.W $0799,X                        ;02B20C|9D9907  |020799;
                       JMP.W CODE_02B215                    ;02B20F|4C15B2  |02B215;
 
 
          CODE_02B212:
                       STA.W $079B,X                        ;02B212|9D9B07  |02079B;
 
          CODE_02B215:
                       LDA.W $0799,X                        ;02B215|BD9907  |020799;
                       AND.W $079B,X                        ;02B218|3D9B07  |02079B;
                       CMP.B #$FF                           ;02B21B|C9FF    |      ;
                       BNE CODE_02B22A                      ;02B21D|D00B    |02B22A;
 
          CODE_02B21F:
                       LDY.W $079D,X                        ;02B21F|BC9D07  |02079D;
                       LDA.B #$FF                           ;02B222|A9FF    |      ;
                       STA.W $00F4,Y                        ;02B224|99F400  |0200F4;
                       INC.W $078D,X                        ;02B227|FE8D07  |02078D;
 
          CODE_02B22A:
                       RTS                                  ;02B22A|60      |      ;
 
 
         DATA8_02B22B:
                       db $18,$18,$20,$18,$18               ;02B22B|        |      ;
 
         DATA8_02B230:
                       db $10,$10,$18,$10,$10               ;02B230|        |      ;
 
         DATA8_02B235:
                       db $FE,$FE,$FE,$FE,$03,$03,$03,$03   ;02B235|        |      ;
                       db $03                               ;02B23D|        |      ;
 
		checkSubWeBG_collusion:
                       LDA.W r_entity_XPos,X              ;02B23E|BD3804  |020438;
                       STA.B $04                            ;02B241|8504    |000004;
                       LDA.W r_entity_YPos,X              ;02B243|BD1C04  |02041C;
                       STA.B $05                            ;02B246|8505    |000005;
                       LDX.B #$14                           ;02B248|A214    |      ;
 
          CODE_02B24A:
                       LDA.W r_entity_ID,X       ;02B24A|BD4E05  |02054E;
                       CMP.B #$0A                           ;02B24D|C90A    |      ;
                       BEQ alucardsShoots_wallCol           ;02B24F|F00F    |02B260;
		
	if !grantNinjaStar == 1		; add subWe ID here for wall collusion 						
						cmp.b #$0e 
						beq alucardsShoots_wallCol
	endif 
 
          CODE_02B251:
                       INX                                  ;02B251|E8      |      ;
                       CPX.B #$17                           ;02B252|E017    |      ;
                       BCC CODE_02B24A                      ;02B254|90F4    |02B24A;
                       LDX.B r_entityID_processed           ;02B256|A66C    |00006C;
                       RTS                                  ;02B258|60      |      ;
 
 
          CODE_02B259:
                       INY                                  ;02B259|C8      |      ;
                       DEC.B $00                            ;02B25A|C600    |000000;
                       BEQ CODE_02B251                      ;02B25C|F0F3    |02B251;
                       BNE CODE_02B266                      ;02B25E|D006    |02B266;
 
		alucardsShoots_wallCol:
                       LDA.B $07                            ;02B260|A507    |000007;
                       STA.B $00                            ;02B262|8500    |000000;
                       LDY.B $06                            ;02B264|A406    |000006;
 
          CODE_02B266:
                       LDA.W r_entity_YPos,X              ;02B266|BD1C04  |02041C;
                       SEC                                  ;02B269|38      |      ;
                       SBC.W r_tempCurrSection,Y          ;02B26A|F90D00  |02000D;
                       BCS CODE_02B271                      ;02B26D|B002    |02B271;
                       EOR.B #$FF                           ;02B26F|49FF    |      ;
 
          CODE_02B271:
                       CMP.B #$08                           ;02B271|C908    |      ;
                       BCS CODE_02B259                      ;02B273|B0E4    |02B259;
                       LDA.W r_entity_XPos,X              ;02B275|BD3804  |020438;
                       SBC.B $04                            ;02B278|E504    |000004;
                       BCS CODE_02B27E                      ;02B27A|B002    |02B27E;
                       EOR.B #$FF                           ;02B27C|49FF    |      ;
 
          CODE_02B27E:
                       CMP.B #$10                           ;02B27E|C910    |      ;
                       BCS CODE_02B259                      ;02B280|B0D7    |02B259;
                       LDA.B #$10                           ;02B282|A910    |      ;
                       STA.W r_damagActionFlag,X       ;02B284|9D1D06  |02061D;
                       LDX.B r_entityID_processed           ;02B287|A66C    |00006C;
                       JMP.W CODE_02B1F9                    ;02B289|4CF9B1  |02B1F9;
 
 
          CODE_02B28C:
                       LDA.W $079F,X                        ;02B28C|BD9F07  |02079F;
                       STA.W r_entity_YPos,X              ;02B28F|9D1C04  |02041C;
                       LDA.B #$00                           ;02B292|A900    |      ;
                       STA.W r_entity_spriteID,X        ;02B294|9D0004  |020400;
                       STA.W r_entity_spriteGroup,X;02B297|9D8C04  |02048C;
                       LDA.B #$02                           ;02B29A|A902    |      ;
                       STA.W r_entity_mask,X            ;02B29C|9D7004  |020470;
                       LDA.B #$80                           ;02B29F|A980    |      ;
                       STA.W $078D,X                        ;02B2A1|9D8D07  |02078D;
                       RTS                                  ;02B2A4|60      |      ;
 
 
		removeWall_dropWallItem:
                       LDY.W $0797,X                        ;02B2A5|BC9707  |020797;
                       BEQ CODE_02B2CC                      ;02B2A8|F022    |02B2CC;
                       LDY.B #$00                           ;02B2AA|A000    |      ;
                       LDA.W $0799,X                        ;02B2AC|BD9907  |020799;
                       BNE CODE_02B2BA                      ;02B2AF|D009    |02B2BA;
                       LDA.W r_entity_YPos,X              ;02B2B1|BD1C04  |02041C;
                       SEC                                  ;02B2B4|38      |      ;
                       SBC.B #$08                           ;02B2B5|E908    |      ;
                       STA.B r_tempCurrSection              ;02B2B7|850D    |00000D;
                       INY                                  ;02B2B9|C8      |      ;
 
          CODE_02B2BA:
                       LDA.W $079B,X                        ;02B2BA|BD9B07  |02079B;
                       BNE CODE_02B2C9                      ;02B2BD|D00A    |02B2C9;
                       LDA.W r_entity_YPos,X              ;02B2BF|BD1C04  |02041C;
                       CLC                                  ;02B2C2|18      |      ;
                       ADC.B #$08                           ;02B2C3|6908    |      ;
                       STA.B r_tempCurrRoomIdx              ;02B2C5|850E    |00000E;
                       INY                                  ;02B2C7|C8      |      ;
                       INY                                  ;02B2C8|C8      |      ;
 
          CODE_02B2C9:
                       JMP.W CODE_02B2D3                    ;02B2C9|4CD3B2  |02B2D3;
 
 
          CODE_02B2CC:
                       LDY.B #$01                           ;02B2CC|A001    |      ;
                       LDA.W r_entity_YPos,X              ;02B2CE|BD1C04  |02041C;
                       STA.B r_tempCurrSection              ;02B2D1|850D    |00000D;
 
          CODE_02B2D3:
                       STY.B r_roomSectionChrBanksDataOffset;02B2D3|840F    |00000F;
                       LDY.B r_roomSectionChrBanksDataOffset;02B2D5|A40F    |00000F;
                       CPY.B #$03                           ;02B2D7|C003    |      ;
                       BEQ CODE_02B2E3                      ;02B2D9|F008    |02B2E3;
                       DEY                                  ;02B2DB|88      |      ;
                       STY.B $06                            ;02B2DC|8406    |000006;
                       LDY.B #$01                           ;02B2DE|A001    |      ;
                       STY.B $07                            ;02B2E0|8407    |000007;
                       RTS                                  ;02B2E2|60      |      ;
 
 
          CODE_02B2E3:
                       DEY                                  ;02B2E3|88      |      ;
                       STY.B $07                            ;02B2E4|8407    |000007;
                       LDA.B #$00                           ;02B2E6|A900    |      ;
                       STA.B $06                            ;02B2E8|8506    |000006;
                       RTS                                  ;02B2EA|60      |      ;
 
 
          CODE_02B2EB:
                       JSR.W CODE_02B28C                    ;02B2EB|208CB2  |02B28C;
                       LDY.W $078B,X                        ;02B2EE|BC8B07  |02078B;
                       BEQ CODE_02B333                      ;02B2F1|F040    |02B333;
                       DEY                                  ;02B2F3|88      |      ;
                       BEQ CODE_02B326                      ;02B2F4|F030    |02B326;
                       DEY                                  ;02B2F6|88      |      ;
                       BEQ CODE_02B31D                      ;02B2F7|F024    |02B31D;
                       DEY                                  ;02B2F9|88      |      ;
                       BEQ CODE_02B308                      ;02B2FA|F00C    |02B308;
                       DEY                                  ;02B2FC|88      |      ;
                       BEQ DATA8_02B320                     ;02B2FD|F021    |02B320;
                       JSR.W CODE_02B348                    ;02B2FF|2048B3  |02B348;
                       BCS CODE_02B326                      ;02B302|B022    |02B326;
                       LDA.B #$02                           ;02B304|A902    |      ;
                       BNE CODE_02B30F                      ;02B306|D007    |02B30F;
 
          CODE_02B308:
                       JSR.W CODE_02B348                    ;02B308|2048B3  |02B348;
                       BCS CODE_02B326                      ;02B30B|B019    |02B326;
                       LDA.B #$01                           ;02B30D|A901    |      ;
 
          CODE_02B30F:
                       LDY.B r_partnerIdx                   ;02B30F|A43B    |00003B;
                       STA.W r_subweapMultiplier,Y        ;02B311|998700  |020087;
                       LDA.B #$1C                           ;02B314|A91C    |      ;
                       db $20                               ;02B316|        |      ;
                       dw lunchMusic                        ;02B317|        |0FE25F;
                       LDA.B #$00                           ;02B319|A900    |      ;
                       STA.B $9C                            ;02B31B|859C    |00009C;
 
          CODE_02B31D:
                       LDX.B r_entityID_processed           ;02B31D|A66C    |00006C;
                       RTS                                  ;02B31F|60      |      ;
 
 
         DATA8_02B320:
                       db $20                               ;02B320|        |      ;
                       dw subHeart_A                        ;02B321|        |0FE748;
                       JMP.W CODE_02B31D                    ;02B323|4C1DB3  |02B31D;
 
 
          CODE_02B326:
                       LDA.B #$1B                           ;02B326|A91B    |      ;
                       db $20                               ;02B328|        |      ;
                       dw lunchMusic                        ;02B329|        |0FE25F;
                       LDA.B #$05                           ;02B32B|A905    |      ;
                       db $20                               ;02B32D|        |      ;
                       dw mainUpdateHeartCount_HUD          ;02B32E|        |0FE760;
                       JMP.W CODE_02B31D                    ;02B330|4C1DB3  |02B31D;
 
 
          CODE_02B333:
                       LDA.B #$2C                           ;02B333|A92C    |      ;
                       db $20                               ;02B335|        |      ;
                       dw lunchMusic                        ;02B336|        |0FE25F;
                       CLC                                  ;02B338|18      |      ;
                       LDA.B r_HUD_healthPlayer             ;02B339|A53C    |00003C;
                       ADC.B #$20                           ;02B33B|6920    |      ;
                       CMP.B #$41                           ;02B33D|C941    |      ;
                       BCC CODE_02B343                      ;02B33F|9002    |02B343;
                       LDA.B #$40                           ;02B341|A940    |      ;
 
          CODE_02B343:
                       STA.B r_HUD_healthPlayer             ;02B343|853C    |00003C;
                       JMP.W CODE_02B31D                    ;02B345|4C1DB3  |02B31D;
 
 
          CODE_02B348:
                       LDA.W r_entity_ID         ;02B348|AD4E05  |02054E;
                       CMP.B #$01                           ;02B34B|C901    |      ;
                       BEQ CODE_02B360                      ;02B34D|F011    |02B360;
                       CMP.B #$03                           ;02B34F|C903    |      ;
                       BEQ CODE_02B360                      ;02B351|F00D    |02B360;
                       LDY.B r_partnerIdx                   ;02B353|A43B    |00003B;
                       LDA.W r_subweap,Y                  ;02B355|B98500  |020085;
                       TAY                                  ;02B358|A8      |      ;
                       LDA.W DATA8_02B083,Y                 ;02B359|B983B0  |02B083;
                       BEQ CODE_02B360                      ;02B35C|F002    |02B360;
                       CLC                                  ;02B35E|18      |      ;
                       RTS                                  ;02B35F|60      |      ;
 
 
          CODE_02B360:
                       SEC                                  ;02B360|38      |      ;
                       RTS                                  ;02B361|60      |      ;
 
 
          CODE_02B362:
                       LDX.B r_sceneDrawQueue               ;02B362|A61D    |00001D;
                       LDA.B #$01                           ;02B364|A901    |      ;
                       db $20                               ;02B366|        |      ;
                       dw storeByteVramQueue                ;02B367|        |0FED16;
                       LDA.B #$00                           ;02B369|A900    |      ;
                       STA.B r_VRAM_QueueDestHi             ;02B36B|8562    |000062;
                       LDY.B $06                            ;02B36D|A406    |000006;
                       LDA.W r_tempCurrSection,Y          ;02B36F|B90D00  |02000D;
                       SEC                                  ;02B372|38      |      ;
                       SBC.B #$33                           ;02B373|E933    |      ;
                       BCS CODE_02B382                      ;02B375|B00B    |02B382;
                       CLC                                  ;02B377|18      |      ;
                       ADC.B r_sceneScrollOffsetLo          ;02B378|6556    |000056;
                       BCS CODE_02B38A                      ;02B37A|B00E    |02B38A;
                       SEC                                  ;02B37C|38      |      ;
                       SBC.B #$10                           ;02B37D|E910    |      ;
                       JMP.W CODE_02B38A                    ;02B37F|4C8AB3  |02B38A;
 
 
          CODE_02B382:
                       CLC                                  ;02B382|18      |      ;
                       ADC.B r_sceneScrollOffsetLo          ;02B383|6556    |000056;
                       BCC CODE_02B38A                      ;02B385|9003    |02B38A;
                       CLC                                  ;02B387|18      |      ;
                       ADC.B #$10                           ;02B388|6910    |      ;
 
          CODE_02B38A:
                       CMP.B #$F0                           ;02B38A|C9F0    |      ;
                       BCC CODE_02B391                      ;02B38C|9003    |02B391;
                       CLC                                  ;02B38E|18      |      ;
                       ADC.B #$10                           ;02B38F|6910    |      ;
 
          CODE_02B391:
                       AND.B #$F0                           ;02B391|29F0    |      ;
                       ASL A                                ;02B393|0A      |      ;
                       ROL.B r_VRAM_QueueDestHi             ;02B394|2662    |000062;
                       ASL A                                ;02B396|0A      |      ;
                       ROL.B r_VRAM_QueueDestHi             ;02B397|2662    |000062;
                       STA.B r_VRAM_QueueDestLo             ;02B399|8561    |000061;
                       STX.B r_sceneDrawQueue               ;02B39B|861D    |00001D;
                       LDX.B r_entityID_processed           ;02B39D|A66C    |00006C;
                       LDA.W r_entity_XPos,X              ;02B39F|BD3804  |020438;
                       AND.B #$F0                           ;02B3A2|29F0    |      ;
                       LSR A                                ;02B3A4|4A      |      ;
                       LSR A                                ;02B3A5|4A      |      ;
                       LSR A                                ;02B3A6|4A      |      ;
                       CLC                                  ;02B3A7|18      |      ;
                       ADC.B r_VRAM_QueueDestLo             ;02B3A8|6561    |000061;
                       STA.B r_VRAM_QueueDestLo             ;02B3AA|8561    |000061;
                       LDX.B r_sceneDrawQueue               ;02B3AC|A61D    |00001D;
                       db $20                               ;02B3AE|        |      ;
                       dw storeByteVramQueue                ;02B3AF|        |0FED16;
                       LDA.B r_VRAM_QueueDestHi             ;02B3B1|A562    |000062;
                       CLC                                  ;02B3B3|18      |      ;
                       ADC.B #$28                           ;02B3B4|6928    |      ;
                       STA.B r_VRAM_QueueDestHi             ;02B3B6|8562    |000062;
                       db $20                               ;02B3B8|        |      ;
                       dw storeByteVramQueue                ;02B3B9|        |0FED16;
                       LDA.B #$00                           ;02B3BB|A900    |      ;
                       db $20                               ;02B3BD|        |      ;
                       dw storeByteVramQueue                ;02B3BE|        |0FED16;
                       db $20                               ;02B3C0|        |      ;
                       dw storeByteVramQueue                ;02B3C1|        |0FED16;
                       db $20                               ;02B3C3|        |      ;
                       dw endVRAM_queue                     ;02B3C4|        |0FE8DE;
                       LDA.B #$01                           ;02B3C6|A901    |      ;
                       db $20                               ;02B3C8|        |      ;
                       dw storeByteVramQueue                ;02B3C9|        |0FED16;
                       LDA.B r_VRAM_QueueDestLo             ;02B3CB|A561    |000061;
                       CLC                                  ;02B3CD|18      |      ;
                       ADC.B #$20                           ;02B3CE|6920    |      ;
                       db $20                               ;02B3D0|        |      ;
                       dw storeByteVramQueue                ;02B3D1|        |0FED16;
                       LDA.B r_VRAM_QueueDestHi             ;02B3D3|A562    |000062;
                       db $20                               ;02B3D5|        |      ;
                       dw storeByteVramQueue                ;02B3D6|        |0FED16;
                       LDA.B #$00                           ;02B3D8|A900    |      ;
                       db $20                               ;02B3DA|        |      ;
                       dw storeByteVramQueue                ;02B3DB|        |0FED16;
                       db $20                               ;02B3DD|        |      ;
                       dw storeByteVramQueue                ;02B3DE|        |0FED16;
                       db $20                               ;02B3E0|        |      ;
                       dw endVRAM_queue                     ;02B3E1|        |0FE8DE;
                       LDY.B $06                            ;02B3E3|A406    |000006;
                       LDX.B r_entityID_processed           ;02B3E5|A66C    |00006C;
                       LDA.W r_tempCurrSection,Y          ;02B3E7|B90D00  |02000D;
                       SEC                                  ;02B3EA|38      |      ;
                       SBC.W r_entity_YPos,X              ;02B3EB|FD1C04  |02041C;
                       TAY                                  ;02B3EE|A8      |      ;
                       LDA.B #$F8                           ;02B3EF|A9F8    |      ;
                       db $20                               ;02B3F1|        |      ;
                       dw getCollusionBasedOnOffset         ;02B3F2|        |0FFC1E;
                       LDA.W r_entity_XPos,X              ;02B3F4|BD3804  |020438;
                       AND.B #$10                           ;02B3F7|2910    |      ;
                       BNE CODE_02B402                      ;02B3F9|D007    |02B402;
                       LDA.W r_collisionMap,Y             ;02B3FB|B9E006  |0206E0;
                       AND.B #$0F                           ;02B3FE|290F    |      ;
                       BPL CODE_02B407                      ;02B400|1005    |02B407;
 
          CODE_02B402:
                       LDA.W r_collisionMap,Y             ;02B402|B9E006  |0206E0;
                       AND.B #$F0                           ;02B405|29F0    |      ;
 
          CODE_02B407:
                       STA.W r_collisionMap,Y             ;02B407|99E006  |0206E0;
                       JMP.W CODE_02B4BB                    ;02B40A|4CBBB4  |02B4BB;
 
 
          CODE_02B40D:
                       LDA.B r_roomOrientation              ;02B40D|A568    |000068;
                       BPL CODE_02B414                      ;02B40F|1003    |02B414;
                       JMP.W CODE_02B362                    ;02B411|4C62B3  |02B362;
 
 
          CODE_02B414:
                       LDA.W r_entity_XPos,X              ;02B414|BD3804  |020438;
                       CLC                                  ;02B417|18      |      ;
                       ADC.B r_sceneScrollOffsetLo          ;02B418|6556    |000056;
                       AND.B #$F0                           ;02B41A|29F0    |      ;
                       STA.B r_temp_Xpos                    ;02B41C|850A    |00000A;
                       LDA.B r_sceneScrollOffsetHi          ;02B41E|A557    |000057;
                       ADC.B #$00                           ;02B420|6900    |      ;
                       STA.B $0B                            ;02B422|850B    |00000B;
                       LDA.B #$00                           ;02B424|A900    |      ;
                       STA.B r_VRAM_QueueDestHi             ;02B426|8562    |000062;
                       LDY.B $06                            ;02B428|A406    |000006;
                       LDA.W r_tempCurrSection,Y          ;02B42A|B90D00  |02000D;
                       AND.B #$F0                           ;02B42D|29F0    |      ;
                       STA.B r_pointerQueue                 ;02B42F|8508    |000008;
                       ASL A                                ;02B431|0A      |      ;
                       ROL.B r_VRAM_QueueDestHi             ;02B432|2662    |000062;
                       ASL A                                ;02B434|0A      |      ;
                       ROL.B r_VRAM_QueueDestHi             ;02B435|2662    |000062;
                       STA.B r_VRAM_QueueDestLo             ;02B437|8561    |000061;
                       LDA.B r_temp_Xpos                    ;02B439|A50A    |00000A;
                       LSR A                                ;02B43B|4A      |      ;
                       LSR A                                ;02B43C|4A      |      ;
                       LSR A                                ;02B43D|4A      |      ;
                       CLC                                  ;02B43E|18      |      ;
                       ADC.B r_VRAM_QueueDestLo             ;02B43F|6561    |000061;
                       STA.B r_VRAM_QueueDestLo             ;02B441|8561    |000061;
                       LDY.B #$20                           ;02B443|A020    |      ;
                       LDA.B $0B                            ;02B445|A50B    |00000B;
                       EOR.B r_075                          ;02B447|4575    |000075;
                       AND.B #$01                           ;02B449|2901    |      ;
                       BEQ CODE_02B44F                      ;02B44B|F002    |02B44F;
                       LDY.B #$24                           ;02B44D|A024    |      ;
 
          CODE_02B44F:
                       TYA                                  ;02B44F|98      |      ;
                       CLC                                  ;02B450|18      |      ;
                       ADC.B r_VRAM_QueueDestHi             ;02B451|6562    |000062;
                       STA.B r_VRAM_QueueDestHi             ;02B453|8562    |000062;
                       db $20                               ;02B455|        |      ;
                       dw updateVRAM_1                      ;02B456|        |0FE8B5;
                       LDA.B #$00                           ;02B458|A900    |      ;
                       db $20                               ;02B45A|        |      ;
                       dw storeByteVramQueue                ;02B45B|        |0FED16;
                       db $20                               ;02B45D|        |      ;
                       dw storeByteVramQueue                ;02B45E|        |0FED16;
                       db $20                               ;02B460|        |      ;
                       db $DE,$E8                           ;02B461|        |      ;
                       LDA.B #$20                           ;02B463|A920    |      ;
                       CLC                                  ;02B465|18      |      ;
                       ADC.B r_VRAM_QueueDestLo             ;02B466|6561    |000061;
                       STA.B r_VRAM_QueueDestLo             ;02B468|8561    |000061;
                       db $20                               ;02B46A|        |      ;
                       dw updateVRAM_1                      ;02B46B|        |0FE8B5;
                       LDA.B #$00                           ;02B46D|A900    |      ;
                       db $20                               ;02B46F|        |      ;
                       dw storeByteVramQueue                ;02B470|        |0FED16;
                       db $20                               ;02B472|        |      ;
                       dw storeByteVramQueue                ;02B473|        |0FED16;
                       db $20                               ;02B475|        |      ;
                       dw endVRAM_queue                     ;02B476|        |0FE8DE;
                       LDA.B r_temp_Xpos                    ;02B478|A50A    |00000A;
                       LSR A                                ;02B47A|4A      |      ;
                       LSR A                                ;02B47B|4A      |      ;
                       LSR A                                ;02B47C|4A      |      ;
                       LSR A                                ;02B47D|4A      |      ;
                       LSR A                                ;02B47E|4A      |      ;
                       STA.B $00                            ;02B47F|8500    |000000;
                       LDY.B $0B                            ;02B481|A40B    |00000B;
                       db $B9                               ;02B483|        |      ; lda
                       dw DATA8_0FFD58                      ;02B484|        |0FFD58;
                       CLC                                  ;02B486|18      |      ;
                       ADC.B $00                            ;02B487|6500    |000000;
                       CMP.B #$0C                           ;02B489|C90C    |      ;
                       BCC CODE_02B490                      ;02B48B|9003    |02B490;
                       SEC                                  ;02B48D|38      |      ;
                       SBC.B #$0C                           ;02B48E|E90C    |      ;
 
          CODE_02B490:
                       TAY                                  ;02B490|A8      |      ;
                       db $B9                               ;02B491|        |      ; lda
                       dw OAM_attribTableFF                 ;02B492|        |0FFD4C;
                       STA.B $00                            ;02B494|8500    |000000;
                       LDA.B r_pointerQueue                 ;02B496|A508    |000008;
                       SEC                                  ;02B498|38      |      ;
                       SBC.B #$20                           ;02B499|E920    |      ;
                       LSR A                                ;02B49B|4A      |      ;
                       LSR A                                ;02B49C|4A      |      ;
                       LSR A                                ;02B49D|4A      |      ;
                       LSR A                                ;02B49E|4A      |      ;
                       CLC                                  ;02B49F|18      |      ;
                       ADC.B $00                            ;02B4A0|6500    |000000;
                       TAY                                  ;02B4A2|A8      |      ;
                       LDA.B r_temp_Xpos                    ;02B4A3|A50A    |00000A;
                       AND.B #$10                           ;02B4A5|2910    |      ;
                       BNE CODE_02B4B3                      ;02B4A7|D00A    |02B4B3;
                       LDA.W r_collisionMap,Y             ;02B4A9|B9E006  |0206E0;
                       AND.B #$0F                           ;02B4AC|290F    |      ;
                       STA.W r_collisionMap,Y             ;02B4AE|99E006  |0206E0;
                       BPL CODE_02B4BB                      ;02B4B1|1008    |02B4BB;
 
          CODE_02B4B3:
                       LDA.W r_collisionMap,Y             ;02B4B3|B9E006  |0206E0;
                       AND.B #$F0                           ;02B4B6|29F0    |      ;
                       STA.W r_collisionMap,Y             ;02B4B8|99E006  |0206E0;
 
          CODE_02B4BB:
                       LDX.B r_entityID_processed           ;02B4BB|A66C    |00006C;
                       LDA.W r_entity_XPos,X              ;02B4BD|BD3804  |020438;
                       STA.B $04                            ;02B4C0|8504    |000004;
                       LDA.W r_entity_YPos,X              ;02B4C2|BD1C04  |02041C;
                       STA.B $05                            ;02B4C5|8505    |000005;
                       LDA.B r_frameCount         ;02B4C7|A51A    |00001A;
                       AND.B #$07                           ;02B4C9|2907    |      ;
                       STA.B $00                            ;02B4CB|8500    |000000;
                       ASL A                                ;02B4CD|0A      |      ;
                       CLC                                  ;02B4CE|18      |      ;
                       ADC.B $00                            ;02B4CF|6500    |000000;
                       STA.B $00                            ;02B4D1|8500    |000000;
                       LDX.B #$14                           ;02B4D3|A214    |      ;
 
          CODE_02B4D5:
                       LDA.W r_entity_ID,X       ;02B4D5|BD4E05  |02054E;
                       BEQ CODE_02B4E2                      ;02B4D8|F008    |02B4E2;
 
          CODE_02B4DA:
                       INX                                  ;02B4DA|E8      |      ;
                       CPX.B #$17                           ;02B4DB|E017    |      ;
                       BCC CODE_02B4D5                      ;02B4DD|90F6    |02B4D5;
                       LDX.B r_entityID_processed           ;02B4DF|A66C    |00006C;
                       RTS                                  ;02B4E1|60      |      ;
 
 
          CODE_02B4E2:
                       LDA.B #$0D                           ;02B4E2|A90D    |      ;
                       STA.W r_entity_ID,X       ;02B4E4|9D4E05  |02054E;
                       LDA.B #$00                           ;02B4E7|A900    |      ;
                       STA.W r_Player_StateDoubled,X      ;02B4E9|9D6505  |020565;
                       LDY.B $00                            ;02B4EC|A400    |000000;
                       INC.B $00                            ;02B4EE|E600    |000000;
                       LDA.W DATA8_02B528,Y                 ;02B4F0|B928B5  |02B528;
                       ASL A                                ;02B4F3|0A      |      ;
                       STA.B $02                            ;02B4F4|8502    |000002;
                       ASL A                                ;02B4F6|0A      |      ;
                       CLC                                  ;02B4F7|18      |      ;
                       ADC.B $02                            ;02B4F8|6502    |000002;
                       TAY                                  ;02B4FA|A8      |      ;
                       LDA.W DATA8_02B540,Y                 ;02B4FB|B940B5  |02B540;
                       CLC                                  ;02B4FE|18      |      ;
                       ADC.B $04                            ;02B4FF|6504    |000004;
                       STA.W r_entity_XPos,X              ;02B501|9D3804  |020438;
                       LDA.W DATA8_02B541,Y                 ;02B504|B941B5  |02B541;
                       CLC                                  ;02B507|18      |      ;
                       ADC.B $05                            ;02B508|6505    |000005;
                       STA.W r_entity_YPos,X              ;02B50A|9D1C04  |02041C;
                       LDA.W DATA8_02B542,Y                 ;02B50D|B942B5  |02B542;
                       STA.W r_entity_Xspd,X              ;02B510|9DF204  |0204F2;
                       LDA.W DATA8_02B543,Y                 ;02B513|B943B5  |02B543;
                       STA.W r_entity_XsubSpd,X           ;02B516|9D0905  |020509;
                       LDA.W DATA8_02B544,Y                 ;02B519|B944B5  |02B544;
                       STA.W r_entity_Yspd,X              ;02B51C|9D2005  |020520;
                       LDA.W DATA8_02B545,Y                 ;02B51F|B945B5  |02B545;
                       STA.W r_entity_YsubSpd,X           ;02B522|9D3705  |020537;
                       JMP.W CODE_02B4DA                    ;02B525|4CDAB4  |02B4DA;
 
 
         DATA8_02B528:
                       db $00,$07,$04,$04,$01,$03,$02,$07   ;02B528|        |      ;
                       db $05,$04,$06,$01,$00,$02,$04,$01   ;02B530|        |      ;
                       db $05,$06,$06,$03,$02,$00,$07,$04   ;02B538|        |      ;
 
         DATA8_02B540:
                       db $03                               ;02B540|        |      ;
 
         DATA8_02B541:
                       db $FC                               ;02B541|        |      ;
 
         DATA8_02B542:
                       db $00                               ;02B542|        |      ;
 
         DATA8_02B543:
                       db $80                               ;02B543|        |      ;
 
         DATA8_02B544:
                       db $FE                               ;02B544|        |      ;
 
         DATA8_02B545:
                       db $00,$FE,$04,$FE,$80,$FE,$80,$00   ;02B545|        |      ;
                       db $F6,$01,$20,$FF,$00,$FC,$08,$FF   ;02B54D|        |      ;
                       db $80,$FD,$C0,$06,$FA,$01,$80,$FE   ;02B555|        |      ;
                       db $80,$F8,$02,$FE,$C0,$FE,$40,$08   ;02B55D|        |      ;
                       db $F8,$02,$00,$FD,$00,$F6,$0C,$FF   ;02B565|        |      ;
                       db $40,$FE,$40                       ;02B56D|        |      ;
}


{ ; -- title screen and intro ------------------------------------------------------
 
		titleLighning_screenLoad_00:
				cpx #$02
				beq +
				ldx #$22
			+	jmp newScreenLoad			; loadScreen_decompress
											; dw RLE_tilemap_01_titleScreen  !!screens loaded	
											; dw RLE_tilemap_10_ending01  

 
	thunderTitleScreen_02:
						LDA.W PTR16_02B8BB,X                 ;02B7E1|BDBBB8  |02B8BB;
						STA.B $00                            ;02B7E4|8500    |000000;
						LDA.W PTR16_02B8BB+1,X                 ;02B7E6|BDBCB8  |02B8BC;
						STA.B $01                            ;02B7E9|8501    |000001;
						LDA.W $07EF                          ;02B7EB|ADEF07  |0207EF;
						AND.B #$FC                           ;02B7EE|29FC    |      ;
						ASL A                                ;02B7F0|0A      |      ;
						STA.B $05                            ;02B7F1|8505    |000005;
						LDX.B r_sceneDrawQueue               ;02B7F3|A61D    |00001D;
						LDA.B #$01                           ;02B7F5|A901    |      ;
						JSR.W titleScreenLoad_00             ;02B7F7|2095B9  |02B995;
						LDA.B #$20                           ;02B7FA|A920    |      ;
						STA.B $03                            ;02B7FC|8503    |000003;
						LDA.B r_PPUCtrl                      ;02B7FE|A5FF    |0000FF;
						AND.B #$02                           ;02B800|2902    |      ;
						BNE CODE_02B808                      ;02B802|D004    |02B808;
						LDA.B #$28                           ;02B804|A928    |      ;
						STA.B $03                            ;02B806|8503    |000003;
	
			CODE_02B808:
						LDA.B #$00                           ;02B808|A900    |      ;
						STA.B $02                            ;02B80A|8502    |000002;
						LDA.W $07EF                          ;02B80C|ADEF07  |0207EF;
						ASL A                                ;02B80F|0A      |      ;
						ROL.B $02                            ;02B810|2602    |000002;
						ASL A                                ;02B812|0A      |      ;
						ROL.B $02                            ;02B813|2602    |000002;
						ASL A                                ;02B815|0A      |      ;
						ROL.B $02                            ;02B816|2602    |000002;
						ASL A                                ;02B818|0A      |      ;
						ROL.B $02                            ;02B819|2602    |000002;
						ASL A                                ;02B81B|0A      |      ;
						ROL.B $02                            ;02B81C|2602    |000002;
						JSR.W titleScreenLoad_00             ;02B81E|2095B9  |02B995;
						LDA.B $02                            ;02B821|A502    |000002;
						ORA.B $03                            ;02B823|0503    |000003;
						JSR.W titleScreenLoad_00             ;02B825|2095B9  |02B995;
						LDA.B #$08                           ;02B828|A908    |      ;
						STA.B r_pointerQueue                 ;02B82A|8508    |000008;
	
			CODE_02B82C:
						LDY.B $05                            ;02B82C|A405    |000005;
						LDA.B #$00                           ;02B82E|A900    |      ;
						STA.B $07                            ;02B830|8507    |000007;
						LDA.B ($00),Y                        ;02B832|B100    |000000;
						ASL A                                ;02B834|0A      |      ;
						ROL.B $07                            ;02B835|2607    |000007;
						ASL A                                ;02B837|0A      |      ;
						ROL.B $07                            ;02B838|2607    |000007;
						ASL A                                ;02B83A|0A      |      ;
						ROL.B $07                            ;02B83B|2607    |000007;
						ASL A                                ;02B83D|0A      |      ;
						ROL.B $07                            ;02B83E|2607    |000007;
						STA.B $06                            ;02B840|8506    |000006;
						STY.B r_roomSectionChrBanksDataOffset;02B842|840F    |00000F;
						LDY.B #$00                           ;02B844|A000    |      ;
						LDA.W introJunks,Y                   ;02B846|B9B9B8  |02B8B9;
						CLC                                  ;02B849|18      |      ;
						ADC.B $06                            ;02B84A|6506    |000006;
						STA.B $06                            ;02B84C|8506    |000006;
						LDA.W introJunks+1,Y                 ;02B84E|B9BAB8  |02B8BA;
						ADC.B $07                            ;02B851|6507    |000007;
						STA.B $07                            ;02B853|8507    |000007;
						LDY.B r_roomSectionChrBanksDataOffset;02B855|A40F    |00000F;
						LDA.W $07EF                          ;02B857|ADEF07  |0207EF;
						AND.B #$03                           ;02B85A|2903    |      ;
						ASL A                                ;02B85C|0A      |      ;
						ASL A                                ;02B85D|0A      |      ;
						TAY                                  ;02B85E|A8      |      ;
						LDA.B #$04                           ;02B85F|A904    |      ;
						STA.B $04                            ;02B861|8504    |000004;
	
			CODE_02B863:
						LDA.B ($06),Y                        ;02B863|B106    |000006;
						JSR.W titleScreenLoad_00             ;02B865|2095B9  |02B995;
						INY                                  ;02B868|C8      |      ;
						DEC.B $04                            ;02B869|C604    |000004;
						BNE CODE_02B863                      ;02B86B|D0F6    |02B863;
						INC.B $05                            ;02B86D|E605    |000005;
						DEC.B r_pointerQueue                 ;02B86F|C608    |000008;
						BNE CODE_02B82C                      ;02B871|D0B9    |02B82C;
						LDA.B #$FF                           ;02B873|A9FF    |      ;
						JSR.W titleScreenLoad_00             ;02B875|2095B9  |02B995;
						JSR.W CODE_02B87E                    ;02B878|207EB8  |02B87E;
						STX.B r_sceneDrawQueue               ;02B87B|861D    |00001D;
						RTS                                  ;02B87D|60      |      ;
	
	
			CODE_02B87E:
						LDA.W $07EF                          ;02B87E|ADEF07  |0207EF;
						AND.B #$03                           ;02B881|2903    |      ;
						BNE CODE_02B8B8                      ;02B883|D033    |02B8B8;
						LDA.B #$0A                           ;02B885|A90A    |      ;
						JSR.W titleScreenLoad_00             ;02B887|2095B9  |02B995;
						LDA.W $07EF                          ;02B88A|ADEF07  |0207EF;
						AND.B #$1C                           ;02B88D|291C    |      ;
						ASL A                                ;02B88F|0A      |      ;
						STA.B $05                            ;02B890|8505    |000005;
						ORA.B #$C0                           ;02B892|09C0    |      ;
						JSR.W titleScreenLoad_00             ;02B894|2095B9  |02B995;
						LDA.B $03                            ;02B897|A503    |000003;
						ORA.B #$03                           ;02B899|0903    |      ;
						JSR.W titleScreenLoad_00             ;02B89B|2095B9  |02B995;
						LDA.B #$08                           ;02B89E|A908    |      ;
						JSR.W titleScreenLoad_00             ;02B8A0|2095B9  |02B995;
						STA.B r_pointerQueue                 ;02B8A3|8508    |000008;
	
			CODE_02B8A5:
						LDY.B $05                            ;02B8A5|A405    |000005;
						LDA.B ($00),Y                        ;02B8A7|B100    |000000;
						TAY                                  ;02B8A9|A8      |      ;
						LDA.W DATA8_02BD9A,Y                 ;02B8AA|B99ABD  |02BD9A;
						JSR.W titleScreenLoad_00             ;02B8AD|2095B9  |02B995;
						INC.B $05                            ;02B8B0|E605    |000005;
						DEC.B r_pointerQueue                 ;02B8B2|C608    |000008;
						BNE CODE_02B8A5                      ;02B8B4|D0EF    |02B8A5;
						STX.B r_sceneDrawQueue               ;02B8B6|861D    |00001D;
	
			CODE_02B8B8:
						RTS                                  ;02B8B8|60      |      ;
	
	
			introJunks:
						dw introJunks_textLine_00            ;02B8B9|        |02BB1A;
	
			PTR16_02B8BB:
						dw introJunks__01                    ;02B8BB|        |02BE02;
						dw introJunks__02                    ;02B8BD|        |02BDC2;
						dw introJunks__03                    ;02B8BF|        |02BE42;
						dw introJunks__04                    ;02B8C1|        |02BE82;
	
						dw introJunks__04                    ;02B8C3|        |02BE82;
	
	thunderTitleScreen_0E:
						LDA.W introMoreJunks,X                  ;02B8C5|BD8BB9  |0EB98B; 1 8 9 unused??
						STA.B $00                            ;02B8C8|8500    |000000;
						LDA.W introMoreJunks+1,X              ;02B8CA|BD8CB9  |0EB98C;
						STA.B $01                            ;02B8CD|8501    |000001;
						LDA.W $07F1                          ;02B8CF|ADF107  |0E07F1;
						ORA.W $07F2                          ;02B8D2|0DF207  |0E07F2;
						BEQ CODE_02B8E1                      ;02B8D5|F00A    |02B8E1;
						LDA.W $07F1                          ;02B8D7|ADF107  |0E07F1;
						STA.B $00                            ;02B8DA|8500    |000000;
						LDA.W $07F2                          ;02B8DC|ADF207  |0E07F2;
						STA.B $01                            ;02B8DF|8501    |000001;
	
			CODE_02B8E1:
						LDY.B #$00                           ;02B8E1|A000    |      ;
						LDA.B ($00),Y                        ;02B8E3|B100    |000000;
						CMP.B #$81                           ;02B8E5|C981    |      ;
						BNE CODE_02B8EC                      ;02B8E7|D003    |02B8EC;
						JMP.W CODE_02B989                    ;02B8E9|4C89B9  |02B989;
	
	
			CODE_02B8EC:
						STA.B r_pointerQueue                 ;02B8EC|8508    |000008;
						LDA.W $07EF                          ;02B8EE|ADEF07  |0207EF;
						AND.B #$FC                           ;02B8F1|29FC    |      ;
						ASL A                                ;02B8F3|0A      |      ;
						STA.B $05                            ;02B8F4|8505    |000005;
						LDX.B r_sceneDrawQueue               ;02B8F6|A61D    |00001D;
						LDA.B #$01                           ;02B8F8|A901    |      ;
						JSR.W titleScreenLoad_00             ;02B8FA|2095B9  |02B995;
						LDA.B #$20                           ;02B8FD|A920    |      ;
						STA.B $03                            ;02B8FF|8503    |000003;
						LDA.B r_PPUCtrl                      ;02B901|A5FF    |0000FF;
						AND.B #$02                           ;02B903|2902    |      ;
						BNE CODE_02B90B                      ;02B905|D004    |02B90B;
						LDA.B #$28                           ;02B907|A928    |      ;
						STA.B $03                            ;02B909|8503    |000003;
	
			CODE_02B90B:
						LDA.B #$00                           ;02B90B|A900    |      ;
						STA.B $02                            ;02B90D|8502    |000002;
						LDA.W $07EF                          ;02B90F|ADEF07  |0207EF;
						ASL A                                ;02B912|0A      |      ;
						ROL.B $02                            ;02B913|2602    |000002;
						ASL A                                ;02B915|0A      |      ;
						ROL.B $02                            ;02B916|2602    |000002;
						ASL A                                ;02B918|0A      |      ;
						ROL.B $02                            ;02B919|2602    |000002;
						ASL A                                ;02B91B|0A      |      ;
						ROL.B $02                            ;02B91C|2602    |000002;
						ASL A                                ;02B91E|0A      |      ;
						ROL.B $02                            ;02B91F|2602    |000002;
						CLC                                  ;02B921|18      |      ;
						ADC.B r_pointerQueue                 ;02B922|6508    |000008;
						STA.B $09                            ;02B924|8509    |000009;
						LDA.B $02                            ;02B926|A502    |000002;
						ADC.B #$00                           ;02B928|6900    |      ;
						STA.B $02                            ;02B92A|8502    |000002;
						LDA.B $09                            ;02B92C|A509    |000009;
						JSR.W titleScreenLoad_00             ;02B92E|2095B9  |02B995;
						LDA.B $02                            ;02B931|A502    |000002;
						ORA.B $03                            ;02B933|0503    |000003;
						JSR.W titleScreenLoad_00             ;02B935|2095B9  |02B995;
						INY                                  ;02B938|C8      |      ;
	
			CODE_02B939:
						LDA.B ($00),Y                        ;02B939|B100    |000000;
						CMP.B #$80                           ;02B93B|C980    |      ;
						BEQ CODE_02B96A                      ;02B93D|F02B    |02B96A;
						STA.B r_temp_Xpos                    ;02B93F|850A    |00000A;
						INY                                  ;02B941|C8      |      ;
						LDA.B ($00),Y                        ;02B942|B100    |000000;
						CMP.B #$10                           ;02B944|C910    |      ;
						BEQ CODE_02B958                      ;02B946|F010    |02B958;
						CMP.B #$C0                           ;02B948|C9C0    |      ;
						BEQ CODE_02B958                      ;02B94A|F00C    |02B958;
						LDA.W $07EF                          ;02B94C|ADEF07  |0207EF;
						AND.B #$01                           ;02B94F|2901    |      ;
						BEQ CODE_02B964                      ;02B951|F011    |02B964;
	
			CODE_02B953:
						LDA.B r_temp_Xpos                    ;02B953|A50A    |00000A;
						JMP.W CODE_02B964                    ;02B955|4C64B9  |02B964;
	
	
			CODE_02B958:
						INY                                  ;02B958|C8      |      ;
						STA.B $0B                            ;02B959|850B    |00000B;
						LDA.W $07EF                          ;02B95B|ADEF07  |0207EF;
						AND.B #$01                           ;02B95E|2901    |      ;
						BNE CODE_02B953                      ;02B960|D0F1    |02B953;
						LDA.B $0B                            ;02B962|A50B    |00000B;
	
			CODE_02B964:
						JSR.W titleScreenLoad_00             ;02B964|2095B9  |02B995;
						JMP.W CODE_02B939                    ;02B967|4C39B9  |02B939;
	
	
			CODE_02B96A:
						LDA.B #$FF                           ;02B96A|A9FF    |      ;
						JSR.W titleScreenLoad_00             ;02B96C|2095B9  |02B995;
						STX.B r_sceneDrawQueue               ;02B96F|861D    |00001D;
						LDA.W $07EF                          ;02B971|ADEF07  |0207EF;
						AND.B #$01                           ;02B974|2901    |      ;
						BEQ CODE_02B987                      ;02B976|F00F    |02B987;
						INY                                  ;02B978|C8      |      ;
						TYA                                  ;02B979|98      |      ;
						CLC                                  ;02B97A|18      |      ;
						ADC.B $00                            ;02B97B|6500    |000000;
						STA.W $07F1                          ;02B97D|8DF107  |0207F1;
						LDA.B $01                            ;02B980|A501    |000001;
						ADC.B #$00                           ;02B982|6900    |      ;
						STA.W $07F2                          ;02B984|8DF207  |0207F2;
	
			CODE_02B987:
						CLC                                  ;02B987|18      |      ;
						RTS                                  ;02B988|60      |      ;
	
	
			CODE_02B989:
						SEC                                  ;02B989|38      |      ;
						RTS                                  ;02B98A|60      |      ;
	
	
		introMoreJunks:
						dw introMoreJunks__00                ;02B98B|        |0FDA74;
						dw introMoreJunks__01                ;02B98D|        |0FDB05;
						dw introMoreJunks__02                ;02B98F|        |0FDBBC;
						dw intro_introText_03                ;02B991|        |0FD929;
						dw introMoreJunks__04                ;02B993|        |0FD9BC;
	
	titleScreenLoad_00:
						STA.W r_VramQueue,X                ;02B995|9D0003  |020300;
						INX                                  ;02B998|E8      |      ;
						RTS                                  ;02B999|60      |      ;
	
	
	thunderTitleScreen_04:
						LDA.B #$18                           ;02B99A|A918    |      ;
						STA.B r_temp_Xpos                    ;02B99C|850A    |00000A;
						LDA.B #$80                           ;02B99E|A980    |      ;
						STA.W $0791                          ;02B9A0|8D9107  |020791;
						LDA.W r_PW_dumpGeneral             ;02B9A3|AD8807  |020788;
						CLC                                  ;02B9A6|18      |      ;
						ADC.B #$18                           ;02B9A7|6918    |      ;
						STA.B $01                            ;02B9A9|8501    |000001;
						LDA.W $0787                          ;02B9AB|AD8707  |020787;
						ADC.B #$00                           ;02B9AE|6900    |      ;
						STA.B $00                            ;02B9B0|8500    |000000;
						LDA.W r_PW_iconGeneral             ;02B9B2|AD8607  |020786;
						CLC                                  ;02B9B5|18      |      ;
						ADC.B #$01                           ;02B9B6|6901    |      ;
						ASL A                                ;02B9B8|0A      |      ;
						TAY                                  ;02B9B9|A8      |      ;
						LDA.W DATA8_02BA66,Y                 ;02B9BA|B966BA  |02BA66;
						CMP.B $00                            ;02B9BD|C500    |000000;
						BCC CODE_02B9CC                      ;02B9BF|900B    |02B9CC;
						BNE CODE_02B9CF                      ;02B9C1|D00C    |02B9CF;
						LDA.W DATA8_02BA65,Y                 ;02B9C3|B965BA  |02BA65;
						CMP.B $01                            ;02B9C6|C501    |000001;
						BCC CODE_02B9CC                      ;02B9C8|9002    |02B9CC;
						BNE CODE_02B9CF                      ;02B9CA|D003    |02B9CF;
	
			CODE_02B9CC:
						INC.W r_PW_iconGeneral             ;02B9CC|EE8607  |020786;
	
			CODE_02B9CF:
						LDA.B #$08                           ;02B9CF|A908    |      ;
						STA.W $078C                          ;02B9D1|8D8C07  |02078C;
						LDA.W r_PW_dumpGeneral             ;02B9D4|AD8807  |020788;
						CLC                                  ;02B9D7|18      |      ;
						ADC.B #$18                           ;02B9D8|6918    |      ;
						STA.B $00                            ;02B9DA|8500    |000000;
						LDA.W $0787                          ;02B9DC|AD8707  |020787;
						ADC.B #$00                           ;02B9DF|6900    |      ;
						STA.B $01                            ;02B9E1|8501    |000001;
						LDA.W r_PW_iconGeneral             ;02B9E3|AD8607  |020786;
						CLC                                  ;02B9E6|18      |      ;
						ADC.B #$01                           ;02B9E7|6901    |      ;
						ASL A                                ;02B9E9|0A      |      ;
						TAY                                  ;02B9EA|A8      |      ;
						LDA.B #$00                           ;02B9EB|A900    |      ;
						STA.B r_pointerQueue                 ;02B9ED|8508    |000008;
						STA.W $078F                          ;02B9EF|8D8F07  |02078F;
						JSR.W CODE_02BA22                    ;02B9F2|2022BA  |02BA22;
						STA.W $078D                          ;02B9F5|8D8D07  |02078D;
						LDA.W r_PW_iconGeneral             ;02B9F8|AD8607  |020786;
						CLC                                  ;02B9FB|18      |      ;
						ADC.B #$02                           ;02B9FC|6902    |      ;
						ASL A                                ;02B9FE|0A      |      ;
						TAY                                  ;02B9FF|A8      |      ;
						LDA.B #$01                           ;02BA00|A901    |      ;
						STA.B r_pointerQueue                 ;02BA02|8508    |000008;
						LDA.B #$00                           ;02BA04|A900    |      ;
						STA.W $0790                          ;02BA06|8D9007  |020790;
						JSR.W CODE_02BA22                    ;02BA09|2022BA  |02BA22;
						STA.W $078E                          ;02BA0C|8D8E07  |02078E;
						LDA.W $078C                          ;02BA0F|AD8C07  |02078C;
						STA.B r_IRQCmpVal                    ;02BA12|8541    |000041;
						LDA.W $078D                          ;02BA14|AD8D07  |02078D;
						CLC                                  ;02BA17|18      |      ;
						ADC.B r_IRQCmpVal                    ;02BA18|6541    |000041;
						STA.B r_scannlineTarget              ;02BA1A|8542    |000042;
						LDA.W $0791                          ;02BA1C|AD9107  |020791;
						STA.B r_IRQStatus                    ;02BA1F|8540    |000040;
						RTS                                  ;02BA21|60      |      ;
	
	
			CODE_02BA22:
						LDA.W DATA8_02BA65,Y                 ;02BA22|B965BA  |02BA65;
						STA.B $02                            ;02BA25|8502    |000002;
						SEC                                  ;02BA27|38      |      ;
						SBC.B $00                            ;02BA28|E500    |000000;
						STA.B $00                            ;02BA2A|8500    |000000;
						LDA.W DATA8_02BA66,Y                 ;02BA2C|B966BA  |02BA66;
						STA.B $03                            ;02BA2F|8503    |000003;
						SBC.B $01                            ;02BA31|E501    |000001;
						BEQ CODE_02BA45                      ;02BA33|F010    |02BA45;
	
			CODE_02BA35:
						LDY.B r_pointerQueue                 ;02BA35|A408    |000008;
						BNE CODE_02BA3E                      ;02BA37|D005    |02BA3E;
						LDA.B #$80                           ;02BA39|A980    |      ;
						STA.W $0791                          ;02BA3B|8D9107  |020791;
	
			CODE_02BA3E:
						LDA.B #$01                           ;02BA3E|A901    |      ;
						STA.W $078F,Y                        ;02BA40|998F07  |02078F;
						BNE CODE_02BA50                      ;02BA43|D00B    |02BA50;
	
			CODE_02BA45:
						LDA.B $00                            ;02BA45|A500    |000000;
						CLC                                  ;02BA47|18      |      ;
						ADC.B r_temp_Xpos                    ;02BA48|650A    |00000A;
						STA.B r_temp_Xpos                    ;02BA4A|850A    |00000A;
						BCS CODE_02BA35                      ;02BA4C|B0E7    |02BA35;
						LDA.B $00                            ;02BA4E|A500    |000000;
	
			CODE_02BA50:
						CMP.B #$F0                           ;02BA50|C9F0    |      ;
						BCS CODE_02BA35                      ;02BA52|B0E1    |02BA35;
						CMP.B #$03                           ;02BA54|C903    |      ;
						BCS CODE_02BA5A                      ;02BA56|B002    |02BA5A;
						LDA.B #$03                           ;02BA58|A903    |      ;
	
			CODE_02BA5A:
						PHA                                  ;02BA5A|48      |      ;
						LDA.B $02                            ;02BA5B|A502    |000002;
						STA.B $00                            ;02BA5D|8500    |000000;
						LDA.B $03                            ;02BA5F|A503    |000003;
						STA.B $01                            ;02BA61|8501    |000001;
						PLA                                  ;02BA63|68      |      ;
						RTS                                  ;02BA64|60      |      ;
	
	
			DATA8_02BA65:
						db $00                               ;02BA65|        |      ;
	
			DATA8_02BA66:
						db $00,$F0,$00,$E0,$02,$20,$03,$D0   ;02BA66|        |      ;
						db $03,$C0,$04,$48,$05,$00,$06,$00   ;02BA6E|        |      ;
						db $0C                               ;02BA76|        |      ;
	
	thunderTitleScreen_06:
						LDA.B #$44                           ;02BA77|A944    |      ;
						STA.B r_updateNametable              ;02BA79|8525    |000025;
						RTS                                  ;02BA7B|60      |      ;
	
	
	thunderTitleScreen_08:
						LDA.W $07EE                          ;02BA7C|ADEE07  |0207EE;
						LSR A                                ;02BA7F|4A      |      ;
						ROR A                                ;02BA80|6A      |      ;
						ROR A                                ;02BA81|6A      |      ;
						ROR A                                ;02BA82|6A      |      ;
						PHA                                  ;02BA83|48      |      ;
						LDX.B r_sceneDrawQueue               ;02BA84|A61D    |00001D;
						LDA.B #$01                           ;02BA86|A901    |      ;
						JSR.W titleScreenLoad_00             ;02BA88|2095B9  |02B995;
						PLA                                  ;02BA8B|68      |      ;
						JSR.W titleScreenLoad_00             ;02BA8C|2095B9  |02B995;
						LDA.W $07EE                          ;02BA8F|ADEE07  |0207EE;
						AND.B #$08                           ;02BA92|2908    |      ;
						BEQ CODE_02BA9A                      ;02BA94|F004    |02BA9A;
						LDA.B #$25                           ;02BA96|A925    |      ;
						BNE CODE_02BA9C                      ;02BA98|D002    |02BA9C;
	
			CODE_02BA9A:
						LDA.B #$24                           ;02BA9A|A924    |      ;
	
			CODE_02BA9C:
						JSR.W titleScreenLoad_00             ;02BA9C|2095B9  |02B995;
						LDY.B #$20                           ;02BA9F|A020    |      ;
						LDA.B #$00                           ;02BAA1|A900    |      ;
	
			CODE_02BAA3:
						JSR.W titleScreenLoad_00             ;02BAA3|2095B9  |02B995;
						DEY                                  ;02BAA6|88      |      ;
						BNE CODE_02BAA3                      ;02BAA7|D0FA    |02BAA3;
						LDA.B #$FF                           ;02BAA9|A9FF    |      ;
						JSR.W titleScreenLoad_00             ;02BAAB|2095B9  |02B995;
						STX.B r_sceneDrawQueue               ;02BAAE|861D    |00001D;
						INC.W $07EE                          ;02BAB0|EEEE07  |0207EE;
						LDA.W $07EE                          ;02BAB3|ADEE07  |0207EE;
						CMP.B #$0A                           ;02BAB6|C90A    |      ;
						BCC CODE_02BABB                      ;02BAB8|9001    |02BABB;
						RTS                                  ;02BABA|60      |      ;
	
	
			CODE_02BABB:
						RTS                                  ;02BABB|60      |      ;
	
	
	thunderTitleScreen_0A:
						LDA.B #$00                           ;02BABC|A900    |      ;
						LDY.B #$13                           ;02BABE|A013    |      ;
	
			CODE_02BAC0:
						STA.W $0794,Y                        ;02BAC0|999407  |020794;
						DEY                                  ;02BAC3|88      |      ;
						BNE CODE_02BAC0                      ;02BAC4|D0FA    |02BAC0;
						LDA.B #$80                           ;02BAC6|A980    |      ;
						STA.B r_IRQStatus                    ;02BAC8|8540    |000040;
						LDA.B #$08                           ;02BACA|A908    |      ;
						STA.B r_IRQCmpVal                    ;02BACC|8541    |000041;
						LDA.B #$0E                           ;02BACE|A90E    |      ;
						STA.B r_scannlineTarget              ;02BAD0|8542    |000042;
						LDA.B #$00                           ;02BAD2|A900    |      ;
						STA.W r_cinematicTimer                ;02BAD4|8D8A07  |02078A;
						LDA.B #$01                           ;02BAD7|A901    |      ;
						STA.W $078B                          ;02BAD9|8D8B07  |02078B;
						RTS                                  ;02BADC|60      |      ;
	
	
	thunderTitleScreen_0C:
						LDX.B #$00                           ;02BADD|A200    |      ;
						STX.B r_pointerQueue                 ;02BADF|8608    |000008;
	
			CODE_02BAE1:
						TXA                                  ;02BAE1|8A      |      ;
						ASL A                                ;02BAE2|0A      |      ;
						TAY                                  ;02BAE3|A8      |      ;
						LDA.W DATA8_02BB08,Y                 ;02BAE4|B908BB  |02BB08;
						CLC                                  ;02BAE7|18      |      ;
						ADC.W $079E,X                        ;02BAE8|7D9E07  |02079E;
						STA.W $079E,X                        ;02BAEB|9D9E07  |02079E;
						LDA.W DATA8_02BB09,Y                 ;02BAEE|B909BB  |02BB09;
						ADC.W $0794,X                        ;02BAF1|7D9407  |020794;
						BCC CODE_02BAFA                      ;02BAF4|9004    |02BAFA;
						LDA.B #$FF                           ;02BAF6|A9FF    |      ;
						INC.B r_pointerQueue                 ;02BAF8|E608    |000008;
	
			CODE_02BAFA:
						STA.W $0794,X                        ;02BAFA|9D9407  |020794;
						INX                                  ;02BAFD|E8      |      ;
						CPX.B #$09                           ;02BAFE|E009    |      ;
						BNE CODE_02BAE1                      ;02BB00|D0DF    |02BAE1;
						LDA.B #$00                           ;02BB02|A900    |      ;
						STA.W $0794,X                        ;02BB04|9D9407  |020794;
						RTS                                  ;02BB07|60      |      ;
	
	
			DATA8_02BB08:
						db $80                               ;02BB08|        |      ;
	
	
			DATA8_02BB09:
						db $01,$C0,$01,$40,$01,$00,$01,$40   ;02BB09|        |      ;
						db $01,$C0,$00,$00,$01,$80,$01,$40   ;02BB11|        |      ;
						db $01                               ;02BB19|        |      ;
	
	introJunks_textLine_00:
						db $00,$00,$00,$00,$00,$00,$00,$00   ;02BB1A|        |      ;
						db $00,$00,$00,$00,$00,$00,$00,$00   ;02BB22|        |      ;
						db $00,$00,$00,$00,$2E,$2E,$2E,$2E   ;02BB2A|        |      ;
						db $00,$00,$00,$00,$00,$00,$00,$00   ;02BB32|        |      ;
						db $00,$00,$00,$00,$2E,$2E,$2E,$2E   ;02BB3A|        |      ;
						db $00,$00,$00,$2D,$00,$00,$00,$2D   ;02BB42|        |      ;
						db $00,$00,$00,$2D,$00,$00,$00,$2D   ;02BB4A|        |      ;
						db $00,$00,$00,$2D,$00,$00,$00,$2D   ;02BB52|        |      ;
						db $00,$00,$00,$2D,$00,$00,$00,$2D   ;02BB5A|        |      ;
						db $00,$00,$00,$2D,$2E,$2E,$2E,$2F   ;02BB62|        |      ;
						db $00,$00,$00,$00,$00,$00,$00,$00   ;02BB6A|        |      ;
						db $00,$00,$00,$00,$00,$80,$81,$82   ;02BB72|        |      ;
						db $00,$00,$00,$2D,$00,$00,$00,$2D   ;02BB7A|        |      ;
						db $00,$00,$00,$2D,$83,$00,$00,$2D   ;02BB82|        |      ;
						db $00,$00,$00,$00,$00,$00,$00,$00   ;02BB8A|        |      ;
						db $00,$00,$00,$00,$00,$00,$00,$84   ;02BB92|        |      ;
						db $00,$90,$91,$92,$00,$A0,$A1,$A2   ;02BB9A|        |      ;
						db $84,$B0,$B1,$B2,$85,$86,$87,$88   ;02BBA2|        |      ;
						db $93,$00,$00,$2D,$A3,$00,$00,$2D   ;02BBAA|        |      ;
						db $B3,$00,$00,$2D,$89,$8A,$8B,$2D   ;02BBB2|        |      ;
						db $00,$00,$00,$94,$00,$00,$00,$A4   ;02BBBA|        |      ;
						db $00,$00,$00,$B4,$00,$00,$00,$00   ;02BBC2|        |      ;
						db $95,$96,$97,$98,$A5,$A6,$A7,$A8   ;02BBCA|        |      ;
						db $B5,$B6,$B7,$B8,$8C,$8D,$8E,$00   ;02BBD2|        |      ;
						db $99,$9A,$9B,$2D,$A9,$AA,$AB,$2D   ;02BBDA|        |      ;
						db $B9,$BA,$BB,$2D,$00,$9C,$00,$2D   ;02BBE2|        |      ;
						db $00,$9D,$9E,$9F,$00,$AD,$AE,$00   ;02BBEA|        |      ;
						db $00,$BD,$BE,$00,$2E,$2E,$2E,$2E   ;02BBF2|        |      ;
						db $00,$00,$00,$00,$00,$00,$00,$00   ;02BBFA|        |      ;
						db $00,$00,$00,$2D,$00,$00,$00,$2D   ;02BC02|        |      ;
						db $00,$00,$00,$00,$00,$00,$00,$00   ;02BC0A|        |      ;
						db $00,$00,$00,$00,$2E,$2E,$2E,$2E   ;02BC12|        |      ;
						db $00,$00,$6B,$67,$00,$00,$00,$7B   ;02BC1A|        |      ;
						db $00,$00,$00,$00,$00,$00,$00,$00   ;02BC22|        |      ;
						db $6B,$67,$00,$2D,$00,$7B,$00,$2D   ;02BC2A|        |      ;
						db $00,$00,$00,$2D,$00,$00,$00,$2D   ;02BC32|        |      ;
						db $00,$00,$00,$00,$00,$00,$00,$00   ;02BC3A|        |      ;
						db $00,$00,$00,$00,$00,$00,$00,$A1   ;02BC42|        |      ;
						db $00,$00,$A3,$A4,$00,$A2,$B3,$00   ;02BC4A|        |      ;
						db $A1,$B2,$00,$00,$B1,$00,$00,$00   ;02BC52|        |      ;
						db $A5,$A6,$00,$00,$00,$A7,$00,$00   ;02BC5A|        |      ;
						db $00,$A8,$00,$00,$00,$A9,$00,$00   ;02BC62|        |      ;
						db $00,$00,$A1,$B1,$00,$A0,$B1,$00   ;02BC6A|        |      ;
						db $00,$B0,$00,$00,$00,$00,$00,$00   ;02BC72|        |      ;
						db $00,$00,$00,$00,$00,$00,$00,$AD   ;02BC7A|        |      ;
						db $00,$00,$AE,$AF,$00,$00,$B4,$B5   ;02BC82|        |      ;
						db $AB,$AC,$00,$00,$AC,$00,$00,$00   ;02BC8A|        |      ;
						db $00,$B7,$B8,$00,$B6,$B9,$BA,$00   ;02BC92|        |      ;
						db $00,$00,$00,$00,$00,$00,$00,$00   ;02BC9A|        |      ;
						db $00,$00,$00,$00,$00,$00,$00,$74   ;02BCA2|        |      ;
						db $00,$00,$00,$00,$00,$00,$00,$00   ;02BCAA|        |      ;
						db $64,$65,$66,$00,$75,$76,$77,$00   ;02BCB2|        |      ;
						db $00,$00,$40,$41,$00,$00,$00,$00   ;02BCBA|        |      ;
						db $00,$00,$51,$00,$00,$00,$50,$60   ;02BCC2|        |      ;
						db $42,$43,$00,$00,$52,$53,$00,$66   ;02BCCA|        |      ;
						db $61,$62,$76,$77,$62,$64,$65,$66   ;02BCD2|        |      ;
						db $00,$00,$00,$2D,$00,$00,$00,$2D   ;02BCDA|        |      ;
						db $00,$00,$00,$2D,$65,$66,$00,$2D   ;02BCE2|        |      ;
						db $00,$00,$74,$75,$00,$00,$00,$00   ;02BCEA|        |      ;
						db $00,$00,$63,$64,$00,$00,$74,$75   ;02BCF2|        |      ;
						db $65,$66,$00,$00,$76,$77,$00,$81   ;02BCFA|        |      ;
						db $65,$66,$84,$86,$76,$77,$85,$87   ;02BD02|        |      ;
						db $82,$00,$63,$64,$83,$00,$74,$75   ;02BD0A|        |      ;
						db $88,$8A,$8C,$00,$89,$8B,$8D,$00   ;02BD12|        |      ;
						db $66,$00,$00,$00,$77,$00,$74,$75   ;02BD1A|        |      ;
						db $00,$00,$00,$00,$74,$75,$63,$64   ;02BD22|        |      ;
						db $74,$75,$44,$45,$76,$77,$54,$55   ;02BD2A|        |      ;
						db $00,$00,$46,$47,$65,$66,$56,$57   ;02BD32|        |      ;
						db $76,$77,$00,$2D,$00,$00,$00,$2D   ;02BD3A|        |      ;
						db $4A,$4B,$00,$2D,$5A,$5B,$00,$2D   ;02BD42|        |      ;
						db $00,$8E,$90,$92,$00,$8F,$91,$93   ;02BD4A|        |      ;
						db $00,$98,$9A,$00,$00,$99,$9B,$00   ;02BD52|        |      ;
						db $00,$94,$00,$96,$00,$95,$00,$97   ;02BD5A|        |      ;
						db $00,$00,$00,$9C,$00,$00,$00,$9D   ;02BD62|        |      ;
						db $00,$00,$74,$75,$00,$00,$00,$00   ;02BD6A|        |      ;
						db $00,$00,$00,$00,$00,$00,$00,$00   ;02BD72|        |      ;
						db $76,$77,$48,$49,$00,$00,$58,$59   ;02BD7A|        |      ;
						db $00,$68,$69,$6A,$00,$78,$79,$7A   ;02BD82|        |      ;
						db $70,$71,$00,$2D,$00,$00,$00,$2D   ;02BD8A|        |      ;
						db $62,$00,$00,$2D,$79,$7A,$00,$2D   ;02BD92|        |      ;
	
			DATA8_02BD9A:
						db $00,$00,$00,$00,$00,$00,$00,$00   ;02BD9A|        |      ;
						db $00,$00,$00,$00,$00,$00,$00,$00   ;02BDA2|        |      ;
						db $08,$02,$55,$55,$55,$55,$55,$55   ;02BDAA|        |      ;
						db $C0,$F0,$00,$FC,$30,$CC,$FF,$FF   ;02BDB2|        |      ;
						db $FF,$33,$03,$FF,$FF,$0C,$A3,$20   ;02BDBA|        |      ;
	
		introJunks__02:
						db $0E,$01,$01,$01,$01,$01,$02,$00   ;02BDC2|        |      ;
						db $03,$00,$00,$00,$00,$00,$03,$00   ;02BDCA|        |      ;
						db $03,$00,$00,$00,$00,$00,$03,$00   ;02BDD2|        |      ;
						db $03,$00,$00,$00,$00,$05,$06,$00   ;02BDDA|        |      ;
						db $03,$00,$00,$00,$07,$08,$09,$00   ;02BDE2|        |      ;
						db $03,$00,$00,$00,$0A,$0B,$0C,$00   ;02BDEA|        |      ;
						db $03,$0F,$0F,$0F,$0F,$0D,$04,$00   ;02BDF2|        |      ;
						db $00,$00,$00,$00,$00,$00,$00,$00   ;02BDFA|        |      ;
	
		introJunks__01:
						db $0E,$01,$01,$01,$01,$01,$02,$00   ;02BE02|        |      ;
						db $03,$00,$00,$00,$00,$00,$03,$00   ;02BE0A|        |      ;
						db $03,$00,$00,$00,$00,$00,$03,$00   ;02BE12|        |      ;
						db $03,$00,$00,$00,$00,$00,$03,$00   ;02BE1A|        |      ;
						db $03,$12,$13,$14,$00,$00,$03,$00   ;02BE22|        |      ;
						db $03,$15,$16,$17,$00,$00,$03,$00   ;02BE2A|        |      ;
						db $03,$0F,$0F,$0F,$0F,$0F,$04,$00   ;02BE32|        |      ;
						db $00,$00,$00,$00,$00,$00,$00,$00   ;02BE3A|        |      ;
	
		introJunks__03:
						db $0E,$01,$01,$01,$01,$01,$02,$00   ;02BE42|        |      ;
						db $03,$18,$19,$00,$1A,$1B,$1C,$00   ;02BE4A|        |      ;
						db $03,$1D,$1E,$1F,$20,$21,$22,$00   ;02BE52|        |      ;
						db $03,$00,$23,$24,$25,$26,$27,$00   ;02BE5A|        |      ;
						db $03,$00,$00,$00,$00,$10,$11,$00   ;02BE62|        |      ;
						db $03,$00,$00,$00,$00,$00,$03,$00   ;02BE6A|        |      ;
						db $03,$0F,$0F,$0F,$0F,$0F,$04,$00   ;02BE72|        |      ;
						db $00,$00,$00,$00,$00,$00,$00,$00   ;02BE7A|        |      ;
	
		introJunks__04:
						db $0E,$01,$01,$01,$01,$01,$02,$00   ;02BE82|        |      ;
						db $03,$00,$00,$00,$00,$00,$03,$00   ;02BE8A|        |      ;
						db $03,$00,$00,$00,$00,$00,$03,$00   ;02BE92|        |      ;
						db $03,$00,$00,$00,$00,$00,$03,$00   ;02BE9A|        |      ;
						db $03,$00,$00,$00,$00,$00,$03,$00   ;02BEA2|        |      ;
						db $03,$00,$00,$00,$00,$00,$03,$00   ;02BEAA|        |      ;
						db $03,$0F,$0F,$0F,$0F,$0F,$04,$00   ;02BEB2|        |      ;
						db $00,$00                           ;02BEBA|        |      ;
	
		dripDesolveTileData_00:
						db $00,$00,$00,$00,$00,$00           ;02BEBC|        |      ;
}					   


{ ; -- free space --------------------------------------------------------------------					   






}
