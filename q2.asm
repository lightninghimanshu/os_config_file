extern printf
extern scanf
global main

section .text
main :
    push msg
    call printf
    ret
section .data

msg :db "Hello world !" , 10 , 0
input: db "%d" , 0
    