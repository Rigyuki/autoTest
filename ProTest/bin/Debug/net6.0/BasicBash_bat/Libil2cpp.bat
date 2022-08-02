@echo off

rem replace with right Unity Editor Install path
set IL2CPP_PATH=%1
if not exist "%IL2CPP_PATH%" (
    echo "please set correct IL2CPP_PATH value"
    goto EXIT
)

set LOCAL_IL2CPP_DATA=LocalIl2CppData

if not exist %LOCAL_IL2CPP_DATA% (
    mkdir %LOCAL_IL2CPP_DATA%
)

rem need copdy MonoBleedingEdge
set MBE=%LOCAL_IL2CPP_DATA%\MonoBleedingEdge
if not exist %MBE% (
    xcopy /q /i /e "%IL2CPP_PATH%\..\MonoBleedingEdge" %MBE%
)


rem copy il2cpp
set IL2CPP=%LOCAL_IL2CPP_DATA%\il2cpp
if not exist %IL2CPP% (
    xcopy /q /i /e "%IL2CPP_PATH%" %IL2CPP%
)

set HYBRIDCLR_REPO_DIR=hybridclr_repo

set IL2CPP_PLUS_REPO_DIR=il2cpp_plus_repo

set LIBIL2CPP_PATH=%LOCAL_IL2CPP_DATA%\il2cpp\libil2cpp
rd /s /q %LIBIL2CPP_PATH%

xcopy /q /i /e %IL2CPP_PLUS_REPO_DIR%\libil2cpp %LIBIL2CPP_PATH%
xcopy /q /i /e %HYBRIDCLR_REPO_DIR%\huatuo %LIBIL2CPP_PATH%\huatuo

rem clean il2cpp build cache
set IL2CPP_CACHE=..\Library\Il2cppBuildCache
echo clean %IL2CPP_CACHE%
if exist "%IL2CPP_CACHE%" rd /s /q "%IL2CPP_CACHE%"

echo succLibil2cpp

:EXIT
