.data
msg:
    .ascii "Hello world!\n"
// Varilable
//len:
//.long . - msg

    // Macro
    .set len, . - msg

    // Variable
lenght:
    .long 12
//.word
//.long
//.byte


.text
.globl _start
_start:

    // HOWTO change string symbol
    // mov $63, %dl
    mov $'?', %dl
    mov %dl, msg+11

    // HOWTO build loop
    xor %esi, %esi
    mov $2, %esi
loop:    
    cmp $0, %esi
    je end
    call printer
    sub $1, %esi
    jmp loop
end:

    // HOWTO call exit(0)
    // exit(0) // syscal number 1
    mov $1, %eax
    //mov $0, %ebx
    xor %ebx,%ebx
    int $0x80

printer:
    // HOWTO write smth
    // write(FILE* fd, void *buf, int len) // syscal number 4
    // stdout == 1
    // mov $4, %eax
    // mov $1, %ebx
    // mov $msg, %ecx
    // mov $len, %edx
    // int $0x80

    mov $4, %eax
    mov $1, %ebx
    mov $msg, %ecx
    mov $len, %edx
    // HOWTO use variable instead of macro
    //xor %edx, %edx
    //mov lenght, %edx
    int $0x80
    ret
