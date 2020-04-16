"""
The error_checker module provides error and warning checking functions and creates an error file for exporting.
"""
import datetime as dt
import re
import config
import os

# Initialize a global variable to hold the error file name.
FILENAME = "default_filename.txt"

valid_vm_commands = ['add', 'sub', 'neg', 'eq', 'gt', 'lt', 'and', 'or', 'not', 'push', 'pop', 'label', 'goto',
                     'if-goto', 'function', 'return', 'call', 'bool', 'l-not', 'l-and', 'l-or', 'l-xor']
valid_mem_segments = ['argument', 'local', 'static', 'constant', 'this', 'that', 'pointer', 'temp', 'ram']

regex_legal_name= re.compile(r'^[A-Za-z_.:][A-Za-z0-9_.:]*$')


def create_error_file(io_file):
    # Below lines generate a random error file name based on the current date and time.
    # Date-time formatting idea from
    # https://stackoverflow.com/questions/10501247/best-way-to-generate-random-file-names-in-python
    # and relative file directory code from
    # https://stackoverflow.com/questions/7165749/open-file-in-a-relative-location-in-python

    base_filename = "error_log"
    file_name_suffix = dt.datetime.now().strftime("%y%m%d_%H%M%S") + ".txt"

    file_path = os.path.abspath(__file__)
    file_dir = os.path.split(file_path)[0] + '/' 'error_logs' + '/' + base_filename + '_' \
               + io_file + '_' + file_name_suffix

    # Set the module-scope error output filename
    global FILENAME
    FILENAME = file_dir
    return FILENAME


def write_error(error_line, error_content):
    if config.PRINT_ERRORS_TO_CONSOLE:
        print(f"\n##########\n\nERROR, line {error_line}: {error_content}\n\n##########\n")
    if config.WRITE_ERRORS_TO_LOG:
        error_file = open(FILENAME, "a")
        error_file.write(f"\n##########\n\nERROR, line {error_line}: {error_content}\n\n##########\n")


def write_warning(warning_line, warning_content):
    if config.PRINT_ERRORS_TO_CONSOLE:
        print(f"\n!!!!!!!!!!\n\nWARNING, line {warning_line}: {warning_content}\n\n!!!!!!!!!!\n")
    if config.WRITE_ERRORS_TO_LOG:
        error_file = open(FILENAME, "a")
        error_file.write(f"\n!!!!!!!!!!\n\nWarning, line {warning_line}: {warning_content}\n\n!!!!!!!!!!\n")


def check_unknown_command(command, line):
    """Ensure the validity of a given VM command."""
    if command[0] not in valid_vm_commands:
        write_error(line, f"'{' '.join(command)}'\n is an invalid standard VM command.")
        return True
    else:
        return False


def check_improper_command_format(command, line, write=True):
    """Check that the VM command follows the format specified for its type. Primarily, this means detecting if the
    command has the wrong number of elements."""
    num_elems = len(command)
    if command[0] in ['add', 'sub', 'neg', 'eq', 'gt', 'lt', 'and', 'or', 'not'] and num_elems != 1:
        if write:
            write_error(line, f"'{' '.join(command)}'\n is an arithmetic or logical command that does not conform to "
                              f"its specified format (there should be only one element in the command).")
        return True
    elif command[0] in ['push', 'pop'] and num_elems != 3:
        if write:
            write_error(line, f"'{' '.join(command)}'\n is a push or pop command that does not conform to "
                              f"its specified format (there should be exactly three elements in the command).")
        return True
    elif command[0] in ['label', 'goto', 'if-goto'] and num_elems != 2:
        if write:
            write_error(line, f"'{' '.join(command)}'\n is a program flow command that does not conform to "
                              f"its specified format (there should be exactly two elements in the command).")
        return True
    elif command[0] in ['function', 'call'] and num_elems != 3:
        if write:
            write_error(line, f"'{' '.join(command)}'\n is a function or call command that does not conform to "
                              f"its specified format (there should be exactly three elements in the command).")
        return True
    elif command[0] in ['return'] and num_elems != 1:
        if write:
            write_error(line, f"'{' '.join(command)}'\n is a return command that does not conform to "
                              f"its specified format (there should be only one element in the command).")
        return True
    else:
        return False


def check_unknown_mem_segment(command, line):
    """Ensure that the given push or pop command does not refer to an invalid memory segment."""
    if command[1] not in valid_mem_segments:
        write_error(line, f"'{' '.join(command)}'\n is a push or pop command with an invalid memory segment.")
        return True
    else:
        return False


def check_illegal_index(command, line):
    """Ensure that the given push or pop command does not contain a negative index."""
    try:
        int(command[2])
        if int(command[2]) < 0:
            write_error(line, f"'{' '.join(command)}'\n is a push or pop command with a negative index.")
            return True
        return False
    except ValueError:
        write_error(line, f"'{' '.join(command)}'\n is a push or pop command with a non-integer index.")
        return True


def check_index_out_of_range(command, line):
    """For any memory segment that has a known size, checks that the given push or pop instruction does not use an
    index outside of that known region."""
    # If command's segment is one with a known size, check the index's range.
    idx = int(command[2])
    if command[1] == 'pointer' and idx not in [0, 1]:
        write_error(line, f"'{' '.join(command)}'\n has an index that is out of range of the pointer segment.")
        return True
    elif command[1] == 'temp' and (idx < 0 or idx > 7):
        write_error(line, f"'{' '.join(command)}'\n has an index that is out of range of the temp segment.")
        return True
    elif command[1] == 'constant' and (idx < 0 or idx > 32767):
        write_error(line, f"'{' '.join(command)}'\n has an index that is out of range of the constant segment.")
        return True
    else:
        return False


def check_illegal_label(command, line):
    """Ensure that the given label, goto, or if-goto command does not reference an illegal label.That is, the label
    must follow the syntax outlined on page 159: the label is an arbitrary string composed of any sequence
    of letters, digits, underscore, dot, and colon that does not begin with a digit."""
    if not re.fullmatch(regex_legal_name, command[1]):
        write_error(line, f"'{' '.join(command)}'\n contains an illegal label.")
        return True
    else:
        return False


def check_unresolved_label(command, line, current_fn, fn_dict):
    """Check that the given goto or if-goto command does not refer to a label not defined within the
    current function."""
    print(f"CURRENT FN DICT: {fn_dict}")
    if command[1] not in fn_dict[current_fn]:
        write_error(line, f"'{' '.join(command)}'\n has a label not defined within the current function.")
        return True
    else:
        return False


def check_illegal_fn_name(command, line):
    """Ensure that the given function or call command is not using an illegal function name. That is, the command
    must follow the syntax outlined on page 160: the function name is an arbitrary string composed of any sequence
    of letters, digits, underscore, dot, and colon that does not begin with a digit."""
    if not re.fullmatch(regex_legal_name, command[1]):
        write_error(line, f"'{' '.join(command)}'\n contains an illegal function name.")
        return True
    else:
        return False


def check_illegal_arg_count(command, line):
    """Ensure that the given function or call command uses a non-negative integer for the number of locals/args."""
    try:
        int(command[2])
        if int(command[2]) < 0:
            write_error(line, f"'{' '.join(command)}'\n is a function or call command with a negative number of local "
                              f"variables or arguments.")
            return True
        return False
    except ValueError:
        write_error(line, f"'{' '.join(command)}'\n is a function or call command with a non-integer as a number of "
                          f"local variables or arguments.")
        return True
