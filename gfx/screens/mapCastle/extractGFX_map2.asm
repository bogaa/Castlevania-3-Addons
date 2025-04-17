norom 
check bankcross off 	

ROM_CHRstart = $40010						; assuming vanilla rom
CHR_bankSize = $400

org $0										; get CHR assembly 

	incbin "../../rom/Castlevania_3.nes":($78*CHR_bankSize)+ROM_CHRstart..($79*CHR_bankSize)+ROM_CHRstart
	incbin "../../rom/Castlevania_3.nes":($4f*CHR_bankSize)+ROM_CHRstart..($50*CHR_bankSize)+ROM_CHRstart
	incbin "../../rom/Castlevania_3.nes":($79*CHR_bankSize)+ROM_CHRstart..($7b*CHR_bankSize)+ROM_CHRstart