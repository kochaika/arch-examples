# arch-examples
## Commands
Compilation: `as hello.S -o hello.o`  
Linking: `ld hello.o -o hello`  
Look into binary file: `hexdump -n 400 -C hello.o`

Linking Libc:
```
as --32 -g call_libc.S -o call_libc.o
ld -m elf_i386 -dynamic-linker /lib/ld-linux.so.2 -lc call_libc.o -o call_libc
```
## Links
Syscall table: https://faculty.nps.edu/cseagle/assembly/sys_call.html  
GNU assembly syntax: https://en.wikibooks.org/wiki/X86_Assembly  
Branches: https://en.wikipedia.org/wiki/Branch_(computer_science)

## GDB hints
`tui enable`  
`layout regs`
```
break
list
run
step
stepi
```

## Install
`sudo apt-get install binutils build-essential gdb bsdmainutils`

### Preflight checklist
```
as --version
ld --version
gdb --version
```
