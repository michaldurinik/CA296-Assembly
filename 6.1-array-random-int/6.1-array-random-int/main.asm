;CA296Exercise-6.1 - Write a program to:
;(a) Obtain an array of 10 random integers.
;(b) Output the array.
;See the example solution for the expected format of the output.

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
address			DWORD	0

.code
	main:nop

		invoke fillWithRandomValues, addr address, 10, 50	;at address 0 create array of size 10, with random numbers -49:49
		invoke writeArray, addr address, 10					;display 10numbers, 11th is len of array

		invoke ExitProcess,0

	end main
