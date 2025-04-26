#!/usr/bin/env bash

PATH=.:$PATH

#state the version of Python you wish to use
#and the list of source directories at the top level


toget=3.13.2
source_dirs="source/src source/tests"
main_source="source  "

export source_dirs

all_source_dirs=${main_source}${source_dirs}

echo " source_dirs = $source_dirs, "
echo " all = $all_source_dirs"

target_dir=../../

target_python=${target_dir}lin_Python${toget}

current_dir=`pwd`

echo " The target python is $target_python" 


test_dir(){
  if [ -d "$1" ]; then
     echo " $1 exists  "
  else
    echo "$1 does not exist "
    mkdir "$1"
fi
 
}


for name in $all_source_dirs
do
   echo "handling $name "
   test_dir  ${target_dir}$name
done


get_python(){

   if [ ! -d "pyenv-master" ] ; then
      if [ ! -f pym.zip ] ; then
	     curl -L  https://github.com/pyenv/pyenv/archive/refs/heads/master.zip --output pym.zip
      fi
	  if [ ! -f pym.zip ] ; then
	     echo "pyenv master not downloaded"
		 exit 1
	  fi 
	  
	  command -v unzip >/dev/null 2>&1 ||
      { echo >&2 "unzip is not installed. Please install unzip";
        exit 1
      }
	  
	  unzip pym.zip
      if [ ! -d "pyenv-master" ] ; then
         echo "The zip file was not pyenv-master"
	     exit 1
	  fi 
      
   fi 

   pyenv-master/plugins/python-build/bin/python-build $toget  $target_python
   rm -rf  pyenv-master
   rm pym.zip

}

test_python(){
 echo " $1" 
  if [ -d "$1" ] ; then
     echo "$1 exists  "
  else
     echo "$1 needs to be downloaded"
     get_python
fi
}

test_python ${target_python}

echo "Going to do Update" 
${target_python}/bin/python3 updatescriptfiles.py

echo " Update complete" 

