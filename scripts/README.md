# The scripts Folder

**Description**

The scripts folder contains the heart of code that enables portabililty. 

To create or update the portability scripts, on windows click on:
>callSetupWindows.bat

..and the directory:
>generatedDOSscripts

will be created.On Mac, click on:
>callSetupMac.command

and the directory:
>generatedCOMMANDscripts

will be created.On linux launch:
>callSetupLinux.sh

>generatedBASHscripts

will be created/

All of the scripts call the modules are called via relative paths, they can be called independently of the location of 
the "Portable Root" folder: the folder containing the users'sources and Python 
distributions. This is the simple key to portability: the creation of scripts
with paths relative to the Python distribution. 

In Windows, the Python Distribution is completely self contained and can 
be placed on any other Windows PC with the same version of Windows.

For linux and Mac, it is less clear. It is theoretically possible, as it is done by Briefcase. I do not yet have enough experience with it. 