@echo off
pushd ..
popd
set D28_message="%~n0"
set D28_pathmb="%~dp0"
set D28_pathmb=%D28_pathmb:~0,-4%
pushd %D28_pathmb%
::主代码
rem ----------------------------------------------------------主代码
:D28_start

ping /n 127.1>nul
echo,登陆验证...(请输入z)
setlocal EnableDelayedExpansion
echo,z|choice /c abcdefghijklmnopqrstuvwxyz>nul
echo,%errorlevel%
endlocal
echo,%errorlevel%
if not "%errorlevel%"=="26" (
	goto D28_start
)

cls
for /l %%i in (1,1,1) do (
	call :D28_speak
)
echo,
echo,Oracle数据库批量导入dmp文件

echo,说明：1、dmp文件放入批处理所在文件夹
echo,      2、文件名只能是配置当中的名称
echo,请按任意键开始
pause>nul

if not exist D28_临时文件夹 (
	md D28_临时文件夹
)
cd.>D28_临时文件夹\日志.txt


rem 非配置文件配置
call a\a26_dpdump.bat D28_Oracle.directory 1
cls
rem set D28_Oracle.directory=D:\oracle10g\admin\orcl\dpdump
set D28_Oracle.dbaName=sys
set D28_Oracle.dbaPwd=orcl
set D28_Oracle.dbaDatabase=orcl

rem 加载用户信息
call a\a18_SimpleTable.bat "%~0" ::D28_userdata D28_users
echo,%users.list[]%



rem 用户选择要导入的文件
for /l %%i in (1,1,%D28_users.list[]%) do (
	call :D28_STRING.show %%i %%D28_users.list[%%i].name%%
)
echo,请输入要导入的用户
echo,例[]  输入1 2 3 4(注意：不要重复)
set /p D28_string$=

rem 导入dmp文件

set D28_string=
for /l %%i in (1,1,%D28_users.list[]%) do (
	call :D28_String.append %%i
)

set D28_num=1
for %%i in (%D28_string$%) do (
	call :D28_ORACLE.impdp %%D28_users.list[%%i].name%% %%D28_users.list[%%i].pwd%% %%D28_users.list[%%i].database%% %%D28_users.list[%%i].tablespace%%
)

pause
exit
::一层c
rem ----------------------------------------------------------一层c
::函数1
:D28_STRING.show
echo,%1、%2
goto :eof

:D28_speak
rem mshta vbscript:createobject("sapi.spvoice").speak("欢迎使用 and merry christmas and happy new year!")(window.close)
rem mshta vbscript:createobject("sapi.spvoice").speak("朱小青")(window.close)
goto :eof




:D28_String.append

if "%D28_string%"=="" (
	set D28_string=%1
) else (
	set D28_string=%D28_string% %1
)
goto :eof

:D28_ORACLE.impdp
ping /n 4 127.1>nul
cls
echo,正在导入第%D28_num%个(共%D28_user.count%)%1.dmp...
if not exist "%~dp0""%~1".dmp (
	>>D28_临时文件夹\日志.txt echo,%1.dmp文件不存在
	echo,提示：文件不存在---%1.dmp
	echo,请查看日志文件!
	ping /n 2 127.1>nul
	goto :eof
)
echo,一、删除用户
echo,1、生成重建用户sql文件
(echo,drop user %1 cascade;
echo,create user %1 identified by %1 default tablespace zhbg;
echo,grant connect,resource to %1;
echo,grant dba to %1;
echo,exit;
)>D28_临时文件夹\D28_dropUser.sql
echo,2、执行sql，重建用户
sqlplus sys/orcl as sysdba@orcl @D28_临时文件夹\D28_dropUser.sql
echo,二、拷贝文件
echo,1、删除旧文档
if exist %D28_Oracle.directory%\%1.dmp (
	del %D28_Oracle.directory%\%1.dmp
)
echo,2、拷贝文件
copy "%~dp0""%~1".dmp %D28_Oracle.directory%
echo,三、导入文件(屏蔽输出)...
::1>nul 2>nul @impdp %1/%1 dumpfile=%1.dmp logfile=%1.log
impdp %1/%2 dumpfile=%1.dmp logfile=%1.log
set /a D28_num=%D28_num%+1
goto :eof
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

rem 配置文件配置
rem 用户表
::D28_userdata
name;pwd;database;tablespace
zjdms;zjdms;orcl;zhbg
zjucap;zjucap;orcl;zhbg
zjcore;zjcore;orcl;zhbg
zjcmis;zjcmis;orcl;zhbg
zjmail;zjmail;orcl;zhbg
zjodps;zjodps;orcl;zhbg
zjzhbg;zjzhbg;orcl;zhbg
::D28_userdata_end

rem ----------------------------------------------------------主代码 end
::主代码 end