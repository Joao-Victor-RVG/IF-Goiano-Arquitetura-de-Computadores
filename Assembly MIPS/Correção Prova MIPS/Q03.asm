.data
x: .float 0.0  #Variavel 0.0

.macro print_float(%float)	#Macro printar float
	li $v0, 2
	mov.s $f12, %float
	syscall 
.end_macro 

.macro ler_float(%float)   	#Macro para ler numero float
	li $v0, 6 
	syscall
	mov.s  %float, $f0
.end_macro 


.macro print(%str)		#Macro printar string
	.data
		msg: .asciiz %str
	.text
		li $v0, 4
		la $a0, msg
		syscall
.end_macro

.text

	print("Digite 1 para iniciar: ")	#Para iniciar o programa digita 1
	ler_float($f9)
	
	lwc1 $f1, x					
	mov.s $f2, $f1
	
	principal:
		print("Quantos valores você digitará? ")  #Quantos valores serão recebidos pelo usuário
		ler_float($f3)
		c.le.s $f3, $f2  			    
		bc1t erro
	
	numero:
		print("Digite o numero: ")		#Looping que vai receber os numeros 
		ler_float($f4)
		
		add.s $f5, $f5, $f4			#Soma os valores digitados pelo usuário, para fazer a média no final
		
		add.s $f7, $f7, $f9			
		sub.s $f3, $f3, $f9			
		c.eq.s $f3, $f2				
		bc1t fim
		
		
		j numero				
	erro:
		print("Digite um valor valido\n")	
		j principal
	fim:
		div.s $f6, $f5, $f7			#Será calculado a média com a soma dos valores e o contador 
		print("A média dos numeros é: ")
		print_float($f6)			
		
		li $a0, 10				#Encerra o código
		syscall
		
		li $v0,1