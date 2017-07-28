;CA296Exercise-6.2 - Write a program to:
;(a) Obtain an array of 10 random integers.
;(b) Output the sum of the elements of the array.

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

sum		DWORD		0
array	DWORD		10 dup(0)
i		DWORD		0
msg		BYTE		"Total = %d", 10, 0

.code
    main:nop

		invoke fillWithRandomValues, Addr array, 10, 10
		invoke writeArray,addr array, 10		
l1:
		cmp i, 10
		je	finish
			
		mov eax, i
		shl eax, 2				;multiply by 4
		add eax, offset array	;address from start of array
		mov ebx, [eax]			;value at address to ebx	
		add sum, ebx

		inc i
		jmp l1

finish:
		invoke crt_printf, addr msg, sum
		invoke ExitProcess,0

	end main