"""
The code_writer module exports the Parser class.

CodeWriter class: Handles the translating of VM commands into Hack assembly .asm code. One Code Writer will be created
no matter how many .vm files are needing translation.
"""


class CodeWriter:
    """
    The CodeWriter class is responsible for translating VM commands (passed from a parser) into Hack assembly code
    outputted to one .asm file.

    Methods:
        __init__: Constructs the code_writer object and opens the .asm output file, getting it ready for writing.
        set_file_name: Informs the code_writer that the translation of a new VM file is started.
        write_arithmetic: Writes the assembly code that is the translation of the given arithmetic command.
        write_push_pop: Writes the assembly code that is the translation of the given C_PUSH or C_POP command.
        close: Closes the output file.
    """

    def __init__(self, output_file):
        """Construct the code_writer object and open the .asm output file. Get the output file ready for writing.

        Arguments:
            output_file: The (initially empty) .asm output file to be written to.
        """
        self.output_file = open(output_file, "w")
        self.current_input_file = None
        self.tf_label = 0     # The number to differentiate various true-false enabling labels.

        # Initialize the addresses dictionary, which maps VM labels to RAM addresses and .asm labels.
        self.addresses = {
            # The below 4 segments are mapped directly on the RAM.
            'local': 'LCL',  # RAM[1]. Points to base of current VM function's local segment.
            'argument': 'ARG',  # RAM[2]. Points to base of current VM function's argument segment.
            'this': 'THIS',  # RAM[3]. Points to base of current this segment (within the heap).
            'that': 'THAT',  # RAM[4]. Points to base of current that segment (within the heap).
            # The below two segments are mapped directly onto a fixed area in the RAM.
            'pointer': 3,  # Mapped on RAM locations 3-4 (THIS and THAT).
            'temp': 5,  # Mapped on RAM locations 5-12 (R5-R12).
            # R13-15 can be used for any purpose, so is not in here.
            # The constant segment is fully virtual, so this translator simply supplied the literal constant.
            'static': 16,  # Static variables are stored in R16-R255.
        }

    def set_file_name(self, filename):
        """
        Inform the code_writer that the translation of a new VM file is started.
        """
        # Sets the current filename (as the last part of the input file path).
        self.current_input_file = filename.replace('.vm', '').split('/')[-1]

    def write_arithmetic(self, command):
        """
        Write the assembly code that is the translation of the given arithmetic command.

        Arguments:
            command: One of several operations (like add, sub, or eq) to be translated into .asm code. Has only one
            part with no arguments.
        """
        # TODO: Encapsulate some or all of the VM commands (like 'add') into their own functions, then try to optimize
        #  each individually. Not as clean and will repeat more, but may be easier to see and do optimizations.
        '''Apply operation to top of stack'''
        # If command is not a binary operator, pop the top of the stack to the D register.
        if command not in ['neg', 'not']:
            self.pop_d()
        self.dec_SP()
        self.set_a_to_sp()
        # 8 lines so far, if not binary.

        # Do something different depending on the type of command.
        if command == 'add':                    # Currently 11 lines. Could be as low as 5.
            self.write_output('M=M+D')
        elif command == 'sub':
            self.write_output('M=M-D')
        elif command == 'and':
            self.write_output('M=M&D')
        elif command == 'or':
            self.write_output('M=M|D')
        # TODO: Prof does this differently, negating the D reg.
        elif command == 'neg':                  # Currently 11 lines. Could be as low as 3.
            self.write_output('M=-M')
        elif command == 'not':
            self.write_output('M=!M')
        elif command in ['eq', 'gt', 'lt']:     # Each boolean operator takes 23 lines. Could be as low as 9.
            self.write_output('D=M-D')
            self.write_output(f'@TRUE{self.tf_label}')

            if command == 'eq':
                self.write_output('D;JEQ')
            elif command == 'gt':
                self.write_output('D;JGT')
            elif command == 'lt':
                self.write_output('D;JLT')

            self.set_a_to_sp()
            self.write_output('M=0')  # 0 is False
            self.write_output(f'@END{self.tf_label}')
            self.write_output('0;JMP')

            self.write_output(f'(TRUE{self.tf_label})')
            self.set_a_to_sp()
            self.write_output('M=-1')  # -1 is True

            self.write_output(f'(END{self.tf_label})')
            self.tf_label += 1

        # Finally, increment the stack pointer.
        self.inc_SP()

    def write_push_pop(self, command, segment, index):
        """
        Write the assembly code that is the translation of the given command, where the command type must be either
        C_PUSH or C_POP.
        """
        # TODO: Not splitting push/pop may help optimization.
        # TODO: Add ability to pop to constant as described in the VMT Memory Commands video, time 04:14.
        self.resolve_address(segment, index)
        if command == 'C_PUSH':  # load M[address] to D
            if segment == 'constant':
                self.write_output('D=A')
            else:
                self.write_output('D=M')
            self.push_d()
        elif command == 'C_POP':  # load D to M[address]
            self.write_output('D=A')
            self.write_output('@R13')  # Store resolved address in R13
            self.write_output('M=D')
            self.pop_d()
            self.write_output('@R13')
            self.write_output('A=M')
            self.write_output('M=D')

    def close(self):
        """
        Closes the output file.
        """
        self.output_file.close()

    def write_output(self, asm_command):
        """
        Writes one .asm command (one line) to the output .asm file.
        """
        self.output_file.write(asm_command + '\n')

    # ************************************************************************************
    # **** ASM code-writing methods *****

    def inc_SP(self):
        """Write ASM code to increment the stack pointer."""
        self.write_output('@SP')
        self.write_output('M=M+1')

    def dec_SP(self):
        """Write ASM code to decrement the stack pointer."""
        self.write_output('@SP')
        self.write_output('M=M-1')

    def pop_d(self):       # TODO: Probably just call this pop_d.
        '''Decrement @SP, pop from top of stack onto D'''
        self.dec_SP()
        self.write_output('A=M')  # Set address to current stack pointer
        self.write_output('D=M')  # Get data from top of stack

    def push_d(self):      # TODO: Probably just call this push_d.
        '''Push from D onto top of stack, increment @SP'''
        self.write_output('@SP')  # Get current stack pointer
        self.write_output('A=M')  # Set address to current stack pointer
        self.write_output('M=D')  # Write data to top of stack
        self.inc_SP()

    def set_a_to_sp(self):
        self.write_output('@SP')
        self.write_output('A=M')

    def resolve_address(self, segment, index):
        '''Resolve address to A register'''
        address = self.addresses.get(segment)
        if segment == 'constant':
            self.write_output('@' + str(index))
        elif segment == 'static':
            self.write_output('@' + self.current_input_file + '.' + str(index))
        elif segment in ['pointer', 'temp']:                        # Direct-indexed segments.
            self.write_output('@R' + str(address + int(index)))
        elif segment in ['local', 'argument', 'this', 'that']:      # Indirect-indexed segments.
            self.write_output('@' + address)
            self.write_output('D=M')        # Assign reg D to the segment base.
            self.write_output('@' + str(index))
            self.write_output('A=D+A')
