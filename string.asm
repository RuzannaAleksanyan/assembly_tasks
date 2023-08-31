; Enter one character string and one character. 
; Replace the first lowercase letter in the string with the entered character 
; and output the resulting string.

model small
.stack 256
.data

a db 10,11 dup(?)

.code
entrr proc
		push ax dx
		mov ah,2
		mov dl,10
		int 21h
		mov dl,13
		int 21h
		pop dx ax
		ret
entrr endp

start:	mov ax,@data
		mov ds,ax

		mov ah,10
		lea dx,a
		int 21h

		call entrr

		mov ah,1
		int 21h

		call entrr

		xor cx,cx
		mov cl,a[1]
		mov di,cx
		mov si,2

circle:	cmp a[si],'a'
		jb next
		cmp a[si],'z'
		ja next
		mov a[si],al
		jmp xx
next:	inc si
		loop circle
xx:		add di,2
		mov a[di],'$'
		mov ah,9
		lea dx,a[2]
		int 21h
		mov ax,4c00h
		int 21h
end start
