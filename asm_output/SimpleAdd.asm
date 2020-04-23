@256
D=A
@SP
M=D

// push constant 7
@7
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// push constant 8
@8
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
