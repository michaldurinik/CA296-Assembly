;CA296Exercise-6.4 Write a program to:
;(a) Obtain an array of 10 random integers.
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
array				DWORD	10 dup(?)
max_p				DWORD	0				;index of highest element
swap_p				DWORD	0				;index of element to swap with highest

;little endian, big endian thingy, resulting array is swapped around
;that's why searching for max value instead  of min value

.code
	main:nop
		
		invoke fillWithRandomValues, addr array, 10, 50
		invoke writeArray, addr array, 10
		
		mov esi, offset array		;esi array position in memory
		xor ecx, ecx				;index of an array
		xor eax, eax				;eax = max(array)

start:	cmp swap_p, 10
		je finish

		mov eax, [esi + 4 * ecx]


				l10:	cmp ecx, 10					;index of biggest element
						je swap

						cmp eax, [esi + 4 * ecx]
						jg biggest

						inc ecx
						jmp l10

				biggest:
						mov eax, [esi + 4 * ecx]
						mov max_p, ecx
						inc ecx
						jmp l10

				swap:
						mov ecx, swap_p				;ecx = position of element to swap
						mov ebx, [esi + 4 * ecx]	;ebx = number to swap with smallest				
						mov [esi + 4 * ecx], eax	;moving smallest to position

						mov ecx, max_p				;ecx = position of biggest element
						mov [esi + 4 * ecx], ebx	;swapping number with smallest

						inc swap_p
						mov ecx, swap_p
						mov max_p, ecx
						jmp start

finish:
		invoke writeArray, addr array, 10
		invoke ExitProcess,0

	end main