// Bootstrapping ASM file...
@256
D=A
@SP
M=D
// Push from constant
@7
D=A
@SP
A=M
M=D
@SP
M=M+1
// Push from constant
@8
D=A
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
