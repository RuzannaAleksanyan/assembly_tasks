.model tiny
.code
.386
org 100h
begin: 	
	fld1				; 1
	fld	x				; x, 1	;
	Fmul	x			; x*x, 1
	fadd st(0),st(1)	; x*x+1,1
	FYL2X				; log2(x*x+1)
	FLDL2T			; log2(10), log2(x*x+1)  
	fdiv				; lg(x*x+1)	      ; log2(x) / log2(10)=lg(x)
	fmul	a			; 3.4*lg(x*x+1)
	fld	x				; x, 3.4*lg(x*x+1)
	fld1				; 1, x, 3.4*lg(x*x+1)
	fadd				; x+1, 3.4*lg(x*x+1)
	FPTAN				; 1, tg(x+1), 3.4*lg(x*x+1)
	fstp	mek		; tg(x+1), 3.4*lg(x*x+1)
	fsub				; 3.4*lg(x*x+1) - tg(x+1)
	fstp	pat	
	ret

x	dq 	1.0
a	dq	3.4
mek	dq	?
pat	dq	?
end begin
