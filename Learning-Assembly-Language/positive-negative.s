.data
prompt:         .asciiz "Enter a value: "
positive_msg:   .asciiz "The value is positive.\n"
negative_msg:   .asciiz "The value is negative.\n"

.text
.globl main

main:
    # Print the prompt
    li $v0, 4              # syscall for print_string
    la $a0, prompt         # load address of the prompt message
    syscall

    # Read integer input
    li $v0, 5              # syscall for read_int
    syscall
    move $t0, $v0          # store the input in $t0

    # Check if the value is >= 0
    blez $t0, negative     # if $t0 <= 0, jump to negative label

    # Value is positive
    li $v0, 4              # syscall for print_string
    la $a0, positive_msg   # load address of the positive message
    syscall
    j exit                 # jump to exit

negative:
    # Value is negative
    li $v0, 4              # syscall for print_string
    la $a0, negative_msg   # load address of the negative message
    syscall

exit:
    # Exit the program
    li $v0, 10             # syscall for exit
    syscall
