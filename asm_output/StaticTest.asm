// Bootstrapping ASM file...
@256
D=A
@SP
M=D
// Push from constant
@111
D=A
@SP
A=M
M=D
@SP
M=M+1
// Push from constant
@333
D=A
@SP
A=M
M=D
@SP
M=M+1
// Push from constant
@888
D=A
@SP
A=M
M=D
@SP
M=M+1
// Pop to static
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@StaticTest.8
M=D
// Pop to static
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@StaticTest.3
M=D
// Pop to static
@SP
A=M
A=A-1
D=M
@SP
M=M-1
@StaticTest.1
M=D
// Push from static
@StaticTest.3
D=M
@SP
A=M
M=D
@SP
M=M+1
// Push from static
@StaticTest.1
D=M
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
// Push from static
@StaticTest.8
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
