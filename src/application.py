import sys
from my_package import names
if __name__ == "__main__":
    sys.path.append('.')
    names.echo_name("John")
