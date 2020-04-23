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

// function Sys.init 0
(Sys.init)
D=0

// push constant 4000
@4000
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

// push constant 5000
@5000
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

// call Sys.main 0
@Sys.mainRETURN2
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
@Sys.main
0;JMP
(Sys.mainRETURN2)

// pop temp 1
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@6
M=D

// label LOOP
(Sys$LOOP)

// goto LOOP
@Sys$LOOP
0;JMP

// function Sys.main 5
(Sys.main)
D=0
	// push_d
@SP
A=M
M=D
@SP
M=M+1
	// push_d
@SP
A=M
M=D
@SP
M=M+1
	// push_d
@SP
A=M
M=D
@SP
M=M+1
	// push_d
@SP
A=M
M=D
@SP
M=M+1
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// push constant 4001
@4001
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

// push constant 5001
@5001
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

// push constant 200
@200
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// pop local 1
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

// push constant 40
@40
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// pop local 2
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

// push constant 6
@6
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// pop local 3
	// pop_d
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@R14
M=D
@3
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

// push constant 123
@123
D=A
	// push_d
@SP
A=M
M=D
@SP
M=M+1

// call Sys.add12 1
@Sys.add12RETURN3
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
@Sys.add12
0;JMP
(Sys.add12RETURN3)

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

// push local 1
@1
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

// push local 2
@2
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

// push local 3
@3
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

// push local 4
@4
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

// function Sys.add12 0
(Sys.add12)
D=0

// push constant 4002
@4002
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

// push constant 5002
@5002
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

// push constant 12
@12
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
