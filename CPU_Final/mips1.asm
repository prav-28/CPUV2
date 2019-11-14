addi $a0, $0, 1

gain:
beq $a2, $a0, compare
addi $a2, $a2, 1
add $a1, $a1, $a0
beq $0, $0, gain

compare:
add $t1, $0, $a1
sw $t1, 0xFFFFFFF0
add $a1, $0, $0
add $a2, $0, $0

addi $a0, $a0, 1
beq $0, $0, gain
