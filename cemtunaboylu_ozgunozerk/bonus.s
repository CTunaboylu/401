// Bonus part
.globl try_mem  
try_mem: // record an element get the address to X0 loop till you get to it again
	LDUR X1, [X0]
	ADD X3, X31, X31
	ADD X2, X31, X3 // counter
	
	B while

while:  MUL X3, X2, #8
		ADD X2, X2, #1
		LDUR X9, [X1, X3]
		CMP X1, X9
		B.EQ exit

exit: 	ADD, X0, X2, X31 
		BR X30