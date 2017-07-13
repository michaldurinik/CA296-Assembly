;Write MASM code to input an integer N in the interval [0..5]
;and output the LED pattern for N in which only the LEDs that are part of a vertical line
;from top to bottom in the original pattern are left switched on.
;Hint. You will need two loops, one to determine which columns have all their LEDs switched on 
;and another loop to switch off LEDs as appropriate.

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
row				DWORD	1

.code
	main:nop
		
		invoke readInteger
		invoke setPattern, eax
		invoke readRow, 0
		mov ebx, eax					;universal row will be in ebx

l1:		cmp row, 32
		je l2

		invoke readRow, row
		and ebx, eax					;we and each row, so only 1's in same spot survive
		inc row
		jmp l1

l2:		dec row							;we dec row first as it's 32
		cmp row, 0
		jl finish

		invoke writeRow, row, ebx		;write ebx to every row
		jmp l2

finish:
		invoke ExitProcess,0

	end main
