@echo off
set arr[1]=d
set arr[2]=e
set arr[3]=f
set arr[4]=h
set arr[].length=4

set tempdir=��ȡ����exe·��
set log=����exe·��.txt

for /l %%i in (1,1,%arr[].length%) do (
	call :main %%arr[%%i]%%
)
pause
exit


rem �����������̷���ȡ�����������е�exe�ļ�·��API
rem 
:main
set panfu=%1
echo,%panfu%
for /f "tokens=*" %%i in ('dir /b/s %panfu%:\*.exe') do (
	echo,%%i
)
goto :eof

