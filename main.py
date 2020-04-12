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

# TODO: NOTE: For testing .asm files, must move the file into the relevant nand2tetris project folder.

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


def process_vm_files(vm_files, output_path, input_path):
    """
    Processes each of the .vm files, which includes both parsing them (one parser per file) and writing the translated
    .asm code to output using one code_writer.
    Arguments:
        vm_files: The list of .vm files to be translated.
        output_path: The location of where the translated .asm code should go.
    """
    # Instantiate a code_writer, opening the .asm output file and preparing it for being written to.
    code_writer = CodeWriter(output_path, input_path)

    # Write the bootstrap code at the top of the .asm file.
    code_writer.write_init()

    # Process all the .vm files, parsing them and writing the translated .asm code to the output file.
    for input_file in vm_files:
        print(f"\nTRANSLATING FILE {input_file}")
        code_writer.set_file_name(input_file)
        parser = Parser(input_file)

        while parser.has_more_commands():
            parser.advance()
            print(f"\n\nCurrent command: {parser.current_command}")
            parser.current_command_type = parser.command_type()
            print(f"Current command type: {parser.current_command_type}")
            if parser.current_command_type == 'C_PUSH':
                code_writer.write_push_pop('C_PUSH', parser.arg1(), parser.arg2())
            elif parser.current_command_type == 'C_POP':
                code_writer.write_push_pop('C_POP', parser.arg1(), parser.arg2())
            elif parser.current_command_type == 'C_ARITHMETIC':
                code_writer.write_arithmetic(parser.arg1())
            elif parser.current_command_type == 'C_LABEL':
                code_writer.write_label(parser.arg1())
            elif parser.current_command_type == 'C_GOTO':
                code_writer.write_goto(parser.arg1())
            elif parser.current_command_type == 'C_IF':
                code_writer.write_if(parser.arg1())
            elif parser.current_command_type == 'C_FUNCTION':
                code_writer.write_function(parser.arg1(), parser.arg2())
            elif parser.current_command_type == 'C_CALL':
                code_writer.write_call(parser.arg1(), parser.arg2())
            elif parser.current_command_type == 'C_RETURN':
                code_writer.write_return()

    # Close the output file.
    code_writer.close()

# ************************************************************************************************
# Program begins here:


# Open a .asm file for writing the assembly output code to.
# Relative file location code from
# https://stackoverflow.com/questions/7165749/open-file-in-a-relative-location-in-python
program_path = os.path.abspath(__file__)
program_dir = os.path.split(program_path)[0]
input_file_or_dir_path = os.path.join(program_dir, "vm_input", argv[1])
output_file_path = os.path.join(program_dir, "asm_output", argv[1] + ".asm")

input_files = get_vm_files(input_file_or_dir_path)
process_vm_files(input_files, output_file_path, input_file_or_dir_path)

print("\n\n\n%%%%%%%%%%%%%%%%     Done!     %%%%%%%%%%%%%%%%")