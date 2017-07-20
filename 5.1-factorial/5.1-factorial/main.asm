;CA296Exercise-5.1 - Write a program that will input an integer n larger or equal to 0 
;and output the factorial n! For example, given n = 4, your program should output:
;4! = 24

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
message				BYTE	"%d! = %d", 10, 0
in_msg				BYTE	"Please input number >= 0", 0, 10
number				DWORD	0
factorial			DWORD	1

.code
	main:nop

l1:		invoke readIntegerWithMessage, addr in_msg
		mov number, eax					;input in number	
		mov ebx, eax					;input in ebx as well for computing
		cmp eax, 0						
		jl l1							;for negative input, takes new input

l2:		cmp eax, 2
		jl finish

		mul factorial					;eax = factorial * eax
		mov factorial, eax				;factorial = eax
		dec ebx
		mov eax, ebx 
		jmp l2

finish:
		invoke crt_printf, addr message, number, factorial
		invoke ExitProcess,0

	end main
