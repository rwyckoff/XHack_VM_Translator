@256
D=A
@SP
M=D
(SimpleFunction.test)
D=0
@SP
A=M
M=D
@SP
M=M+1
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
M=M-1
A=M
D=M
@SP
M=M-1
@SP
A=M
M=D+M
@SP
M=M+1
@SP
M=M-1
@SP
A=M
M=!M
@SP
M=M+1
@ARG
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
M=M-1
A=M
D=M
@SP
M=M-1
@SP
A=M
M=D+M
@SP
M=M+1
@ARG
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
M=M-1
A=M
D=M
@SP
M=M-1
@SP
A=M
M=M-D
@SP
M=M+1
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
@SP
M=M-1
A=M
D=M
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