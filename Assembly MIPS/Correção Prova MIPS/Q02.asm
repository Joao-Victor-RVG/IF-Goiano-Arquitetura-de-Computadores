.macro print_string(%str)
	.data
		msg1: .asciiz %str
	.text
    		li $v0, 4
    		la $a0, msg1
    		syscall
.end_macro

.macro read_float(%float)
    	li $v0, 6	# recebe o valor float
   	syscall
   	mov.s %float, $f0   # move o valor recebido para o parâmetro
   	
.end_macro

.macro print_float(%float)
    li $v0, 2           # Define o código da syscall para impressão de float
    mov.s $f12, %float 	# Carrega o valor do float no registrador f12
    syscall             # Executa a syscall
.end_macro

.macro lerInteiro(%x)
	li $v0,5
	syscall
	move %x, $v0
.end_macro

.macro finalizar()
	li $v0,10
	syscall
.end_macro

.data 

.text
	
	opcao: 
		
		print_string("\nEscolha uma opcao \n")
		print_string("1 - Inserir item \n")
		print_string("2 - Remover item \n")
		print_string("3 - Consultar item \n")
		print_string("4 - Encerrar operação \n")
		print_string("\nOpçao: ")
		
		# recebe o valor da opçao
		lerInteiro($t1)
	
		beq $t1, 1, inserir
		beq $t1, 2, remover
		beq $t1, 3, consultar
		beq $t1, 4, encerrar 
	
	inserir: 

		print_string("Quantos itens deseja inserir? ")
		read_float($f2)
		add.s $f3, $f2, $f3
		print_string("Item inserido!")
		j opcao
		
	remover:
		print_string("Quantos itens deseja remover? ")
		read_float($f2)
		c.lt.s $f3, $f2
		bc1t erroRemover
		sub.s $f3, $f3, $f2
		print_string("Item removido!")
		j opcao
		
	consultar:
		print_string("Quantidade de itens: ")
		print_float($f3)
		j opcao
	
	erroRemover:
		print_string("Não há tantos itens para remover, tente novamente! \n")
		j remover
	encerrar:
		finalizar()
	
		
		
