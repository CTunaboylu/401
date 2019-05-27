
.globl hash
hash: //
	// input: x0=dividend, x1=divisor
	SDIV X2, X0, X1
	MSUB X3, X2, X1, X0
	// result: x2=quotient, x3=remainder
.globl insert_int
insert_int: //location = (X3)hash(element) + i**2, args:{ int:(item:X0, hash_table starting address: X7)
	SUB SP, SP, #1
	STUR X30, [SP, #0]
	
	BL hash
	ADD X5,X3, XZR
	BL while // if there is a collision until it is handled, if cannot handle raise an error
	
	ADD X0, X5, XZR

	// get original X30 and shrink stack
	LDUR X30 [SP,#0]
	ADD SP, SP, #1
	
	BR X30

while:	//CHECK FOR COLLISION - what if we get stuck with the  same pattern over and over again?
	ADD X7, X7, X5
	LDUR X2, [X7, #0 ]
	// X6 data in location:for collision check we check the validity of the data: we assume that 0 is for empty slot value
	CBNZ X2, resolve // if X2 != 0 it means occupied -> collision 
	BR X30

resolve: // we need to know iteration count Gonnet and Baeza-Yates compare several hashing strategies; their results suggest that quadratic probing is the fastest method.
	MUL X10, X4,X4
	ADD X5,X3,X10
	ADD X6, X6, #1
	SUB XZR,X5,X1
	B.LT while   
	SDIV X10, X5, X1
	MSUB X5, X10, X1, X5
	B while

.globl delete
delete: B hash
		ADD X2, X7, #0
		ADD X7, X7, X3
		ADD X10, X0, #1
		LDUR X0, [X7]
		STUR X10, [X7] // delete we understand that the slot is empty if we see that the hash of the block is not appropriate
		BR X30
