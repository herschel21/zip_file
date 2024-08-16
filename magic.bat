@echo off
for %%i in (*.zip) do (
    mkdir "%%~ni"
    tar -xf "%%i" -C "%%~ni"
)

