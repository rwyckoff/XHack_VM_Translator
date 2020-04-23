@256
D=A
@SP
M=D

// push constant 17
@17
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// push constant 17
@17
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// eq
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@R14
M=D
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@R14
D=D-M
@TRUE0
D;JEQ
D=0
@END0
0;JMP
(TRUE0)
D=-1
(END0)
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// push constant 17
@17
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// push constant 16
@16
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// eq
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@R14
M=D
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@R14
D=D-M
@TRUE1
D;JEQ
D=0
@END1
0;JMP
(TRUE1)
D=-1
(END1)
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// push constant 16
@16
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// push constant 17
@17
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// eq
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@R14
M=D
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@R14
D=D-M
@TRUE2
D;JEQ
D=0
@END2
0;JMP
(TRUE2)
D=-1
(END2)
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// push constant 892
@892
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// push constant 891
@891
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// lt
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@R14
M=D
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@R14
D=D-M
@TRUE3
D;JLT
D=0
@END3
0;JMP
(TRUE3)
D=-1
(END3)
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// push constant 891
@891
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// push constant 892
@892
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// lt
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@R14
M=D
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@R14
D=D-M
@TRUE4
D;JLT
D=0
@END4
0;JMP
(TRUE4)
D=-1
(END4)
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// push constant 891
@891
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// push constant 891
@891
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// lt
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@R14
M=D
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@R14
D=D-M
@TRUE5
D;JLT
D=0
@END5
0;JMP
(TRUE5)
D=-1
(END5)
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// push constant 32767
@32767
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// push constant 32766
@32766
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// gt
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@R14
M=D
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@R14
D=D-M
@TRUE6
D;JGT
D=0
@END6
0;JMP
(TRUE6)
D=-1
(END6)
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// push constant 32766
@32766
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// push constant 32767
@32767
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// gt
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@R14
M=D
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@R14
D=D-M
@TRUE7
D;JGT
D=0
@END7
0;JMP
(TRUE7)
D=-1
(END7)
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// push constant 32766
@32766
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// push constant 32766
@32766
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// gt
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@R14
M=D
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@R14
D=D-M
@TRUE8
D;JGT
D=0
@END8
0;JMP
(TRUE8)
D=-1
(END8)
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// push constant 57
@57
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// push constant 31
@31
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// push constant 53
@53
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// add
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@R14
M=D
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@R14
D=D+M
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// push constant 112
@112
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// sub
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@R14
M=D
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@R14
D=D-M
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// neg
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
D=-D
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// and
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@R14
M=D
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@R14
D=D&M
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// push constant 82
@82
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// or
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@R14
M=D
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@R14
D=D|M
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// not
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
D=!D
	// push_d
@SP
A=M
M=D
@SP
M=M+1
