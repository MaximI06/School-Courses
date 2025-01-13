.data
newline: .asciiz "\n"  # Newline character for formatting output

.text
main:
    li $t0, 1           # Load initial value 1 into $t0

loop:
    # Display the value in $t0
    move $a0, $t0       # Move the value in $t0 to $a0 for printing
    li $v0, 1           # Load 1 into $v0 to indicate a print integer syscall
    syscall             # Print the integer

    # Print a newline for formatting
    li $v0, 4           # Load 4 into $v0 to indicate a print string syscall
    la $a0, newline     # Load the address of the newline string
    syscall             # Print the newline

    # Increment $t0
    addi $t0, $t0, 1    # Increment the value in $t0 by 1

    # Check if $t0 is greater than 10, if yes, exit loop
    li $t1, 11          # Load 11 into $t1
    bge $t0, $t1, end_loop # Branch to end_loop if $t0 >= $t1

    # Otherwise, repeat loop
    j loop

end_loop:
    # Exit the program
    li $v0, 10          # Load 10 into $v0 to indicate an exit syscall
    syscall             # Exit the program

