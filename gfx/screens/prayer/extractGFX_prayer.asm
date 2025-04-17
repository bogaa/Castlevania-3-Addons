norom 
check bankcross off 	

ROM_CHRstart = $40010						; assuming vanilla rom
CHR_bankSize = $400

org $0										; get CHR assembly 

	incbin "../../rom/Castlevania_3.nes":($44*CHR_bankSize)+ROM_CHRstart..($45*CHR_bankSize)+ROM_CHRstart
	incbin "../../rom/Castlevania_3.nes":($45*CHR_bankSize)+ROM_CHRstart..($46*CHR_bankSize)+ROM_CHRstart
	incbin "../../rom/Castlevania_3.nes":($47*CHR_bankSize)+ROM_CHRstart..($48*CHR_bankSize)+ROM_CHRstart	
	incbin "../../rom/Castlevania_3.nes":($43*CHR_bankSize)+ROM_CHRstart..($44*CHR_bankSize)+ROM_CHRstart	