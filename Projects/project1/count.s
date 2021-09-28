.data
tempArray: .word 23,41,-10,-4,4,16,29,-5,-6,-11,38,8,16,42,31,39,39,29,11,-17,19,53,4,21,32,42,37,-15,38,-5,32,-1,41,14,13,18
$output_hot: .asciiz "Hot days: " #90-9a
$output_cold: .asciiz "Cold days: " #9b-a6
$output_comfort: .asciiz "Comfortable days: " #a7-b9
$newline: .asciiz"\n"


.text 
.globl __start

#.macro print_int($int)
#addi $v0,$zero,1
#add $a0,$int,$zero
#syscall
#.end_macro

__start:
#size=s0,hotDay=s1,coldDay=s2,comfortDay=s3,tempArray=s4
    lui $s4,0x1000
    ori $s4,0x0000
    addi $s0,$zero,36
    addi $sp,$sp,-40
    sw $s0,36($sp)
    sw $s1,32($sp)
    sw $s2,28($sp)
    sw $s3,24($sp)
    sw $s4,20($sp)
    add $a0,$s4,$zero
    add $a1,$s0,$zero
    addi $a2,$zero,1
    jal countArray
    add $t7,$t7,$zero

    add $s1,$v0,$zero
    sw $s1,32($sp)
    lw $a0,20($sp)
    lw $a1,36($sp)
    addi $a2,$zero,-1
    jal countArray
    add $t7,$t7,$zero

    add $s2,$v0,$zero
    sw $s2,28($sp)
    lw $a0,20($sp)
    lw $a1,36($sp)
    add $a2,$zero,$zero
    jal countArray
    add $t7,$t7,$zero

    add $s3,$v0,$zero
    lw $s1,32($sp)
    lw $s2,28($sp)
    addi $sp,$sp,40

    lui $a0,0x1000
    ori $a0,0x0090
    addi $v0,$zero,4
    syscall
    addi $v0,$zero,1
    add $a0,$s1,$zero
    syscall
    lui $a0,0x1000
    ori $a0,0x00ba
    addi $v0,$zero,4
    syscall

    lui $a0,0x1000
    ori $a0,0x009b
    addi $v0,$zero,4
    syscall
    addi $v0,$zero,1
    add $a0,$s2,$zero
    syscall
    lui $a0,0x1000
    ori $a0,0x00ba
    addi $v0,$zero,4
    syscall

    lui $a0,0x1000
    ori $a0,0x00a7
    addi $v0,$zero,4
    syscall
    addi $v0,$zero,1
    add $a0,$s3,$zero
    syscall
    lui $a0,0x1000
    ori $a0,0x00ba
    addi $v0,$zero,4
    syscall
#print

    addi $v0,$zero,10
    syscall

#countArray***************************************
countArray:
    addi $s0,$a1,-1  # i=s0, i initilaized to be numElements-1
    add $s1,$zero,$zero  #s1=cnt=0
    j For
    add $t7,$t7,$zero

For:
    slt $t0,$s0,$zero #s0<0?
    addi $t2,$zero,1
    beq $t0,$t2,ExitFor
    add $t7,$t7,$zero    
    
    #stack
    addi $sp,$sp,-32
    sw $a0,28($sp)
    sw $a1,24($sp)
    sw $a2,20($sp)
    sw $s0,16($sp)
    sw $s1,12($sp)
    sw $ra,8($sp)
    add $s2,$a0,$zero  #s2=A[]
    sll $t0,$s0,2
    add $s2,$s2,$t0

    addi $t2,$zero,1
    beq $a2,$t2,Hotplus
    addi $t2,$zero,-1
    beq $a2,$t2,Coldplus
    j Comfortplus
    add $t7,$t7,$zero

Hotplus:
    lw $a0,0($s2)
    jal Hot 
    add $t7,$t7,$zero
    j Fortail
    add $t7,$t7,$zero

Coldplus:
    lw $a0,0($s2)
    jal Cold
    add $t7,$t7,$zero
    j Fortail
    add $t7,$t7,$zero

Comfortplus:
    lw $a0,0($s2)
    jal Comfort
    add $t7,$t7,$zero
    j Fortail
    add $t7,$t7,$zero

Fortail:
    lw $a0,28($sp)
    lw $a1,24($sp)
    lw $a2,20($sp)
    lw $s0,16($sp)
    lw $s1,12($sp)
    lw $ra,8($sp)
    add $sp,$sp,32
    add$s1,$s1,$v0
    addi $s0,$s0,-1
    j For
    add $t7,$t7,$zero

ExitFor:
    add $v0,$s1,$zero
    jr $ra
    add $t7,$t7,$zero
    #countArray over
    
#**********************************************

Hot:
    addi $t2,$zero,30
    slt $t0,$t2,$a0
    addi $t3,$zero,1
    beq $t0,$t3,hotreturn1
    add $v0,$zero,$zero
    jr $ra
    add $t7,$t7,$zero
    hotreturn1: # greater than 30,hot
        addi $v0,$zero,1
        jr $ra
        add $t7,$t7,$zero

Cold:
    addi $t2,$zero,5
    slt $t0,$t2,$a0
    addi $t3,$zero,1
    beq $t0,$t3,coldreturn0
    addi $v0,$zero,1
    jr $ra
    add $t7,$t7,$zero
    coldreturn0: #greater than 5, not cold
        add $v0,$zero,$zero
        jr $ra
        add $t7,$t7,$zero

Comfort:
    addi $t2,$zero,30
    slt $t0,$t2,$a0
    addi $t3,$zero,1
    beq $t0,$t3,comfortreturn0   
    addi $t2,$zero,5
    slt $t0,$a0,$t2
    beq $t0,$t3,comfortreturn0 
    addi $v0,$zero,1
    jr $ra
    add $t7,$t7,$zero
    comfortreturn0:
        add $v0,$zero,$zero
        jr $ra
        add $t7,$t7,$zero





