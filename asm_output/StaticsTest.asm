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

// function Class1.set 0
(Class1.set)
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

// pop static 0
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@Class1.0
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

// pop static 1
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@Class1.1
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

// function Class1.get 0
(Class1.get)
D=0

// push static 0
@Class1.0
D=M
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// push static 1
@Class1.1
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

// function Class2.set 0
(Class2.set)
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

// pop static 0
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@Class2.0
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

// pop static 1
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@Class2.1
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

// function Class2.get 0
(Class2.get)
D=0

// push static 0
@Class2.0
D=M
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// push static 1
@Class2.1
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

// push constant 6
@6
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

// call Class1.set 2
@Class1.setRETURN2
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
@2
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
@Class1.set
0;JMP
(Class1.setRETURN2)

// pop temp 0
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@5
M=D

// push constant 23
@23
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// push constant 15
@15
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// call Class2.set 2
@Class2.setRETURN3
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
@2
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
@Class2.set
0;JMP
(Class2.setRETURN3)

// pop temp 0
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@5
M=D

// call Class1.get 0
@Class1.getRETURN4
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
@Class1.get
0;JMP
(Class1.getRETURN4)

// call Class2.get 0
@Class2.getRETURN5
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
@Class2.get
0;JMP
(Class2.getRETURN5)

// label WHILE
(Sys$WHILE)

// goto WHILE
@Sys$WHILE
0;JMP
