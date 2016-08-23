#!/bin/bash

list="app core extractor kpathsea lua52 md5 mspack packagemanager tangle teckit texmf trace util web2c findtexmf"

for la in $list; do
    for lb in $list; do
        cmd="install_name_tool -change /opt/local/lib/libMiKTeX209-${la}.1.dylib @executable_path/libMiKTeX209-${la}.1.dylib libMiKTeX209-${lb}.2.9.dylib"
        echo $cmd
        $cmd
    done
    cmd="install_name_tool -change /opt/local/lib/libMiKTeX209-${la}.1.dylib @executable_path/libMiKTeX209-${la}.1.dylib libMiKTeX209-findtexmf.dylib"
    echo $cmd
    $cmd
done
for la in $list; do
    #for lb in initctangle ctangle findtexmf initexmf; do
    for lb in initexmf; do
        cmd="install_name_tool -change /opt/local/lib/libMiKTeX209-${la}.1.dylib @executable_path/libMiKTeX209-${la}.1.dylib ./${lb}"
        #cmd="install_name_tool -change /opt/local/lib/libMiKTeX209-${la}.dylib @executable_path/libMiKTeX209-${la}.dylib ./${lb}"
        echo $cmd
        $cmd
    done
done

