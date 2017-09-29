;choose row, then switch the leds off from left to right, 1by1, 5-9sec to finish.

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
in_msg			BYTE	"Please input row to clear", 0, 10
count			DWORD	31
row_num			DWORD	0

.code
	main:nop

		invoke readIntegerWithMessage, addr in_msg
		mov row_num, eax
		invoke setPattern, 1

l1:		invoke readRow, row_num			;row number in row_num
		cmp count, 0
		jl finish

		mov ecx, count					;starting from position coord, x=31, ie. count value
		mov edx, 1						;1 in edx
		shl edx, CL						;move this 1 to position 31, 1000000....
		not edx							;flip binary, 0111111111.....
		and eax, edx					;where is 0and0 = 0, 0and1 = 0 also

		invoke writeRow, row_num, eax	;store modified row back.
		invoke Sleep, 200
		dec count
		jmp l1

finish:
		invoke ExitProcess,0

	end main
