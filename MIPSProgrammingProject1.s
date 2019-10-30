.data
sum: .word  0 #I will use this to store the value of the users input
message1: .asciiz "Input exactly 10 characters." #I'll need this to communicate with the user
inputarray: .space 50 #I'm creating an array of 50 bytes to store the users characters

main:

#I'm about to ask the user to input 10 characters
li $v0, 4   #Command to print a string
la $a0, message1    #Loading the string into the argument to enable printing
syscall #executing command


li $v0, 8 #Command to read a string
syscall #executing command
move inputarray, $v0 #This line stores the character into the array

