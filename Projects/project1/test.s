.text 
.globl __start

__start:
addiu $t0, $0, 0
beq $t0, $0, ELSE

j IF
add $t0, $t0, $0

ELSE:
    addiu $t0, $t0, 2
    j EXIT
    add $t0, $t0, $0
IF:
    addiu $t0, $t0, 3
    j EXIT
    add $t0, $t0, $0

EXIT:
addiu $v0, $0, 10
syscall