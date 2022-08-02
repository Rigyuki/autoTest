#!/bin/bash

#read -p "Please write your il2cpp branch here ----" IL2CPP_BRANCH
#echo "Your il2cpp branch is: " $IL2CPP_BRANCH

IL2CPP_BRANCH=$1

rm -rf hybridclr_repo

git clone --depth=1 https://gitee.com/focus-creative-games/hybridclr hybridclr_repo

rm -rf il2cpp_plus_repo
# git clone https://github.com/focus-creative-games/il2cpp_plus
git clone --depth=1 -b $IL2CPP_BRANCH https://gitee.com/focus-creative-games/il2cpp_plus il2cpp_plus_repo

echo 初始化成功






