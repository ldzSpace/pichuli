@echo off
::主代码
set D8_message="%~n0"
set D8_pathmb="%~dp0"
set D8_pathmb=%D8_pathmb:~0,-4%
pushd %D8_pathmb%
rem ----------------------------------------------------------主代码
set message=压缩文件夹内所有指定类型的文件
:D8_begin
set a=1
cls
set D8_wjtype=
echo,
set /p D8_wjtype=文件类型: 
cls 
if "%D8_wjtype%"=="" (
echo,
echo,错误!
ping /n 2 127.1>nul
goto D8_begin
)
set D8_passward=
echo,
set /p D8_passward=passward: 
call a\a2_获取路径.bat 1 1 0 1
call a\a10_路径判断2.bat 1 1 a2_pathly
if "%a10_result%"=="wj" (
cls
echo,
echo,路径为文件!
ping /n 2 127.1>nul
goto D8_begin
)
>b.txt echo,所有jsp文件
for /f "tokens=*" %%i in ('dir /b/s "%a2_pathly%"') do (
set a2_pathly="%%~i"
set D8_type="%%~xi"
call :D8_main1
)
echo,
echo,完成!
ping /n 2 127.1>nul
goto D8_begin
::一层c
rem ----------------------------------------------------------一层c
:D8_main1
call a\a10_路径判断2.bat 1 1 a2_pathly
if "%a10_result%"=="wjj" goto :eof
if %D8_type%==".rar" goto :eof
if %D8_type%==".%D8_wjtype%" (
echo,%a%,%a2_pathly%
set /a a=%a%+1
>>b.txt echo,%a%,%a2_pathly%
)
goto :eof
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
::脚本说明
rem ----------------------------------------------------------脚本说明
rem ----------------------------------------------------------脚本说明 end
::脚本说明 end
::属性说明
【调用-被调用】:调用
【文件功能类 】:压缩
【文件名称   】:压缩文件夹内所有指定类型的文件
::属性说明 end
rem ----------------------------------------------------------goto
:exit
cls
echo,&echo,即将退出!
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------goto end
rem ----------------------------------------------------------主代码 end
::主代码 end