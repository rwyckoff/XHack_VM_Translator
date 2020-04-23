"""
The parser module exports the Parser class.

Parser class: Handles the parsing of a single .vm file. One parser will be created for each input file.
"""
import re
from collections import defaultdict

from error_checker import *


class Parser:
    """
    The Parser class is responsible for the parsing of a single .vm file. It encapsulates access to the input code,
    reads VM commands, parses them, and provides convenient access to their components. It also removes all white
    space and comments.

    Methods:
        __init__: Constructs the parser object and opens the .vm file, getting it ready for parsing.
        has_more_commands: Returns true if there are more commands (lines) in the input .vm file.
        advance: Reads the next command from the input and makes it the current command.
        command_type: Returns the type of the current VM command.
        arg1: Returns the first argument of the current command.
        arg2: Returns the second argument of the current command.
        strip_whitespace: Strips all whitespace out of a command.
        strip_comments: Removes comments from commands.
    """

    # Initialize all regular expressions for the parser. Done at the class level so they don't have to be initialized
    # more than once.
    regex_comment = re.compile(r'//.*')
    regex_binary = re.compile(r'^0b|0B.*')
    regex_hex = re.compile(r'^0x|0X.*')

    def __init__(self, input_file):
        """Construct the Parser object and open the given .vm input file to enable parsing of it.

        Arguments:
            input_file: The .vm file to be parsed.
        """
        # Open the file for parsing, and save the text as a list where each element is a line.
        with open(input_file, 'r') as file:
            self.command_list = file.readlines()

        # Strip newlines from the command list. Does not remove blank lines at this time
        # so that line numbers in error-reporting are accurate.
        self.command_list = [line.strip() for line in self.command_list]

        # Initialize variables.
        self.command_idx = 0
        self.current_command = None
        self.current_command_type = None
        self.current_function = None

        self.function_dict = defaultdict(list)

        # Initialize the dictionary of command types:
        self.command_types = {
            'add': 'C_ARITHMETIC',
            'sub': 'C_ARITHMETIC',
            'neg': 'C_ARITHMETIC',
            'eq': 'C_ARITHMETIC',
            'gt': 'C_ARITHMETIC',
            'lt': 'C_ARITHMETIC',
            'le': 'C_ARITHMETIC',       # XVM
            'ge': 'C_ARITHMETIC',       # XVM
            'ne': 'C_ARITHMETIC',       # XVM
            'and': 'C_ARITHMETIC',
            'or': 'C_ARITHMETIC',
            'not': 'C_ARITHMETIC',
            'bool': 'C_ARITHMETIC',     # XVM
            'l-not': 'C_ARITHMETIC',    # XVM
            'l-and': 'C_ARITHMETIC',    # XVM
            'l-or': 'C_ARITHMETIC',     # XVM
            'l-xor': 'C_ARITHMETIC',    # XVM
            'push': 'C_PUSH',
            'pop': 'C_POP',
            'label': 'C_LABEL',
            'goto': 'C_GOTO',
            'if-goto': 'C_IF',
            'function': 'C_FUNCTION',
            'return': 'C_RETURN',
            'call': 'C_CALL'
        }

    def has_more_commands(self):
        """Return true if there are more commands to be parsed, and false otherwise."""
        if self.command_idx < len(self.command_list):
            return True
        else:
            return False

    def advance(self):
        """Detect if there are more commands in the .vm input file. Return true if there are, and false
        otherwise."""
        self.current_command = self.command_list[self.command_idx]
        self.command_idx += 1
        return self.current_command

    def command_type(self):
        """Return the type of the current command. There are several possible command types that could be returned:
            C_ARITHMETIC:
            C_PUSH:
            C_POP:
            C_LABEL:
            C_GOTO:
            C_IF:
            C_FUNCTION:
            C_RETURN:
            C_CALL:
            BLANK: A blank command, with no content. Will be skipped over by the assembler.
            COMMENT: A line with only a comment in it. Will be skipped over by the assembler.
            INVALID: A command that returned some error. Should be skipped over so the program can continue.
        """
        if self.regex_comment.match(self.current_command):
            return "COMMENT"
        elif self.current_command == "":
            return "BLANK"
        else:
            # Strip in-line comments and make the command string into a list of parts of the command.
            self.current_command = self.strip_comments(self.current_command).strip().split()

            # Check that the first part of the command (the VM command itself) is valid.
            if check_unknown_command(self.current_command, self.command_idx):
                return 'INVALID'

            # Check that the command is in the proper format for its type.
            if check_improper_command_format(self.current_command, self.command_idx):
                return 'INVALID'

            # Set the command_type.
            command_type = self.command_types.get(self.current_command[0].lower())

            # Set the current function, which will be useful in checking for unresolved labels.
            if command_type == 'C_FUNCTION':
                self.current_function = self.current_command[1]
                print(f"CURRENT FN DICT: {self.function_dict}")

            # If it's a push or pop command, check that its memory segment is valid, that its index is non-negative,
            # and that its index doesn't go outside its memory segment.
            if command_type in ['C_PUSH', 'C_POP']:
                if check_unknown_mem_segment(self.current_command, self.command_idx) or \
                        check_illegal_index(self.current_command, self.translate_bin_hex(self.current_command[2]),
                                            self.command_idx) or \
                        check_index_out_of_range(self.current_command, self.translate_bin_hex(self.current_command[2]),
                                                 self.command_idx):
                    return 'INVALID'

            # If it's a label, goto, or if-goto command, check to ensure its not referencing an illegal label.
            if command_type in ['C_LABEL', 'C_GOTO', 'C_IF'] and \
                    check_illegal_label(self.current_command, self.command_idx):
                return 'INVALID'

            # If it's a goto or if-goto command, check to ensure its referencing a label defined in its function.
            if command_type in ['C_GOTO', 'C_IF'] and check_unresolved_label(self.current_command, self.command_idx,
                                                                             self.current_function, self.function_dict):
                return 'INVALID'

            # If its a function or call command, check the legality of its function name.
            if command_type in ['C_FUNCTION', 'C_CALL']:
                if check_illegal_fn_name(self.current_command, self.command_idx) or \
                        check_illegal_arg_count(self.current_command, self.command_idx):
                    return 'INVALID'

            # If there are no errors, return the current command's type.
            return command_type

    def arg1(self):
        """
        Return the first argument of the current command. In the case of C_ARITHMETIC, return the command itself (add,
        sub, etc.). Should not be called if the current command is C_RETURN.
        """
        if self.current_command_type == 'C_ARITHMETIC':
            print(f"Arg1: {self.current_command[0]}")
            return self.current_command[0]
        elif len(self.current_command) > 1:
            print(f"Arg1: {self.current_command[1]}")
            return self.current_command[1]
        else:
            return None

    def arg2(self):
        """
        Return the second argument of the current command. Should be called only if the current command type is C_PUSH,
        C_POP, C_FUNCTION, or C_CALL.
        """
        print(f"Arg2: {self.current_command[2]}")
        # Check arg2 for binary and hex, translating to decimal if necessary.
        translated_arg = self.translate_bin_hex(self.current_command[2])
        return int(translated_arg)

    def strip_comments(self, current_command):
        """Edit the current command, stripping off any inline comments."""
        comment_text = self.regex_comment.search(current_command)
        if comment_text is not None:
            return current_command.replace(comment_text[0], "")
        else:
            return current_command

    def reset_parser(self):
        """Reset the command index of the parser so that the VMT can run through the VM code multiple times."""
        self.command_idx = 0
        self.current_command = None

    def collect_fn_labels(self):
        """Collect a dictionary of function labels. To be called before main processing of the .vm files."""
        if self.regex_comment.match(self.current_command) or self.current_command == "":
            return

        # Strip in-line comments and make the command string into a list of parts of the command.
        self.current_command = self.strip_comments(self.current_command).strip().split()

        # Check that the command is in the proper format for its type.
        if not check_improper_command_format(self.current_command, self.command_idx, write=False):
            # Set the command_type.
            command_type = self.command_types.get(self.current_command[0].lower())

            # Set the current function, which will be useful in checking for unresolved labels.
            if command_type == 'C_FUNCTION':
                self.current_function = self.current_command[1]
                print(f"CURRENT FN DICT: {self.function_dict}")

            if command_type == 'C_LABEL':
                self.function_dict[self.current_function].append(self.current_command[1])
                print(f"CURRENT FN DICT: {self.function_dict}")

    def translate_bin_hex(self, content):
        """Detect if the content of the command is written in binary or hexadecimal, then translate and redefine the
        content into decimal and return that value."""
        if self.regex_binary.match(content):
            print("Binary detected! Translating....")
            stripped_content = content.replace('0b', '').replace('0B', '')
            try:
                return str(int(stripped_content, 2))
            except ValueError:
                # Record error if binary content is invalid.
                return "ERROR"
        elif self.regex_hex.match(content):
            print("Hex detected! Translating....")
            stripped_content = content.replace('0x', '').replace('0X', '')
            try:
                return str(int(stripped_content, 16))
            except ValueError:
                # Record error if hex content is invalid.
                return "ERROR"
        # No binary or hexadecimal is detected, so return the content unchanged.
        else:
            return content
