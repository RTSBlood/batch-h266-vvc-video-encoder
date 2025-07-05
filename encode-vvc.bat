@echo off
chcp 65001 >nul
title VVC (H.266) Encoder - FFmpeg + libvvenc

echo === VVC (H.266) Encoder using FFmpeg ===
echo.

:: Step 0 - Prepare dated output folder
for /f "tokens=2 delims==." %%A in ('"wmic os get localdatetime /value"') do set datetime=%%A
set "datestr=%datetime:~0,4%-%datetime:~4,2%-%datetime:~6,2%"
set "outputDir=outputs\%datestr%"
if not exist "%outputDir%" mkdir "%outputDir%"

:: Step 1 - Enter video file(s)
echo.
echo ── Input Files ──
echo Enter one or more file paths, each enclosed in quotes if it contains spaces.
echo Example: "C:\Videos\My File.mp4" "OtherFile.mov"
set /p "files=Enter input file(s): "

:: Step 2 - Choose encoding speed (preset)
echo.
echo ── Encoding speed vs compression quality ──
echo 1 - faster
echo 2 - fast
echo 3 - medium (balanced)
echo 4 - slow
echo 5 - slower
set /p "presetNum=Your choice (1-5): "

set "preset=medium"
if "%presetNum%"=="1" set preset=faster
if "%presetNum%"=="2" set preset=fast
if "%presetNum%"=="3" set preset=medium
if "%presetNum%"=="4" set preset=slow
if "%presetNum%"=="5" set preset=slower

:: Step 3 - Choose quality control mode
echo.
echo ── Quality Control Mode ──
echo 1 - QP (Constant Quality, from 0 = lossless to 63 = highly compressed)
echo     ▶ Recommended: 22 (high quality) to 37 (smaller size)
echo 2 - Bitrate (e.g.: 3000k = 3 Mbps)
set /p "mode=Your choice (1-2): "

if "%mode%"=="1" (
    set /p "qp=Enter QP value (0 to 63): "
) else (
    set /p "bitrate=Enter target bitrate (e.g.: 3000k): "
)

:: Step 4 - GOP period (intra refresh interval)
echo.
set /p "period=Enter GOP period (e.g.: 10, typical values 1-30): "

:: Step 5 - Output file extension
echo.
echo ── Output Format ──
set /p "ext=Enter output file extension (e.g.: mp4, mkv, mov): "

echo.
echo ▶ Encoding...

:: Enable delayed expansion once globally
setlocal enabledelayedexpansion

:: Loop through each input path safely
for %%F in (%files%) do (
    set "input=%%~F"
    set "filename=%%~nF"
    set "extin=%%~xF"

    if "%mode%"=="1" (
        ffmpeg -i "!input!" -c:v libvvenc -preset %preset% -period %period% -qp %qp% -c:a copy "%outputDir%\!filename!-h266.%ext%"
    ) else (
        ffmpeg -i "!input!" -c:v libvvenc -preset %preset% -period %period% -b:v %bitrate% -c:a copy "%outputDir%\!filename!-h266.%ext%"
    )
)

echo.
echo ✅ Encoding complete. Files saved in: %outputDir%
pause
