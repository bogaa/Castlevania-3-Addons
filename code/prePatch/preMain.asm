norom	
check bankcross off 

headerSize = $10 
!prePatch = 1

org $0A073+headerSize	
base $A073	
	incsrc "code/prePatch/miscAssigne.asm" 				; sadly I could not think of a way to update block locations.. so that will be extra manual work still. 