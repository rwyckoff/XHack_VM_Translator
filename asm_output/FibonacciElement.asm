@256
D=A
@SP
M=D
@Sys.initRETURN1
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
M=M-1
A=M
D=M
@R14
M=D
@SP
M=M-1
A=M
D=M
@R14
D=D-M
@SP
A=M
M=D
@SP
M=M+1
@5
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
M=M-1
A=M
D=M
@R14
M=D
@SP
M=M-1
A=M
D=M
@R14
D=D-M
@SP
A=M
M=D
@SP
M=M+1
@SP
M=M-1
A=M
D=M
@ARG
M=D
@SP
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
@LCL
M=D
@Sys.init
0;JMP
(Sys.initRETURN1)
(Main.fibonacci)
D=0
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
@2
D=A
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
D=M-D
@TRUE0
D;JLT
@SP
A=M
D=0
@END0
0;JMP
(TRUE0)
@SP
A=M
D=-1
(END0)
@SP
A=M
M=D
@SP
M=M+1
@SP
M=M-1
A=M
D=M
@Main$IF_TRUE
D;JNE
@Main$IF_FALSE
0;JMP
(Main$IF_TRUE)
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
(Main$IF_FALSE)
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
@2
D=A
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
D=M-D
@SP
A=M
M=D
@SP
M=M+1
@Main.fibonacciRETURN2
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
M=M-1
A=M
D=M
@R14
M=D
@SP
M=M-1
A=M
D=M
@R14
D=D-M
@SP
A=M
M=D
@SP
M=M+1
@5
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
M=M-1
A=M
D=M
@R14
M=D
@SP
M=M-1
A=M
D=M
@R14
D=D-M
@SP
A=M
M=D
@SP
M=M+1
@SP
M=M-1
A=M
D=M
@ARG
M=D
@SP
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
@LCL
M=D
@Main.fibonacci
0;JMP
(Main.fibonacciRETURN2)
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
@1
D=A
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
D=M-D
@SP
A=M
M=D
@SP
M=M+1
@Main.fibonacciRETURN3
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
M=M-1
A=M
D=M
@R14
M=D
@SP
M=M-1
A=M
D=M
@R14
D=D-M
@SP
A=M
M=D
@SP
M=M+1
@5
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
M=M-1
A=M
D=M
@R14
M=D
@SP
M=M-1
A=M
D=M
@R14
D=D-M
@SP
A=M
M=D
@SP
M=M+1
@SP
M=M-1
A=M
D=M
@ARG
M=D
@SP
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
@LCL
M=D
@Main.fibonacci
0;JMP
(Main.fibonacciRETURN3)
@SP
M=M-1
A=M
D=M
@SP
M=M-1
@SP
A=M
D=D+M
@SP
A=M
M=D
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
(Sys.init)
D=0
@4
D=A
@SP
A=M
M=D
@SP
M=M+1
@Main.fibonacciRETURN4
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
@SP
D=M
@SP
A=M
M=D
@SP
M=M+1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
M=M-1
A=M
D=M
@R14
M=D
@SP
M=M-1
A=M
D=M
@R14
D=D-M
@SP
A=M
M=D
@SP
M=M+1
@5
D=A
@SP
A=M
M=D
@SP
M=M+1
@SP
M=M-1
A=M
D=M
@R14
M=D
@SP
M=M-1
A=M
D=M
@R14
D=D-M
@SP
A=M
M=D
@SP
M=M+1
@SP
M=M-1
A=M
D=M
@ARG
M=D
@SP
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
@LCL
M=D
@Main.fibonacci
0;JMP
(Main.fibonacciRETURN4)
(Sys$WHILE)
@Sys$WHILE
0;JMP
