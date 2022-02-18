#Nome: Victor Akio Domoto
#RA: 150546		
#Turma: N

.data 
	inserirMensagem: .asciiz "Insira a mensagem: "
	totalCaracter: .asciiz "Numero total de caracteres: "
	msgCriptografada: .asciiz "Mensagem Criptografada: "
	pularLinha: .asciiz "\n"
	espacoTexto: .asciiz " "
	
	label: .word imprimeInserirMsg, imprimeQuantidadeCaracter, imprimeQuebraLinha, imprimeStringMsgCriptografia, imprimeMsgCriptografada, encerraPrograma, lerMsg, armazenaMsg,laco, saida, imprimeStringCaracter, ESPACO, NUMUM, NUMDOIS, NUMTRES, NUMQUATRO, NUMCINCO, NUMSEIS, NUMSETE, NUMOITO, NUMNOVE, letraA, letraR, letraE, letraO, letraM, letraH, letraL, letraS, letraP
	msg: .space 1000000000 
	

	
.text
.globl main 

main: 
	j imprimeInserirMsg
		
imprimeInserirMsg:
	#imprime inserirMensagem
	li $v0, 4
	la $a0, inserirMensagem
	syscall 
	
	j lerMsg
	
lerMsg:
	#lendo a msg 
	li $v0, 8
	la $a0, msg
	li $a1, 1000000000 
	syscall
	
	j armazenaMsg
	
armazenaMsg:
	#armazenando a msg em t0
	li $t1, 0
	la $s0, msg
	
laco: 
	lb $s1, 0($s0)
	beqz $s1, saida
	
	#conta quantos caracteres tem
	addi $t8, $t8, 1
	
	
	#beq para cada caso (numero)
	beq $s1, '0', NUMZERO
	beq $s1, '1', letraA 
	beq $s1, '2', letraR
	beq $s1, '3', letraE
	beq $s1, '4', letraO
	beq $s1, '5', letraM
	beq $s1, '6', letraH
	beq $s1, '7', letraL
	beq $s1, '8', letraS
	beq $s1, '9', letraP
	
	#beq para cada caso (letra)
	beq $s1, ' ', ESPACO 
	beq $s1, 'a', NUMUM
	beq $s1, 'A', NUMUM 
	
	beq $s1, 'r', NUMDOIS 
	beq $s1, 'R', NUMDOIS
	
	beq $s1, 'e', NUMTRES
	beq $s1, 'E', NUMTRES
	
	beq $s1, 'o', NUMQUATRO
	beq $s1, 'O', NUMQUATRO
	
	beq $s1, 'm', NUMCINCO
	beq $s1, 'M', NUMCINCO 
	
	beq $s1, 'h', NUMSEIS
	beq $s1, 'H', NUMSEIS
	
	beq $s1, 'l', NUMSETE
	beq $s1, 'L', NUMSETE
	
	beq $s1, 's', NUMOITO
	beq $s1, 'S', NUMOITO
	
	beq $s1, 'p', NUMNOVE 
	beq $s1, 'P', NUMNOVE
	


	
	

  
#posicaondo os caracteres 
posicao:
	addi $s0, $s0, 1 
	j laco
	
#Label da primeira parte: (A)
ESPACO:
    li $s2, '0'
    sb $s2, ($s0)
    j posicao
NUMZERO:
    li $s2, ' '
    sb $s2, ($s0)
    j posicao
        
NUMUM:
    li $s2, '1'
    sb $s2, ($s0)
    j posicao
    
   	
NUMDOIS:
    li $s2, '2'
    sb $s2, ($s0)
    j posicao
    
	
NUMTRES:
    li $s2, '3'
    sb $s2, ($s0)
    j posicao
    	
NUMQUATRO:
    li $s2, '4'
    sb $s2, ($s0)
    j posicao
    	
NUMCINCO:
    li $s2, '5'
    sb $s2, ($s0)
    j posicao
    	
NUMSEIS:
    li $s2, '6'
    sb $s2, ($s0)
    j posicao
    
  	
NUMSETE:
    li $s2, '7'
    sb $s2, ($s0)
    j posicao
    	
NUMOITO:
    li $s2, '8'
    sb $s2, ($s0)
    j posicao
    	
NUMNOVE:
    li $s2, '9'
    sb $s2, ($s0)
    j posicao
    
    
letraA:
    li $s2, 'A'
    sb $s2, ($s0)
    j posicao
letraR:
    li $s2, 'R'
    sb $s2, ($s0)
    j posicao
    
letraE:
    li $s2, 'E'
    sb $s2, ($s0)
    j posicao
letraO:
    li $s2, 'O'
    sb $s2, ($s0)
    j posicao
    
letraM:
    li $s2, 'M'
    sb $s2, ($s0)
    j posicao
letraH:
    li $s2, 'H'
    sb $s2, ($s0)
    j posicao
letraL:
    li $s2, 'L'
    sb $s2, ($s0)
    j posicao
letraS:
    li $s2, 'S'
    sb $s2, ($s0)
    j posicao
    
letraP:
    li $s2, 'P'
    sb $s2, ($s0)
    j posicao

                

#saida do laco 
saida:
    	li $t7, 1 
	sub $t8, $t8, $t7
	j imprimeStringCaracter  
	  
    
#imprime as saidas     
imprimeStringCaracter:
    #Numero total de caracteres  
	li $v0, 4
	la $a0, totalCaracter
	syscall 
	j imprimeQuantidadeCaracter
	
imprimeQuantidadeCaracter:
	#imprimir quantidade de caracteres 
	li $v0, 1
	add $a0, $t8, $zero
	syscall
	j imprimeQuebraLinha
	
imprimeQuebraLinha:
	#quebra de linha 
	li $v0, 4 
	la $a0, pularLinha
	syscall
	j imprimeStringMsgCriptografia
	
imprimeStringMsgCriptografia:
	#imprimir msg de criptografia 
	li $v0, 4 
	la $a0, msgCriptografada 
	syscall
	j imprimeMsgCriptografada
	
imprimeMsgCriptografada:
	#imprimir msg criptografada 
   	li $v0, 4 
    	la $a0, msg
    	syscall
    	j encerraPrograma 
    	
encerraPrograma:
    	li $v0, 10 
    	syscall
