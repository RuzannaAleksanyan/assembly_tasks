;   SUM    macros
SUM	macro	r1,num1,num2
	mov	r1,num1
	add	r1,num2
endm

.model 	small

.data
  t1	dw	4
  t2	dw	5
	irpc	s, 56783
	db	s
endm	

.code
start:	mov	ax, @data
	      mov	ds, ax
;	mov	al, 9
	      SUM	ax,5,3
;	SUM	ax,t1,t2
	      mov	ax, t2+2
;   output
  	    mov	dl,al
  	    add	dl,'0'
        mov	ah,2
        int	21h	
        mov	ah,1
        int	21h
        mov	ah, 4ch
        int	21h
end	start
