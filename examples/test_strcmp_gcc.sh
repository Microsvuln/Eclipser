#!/bin/bash

# Grey-box concolic should find 6 test cases that have node coverage gain
gcc strcmp.c -o strcmp.bin -static -g || exit 1
rm -rf box
mkdir box
cd box
dotnet ../../build/Eclipser.dll fuzz -p ../strcmp.bin -t 10 -v 1 -o output \
  --src arg --maxarglen 10
