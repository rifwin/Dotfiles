_ansi_reset = "\033[0m"
_ansi_red = "\x1b[31m"
_ansi_green = "\x1b[32m"
_ansi_yellow = "\x1b[33m"
_ansi_blue = "\x1b[34m"

def text_red(text):
    return f"{_ansi_red}{text}{_ansi_reset}"

def text_green(text):
    return f"{_ansi_green}{text}{_ansi_reset}"

def text_yellow(text):
    return f"{_ansi_yellow}{text}{_ansi_reset}"

def text_blue(text):
    return f"{_ansi_blue}{text}{_ansi_reset}"
