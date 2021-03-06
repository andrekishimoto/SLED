:: Copyright (c) Sony Computer Entertainment America LLC.
:: All rights Reserved.

@echo off

SET DEVENV120="%VS120COMNTOOLS%..\IDE\devenv.com"
IF NOT EXIST %DEVENV120% (
echo Visual Studio 2013 not found, skipping
goto end
)

SET SOLUTION="DotNetUtilities.vs2013.sln"

echo.
echo ---- Building VS 2013 wws_lua extras...
echo.

pushd "%~dp0"
(
call vs2013_runner.cmd build %SOLUTION% "win32_dotnet_clr4_" "Any CPU" && ^
call vs2013_runner.cmd build %SOLUTION% "win64_dotnet_clr4_" "Any CPU"
) || (echo. & echo **** Error building VS 2013 wws_lua extras. & popd & exit /b 1)
popd

echo.
echo ---- Build of VS 2013 wws_lua extras succeeded.

:end

exit /b 0
