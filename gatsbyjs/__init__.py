import os
import sys

name = "gatsbyjs"

command_base = "docker run -it --rm -v $(pwd):/site -p 8000:8000 mjroson/gatsbyjs"

dynamic_command = " ".join(sys.argv[1:])

os.system('%s %s' % (command_base, dynamic_command))