@REM ----------------------------------------------------------------------------
@REM Copyright 2001-2004 The Apache Software Foundation.
@REM
@REM Licensed under the Apache License, Version 2.0 (the "License");
@REM you may not use this file except in compliance with the License.
@REM You may obtain a copy of the License at
@REM
@REM      http://www.apache.org/licenses/LICENSE-2.0
@REM
@REM Unless required by applicable law or agreed to in writing, software
@REM distributed under the License is distributed on an "AS IS" BASIS,
@REM WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@REM See the License for the specific language governing permissions and
@REM limitations under the License.
@REM ----------------------------------------------------------------------------
@REM

@echo off

set ERROR_CODE=0

:init
@REM Decide how to startup depending on the version of windows

@REM -- Win98ME
if NOT "%OS%"=="Windows_NT" goto Win9xArg

@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" @setlocal

@REM -- 4NT shell
if "%eval[2+2]" == "4" goto 4NTArgs

@REM -- Regular WinNT shell
set CMD_LINE_ARGS=%*
goto WinNTGetScriptDir

@REM The 4NT Shell from jp software
:4NTArgs
set CMD_LINE_ARGS=%$
goto WinNTGetScriptDir

:Win9xArg
@REM Slurp the command line arguments.  This loop allows for an unlimited number
@REM of arguments (up to the command line limit, anyway).
set CMD_LINE_ARGS=
:Win9xApp
if %1a==a goto Win9xGetScriptDir
set CMD_LINE_ARGS=%CMD_LINE_ARGS% %1
shift
goto Win9xApp

:Win9xGetScriptDir
set SAVEDIR=%CD%
%0\
cd %0\..\.. 
set BASEDIR=%CD%
cd %SAVEDIR%
set SAVE_DIR=
goto repoSetup

:WinNTGetScriptDir
set BASEDIR=%~dp0\..

:repoSetup


if "%JAVACMD%"=="" set JAVACMD=java

if "%REPO%"=="" set REPO=%BASEDIR%\lib

set CLASSPATH="%BASEDIR%"\config;"%REPO%"\junit-4.12.jar;"%REPO%"\hamcrest-core-1.3.jar;"%REPO%"\selenide-4.3.jar;"%REPO%"\httpcore-4.4.6.jar;"%REPO%"\selenium-java-3.0.1.jar;"%REPO%"\selenium-chrome-driver-3.0.1.jar;"%REPO%"\selenium-remote-driver-3.0.1.jar;"%REPO%"\selenium-api-3.0.1.jar;"%REPO%"\commons-exec-1.3.jar;"%REPO%"\jna-platform-4.1.0.jar;"%REPO%"\jna-4.1.0.jar;"%REPO%"\selenium-edge-driver-3.0.1.jar;"%REPO%"\selenium-firefox-driver-3.0.1.jar;"%REPO%"\selenium-ie-driver-3.0.1.jar;"%REPO%"\selenium-opera-driver-3.0.1.jar;"%REPO%"\selenium-support-3.0.1.jar;"%REPO%"\htmlunit-2.23.jar;"%REPO%"\xalan-2.7.2.jar;"%REPO%"\serializer-2.7.2.jar;"%REPO%"\commons-lang3-3.4.jar;"%REPO%"\httpclient-4.5.2.jar;"%REPO%"\httpmime-4.5.2.jar;"%REPO%"\htmlunit-core-js-2.23.jar;"%REPO%"\neko-htmlunit-2.23.jar;"%REPO%"\xercesImpl-2.11.0.jar;"%REPO%"\xml-apis-1.4.01.jar;"%REPO%"\cssparser-0.9.20.jar;"%REPO%"\sac-1.3.jar;"%REPO%"\commons-io-2.5.jar;"%REPO%"\commons-logging-1.2.jar;"%REPO%"\websocket-client-9.2.15.v20160210.jar;"%REPO%"\jetty-util-9.2.15.v20160210.jar;"%REPO%"\jetty-io-9.2.15.v20160210.jar;"%REPO%"\websocket-common-9.2.15.v20160210.jar;"%REPO%"\websocket-api-9.2.15.v20160210.jar;"%REPO%"\gson-2.8.0.jar;"%REPO%"\guava-21.0.jar;"%REPO%"\browsermob-core-2.1.4.jar;"%REPO%"\littleproxy-1.1.0-beta-bmp-15.jar;"%REPO%"\jackson-core-2.8.5.jar;"%REPO%"\jackson-databind-2.8.5.jar;"%REPO%"\jackson-annotations-2.8.5.jar;"%REPO%"\dnsjava-2.1.7.jar;"%REPO%"\jcl-over-slf4j-1.7.22.jar;"%REPO%"\jzlib-1.1.3.jar;"%REPO%"\netty-all-4.0.42.Final.jar;"%REPO%"\bcprov-jdk15on-1.56.jar;"%REPO%"\bcpkix-jdk15on-1.56.jar;"%REPO%"\mitm-2.1.4.jar;"%REPO%"\phantomjsdriver-1.3.0.jar;"%REPO%"\commons-codec-1.10.jar;"%REPO%"\slf4j-nop-1.7.25.jar;"%REPO%"\slf4j-api-1.7.25.jar;"%REPO%"\seleniumtest-0.0.1-SNAPSHOT.jar
set EXTRA_JVM_ARGUMENTS=
goto endInit

@REM Reaching here means variables are defined and arguments have been captured
:endInit

%JAVACMD% %JAVA_OPTS% %EXTRA_JVM_ARGUMENTS% -classpath %CLASSPATH_PREFIX%;%CLASSPATH% -Dapp.name="App" -Dapp.repo="%REPO%" -Dbasedir="%BASEDIR%" star16m.seleniumtest.App %CMD_LINE_ARGS%
if ERRORLEVEL 1 goto error
goto end

:error
if "%OS%"=="Windows_NT" @endlocal
set ERROR_CODE=1

:end
@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" goto endNT

@REM For old DOS remove the set variables from ENV - we assume they were not set
@REM before we started - at least we don't leave any baggage around
set CMD_LINE_ARGS=
goto postExec

:endNT
@endlocal

:postExec

if "%FORCE_EXIT_ON_ERROR%" == "on" (
  if %ERROR_CODE% NEQ 0 exit %ERROR_CODE%
)

pause;