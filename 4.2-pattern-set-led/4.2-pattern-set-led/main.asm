;CA296Exercise-4.2 - Write a program that will allow a user to input an
;initial pattern and the the coordinates of an LED. Your program should then
;blink the selected LED, i.e., it should switch the LED on & off with delays of
;500ms.

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
y			DWORD	0
p			DWORD	0
msg_p		BYTE	"Please input pattern", 0, 10
msg_x		BYTE	"Please input x coordinate", 0, 10
msg_y		BYTE	"Please input y coordinate", 0, 10
switch		DWORD	0

.code
	main:nop

		invoke readIntegerWithMessage, addr msg_p		;input with message format
		mov p, eax
		invoke readIntegerWithMessage, addr msg_x
		mov x, eax
		invoke readIntegerWithMessage, addr msg_y
		mov y, eax

		invoke setPattern, p
l1:		invoke readRow, y
		mov ecx, x
		mov ebx, 1
		shl ebx, CL

		xor eax, ebx									;xor, xor(1)=0, xor(0)=1
		invoke writeRow, y, eax
		invoke Sleep, 500
		jmp l1

		invoke ExitProcess,0

	end main
