norom
incsrc "code/labels.asm"
org $000000
	db "NES"
	db HEADER 
	db HEADER_PRG
	db HEADER_CHR
	db HEADER_MAPPER
	pad $10	