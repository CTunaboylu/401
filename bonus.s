// Bonus part
.globl try_mem  
try_mem: // record an element get the address to X0 loop till you get to it again
	LDUR X1, [X0]
	
	ADD X2, XZR, #0 // counter
	
	B while

while:  ADD X1, X1, #1
		ADD X2, X2, #1
		LDUR X9, [X1, #0]
		SUB XZR, X0, X9
		B.EQ exit

exit: 	ADD, X0, X2, #0 
		BR X30