.data

	idade: .word 56 



.text


	li $v0, 1
	lw $a0, idade
	
	
	syscall
	
	li $v0, 10
	
	
	
