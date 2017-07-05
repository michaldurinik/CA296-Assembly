; CA296Exercise-3.3 - The printable 7-bit ASCII characters have codes 0x20
; to 0x7f. Write a program that will output these characters 16 per line.
; Hint. Use the routine crt printf.

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
start			DWORD	20h							;first char in hexa
print			BYTE	"%c", 0						;way of printing chars
nl				BYTE	10, 0						;printing newline
total			DWORD	1

.code
	main:nop

new16:		mov ebx, 7fh
			cmp start, ebx							;compare start character with last char
			jg finish								;if its greater program finish

			mov total, 1							;resetting total = 1
next:		cmp total, 16							;checking for 16 chars per line
			jg newline			

			invoke crt_printf, addr print, start	;printing char
			inc start								;start += 1
			inc total								;total += 1
			jmp next								;loop until 16 chars per line

newline:	invoke crt_printf, addr nl				;printing newline
			jmp new16								;start another 16 chars

finish:
			invoke ExitProcess,0

	end main
