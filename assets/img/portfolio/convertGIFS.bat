@echo off
setlocal enabledelayedexpansion

:: Ruta de ffmpeg (ajusta si es necesario)
set FFMPEG="ffmpeg.exe"

:: Recorre todos los archivos .gif de forma recursiva
for /r %%f in (*.gif) do (
    echo Procesando: %%f
    set "output_path=%%~dpnf.webp"
    %FFMPEG% -i "%%f" -vf "format=yuv420p" -loop 0 -lossless 0 -compression_level 6 -q:v 75 "!output_path!"
    echo Conversión completada: !output_path!
)

echo Todos los archivos .gif han sido procesados.
pause