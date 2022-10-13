.data
msg:
    .ascii "Hello world!\0"
// Variable

.text
.globl _start
_start:


    push $msg
    call puts
    pop %ax
    // HOWTO call exit(0)
    // exit(0) // syscal number 1
    mov $1, %eax
    //mov $0, %ebx
    xor %ebx,%ebx
    int $0x80

