section	.text
   global _start        ;must be declared for using gcc

_start:	                ;tell linker entry point
   mov	ecx, len
   mov	esi, s1
   mov	edi, s2
   cld                  ;clear direction flag, make operation from left to right
   rep	movsb           ;unconditional repeat

   mov	edx,20	        ;message length
   mov	ecx,s2	        ;message to write
   mov	ebx,1	        ;file descriptor (stdout)
   mov	eax,4	        ;system call number (sys_write)
   int	0x80	        ;call kernel

   mov	eax,1	        ;system call number (sys_exit)
   int	0x80	        ;call kernel

section .data
s1 db 'Hello, world!',0 ;string 1
len equ $-s1

section	 .bss
s2 resb	20              ;destination