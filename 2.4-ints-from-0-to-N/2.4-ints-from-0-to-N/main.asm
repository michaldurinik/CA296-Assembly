; CA296Exercise-2.4 — Write a program that will repeatedly input a integer
; N larger or equal to 0 and output the integers 0 to N - 1. Your program should terminate
; when the user types in a negative value.

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
n			DWORD	0

.code
	main:nop

l1:		mov x, 0
		invoke readInteger
		mov n, eax		
		cmp eax, 0
		jl finish

l2:		cmp x, eax
		je l1
		
		invoke writeInteger, x
		inc x
		mov eax, n
		jmp l2 		

finish:	
		invoke ExitProcess,0

	end main
