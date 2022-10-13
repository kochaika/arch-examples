.text
.globl _start
_start:
    // put arguments to stack
	mov $10, %ax
	mov $20, %bx
	push %rbx
	push %rax
	
	call sum

    // return value in eax
    // move from stack
	pop %rbx 
	pop %rbx

    // exit(0)
	mov $1, %eax
	mov $0, %ebx
	int $0x80

sum:
    // prologue
	push	%rbp
	mov	%rsp, %rbp
    sub	$4, %rsp
    //

    mov	16(%rbp), %edx # a
	mov 24(%rbp), %eax # b
    add %edx, %eax
    mov	%eax, -4(%rbp) # "auto" variable

    mov -4(%rbp), %eax
    // epilogue
	add		$4, %rsp
	pop		%rbp
	ret
    //



