@echo off
chcp 65001 >nul

REM 設定範例基礎 URL 與輸出目錄
set "base_url=https://example.com/path/to/m3u8-file"
set "output_dir=.\下載資料夾"
set "file_name=【來源】範例影片[集數][720P].mp4"

REM 提供下載選項
echo 選擇要下載的模式:
echo [1] - 一般下載
echo [2] - 處理需要協議白名單的 M3U8 播放清單
set /p mode="請輸入選項編號並按 Enter: "

if "%mode%"=="1" (
    REM 一般下載模式
    ffmpeg -i "%base_url%/index.m3u8" -c copy "%output_dir%\%file_name%"
    echo 影片已下載至 "%output_dir%\%file_name%"
) else if "%mode%"=="2" (
    REM 處理協議白名單的 M3U8 播放清單
    ffmpeg -protocol_whitelist file,http,https,tcp,tls,crypto -i "%base_url%/index.m3u8" -c copy -bsf:a aac_adtstoasc "%output_dir%\%file_name%"
    echo 協議白名單處理模式已完成，影片已下載至 "%output_dir%\%file_name%"
) else (
    echo 選項無效，請重新執行腳本。
)

set /p asd="按下 Enter 繼續"

REM 如果要自動關機，取消下面的註解
REM shutdown.exe -s -t 10
