.data 
MEDIA: .float 4.0
SEIS: .float 5.9
TRES: .float 2.9
.macro printFloat()
	li $v0, 2
	syscall
.end_macro 

.macro lerInteiro(%x)
	li $v0,5
	syscall
	move %x, $v0
.end_macro

.macro lerFlutuante(%m1)
	li $v0, 6
	syscall
	mov.s %m1, $f0
.end_macro

.macro finalizar()
	li $v0,10
	syscall
.end_macro

.macro pergunta(%str)
	.data 
		msg: .asciiz %str	
	.text
		li $v0, 4
		la $a0, msg
		syscall
.end_macro 

.macro soma(%v1,%v2,%v3,%v4)
	add.s $f5, %v1, %v2
	add.s $f6, %v3, %v4
	add.s $f7, $f5,$f6
.end_macro

.macro media(%v1,%v2,%v3,%v4)
	soma(%v1,%v2,%v3,%v4)
	lwc1 $f9, MEDIA
	div.s $f8, $f7, $f9 
.end_macro

.text 
	pergunta("Digite o primeiro numero: ")
	lerFlutuante($f10)
	pergunta("Digite o segundo numero: ")
	lerFlutuante($f2)
	pergunta("Digite o terceiro numero: ")
	lerFlutuante($f3)
	pergunta("Digite o quarto numero: ")
	lerFlutuante($f4)
	
	opcao:
		pergunta("Digite: \n 1-soma \n 2-media \n 3-obter resultado \n 4-finalizar \n")
		lerInteiro($t1)
	
		beq $t1, 1 , somma
		beq $t1, 2 , meedia
		beq $t1, 3 , resultado
		beq $t1, 4 , finalizaar
	
	somma:
		pergunta("A soma eh: ")
		soma($f10,$f2,$f3,$f4)
		mov.s $f12, $f7
		printFloat()
		pergunta("\n ")
		j opcao
	meedia:
		pergunta("A media eh: ")
		media($f10,$f2,$f3,$f4)
		mov.s $f12, $f8
		printFloat()
		pergunta("\n ")
		j opcao
	resultado:
		media($f10,$f2,$f3,$f4)
		lwc1 $f1, SEIS
		mov.s $f0, $f8
		c.le.s $f0, $f1
		bc1t pf
		j aprovado
		
	pf:
		lwc1 $f1, TRES
		c.le.s $f0, $f1
		bc1t reprovado
		j provaFinal 
	
	provaFinal:
		pergunta("Prova Final")
		pergunta("\n ")
		j opcao
	reprovado:
		pergunta("Reprovado")
		pergunta("\n ")
		j opcao
		
	aprovado:
		pergunta("Aprovado")
		pergunta("\n ")	
		j opcao		
	finalizaar: 
		finalizar()
	