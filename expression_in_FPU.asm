.model tiny
.code
org 100h
begin: 	mov	cx,4
	fld	x
	fmul	x
	fst	xx 		;  x*x -> xx
	fld	x		;  x, x*x			;   s=x
	fld1			;  1, x,  x*x			;   i=1
	fld	x		;  x, 1, x, x*x  		;   y=x
sum:	fld1			;  1,  x,    1, x, x*x		;  
	faddp	st(2), st	;  x,   2,   x, x*x
	fdiv	st, st(1)	;  x/2!, 2,  x, x*x
	fld1			;  1, x/2!, 2, x, x*x
	faddp	st(2), st	;  x/2!,  3, x, x*x		;   i=2
	fdiv	st, st(1)	;  x/3!, 3,  x, x*x
	Fmul	xx		;  x^3/3!, 3, x, x*x		;   y=(x^(2i-1))/3
	fld	st		;  x^3/3!, x^3/3!, 3, x, x*x
	fabs			;  |x^3/3!|, x^3/3!, 3, x, x*x
	FCOMp	eps		;  x^3/3!, 3, x, x*x		;  |y| < eps
	FSTSW     srf
	mov	ax,srf
	SAHF
	JB	verg
	FADD	st(2), st	;  x^3/3!, 3, x+x^3/3!, x*x 	     ;     s=s+y
;	loop	sum
	jmp	sum 
verg:	FLD	st(2)		;  x+x^3/3!, x^3/3!, 3, x+x^3/3!, x*x ; 
	FSTP	res		;  x^3/3!, 3, x+x^3/3!, x*x ; 
	FSTP	yn		;  3, x+x^3/3!, x*x ; 
	ret

x	dq 	0.9
eps	dq 	0.1
srF	dw	?
xx	dq	?
yn	dq	?		;  y=x^(2n-1)/(2n-1)!
res	dq	?		;  s=Gumar...
end begin
