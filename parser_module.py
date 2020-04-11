"""
The parser module exports the Parser class.

Parser class: Handles the parsing of a single .vm file. One parser will be created for each input file.
"""
import re


# TODO: Consider making current_command_type an instance variable to avoid calling current_command() a lot.

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
        strip_whitespace: Strips all whitespace out of a command. # TODO: Probably do this method and strip_comments?
        strip_comments: Removes comments from commands.
    """

    # Initialize all regular expressions for the parser. Done at the class level so they don't have to be initialized
    # more than once.
    regex_comment = re.compile(r'//.*')

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

        # Initialize the dictionary of command types:
        self.command_types = {
            'add': 'C_ARITHMETIC',
            'sub': 'C_ARITHMETIC',
            'neg': 'C_ARITHMETIC',
            'eq': 'C_ARITHMETIC',
            'gt': 'C_ARITHMETIC',
            'lt': 'C_ARITHMETIC',
            'and': 'C_ARITHMETIC',
            'or': 'C_ARITHMETIC',
            'not': 'C_ARITHMETIC',
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
            # TODO: Keep some or all of the below types?
            BLANK: A blank command, with no content. Will be skipped over by the assembler.
            COMMENT: A line with only a comment in it. Will be skipped over by the assembler.
        """
        # TODO: Probably put syntax error checking near start of if-else block. Or at end?

        # TODO: So...First check that it's a valid syntax (error-checking), then remove in-line comments, then split
        #  command into a list of size 1, 2, or 3. Then do the below.
        if self.regex_comment.match(self.current_command):
            return "COMMENT"
        elif self.current_command == "":
            return "BLANK"
        else:
            # Strip in-line comments and make the command string into a list of parts of the command.
            self.current_command = self.strip_comments(self.current_command).strip().split()
            print(f"command in list form: {self.current_command}")
            return self.command_types.get(self.current_command[0].lower())

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
        return self.current_command[2]

    def strip_whitespace(self):
        """Edit the current command, stripping off any whitespace"""
        # self.current_command = self.current_command.replace(" ", "")

    def strip_comments(self, current_command):
        """Edit the current command, stripping off any inline comments."""
        comment_text = self.regex_comment.search(current_command)
        if comment_text is not None:
            return current_command.replace(comment_text[0], "")
        else:
            return current_command
