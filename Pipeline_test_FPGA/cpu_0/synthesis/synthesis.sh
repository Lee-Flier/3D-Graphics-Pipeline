#!/bin/bash

rm -rf xst

echo "xst -ifn "cpu_0_xst.scr" -intstyle silent"

echo "Running XST synthesis ..."

xst -ifn "cpu_0_xst.scr" -intstyle silent
if [ $? -ne 0 ]; then
  exit 1
fi

echo "XST completed"

rm -rf xst

mv ../implementation/cpu_0.ngc .
ngcbuild ./cpu_0.ngc ../implementation/cpu_0.ngc
if [ $? -ne 0 ]; then
  exit 1
fi
