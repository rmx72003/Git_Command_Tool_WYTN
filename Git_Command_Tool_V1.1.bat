@ECHO OFF
REM COLOR 2F
TITLE GIT COMMAND TOOL V1.1
ECHO =============================================
ECHO @  Git Command Tool                         @
ECHO @                                           @
ECHO @  1 = First push                           @
ECHO @  2 = Modify                               @
ECHO @  3 = Clone                                @
ECHO @                          Powered by Robin @
ECHO =============================================
REM 判斷local端有無vcs需要的資料夾，如果沒有則建立資料夾
IF NOT EXIST "D:\center\vcs\PROD" MKDIR "D:\center\vcs\PROD"
IF NOT EXIST "D:\center\vcs\PREV" MKDIR "D:\center\vcs\PREV"
IF NOT EXIST "D:\center\vcs\DEV" MKDIR "D:\center\vcs\DEV"
SET /P MODE="Please input mode:"
IF "%MODE%"=="1" GOTO FIRSTPUSH
IF "%MODE%"=="2" GOTO MODIFY
IF "%MODE%"=="3" GOTO CLONE
GOTO :EOF

:FIRSTPUSH
CLS
REM 輸入本機路徑
SET /P PRJPATH="Input project path (Local): "
REM D:\center\model\YV3_DELTA_LAKE_2cell_B91.02610.0090_2204
IF NOT EXIST "%PRJPATH%" EXIT
CD /D "%PRJPATH%"

REM 輸入git專案路徑
SET /P GITPRJ="Git project (Server .git): "
IF "%GITPRJ%" =="" EXIT
REM 設定Git使用者
SET /P AUTHOR="Input ID: "
IF "%AUTHOR%" =="" EXIT
REM ex. http://172.18.253.33:9881/10911631/yv3-dl_b91.02610.0090.git
ECHO =================================================================
ECHO Current path is: %PRJPATH%
ECHO ID is: %AUTHOR%
ECHO Current Project is: %GITPRJ%
ECHO =================================================================
PAUSE
CLS

ECHO git config --global user.name "%AUTHOR%"
git config --global user.name "%AUTHOR%"
REM ECHO git config --global user.email "%AUTHOR% <>"
git config --global user.email "%AUTHOR% <>"

REM 執行git上拋
ECHO git init
git init
ECHO git remote add origin http://172.18.253.33:9881/10911631/%GITPRJ%.git
git remote add origin http://172.18.253.33:9881/10911631/%GITPRJ%.git
ECHO git add .
git add .
ECHO git commit -m "Initial commit"
git commit -m "Initial commit"
ECHO git push -u origin master
git push -u origin master
ECHO =================================================================
ECHO [First push done.]
ECHO =================================================================
PAUSE
EXIT

:MODIFY
REM 輸入本機路徑
SET /P PRJPATH="Input project path (Local): "
REM ex. D:\center\model\YV3_DELTA_LAKE_2cell_B91.02610.0090_2204
IF NOT EXIST "%PRJPATH%" EXIT
CD /D "%PRJPATH%"

REM 執行修改程式後git上拋指令
REM ECHO git status
REM git status
REM ECHO git log
REM git log

REM 設定Git使用者
SET /P AUTHOR="Input ID: "
IF "%AUTHOR%"=="" EXIT

REM 輸入描述
SET /P REASON="Input change reason: "
IF "%REASON%"=="" EXIT
ECHO =================================================================
ECHO Current path is: %PRJPATH%
ECHO ID is: %AUTHOR%
ECHO Change reason is: %REASON%
ECHO =================================================================
PAUSE
CLS

ECHO git add -A
git add -A
ECHO git commit -m "%REASON%"
git commit --author="%AUTHOR% <>" -m "%REASON%" 
REM ex. git commit –m “Update”
ECHO git push
git push
ECHO =================================================================
ECHO [Modify push done.]
ECHO =================================================================
PAUSE
EXIT

:CLONE
REM 輸入git專案路徑
SET /P CLONEPRJ="Clone project (Server .git): "
IF "%CLONEPRJ%" =="" EXIT
REM ECHO ex. http://172.18.253.33:9881/10911631/yv3-dl_b91.02610.0090.git

CD /D "D:\center\vcs\DEV\"
REM ECHO =================================================================
REM ECHO Current path is: %PRJPATH%
REM ECHO =================================================================
REM echo.
REM 
REM Clone專案到LOCAL電腦
ECHO git clone %CLONEPRJ%
git clone http://172.18.253.33:9881/10911631/%CLONEPRJ%.git
ECHO =================================================================
ECHO [Clone done.]
ECHO =================================================================
PAUSE
EXIT