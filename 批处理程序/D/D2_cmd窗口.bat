@echo off
set D2_message="%~n0"
set D2_pathmb="%~dp0"
set D2_pathmb=%D2_pathmb:~0,-4%
pushd %D2_pathmb%
::主代码
rem ----------------------------------------------------------主代码
cmd
::一层c
rem ----------------------------------------------------------一层c
rem ----------------------------------------------------------一层c end
::一层c end
::二层c
rem ----------------------------------------------------------二层c
rem ----------------------------------------------------------二层c end
::二层c end
::三层c
rem ----------------------------------------------------------三层c
rem ----------------------------------------------------------三层c end
::三层c end
::四层c
rem ----------------------------------------------------------四层c
rem ----------------------------------------------------------四层c end
::四层c end
::五层c
rem ----------------------------------------------------------五层c
rem ----------------------------------------------------------五层c end
::五层c end
:exit
cls
echo,&echo,即将退出!
ping /n 2 127.1>nul
exit
::脚本说明
rem ----------------------------------------------------------脚本说明
rem ----------------------------------------------------------脚本说明 end
::脚本说明 end
::属性说明
【调用-被调用】:调用
【文件功能类 】:
【文件名称   】:
::属性说明 end
rem ----------------------------------------------------------主代码 end
::主代码 end