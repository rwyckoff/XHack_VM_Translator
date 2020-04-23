@256
D=A
@SP
M=D

// call Sys.init 0
@Sys.initRETURN1
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
	// push_d
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
	// push_d
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
	// push_d
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
	// push_d
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
	// push_d
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1
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
@5
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1
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
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@ARG
M=D
@SP
D=M
	// push_d
@SP
A=M
M=D
@SP
M=M+1
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@LCL
M=D
@Sys.init
0;JMP
(Sys.initRETURN1)

// function Main.fibonacci 0
(Main.fibonacci)
D=0

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
@TRUE0
D;JLT
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

// if-goto IF_TRUE
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@Main$IF_TRUE
D;JNE

// goto IF_FALSE
@Main$IF_FALSE
0;JMP

// label IF_TRUE
(Main$IF_TRUE)

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

// return
@LCL
D=M
@R14
M=D
@5
D=A
@R14
A=M
A=A-D
D=M
@R13
M=D
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@ARG
A=M
M=D
@ARG
D=M
D=D+1
@SP
M=D
@1
D=A
@R14
A=M
A=A-D
D=M
@THAT
M=D
@2
D=A
@R14
A=M
A=A-D
D=M
@THIS
M=D
@3
D=A
@R14
A=M
A=A-D
D=M
@ARG
M=D
@4
D=A
@R14
A=M
A=A-D
D=M
@LCL
M=D
@R13
A=M
0;JMP

// label IF_FALSE
(Main$IF_FALSE)

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

// call Main.fibonacci 1
@Main.fibonacciRETURN2
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
	// push_d
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
	// push_d
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
	// push_d
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
	// push_d
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
	// push_d
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1
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
@5
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1
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
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@ARG
M=D
@SP
D=M
	// push_d
@SP
A=M
M=D
@SP
M=M+1
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@LCL
M=D
@Main.fibonacci
0;JMP
(Main.fibonacciRETURN2)

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

// call Main.fibonacci 1
@Main.fibonacciRETURN3
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
	// push_d
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
	// push_d
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
	// push_d
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
	// push_d
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
	// push_d
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1
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
@5
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1
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
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@ARG
M=D
@SP
D=M
	// push_d
@SP
A=M
M=D
@SP
M=M+1
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@LCL
M=D
@Main.fibonacci
0;JMP
(Main.fibonacciRETURN3)

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

// return
@LCL
D=M
@R14
M=D
@5
D=A
@R14
A=M
A=A-D
D=M
@R13
M=D
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@ARG
A=M
M=D
@ARG
D=M
D=D+1
@SP
M=D
@1
D=A
@R14
A=M
A=A-D
D=M
@THAT
M=D
@2
D=A
@R14
A=M
A=A-D
D=M
@THIS
M=D
@3
D=A
@R14
A=M
A=A-D
D=M
@ARG
M=D
@4
D=A
@R14
A=M
A=A-D
D=M
@LCL
M=D
@R13
A=M
0;JMP

// function Sys.init 0
(Sys.init)
D=0

// push constant 4
@4
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// call Main.fibonacci 1
@Main.fibonacciRETURN4
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
	// push_d
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
	// push_d
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
	// push_d
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
	// push_d
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
	// push_d
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1
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
@5
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1
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
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@ARG
M=D
@SP
D=M
	// push_d
@SP
A=M
M=D
@SP
M=M+1
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@LCL
M=D
@Main.fibonacci
0;JMP
(Main.fibonacciRETURN4)

// label WHILE
(Sys$WHILE)

// goto WHILE
@Sys$WHILE
0;JMP
