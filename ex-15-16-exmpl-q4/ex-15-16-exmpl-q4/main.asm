;input N for pattern and invert all LEDs in pattern

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
rows		DWORD	0

.code
	main:nop
		
		invoke readInteger
		invoke setPattern, eax

l1:		cmp rows, 32
		je finish

		invoke readRow, rows
		not eax							;inverts all bits
		invoke writeRow, rows, eax
		inc rows
		jmp l1

finish:
		invoke ExitProcess,0

	end main
