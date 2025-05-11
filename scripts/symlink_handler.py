import os
from utils import text_red, text_blue


def resolve_home(path):
    return os.path.expanduser(path)


def create_symlink(link_data, replace_target):
    print(replace_target)
    print(resolve_home(link_data[0][0]))
    print(resolve_home("~"))
    #dir = Path(link_data[0][0])
    #items = [item.name for item in dir.iterdir()]
