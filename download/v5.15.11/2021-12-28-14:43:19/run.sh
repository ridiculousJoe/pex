#!/bin/sh

WD="/home/tong/space/pex-site/pex.public/"

cp ${WD}/gatlin/skip.fun .
cp ${WD}/gatlin/skip.var .
cp ${WD}/gatlin/lsm.hook .
cp ${WD}/gatlin/cap.func .

opt-11 \
    -analyze \
    -load=${WD}/build/gatlin/libgatlin.so \
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
    vmlinux.bc \
    -o /dev/null 2>&1 | tee log.txt

