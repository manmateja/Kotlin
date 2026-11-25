@echo off
setlocal

where gradle >nul 2>nul
if not errorlevel 1 (
    gradle %*
    exit /b %ERRORLEVEL%
)

if defined GRADLE_HOME if exist "%GRADLE_HOME%\bin\gradle.bat" (
    "%GRADLE_HOME%\bin\gradle.bat" %*
    exit /b %ERRORLEVEL%
)

if exist "%USERPROFILE%\.sdkman\candidates\gradle\current\bin\gradle.bat" (
    "%USERPROFILE%\.sdkman\candidates\gradle\current\bin\gradle.bat" %*
    exit /b %ERRORLEVEL%
)

if exist "%ProgramFiles%\Gradle\bin\gradle.bat" (
    "%ProgramFiles%\Gradle\bin\gradle.bat" %*
    exit /b %ERRORLEVEL%
)

echo ERROR: Gradle is not installed or not on PATH. Please install Gradle or set GRADLE_HOME.
exit /b 1
