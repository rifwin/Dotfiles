import subprocess
from pathlib import Path
from utils import text_yellow, text_blue, text_green


def resolve_home(path):
    if path.startswith("~") or path.startswith("$HOME"):
        path = path.split("/", 1)[-1]
        path = Path.home() / path
        return path
    return Path(path)


def create(link_pairs):
    for pair in link_pairs:
        source = resolve_home(pair[0])
        target = resolve_home(pair[1])
        replace_target = pair[2]

        print(text_blue("Creating symlink:"))
        print(f"SOURCE  : {source}")
        print(f"TARGET  : {target}")
        print(f"REPLACE : {replace_target}")

        if not target.exists():
            target.symlink_to(source)
            print(text_green("Target not exist. Created"))
        elif target.exists() and replace_target:
            subprocess.run(["trash-put", str(target)])
            target.symlink_to(source)
            print(text_green("Target exists. Replaced"))
        else:
            print(text_yellow("Target exists. Skipped"))

