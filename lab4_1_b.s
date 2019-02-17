main:
lui $s1,32768	#s1 will become equal to 1 followed by 31 zeroes
li $s0,-100	#given number
and $s2,$s1,$s0		#taking and with s1 i.e. bit 31 which is equal to 1
beq $s2,$zero,Positive	#if and of the 31st bit of the number with 1 is 0 the number is positive else negative 
li $s3,1	#s3 stores the result 1 for negative 0 for positive
j Exit

Positive:
li $s3,0

Exit:
jr $ra
.end main
