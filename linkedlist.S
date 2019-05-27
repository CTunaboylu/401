.globl insert
insert:
	LDR X15, [X0]
	LDUR X16,[X2]
	LDR X4,[X0]
	STR X4,[X16,#4]
	STR X1,[X16]
	STR X16,[X0]
	LDUR X9,[X2]
	ADD X9,X9,#8
	STUR X9, [X2]
	BR X30


.globl delete
delete:
	LDR X15, [X0]
	LDUR X4,[X15]
next:
	MOV X4,X15
	LDUR X15,[X15,#4]
	LDUR X8, [X15]
	CMP X8,X1
	B.NE next
	B ret
ret:
	LDUR X8,[X15,#4]
	STUR X8,[X4,#4]
	BR X30
