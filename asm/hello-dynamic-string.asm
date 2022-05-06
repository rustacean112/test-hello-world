;Sauce					https://youtu.be/VQAKkuLL31g
;Man page of write		https://man7.org/linux/man-pages/man2/write.2.html
;Man page of exit		https://man7.org/linux/man-pages/man2/exit.2.html

section .data
	text db "Hello, asm!",10 	; db text       =   "Hello asm\n"       (0xA=10=\n)
	lenoftext equ $-text		; lenoftext     =   len(text) 			len() = $-)

section .text
	global _start				; Linker needs it to link "_start"

_start:
	mov rax, 1					; 1  		    =	__NR_write 			(write requires [int fd, const void *buf, size_t count])
	mov rdi, 1					; 1  		    =	stdout 				(used as file descriptor (fd))
	mov rsi, text				; text  	    =   const void *buf
	mov rdx, lenoftext			; lenoftext     =	size_t count
	syscall						; call it!   
   
	mov rax, 60					; 60		    =	__NR_exit			(exit requries [int status])
	mov rdi, 0					; 0			    =   int status
	syscall						; call it!
