section .data
   msg : db "Enter a number :", 0
   msg2 : db "Enter a string :", 0
   formatni : db "%d", 0
   formatno : db "%d", 10, 0
   formatsi : db "%s",0
   formatso : db "%s",10,0
   string times 100 db 0   
section .bss
   number resb 16
section .text
extern printf 
extern scanf
global main
main:
    push rbp
    mov rbp , rsp
    sub rsp , 96

    xor eax , eax
    lea rdi , [msg] 
    call printf
    
    mov eax , 0
    lea rdi , [formatni]
    lea rsi , [number]
    call scanf

    xor eax , eax
    lea rdi , [formatno]
    mov edx , [number] 
    call printf

    xor eax , eax
    lea rdi , [msg2] 
    call printf    

    mov eax , 0
    lea rdi , [formatsi]
    lea rsi , [string]
    call scanf

    xor eax , eax
    lea rdi , [formatso]
    lea rsi , [string] 
    call printf

    add rsp , 96
    leave
    ret

