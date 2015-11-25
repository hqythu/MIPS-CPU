START:
	LI		R1	0X80
	SLL		R1	R1	0X00
	LI		R2	0XBF
	SLL		R2	R2	0X00
	MFPC	R7
	ADDIU	R7	0X02
	B		TESTR
	NOP
	LW		R2	R3	0X00
	SW		R1	R3	0X00
	NOP
	LW		R1	R3	0X00
	ADDIU	R3	0X01
	MFPC	R7
	ADDIU	R7	0X02
	B 		TESTW
	NOP
	SW		R2	R3	0X00
	B		START
	NOP


;测试8251是否能写
TESTW:
	LI R6 0x00BF
	SLL R6 R6 0x0000
	ADDIU R6 0x0001
	LW R6 R0 0x0000
	LI R6 0x0001
	AND R0 R6
	BEQZ R0 TESTW     ;BF01&1=0 则等待
	NOP
	JR R7
	NOP

;测试8251是否能读
TESTR:
	LI R6 0x00BF
	SLL R6 R6 0x0000
	ADDIU R6 0x0001
	LW R6 R0 0x0000
	LI R6 0x0002
	AND R0 R6
	BEQZ R0 TESTR   ;BF01&2=0  则等待
	NOP
	JR R7
