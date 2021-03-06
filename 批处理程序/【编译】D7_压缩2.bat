@echo off
rem ----------------------------------------------------------主代码
set message=压缩文件夹内所有文件、文件夹
:D7_begin
cls
set /p D7_passward=passward: 
cls
call :a2 1 1 0 1 
call :a10 1 1 a2_pathly 
if "%a10_result%"=="wj" (
echo,
echo,路径为文件!
ping /n 2 127.1>nul
goto D7_begin
)
for /f "tokens=*" %%i in ('dir /b "%a2_pathly%"') do (
set a2_pathly="%a2_pathly%\%%~i"
call :D7_main1
)
echo,
echo,完成!
ping /n 2 127.1>nul
goto D7_begin
::一层c
rem ----------------------------------------------------------一层c
:D7_main1
call :a10 1 1 a2_pathly 
if "%a10_result%"=="wj" (
call :a11 1 1 a2_pathly D7_passward 
)else (
call :a12 1 1 a2_pathly D7_passward 
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
【文件名称   】:压缩文件夹内所有文件或文件夹
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
:a2
@echo off
if "%~2"=="" (
echo,&echo,%%2参数为空!
ping /n 2 127.1>nul
goto exit
)
rem ■将文件拖到批处理时，批处理会运行，但%2参数为空，利用这点来判断批处理是"拖动文件到程序"的调用方式(故其它调用中%2参数必须不为空)
::主代码
rem ----------------------------------------------------------主代码
if "%4"=="1" (
rem ■%2参数为0表示不显示message的内容；%2参数为1表示若message有定义就显示其内容
if defined message (
cls
echo,&echo,"%message:"=%
)
)
echo,&echo,---------------------------退出:输入exit(默认)&echo,
set a2_pathly=exit
set /p a2_pathly=路径: 
set a2_pathly="%a2_pathly:"=%"
for %%i in (%a2_pathly%) do (
set a2_pathmb="%%~dpi"
set a2_name="%%~ni"
set a2_type="%%~xi"
)
if %a2_pathly%=="exit" goto exit
set a2_pathly=%a2_pathly:^=^^%
set a2_pathly=%a2_pathly:&=^&%
set a2_pathly=%a2_pathly:|=^|%
set a2_pathly=%a2_pathly:"=%
set a2_pathmb=%a2_pathmb:^=^^%
set a2_pathmb=%a2_pathmb:&=^&%
set a2_pathmb=%a2_pathmb:|=^|%
set a2_pathmb=%a2_pathmb:"=%
set a2_name=%a2_name:^=^^%
set a2_name=%a2_name:&=^&%
set a2_name=%a2_name:|=^|%
set a2_name=%a2_name:"=%
set a2_type=%a2_type:^=^^%
set a2_type=%a2_type:&=^&%
set a2_type=%a2_type:|=^|%
set a2_type=%a2_type:"=%
if "%3"=="1" (
rem ■可以比较拖动驱动器、拖入文件夹、拖入文件时的区别
rem ■0表示无定义，1表示有定义
cls
echo,
echo,   a2_获取路径.bat
echo,
echo,  ╔═══════════════════════════════
set /p nothing="  ║a2_pathly║" <nul
if defined a2_pathly (
echo,1"【%a2_pathly%】
)else (
echo,0"【%a2_pathly%】
)
echo,  ║═══════════════════════════════
set /p nothing="  ║a2_pathmb║" <nul
if defined a2_pathmb (
echo,1"【%a2_pathmb%】
)else (
echo,0"【%a2_pathmb%】
)
echo,  ║═══════════════════════════════
set /p nothing="  ║a2_name  ║" <nul
if defined a2_name (
echo,1"【%a2_name%】
)else (
echo,0"【%a2_name%】
)
echo,  ║═══════════════════════════════
set /p nothing="  ║a2_type  ║" <nul
if defined a2_type (
echo,1"【%a2_type%】
)else (
echo,0"【%a2_type%】
)
echo,  ╚═══════════════════════════════
echo,     ^(0表示无定义，1表示有定义^)
echo,
echo,   按任意键继续!
pause>nul
cls
)
goto:eof
cls&echo,&echo,错误,没有返回!【a2_获取路径.bat】&pause
exit
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
rem ----------------------------------------------------------主代码 end
::主代码 end
::脚本说明
rem ----------------------------------------------------------脚本说明
输出的变量提取的是原值，有特殊字符时，要在变量前加"来进行转义。
返回的变量:a2_pathly、a2_pathmb、a2_name、a2_type
rem ----------------------------------------------------------脚本说明 end
::脚本说明 end
::属性说明
【调用-被调用】:被调用
【文件功能类 】:路径处理
【文件名称   】:获取路径
【参数说明   】:
%1、%2参数无意义
%3是显示结果和不显示结果的开关，%1为1时会显示路径具体情况并暂停，%1为0时则不显示也不暂停
%4参数显示(为1时)或不显示(为0时)变量message的内容
::属性说明 end
:exit
cls
echo,&echo,即将退出!
ping /n 2 127.1>nul
exit
:a10
@echo off
if "%~2"=="" (
echo,&echo,%%2参数为空!
ping /n 2 127.1>nul
goto exit
)
rem ■将文件拖到批处理时，批处理会运行，但%2参数为空，利用这点来判断批处理是"拖动文件到程序"的调用方式(故其它调用中%2参数必须不为空)
::主代码
rem ----------------------------------------------------------主代码
call :a10_main "%%%3:"=%%"
set a10_str1=
goto :eof
::一层c
rem ----------------------------------------------------------一层c
:a10_main
set a10_str1=%1
(2>nul pushd %a10_str1%)||(goto a10_文件)
set a10_result=wjj
popd
goto :eof
:a10_文件
set a10_result=wj
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
rem ----------------------------------------------------------主代码 end
::主代码 end
::脚本说明
rem ----------------------------------------------------------脚本说明
结果保存在a10_result中，结果为wj或wjj
rem ----------------------------------------------------------脚本说明 end
::脚本说明 end
::属性说明
【调用-被调用】:被调用
【文件功能类 】:路径处理
【文件名称   】:判断路径是文件还是文件夹
【参数说明   】:
%1、%2参数无意义
%3为路径变量名
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
:a11
@echo off
if "%~2"=="" (
echo,&echo,%%2参数为空!
ping /n 2 127.1>nul
goto exit
)
rem ■将文件拖到批处理时，批处理会运行，但%2参数为空，利用这点来判断批处理是"拖动文件到程序"的调用方式(故其它调用中%2参数必须不为空)
::主代码
rem ----------------------------------------------------------主代码
call :a11_main1 "%%%3:"=%%" "%%%4:"=%%"
for %%i in (%a11_pathly%) do (
set a11_type=%%~xi
set a11_pathmb=%%~dpi
set a11_name=%%~ni
)
if "%a11_type%"==".rar" goto :eof
cls
echo,
echo,正在压缩%a11_pathly%...
if %a11_str1%=="" (
start /wait "" winrar.exe a -ep1 -rr"30p" "%a11_pathmb%%a11_name%.rar" %a11_pathly%
)else (
start /wait "" winrar.exe a -ep1 -hp%a11_str1% -rr"30p" "%a11_pathmb%%a11_name%.rar" %a11_pathly%
)
goto :eof
::一层c
rem ----------------------------------------------------------一层c
:a11_main1
echo,
set a11_pathly=%1
set a11_str1=%2
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
rem ----------------------------------------------------------主代码 end
::主代码 end
::脚本说明
rem ----------------------------------------------------------脚本说明
rem ----------------------------------------------------------脚本说明 end
::脚本说明 end
::属性说明
【调用-被调用】:被调用
【文件功能类 】:压缩
【文件名称   】:压缩文件(可加密)
【参数说明   】:
%1、%2参数无意义
%3参数为路径变量名 %4参数为密码变量名(可以缺省)
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
:a12
@echo off
if "%~2"=="" (
echo,&echo,%%2参数为空!
ping /n 2 127.1>nul
goto exit
)
rem ■将文件拖到批处理时，批处理会运行，但%2参数为空，利用这点来判断批处理是"拖动文件到程序"的调用方式(故其它调用中%2参数必须不为空)
::主代码
rem ----------------------------------------------------------主代码
call :a12_main1 "%%%3:"=%%" "%%%4:"=%%"
for %%i in (%a12_pathly%) do (
set a12_type=%%~xi
set a12_pathmb=%%~dpi
set a12_name=%%~ni
)
cls
echo,
echo,正在压缩%a12_pathly%...
if %a12_str1%=="" (
start /wait "" winrar.exe a -ep1 -rr"30p" "%a12_pathmb%%a12_name%%a12_type%.rar" %a12_pathly%
)else (
start /wait "" winrar.exe a -ep1 -hp%a12_str1% -rr"30p" "%a12_pathmb%%a12_name%%a12_type%.rar" %a12_pathly%
)
goto :eof
::一层c
rem ----------------------------------------------------------一层c
:a12_main1
echo,
set a12_pathly=%1
set a12_str1=%2
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
rem ----------------------------------------------------------主代码 end
::主代码 end
::脚本说明
rem ----------------------------------------------------------脚本说明
rem ----------------------------------------------------------脚本说明 end
::脚本说明 end
::属性说明
【调用-被调用】:被调用
【文件功能类 】:压缩
【文件名称   】:压缩文件(可加密)
【参数说明   】:
%1、%2参数无意义
%3参数为路径变量名 %4参数为密码变量名(可以缺省)
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
