;CA296Exercise-4.5 - Write a program that will allow a user to input an
;initial pattern. Your program should then display the pattern and move it
;up & left one line every every 500ms until all the LEDs are off.

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
row_no			DWORD	1
prev_row		DWORD	0
in_msg			BYTE	"Please input pattern", 0, 10

.code
	main:nop

			invoke readIntegerWithMessage, addr in_msg
			invoke setPattern, eax

outer:		mov ecx, count			;outer loop count in ecx
			cmp ecx, 0
			jl finish

inner:		cmp ecx, row_no
			je l3

			mov ebx, row_no			;row here we copy led info is in: ebx = row_no -1
			dec ebx
			mov prev_row, ebx		;prev_row = row_no -1
			invoke readRow, row_no
			sal eax, 1				;shift leds to left by 1
			invoke writeRow, prev_row, eax
			inc row_no
			jmp inner

l3:			dec count
			mov row_no, 1			;reseting inner loop counter
			invoke Sleep, 500
			jmp outer

finish:
		invoke ExitProcess,0

	end main
