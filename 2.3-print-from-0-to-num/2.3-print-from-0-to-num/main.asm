; CA296Exercise-2.3 — Write a program that will input a integer N greater or equal to 0 and
; output the integers 0 to N - 1.
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
n			DWORD	0
x			DWORD	0
err_msg     BYTE	'Input should not be negative', 10, 0


.code
	main:nop

		invoke readInteger
		mov n, eax
		cmp eax, 0
		jl negative
l1:
		cmp eax, x
		jle finish
		invoke writeInteger, x
		inc x
		mov eax, n
		jmp l1

negative:
		invoke crt_printf, addr err_msg
		jmp finish

finish:
		invoke ExitProcess,0

	end main