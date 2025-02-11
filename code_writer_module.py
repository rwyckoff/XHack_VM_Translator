"""
The code_writer module exports the Parser class.

CodeWriter class: Handles the translating of VM commands into Hack assembly .asm code. One Code Writer will be created
no matter how many .vm files are needing translation.
"""
import os
import pathlib

import config


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

    def __init__(self, output_file, input_path):
        """Construct the code_writer object and open the .asm output file. Get the output file ready for writing.

        Arguments:
            output_file: The (initially empty) .asm output file to be written to.
        """
        self.output_file = open(output_file, "w")
        self.current_input_file = None
        self.current_directory = os.path.basename(input_path)
        self.current_function = ""
        self.tf_label = 0  # The number to differentiate various true-false enabling labels.
        self.call_label = 0  # The number to differentiate various call labels.
        self.bool_label = 0     # The number to differentiate calls to bool().
        self.label_index = None

        # Initialize the addresses dictionary, which maps VM labels to RAM addresses and .asm labels.
        self.addresses = {
            # The below 4 segments are mapped directly on the RAM.
            'local': 'LCL',     # RAM[1]. Points to base of current VM function's local segment.
            'argument': 'ARG',  # RAM[2]. Points to base of current VM function's argument segment.
            'this': 'THIS',     # RAM[3]. Points to base of current this segment (within the heap).
            'that': 'THAT',     # RAM[4]. Points to base of current that segment (within the heap).
            # The below two segments are mapped directly onto a fixed area in the RAM.
            'pointer': 3,       # Mapped on RAM locations 3-4 (THIS and THAT).
            'temp': 5,          # Mapped on RAM locations 5-12 (R5-R12).
            # R13-15 can be used for any purpose, so is not in here.
            # The constant segment is fully virtual, so this translator simply supplies the literal constant.
            'static': 16,       # Static variables are stored in R16-R255.
        }

    def set_file_name(self, filename):
        """
        Inform the code_writer that the translation of a new VM file is started.
        """
        # Sets the current filename (as the last part of the input file path).
        self.current_input_file = os.path.basename(filename).replace('.vm', '')
        self.label_index = 0

    def write_arithmetic(self, command):
        """
        Write the assembly code that is the translation of the given arithmetic command.

        Arguments:
            command: One of several operations (like add, sub, or eq) to be translated into .asm code. Has only one
            part with no arguments.
        """
        # TODO: Encapsulate some or all of the VM commands (like 'add') into their own functions, then try to optimize
        #  each individually. Not as clean and will repeat more, but may be easier to see and do optimizations.

        # Do something different depending on the type of command.
        if command == 'add':
            if config.WRITE_ASM_COMMENTS:
                self.write_output('\n// add')
            self.pop_d()
            self.write_output('@R14')
            self.write_output('M=D')
            self.pop_d()
            self.write_output('@R14')
            self.write_output('D=D+M')
        elif command == 'sub':
            if config.WRITE_ASM_COMMENTS:
                self.write_output('\n// sub')
            self.pop_d()
            self.write_output('@R14')
            self.write_output('M=D')
            self.pop_d()
            self.write_output('@R14')
            self.write_output('D=D-M')
        elif command == 'and':
            if config.WRITE_ASM_COMMENTS:
                self.write_output('\n// and')
            self.pop_d()
            self.write_output('@R14')
            self.write_output('M=D')
            self.pop_d()
            self.write_output('@R14')
            self.write_output('D=D&M')
        elif command == 'or':
            if config.WRITE_ASM_COMMENTS:
                self.write_output('\n// or')
            self.pop_d()
            self.write_output('@R14')
            self.write_output('M=D')
            self.pop_d()
            self.write_output('@R14')
            self.write_output('D=D|M')
        elif command == 'neg':
            if config.WRITE_ASM_COMMENTS:
                self.write_output('\n// neg')
            self.pop_d()
            self.write_output('D=-D')
        elif command == 'not':
            if config.WRITE_ASM_COMMENTS:
                self.write_output('\n// not')
            self.pop_d()
            self.write_output('D=!D')
        elif command == 'bool':
            if config.WRITE_ASM_COMMENTS:
                self.write_output('\n// bool')
            self.dec_SP()
            self.set_a_to_sp()
            self.bool()
        elif command == 'l-not':
            if config.WRITE_ASM_COMMENTS:
                self.write_output('\n// l-not')
            self.dec_SP()
            self.set_a_to_sp()
            self.bool()
            self.set_a_to_sp()
            self.write_output('D=!M')
        elif command in ['l-and', 'l-or', 'l-xor']:
            if config.WRITE_ASM_COMMENTS:
                self.write_output(f'\n// {command}')
            self.dec_SP()
            self.set_a_to_sp()
            self.bool()
            self.dec_SP()
            self.set_a_to_sp()
            self.bool()
            self.set_a_to_sp()
            self.write_output('D=M')
            self.inc_SP()
            self.write_output('A=M')
            if command == 'l-and':
                self.write_output('D=D&M')
            elif command == 'l-or':
                self.write_output('D=D|M')
            elif command == 'l-xor':
                self.write_output('D=D&M')
                self.write_output('D=!D')
                self.write_output('@R13')   # Temporarily store complement(M and D) in reg 13
                self.write_output('M=D')
                self.set_a_to_sp()
                self.write_output('D=M')
                self.dec_SP()
                self.set_a_to_sp()
                self.write_output('D=D|M')
                self.write_output('@R13')   # Retrieve the sub-result from R13
                self.write_output('D=D&M')  # Final logic for logical xor.
        elif command in ['eq', 'gt', 'lt']:  # Each boolean operator takes 23 lines. Could be as low as 9.
            if config.WRITE_ASM_COMMENTS:
                self.write_output(f'\n// {command}')
            self.pop_d()
            self.write_output('@R14')
            self.write_output('M=D')
            self.pop_d()
            self.write_output('@R14')
            self.write_output('D=D-M')

            #self.write_output(f'@TRUE{self.tf_label}')
            true_label = f'{self.current_function}' + ':' + f'{self.label_index}'
            self.label_index += 1
            false_label = f'{self.current_function}' + ':' + f'{self.label_index}'
            self.label_index += 1
            self.write_output(f'@{true_label}')


            if command == 'eq':
                self.write_output('D;JEQ')
            elif command == 'gt':
                self.write_output('D;JGT')
            elif command == 'lt':
                self.write_output('D;JLT')
            # Added support for le, ge, and ne commands.
            elif command == 'le':
                self.write_output('D;JLE')
            elif command == 'ge':
                self.write_output('D;JGE')
            elif command == 'ne':
                self.write_output('D;JNE')

            self.write_output('D=0')  # 0 is False
            self.write_output(f'@{false_label}')
            self.write_output('0;JMP')

            self.write_output(f'({true_label})')
            self.write_output('D=-1')  # -1 is True

            self.write_output(f'({false_label})')
            self.tf_label += 1

        # Finally, push the result to the top of the stack.
        self.push_d()

    def write_push_pop(self, command, segment, index):
        """
        Write the assembly code that is the translation of the given command, where the command type must be either
        C_PUSH or C_POP.
        """
        # TODO: Not splitting push/pop into two subtasks as described in the VMT Memory commands (2:00) video may help
        #  efficiency.
        # Set the address in the A-register depending on what type of segment is being popped to or pushed from.
        address = self.addresses.get(segment)

        if command == 'C_PUSH':
            if segment == 'constant':
                if config.WRITE_ASM_COMMENTS:
                    self.write_output(f'\n// push constant {str(index)}')
                self.write_output('@' + str(index))
                self.write_output('D=A')
            elif segment == 'pointer':
                if config.WRITE_ASM_COMMENTS:
                    self.write_output(f'\n// push pointer {str(index)}')
                self.write_output('@' + str(3 + index))
                self.write_output('D=M')
            elif segment == 'temp':
                if config.WRITE_ASM_COMMENTS:
                    self.write_output(f'\n// Push temp {index}')
                self.write_output('@' + str(5 + index))
                self.write_output('D=M')
            elif segment in ['local', 'argument', 'this', 'that']:  # Indirect-indexed segments.
                if config.WRITE_ASM_COMMENTS:
                    self.write_output(f'\n// push {segment} {index}')
                self.write_output("@" + str(index))
                self.write_output("D=A")
                self.write_output("@" + str(address))
                self.write_output("A=M")
                self.write_output("D=D+A")
                self.write_output("@R13")
                self.write_output("M=D")
                self.write_output("@R13")
                self.write_output("A=M")
                self.write_output("D=M")
            elif segment == 'static':
                if config.WRITE_ASM_COMMENTS:
                    self.write_output(f'\n// push static {index}')
                self.write_output('@' + self.current_input_file + '.' + str(index))
                self.write_output('D=M')
            elif segment == 'ram':      # Extended support for pushing/popping directly to RAM.
                if config.WRITE_ASM_COMMENTS:
                    self.write_output(f'\n// push ram {index}')
                self.write_output('@' + str(index))
                self.write_output('D=M')

            # Finally, push D onto the stack
            self.push_d()

        elif command == 'C_POP':
            # Provides support for popping to the constant segment, which just removes the value on top of the stack.
            if segment == 'constant':
                if config.WRITE_ASM_COMMENTS:
                    self.write_output(f'\n// pop constant {index}')
                self.pop_d()
            elif segment == 'pointer':
                if config.WRITE_ASM_COMMENTS:
                    self.write_output(f'\n// pop pointer {index}')
                self.pop_d()
                self.write_output('@' + str(3 + index))
                self.write_output('M=D')
            elif segment == 'temp':
                if config.WRITE_ASM_COMMENTS:
                    self.write_output(f'\n// pop temp {index}')
                self.pop_d()
                self.write_output('@' + str(5 + index))
                self.write_output('M=D')
            elif segment in ['local', 'argument', 'this', 'that']:      # TODO: FOUND THE PROBLEM! Was == instead of in
                if config.WRITE_ASM_COMMENTS:
                    self.write_output(f'\n// pop {segment} {index}')
                self.pop_d()
                self.write_output("@R14")
                self.write_output("M=D")
                self.write_output("@" + str(index))
                self.write_output("D=A")
                self.write_output("@" + str(address))
                self.write_output("A=M")
                self.write_output("D=D+A")
                self.write_output("@R13")
                self.write_output("M=D")
                self.write_output("@R14")
                self.write_output("D=M")
                self.write_output("@R13")
                self.write_output("A=M")
                self.write_output("M=D")
            elif segment == 'static':
                if config.WRITE_ASM_COMMENTS:
                    self.write_output(f'\n// pop static {index}')
                self.pop_d()
                self.write_output('@' + self.current_input_file + '.' + str(index))
                self.write_output('M=D')
            elif segment == 'ram':
                if config.WRITE_ASM_COMMENTS:
                    self.write_output(f'\n// pop ram {index}')
                self.write_output('@' + str(index))
                self.write_output('M=D')
                # TODO: May need to change to the below instead of the above line.
                # self.write_output('D=A')
                # self.write_output('@R13')
                # self.write_output('M=D')
                # self.pop_d()
                # self.write_output('@R13')
                # self.write_output('A=M')
                # self.write_output('M=D')

    def write_init(self):
        """
        Writes assembly code that effects the VM initialization, also called bootstrap code. This code will be placed
        at the beginning of the .asm output file.
        """
        self.current_function = "..BOOT.."
        self.label_index = 0

        # TODO: Need the below? SimpleFunction works when this is *not* included, nor the Sys.init code below.
        self.write_output('@256')
        self.write_output('D=A')
        self.write_output('@SP')
        self.write_output('M=D')

        # self.write_call('Sys.init', 0)

        # If a Sys.vm file exists in the directory being translated, write a 'Sys.init' call.
        sys_file = os.path.join(str(pathlib.Path().absolute()), 'vm_input', self.current_directory, 'Sys.vm')
        if os.path.exists(sys_file):
            self.write_call('Sys.init', 0)
            # self.write_output('@Sys.init')
            # self.write_output('0;JMP')

    def write_label(self, label):
        """
        Writes assembly code that effects the label command.
        """
        if config.WRITE_ASM_COMMENTS:
            self.write_output(f'\n// label {label}')
        self.write_output(f'({self.current_function}${label})')

    def write_goto(self, label):
        """
        Writes assembly code that effects the goto command.
        """
        if config.WRITE_ASM_COMMENTS:
            self.write_output(f'\n// goto {label}')
        self.write_output(f'@{self.current_function}${label}')
        self.write_output('0;JMP')

    def write_if(self, label):
        """
        Writes assembly code that effects the if-goto command.
        """
        if config.WRITE_ASM_COMMENTS:
            self.write_output(f'\n// if-goto {label}')
        self.pop_d()
        self.write_output(f'@{self.current_function}${label}')
        self.write_output('D;JNE')

    def write_call(self, function_name, num_args):
        """
        Writes assembly code that effects the call command.
        """


        #return_label = function_name + ':' + str(self.call_label)  # Generate a unique return label
        return_label = self.current_function + ':' + str(self.label_index)

        if self.current_function != "..BOOT..":
            self.label_index += 1



        if config.WRITE_ASM_COMMENTS:
            self.write_output(f'\n// call {function_name} {num_args}')

        # push return address
        self.write_output('@' + return_label)
        self.write_output('D=A')
        self.push_d()

        # push LCL, ARG, THIS, and THAT
        for address in ['@LCL', '@ARG', '@THIS', '@THAT']:
            self.write_output(address)
            self.write_output('D=M')
            self.push_d()

        self.write_output('@SP')
        self.write_output('D=M')
        self.push_d()

        self.write_output('@' + str(num_args))
        self.write_output('D=A')
        self.push_d()

        # sub
        self.pop_d()
        self.write_output('@R14')
        self.write_output('M=D')
        self.pop_d()
        self.write_output('@R14')
        self.write_output('D=D-M')
        self.push_d()

        self.write_output('@' + '5')
        self.write_output('D=A')
        self.push_d()

        # sub
        self.pop_d()
        self.write_output('@R14')
        self.write_output('M=D')
        self.pop_d()
        self.write_output('@R14')
        self.write_output('D=D-M')
        self.push_d()

        self.pop_d()
        self.write_output('@ARG')
        self.write_output('M=D')

        self.write_output('@SP')
        self.write_output('D=M')
        self.push_d()

        self.pop_d()
        self.write_output('@LCL')
        self.write_output('M=D')

        self.write_output('@' + function_name)
        self.write_output('0;JMP')

        self.write_output(f'({return_label})')

    def write_return(self):
        """
        Writes assembly code that effects the return command.
        """
        # TODO: See VMT Function Calling Commands video 11:00 for optimization hints.

        if config.WRITE_ASM_COMMENTS:
            self.write_output('\n// return')

        # FRAME = LCL
        self.write_output('@LCL')
        self.write_output('D=M')
        self.write_output('@R14')
        self.write_output('M=D')

        # RET = *(FRAME-5)
        self.write_output('@5')
        self.write_output('D=A')
        self.write_output('@R14')
        self.write_output('A=M')
        self.write_output('A=A-D')
        self.write_output('D=M')
        self.write_output('@R13')
        self.write_output('M=D')

        # *ARG = pop()
        self.pop_d()
        self.write_output('@ARG')
        self.write_output('A=M')
        self.write_output('M=D')

        # SP = ARG+1
        self.write_output('@ARG')
        self.write_output('D=M')
        self.write_output('D=D+1')
        self.write_output('@SP')
        self.write_output('M=D')

        # THAT = *(FRAME-1)
        # THIS = *(FRAME-2)
        # ARG = *(FRAME-3)
        # LCL = *(FRAME-4)
        offset = 1
        for address in ['@THAT', '@THIS', '@ARG', '@LCL']:
            """Old version:
            self.write_output('@' + FRAME)
            self.write_output('D=M')  # Save start of frame
            self.write_output('@' + str(offset))
            self.write_output('D=D-A')  # Adjust address
            self.write_output('A=D')  # Prepare to load value at address
            self.write_output('D=M')  # Store value
            self.write_output(address)
            self.write_output('M=D')  # Save value
            """
            self.write_output('@' + str(offset))
            self.write_output('D=A')
            self.write_output('@R14')
            self.write_output('A=M')
            self.write_output('A=A-D')
            self.write_output('D=M')
            self.write_output(address)
            self.write_output('M=D')

            offset += 1

        # goto RET
        self.write_output('@R13')
        self.write_output('A=M')
        self.write_output('0;JMP')

    def write_function(self, function_name, num_locals):
        """
        Writes assembly code that effects the function command.
        """
        # TODO: See VMT Function Calling commands video 10:00 to see optimization strategies.

        self.current_function = function_name

        if config.WRITE_ASM_COMMENTS:
            self.write_output(f'\n// function {function_name} {num_locals}')
        self.write_output(f'({self.current_function})')

        self.write_output('D=0')

        for _ in range(num_locals):  # Initialize local vars to 0
            self.push_d()

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

    def set_a_to_sp(self):
        """Set the address (A) register to the stack pointer location (0)."""
        self.write_output('@SP')
        self.write_output('A=M')

    def pop_d(self):
        """Pop the top of the stack into the D register."""
        # if config.WRITE_ASM_COMMENTS:
        #     self.write_output('\t// pop_d')
        self.set_a_to_sp()
        self.write_output('A=A-1')
        self.write_output('D=M')
        self.dec_SP()

    def push_d(self):
        """Push the data from the D register onto the top of the stack."""
        # if config.WRITE_ASM_COMMENTS:
        #     self.write_output('\t// push_d')
        self.set_a_to_sp()  # Set SP to register A.
        self.write_output('M=D')
        self.inc_SP()  # Increment the stack pointer.

    def bool(self):
        """An XVM command that replaces the value on top of the stack with its Boolean equivalent. This means
        replacing and non-zero value on top of the stack with a -1."""
        self.write_output('D=0')
        self.write_output('D=M-D')
        # If the top of the stack = 0, skip the below and do nothing. Else, change the top of the stack to -1.
        self.write_output(f'@BOOL{self.bool_label}')
        self.write_output('D;JEQ')
        self.write_output('@SP')
        self.write_output('A=M')
        self.write_output('M=-1')
        self.write_output(f'(BOOL{self.bool_label})')
        self.bool_label += 1
