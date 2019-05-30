
	.globl hash
hash: //
	// input: x0=dividend, x1=divisor
	SDIV X2, X0, X1
	MSUB X3, X2, X1, X0
	BR X30
	// result: x2=quotient, x3=remainder
	.globl insert
insert: //location = (X3)hash(element) + i**2, args:{ int:(item:X0, hash_table starting address: X7)
	SUB SP, SP, #8
	STUR X30, [SP, #0]
	
	BL hash
	ADD X5,X3, X31
	ADD X4, X31, X31
	ADD X4, X4, #1
	BL while // if there is a collision until it is handled, if cannot handle raise an error
	
	ADD X0, X5, X31

	// get original X30 and shrink stack
	LDUR X30 [SP,#0]
	ADD SP, SP, #8
	
	BR X30

while:	//CHECK FOR COLLISION - what if we get stuck with the  same pattern over and over again?
	ADD X7, X7, X5
	LDUR X2, [X7, #0 ]
	// X6 data in location:for collision check we check the validity of the data: we assume that 0 is for empty slot value

	CBNZ X2, resolve // if X2 != 0 it means occupied -> collision 
	BR X30

resolve: // we need to know iteration count Gonnet and Baeza-Yates compare several hashing strategies; their results suggest that quadratic probing is the fastest method.
	CMP X4, X1 // compare with trial counter for simplicity
	B.EQ error
	MUL X10, X4,X4
	ADD X4, X4, #1
	ADD X5,X3,X10
	CMP  X5, X1
	B.LS while
	SDIV X10, X5, X1
	MSUB X5, X10, X1, X5
	B while
error:
	ADD X9, X31, X31
	SUB X9, X9, #1 // put minues one when resolution fails
	BR X30 
	.globl delete
delete: 
		SUB SP, SP, #8
		STUR X30, [SP, #0]
		BL hash
		LDUR X0, [X7, X3]
		STUR X31, [X7, X3] // delete we understand that the slot is empty if we see that the hash of the block is not appropriate
		
		// get original X30 and shrink stack
		LDUR X30 [SP,#0]
		ADD SP, SP, #8
		BR X30
