section .data
   int_message : db "Enter a number :", 0
   string_message : db "Enter a string :", 0
   format_num_in : db "%d", 0
   format_num_out : db "%d", 10, 0
   format_str_in : db "%s",0
   format_str_out : db "%s",10,0
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
    lea rdi , [int_message] 
    call printf
    
    mov eax , 0
    lea rdi , [format_num_in]
    lea rsi , [number]
    call scanf

    xor eax , eax
    lea rdi , [format_num_out]
    mov edx , [number] 
    call printf

    xor eax , eax
    lea rdi , [string_message] 
    call printf    

    mov eax , 0
    lea rdi , [format_str_in]
    lea rsi , [string]
    call scanf

    xor eax , eax
    lea rdi , [format_str_out]
    lea rsi , [string] 
    call printf

    add rsp , 96
    leave
    ret

