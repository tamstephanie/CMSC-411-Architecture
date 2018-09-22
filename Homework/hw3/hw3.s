    .text
calculate_matrixC:
    MOV   R0, #0            @ loop counter
    LDR   R1, =matrixC
    MOV   R1, #0            @ will hold value of C

@ Compute matrix C (C = AB)
    LDR   R2, =matrixA      @ get address of matrixA
    LDR   R3, =matrixB      @ get address of matrixB

findC_loop:
    LDR   R4, [R2, R8]      @ get A[i]
    LDR   R5, [R3, R8]      @ get B[i]
    MUL   R6, R4, R5        @ compute A[i] * B[i]
    ADD   R1, R1, R6        @ add to sum (C += A[i] * B[i])
    ADD   R8, R8, #4        @ increment to next index
    ADD   R0, R0, #1        @ increment i by 1
    CMP   R0, #4                @ i == 4?
    BLT   findC_loop            @ continue calculation if not

calculate_matrixD:
    MOV   R0, #0            @ loop counter i
    MOV   R1, #0            @ loop counter j
    MOV   R2, #0            @ offset counter
    LDR   R3, =matrixA      @ get address of matrixA
    LDR   R4, =matrixB      @ get address of matrixB
    LDR   R5, =matrixD      @ get address of matrixD

findD_loop_j:
    LDR   R6, [R4, R9]      @ get B[i]
    LDR   R7, [R3, R10]     @ get A[j]
    MUL   R8, R6, R7        @ B[i] * A[j]
    ADD   R11, R11, #4      @ increment to next index of matrixD
    ADD   R10, R10, #4      @ increment to next index of matrixA
    ADD   R1, R1, #1        @ increment j by 1
    CMP   R1, #4                @ j == 4?
    BLT   findD_loop_j          @ continue onto next calculation


findD_loop_i:
    MOV   R1, #0            @ reset loop j counter to 0
    MOV   R10, #0           @ reset offset of matrixA
    ADD   R9, R9, #4        @ increment to next index of matrixB
    ADD   R0, R0, #1        @ increment i by 1
    CMP   R0, #4                @ i == 4?
    BLT   findD_loop_j          @ go back to calculations

exit:
    SWI   0x11

    .data
matrixA:  .word 1, 2, 3, 4
matrixB:  .word 9, 8, 7, 6
matrixC:  .word 0
matrixD:  .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    .end
