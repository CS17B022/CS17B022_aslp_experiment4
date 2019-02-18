.data
array1: .space 5	#reserves a block of 5 bytes (5 ascii characters) for char array1
array2: .space 5	#reserves a block of 5 bytes (5 ascii characters) for char array2

.text

main:
li $s3,5	#size of array
la $s0,array1	#store the base address of array1 in s0
la $s1,array2	#store the base address of array2 in s1

#array1 = {'a','b','c','d','e'}
#array2 = {'e','d','c','b','a'}

#storing the elements of array1
li $t0,97	#ascii value for 'a'
sb $t0,0($s0)
li $t0,98	#ascii value for 'b'
sb $t0,1($s0)
li $t0,99	#ascii value for 'c'
sb $t0,2($s0)
li $t0,100	#ascii value for 'd'
sb $t0,3($s0)
li $t0,101	#ascii value for 'e'
sb $t0,4($s0)

#storing the elements of array2
li $t0,101	
sb $t0,0($s1)
li $t0,100	
sb $t0,1($s1)
li $t0,99	
sb $t0,2($s1)
li $t0,98	
sb $t0,3($s1)
li $t0,97	
sb $t0,4($s1)

swapLoop:
beqz $s3,Exit
addi $s3,$s3,-1
add $t0,$s3,$s0	#for accessing array1[i] 
add $t1,$s3,$s1	#for accessing array2[i]
lb $t2,0($t0)	#load the value of array1[i] in t2
lb $t3,0($t1)	#load the value of array2[i] in t3
sb $t3,0($t0)	#store the value of old array2[i] in new array1[i] #swapping the contents
sb $t2,0($t1)	#store the value of old array1[i] in new array2[i] #swapping the contents
j swapLoop

Exit:
jr $ra
.end main