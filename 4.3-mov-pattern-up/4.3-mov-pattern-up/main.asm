;CA296Exercise-4.3 - Write a program that will allow a user to input an
;initial pattern. Your program should then display the pattern and move it
;up one line every every 500ms until all the LEDs are off.

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
count			DWORD	32
r_count			DWORD	0
row0			DWORD	0
row1			DWORD	1
in_msg			BYTE	"Please input pattern", 0, 10

.code
	main:nop

		invoke readIntegerWithMessage, addr in_msg		;user inser input, integer is stored in eax register
		invoke setPattern, eax							;set LED pattern from register eax
		
l1:		mov row0, 0						;row0 = 0, (resetting rows and row count to 0)
		mov row1, 1						;row1 = 1, (after whole cycle finishes)
		mov r_count, 0					;r_count = 0, (of patern moving up by 1)

		cmp count, 0					;if count < 0, (when loop repeats 32times, program finish)
		jl finish						;then finish, (jump to finish)
										;else,
		mov eax, count					;eax = count (moving overall counter to register for comparation)
l2:		cmp r_count, eax				;if r_count == eax, (comparing total count with rowcounter)
		je l3							;then,  (jump to l3)
										;else
		invoke readRow, row1			;eax = row1, (read LED row on position row1, store in register eax)
		invoke writeRow, row0, eax		;row0 = eax, (write eax LED row to row0)
		inc row0						;row0 += 1, (incrementing rows positions and row counter in next 2 lines)
		inc row1
		inc r_count
		mov eax, count					;eax = count, (moving overall counter to register for comparation)
		jmp l2							;jump to l2, (l2 is inner loop, moving every line 1by1)

l3:		dec count						;count -= 1, (after moving entire LED field by 1, decrease main counter)
		invoke Sleep, 500				;sleep for 500ms for people to observe change
		jmp l1							;jump to l1, to start another cycle, (l1 is outside or main, loop)

finish:
		invoke ExitProcess,0

	end main
