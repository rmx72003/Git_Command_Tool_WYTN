@echo off
REM color 2f
title Git Command Tool V1.0
echo =============================================
echo @  Git Command Tool                         @
echo @                                           @
echo @  1 = First push                           @
echo @  2 = Modify                               @
echo @  3 = Clone                                @
echo @                          Powered by Robin @
echo =============================================
REM 判斷local端有無vcs需要的資料夾，如果沒有則建立資料夾
IF NOT EXIST "D:\center\vcs\PROD" mkdir "D:\center\vcs\PROD"
IF NOT EXIST "D:\center\vcs\PREV" mkdir "D:\center\vcs\PREV"
IF NOT EXIST "D:\center\vcs\DEV" mkdir "D:\center\vcs\DEV"


set /p MODE="Please input mode:"
goto Run
:Run
if "%MODE%"=="1" goto Firstpush
if "%MODE%"=="2" goto Modify
if "%MODE%"=="3" goto Clone
goto :eof

:Firstpush
REM 輸入本機路徑
set /p PRJPATH="Input project path (Local): "
REM D:\center\model\YV3_DELTA_LAKE_2cell_B91.02610.0090_2204
IF NOT EXIST "%PRJPATH%" (
ECHO Folder not exist
PAUSE
exit
)
cd /D "%PRJPATH%"
echo =================================================================
echo Current path is: %PRJPATH%
echo =================================================================
echo.

REM 輸入git專案路徑
set /p GITPRJ="Git project (Server .git): "
IF "%GITPRJ%" =="" exit
REM ex. http://172.18.253.33:9881/10911631/yv3-dl_b91.02610.0090.git
echo =================================================================
echo Current Project is: %GITPRJ%
echo =================================================================
pause
cls

REM 設定Git使用者
echo git config --global user.name "Robin Hu"
git config --global user.name "Robin Hu"
echo git config --global user.email "hsien_tang_hu@wiwynn.com"
git config --global user.email "hsien_tang_hu@wiwynn.com"
REM 執行git上拋
echo git init
git init
echo git remote add origin http://172.18.253.33:9881/10911631/%GITPRJ%.git
git remote add origin http://172.18.253.33:9881/10911631/%GITPRJ%.git
echo git add .
git add .
echo git commit -m "Initial commit"
git commit -m "Initial commit"
echo git push -u origin master
git push -u origin master
echo =================================================================
echo [First push done.]
echo =================================================================
pause
exit

:Modify
REM 輸入本機路徑
set /p PRJPATH="Input project path (Local): "
REM ex. D:\center\model\YV3_DELTA_LAKE_2cell_B91.02610.0090_2204
IF NOT EXIST "%PRJPATH%" (
ECHO Folder not exist
PAUSE
exit
)
cd /D "%PRJPATH%"
echo =================================================================
echo Current path is: %PRJPATH%
echo =================================================================
echo.

REM 執行修改程式後git上拋指令
REM echo git status
REM git status
REM echo git log
REM git log
REM 輸入描述
set /p REASON="Input change reason: "
if "%REASON%"=="" exit
echo =================================================================
echo Change reason is: %REASON%
echo =================================================================
pause
cls

echo git add -A
git add -A
echo git commit -m "%REASON%"
git commit -m "%REASON%"
REM ex. git commit –m “Update”
echo git push
git push
echo =================================================================
echo [Modify push done.]
echo =================================================================
pause
exit

:Clone
REM 輸入git專案路徑
set /p CLONEPRJ="Clone project (Server .git): "
IF "%CLONEPRJ%" =="" exit
REM echo ex. http://172.18.253.33:9881/10911631/yv3-dl_b91.02610.0090.git

cd /D "D:\center\vcs\DEV\"
REM echo =================================================================
REM echo Current path is: %PRJPATH%
REM echo =================================================================
REM echo.
REM 
REM Clone專案到LOCAL電腦
echo git clone %CLONEPRJ%
git clone http://172.18.253.33:9881/10911631/%CLONEPRJ%.git
echo =================================================================
echo [Clone done.]
echo =================================================================
pause
exit