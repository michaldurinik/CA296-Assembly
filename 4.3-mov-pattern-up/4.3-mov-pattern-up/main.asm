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
clear			DWORD	0
count			DWORD	0
last			DWORD	0
curr			DWORD	1
no_rows			DWORD	32

.code
	main:nop
		invoke readInteger
		invoke setPattern, eax
		

l1:		mov curr, 1
		mov last, 0
		dec no_rows
		cmp count, 32
		je finish


		
		invoke writeRow, 0, clear
l2:		mov eax, no_rows
		cmp curr, eax
		je l1
		invoke readRow, curr
		invoke writeRow, curr, eax
		inc count
		inc last
		inc curr
		invoke Sleep, 500
		jmp l2
finish:
		invoke ExitProcess,0

	end main
