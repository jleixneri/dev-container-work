import sys
import os
import time
import pathlib

print(f"\nVersion: {sys.version}")
print(f"env:\t {sys.exec_prefix}")
print(f"CWD:\t {os.getcwd()}\n")

if __name__== '__main__':
    while True:
        print('hello - loop - sleep 10')

        path = pathlib.Path('/app/data')
        if path.is_dir():
            print(f"{os.listdir(path)}")
        time.sleep(30)
