@echo off

rem set default branch
set IL2CPP_BRANCH=%1

if exist hybridclr_repo rd /s /q hybridclr_repo
rem git clone https://github.com/focus-creative-games/hybridclr
git clone --depth=1 https://gitee.com/focus-creative-games/hybridclr hybridclr_repo

if exist il2cpp_plus_repo rd /s /q il2cpp_plus_repo
rem git clone https://github.com/focus-creative-games/il2cpp_huatuo
git clone --depth=1 -b %IL2CPP_BRANCH% https://gitee.com/focus-creative-games/il2cpp_plus il2cpp_plus_repo

echo succGetILCatalogue

:EXIT
