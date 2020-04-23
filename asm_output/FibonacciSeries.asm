@256
D=A
@SP
M=D

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

// push constant 0
@0
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// pop that 0
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

// push constant 1
@1
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// pop that 1
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

// push constant 2
@2
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

// label MAIN_LOOP_START
(FibonacciSeries$MAIN_LOOP_START)

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

// if-goto COMPUTE_ELEMENT
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@FibonacciSeries$COMPUTE_ELEMENT
D;JNE

// goto END_PROGRAM
@FibonacciSeries$END_PROGRAM
0;JMP

// label COMPUTE_ELEMENT
(FibonacciSeries$COMPUTE_ELEMENT)

// push that 0
@0
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

// push that 1
@1
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

// push pointer 1
@4
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

// goto MAIN_LOOP_START
@FibonacciSeries$MAIN_LOOP_START
0;JMP

// label END_PROGRAM
(FibonacciSeries$END_PROGRAM)
