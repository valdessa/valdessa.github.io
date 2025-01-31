@echo off
setlocal enabledelayedexpansion

:: Ruta de ffmpeg (ajusta si es necesario)
set FFMPEG="ffmpeg.exe"

:: Recorre todos los archivos .jpg de forma recursiva
for /r %%f in (*.jpg) do (
    echo Procesando: %%f
    set "output_path=%%~dpnf.webp"
    %FFMPEG% -i "%%f" -q:v 75 -map_metadata -1 "!output_path!"
    echo Conversión completada: !output_path!
)

echo Todos los archivos .jpg han sido procesados.
pause