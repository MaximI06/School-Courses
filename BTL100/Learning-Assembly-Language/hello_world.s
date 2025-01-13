# Program: Program2-1.asm
# Author: Charles Kann
# Purpose: A simple MIPS assembly program that prints "Hello World" to the console
#          and then exits. Demonstrates basic use of syscall for printing and exiting.

.text                   # Program instructions section
main:                   # Entry point of the program
    li $v0, 4           # Load syscall number 4 (print string) into $v0
    la $a0, greeting    # Load the address of the string "greeting" into $a0
    syscall             # Perform the print string syscall
    li $v0, 10          # Load syscall number 10 (exit) into $v0
    syscall             # Perform the exit syscall

.data                   # Program data section
greeting: .asciiz "Hello World" # Define the null-terminated string to print

