#!/bin/bash

list="app core extractor kpathsea lua52 md5 mspack packagemanager tangle teckit texmf trace util web2c"

list_bins="ctangle findtexmf-2.9 initexmf miktex-tangle"

prefix="/opt/local"
olddir=$PWD
cd "./$prefix/lib"
# run this in destroot/opt/local/lib
for la in $list; do
	for lb in $list; do
		cmd="install_name_tool -change @executable_path/libMiKTeX209-${la}.1.dylib ${prefix}/lib/libMiKTeX209-${la}.1.dylib libMiKTeX209-${lb}.2.9.dylib"	
		echo $cmd
		$cmd
	done
done
for la in $list; do
	for lb in findtexmf; do
		cmd="install_name_tool -change @executable_path/libMiKTeX209-${la}.1.dylib ${prefix}/lib/libMiKTeX209-${la}.1.dylib libMiKTeX209-${lb}.dylib"	
		echo $cmd
		$cmd
	done
done

cd $olddir
cd "./$prefix/bin"
for la in $list; do
	for lb in $list_bins; do
		cmd="install_name_tool -change @executable_path/libMiKTeX209-${la}.1.dylib ${prefix}/lib/libMiKTeX209-${la}.1.dylib ${lb}"
		echo $cmd
		$cmd
	done
done
for la in findtexmf; do
	for lb in $list_bins; do
		cmd="install_name_tool -change @executable_path/libMiKTeX209-${la}.dylib ${prefix}/lib/libMiKTeX209-${la}.dylib ${lb}"
		echo $cmd
		$cmd
	done
done

