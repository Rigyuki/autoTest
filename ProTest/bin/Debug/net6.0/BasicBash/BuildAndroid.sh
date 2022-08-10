#!/bin/sh

UNITY_PATH=$1
PROJECT_PATH=$2
"$UNITY_PATH" -projectPath $PROJECT_PATH -executeMethod HybridCLR.BuildPlayerHelper.Build_Android64 -batchMode -quit
echo build_1

UNITY_PATH=$1
PROJECT_PATH=$2
"$UNITY_PATH" -projectPath $PROJECT_PATH -executeMethod HybridCLR.CompileDllHelper.CompileDllAndroid -batchMode -quit
echo Compile

UNITY_PATH=$1
PROJECT_PATH=$2
"$UNITY_PATH" -projectPath $PROJECT_PATH -executeMethod HybridCLR.CopyDllHelper.OnScriptsReloaded -batchMode -quit
echo cpoyDll

UNITY_PATH=$1
PROJECT_PATH=$2
"$UNITY_PATH" -projectPath $PROJECT_PATH -executeMethod HybridCLR.BuildPlayerHelper.Build_Android64 -batchMode -quit
echo succBuildAPK