#!/bin/sh

#dotfilesディレクトリ内の.で始まる各種ファイルのシンボリックリンクを~/に作成する
cd $(dirname $0)
for dotfile in .?*
do
      if [ $dotfile != '..' ] && [ $dotfile != '.git' ] && [ $dotfile != '.gitignore' ]
      then
          ln -Fis "$PWD/$dotfile" $HOME
      fi
done


