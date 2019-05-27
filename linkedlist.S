.globl insert
insert: // parameters x0: value, x1:head pointer
	LDUR X3, [X1
]	ADD X2, X1, #0
	CBZ X3, put

	B while 

while:  SUB X30, X30, X3
		B.EQ put  
		LDUR X3 [X2,#4]
		ADD X2, X2, #8
		B while

put: STUR X0, [X2]
	 BR X30

.globl delete
delete: // parameters x0:value, x1:head pointer
	ADD X2, X1, X30
	ADD X3, X1, X30
	LDUR X9, [X2]
	SUB X30, X30, X9
	B.EQ arrange
	B next_ptr

next_ptr:  LDUR X9, [X2]
		SUB X30, X0, X9
		B.EQ arrange
		ADD X3, X2, #0
		LDUR X2, [X2, 8]
		B next_ptr
arrange: LDUR X11, [X2,#4] // next element addr, make it to next pointers value 
		 LDUR X10, [X3, #4] // previous elm next pointer
		 ADD X10, X30, X11
		 STUR X30 [X2]
		 STUR X30 [X2, #4]
		 BR X30


