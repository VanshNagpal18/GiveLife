@echo off
setlocal enabledelayedexpansion

REM Get current script directory
set SCRIPT_DIR=%~dp0
set JAVAFX_DIR=%SCRIPT_DIR%javafx
set JAVAFX_URL=https://download2.gluonhq.com/openjfx/21.0.6/openjfx-21.0.6_windows-x64_bin-sdk.zip
set ZIP_FILE=%JAVAFX_DIR%\file.zip

REM Check if JavaFX is already installed
if not exist "%JAVAFX_DIR%" (
    echo Directory %JAVAFX_DIR% does not exist. Creating it...
    mkdir "%JAVAFX_DIR%"

    echo Downloading JavaFX SDK...
    powershell -Command "Invoke-WebRequest -Uri '%JAVAFX_URL%' -OutFile '%ZIP_FILE%'"

    if exist "%ZIP_FILE%" (
        echo Download successful. Extracting ZIP file...
        powershell -Command "Expand-Archive -Path '%ZIP_FILE%' -DestinationPath '%JAVAFX_DIR%'"

        echo Cleaning up ZIP file...
        del "%ZIP_FILE%"

        echo Done!
    ) else (
        echo Download failed!
        echo Please install JavaFX 21.0.6 [LTS] SDK manually in the javafx directory.
        exit /b
    )
) else (
    echo JavaFX is installed, skipping download.
)

REM Set path to JavaFX libs
set PATH_TO_FX_LIBS=%JAVAFX_DIR%\javafx-sdk-21.0.6\lib

REM Compile the Java application
javac --module-path "%PATH_TO_FX_LIBS%" --add-modules javafx.controls,javafx.fxml,javafx.web WebApp.java

REM Run the Java application
java --module-path "%PATH_TO_FX_LIBS%" --add-modules javafx.controls,javafx.fxml,javafx.web WebApp

