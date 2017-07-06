;CA296Exercise-4.3 - Write a program that will allow a user to input an
;initial pattern. Your program should then display the pattern and move it
;up one line every every 500ms until all the LEDs are off.

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
r_count			DWORD	0
row0			DWORD	0
row1			DWORD	1
msg				BYTE	"Please input pattern", 0, 10

.code
	main:nop

		invoke readIntegerWithMessage, addr msg
		invoke setPattern, eax
		
l1:		mov row0, 0
		mov row1, 1
		mov r_count, 0

		cmp count, 0
		jl finish

		mov eax, count
l2:		cmp r_count, eax
		je l3

		invoke readRow, row1
		invoke writeRow, row0, eax
		inc row0
		inc row1
		inc r_count
		mov eax, count
		jmp l2

l3:		dec count
		invoke Sleep, 500
		jmp l1

finish:
		invoke ExitProcess,0

	end main
