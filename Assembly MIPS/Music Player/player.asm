.include "music.asm"

.text
	
	# load the bytes vectors inside the file 
	la $t0, music
	# copiei byte (RAM) e joga para registrador t1
	lb $t1,($t0)
	# numero do primeiro instrumento a tocar
	add $t2, $zero, 50 
	
	
	
	loop:
		li $v0, 31 # definir uso de audio
		add $a0, $zero, $t1
		addi $a1, $zero, 700 #time
		add $a2, $zero, $t2
		addi $a3, $zero, 700 #volume
		
		
		syscall
		
		li $v0, 32 #sleep 
		addi $a0, $zero, 200
		syscall
		
		
		li $v0, 42 # usar recurso ramdom para instrumeto
		li $a1, 115
		syscall 
		move $t2, $a0
		
		 
		  add $t0, $t0, 1
		  lb $t1,($t1)
		  bne $t1, -1, loop # toca enquanto nao 
		  
		  
		  
		  
		  
		  
		  
