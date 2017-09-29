;CA296Exercise-6.4a Write a program to:
;(a) Input an integer N and obtain an array of N random integers.
;(b) Output the elements of the array in ascending order.

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
num				DWORD	?
max_p			DWORD	0
swap_p			DWORD	0
array			DWORD	?		;array must be the last declared


.code
	main:nop

		invoke readInteger
		mov num, eax
		shl eax, 2
		invoke allocate, eax
		mov array, eax

		invoke fillWithRandomValues, addr array, num, 50
		invoke writeArray, addr array, num

		mov esi, offset array
		xor ecx, ecx

iter:
		cmp ecx, num
		je finish
		mov eax, [esi + 4 * ecx]	;eax = max

				l1:		cmp ecx, num
						je swap

						cmp eax, [esi + 4 * ecx]
						jg new_max

						inc ecx
						jmp l1

				new_max:
						mov eax, [esi + 4 * ecx]
						mov max_p, ecx
						inc ecx
						jmp l1

				swap:
						mov ecx, swap_p
						mov ebx, [esi + 4 * ecx]
						mov [esi + 4 * ecx], eax

						mov ecx, max_p
						mov [esi + 4 * ecx], ebx

						inc swap_p
						mov ecx, swap_p
						mov max_p, ecx
						jmp iter
		
finish:
		invoke writeArray, addr array, num
		invoke ExitProcess,0

	end main
