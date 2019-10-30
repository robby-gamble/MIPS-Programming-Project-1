.data
sum: .word  0 #I will use this to store the value of the users input
message1: .asciiz "Input exactly 10 characters." #I'll need this to communicate with the user
inputarray: .space 50 #I'm creating an array of 50 bytes to store the users characters
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

li $t1, 0 #creating a counter in $t0 and setting the value to 0
li $t3, 9

loopy:

lb $t2, 0($t0)











li $v0, 10 #exit code
syscall
