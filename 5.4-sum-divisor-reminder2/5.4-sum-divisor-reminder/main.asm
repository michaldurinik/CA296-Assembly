;CA296Exercise-5.4 - Write a program that will read in two signed, 32-bit
;integers n and r (where n  2 and r > 0) and compute two values:
;(a) A sum of quotients given by x=2(start), x/r, until x= n
;(b) A sum of remainders given by

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
x				DWORD	+2
n				DWORD	+2
r				DWORD	+1
quotients		DWORD	0
reminders		DWORD	0
n_msg			BYTE	"Please input N", 0, 10
r_msg			BYTE	"Please input R", 0, 10
quo_msg			BYTE	"Sum of quotients = %d", 10, 0
rem_msg			BYTE	"Sum of reminders = %d", 10, 0

.code
	main:nop
		
			invoke readIntegerWithMessage, addr n_msg
			mov n, eax
			invoke readIntegerWithMessage, addr r_msg
			mov r, eax

l1:			xor edx, edx
			mov ebx, x
			cmp ebx, n
			jg finish

			mov eax, x
			idiv r
			add quotients, eax
			add reminders, edx
			inc x
			jmp l1

finish:
			invoke crt_printf, addr quo_msg, quotients
			invoke crt_printf, addr rem_msg, reminders			

			invoke ExitProcess,0

	end main