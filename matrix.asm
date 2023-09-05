.model 	small
.data
n	dw	3
m	dw	4

matric	dw	1,2, -5,4
        dw	2,-3,4,0
        dw	1,3,-2,5

.stack	100h

.code
start:	mov	ax, @data
        mov	ds, ax
        mov	di, m
        add	di, di	
        xor	bx, bx
        mov	cx, n	

cycleT:	push	cx
        xor	si, si
        xor	ax, ax
        mov	cx, m
cycleS:	mov	dx,matric[bx][si]	 ; dx=matrix[i][j]
        cmp	dx, 0
        jle	k
        add	ax,dx
k:	    add	si, 2	              ; j++
        loop	cycleS
        call	output
        pop	cx
        add	bx, di	            ; i++
        loop	cycleT
        mov	ah,1
        int	21h
        mov	ah, 4ch
        int	21h
output	proc

        mov	dl, al
        add	dl, '0'
        mov	ah, 2
        int	21h
        mov	dl, ' '
        mov	ah, 2
        int	21h	
        ret
output	endp
end	start
