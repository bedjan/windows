@echo off
setlocal enabledelayedexpansion

:: Nastaveni URL pro yt-dlp
set "yturl=https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe"
set "ytdlp=yt-dlp.exe"

echo -------------------------------------------
echo Kontrola yt-dlp...
echo -------------------------------------------

:: Kontrola, zda existuje yt-dlp.exe
if not exist "%ytdlp%" (
    echo yt-dlp nebyl nalezen, stahuji novou verzi...
    powershell -Command "Invoke-WebRequest '%yturl%' -OutFile '%ytdlp%'"
) else (
    echo yt-dlp nalezen, kontroluji aktualizaci...
    for /f "delims=" %%v in ('"%ytdlp%" --version 2^>nul') do set "oldver=%%v"
    "%ytdlp%" -U >nul 2>&1
    for /f "delims=" %%v in ('"%ytdlp%" --version 2^>nul') do set "newver=%%v"

    if defined oldver if defined newver (
        if /i "!oldver!"=="!newver!" (
            echo yt-dlp je aktualni. Pokracuji...
        ) else (
            echo yt-dlp byl aktualizovan z verze !oldver! na !newver!
        )
    )
)

:: Kontrola, zda se soubor skutecne stahl
if not exist "%ytdlp%" (
    echo !!! Nelze stahnout yt-dlp, zkontroluj pripojeni.
    pause
    exit /b
)

:: Ziskani odkazu ze schranky
for /f "delims=" %%a in ('powershell -command "Get-Clipboard"') do set "url=%%a"

if "%url%"=="" (
    echo Schranka je prazdna nebo neobsahuje platny odkaz.
    pause
    exit /b
)

echo -------------------------------------------
echo Stahuji video z: %url%
echo -------------------------------------------

:: Nastaveni vystupni slozky
set "outputdir=%USERPROFILE%\Videos\YouTube"
if not exist "%outputdir%" mkdir "%outputdir%"

:: Spusteni yt-dlp
"%ytdlp%" -o "%outputdir%\%%(title)s.%%(ext)s" "%url%"

:: Kontrola, zda se neco stahlo
echo Kontroluji uspesnost stahovani...
set "found="

for %%f in ("%outputdir%\*") do (
    if %%~zf gtr 100000 set "found=1"
)

if not defined found (
    echo !!! Stahovani selhalo nebo byl soubor prilis maly.
    echo Zkousim znovu...
    "%ytdlp%" -o "%outputdir%\%%(title)s.%%(ext)s" "%url%"
    echo Kontroluji znovu...
    set "found="
    for %%f in ("%outputdir%\*") do (
        if %%~zf gtr 100000 set "found=1"
    )
    if not defined found (
        echo !!! Ani druhy pokus se nezdaril. Zkontroluj pripojeni nebo URL.
        pause
        exit /b
    )
)

echo -------------------------------------------
echo Video bylo uspesne stazeno!
echo -------------------------------------------

timeout /t 2 >nul
start explorer "%outputdir%"
pause
