@256
D=A
@SP
M=D

// push constant 3030
@3030
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// pop pointer 0
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@3
M=D

// push constant 3040
@3040
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// pop pointer 1
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@4
M=D

// push constant 32
@32
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// pop this 2
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@R14
M=D
@2
D=A
@THIS
A=M
D=D+A
@R13
M=D
@R14
D=M
@R13
A=M
M=D

// push constant 46
@46
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// pop that 6
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@R14
M=D
@6
D=A
@THAT
A=M
D=D+A
@R13
M=D
@R14
D=M
@R13
A=M
M=D

// push pointer 0
@3
D=M
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// push pointer 1
@4
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

// push this 2
@2
D=A
@THIS
A=M
D=D+A
@R13
M=D
@R13
A=M
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

// push that 6
@6
D=A
@THAT
A=M
D=D+A
@R13
M=D
@R13
A=M
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
