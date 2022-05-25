#!/bin/bash
export PATH="/opt/homebrew/opt/llvm@11/bin:$PATH"

WD="/Users/zhuoer/cpp/cse227/pex"
DD="/Users/zhuoer/cpp/cse227/pex/download/v5.15.11/2021-12-28-14:43:19"

cp ${DD}/skip.fun .
cp ${DD}/skip.var .
cp ${DD}/lsm.hook .
cp ${DD}/cap.func .

#  libgatlin.dylib may -> libgatlin.so
opt \
    -analyze \
    -load=${WD}/build/gatlin/libgatlin.dylib \
    -gatlin \
    -gating=cap -capfunc=cap.func\
    -ccv=0 -ccf=1 -cct=0\
    -ccvv=0 -ccfv=0 -cctv=0\
    -cvf=0 \
    -skipfun=skip.fun \
    -skipvar=skip.var \
    -lsmhook=lsm.hook \
    -prt-good=0 -prt-bad=1 -prt-ign=0 \
    -stats \
    ${DD}/vmlinux.bc \
    -o /dev/null 2>&1 | tee ${DD}/my_log.txt