extern printf , scanf
global main
section .text
main:
    push rbp
    mov rbp , rsp
    sub rsp , 16

    xor eax , eax
    lea rdi , [enter_promt] 
    call printf
    
    mov eax , 0
    lea rdi , [input_int]
    lea rsi , [number]
    call scanf

    xor eax , eax
    lea rdi , [enter_promt] 
    call printf    

    mov eax , 0
    lea rdi , [input_str]
    lea rsi , [string]
    call scanf

    xor eax , eax
    lea rdi , [output_int]
    mov edx , [number] 
    call printf

    xor eax , eax
    lea rdi , [output_str]
    lea rsi , [string] 
    call printf

    add rsp , 16
    leave
    ret


section .data
   enter_promt : db " Enter: ", 0
   input_int : db "%d", 0
   input_str : dd "%s",0
   output_int : db "%d", 0, 10
   output_str : db "%s", 0, 10
   string times 100 db 0
   
section .bss
   number resb 4