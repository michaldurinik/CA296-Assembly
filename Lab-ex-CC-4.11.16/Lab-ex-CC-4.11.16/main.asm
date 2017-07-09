;from top left to bottom right diagonal, switch off leds 1by1, 5-9seconds

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
x				DWORD	31
y				DWORD	0

.code
	main:nop

			invoke setPattern, 1
l1:			cmp x, 0
			jl finish

			invoke readRow, y
			mov ecx, x
			mov ebx, 1
			shl ebx, CL
			not ebx
			and eax, ebx

			invoke writeRow, y, eax
			invoke Sleep, 200
			inc y
			dec x
			jmp l1

finish:
		invoke ExitProcess,0

	end main
