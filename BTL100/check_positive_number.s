.data
num: .word 5                    # Define a word with value 5, representing the number
PositiveNumber: .asciiz "Number is positive\n"  # Define a null-terminated string

.text
main:
    # Check if (num > 0)
    lw $t0, num                # Load the value of num (5) into register $t0
    bgtz $t0, print_positive   # Branch if $t0 (num) is greater than zero

    # Code block to execute if num <= 0
    # Here, you can add code to handle the case where num is not positive
    j end_if                    # Jump to end_if (exit point)

print_positive:
    # Code block to execute if num > 0
    # Print "Number is positive"
    la $a0, PositiveNumber     # Load the address of the string "Number is positive"
    li $v0, 4                  # Load 4 into $v0 to indicate a print string syscall
    syscall                    # Execute syscall to print the string

end_if:
    # Exit the program
    li $v0, 10                 # Load 10 into $v0 to indicate an exit syscall
    syscall                    # Execute syscall to exit the program

›