;input N for pattern, count LEDs which are on, we need 2 loops, nested

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
in_msg			BYTE	"Please input pattern", 0, 10
total			DWORD	0
count			DWORD	0
row_c			DWORD	0

.code
	main:nop

			invoke readIntegerWithMessage, addr in_msg
			invoke setPattern, eax

l2:			cmp row_c, 31				;row counts, outer loop goes 32 times
			jg finish

			invoke readRow, row_c
l1:			cmp count, 31				;count for each row where we iterate 32times
			jg	l3

			shl eax, 1					;shifting row by 1, if 1 was moved out carry flag is 1, otherwise CF is 0
			adc total, 0				;we add 0 to total + carry flag value. so for every LED on, total is increased by 1
			inc count
			jmp l1

l3:			inc row_c
			mov count, 0				;resetting inner loop counter
			jmp l2

finish:
			invoke writeInteger, total
			invoke ExitProcess,0

	end main
