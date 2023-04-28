
#2)mover um regidtrasdor para outro
move $s0, $v0
mov.s $f1, $f0

#3)principais operedores aritmeticos
mul #multiplica valores inteiros 
add #soma valores inteiros 
sub #subtrai valores inteiros 
div #divide valores inteiros 
add.s #para somar valores com ponto flutuante 
mul.s #para multiplicar valores com ponto flutuante 
div.s #para dividir valores com ponto flutuante 
sub.s #para subtrair valores com ponto flutuante 

#4) principais comandos comparativos 
beq # se o primeiro valor e igual ao segundo valor 
bne # se o primeiro valor e diferente do segundo valor 
blt # se o primiero valor for menor que o segundo valor 
bgt # se o primeiro valor for maior que o segundo valor 
ble # se o primeiro valor for menor ou igual ao segundo valor 
bge # se o primeiro valor for maior ou igual ao segundo valor 
beqz #se o valor for igual a zero

#5) elabore uma macro que leia um valor inteiro 
.macro lerInteiro(%x)
	li $v0,5
	syscall
	move %x, $v0
.end_macro

#6) Printar valores inteiros e valores de ponto flutuante 
.macro printFloat()
	li $v0, 2
	syscall
.end_macro

.macro printInteiro()
	li $v0, 1
	la $a0, $t0 #$t0 sem onde esta o valor a ser printado
  	syscall 
.end_macro

#7) ler valor de ponto flutuante 
.macro lerFlutuante(%m1)
	li $v0, 6
	syscall
	mov.s %m1, $f0
.end_macro

#8) soamr valores de ponto flutuantes 
.macro somaDePontoFlutuante(%v1,%v2,%v3)
	add.s %v3, %v1, %v2
.end_macro 
	