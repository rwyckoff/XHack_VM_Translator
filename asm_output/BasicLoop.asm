@256
D=A
@SP
M=D

// push constant 0
@0
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

// label LOOP_START
(BasicLoop$LOOP_START)

// push argument 0
@0
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

// push argument 0
@0
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

// push constant 1
@1
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

// pop argument 0
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

// push argument 0
@0
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

// if-goto LOOP_START
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@BasicLoop$LOOP_START
D;JNE

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
