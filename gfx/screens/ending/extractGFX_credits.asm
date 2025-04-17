norom 
check bankcross off 	

ROM_CHRstart = $40010						; assuming vanilla rom
CHR_bankSize = $400

org $0										; get CHR assembly 

	incbin "../../rom/Castlevania_3.nes":($41*CHR_bankSize)+ROM_CHRstart..($42*CHR_bankSize)+ROM_CHRstart
	incbin "../../rom/Castlevania_3.nes":($70*CHR_bankSize)+ROM_CHRstart..($73*CHR_bankSize)+ROM_CHRstart
