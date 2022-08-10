#!/bin/sh
adb connect 127.0.0.1:7555
APK_PATH=$1
adb install --abi arm64-v8a "${APK_PATH}"

adb shell monkey -p com.focus_creative_games.hybridclr_test -c android.intent.category.LAUNCHER 1

echo succBuildArm8