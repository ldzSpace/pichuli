@echo off
if "%~2"=="" (
echo,&echo,%%2参数为空!
ping /n 2 127.1>nul
goto exit
)
rem ■将文件拖到批处理时，批处理会运行，但%2参数为空，利用这点来判断批处理是"拖动文件到程序"的调用方式(故其它调用中%2参数必须不为空)
::主代码
rem ----------------------------------------------------------主代码
rem 缺陷说明：
rem 计算的的只有时间信息，没有包含日期
rem 结果是距离0:0:0 00的百分秒数(103表示1.03秒)
set a25_time=%time%
set /a a25_hour=%a25_time:~-11,2%+0
set a25_minite=%a25_time:~-8,2%
if %a25_minite% lss 10 (
	set a25_minite=%a25_minite:~-1%
)

set a25_second=%a25_time:~-5,2%

if %a25_second% lss 10 (
	set a25_second=%a25_second:~-1%
)
set a25_last=%a25_time:~-2,2%
if %a25_last% lss 10 (
	set a25_last=%a25_last:~-1%
)

set /a %1=100*60*60*%a25_hour%+100*60*%a25_minite%+100*%a25_second%+%a25_last%
goto :eof
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
rem ----------------------------------------------------------主代码 end
::主代码 end
::脚本说明
rem ----------------------------------------------------------脚本说明
rem ----------------------------------------------------------脚本说明 end
::脚本说明 end
::属性说明
【调用-被调用】:被调用
【文件功能类 】:
【文件名称   】:
【参数说明   】:
%1、%2参数无意义
::属性说明 end
::goto
rem ----------------------------------------------------------goto
:exit
cls
echo,&echo,即将退出!
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------goto end
::goto end
