.model small
.stack
.data

arr  db 1,45,89,69,47
key  db 4

message_yes db 10,13,'Yes',10,13,'$'
message_no  db 10,13,'No', 10,13,'$'

.code

start:
		mov ax,@data
		mov ds,ax

		call proc1

		mov ax,4c00h
		int 21h

proc1 proc
		push di cx si bx
		xor di,di
		xor si,si
		xor bx,bx
		mov bl,key
		mov cx,5

for1:	cmp bl,arr[si]
		jne no
		inc di	
no:		inc si
		loop for1
		call proc2
		
		pop bx si cx di 
		ret
proc1 endp

proc2 proc
	
		cmp di,0
		je no2
		
		mov ah,9
		lea dx,message_yes
		int 21h

		jmp a1	

no2: 	mov ah,9
		lea dx,message_no
		int 21h		

a1:
		ret
proc2   endp

end start
