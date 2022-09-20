global main
extern printf , scanf

section .text
main :
    push rbp
    mov rbp , rsp
    sub rsp , 16

    xor eax , eax
    lea rdi , [ msg ] ; first parameter
    call printf
    
    mov eax , 0
    lea rdi , [ format ]
    lea rsi , [ number ]
    call scanf

    xor eax , eax
    lea rdi , [ format]
    mov edx , [ number ] ; first parameter
    call printf

    add rsp , 16
    leave
    ret

section .data
   msg : db " Enter a number : " , 0
   format : db " %d " , 0
section .bss
   number resb 4
