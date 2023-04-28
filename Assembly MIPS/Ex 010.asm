.data
	msg: .asciiz "Forneça um número decimal: "
	zero: .float 0.0


.text


	# imprimindo mensgagem para o usuário
	
	li $v0, 4
	la $a0, msg
	syscall
	
	#lendo o número
	li $v0, 6
	syscall # valor lido estará em $f0
	
	lwc1  $f1, zero
	add.s $f12, $f1, $f0
	
	#imprimindo o número
	li $v0, 2
	syscall
	
	
	