

import os
import sys
import shutil
from handy_modules.command_run import commandlist_run


def install_jupyter():
    commandlist_run(["pip", "install", "notebook"])


def launch():
    
    from notebook.app import main
    main()

        
    

if __name__ == "__main__":

    try:
        import IPython
    except:
        install_jupyter()
        import IPython

    launch()

