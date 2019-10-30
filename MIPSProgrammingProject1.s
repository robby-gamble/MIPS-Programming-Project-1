.data
sum: .word  0
message1: .asciiz "Input exactly 10 characters."

main:

#I'm about to ask the user to input 10 characters
li $v0, 4   #Command to print a string
la $a0, message1    #Loading the string into the argument to enable printing
syscall #executing command
