global main
extern scanf
extern printf

segment .data
    
    format_int: db "%d", 0
    format_string: db "%s", 0
    output_message db "Output : ",0
    string_input_message db 0ah,"Enter string input : ",0
    integer_input_message db 0ah,"Enter integer input : ",0
    new_line db 0ah,0

segment .bss
    var resb 4

segment .text
    main:
        ;;creating space for local variables
        push rbp
        mov rbp, rsp 
        sub rsp, 16 

        ;;taking integer input
        ;printing input message
        call print_input_int_message
        ;taking input using scanf
        call take_input

        mov eax,0
        ;print output message
        call printing_output
        ;print output
        lea rdi, [format_int] 
        mov rsi, [var] 
        call printf

        ;;printing newline
        call print_newline

        mov eax,0
        ;;taking string as input
        call print_input_string_message
        ;taking input using scanf
        lea rsi, [var] 
        lea rdi, [format_string] 
        call scanf

        mov eax,0
        ;print output
        call printing_output
        ;printing output
        lea rdi, [format_string] 
        lea rsi, [var] 
        call printf
        ;;printing newline
        call print_newline
        ;;removing the local variables
        add rsp, 16
        mov eax, 0 
        leave
        ret

    print_input_int_message : 
        xor eax,eax
        lea rdi, [format_string] 
        lea rsi, [integer_input_message] 
        call printf
        ret

    print_newline : 
        xor eax,eax
        lea rdi, [format_string] 
        lea rsi, [new_line] 
        call printf
        ret

    print_input_string_message : 
        xor eax,eax
        lea rdi, [format_string] 
        lea rsi, [string_input_message] 
        call printf
        ret

    take_input : 
        push rbp
        mov rbp, rsp 
        sub rsp, 16 
        mov eax,0
        lea rsi, [var] 
        lea rdi, [format_int] 
        call scanf
        add rsp, 16
        mov eax, 0 
        leave
        ret

    printing_output : 
        xor eax,eax
        lea rdi, [format_string] 
        lea rsi, [output_message] 
        call printf
        ret
        