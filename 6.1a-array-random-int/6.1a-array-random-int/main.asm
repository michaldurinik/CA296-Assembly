;CA296Exercise-6.1a - Write a program to:
;(a) Input an integer N and obtain an array of N random integers.
;(b) Output the array.

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
array			DWORD	0

message			BYTE	"PLease input length of an array", 0, 10

.code
	main:nop

		invoke readIntegerWithMessage, addr message
		mov num, eax
		shl eax, 2
		
		invoke allocate, eax
		mov array, eax

		invoke fillWithRandomValues, addr array, num, 50
		invoke writeArray, addr array, num


		invoke ExitProcess,0

	end main
