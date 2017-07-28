;CA296Exercise-6.3 - Write a program to:
;(a) Obtain an array of 10 random integers.
;(b) Output the maximum element of the array.

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
array			DWORD	10 dup(0)
i				DWORD	1
max				DWORD	0
msg				BYTE	"Maximum vale = %d", 10, 0

.code
	main:nop

		invoke fillWithRandomValues, addr array, 10, 50
		invoke writeArray, addr array, 10
		mov eax, offset array
		mov ebx, [eax]
		mov max, ebx		;max = array[0]

l1:		cmp i, 10
		je finish

		mov eax, i
		shl eax, 2
		add eax, offset array
		mov ebx, [eax]
		cmp ebx, max
		jg new_max

		inc i
		jmp l1

new_max:
		mov max, ebx
		inc i
		jmp l1

finish:
		invoke crt_printf, addr msg, max
		invoke ExitProcess,0

	end main
