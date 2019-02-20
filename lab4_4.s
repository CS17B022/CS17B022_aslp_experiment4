.data
hi: .space 128	#the high 32-bits of partial products
lo: .space 128	#the low 32-bits of partial products
phi: .word 0	#the high 32-bits of product
plo: .word 0	#the low 32-bits of product

.text
main:
li $s0,-1431655766	#multiplicand	(10101010101010101010101010101010)
li $s1,-1431655766	#multiplier (10101010101010101010101010101010)
la $s2,lo
la $s3,hi
la $s4,plo
la $s5,phi
li $t0,0	#loop counter for i:0 to 31
li $t1,32	#loop counter for j:32 to 1
li $s6,0	#low 32-bits of product 
li $s7,0	#high 32-bits of product

loop:
beq $t1,$0,exit
sll $t5,$t0,2	#i*4
add $t6,$s2,$t5	#address of lo[i]
add $t7,$s3,$t5	#address of hi[i]
andi $t8,$s1,1
beq $t8,$0,shift
add $t2,$s0,$0	#low 32-bits of partial product
sllv $t2,$t2,$t0
add $t3,$s0,$0	#high 32-bits of partial product
srlv $t3,$t3,$t1

L1:
sw $t2,0($t6)	#store low 32-bits of partial product in memory
sw $t3,0($t7)	#store high 32-bits of partial product in memory
addu $s6,$s6,$t2	#adding partial product to obtain low 32-bits of total product
sltu $t4,$s6,$t2	#carry-out
addu $s7,$s7,$t3
addu $s7,$s7,$t4	#adding partial product to obtain high 32-bits of total product
srl $s1,$s1,1
addi $t0,$t0,1
addi $t1,$t1,-1
j loop

shift:
li $t2,0
li $t3,0
j L1

exit:
sw $s6,0($s4)	#store low 32-bits of product in memory
sw $s7,0($s5)	#store high 32-bits of product in memory
jr $ra
.end main