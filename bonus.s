// Bonus part 
try_mem: // record an element loop till you get to it again
	ADD X0, XZR, XZR
	SUBI X0, X0, #-1
	STUR X0
	// ... 
	// get the address in X1
	ADDI X1, XZR, #0
	ADDI X2, XZR, #0 // counter
	
	B while

while:  ADDI X1, X1, #1
		ADDI X2, X2, #1
		LDUR X9, [X1, #0]
		SUB XZR, X0, X9
		B.EQ exit

exit: 	ADDI, X0, X2, #0 
		BR LR