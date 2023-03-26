.data 


	msg: .asciiz "Hello World!"     #mensagem a ser exibida para o usuario
	


.text


	li $v0, 4 # instrução para impressão de String
	la $a0, msg # indicar o endereço em que está a mensagem
	syscall #faça! Imprima! 
	
	
	
	



