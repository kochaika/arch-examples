.data
buff: .ascii "___________________________\0"
digits:
	.ascii "0123456789-"
	.set digitsLen, .-digits
input:
    .word 0

.text
.globl _start
_start:
    call readnumber
    mov input, %eax
    call printNumber
   
    mov $1, %eax
    xor %ebx,%ebx
    int $0x80

// READ NUMBER FUNCTION
readnumber:
	## READ ##
	movl $3, %eax 		#sys_read (number 3)
	movl $0, %ebx		#stdin (number 0)
	movl $buff, %ecx 	#starting point
	movl $10, %edx	#max input
	int $0x80		#call
    
    mov $0, %esi
loopread:
    inc %esi
    mov $buff, %eax
    lea (%eax, %esi, 1), %ecx
    movb (%ecx), %dl
    cmpb $'\n', %dl
    jne loopread

    mov $1, %ebx
loopdecode:
    dec %esi
    lea (%eax, %esi, 1), %ecx
    xor %edx, %edx
    movb (%ecx), %dl
    cmp $'-', %dl
    je negdecode
    sub $'0', %dl
    imul %ebx, %edx
    mov input, %ecx
    add %edx, %ecx
    mov %ecx, input
    imul $10, %ebx
    cmp $0, %esi
    jne loopdecode
    jmp decodeend
negdecode:
    mov input, %ecx
    imul $-1, %ecx
    mov %ecx, input
decodeend:
    ret
// READ NUMBER FUNCTION

// PRINT NUMBER FUNCTION
printNumber:
	cmpl $0, %eax
	jge numbs
	neg %eax
	push %rax
	mov $digits+10, %ecx
	movl $4, %eax	
	movl $1, %ebx
	movl $1, %edx
	int  $0x80
	pop %rax
numbs:
	xorl %esi, %esi
loop:
	movl $0, %edx
	movl $10, %ebx
	divl %ebx
	push %rdx
	incl %esi
	cmpl $0, %eax
	jz   next
	jmp loop
	
next:
	cmpl $0, %esi
	jz   fin
	decl %esi
	movl $4, %eax
	pop %rcx
	add $digits, %ecx
	movl $1, %ebx
	movl $1, %edx
	int  $0x80
	jmp  next
fin:
	ret
// PRINT NUMBER FUNCTION    
