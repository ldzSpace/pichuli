@echo off
pushd "%~dp0"
if "%2"=="" (
echo,
echo,不能直接打开!!!
ping /n 2 127.1>nul
goto exit
)
if not defined %3 (
cls
echo,变量处理10.bat
echo,
echo,错误!!!
echo,变量%3未定义!!!
echo,按任意键退出!!!
pause>nul
goto exit
)
set str1.1=%3
call :main "%%%3:"=引_号%%"
call :main %%%3:!=感_叹_号%%
setlocal EnableDelayedExpansion
set %str1.1%=!%str1.1%:"=!
set %str1.1%=!%str1.1%:^^=转_义!
set %str1.1%=!%str1.1%:^&=并_且!
set %str1.1%=!%str1.1%:^|=或者!
set %str1.1%=!%str1.1%:^>=大于!
set %str1.1%=!%str1.1%:^<=小于!
set %str1.1%=!%str1.1%:%%=百_分_号!
set %str1.1%=!%str1.1%: =空_格!
>str1.1.txt echo,!%str1.1%!
endlocal
for /f "tokens=*" %%i in (str1.1.txt) do (
set %str1.1%=%%i
)
set str1.1=
popd
goto :eof
exit
rem ----------------------------------------------------------一层goto
:exit
cls
echo,
echo,即将退出
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------一层goto end
rem ----------------------------------------------------------一层call
:main
set %str1.1%=%1
goto :eof
rem ----------------------------------------------------------一层call end
rem ----------------------------------------------------------特异变量号
号码:
1
使用方法:
*1.1、*1.2 ...
这个序列的变量只能再本批处理使用(如str1.1、str1.2 ...)
rem ----------------------------------------------------------特异变量号 end
rem ----------------------------------------------------------脚本说明
处理变量,变量名为参数%3的值，变量名不能为str1.1；变量中的特殊字符换成其对应的标记符
处理的特殊字符有" ! ^ & | > < %
rem ----------------------------------------------------------脚本说明 end