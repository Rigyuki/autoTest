#!bin/bash


testlog="$USERPROFILE\AppData\LocalLow\focus_creative_games\hybridclr_test\testlogs\test.log"

playerlog="$USERPROFILE\AppData\LocalLow\focus_creative_games\hybridclr_test\Player.log"

touch OutputLog.txt
echo $testlog
echo $playerlog
cat $testlog >> OutputLog.txt

cat $playerlog >> OutputLog.txt

cat OutputLog.txt

echo succShowLog