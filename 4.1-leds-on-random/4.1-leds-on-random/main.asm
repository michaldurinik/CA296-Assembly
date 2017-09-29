; CA296Exercise-4.1 - Write a program that will start with all LEDs switched
; off and then switch on all the LEDs in some random order.
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
x			DWORD	0
y			DWORD	0


.code
	main:nop

l1:		invoke random, 32			;generate random int 0-31 and store in eax
		mov x, eax					;x coordinate in x
		invoke random, 32
		mov y, eax					;y coordinate in y
		invoke readRow, y			;reading "y" row of LEDs

	    mov ecx, x					;x coord to ecx 
		mov ebx, 1					;1 to ebx
		shl ebx, CL					;CL is 8 bit register of ECX, actual decimal value
									;we shift left from ebx CL-times or(x-times) to get actual led position 
		or eax, ebx					;logical or with 1, 0or1=1, 1or1=1

		invoke writeRow, y, eax		;write back updated row
		invoke Sleep, 10			;sleep for 10ms, #1-20ms looks all same anyway
		jmp l1

		invoke ExitProcess, 0

	end main
