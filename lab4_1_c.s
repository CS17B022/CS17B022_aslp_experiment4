main:
li $s2,147	#stores the given number	#assume the given number is 147 = 00000000000000000000000010010011
li $s0,0	#stores number of 0 groups
li $s1,0	#stores number of 1 groups
li $t2,30	#counter
andi $t0,$s2,1	#take AND with bit 0 of the given number
add $t1,$t0,$zero #initializes the value of current group #t1 stores the value of current group
srl $s2,$s2,1	#shift the given number right one by one to have its all 32 bits

while:
beq $t2,$zero,Out	#comparison done till bit 30 of the number
andi $t0,$s2,1
bne $t0,$t1,Next	#when the new bit does not match with current group

L1:
add $t1,$t0,$zero	#update t1 with new value
srl $s2,$s2,1
addi $t2,$t2,-1
j while

Next:
bne $t1,$zero,One 	#if the current group is 1 branch to One
addi $s0,$s0,1
j L1

One:
addi $s1,$s1,1
j L1

Out:	#compares the last two bits bit 30 and bit 31 of the number
andi $t0,$s2,1	
bne $t0,$t1,Both	#if last two bits don't match
bne $t1,$zero,OnlyOne	#if last two bits match and equal to 1
addi $s0,$s0,1	#if last two bits match and equal to 0
j Exit

OnlyOne:
addi $s1,$s1,1
j Exit

Both:
addi $s0,$s0,1
addi $s1,$s1,1

Exit:
jr $ra
.end main

