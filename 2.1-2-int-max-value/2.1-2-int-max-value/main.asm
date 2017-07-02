; CA296Exercise-2.1 — Write a program that will input 2 integers and output
; their maximum value.
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


.code
	main:nop

		invoke readInteger
		mov x, eax
		invoke readInteger

		cmp x, eax
		jg greater
		invoke writeInteger, eax
		jmp finish 
greater:	
		invoke writeInteger, x

finish:	
		invoke ExitProcess,0

	end main