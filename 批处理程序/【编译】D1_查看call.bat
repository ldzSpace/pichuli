@echo off
rem ----------------------------------------------------------主代码
:D1_begin
set message=查看批处理call
call :a2 1 1 0 1 
call :a13 1 1 a2_pathly 
cls
echo,
type a13_call信息2.txt
echo,
pause>nul
goto :D1_begin
::一层c
rem ----------------------------------------------------------一层c
::函数1
::函数1 end
::函数2
::函数2 end
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
【文件功能类 】:
【文件名称   】:
::属性说明 end
:exit
cls
echo,&echo,即将退出!
ping /n 2 127.1>nul
exit
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
:a13
@echo off
if "%~2"=="" (
echo,&echo,%%2参数为空!
ping /n 2 127.1>nul
goto exit
)
rem ■将文件拖到批处理时，批处理会运行，但%2参数为空，利用这点来判断批处理是"拖动文件到程序"的调用方式(故其它调用中%2参数必须不为空)
::主代码
rem ----------------------------------------------------------主代码
call :a13_main1 "%%%3:"=%%"
cd.>a13_行信息.txt
cd.>a13_call信息.txt
cd.>a13_call信息2.txt
if not exist %a13_pathly% (
echo,
echo,错误!
echo,
echo,%a13_pathly%不存在!
ping /n 2 127.1>nul
goto :eof
)
for /f "tokens=*" %%i in ('findstr /n "call" %a13_pathly%') do (
>>a13_行信息.txt echo,%%i
)
set a13_str1= 
for /f "tokens=1,* delims=:" %%i in (a13_行信息.txt) do (
rem echo,第%%i行
set /p=%%i <nul
set a13_str3=%%i
set a13_str4=%%j
call :a5 1 1 a13_str4 a13_str1 
call :a13_main2
)
set a13_act=
for /f "tokens=1,* delims= " %%i in (a13_call信息.txt) do (
set a13_str5=%%j
call :a13_main3
if defined a13_act (
>>a13_call信息2.txt echo,%%i %%j
set a13_act=
)
)
cd.>a13_call信息3.txt
if exist a13_临时文件夹 rd /q/s a13_临时文件夹
md a13_临时文件夹
for /f "tokens=1,*" %%i in (a13_call信息2.txt) do (
set a13_str6=%%~nj
set a13_str7=%%~j
call :a13_main4
)
echo,
goto :eof
::一层c
rem ----------------------------------------------------------一层c
:a13_main1
set a13_pathly=%1
goto :eof
:a13_main2
set a13_act=
for /f "tokens=*" %%i in (a5_d.txt) do (
if defined a13_act (
>>a13_call信息.txt echo,%a13_str3% %%i
set a13_act=
)
if "%%i"=="call" set a13_act=on
)
goto :eof
:a13_main3
call :a8 1 1 a13_str5 
if not "%a13_str5:~0,1%"==":" set a13_act=on
goto :eof
:a13_main4
set a13_str4.1=_
call :a5 1 1 a13_str6 a13_str4.1 
for /f "tokens=*" %%i in (a5_d.txt) do (
set a13_str4.2=%%i
goto a13_finish4.1
)
:a13_finish4.1
if not exist a13_临时文件夹\%a13_str4.2%.txt (
>>a13_call信息3.txt echo,%a13_str7% %a13_str4.2%
cd.>a13_临时文件夹\%a13_str4.2%.txt
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
:a5
@echo off
if "%~2"=="" (
echo,&echo,%%2参数为空!
ping /n 2 127.1>nul
goto exit
)
rem ■将文件拖到批处理时，批处理会运行，但%2参数为空，利用这点来判断批处理是"拖动文件到程序"的调用方式(故其它调用中%2参数必须不为空)
::主代码
rem ----------------------------------------------------------主代码
cd.>a5_a.txt
cd.>a5_b.txt
cd.>a5_c.txt
cd.>a5_d.txt
call :a8 1 1 %3 
call :a8 1 1 %4 
set a5_str1=%3
set a5_str2=%4
setlocal EnableDelayedExpansion
set a5_str3=!%a5_str2%!
set a5_str4=!%a5_str1%:a=▓!
set a5_str4=!a5_str4:%a5_str3%=a!
set a5_i=1
set a5_str6=a5_a
set a5_str5=a5_b
>%a5_str6%.txt echo,!a5_str4!
:a5_back
set a5_act=
for /f "tokens=1,* delims=a" %%i in (%a5_str6%.txt) do (
if defined a5_act (
>>%a5_str5%.txt echo,%%i
>>%a5_str5%.txt echo,%%j
)else (
>%a5_str5%.txt echo,%%i
>>%a5_str5%.txt echo,%%j
set a5_act=on
)
)
set a5_md=%a5_str6%
set a5_str6=%a5_str5%
set a5_str5=%a5_md%
set /a a5_i=%a5_i%+1
if not %a5_i% equ 20 goto a5_back
cd.>a5_c.txt
for /f "tokens=*" %%i in (a5_a.txt) do (
>>a5_c.txt echo,%%i
)
endlocal
cd.>a5_d.txt
for /f "tokens=*" %%i in (a5_c.txt) do (
set a5_str1=%%i
call :a5_main
)
set a5_str1=
set a5_str2=
set a5_str3=
set a5_str6=
set a5_str5=
set a5_str4=
goto :eof
::一层c
rem ----------------------------------------------------------一层c
:a5_main
call :a9 1 1 a5_str1 
>>a5_d.txt echo,%a5_str1:▓=a%
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
拆分结果放在a5_d.txt中，注意用此批处理时拆分字符不能为a或【标_记】的顺序组合【标_、标_记、_记】中的任何一个
rem ----------------------------------------------------------脚本说明 end
::脚本说明 end
::属性说明
【调用-被调用】:被调用
【文件功能类 】:变量处理
【文件名称   】:变量按字符串拆分
【参数说明   】:
%1、%2参数无意义
%3、%4分别代表待拆分变量名、拆分符变量名
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
:a8
@echo off
if "%~2"=="" (
echo,&echo,%%2参数为空!
ping /n 2 127.1>nul
goto exit
)
rem ■将文件拖到批处理时，批处理会运行，但%2参数为空，利用这点来判断批处理是"拖动文件到程序"的调用方式(故其它调用中%2参数必须不为空)
::主代码
rem ----------------------------------------------------------主代码
set a8_str1=%3
if not defined %3 (
cls&echo,&echo,错误,变量【%3】没有定义!&pause
goto exit
)
call :a8_main "%%%3:"=引_号%%"
call :a8_main %%%3:!=感_叹_号%%
setlocal EnableDelayedExpansion
set !a8_str1!=!%a8_str1%:"=!
set !a8_str1!=!%a8_str1%:^^=转_义!
set !a8_str1!=!%a8_str1%:^&=并_且!
set !a8_str1!=!%a8_str1%:^|=或_者!
set !a8_str1!=!%a8_str1%:^<=小_于!
set !a8_str1!=!%a8_str1%:^>=大_于!
set !a8_str1!=!%a8_str1%:%%=百_分_号!
set !a8_str1!=!%a8_str1%: =空_格!
rem ■set !a8_str1!=!%a8_str1%:^(=左_括!
rem ■set !a8_str1!=!%a8_str1%:^)=右_括!
>a8_临时文件.txt echo,!%a8_str1%!
endlocal
for /f "tokens=*" %%i in (a8_临时文件.txt) do (
set %a8_str1%=%%i
)
set a8_str1=
goto:eof
exit
::一层c
rem ----------------------------------------------------------一层c
:a8_main
set %a8_str1%=%1
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
处理的特殊字符:" ! ^ & | < > %
rem ----------------------------------------------------------脚本说明 end
::脚本说明 end
::属性说明
【调用-被调用】:被调用
【文件功能类 】:变量处理
【文件名称   】:变量处理_变量中的特殊字符标记
【参数说明   】:
%1、%2参数无意义
%3为要处理的变量名
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
:a9
@echo off
if "%~2"=="" (
echo,&echo,%%2参数为空!
ping /n 2 127.1>nul
goto exit
)
rem ■将文件拖到批处理时，批处理会运行，但%2参数为空，利用这点来判断批处理是"拖动文件到程序"的调用方式(故其它调用中%2参数必须不为空)
::主代码
rem ----------------------------------------------------------主代码
set a9_str1=%3
if not defined %3 (
cls&echo,&echo,错误,变量【%3】没有定义!&pause
goto exit
)
setlocal EnableDelayedExpansion
set !a9_str1!=!%a9_str1%:引_号=^^^^^^^"!
set !a9_str1!=!%a9_str1%:转_义=^^^^^^^^!
set !a9_str1!=!%a9_str1%:并_且=^^^^^^^&!
set !a9_str1!=!%a9_str1%:或_者=^^^^^^^|!
set !a9_str1!=!%a9_str1%:小_于=^^^^^^^<!
set !a9_str1!=!%a9_str1%:大_于=^^^^^^^>!
set !a9_str1!=!%a9_str1%:百_分_号=%%!
set !a9_str1!=!%a9_str1%:空_格= !
rem ■set !a9_str1!=!%a9_str1%:左_括=^(!
rem ■set !a9_str1!=!%a9_str1%:右_括=^)!
>a9_临时文件.txt echo,!%a9_str1%!
endlocal
for /f "tokens=*" %%i in (a9_临时文件.txt) do (
set a9_str2=%%i
)
set %a9_str1%=%a9_str2:感_叹_号=!%
set a9_str1=
set a9_str2=
goto:eof
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
echo,%变量名%能显示变量
rem ----------------------------------------------------------脚本说明 end
::脚本说明 end
::属性说明
【调用-被调用】:被调用
【文件功能类 】:变量处理
【文件名称   】:a9_变量处理3_还原特殊字符标记
【参数说明   】:
%1、%2参数无意义
%3参数为变量名
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
