@256
D=A
@SP
M=D

// push constant 10
@10
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// pop local 0
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@R14
M=D
@0
D=A
@LCL
A=M
D=D+A
@R13
M=D
@R14
D=M
@R13
A=M
M=D

// push constant 21
@21
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// push constant 22
@22
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// pop argument 2
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
@ARG
A=M
D=D+A
@R13
M=D
@R14
D=M
@R13
A=M
M=D

// pop argument 1
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@R14
M=D
@1
D=A
@ARG
A=M
D=D+A
@R13
M=D
@R14
D=M
@R13
A=M
M=D

// push constant 36
@36
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// pop this 6
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

// push constant 42
@42
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// push constant 45
@45
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// pop that 5
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@R14
M=D
@5
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

// pop that 2
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

// push constant 510
@510
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// pop temp 6
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@11
M=D

// push local 0
@0
D=A
@LCL
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

// push that 5
@5
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

// push argument 1
@1
D=A
@ARG
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

// push this 6
@6
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

// push this 6
@6
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

// Push temp 6
@11
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
