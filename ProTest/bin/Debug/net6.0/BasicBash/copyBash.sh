#!/bin/bash
#echo $(dirname $0)
#源文件
SRC_DIR=$(dirname $(readlink -f "$0"))

#::目标文件路径
DST_DIR=$1
#echo $DST_DIR
#xcopy "%SRC_DIR%" "%DST_DIR%\"  /e /y /h /r /q
#cp -$SRC_DIR /$SRC_DIR/* /$DST_DIR
cp -r "$SRC_DIR/." "$DST_DIR"
echo succcopyBash
