# Leitura de Inteiros Assembly MIPS

.data

	saudacao: .asciiz "Olá. Por Favor, forneça sua idade: "
	saida: .asciiz "Sua Idade é" 
.text
	li $v0, 4 #Imprimir um string
	la $a0, saudacao
	syscall
	
	li $v0, 5 #Leitura de inteiros
	syscall
	
	
	move $t0, $v0 #Valor fornecida está em t0
	
	li $v0, 4 #imprimir uma string 
	la $a0, saida
	syscall
	
	li $v0, 1
	move $a0, $t0
	syscall
	
	
			
