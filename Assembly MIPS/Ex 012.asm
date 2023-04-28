# pontos flutuantes



.data
	msg: .asciiz "Forneça um número decimal: "
	zero: .double 0.0


.text


	# imprimindo mensgagem para o usuário
	
	li $v0, 4
	la $a0, msg
	syscall
	
	#lendo o número
	li $v0, 7
	syscall # valor lido estará em $f0
	
	ldc1  $f2, zero
	add.d $f12, $f1, $f0
	
	#imprimindo o número
	li $v0, 3
	syscall
	
	
	