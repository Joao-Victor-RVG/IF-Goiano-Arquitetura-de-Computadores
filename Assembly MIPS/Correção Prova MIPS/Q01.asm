.macro lerInteiro(%x) #macro para ler inteiro
	li $v0,5
	syscall
	move %x, $v0
.end_macro

.macro print_int(%int) #macro para printar inteiro
    li $v0, 1       
    la $a0, (%int)
    syscall             
.end_macro


.macro printString(%str) #macro para printar string
	
	.data
		msg: .asciiz %str

	.text
		li $v0, 4
		la $a0, msg
		syscall
.end_macro

.data
	

.text
	printString("Digite seu ano de nascimento: ")
	lerInteiro($t1)
	
	add $t3, $t1, 2023 # adiciona t1 + 2023
	sub $t4, $t3, $t1 # subtrai 2023 - $t1 para termos em t4 a constante 2023
	sub $t2, $t4, $t1 # subtrai 2023 - t1 
	bge $t2, 18, terCarteira # compara o resultado de 2023 - t1 com 18, se for maior ou igual vai para 'terCarteira', se nao vai para 'naoTemCArteira'
	
	j naoTerCarteira
	
	terCarteira:
		printString("Você pode ter carteira")
		li $v0, 10 # termina o programa
		syscall
	
	naoTerCarteira: 
		printString("Você não pode ter carteira")
		
	