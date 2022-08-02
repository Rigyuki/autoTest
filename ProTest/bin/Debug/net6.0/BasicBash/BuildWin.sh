#!/bin/sh

UNITY_PATH=$1
PROJECT_PATH=$2
"$UNITY_PATH" -projectPath $PROJECT_PATH -executeMethod HybridCLR.BuildPlayerHelper.Build_Win64 -batchMode -quit

echo succBuildWin