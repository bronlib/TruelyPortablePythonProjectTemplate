# Sharing Python Programs version 1.4
**Technology stack** 

Pure Python.

**Description**: 

This project was initiated out of the need to develop and share Python code, without having to install it, and the need to professionally collaborate simultaneously with different teams each using their own version of Python and their own set of Python packages. 

When developing Python code for others to use as an application, you do not want to burdon them with having to install Python and process a "requirements.text" file to install the packages, especially when considering that some packages need special tools for compliation. Also, packages over time change and can cause conflicts with other packages. It is also not possible to create a single "exe" of just any Python application, and even if you can, it is also unhandy so resend large exe file if you whant to perform a minor update. That is when keeping the project in source code is easier. 

When professionally collaborating, not every project with work with the same Python version, or set of Python packages. It is possible to switch between Python distributions with "pyenv", but it is not practical to "switch-edit-switch" many times a day and also special DLLs may be needed, and they need to land in the Python distribution itself, making that distribution unattractive for other projects. 

To utilize Python's own virtual environemnt for my many projects was also unpractical for two reasons:
1) There was a project (on windows) which needed special DLLs in the main distribution
2) There were also projects using different versions of Python: so you needed two different Pythons distributions 
that are simultaneoulsy available. 

The simple solution to all of the problems was to have a single self-contained (batteries included) portable Python project.

Yes, that does mean that each project has its own copy of a Python Distribution, but that is kilo-bytes while the installed directory is megabytes. So the cost of trying to save some disc space does not weight up to the time savings of easy distribution and colloaboration. 

That meant, ofcourse, that the entire portable python directory, was in a single GIT. I  realize that some
GIT as "not done" to place executables in GIT, but it worked very well. Naturally the GIT repository was then 
megabytes instead of kilobytes in size, but after a non-Python developer accessed the GIT the first time, which may 
take several minutes, all updates there after where seconds.  The way of working was very efficient: the non-python 
developers requested either some new features or tweeks of the application, the Python developers pushed a couple
of new Python files to the GIT and the non-Python developers pulled them from the GIT and where quickly able to work on.

This way of working utilizing the strenght of Python to its maximum: because Python is interpreted not compiled. To 
update an application, a user  needs only to replace or modify text files and restart the application: there is 
no need to either recompile nor re-install. No special tools or knowledge is needed. Updates can be make fast and 
thereby save precious time, effort and or a need to know things that you rather ot be bothered with;
One should not have to know Python when wanting to use or update an application made in Python.


This template has two essential components:
* A prototype directory structure, which includes a Python Runtime,  for both development 
as exchange of a pure python project.
* Tools that create either windows batch file or linux shell scripts, that allow you call any of your Python modules no
matter where this directory is on either your PC or someone else's PC. It allows you to share your Python 
program with others wihout the need for installation. There is also a script starts a comand line interface
after setting up the proper environmental variables. This allows one to call pip or other Python utilities
and know that only the target



**Key Concepts**

* In order to exchange a Python application not only is the application itself needed, but also all of the libraries it depends on. That means that many libraries may have to be installed for a particular application to run. If a user does not want their single Python distribution to be cluttered up, they need to use either a Python Virtual Environment or a user environment which could easily be reset. A third alternative is use a Python distribution per application, realizing that the Python Distribution itself is a fraction of the size of a large application. 
* Libraries may contain specific DLL's that have to be placed in specific places in the Python distribution. Other libraries may have version dependencies which may only be met with specific orders of installation and may not work with other libraries already installed. These issues call for one Distribution or Virtual or User environment per application. The downside of a user environment is that it poorly handles DLLs, leaving either separate distribution or virtual environment per application as viable solutions. 
* In practice, such libraries may not be installable via PIP, and the DLLs may have to reside in the Python distribution. Also, not all Python applications can be reduced to a single exe. These factors imply that the most versatile exchange format for Python is one that includes the Python distribution itself.  The conclusion is that the most certain way to distribute an application is by including the distribution itself. 
* When distributing an application to a user who is more interested in the application than the language its implemented in, the simple guarantee that it will work, no matter if on a memory stick or placed in the PC is essential. Having to install it, may feel intrusive to the customer or even bring risks that the installation may be unsuccessful. A Python Virtual Environment is not portable, but has to be updated every time its placed in a new location. The only portable solution is delivery with the Python Distribution itself. 


## Dependencies

The scripts assumes internet access and the availability of "pyenv" to create the Python Distribution. On Windows, the scripts use "curl" to download and "tar" to expand pyenv, which are both standard tools on Windows. On linux and MacOs, the scripts use "curl" and "unzip", of which "unzip" may have to be installed on linux. For MacOs, both are standard. 

For the rest, this project is build on a combination of OS scripting files (bash/bat)
and Python files. Scripting files are used for basic 
configuration and the Python files, given the configurations,
create OS dependent scripting files by which Python 
can be invoked in a portable manner. 

Because this project "only" creates OS dependent scripts which allows
the end-user to work with Python in a porable manner, this project
could have been entirely written in an OS depdendent scripting language.

But because I am not an expert in the different OS scripting languages,
I wrote the main chunck in Python and used the OS depedent scripts for creating the directory structure and downloading Python. 


**Status**

I recently updated the pyenv part, so now pyenv is properly used in both linux as windows environments. 
I also recently added the ".command" file support in MacOs, so that, like on windows, all scripts can be launched by a simple mouse click, instead of having to revert to prompt. 

The windows scripts support UNC paths: the ability to call them while residing on a 
network drive. It works, but in practice is very slow, 
due to network speeds.
The utilities, to get PIP, and update PIP and SetupTools 
seem to work over multiple version of Python, but are 
vulnerable for version changes. 

## Configuration

The directory structure of this GIT is:

>       This Git/
>       |----scrips/
>       |----|----callSetupLinux.sh
>       |----|----callSetupWindows.bat
>       |----|----customize_me.py
>       |----|----generic_setup.py
>       |----|----updatescriptfiles.py
>       |----|----README.md
>       |----packages/
>       |----|----README.md
>       |----|----handy_modules/
>       |----|----|----learnings/
>       |----|----|----|----{contains some experiements}
>       |----|----|----sphinxdoc/
>       |----|----|----|----{contains templates for sphinx}
>       |----|----|----getPrompt.py  {to get a command prompt}
>       |----|----|----update_pip.py {to update the version of pip}
>       |----|----|----...
>  

The configuration depends on the directory structure this GIT is placed and 
this depends on how this project is used to make the Python directory portable. 

If used from scratch, then a logical structure would be the following:

>       Portable_Root/
>       |--- Python_Distribution/
>       |----source/ 
>       |----portable/   {This Git}
>    

In which the user's new Python code is place under "source", which itself could be a git. 

This project could also be used as a "plug-in": it can be used to make an existing non-portable
Python project portable. Such project is already a GIT with its own directory structure. 

A typical Python GIT:
>       GIT/
>       |---src/
>       |---test/
>       |---doc/

It is logical to place this under the "source" directory mentioned in the "scratch" example, 
resulting in:

>       Portable_Root/
>       |--- Python_Distribution/
>       |----source/ {A typical Python GIT}
>       |----|---src/
>       |----|---test/
>       |----|---doc/
>       |----portable/{This Git}
>    

Because I expect this to be the most prominate use-case, this configuration can 
be found in the default version of the configuration. 

The only file that needs to be configured is then either:

For Linux based OS's:
* [scripts/callSetupLinux.sh](scripts/callSetupLinux.sh)

For Windows:
* [scripts/callSetupwindows.bat](scripts/callSetupWindows.bat)

In these OS-scripting files, two parameters are set:
* The version of Python to be used
* The directories what will at the root of a "PYTHONPATH".

For those less familiar with Python, Python uses the enviromental variable
"PYTHONPATH" as the root of a module path; where Python starts the search for modules.

All projects have at least two: one points to the "site-packages" directory in a Python 
distribution and the second is at the root of the user's source code, which, in the typical
Python GIT depicted above: source/src. A second is often at the root of the tests, here:
source/test.

This project will always add two of its own: 
* portablizer/scripts
* portablizer/packages

In the  two "callSetupXXX" scripts, the variable "target_version" is used to store the
version number of Python to be used:

Windows:
>set target_version=3.9.4

Linux & Mac:
>target_version=3.9.4

and "source_dirs" stores the set of the user's needed "PYTHONPATH"s

Windows:
>set source_dirs=source\src source\tests

Linux & Mac: 
>source_dirs="source/src  source/test"

Once "source_dirs" and "target_version" are configured, the appropiate script, callSetupXXX, 
can be called and, 
if successful, a new directory will be created under portabizer/scripts, depending on 
the OS.

On Windows click on 
>callSetupWindows.bat

And the directory structure and Python Distribution will be created and a new directory of scripts will be created:
>generatedDOSscripts


On Mac, click on 
>callSetupMac.command

And the directory structure and Python Distribution will be created and a new directory of scripts will be created:
>generatedCOMMANDscripts

On Linux, launch
>callSetupLinux.sh

And the directory structure and Python Distribution will be created and a new directory of scripts will be created:
>generatedBASHscripts


For each Python module found in the PYTHONPATH, besides those in 'site-packages', a 
script file is created by which that module can be called in a portable way. 

If new Python files are creted, callSetupXXX should be called again and the directory
"generateXXXscripts" will be updated 

To reframe, when one begins, one can either pull or copy the git in a directory, whose
name is arbitrary as is the directory name given to this git. This is because a 
Python program or script can discover the directory name it is called in.

So the directory name of the root, which is arbitrary, will be called "Portable_Root" and
the directory name of this git, which is also arbitrary, will be called "portablizer"

>       Portable_Root/
>       |----portablizer/   
>       |----|----scrips/
>       |----|----|----callSetupLinux.sh
>       |----|----|----callSetupWindows.bat
>       |----|----|----customize_me.py
>       |----|----|----generic_setup.py
>       |----|----|----updatescriptfiles.py
>       |----|----|----README.md
>       |----|----packages/

After "callSetupWindows.bat" is called, the directory structure will look like the following:


>       Portable_Root/
>       |----portablizer/   
>       |----|----scrips/
>       |----|----|----callSetupLinux.sh
>       |----|----|----callSetupWindows.bat
>       |----|----|----customize_me.py
>       |----|----|----generic_setup.py
>       |----|----|----updatescriptfiles.py
>       |----|----|----README.md
>       |----|----|----generatedDOSScripts/
>       |----|----packages/
>       |----sources/
>       |----|----src/
>       |----|----test/
>       |----Python3.9.4/

So, at the top level, there are two new directories:
* PythonXXX : the python version requested in the callSetupXXX file. Pyenv gets the possible
version numbers from the site: https://www.python.org/ftp/python/
* sources, as specified by the variable source_dirs in the callSetupXXX files. If sources/src 
sources/test existed, then nothing will happen with them. 

In scripts/ there will also be a new directory. The name of the directory depends on the 
OS in which the callSetupLinux was called. In case callSetupWindows as called, the directory
"generatedDOSScripts" will be created. 

If the script callSetupXXX is called again, the only effect will be is that the directory 
generateXXXScripts will be created again. 

Once a new Pytho distribution is created. the script, in generateXXXScripts:

[py.handy_modules.update_pip.bat](py..handy_modules.update_pip.bat)

Should be called. This will bring the pip to the latest version. What also should be called is:

[py.handy_modules.update_setuptools.bat](py.handy_modules.update_setuptools.bat)

Once setuptools and pip are properly configured, the Python Distribution is ready to be used. 

And thereafter, packages can be installed on the command line using:

[py....project_packages.handy_modules.getPrompt.bat](py....project_packages.handy_modules.getPrompt.bat)

Which simply gives you a prompt, in which all system variables are properly set. 
So at the prompt you can issue the command:

pip install xxx 

## Installation
Nothing needs to be �installed�. 

## Usage



## Known issues

Document any known significant shortcomings with the software.

## Contact / Getting help

robert.brondijk@philips.com

## License

[LICENSE.md](LICENSE.md)

## Credits and references

Inspired by the projects:
- Portable Python
- Briefcase: https://briefcase.readthedocs.io/en/latest/
- Standalone builds: https://github.com/indygreg/python-build-standalone
- pyenv: https://github.com/pyenv-win &  https://github.com/pyenv
