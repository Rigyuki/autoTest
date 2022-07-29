@echo off

if exist hybridclr_test rd /s /q hybridclr_test
git clone https://github.com/focus-creative-games/hybridclr_test
rem git clone --depth=1 https://gitee.com/focus-creative-games/hybridclr_test hybridclr_test

echo succ

:EXIT