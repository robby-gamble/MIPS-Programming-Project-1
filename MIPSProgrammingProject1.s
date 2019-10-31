.data
sum: .word  0 #I will use this to store the value of the users input
message1: .asciiz "Input exactly 10 characters." #I'll need this to communicate with the user
buffer: .space 11

.text
main:

#I'm about to ask the user to input 10 characters
li $v0, 4   #Command to print a string
la $a0, message1    #Loading the string into the argument to enable printing
syscall #executing command


li $v0, 8 #Command to read a string
la $a0, buffer #loading space for the array to be stored
li $a1, 11 #allocating byte space for string to be stored
move $t0, $a0 #storing string in t0
syscall #executing command



lb $t3, 0($t0)
li $v0, 11
la $a0, 0($t3)
syscall

lb $t3, 1($t0)
li $v0, 11
la $a0, 0($t3)
syscall

lb $t3, 2($t0)
li $v0, 11
la $a0, ($t3)
syscall

lb $t3, 3($t0)
li $v0, 11
la $a0, 0($t3)
syscall

lb $t3, 4($t0)
li $v0, 11
la $a0, 0($t3)
syscall

lb $t3, 5($t0)
li $v0, 11
la $a0, 0($t3)
syscall

lb $t3, 6($t0)
li $v0, 11
la $a0, 0($t3)
syscall

lb $t3, 7($t0)
li $v0, 11
la $a0, 0($t3)
syscall

lb $t3, 8($t0)
li $v0, 11
la $a0, 0($t3)
syscall

lb $t3, 9($t0)
li $v0, 11
la $a0, 0($t3)
syscall




exit:




li $v0, 10 #exit code
syscall
