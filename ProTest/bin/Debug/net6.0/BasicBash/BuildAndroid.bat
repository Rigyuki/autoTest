::判断Unity是否运行中
TASKLIST /V /S localhost /U %username%>tmp_process_list.txt
TYPE tmp_process_list.txt |FIND "Unity.exe"
 
IF ERRORLEVEL 0 (GOTO UNITY_IS_RUNNING)
ELSE (GOTO START_UNITY)
 
:UNITY_IS_RUNNING
::杀掉Unity
TASKKILL /F /IM Unity.exe
::停1秒
PING 127.0.0.1 -n 1 >NUL
GOTO START_UNITY

:START_UNITY
:: 此处执行Unity打包
"E:\unity\2020.3.33f1c2\Editor\Unity.exe" ^
-quit ^
-batchmode ^
-projectPath "F:\hyclr\batTest\ProTest\ProTest\bin\Debug\net6.0\hybridclr_test" ^
-executeMethod BuildTools.Build_Win64 ^
-logFile "F:\hyclr\batTest\ProTest\ProTest\bin\Debug\net6.0\hybridclr_test\output.log" ^

echo succBuildAndroid