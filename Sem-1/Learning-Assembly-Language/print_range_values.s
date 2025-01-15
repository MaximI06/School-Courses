.data
start_prompt: .asciiz "Enter the start integer: "   # Prompt for the start integer
end_prompt: .asciiz "Enter the end integer: "       # Prompt for the end integer
values_prompt: .asciiz "Values from "               # String for values start
to_prompt: .asciiz " to "                           # String for "to"
newline: .asciiz "\n"                               # Newline for formatting

.text
main:
    # Prompt the user to enter the start integer
    li $v0, 4            # syscall code for printing a string
    la $a0, start_prompt # load address of the start_prompt string
    syscall              # print start_prompt

    # Read the start integer
    li $v0, 5            # syscall code for reading an integer
    syscall              # read integer
    move $s0, $v0        # save the start integer in $s0

    # Prompt the user to enter the end integer
    li $v0, 4            # syscall code for printing a string
    la $a0, end_prompt   # load address of the end_prompt string
    syscall              # print end_prompt

    # Read the end integer
    li $v0, 5            # syscall code for reading an integer
    syscall              # read integer
    move $s1, $v0        # save the end integer in $s1

    # Display "Values from start to end:"
    li $v0, 4            # syscall code for printing a string
    la $a0, values_prompt
    syscall              # print values_prompt
    move $a0, $s0        # load start integer to print
    li $v0, 1            # syscall code for printing an integer
    syscall              # print start integer
    li $v0, 4            # syscall code for printing a string
    la $a0, to_prompt
    syscall              # print " to "
    move $a0, $s1        # load end integer to print
    li $v0, 1            # syscall code for printing an integer
    syscall              # print end integer
    li $v0, 4            # syscall code for printing a string
    la $a0, newline      # load address of the newline string
    syscall              # print newline

    # Display the values from start to end
    move $t0, $s0        # initialize loop counter with start integer
loop:
    bgt $t0, $s1, end_loop  # if loop counter > end integer, exit loop
    move $a0, $t0            # load loop counter to print
    li $v0, 1                # syscall code for printing an integer
    syscall                  # print loop counter
    li $v0, 4                # syscall code for printing a string
    la $a0, newline          # load address of the newline string
    syscall                  # print newline
    addi $t0, $t0, 1         # increment loop counter
    j loop                   # repeat loop

end_loop:
    # Exit the program
    li $v0, 10            # syscall code for exit
    syscall               # exit program

