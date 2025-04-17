norom 
check bankcross off 	

ROM_CHRstart = $40010						; assuming vanilla rom
CHR_bankSize = $400

org $0										; get CHR assembly 

	incbin "../../rom/Castlevania_3.nes":($74*CHR_bankSize)+ROM_CHRstart..($78*CHR_bankSize)+ROM_CHRstart

	