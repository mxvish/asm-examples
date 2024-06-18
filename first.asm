%macro printf 2
   mov   eax, 4     ;system call number (4=sys_write)
   mov   ebx, 1     ;file descriptor (stdout)
   mov   ecx, %1    ;message to write
   mov   edx, %2    ;message length
   int	0x80        ;call kernel
%endmacro

;;reference https://www.tutorialspoint.com/assembly_programming/assembly_quick_guide.htm
;; https://cs.lmu.edu/~ray/notes/nasmtutorial/
;; http://6.s081.scripts.mit.edu/sp18/x86-64-architecture-guide.html

;;=======================================================
;section	.text
;   global _start     ;must be declared for linker (ld)
;
;_start:	            ;tells linker entry point
;   mov   ecx, [num1]
;   cmp   ecx, [num2]
;   jg    check_third_num
;   mov   ecx, [num2]
;
;check_third_num:
;
;   cmp   ecx, [num3]
;   jg    _exit
;   mov   ecx, [num3]
;
;_exit:
;
;   mov   [largest], ecx
;   printf msg, len
;   printf largest, 2
;
;   mov	eax,1       ;system call number (sys_exit)
;   int 0x80
;
;section	.data
;   msg db "The largest digit is: ", 0xa
;   len equ $- msg
;   num1 dd '47'
;   num2 dd '22'
;   num3 dd '31'
;
;segment .bss
;   largest resb 2

;section	.text
;   global _start        
;	
;_start:	            
;   mov ecx,10
;   mov eax, '1'
;	
;l1:
;   push ecx
;   mov [num], eax
;   printf num, 1
;	
;   mov eax, [num]
;   inc eax
;   pop ecx
;   loop l1
;	
;   mov eax,1             ;system call number (sys_exit)
;   int 0x80              ;call kernel
;section	.bss
;num resb 1

section	.text
   global _start        
	
_start:	            
    xor edx, edx
    mov eax, 20 
    ;mov eax, 23 
    mov ebx, 12
    div ebx
    add edx,'0'
    
    mov [num], edx
    printf num, 2

    mov eax, 1
    int 0x80
    
segment .bss
num resd 2
