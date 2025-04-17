
org $48000			; SRAM_Code
base $8000
	CodeBlock_0:	


base SRAM_Code
; ----------------------------------------------------
					decelarate_xSpeed:
						lda.w r_entity_Xspd,x 
						bpl substrac_Xspeed
						jmp add_Xspeed					
					acelarate_xSpeed:
						lda.w r_entity_Xspd,x 
						bmi substrac_Xspeed
					
					add_Xspeed:	
						lda.w r_entity_XsubSpd,x 
						clc 
						adc $00
						sta.w r_entity_XsubSpd,x 
						lda #$00
						adc.w r_entity_Xspd,x 
						sta.w r_entity_Xspd,x 
						rts 
	
					substrac_Xspeed:		
						lda.w r_entity_XsubSpd,x 
						sec 
						sbc $00
						sta.w r_entity_XsubSpd,x 
						lda.w r_entity_Xspd,x 	
						sbc #$00 	
						sta.w r_entity_Xspd,x 
						rts 
; ----------------------------------------------------										
					decelarate_ySpeed:
						lda.w r_entity_Yspd,x 
						bpl substrac_ySpeed
						jmp add_Yspeed					
					acelarate_ySpeed:
						lda.w r_entity_Yspd,x 
						bmi substrac_ySpeed
					
					add_Yspeed:	
						lda.w r_entity_YsubSpd,x 
						clc 
						adc $00
						sta.w r_entity_YsubSpd,x 
						lda #$00
						adc.w r_entity_Yspd,x 
						sta.w r_entity_Yspd,x 
						rts 
	
					substrac_ySpeed:		
						lda.w r_entity_YsubSpd,x 
						sec 
						sbc $00
						sta.w r_entity_YsubSpd,x 
						lda.w r_entity_Yspd,x 	
						sbc #$00 	
						sta.w r_entity_Yspd,x 
						rts 					
; ----------------------------------------------------	
					showHUDnumber_addressInY: 
						LDA.B #$20                           
						STA.B r_VRAM_QueueDestHi             
						LDA.B #$57                           
						STA.B r_VRAM_QueueDestLo             
						STY.B r_pointerQueue                                               		
						jsr updateQueueWithNumber 
						rts 				
; ----------------------------------------------------					
					getDistance_xPos:
						lda.w r_entity_XPos
						sec
						sbc.w r_entity_XPos,x
						bpl +		
						eor #$ff 							
					+	rts 
					getDistance_yPos:
						lda.w r_entity_YPos
						sec
						sbc.w r_entity_YPos,x
						bpl +		
						eor #$ff 							
					+	rts 				
; ----------------------------------------------------	
					currentScreenBoundry:		; unfinished FIXME!!
						lda.b r_roomOrientation
						bmi verticleRoomBoundry
						lda.w r_entity_YPos,x
						and #$f0 
						cmp #$10 
						bne +
						lda #$20 			; top cross bountry 
						sta.w r_entity_YPos,x
					+	
						cmp #$d0 
						bne +
						lda #$d0 			; bottom cross bountry 
						sta.w r_entity_YPos,x
					+	rts 	

					verticleRoomBoundry:
;						lda.w r_sceneScrollOffsetLo
;						lda.w r_sceneScrollOffsetHi
						lda.w r_entity_XPos,x
						and #$f0 
						cmp #$10 
						bne +
						lda #$18 			; top cross bountry 
						sta.w r_entity_XPos,x
					+	
						cmp #$f0 
						bne +
						lda #$e8 			; bottom cross bountry 
						sta.w r_entity_XPos,x
					+	rts 
; ----------------------------------------------------	



; ----------------------------------------------------	



; ----------------------------------------------------	



; ----------------------------------------------------	



; ----------------------------------------------------	



; ----------------------------------------------------	


assert pc() <= $49000
org $49000	
	CodeBlock_1:	; this bank - 4bfff is unused 


assert pc() <= $4bfff		