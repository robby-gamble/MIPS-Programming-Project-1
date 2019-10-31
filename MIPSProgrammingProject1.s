.data
sum: .word  0 #I will use this to store the value of the users input
message1: .asciiz "Input exactly 10 characters." #I'll need this to communicate with the user
buffer: .space 32

.text
main:

#I'm about to ask the user to input 10 characters
li $v0, 4   #Command to print a string
la $a0, message1    #Loading the string into the argument to enable printing
syscall #executing command


li $v0, 8 #Command to read a string
la $a0, buffer #storing space for the string
li $a1, 11 #allocating byte space for string to be stored
move $s1, $a0 #storing string in t0
syscall #executing command






loopSelector:
bge $t3, 11, Sum #as long as it is less than 11 it will loop.
lb $t2, 0($s1) #Loading the value stored in the input at the base address.
ble $t2, 47, specialCharacters #If the loaded value is less than 47 on the ascii table then it is a special character, so it jumps to the specialCharacter function.
ble $t2, 57, zeroThroughNine #If the loaded value is less than 58 and greater than 47 on the ascii table then it is a regular number 0-9, so it jumps to the zeroThroughNine function.
ble $t2, 78, upperCase #If the number is less than 78 and greater than 57 on the ascii table then it is possibly an upperCase number, so it jumps to the upperCase function.
ble $t2, 110, lowerCase #If the number is less than 110 and greater than 90 it is possibly a lowerCase character, so it jumps to lowerCase function.


specialCharacters:
sub $s2, $t2, $t2 #If an object is a special character it will elimate itself, and then it will store its value into register s2
add sum, sum, $s2 #The value is then added to the sum.

addi $t3, $t3, 1 #incrementing register 3



zeroThroughNine:
sub $s2, $t2, 48 #Because the value of character 0 is 48 in decimal to properly calculate my sum I need to subtract 48 from the input value.
add sum, sum, $s2 #The value is then added to the sum.

addi $t3, $t3, 1 #incrementing register 3

upperCase:
sub $s2, $t2, 55 #With my base system, the value of n is 23. In order to properly represent that value I had to subtract 55 from the input value.
add sum, sum, $s2 #The value is then added to the sum.


addi $t3, $t3, 1 #incrementing register 3
lowerCase:
sub $s2, $t2, 87 ##With my base system, the value of n is 23. In order to properly represent that value I had to subtract 87 from the input value.
add sum, sum, $s2 #The value is then added to the sum.

addi $t3, $t3, 1 #incrementing register 3



Sum:




li $v0, 10 #exit code
syscall
