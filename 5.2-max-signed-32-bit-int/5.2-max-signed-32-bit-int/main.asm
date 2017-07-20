;CA296Exercise-5.2 - Write a program that will determine the largest,
;signed 32-bit integer n whose factorial can be computed correctly in 32 bits.
;Your program should output both n and n!.

.586
.model flat,stdcall
.stack 4096
option casemap:none

include     p:\masm32\include\windows.inc
include     p:\masm32\include\kernel32.inc
include		p:\masm32\include\user32.inc
include		p:\masm32\include\msvcrt.inc
include		p:\masm32\include\ca296.inc

includelib p:\masm32\lib\ca296.lib
includelib kernel32.lib
includelib user32.lib
includelib msvcrt.lib



.data
factorial				DWORD	+1	
number					DWORD	+2
message					BYTE	"%d! = %d", 10, 0

.code
	main:nop

		mov eax, number		 ;eax = number
		xor edx, edx		;edx = 0


l1:		imul factorial		;eax = eax * factorial
		
		cmp edx, 0
		jne finish
		mov factorial, eax	;factorial = eax
		inc number
		mov eax, number
		jmp l1

finish:
		dec number
		invoke crt_printf, addr message, number, factorial
		invoke ExitProcess,0

	end main
