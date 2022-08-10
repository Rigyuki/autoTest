#!/bin/sh

UNITY_PATH=$1
PROJECT_PATH=$2
"$UNITY_PATH" -projectPath $PROJECT_PATH -executeMethod HybridCLR.BuildPlayerHelper.Build_Win64 -batchMode -quit

'F:\hyclr\batTest\ProTest\ProTest\bin\Debug\net6.0\hybridclr_test\Release-Win64\HybridCLRTest.exe'
echo succBuildWin