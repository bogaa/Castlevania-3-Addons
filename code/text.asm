

pushTable 


{ ; -- text symbols intro ----------------------------------------

	' ' = $00
	'A' = $C0
	'B' = $C1
	'C' = $C2
	'D' = $C3
	'E' = $C4
	'F' = $C5
	'G' = $C6
	'H' = $C7
	'I' = $C8
	'J' = $C9
	'K' = $CA
	'L' = $CB
	'M' = $CC
	'N' = $CD
	'O' = $CE
	'P' = $CF
	'Q' = $D0
	'R' = $D1
	'S' = $D2
	'T' = $D3
	'U' = $D4
	'V' = $D5
	'W' = $D6
	'X' = $D7
	'Y' = $D8
	'Z' = $D9
	''' = $DA	; '
	'.' = $DB
	',' = $DC
	'0' = $DD
	'1' = $DE
	'5' = $DF
	'a' = $E0
	'b' = $E1
	'c' = $E2
	'd' = $E3
	'e' = $E4
	'f'	= $E5
	'g' = $E6
	'h' = $E7
	'i' = $E8
	'j' = $E9
	'k' = $EA
	'l' = $EB
	'm' = $EC
	'n' = $ED
	'o' = $EE
	'p' = $EF
	'q' = $F0
	'r' = $F1
	's' = $F2
	't' = $F3
	'u' = $F4
	'v' = $F5
	'w' = $F6
	'x' = $F7
	'y' = $F8
	'z' = $F9
	'!' = $FA
	'?' = $FB
	'-' = $FC
	'&' = $FD

}


{ ; -- helper text -----------------------------------------------

org $045C9
base $85C9 
	textGroupStartingIDX_stageBased_00: db $00,$00,$0C,$00,$00,$00,$00,$14    ; table are for stage 0 - 8. So castle stages are excluded
	textGroupStartingIDX_stageBased_01: db $00,$02,$0E,$00,$00,$00,$00,$16  
	textGroupStartingIDX_stageBased_02: db $00,$06,$10,$00,$00,$00,$00,$18  
	textGroupStartingIDX_stageBased_03: db $00,$08,$12,$00,$00,$00,$00,$1A  
	textGroupStartingIDX_stageBased_04: db $00,$0A,$0A,$00,$00,$00,$00,$0A  
assert pc() <= $85F1

org $04A26
base $8A26
	
	textGroups: 
						dw textPointersGrant_00              ;018A26|  00      |018A42;
						dw textPointersGrant_01              ;018A28|  02      |018A4A;
						dw textPointersGrant_02              ;018A2A|  04      |018A52;
						dw textPointersGrant_03              ;018A2C|  06      |018A5A;
						dw textPointersGrant_04              ;018A2E|  08      |018A62;
						dw textPointersGrant_05              ;018A30|  0a      |018A6A;
						
            dw textPointersSypha_06              ;018A32|  0c      |018A72;
						dw textPointersSypha_07              ;018A34|  0e      |018A7A;
						dw textPointersSypha_08              ;018A36|  10      |018A82;
						dw textPointersSypha_09              ;018A38|  12      |018A8A;
						
            dw textPointersAlucard_0a            ;018A3A|  14      |018A92;
						dw textPointersAlucard_0b            ;018A3C|  16      |018A9A;
						dw textPointersAlucard_0c            ;018A3E|  18      |018AA2;
						dw textPointersAlucard_0d            ;018A40|  20      |018AAA;
	
	textPointersGrant_00: 
						dw textDataGrant_00                  ;018A42|        |018AB2;
						dw textDataGrant_01                  ;018A44|        |018AC4;
						dw textDataGrant_02                  ;018A46|        |018AD4;
						dw $FFFF                             ;018A48|        |      ;
	
	textPointersGrant_01: 
						dw textDataGrant_03                  ;018A4A|        |018AE9;
						dw textDataGrant_04                  ;018A4C|        |018AFD;
						dw textDataGrant_05                  ;018A4E|        |018B11;
						dw $FFFF                             ;018A50|        |      ;
	
	textPointersGrant_02: 
						dw textDataGrant_06                  ;018A52|        |018B24;
						dw textDataGrant_07                  ;018A54|        |018B36;
						dw textDataGrant_08                  ;018A56|        |018B4B;
						dw $FFFF                             ;018A58|        |      ;
	
	textPointersGrant_03: 
						dw textDataGrant_09                  ;018A5A|        |018B5F;
						dw textDataGrant_0a                  ;018A5C|        |018B6E;
						dw textDataGrant_0b                  ;018A5E|        |018B7E;
						dw $FFFF                             ;018A60|        |      ;
	
	textPointersGrant_04: 
						dw textDataGrant_0c                  ;018A62|        |018B8C;
						dw textDataGrant_0d                  ;018A64|        |018B9F;
						dw textDataGrant_0e                  ;018A66|        |018BB2;
						dw $FFFF                             ;018A68|        |      ;
	
	textPointersGrant_05: 
						dw textDataGrant_0f                  ;018A6A|        |018BC4;
						dw textDataGrant_10                  ;018A6C|        |018BD4;
						dw textDataGrant_011                 ;018A6E|        |018BE5;
						dw $FFFF                             ;018A70|        |      ;
	

   if !grantDaggerSpiderSilkFreez == 1

    textDataGrant_00: db "When I got to this",$FF     
    textDataGrant_01: db "Castle. A spider",$FF  
    textDataGrant_02: db "bit me.",$FF   
                
    textDataGrant_03: db "Your whip had been",$FF    		              
    textDataGrant_04:	db "a great helped for",$FF      	          
    textDataGrant_05: db "me to prevent this.",$FF                        
    
    textDataGrant_06: db "Can I come with you?",$FF                      
    textDataGrant_07: db "  May be?",$FF                        
    textDataGrant_08: db "  No creep allowed!",$FF                     
    
    textDataGrant_09: db "If we find a other",$FF 		
    textDataGrant_0a: db "spider. Try to stick",$FF  		 				
    textDataGrant_0b: db "your cheek out.",$FF 		   
	  
    textDataGrant_0c: db "This been my first",$FF                      
    textDataGrant_0d: db "thoughts too. We",$FF        	               
    textDataGrant_0e: db "see us again.",$FF                     
    
    textDataGrant_0f: db "We see each other",$FF         	              
    textDataGrant_10: db "down town. Good",$FF 	 
    textDataGrant_011: db "luck don't suck.",$FF   
   else 
    textDataGrant_00: db "My name is Grant.",$FF 
    textDataGrant_01: db "I dreamed I was",$FF  
    textDataGrant_02: db "turned into a ghost.",$FF    		              
    
    textDataGrant_03: db "Please take me with",$FF    		              
    textDataGrant_04:	db "you.  My family was",$FF      	          
    textDataGrant_05: db "killed by Dracula.",$FF                        
    
    textDataGrant_06: db "What will you do?",$FF                      
    textDataGrant_07: db "  Take him with you?",$FF                        
    textDataGrant_08: db "  Leave him behind?",$FF                     
    
    textDataGrant_09: db "I can help you",$FF 		
    textDataGrant_0a: db "a lot because I",$FF  		 				
    textDataGrant_0b: db "am very fast.",$FF 		   
	  
    textDataGrant_0c: db "Thanks for helping",$FF                      
    textDataGrant_0d: db "me.  I hope we see",$FF        	               
    textDataGrant_0e: db "each other again.",$FF                     
    
    textDataGrant_0f: db "My job is done,",$FF         	              
    textDataGrant_10: db "so you should go",$FF 	 
    textDataGrant_011: db "with him for now.",$FF 
   endif   
 
 	textPointersSypha_06: 
						dw textDataSypha_00                  ;018A72|        |018BF7;
						dw textDataSypha_01                  ;018A74|        |018C0A;
						dw textDataSypha_02                  ;018A76|        |018C1D;
						dw $FFFF                             ;018A78|        |      ;
	
	textPointersSypha_07: 
						dw textDataSypha_03                  ;018A7A|        |018C2D;
						dw textDataSypha_04                  ;018A7C|        |018C3B;
						dw textDataSypha_05                  ;018A7E|        |018C4B;
						dw $FFFF                             ;018A80|        |      ;
	
	textPointersSypha_08: 
						dw textDataSypha_06                  ;018A82|        |018C54;
						dw textDataSypha_07                  ;018A84|        |018C63;
						dw textDataSypha_08                  ;018A86|        |018C74;
						dw $FFFF                             ;018A88|        |      ;
	
	textPointersSypha_09: 
						dw textDataSypha_09                  ;018A8A|        |018C82;
						dw textDataSypha_0a                  ;018A8C|        |018C95;
						dw textDataSypha_0b                  ;018A8E|        |018CA8;
						dw $FFFF                             ;018A90|        |      ;
 
 
    textDataSypha_00: db "Thanks for helping",$FF   	             
    textDataSypha_01: db "me.  I'm Syfa, the",$FF   		            
    textDataSypha_02:	db "Vampire Hunter.",$FF      
	          
    textDataSypha_03: db "I will follow",$FF                     
    textDataSypha_04: db "you if you need",$FF 		               
    textDataSypha_05: db "my help.",$FF      
                
    textDataSypha_06: db "I hope a Magic",$FF               
    textDataSypha_07: db "Spirit will give",$FF                    
    textDataSypha_08: db "us the power.",$FF  
                     
    textDataSypha_09: db "Please be careful.",$FF         	             
    textDataSypha_0a: db "I hope you will be",$FF  	              
    textDataSypha_0b: db "victorious.",$FF  
                     
 
	textPointersAlucard_0a: 
						dw textDataAlucard_00                ;018A92|        |018CB4;
						dw textDataAlucard_01                ;018A94|        |018CC6;
						dw textDataAlucard_02                ;018A96|        |018CDA;
						dw $FFFF                             ;018A98|        |      ;
	
	textPointersAlucard_0b: 
						dw textDataAlucard_03                ;018A9A|        |018CEB;
						dw textDataAlucard_04                ;018A9C|        |018CF9;
						dw textDataAlucard_05                ;018A9E|        |018D09;
						dw $FFFF                             ;018AA0|        |      ;
	
	textPointersAlucard_0c: 
						dw textDataAlucard_06                ;018AA2|        |018D12;
						dw textDataAlucard_07                ;018AA4|        |018D23;
						dw textDataAlucard_08                ;018AA6|        |018D34;
						dw $FFFF                             ;018AA8|        |      ;
	
	textPointersAlucard_0d: 
						dw textDataAlucard_09                ;018AAA|        |018D49;
						dw textDataAlucard_0a                ;018AAC|        |018D5C;
						dw textDataAlucard_0b                ;018AAE|        |018D6F;
						dw $FFFF                             ;018AB0|        |      ;	
	
	
	textDataAlucard_00: db "I'm surprised you",$FF       	                
	textDataAlucard_01:  db "beat me.  I've been",$FF                      
	textDataAlucard_02: db "waiting for you.",$FF     
		              
	textDataAlucard_03: db "I need you to",$FF   	           	
	textDataAlucard_04: db "help me destroy",$FF  		           
	textDataAlucard_05: db "Dracula.",$FF    
		           
	textDataAlucard_06: db "I'm glad to hear",$FF  	             
	textDataAlucard_07: db "that.  Let's get",$FF	            
	textDataAlucard_08: 	db "him .  I am Alucard.",$FF 
		
	textDataAlucard_09: db "Well, I'll have to",$FF    		                      
	textDataAlucard_0a: db "find someone else.",$FF  		   
	textDataAlucard_0b: db "Please be careful!",$FF  
                        
   
   
   
assert pc() <= $8D82
}


{ ; -- ending text -----------------------------------------------

	{ ; -- pal and text table expansion (patch.asm)
	;org $01956							
	;base $9956
	;		dw endingTEXT_39     		 ;009956|        |0ABAC0; 39
	;		dw endingTEXT_3a     
	;		dw endingTEXT_3b     
	;		dw endingTEXT_3c     
	;		dw endingTEXT_3d     
	;		dw endingTEXT_3e     
	;		dw endingTEXT_3f     
	;		dw endingTEXT_40     
	;		dw endingTEXT_41     
	;		dw endingTEXT_42     
	;		dw endingTEXT_43     
	;		dw endingTEXT_44     
	;		dw endingTEXT_45     
	;		dw endingTEXT_46     
	;org $0197E
	;base $997E
	;		dw endingTEXT_4d 			 ;00997E|        |0ABC6C; 4d
	;		dw endingTEXT_4d 
	;		dw endingTEXT_4f 
	;		dw endingTEXT_50 
	;		dw endingTEXT_51 
	;		dw endingTEXT_52 
	;		dw endingTEXT_53 
	;		dw endingTEXT_54 
	;		dw endingTEXT_55 
	;		dw endingTEXT_56 
	;		dw endingTEXT_57 
	;		dw endingTEXT_58 
	;		dw endingTEXT_59 
	;		dw endingTEXT_5a 
	
	
	;org $2BA9A
	;base $BA9A
	
	}


pullPC 
        endingTEXT_39: 						;0ABA9A|        |      ;
			db "Trevor made many",$FE 
			db "sacrifices. The",$FE 
			db "long fight is",$FF 
			
        endingTEXT_3a: 
			db "over. Dracula is",$FE
			db "dead and all",$FF
					
        endingTEXT_3b: 
			db "other spirits",$FE 
			db "are asleep.",$FE,$00,$FF				
			
        endingTEXT_3c: 
			db "After this fight",$FE 
			db "the Belmont name",$FF
			
        endingTEXT_3d: 
			db "shall be honored",$FE 
			db "by all people.",$FF
 
        endingTEXT_3e: 
			db "In the shadows,",$FE
			db "a person watches",$FF
 
        endingTEXT_3f: 
			db "the castle fall.",$FE,$00,$FE
			db "Trevor must go",$FF
 
        endingTEXT_40: 
			db "for now but he",$FE
			db "hopes someday he",$FF
 
        endingTEXT_41: 
			db "will get the",$FE
			db "respect that",$FF
 
        endingTEXT_42: 
			db "he deserves.",$FE,$00,$FF
 
        endingTEXT_43: 
			db "Syfa, the",$FE
			db "Vampire Killer",$FF
 
        endingTEXT_44: 
			db "has had a bad",$FE
			db "life, but since",$FF
 
        endingTEXT_45: 
			db "she met Trevor",$FE
			db "she is beginning",$FF

        endingTEXT_46: 
			db "to feel more",$FE
			db "comfortable with",$FF
			
        endingTEXT_4d: 
			db "herself.",$FE,$00,$FF 
			
        endingTEXT_4f: 
			db "Both feel their",$FE
			db "friendship is",$FF
			
        endingTEXT_50: 
			db "stronger since",$FE 
			db "they worked",$FF
			
        endingTEXT_51: 
			db "together to rid",$FE 
			db "Wallachia city",$FF
			
        endingTEXT_52: 
			db "of evil. Grant",$FE 
			db "will start to",$FF
			
        endingTEXT_53: 
			db "rebuild the",$FE
			db "destroyed areas",$FE
			db "of the city.",$FE,$00,$FF
			
        endingTEXT_55: 
			db "The battle was",$FE
			db "won by Trevor and",$FF
			
        endingTEXT_56: 
			db "Alucard but",$FE
			db "Alucard feels",$FF
			
        endingTEXT_57: 
			db "quilty because",$FE
			db "he killed his",$FF
		
        endingTEXT_58: 
			db "real father.",$FE,$00,$FE
			db "Trevor realizes",$FF
	 
        endingTEXT_59: 
			db "this as he",$FE
			db "stands there",$FF		
			
        endingTEXT_5a: 
			db "thinking about",$FE
			db "Alucard.",$FE,$00,$FF
			
        endingTEXT_54: 		
			db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FE    
			db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FE  
            db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$60         


pushPC

}


{ ; -- intro text ------------------------------------------------

org $3D772
base $D772
  
  !lb = $80 	; linebreak will be followed by spacer value 
  !endTab = $81 
  
  intro_introText_03: 
		db $00,!lb 
		db $00,!lb,$06
		
		db "During 15th Century",!lb,$06
		db "Europe, there lived",!lb,$06
		db "a person named",!lb,$06
		db "Dracula.",!lb,$06
		db "He practiced sorcery",!lb,$06
		db "in order to create",!lb,$06
		db "a bad world filled",!lb,$06
		db "with evil.",!lb,$06
		db "During 15th Century",!lb,!endTab

   introMoreJunks__04: 
 		db $00,!lb 
		db $00,!lb,$06
		
		db "He began taking over",!lb,$06
		db "the Continent of",!lb,$06
		db "Europe, changing",!lb,$06
		db "countries from good",!lb,$06
		db "to bad.",!lb,$06
		db "The good people of",!lb,$06
		db "Europe tried to",!lb,$06
		db "fight off Dracula,",!lb,$06
		db "but no one was able",!lb,$06
		db "to survive.",!lb,!endTab		
 
   introMoreJunks__00: 
  		db $00,!lb 
		db $00,!lb,$06
		
		db "Finally, the Belmont",!lb,$06
		db "family was summoned",!lb,$06
		db "to battle Dracula's",!lb,$06
		db "vile forces.",!lb,$10
		db "The Belmont",!lb,$10
		db "family has",!lb,$10
		db "a long",!lb,$10
		db "history of",!lb,$10
		db "fighting",!lb,$10
		db "evil.",!lb,!endTab	                      
 
   introMoreJunks__01: 
  		db $00,!lb 
		db $00,!lb,$06
		
		db "The townspeople be-",!lb,$06
		db "came afraid of the",!lb,$06
		db "Belmonts super-human",!lb,$06
		db "power and asked them",!lb,$06
		db "to leave the country.",!lb,$06
		db "Fortunately",!lb,$06
		db "the people",!lb,$06
		db "found a",!lb,$06
		db "mighty",!lb,$06
		db "Belmont, ca-",!lb,$06
		db "lled Trevor.",!lb,!endTab                      
 
   introMoreJunks__02: 
  		db $00,!lb 
  		db $00,!lb 
  		db $00,!lb 
  		db $00,!lb 
  		db $00,!lb 
  		db $00,!lb 		
  		db $00,!lb 
  		db $00,!lb 
  		db $00,!lb,$06

 		db "The curse of",!lb,$06
		db "Dracula has begun.",!lb,$06
		db "The fate of Europe",!lb,$06
		db "lies with Trevor.",!lb,!endTab                     
		db $ff   
	; free space.. this needs to be at the end of this file 
}

	
pullTable	