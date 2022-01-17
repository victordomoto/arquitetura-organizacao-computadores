#Nome: Victor Akio Domoto
#RA: 150546
#Turma: N

.data
    entradaDia: .asciiz "Entre com o dia (DD): \n"
    entradaMes: .asciiz "Entre com o mes (MM): \n"
    entradaAno: .asciiz "Entre com o ano (AAAA): \n"
    dataNasc:   .asciiz "\nData de Nascimento: "
    barra:      .asciiz "/"
    
    erroDia:    .asciiz "Dia invalido.\n"
    erroMes:    .asciiz "Mes invalido.\n"
    erroAno:    .asciiz "Ano invalido.\n"
    
    
.text
.globl main
main:
    jal dia
dia:
    #lendo entrada dia
    li $v0, 4 
    la $a0, entradaDia
    syscall 
    
    #le dia 
    li $v0, 5
    syscall
    
    #salvando o valor do dia em $s1
    move $s1, $v0  
    
    
leDia:
    #guardando valores especificos 
    li $t0, 1
    li $t1, 32
    
    #criterio de parada
    sge $t3, $s1, $t0
    slt $t4, $s1, $t1
    and $t5, $t3, $t4
    beq $t5, 1, mes
    
    #printando a msg de dia invalido 
    li $v0, 4
    la $a0, erroDia
    syscall
    
    #lendo entrada dia
    li $v0, 4 
    la $a0, entradaDia
    syscall 
    
    #le novamente a string
    li $v0, 5
    syscall
    
    move $s1, $v0
    
    j leDia
    
mes:
    #lendo entrada mes
    li $v0, 4 
    la $a0, entradaMes
    syscall 
    
    #le mes 
    li $v0, 5
    syscall
    
    #salvando o valor do dia em $s1
    move $s2, $v0  
    
leMes:
    #zerando os registradores
    li $t1, 0 
    li $t2, 0 
    li $t3, 0 
    li $t4, 0 
    li $t5, 0

    #guardando valores especificos 
    li $t0, 1
    li $t1, 13
    
    #criterio de parada
    sge $t3, $s2, $t0
    slt $t4, $s2, $t1
    and $t5, $t3, $t4
    beq $t5, 1, ano
    
    #printando a msg de mes invalido 
    li $v0, 4
    la $a0, erroMes
    syscall
    
    #lendo entrada mes
    li $v0, 4 
    la $a0, entradaMes
    syscall 
    
    #le novamente a string
    li $v0, 5
    syscall
    
    move $s2, $v0
    
    j leMes
    
ano:
    #imprime entrada 
    li $v0, 4
    la $a0, entradaAno
    syscall
    
    #le ano 
    li $v0, 5
    syscall
    
    #salvando o valor do ano em $s3
    move $s3, $v0  
    

leAno:
    #zerando os registradores
    li $t1, 0 
    li $t2, 0 
    li $t3, 0 
    li $t4, 0 
    li $t5, 0
    
    #guardando valores especificos 
    li $t0, 1900
    li $t1, 2022
    
    #criterio de parada
    sge $t3, $s3, $t0
    slt $t4, $s3, $t1
    
    and $t5, $t3, $t4
    beq $t5, 1, output
    
    #printando a msg de ano invalido 
    li $v0, 4
    la $a0, erroAno
    syscall
    
    #imprime entrada 
    li $v0, 4
    la $a0, entradaAno
    syscall
    
    #le novamente a string
    li $v0, 5
    syscall
    
    move $s3, $v0
    
    j leAno

output:
    #zerando os registradores
    li $t1, 0 
    li $t2, 0 
    li $t3, 0 
    li $t4, 0 
    li $t5, 0
    
    li $t6, 10
    li $s5, 1
    
    #$t7 e $t8 guarda se mes e dias sao < 10
    slt $t7, $s1, $t6
    slt $t8, $s2, $t6
    and $s4, $t7, $t8

    
    beq $s4, 1, imprimeDiasMesesZeros
    blt $s2, $t6, imprimeMesesZero
    blt $s1, $t6, imprimeDiasZero
    
    
    
    #imprimindo a mensagem "data de nascimento"
    li $v0, 4
    la $a0, dataNasc
    syscall
    
    
    #imprimindo o dia
    li $v0, 1
    move $a0, $s1
    syscall
    
    #imprimindo o barra entre o dia e o mes
    li $v0, 4
    la $a0, barra
    syscall
    
    #imprimindo o mes
    li $v0, 1 
    move $a0, $s2
    syscall
    
    #imprimindo o barra entre o mes e o ano
    li $v0, 4
    la $a0, barra
    syscall
    
    #imprimindo o ano
    li $v0, 1 
    move $a0, $s3
    syscall
    
    li $v0, 10
    syscall
    
imprimeDiasZero:

    #imprimindo a mensagem "data de nascimento"
    li $v0, 4
    la $a0, dataNasc
    syscall
    
    #zerando os registradores
    li $t1, 0 
    li $t2, 0 
    li $t3, 0 
    li $t4, 0 
    li $t5, 0
    
    li $v0, 1
    move $a0, $zero
    syscall
    
    li $v0, 1
    move $a0, $s1
    syscall
    
    #imprimindo o barra entre o dia e o mes
    li $v0, 4
    la $a0, barra
    syscall
    
    #imprimindo o mes
    li $v0, 1 
    move $a0, $s2
    syscall
    
    #imprimindo o barra entre o mes e o ano
    li $v0, 4
    la $a0, barra
    syscall
    
    #imprimindo o ano
    li $v0, 1 
    move $a0, $s3
    syscall
    
    li $v0, 10
    syscall
    
imprimeMesesZero:
    #imprimindo a mensagem "data de nascimento"
    li $v0, 4
    la $a0, dataNasc
    syscall
    
    #zerando os registradores
    li $t1, 0 
    li $t2, 0 
    li $t3, 0 
    li $t4, 0 
    li $t5, 0
    
    li $v0, 1
    move $a0, $s1
    syscall
    
    #imprimindo o barra entre o dia e o mes
    li $v0, 4
    la $a0, barra
    syscall
    
    li $v0, 1
    move $a0, $zero
    syscall
    
    #imprimindo o mes
    li $v0, 1 
    move $a0, $s2
    syscall
    
    #imprimindo o barra entre o mes e o ano
    li $v0, 4
    la $a0, barra
    syscall
    
    #imprimindo o ano
    li $v0, 1 
    move $a0, $s3
    syscall
    
    li $v0, 10
    syscall

imprimeDiasMesesZeros:
    #imprimindo a mensagem "data de nascimento"
    li $v0, 4
    la $a0, dataNasc
    syscall
    
    #zerando os registradores
    li $t1, 0 
    li $t2, 0 
    li $t3, 0 
    li $t4, 0 
    li $t5, 0

    li $v0, 1
    move $a0, $zero
    syscall
    
    li $v0, 1
    move $a0, $s1
    syscall
    
    #imprimindo o barra entre o dia e o mes
    li $v0, 4
    la $a0, barra
    syscall
    
    #imprime 0
    li $v0, 1
    move $a0, $zero
    syscall
    
    #imprimindo o mes
    li $v0, 1 
    move $a0, $s2
    syscall
    
    #imprimindo o barra entre o mes e o ano
    li $v0, 4
    la $a0, barra
    syscall
    
    #imprimindo o ano
    li $v0, 1 
    move $a0, $s3
    syscall
    
    li $v0, 10
    syscall
    

    
    

    