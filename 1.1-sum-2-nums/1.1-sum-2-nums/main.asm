; 1.1
; Write a program that will input 2 integers and output
; their sum.

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
sum			DWORD	0


.code
	main:nop

		invoke readInteger
		add sum,eax
		invoke readInteger
		add sum,eax
		invoke writeInteger,sum

		invoke ExitProcess,0

	end main