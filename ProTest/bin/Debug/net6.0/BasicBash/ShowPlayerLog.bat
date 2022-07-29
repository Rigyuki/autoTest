rem start "" "%UserProfile%\AppData\LocalLow\focus_creative_games\hybridclr_test\Player.log"

rem start "" "%UserProfile%\AppData\LocalLow\focus_creative_games\hybridclr_test\testlogs\test.log"

set testlog="%UserProfile%\AppData\LocalLow\focus_creative_games\hybridclr_test\testlogs\test.log"

set playerlog="%UserProfile%\AppData\LocalLow\focus_creative_games\hybridclr_test\Player.log"

set ftpFile=%~dp0/OutputLog.txt

type %testlog%>>output.txt

type %playerlog%>>output.txt

start "" "%~dp0/OutputLog.txt"

echo succShowLog