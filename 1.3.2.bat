@echo off
mode con cols=60 lines=20
taskkill /f /im ShadowsocksR-dotnet2.0.exe
taskkill /f /im ShadowsocksR-dotnet4.0.exe
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v AutoConfigURL /t REG_DWORD /d 1 /f
cls
title ���˵�
echo һ������PAC��ǽ
echo �������� ��������
echo Powered by Zhen
pause
cls

:begin 
cls
echo �汾��V1.3.2
echo �������������ڣ�20170315
echo ����������ڣ�20170315
echo        0.�ֶ�����PAC��ַ
echo        1.�ձ�ARUKAS������(�Խ�) New��
echo        2.�ձ�ARUKAS������
echo ���š� 3.����������1
echo ���š� 4.itzmx������(��Ҫ��¼)
echo        5.�ձ�LINODE����������֧��IPV6�� Beta��
echo        reset.�ָ�Ĭ������
echo        log.������־
echo �ѹر�shadowsocks(r)�����ͻ
echo.
set/p n=      ��ѡ��
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
title �ֶ�����PAC��ַ
set pac0=
set /p pac0=������PAC��ַ:
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "AutoConfigURL" /d "%pac0%" /f
title ����ɣ�
goto finish


:pac1
cls
title �ձ�������(�Խ�)
echo ��ѡ���ȡPAC�����ļ����ص�ַ
echo        1.��GITHUB����
echo        2.��rhcloud����
echo        back.�������˵�
set/p m=      ��ѡ��(0-5)��
if %m%==1 goto pac1-1
if %m%==2 goto pac1-2
if %m%==back goto begin

:pac1-1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "AutoConfigURL" /d "http://raw.githubusercontent.com/PeterZhenhh/goproxy/master/ARUKAS.pac" /f
title ����ɣ�
goto finish

:pac1-2
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "AutoConfigURL" /d "http://dsproxy-malaohu.rhcloud.com/http/pac/auto?proxy=HTTPS third-prison-zhen-pac.arukascloud.io" /f
title ����ɣ�
goto finish

:pac2
cls
title �����ձ�������(��֧�ֵͰ汾IE)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "AutoConfigURL" /d "http://raw.githubusercontent.com/Tuaba/PAC/master/arukas.pac" /f
title ����ɣ�
goto finish

:pac3
cls
title ����������
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "AutoConfigURL" /d "http://raw.githubusercontent.com/Tuaba/PAC/master/us.pac" /f
title ����ɣ�
goto finish

:pac4
cls
title itzmx������(��Ҫ��¼)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "AutoConfigURL" /d "http://pac.itzmx.com/abc.pac" /f
title ����ɣ�
echo �ʺţ�root
echo ���룺pac.itzmx.com 
goto finish

:pac5
cls
title �ձ�LINODE����������֧��IPV6��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "AutoConfigURL" /d "http://raw.githubusercontent.com/Tuaba/PAC/master/jp.pac" /f
echo ���޷�����ʹ����˵����֧��IPV6 ��ѡ�������ڵ�
pause
title ����ɣ�
goto finish



:reset
cls
title ���ڻָ�Ĭ������0%%
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f
title ����ɣ�
cls
���ڻָ�Ĭ������25%%
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v AutoConfigURL /t REG_DWORD /d 0 /f
cls
title ���ڻָ�Ĭ������50%%
ipconfig /release
cls
title ���ڻָ�Ĭ������75%%
ipconfig /renew
cls
title ���ڻָ�Ĭ������100%%
ipconfig /flushdns
cls
echo ������һ��������е�������ӡ�ѡ������ȷ��������������Ч
pause
inetcpl.cpl
goto begin

:finish
cls
echo ������һ��������е�������ӡ�ѡ������ȷ��������������Ч
pause
inetcpl.cpl
exit

:log
cls
echo 20170113 V1.2 �����Զ���PAC��ַ��������־�������˻ָ�Ĭ������
echo 20170218 V1.3 �Ż������÷�ʽ ����������Ч���������������
echo 20170206 V1.3.1 �޸����ձ�������1ʧЧ�����⡢����������������2Ϊitzmx������
echo 20170315 V1.3.2 �����Խ�ARUKAS�����������ļ���ȡ��ַѡ�� �����ձ�Linode������
pause
goto begin
