@echo off
Title "create ReactNative Basic Setup"
echo ============ Welcome React Native App Setup ===============
echo create ReactNative Basic Setup
echo .

ECHO This is your folder and also app name
set /p id="Enter App Name : "
ECHO Example - com.radio.english
set /p pakage="Pakage Name : "

echo ======== Developed By Rps Robosoft Technologies ===========
echo .
echo "================ www.rpsrobosoft.com ======================"

CMD /C "npx react-native init %id%" i --loglevel error 


cd /d %id% && dir

echo Pakage update start 

@ECHO OFF
:: Folder Means Pakage Name
set "Folder=%pakage%"
:: OldFolder is defalt name 
set "OldFolder=%id%"
cls
ECHO Start

set str=%Folder:.=\%

:: Build Gradle update
@echo off
setlocal EnableExtensions EnableDelayedExpansion
set "INTEXTFILE=android\app\build.gradle"
set "OUTTEXTFILE=android\app\buildnew.gradle"
set "SEARCHTEXT=com.%OldFolder%"
set "REPLACETEXT=%Folder%"

for /f "delims=" %%A in ('type "%INTEXTFILE%"') do (
    set "string=%%A"
    set "modified=!string:%SEARCHTEXT%=%REPLACETEXT%!"
    echo !modified!>>"%OUTTEXTFILE%"
)

del "%INTEXTFILE%"

ren android\app\buildnew.gradle build.gradle
endlocal
ECHO Build Gradle update Done
:: Create folder
@md "android\app\src\main\java\"%str%
:: 
robocopy android\app\src\main\java\com\%OldFolder% android\app\src\main\java\%str%\  /E
:: Remove Unused file
del "android\app\src\main\java\com\%OldFolder%\MainActivity.java"
del "android\app\src\main\java\com\%OldFolder%\MainApplication.java"
@RD /S /Q "android\app\src\main\java\com\%OldFolder%"

:: MainActivity.java pakage change
setlocal EnableExtensions EnableDelayedExpansion
set "MainActivityINTEXTFILE=android\app\src\main\java\%str%\MainActivity.java"
set "MainActivityOUTTEXTFILE=android\app\src\main\java\%str%\MainActivitynew.java"
set "MainActivitySEARCHTEXT=com.%OldFolder%"
set "MainActivityREPLACETEXT=%Folder%"

for /f "delims=" %%A in ('type "%MainActivityINTEXTFILE%"') do (
    set "string=%%A"
    set "modified=!string:%MainActivitySEARCHTEXT%=%MainActivityREPLACETEXT%!"
    echo !modified!>>"%MainActivityOUTTEXTFILE%"
)

del "%MainActivityINTEXTFILE%"

ren android\app\src\main\java\%str%\MainActivitynew.java MainActivity.java
endlocal
:: end of MainActivity.java pakage change
ECHO MainActivity.java update Done
:: MainApplication.java pakage change
setlocal EnableExtensions EnableDelayedExpansion
set "MainApplicationINTEXTFILE=android\app\src\main\java\%str%\MainApplication.java"
set "MainApplicationOUTTEXTFILE=android\app\src\main\java\%str%\MainApplicationnew.java"
set "MainApplicationSEARCHTEXT=com.%OldFolder%"
set "MainApplicationREPLACETEXT=%Folder%"

for /f "delims=" %%A in ('type "%MainApplicationINTEXTFILE%"') do (
    set "string=%%A"
    set "modified=!string:%MainApplicationSEARCHTEXT%=%MainApplicationREPLACETEXT%!"
    echo !modified!>>"%MainApplicationOUTTEXTFILE%"
)

del "%MainApplicationINTEXTFILE%"

ren android\app\src\main\java\%str%\MainApplicationnew.java MainApplication.java
endlocal
:: end of MainApplication.java pakage change
ECHO MainApplication.java update Done
:: AndroidManifest
@echo off
setlocal EnableExtensions EnableDelayedExpansion
set "INTEXTFILE=android\app\src\main\AndroidManifest.xml"
set "OUTTEXTFILE=android\app\src\main\AndroidManifestnew.xml"
set "SEARCHTEXT=com.%OldFolder%"
set "REPLACETEXT=%Folder%"

for /f "delims=" %%A in ('type "%INTEXTFILE%"') do (
    set "string=%%A"
    set "modified=!string:%SEARCHTEXT%=%REPLACETEXT%!"
    echo !modified!>>"%OUTTEXTFILE%"
)

del "%INTEXTFILE%"

ren android\app\src\main\AndroidManifestnew.xml AndroidManifest.xml
endlocal

::::::::: end AndroidManifest.xml
ECHO AndroidManifest.xml update Done
:: BUCK
@echo off
setlocal EnableExtensions EnableDelayedExpansion
set "INTEXTFILE=android/app/BUCK"
set "OUTTEXTFILE=android/app/BUCKnew"
set "SEARCHTEXT=com.%OldFolder%"
set "REPLACETEXT=%Folder%"

for /f "delims=" %%A in ('type "%INTEXTFILE%"') do (
    set "string=%%A"
    set "modified=!string:%SEARCHTEXT%=%REPLACETEXT%!"
    echo !modified!>>"%OUTTEXTFILE%"
)

del "%INTEXTFILE%"

ren android\app\src\main\BUCKnew BUCK
endlocal

::::::::: end BUCK
ECHO BUCK update Done

:: robocopy D:\batch-files\create-react-app\ %mypath:~0,-1%\%id%\  /E

ECHO ==========================================
ECHO Setup Done
ECHO Run Command >> react-native run-android
ECHO press and key to exit ............
pause "Press any key to continue . . ."