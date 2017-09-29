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
row_num				DWORD	1
row_leds			DWORD	0

.code
	main:nop
		
		invoke readInteger
		invoke setPattern, eax
		invoke readRow, 0
		mov row_leds, eax					;universal row will be in row_leds

l1:		cmp row_num, 32
		je l2

		invoke readRow, row_num
		and row_leds, eax					;we "and" each row, so only 1's in same spot survive
		inc row_num
		jmp l1

l2:		dec row_num							;we dec row first as it's 32 down to 0
		cmp row_num, 0
		jl finish

		invoke writeRow, row_num, row_leds	;write row_leds to every row
		jmp l2

finish:
		invoke ExitProcess,0

	end main
