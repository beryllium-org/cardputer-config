print("[3/4] Loading jz")
from sys import path

path.insert(1, "submodules/jz")
del path
from jz import compress

print("[4/4] Building package")
from os import listdir, chdir

chdir("files")
execstr = ""
for filee in listdir():
    execstr += f", '{filee}'"
execstr = "compress(" + execstr[2:] + ", '../package.jpk')"
exec(execstr)
print("Done.")
