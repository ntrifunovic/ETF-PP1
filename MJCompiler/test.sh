#!/bin/sh  

red='\x1B[0;31m'
brown='\x1B[0;33m'  
NC='\x1B[0m' # No Color


./build.sh

for i in {1..14}
do
    echo
    echo  ${red} Compiling program$i.mj ${NC}
    echo

    java -cp .:src:config:lib/java-cup-11a.jar:lib/mj-runtime.jar:lib/symboltable.jar:lib/log4j-1.2.17.jar:lib/JFlex.jar rs.ac.bg.etf.pp1.MJParser test/program$i.mj test/program$i.obj >test/izlaz$i.out 2>test/izlaz$i.err
done
