@ECHO OFF
REM Copyright 2017 Google Inc.
REM
REM Licensed under the Apache License, Version 2.0 (the "License");
REM you may not use this file except in compliance with the License.
REM You may obtain a copy of the License at
REM
REM      http://www.apache.org/licenses/LICENSE-2.0
REM
REM Unless required by applicable law or agreed to in writing, software
REM distributed under the License is distributed on an "AS IS" BASIS,
REM WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
REM See the License for the specific language governing permissions and
REM limitations under the License.

CD %WORKSPACE%

REM ============================================================================
REM Prepare Environment
REM ============================================================================

COPY tools\ci\jenkins\windows\.bazelrc .

CMD /C xtool.bat setup

REM ============================================================================
REM Run Build and Test
REM ============================================================================

CMD /C xtool.bat build //xrtl/base/...
IF %ERRORLEVEL% NEQ 0 EXIT /b %ERRORLEVEL%
CMD /C xtool.bat test //xrtl/base/...
IF %ERRORLEVEL% NEQ 0 EXIT /b %ERRORLEVEL%

EXIT /b 0
