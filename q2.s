global main
extern printf
extern scanf
section .text
main:
    push rbp
    mov rbp , rsp 

    xor eax,eax
    lea rdi, [msgN]
    call printf

    mov eax ,0
    lea rdi, [fmtN]
    lea rsi, [number]
    call scanf

    xor eax,eax
    lea rdi, [msgS]
    call printf

    mov eax ,0
    lea rdi, [fmtS]
    lea rsi, [string]
    call scanf

    xor eax,eax
    mov rdi, PfmtN
    mov rsi, [number]
    call printf

    
    xor eax,eax
    mov rdi, PfmtS
    lea rsi, [string]
    call printf

    leave
    ret
section .data
    msgN: db "Enter a Number : ",0
    msgS: db "Enter a String : ",0
    fmtN: db "%d",0
    PfmtN: db "%d",10,0
    fmtS: db "%s",0
    PfmtS: db "%s",10,0
section .bss
    number resb 32
    string resb 32