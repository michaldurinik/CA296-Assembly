; CA296Exercise-1.2 — Write a program to input 2 integers and output their
; sum in the form (for example):
; 23 + 45 = 68
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


;
; Data & Code
;

.data
x			DWORD	0
y			DWORD	0
sum			DWORD	0
message		BYTE	"%d + %d = %d", 10, 0


.code
	main:nop

		invoke readInteger
		add x, eax
		add sum, eax
		invoke readInteger
		add y, eax
		add sum, eax
		invoke crt_printf, addr message, x, y, sum

		invoke ExitProcess,0

	end main