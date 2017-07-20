;for selected row, switch off leds 1by1 in selected row, starting from top in 5-9seconds

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
in_msg				BYTE	"Please input number of column", 0, 10
count				DWORD	0
rowp				DWORD	0

.code
	main:nop

		invoke readIntegerWithMessage, addr in_msg
		mov rowp, eax
		mov ebx, eax									;row_num in ebx
		invoke setPattern, 7

l1:		cmp count, 32
		je finish

		invoke readRow, count
		mov ecx, rowp
		mov edx, 1
		shl edx, CL
		not edx
		and eax, edx

		invoke writeRow, count, eax
		inc count
		invoke Sleep, 200
		jmp l1
finish:
		invoke ExitProcess,0

	end main
