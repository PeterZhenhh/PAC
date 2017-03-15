@echo off
mode con cols=60 lines=20
taskkill /f /im ShadowsocksR-dotnet2.0.exe
taskkill /f /im ShadowsocksR-dotnet4.0.exe
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v AutoConfigURL /t REG_DWORD /d 1 /f
cls
title 主菜单
echo 一键配置PAC翻墙
echo 不限流量 尽情享用
echo Powered by Zhen
pause
cls

:begin 
cls
echo 版本：V1.3.2
echo 服务器更新日期：20170315
echo 软件更新日期：20170315
echo        0.手动输入PAC地址
echo        1.日本ARUKAS服务器(自建) New！
echo        2.日本ARUKAS服务器
echo 电信→ 3.美国服务器1
echo 电信→ 4.itzmx服务器(需要登录)
echo        5.日本LINODE服务器（仅支持IPV6） Beta！
echo        reset.恢复默认配置
echo        log.更新日志
echo 已关闭shadowsocks(r)避免冲突
echo.
set/p n=      请选择：
if %n%==0 goto pac0
if %n%==1 goto pac1
if %n%==2 goto pac2
if %n%==3 goto pac3
if %n%==4 goto pac4
if %n%==5 goto pac5
if %n%==reset goto reset
if %n%==log goto log
goto begin

:pac0
cls
title 手动输入PAC地址
set pac0=
set /p pac0=请输入PAC地址:
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "AutoConfigURL" /d "%pac0%" /f
title 已完成！
goto finish


:pac1
cls
title 日本服务器(自建)
echo 请选择获取PAC配置文件加载地址
echo        1.从GITHUB加载
echo        2.从rhcloud加载
echo        back.返回主菜单
set/p m=      请选择(0-5)：
if %m%==1 goto pac1-1
if %m%==2 goto pac1-2
if %m%==back goto begin

:pac1-1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "AutoConfigURL" /d "http://raw.githubusercontent.com/PeterZhenhh/goproxy/master/ARUKAS.pac" /f
title 已完成！
goto finish

:pac1-2
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "AutoConfigURL" /d "http://dsproxy-malaohu.rhcloud.com/http/pac/auto?proxy=HTTPS third-prison-zhen-pac.arukascloud.io" /f
title 已完成！
goto finish

:pac2
cls
title 备用日本服务器(不支持低版本IE)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "AutoConfigURL" /d "http://raw.githubusercontent.com/Tuaba/PAC/master/arukas.pac" /f
title 已完成！
goto finish

:pac3
cls
title 美国服务器
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "AutoConfigURL" /d "http://raw.githubusercontent.com/Tuaba/PAC/master/us.pac" /f
title 已完成！
goto finish

:pac4
cls
title itzmx服务器(需要登录)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "AutoConfigURL" /d "http://pac.itzmx.com/abc.pac" /f
title 已完成！
echo 帐号：root
echo 密码：pac.itzmx.com 
goto finish

:pac5
cls
title 日本LINODE服务器（仅支持IPV6）
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "AutoConfigURL" /d "http://raw.githubusercontent.com/Tuaba/PAC/master/jp.pac" /f
echo 如无法正常使用则说明不支持IPV6 请选择其它节点
pause
title 已完成！
goto finish



:reset
cls
title 正在恢复默认配置0%%
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f
title 已完成！
cls
正在恢复默认配置25%%
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v AutoConfigURL /t REG_DWORD /d 0 /f
cls
title 正在恢复默认配置50%%
ipconfig /release
cls
title 正在恢复默认配置75%%
ipconfig /renew
cls
title 正在恢复默认配置100%%
ipconfig /flushdns
cls
echo 请在下一步的面板中点击“连接”选项卡并点击确定后设置立刻生效
pause
inetcpl.cpl
goto begin

:finish
cls
echo 请在下一步的面板中点击“连接”选项卡并点击确定后设置立刻生效
pause
inetcpl.cpl
exit

:log
cls
echo 20170113 V1.2 新增自定义PAC地址、更新日志，完善了恢复默认配置
echo 20170218 V1.3 优化了配置方式 设置立即生效且无需重启浏览器
echo 20170206 V1.3.1 修复了日本服务器1失效的问题、重命名美国服务器2为itzmx服务器
echo 20170315 V1.3.2 新增自建ARUKAS服务器配置文件获取地址选择 新增日本Linode服务器
pause
goto begin
