#!/bin/sh
adb connect 127.0.0.1:7555
#adb install --abi armeabi-v7a 'F:\hyclr\batTest\ProTest\ProTest\bin\Debug\net6.0\hybridclr_test\Release-Android\HybridCLRTest.apk'

#adb shell am start -a com.focus_creative_games.hybridclr_test/com.focus_creative_games.hybridclr_test.MainActivity

#adb logcat -v time > 'F:\hyclr\batTest\ProTest\ProTest\bin\Debug\net6.0\hybridclr_test\Release-Android\outputArm7.txt'
#adb logcat /storage/emulated/0/Android/data/com.focus_creative_games.hybrid_test/files/testlog/test.log > 'F:\hyclr\batTest\ProTest\ProTest\bin\Debug\net6.0\hybridclr_test\Release-Android\testArm7.txt'

#APK_PATH='F:\hyclr\batTest\ProTest\ProTest\bin\Debug\net6.0\hybridclr_test\Release-Android\HybridCLRTest.apk'
#BUNDLE_ID='com.focus_creative_games.hybridclr_test'

#alias unilogcat='adb logcat|egrep "Unity"' 

#adb install --abi armeabi-v7a "${APK_PATH}"
APK_PATH=$1

adb install --abi armeabi-v7a "${APK_PATH}"
#adb shell
#run-as com.focus_creative_games.hybridclr_test
#adb shell am start -n com.focus_creative_games.hybridclr_test/.MainActivity

#adb shell am start -W com.focus_creative_games.hybridclr_test -c android.intent.category.LAUNCHER 1
adb shell monkey -p com.focus_creative_games.hybridclr_test -c android.intent.category.LAUNCHER 1
#adb shell am start -W com.focus_creative_games.hybridclr_test/com.focus_creative_games.hybridclr_test.MainActivity
#cp 'logArm7.txt' 'storage/emulated/0/Android/data/com.focus_creative_games.hybridclr_test/files/testlogs/test.log'
#adb pull storage/emulated/0/Android/data/com.focus_creative_games.hybridclr_test/files/testlogs/test.log logArm7.txt
echo succBuildArm7