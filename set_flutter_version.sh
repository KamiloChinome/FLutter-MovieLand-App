#!/bin/sh
echo "⚙️ INITIALIZE ⚙️"
FLUTTER_DIRECTORY="C:/flutter"
FLUTTER_VERSION="3.10.0"
CURRENT_DIR=$(pwd)
cd $FLUTTER_DIRECTORY
git checkout  $FLUTTER_VERSION 
$FLUTTER_DIRECTORY/bin/flutter --version
cd $CURRENT_DIR
$FLUTTER_DIRECTORY/bin/flutter pub get

echo "⚡ TO COMPLETE, YOU MUST RESTART VSCODE ⚡"
echo "⚡ PRESS CMD + SHIT + P AND RESET WINDOWS OR RELOAD WINDOWS⚡"
echo "⚡ FINISH ⚡" 
