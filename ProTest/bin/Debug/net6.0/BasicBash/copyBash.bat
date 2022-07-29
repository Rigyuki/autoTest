@echo off

::对象文件路径
set SRC_DIR=%~dp0
::目标文件路径
set DST_DIR=%1
xcopy "%SRC_DIR%" "%DST_DIR%\"  /e /y /h /r /q

echo succcopyBash