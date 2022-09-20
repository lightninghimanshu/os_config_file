global main
extern printf , scanf

section .text
main :
    push rbp
    mov rbp , rsp
    sub rsp , 96

    xor eax , eax
    lea rdi , [msg] ; first parameter
    call printf
    
    lea rdi , [formatn]
    lea rsi , [number]
    mov eax , 0
    call scanf

    lea rdi , [formatn]
    mov edx , [number] ; first parameter
    xor eax , eax
    call printf

    xor eax , eax
    lea rdi , [msg] ; first parameter
    call printf    

    lea rax , [formats]
    lea rsi , [string]
    mov eax , 0
    call scanf

    lea rax , [formats]
    lea rsi , [string] ; first parameter
    xor eax , eax
    call printf

    add rsp , 96
    leave
    ret

section .data
   msg : db " Enter a number : ", 0
   formatn : db "%d", 0
   formats : dd "%s",10,0
   string times 100 db 0
   
section .bss
   number resb 4
