;Given the definitions
;.data
;row DWORD ?
;start DWORD ?
;finish DWORD ?
;assuming that the values of row, start and finish are each in the interval [0..31], write
;MASM code to switch off the LEDs in the interval [start..finish] on row row of the
;displayed LED pattern.

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
rowp			DWORD 13
start			DWORD 5
finish			DWORD 8

.code
	main:nop
		
		invoke setPattern, 1
		mov ecx, start

l1:		cmp ecx, finish
		jg ending

		invoke readRow, rowp		;row in eax
		mov ecx, start
		mov ebx, 1
		shl ebx, CL					;shift by CL=start
		not ebx						;flip binary, so all 1's and only one 0
		and eax, ebx				;will switch off single led

		invoke writeRow, rowp, eax
		inc start
		mov ecx, start
		jmp l1

ending:
		invoke ExitProcess,0

	end main
