section .text
extern printf , scanf
global main
main:
    push rbp
    mov rbp , rsp
    sub rsp , 96

    xor eax , eax
    lea rdi , [msg] 
    call printf
    
    mov eax , 0
    lea rdi , [formatn]
    lea rsi , [number]
    call scanf

    xor eax , eax
    lea rdi , [formatn]
    mov edx , [number] 
    call printf

    xor eax , eax
    lea rdi , [msg2] 
    call printf    

    mov eax , 0
    lea rdi , [formats]
    lea rsi , [string]
    call scanf

    xor eax , eax
    lea rdi , [formats]
    lea rsi , [string] 
    call printf

    add rsp , 96
    leave
    ret


section .data
   msg : db " Enter a number : ",10, 0
   msg2 : db " Enter a string : ",10, 0
   formatn : db "%d",10,0
   formats : db "%s",10,0
   string times 100 db 0
   
section .bss
   number resb 4