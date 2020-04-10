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
        output_file = open(output_file, "w")

    def set_file_name(self, filename):
        """
        Inform the code_writer that the translation of a new VM file is started.
        """
        pass

    def write_arithmetic(self, command):
        """
        Write the assembly code that is the translation of the given arithmetic command.
        """
        pass

    def write_push_pop(self, command, segment, index):
        """
        Write the assembly code that is the translation of the given command, where the command type must be either
        C_PUSH or C_POP.
        """
        pass

    def close(self):
        """
        Closes the output file.     # TODO: This may be unnecessary with Pyhon's with open syntax. We'll see.
        """
        pass
