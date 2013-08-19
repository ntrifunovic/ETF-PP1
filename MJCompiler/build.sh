#!/bin/sh  

red='\x1B[0;31m'
brown='\x1B[0;33m'  
NC='\x1B[0m' # No Color

echo
echo  ${brown} LEXER ${red}
echo

java -jar lib/JFlex.jar -d src/rs/ac/bg/etf/pp1/ spec/mjlexer.flex 

echo
echo  ${brown} PARSER ${red}
echo

java -jar lib/java-cup-11a.jar -destdir src/rs/ac/bg/etf/pp1/ -parser MJParser spec/mjparser.cup 

echo ${NC}


echo
echo  ${brown} Compiling with javac ${red}
echo

javac -cp .:src:config:lib/java-cup-11a.jar:lib/mj-runtime.jar:lib/symboltable.jar:lib/log4j-1.2.17.jar src/rs/ac/bg/etf/pp1/*.java src/rs/ac/bg/etf/pp1/util/*.java
