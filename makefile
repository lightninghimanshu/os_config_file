all: 
	yasm himanshu_21256.s -f elf64 -o himanshu_21256.o
	gcc -no-pie himanshu_21256.o