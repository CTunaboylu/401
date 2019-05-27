.globl push
push:
	LDUR X5,[X0,#4]
	ADD X5,X5,#4
	STUR X1,[X5]
	ADD X5,X5,#4
	ADD X11,X11,#4
	STUR X5,[X11]
	BR X30