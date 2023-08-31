.model small
.stack
.data

.code

start:
	mov ax,@data
	mov ds,ax

	mov bx,0100 1010 1001 0000b
	call proc13
	

	mov ax,4c00h
	int 21h	

proc13 proc
	push ax

	mov ax,0000 0000 0001 0000b
 	xor bx,ax

	pop ax
	ret
proc13 endp

end start
