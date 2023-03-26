.data

	caractere: .byte 'A'  #caractere a ser impresso
	



.text
	li $v0, 4 # imprimir char ou string
	la $a0, caractere
	syscall 