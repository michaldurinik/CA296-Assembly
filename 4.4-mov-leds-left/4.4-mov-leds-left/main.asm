;CA296Exercise-4.4 - Write a program that will allow a user to input an
;initial pattern. Your program should then display the pattern and move it
;left one line every every 500ms until all the LEDs are off.

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
count			DWORD	32
in_msg			BYTE	"Please input pattern", 0, 10
row_num			DWORD	0 

.code
	main:nop
		invoke readIntegerWithMessage, addr in_msg
		invoke setPattern, eax
l1:		cmp count, 0
		je finish

		cmp row_num, 32
		je l2

		invoke readRow, row_num
		sal eax, 1							;aritmetic shift left by 1, moves all 1's in binary to left by 1 position
		invoke writeRow, row_num, eax
		inc row_num
		jmp l1

l2:		mov row_num, 0
		invoke Sleep, 500
		dec count
		jmp l1

finish:
		invoke ExitProcess,0

	end main
