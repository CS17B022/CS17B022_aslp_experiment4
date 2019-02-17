.data
var1: .word 0	#stores number of 1s
var2: .word 0	#stores number of 0s

.text

main:
li $s2,100	#given number
li $t0,0	
li $t1,32	

while:
beq $s2,$zero,Exit
andi $t2,$s2,1
add $t0,$t0,$t2
srl $s2,$s2,1
j while

Exit:
sub $t1,$t1,$t0
sw $t0,var1
sw $t1,var2
jr $ra

.end main

