.data
prompt:     .asciiz "Enter a positive number: "
error_msg:  .asciiz "Invalid input. Please enter a positive number.\n"
result_msg: .asciiz "The sum of the first N natural numbers is: "
newline:    .asciiz "\n"

.text
.globl main

main:
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    blez $t0, invalid_input

    li $t1, 0
    li $t2, 1

loop:
    ble $t2, $t0, add_to_sum
    j print_result

add_to_sum:
    add $t1, $t1, $t2
    addi $t2, $t2, 1
    j loop

print_result:
    li $v0, 4
    la $a0, result_msg
    syscall

    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    j exit

invalid_input:
    li $v0, 4
    la $a0, error_msg
    syscall
    j main

exit:
    li $v0, 10
    syscall
