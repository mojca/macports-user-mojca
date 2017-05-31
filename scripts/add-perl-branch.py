#!/usr/bin/python

import glob
import re

def replace_perl_versions(filename):
    print(filename)

    # read the file
    f = open(filename)
    lines = f.readlines()
    f.close()

    # write the file with a changed version string
    f = open(filename, 'w')
    for line in lines:
        match = re.search(r'^perl5.branches\s+(.*)', line)
        if match:
            versions_old = match.group(1)
            # remove 5.16 5.28 5.20
            versions_new = re.sub(r'5[.](24)\s*', '5.24 5.26', versions_old)
            # new version string (properly formatted for 20 spaces)
            line_new     = "perl5.branches      {}".format(versions_new)
            # just debug output
            # print(versions_old)
            # print(versions_new)
            print(line.strip())
            print(line_new)
            print()
            # write the new version string to the file
            f.write(line_new + "\n")
        else:
            # or write the original line if it wasn't about versions
            f.write(line)
    f.close()


file_list = glob.glob("perl/p5-*/Portfile")
for l in file_list:
    replace_perl_versions(l)
