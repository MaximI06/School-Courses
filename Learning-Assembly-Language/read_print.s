# Program: Read and Print Integer
# Purpose: This MIPS assembly program prompts the user to enter an integer, reads the input,
#          and then prints the entered integer back to the console.
.text
main:
    # Prompt for the integer to enter
    li $v0, 4           # Load syscall number 4 (print string) into $v0
    la $a0, prompt      # Load the address of the "prompt" string into $a0
    syscall             # Print the prompt message

    # Read the integer from the user
    li $v0, 5           # Load syscall number 5 (read integer) into $v0
    syscall             # Read the integer input from the user
    move $s0, $v0       # Save the entered integer from $v0 to $s0

    # Print the output message
    li $v0, 4           # Load syscall number 4 (print string) into $v0
    la $a0, output      # Load the address of the "output" string into $a0
    syscall             # Print the output message

    # Print the entered number
    li $v0, 1           # Load syscall number 1 (print integer) into $v0
    move $a0, $s0       # Move the integer value from $s0 to $a0
    syscall             # Print the integer stored in $a0

    # Exit the program
    li $v0, 10          # Load syscall number 10 (exit) into $v0
    syscall             # Exit the program

.data
prompt: .asciiz "Please enter an integer: "   # Prompt message string
output: .asciiz "\nYou typed the number "     # Output message string

