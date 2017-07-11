;sum of smallest factors/divisors of all respective numbers from 2 to N

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
in_msg				BYTE	"Please input number bigger or equal to 2", 0, 10
max_num				DWORD	0	
counter				DWORD	2
factor				DWORD	2
total				DWORD	0

.code
	main:nop

			invoke readIntegerWithMessage, addr in_msg
			mov max_num, eax
			

l1:			mov eax, counter		;counter in eax, it is number from 2 to maximum number
			cmp eax, max_num
			jg finish
			
l2:			cmp eax, factor			;if counter and its factor are the same, it it's only factor
			je div_by_2

			mov ebx, factor			;factor/divisor in ebx
			xor edx, edx			;zeroing edx
			div ebx					;div = counter(eax) / factor(ebx)
			
			cmp edx, 0				;if edx is zero, no reminder after division
			je div_by_2

			inc factor				;else try higher factor
			mov eax, counter		;putting back counter to eax
			jmp l2

div_by_2:	mov ecx, factor
			add total, ecx			;incrementing total by value of factor
			inc counter				;counter += 1
			mov factor, 2			;resetting factor back to 2
			jmp l1

finish:
			invoke writeInteger, total
			invoke ExitProcess,0

	end main
