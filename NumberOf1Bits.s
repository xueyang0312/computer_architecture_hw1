.data
argument: .word 0b00000000000000000000000000001011
str1: .string "Number of "
str2: .string " 1 bits is "
str3: .string "'s"

.text
main:
    mv a0,x0 # count = 0
    lw a1,argument # n = 00000000000000000000000000001011
    jal ra,func
    
    # print the result to console
    mv a1,a0
    lw a0,argument
    jal ra,printResult
    
    # Exit program
    li a7,10
    ecall
func:
    mv t0,a0 # t0=count
    mv t1,a1 # t1=argument
_beq:
    bne t1,x0,cnt # if(n!=0) goto cnt
_ret:
    mv a0,t0 # a0=count
    ret
cnt:
    addi t2,t1,-1 # t2 = argument-1
    and t1,t1,t2 # n = n&(n-1)
    addi t0,t0,1 # count++
    j _beq
    
printResult:
    mv t0,a0 # t0:input value
    mv t1,a1 # t1:count
    la a0,str1
    li a7,4
    ecall
    mv a0,t0
    li a7,1
    ecall
    la a0,str3
    li a7,4
    ecall
    la a0,str2
    li a7,4
    ecall
    mv a0,t1
    li a7,1
    ecall
    ret
    
