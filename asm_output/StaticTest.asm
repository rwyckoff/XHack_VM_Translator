@256
D=A
@SP
M=D

// push constant 111
@111
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// push constant 333
@333
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// push constant 888
@888
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// pop static 8
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@StaticTest.8
M=D

// pop static 3
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@StaticTest.3
M=D

// pop static 1
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@StaticTest.1
M=D

// push static 3
@StaticTest.3
D=M
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// push static 1
@StaticTest.1
D=M
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

// push static 8
@StaticTest.8
D=M
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
