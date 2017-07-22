;CA296Exercise-5.3 - Consider the function f defined by
;f(n) = 8 * n!
;Write a program that will determine the largest, signed 32-bit integer n such
;that f(n) can be correctly computed in 32 bits. Your program should output
;both n and f(n).

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
factorial			DWORD	+1
prev_f				DWORD	+1
number				DWORD	+2
message				BYTE	"n = %d, f(n) = %d", 10, 0

.code
	main:nop
		
		mov eax, number
		xor edx, edx

l1:		imul factorial
		cmp edx, 0
		jne finish

		mov factorial, eax
		mov eax, 8
		imul factorial
		cmp edx, 0
		jne finish

		mov ebx, factorial
		mov prev_f, ebx
		inc number
		mov eax, number
		jmp l1

finish:
		dec number

		;only displaying factorial ,not factorial x 8 which is 3bil and technically out of 32bit signed value.
		invoke crt_printf, addr message, number, prev_f
		invoke ExitProcess,0

	end main
