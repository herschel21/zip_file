@echo off
setlocal

:: Create a base directory for all extracted files
set "base_dir=extracted_files"
mkdir "%base_dir%"

:: Process each file
for %%i in (*.*) do (
    if exist "%%i" (
        set "ext=%%~xi"
        set "filename=%%~ni"
        
        :: Create a subdirectory within the base directory for each file
        mkdir "%base_dir%\%filename%"

        :: Handle different file types
        if /I "%ext%"==".zip" (
            echo Extracting %%i to %base_dir%\%filename%
            powershell -command "Expand-Archive -Path '%%i' -DestinationPath '%base_dir%\%filename%'"
        ) else if /I "%ext%"==".tar" (
            echo Extracting %%i to %base_dir%\%filename%
            tar -xf "%%i" -C "%base_dir%\%filename%"
        ) else if /I "%ext%"==".gz" (
            echo Extracting %%i to %base_dir%\%filename%
            powershell -command "Expand-Archive -Path '%%i' -DestinationPath '%base_dir%\%filename%'"
        ) else if /I "%ext%"==".bz2" (
            echo Extracting %%i to %base_dir%\%filename%
            powershell -command "Expand-Archive -Path '%%i' -DestinationPath '%base_dir%\%filename%'"
        ) else if /I "%ext%"==".xz" (
            echo Extracting %%i to %base_dir%\%filename%
            powershell -command "Expand-Archive -Path '%%i' -DestinationPath '%base_dir%\%filename%'"
        ) else if /I "%ext%"==".7z" (
            echo Extracting %%i to %base_dir%\%filename%
            7z x "%%i" -o"%base_dir%\%filename%"
        ) else (
            echo Unsupported file type: %%i
        )
    )
)

endlocal

