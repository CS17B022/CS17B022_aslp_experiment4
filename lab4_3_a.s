.data
array1: .space 20	#reserves a block of 20 bytes (5 integers) for integer array1
array2: .space 20	#reserves a block of 20 bytes (5 integers) for integer array2

.text

main:
li $s3,5	#size of array
la $s0,array1	#store the base address of array1 in s0
la $s1,array2	#store the base address of array2 in s1

#array1 = {1,2,3,4,5}
#array2 = {5,4,3,2,1}

#storing the elements of array1
li $t0,1
sw $t0,0($s0)
li $t0,2
sw $t0,4($s0)
li $t0,3
sw $t0,8($s0)
li $t0,4
sw $t0,12($s0)
li $t0,5
sw $t0,16($s0)

#storing the elements of array2
li $t0,5
sw $t0,0($s1)
li $t0,4
sw $t0,4($s1)
li $t0,3
sw $t0,8($s1)
li $t0,2
sw $t0,12($s1)
li $t0,1
sw $t0,16($s1)

swapLoop:
beqz $s3,Exit
addi $s3,$s3,-1
sll $t0,$s3,2	#$s3*4 (i*4) for addressing the location
sll $t1,$s3,2
add $t0,$t0,$s0	#for accessing array1[i] 
add $t1,$t1,$s1	#for accessing array2[i]
lw $t2,0($t0)	#load the value of array1[i] in t2
lw $t3,0($t1)	#load the value of array2[i] in t3
sw $t3,0($t0)	#store the value of old array2[i] in new array1[i] #swapping the contents
sw $t2,0($t1)	#store the value of old array1[i] in new array2[i] #swapping the contents
j swapLoop

Exit:
jr $ra
.end main