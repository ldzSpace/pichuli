@echo off
if "%~2"=="" (
echo,&echo,%%2参数为空!
ping /n 2 127.1>nul
goto exit
)
rem ■将文件拖到批处理时，批处理会运行，但%2参数为空，利用这点来判断批处理是"拖动文件到程序"的调用方式(故其它调用中%2参数必须不为空)
::主代码
rem ----------------------------------------------------------主代码
rem 一、调用此批处理可以将一个变量的值赋值给另外一个变量
rem     另外，也可以就爱那个变量的值赋值给自身，然后将值进行显示输出或者重定向
rem 
rem 二、参数1表示被复制值的变量名称，参数2表示接收值的变量名
rem 
rem 三、调用方式
rem 
rem 四、返回值使用方法
rem %接受变量名.showvalue%，可用来输出环境变量的值，值中的特殊符号已做转义处理
rem %接受变量名.truevalue%, 环境变量原来的值
rem 
rem 五、操作手册
rem 1、显示或者重定向含有特殊符号的环境变量
rem 2、经变量赋值给另外一个变量
rem 
rem 六、原理分析
rem 利用call的双重扩展变量的特性实现只需要将变量名作为参数传入就可以取得变量值，优点是简化代码书写，缺点是效率较低(call会进行两次变量扩展)，如果要提高效率，可以参考本文件最后的例子
rem 批处理变量扩展的优先顺序
rem 参数扩展--->环境变量的%扩展--->for()变量扩展--->(若开启变量延迟扩展)环境变量的!扩展
rem call-后面的代码以上的扩展过程会进行两次
rem 
set a38_source.name=%1
set a38_target.name=%2




rem 设置方法参数
set a38_varcopy.args.targetname=%a38_target.name%
rem 调用方法
call :a38_varcopy "%%%a38_source.name%:"=" "%%"
call :a38_varcopy2 "%%%a38_source.name%:"=" "%%"
rem 清空环境变量
call a\a33_clearvar.bat a38_ 1
goto :eof



:a38_varcopy
set a38_linshi=%*
set a38_linshi=%a38_linshi:^=^^^^^^^^^^^^^^^^%
set a38_linshi=%a38_linshi:&=^^^^^^^^^^^^^^^&%
set a38_linshi=%a38_linshi:|=^^^^^^^^^^^^^^^|%
set a38_linshi=%a38_linshi:>=^^^^^^^^^^^^^^^>%
set a38_linshi=%a38_linshi:<=^^^^^^^^^^^^^^^<%
set a38_linshi=%a38_linshi:~1,-1%
rem set a38_linshi=%a38_linshi:" "=^^^^^^^"%
set a38_linshi=%a38_linshi:" "=%
set %a38_varcopy.args.targetname%.showPathWithoutYh=%a38_linshi%
set a38_linshi=%a38_linshi%
set %a38_varcopy.args.targetname%.truePathWithoutYh=%a38_linshi%
goto :eof

:a38_varcopy2
set a38_linshi=%*
rem set a38_linshi=%a38_linshi:~1,-1%
set a38_linshi=%a38_linshi:" "=%
set a38_linshi=%a38_linshi%
set %a38_varcopy.args.targetname%.showPathWithYh=%a38_linshi%
set %a38_varcopy.args.targetname%.truePathWithYh=%a38_linshi%
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

::varcopy高效例子
rem 变量名不能动态改变，针对特定的变量
@echo off
:start
set /p a=
set linshi="%a:"=" "%"
set linshi=%linshi:^=^^^^^^^^^^^^^^^^%
set linshi=%linshi:&=^^^^^^^^^^^^^^^&%
set linshi=%linshi:|=^^^^^^^^^^^^^^^|%
set linshi=%linshi:>=^^^^^^^^^^^^^^^>%
set linshi=%linshi:<=^^^^^^^^^^^^^^^<%
set linshi=%linshi:~1,-1%
set linshi=%linshi:" "=^^^^^^^"%
set b.showvalue=%linshi%
set b.truevalue=%b.shovalue%
echo,%b.showvalue%
goto :start
::varcopy高效例子 end


::goto
rem ----------------------------------------------------------goto
:exit
cls
echo,&echo,即将退出!
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------goto end
::goto end
