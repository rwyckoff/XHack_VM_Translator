"""
Robert Wyckoff
CS 4100
UCCS
Project Two -- Extended VM Translator

The main VM Translator module drives the translation process from one or more XVM files into one XHAL assembly file
compatible with the XHAL Assembler.
"""

import os
from sys import argv

from parser_module import Parser
from code_writer_module import CodeWriter



# TODO: Note: Don't need to manually add in the infinite loop at the ends of asm files. It's included in .vm files.

# ************************************************************************************************
# Main functions:

def get_vm_files(input_path):
    """Detect if there is one or several (a directory of) .vm files, and return a list of them.
    Arguments:
        input_path: The path of this VM translator program.
    """
    vm_files = []
    if os.path.isdir(input_path):
        for _, _, files in os.walk(input_path, topdown=True):
            print(files)
            vm_files.append(files)
        # Flatten the list of input files, if necessary, and join the input path with them.
        vm_files = [os.path.join(input_path, f) for file in vm_files for f in file]

    # Else there is only one vm file, so append it with .vm and add just it to the list.
    else:
        vm_files.append(input_path + ".vm")

    return vm_files


def process_vm_files(vm_files, output_path):
    """
    Processes each of the .vm files, which includes both parsing them (one parser per file) and writing the translated
    .asm code to output using one code_writer.
    Arguments:
        vm_files: The list of .vm files to be translated.
        output_path: The location of where the translated .asm code should go.
    """
    code_writer = CodeWriter(output_path)
    for file in vm_files:
        parser = Parser(file)
        code_writer.set_file_name(file)
        while parser.has_more_commands:
            parser.advance()
            if parser.command_type == 'C_PUSH':
                code_writer.write_push_pop('C_PUSH', parser.arg1, parser.arg2)
            elif parser.command_type == 'C_POP':
                code_writer.write_push_pop('C_POP', parser.arg1, parser.arg2)
            elif parser.command_type == 'C_ARITHMETIC':
                code_writer.write_arithmetic(parser.arg1)


# ************************************************************************************************
# Program begins here:


# TODO: Change this to a function that checks if argv[1] is a directory or a file and does something different from
#  there. Part of it will include opening one .asm file to write to. Remember: the parser module will open the input
#  file and get it ready for parsing in its init function, but main will have to pass in each vm file in a loop.


# Open a .asm file for writing the assembly output code to.
# Relative file location code from
# https://stackoverflow.com/questions/7165749/open-file-in-a-relative-location-in-python
program_path = os.path.abspath(__file__)
program_dir = os.path.split(program_path)[0]
input_file_or_dir_path = os.path.join(program_dir, "vm_input", argv[1])
output_file_path = os.path.join(program_dir, "asm_output", argv[1] + ".asm")

input_files = get_vm_files(input_file_or_dir_path)
process_vm_files(input_files, output_file_path)
