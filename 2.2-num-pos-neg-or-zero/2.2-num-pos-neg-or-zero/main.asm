; CA296Exercise-2.2 — Write a program that will read an integer N and depending
; on the value, output one of three messages:
; (a) N is zero
; (b) N is positive
; (c) N is negative
; Note that the letter N should be replaced by the value of N.

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
posi		BYTE	"%d is positive", 10, 0
nega		BYTE	"%d is negative", 10, 0
zero		BYTE	"%d is zero", 10, 0


.code
	main:nop
		invoke version
		invoke readInteger
		mov x, eax
		cmp eax, 0
		jg positive
		cmp eax, 0
		je zeros

		invoke crt_printf, addr nega, x
		jmp finish
zeros:
		invoke crt_printf, addr zero, x
		jmp finish
positive:
		invoke crt_printf, addr posi, x
		jmp finish
finish:
		invoke ExitProcess,0

	end main