;Given a 32-bit value we can swap its upper and lower 16 bits. For example, given
;0000 0001 0010 0011 0100 0101 0110 0111 we can swap its upper and lower 16 bits to get the value
;0100 0101 0110 0111 0000 0001 0010 0011
;Write MASM code to input an integer N in theinterval [0..5]
;and output the LED pattern for N with the upper and lower 16 bits of the value for each row swapped.


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
row			DWORD	0

.code
	main:nop

		invoke readInteger
		invoke setPattern, eax

l1:		cmp row, 32
		je finish

		invoke readRow, row
		mov ebx, eax			;copy eax to ebx
		shl eax, 16				;shift half of eax left
		shr ebx, 16				;shift half of ebx righ
		or eax, ebx				;1's from both registers are kept in resulting eax

		invoke writeRow, row, eax
		inc row
		jmp l1

finish:
		invoke ExitProcess,0

	end main
