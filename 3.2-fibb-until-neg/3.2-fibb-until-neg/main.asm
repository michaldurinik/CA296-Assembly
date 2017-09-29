; CA296Exercise-3.2 - Using your solution to 3.1, write a program to read in
; a sequence of non-negative integers and output the corresponding Fibonacci
; number. The sequence should be terminated by a negative value.

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
num				DWORD	0
curr			DWORD	1
prev			DWORD	0
fib_cnt			DWORD	0
fib_msg			BYTE	"fib(%d) = %d", 10, 0

.code
	main:nop

start:	mov curr, 1			;resetting all default values, then taking input
		mov prev, 0
		mov fib_cnt, 0
		invoke readInteger
		mov num, eax
		cmp eax, 0

		jl finish

l1:		cmp eax, fib_cnt
		je print

		mov ebx, curr
		mov eax, prev
		add curr, eax
		mov prev, ebx

		inc fib_cnt
		mov eax, num
		jmp l1

print:	invoke crt_printf, addr fib_msg, num, curr
		jmp start

finish:
		invoke ExitProcess,0

	end main
