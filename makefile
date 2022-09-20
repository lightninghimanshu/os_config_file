all: 
	yasm trilok.s -f elf64 -o trilok.o
	gcc -no-pie trilok.o