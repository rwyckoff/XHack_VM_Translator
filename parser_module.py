"""
The parser module exports the Parser class.

Parser class: Handles the parsing of a single .vm file. One parser will be created for each input file.
"""


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

    def has_more_commands(self):
        """Return true if there are more commands to be parsed, and false otherwise."""

    def advance(self):
        """Detect if there are more commands in the .vm input file. Return true if there are, and false
        otherwise."""
        pass

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
            EQU: An equate directive of the form .EQU symbol value
            COMMENT: A line with only a comment in it. Will be skipped over by the assembler.
        """
        pass

    def arg1(self):
        """
        Return the first argument of the current command. In the case of C_ARITHMETIC, return the command itself (add,
        sub, etc.). Should not be called if the current command is C_RETURN.
        """
        pass

    def arg2(self):
        """
        Return the second argument of the current command. Should be called only if the current command type is C_PUSH,
        C_POP, C_FUNCTION, or C_CALL.
        """
        pass

    def strip_whitespace(self):
        """Edit the current command, stripping off any whitespace"""
        # self.current_command = self.current_command.replace(" ", "")

    def strip_comments(self):
        """Edit the current command, stripping off any inline comments."""
        # comment_text = self.regex_comment.search(self.current_command)
        # if comment_text is not None:
        #     self.current_command = self.current_command.replace(comment_text[0], "")




