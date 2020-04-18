// Bootstrapping ASM file...
@256
D=A
@SP
M=D
// Push from constant
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// Pop to local
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
(BasicLoop$LOOP_START)
// Push from argument
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
@SP
A=M
M=D
@SP
M=M+1
// Push from local
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
@SP
A=M
M=D
@SP
M=M+1
// add
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@R14
M=D
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@R14
D=D+M
@SP
A=M
M=D
@SP
M=M+1
// Pop to local
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
// Push from argument
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
@SP
A=M
M=D
@SP
M=M+1
// Push from constant
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// sub
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@R14
M=D
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@R14
D=D-M
@SP
A=M
M=D
@SP
M=M+1
// Pop to argument
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
// Push from argument
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
@SP
A=M
M=D
@SP
M=M+1
// if-goto
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@BasicLoop$LOOP_START
D;JNE
// Push from local
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
@SP
A=M
M=D
@SP
M=M+1
