.data
b13:	.word 0		#(00000000000000000000000000000000)
b12:	.word -1	#(11111111111111111111111111111111)
b11:	.word -2147483648	#(10000000000000000000000000000000)
b10:	.word -1	#(11111111111111111111111111111111)
b23:	.word 0		#(00000000000000000000000000000000)
b22:	.word -1	#(11111111111111111111111111111111)
b21:	.word -2147483648	#(10000000000000000000000000000000)
b20:	.word -1	#(11111111111111111111111111111111)
#the first 128-bit number is (b13 b12 b11 b10) and the second 128-bit number is (b23 b22 b21 b20)
#the sum of these two numbers should not give an error as there is no overflow
.text
main:
la $t3,b13
la $t2,b12
la $t1,b11
la $t0,b10
la $t7,b23
la $t6,b22
la $t5,b21
la $t4,b20
lw $s3,0($t3)
lw $s2,0($t2)
lw $s1,0($t1)
lw $s0,0($t0)
lw $s7,0($t7)
lw $s6,0($t6)
lw $s5,0($t5)
lw $s4,0($t4)

li $t8,0	#initial carry
#for addition of first three 32-bit numbers
addu $s0,$s0,$s4
sltu $t9,$s0,$s4
addu $s0,$s0,$t8
sltu $t8,$s0,$t8	#first 32-bit result stored in s0
or $t8,$t8,$t9		#carry-out on addition of first 32-bit numbers stored in t8
addu $s1,$s1,$s5
sltu $t9,$s1,$s5
addu $s1,$s1,$t8
sltu $t8,$s1,$t8	#second 32-bit result stored in s1
or $t8,$t8,$t9		#carry-out on addition of second 32-bit numbers stored in t8
addu $s2,$s2,$s6
sltu $t9,$s2,$s6
addu $s2,$s2,$t8
sltu $t8,$s2,$t8	#third 32-bit result stored in s2
or $t8,$t8,$t9		#carry-out on addition of third 32-bit numbers stored in t8
#addition of 4th 32-bit numbers will be signed addition so if there is overflow qtspim will throw an error
add $s3,$s3,$s7
add $s3,$s3,$t8		#fourth 32-bit result stored in s3
#final result i.e. sum of the given 128-bit numbers is (s3 s2 s1 s0) 
jr $ra
.end main
