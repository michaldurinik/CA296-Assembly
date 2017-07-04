; CA296Exercise-3.1 - Write a program that will input an integer n greater or equalt than 0 and
; output n
; th element of the Fibonacci sequence. Given n = 4, your program
; should output:
; fib(4) = 5
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
prev			DWORD	0
curr			DWORD	1
fib_cnt			DWORD	0
num				DWORD	0
message			BYTE	"no negative inputs", 10, 0
fib_msg			BYTE	"fib(%d) = %d", 10, 0


.code
	main:nop

		invoke readInteger
		cmp eax, 0
		mov num, eax
		jl negati

l1:		cmp eax, fib_cnt
		je finish		;if input is negative finish program

		mov ebx, curr	;temp = curr
		mov eax, prev	
		add curr, eax	;curr = curr + prev
		mov prev, ebx	;prev = curr
		inc fib_cnt
		mov eax, num
		jmp l1

negati:
		invoke crt_printf, addr message
		invoke ExitProcess,0
finish:	
		invoke crt_printf, addr fib_msg, num, curr
		invoke ExitProcess,0

	end main
