all: hello stack call_libc numberEcho
	
hello: hello.S
	as -g hello.S -o hello.o
	ld hello.o -o hello

stack: stack.S
	as -g stack.S -o stack.o
	ld stack.o -o stack

call_libc: call_libc.S
	as --32 -g call_libc.S -o call_libc.o
	ld -m elf_i386 -dynamic-linker /lib/ld-linux.so.2 -lc call_libc.o -o call_libc

numberEcho: numberEcho.S
	as -g numberEcho.S -o numberEcho.o
	ld numberEcho.o -o numberEcho

clean:
	rm -f *.o
	rm -f hello
	rm -f stack
	rm -f call_libc
	rm -f numberEcho
