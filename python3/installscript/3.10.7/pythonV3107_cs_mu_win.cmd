@echo OFF

REM Auth          : Freeman
REM Email         : flo@radford.edu
REM DESC          : Silent Python Installer for Windows
REM 32bit path    : https://www.python.org/ftp/python/3.10.7/python-3.10.7.exe
REM 64bit path    : https://www.python.org/ftp/python/3.10.7/python-3.10.7-amd64.exe
REM Date          : 2022.10.08

set major=3
set minor=10
set patch=7

:: Check Admin DOS PROMPT is available
goto check_permission
:check_permission
    setlocal
    echo. Administrative permissions required. Detecting permissions..
    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo. Admin Permissions confirmed.
        echo. Continuing.......
    ) else (
        echo. Admin Permissions not confirmed. 
        echo. Right click on the DOS Prompt and RUN AS Administrator
        echo. Exiting..........
        goto end
    )
    echo. 1%% Completed.

:time_pause2
    echo.
    timeout /t 5 > nul

:: clear screen
cls

:: Prompt for user to Really run this script
:start_this
    setlocal
    set _value="n"
    set /p _value=Are you sure installing Python-3.10.7-amd64 (y/[n]) ?
    if /i "%_value%" NEQ "y" goto end

:: This batch file will show details Windows 10, and install Python v3.10.7
:section_0
    setlocal
    title Install Python Software on Windows 7/8/9/10/11
    echo. Checking system information.
    timeout /t 2 > nul
    rem Switch to Downloads early on
    cd C:\Users\%USERNAME%\Downloads
    echo. 3%% Completed.

:time_pause2
    timeout /t 2 > nul

:: Section 1: Windows 10/11 information.
:section_1
    echo. ============================
    echo. WINDOWS INFO
    echo. ============================
    echo.
    systeminfo | findstr /c:"OS Name"
    systeminfo | findstr /c:"OS Version"
    systeminfo | findstr /c:"Hyper-V Requirements"
    echo. 5%% Completed.

:time_pause2
    echo.
    timeout /t 2 > nul

:: Section 2: Hardware information.
:section_2
    echo. ============================
    echo. HARDWARE INFO
    echo. ============================
    echo.
    systeminfo | findstr /c:"Total Physical Memory"
    systeminfo | findstr /c:"Virtual Memory: In Use"

:time_pause2
    echo.
    timeout /t 2 > nul
    echo. 8%% Completed.


:: Section 3: Python Download.
:section_3
    echo. ============================================
    echo. Checking Existing Python version in Download
    echo. ============================================
    echo.

:section_3_1
    if exist "python-3.10.0-*.<" (
        echo. Found existing version of Python 3.10.0
        del python-3.10.*-*.exe
        del python-3.10.*.exe
        echo. Deleting existing version of Python
        echo.
    ) else (
        echo. No existing version of python 3.10.0 Avail.
        echo.
    )
    echo. 10%% Completed.

:time_pause2
    echo.
    timeout /t 2 > nul

:section_3_2
    if exist "python-3.9.*.<" (
        echo. Found existing version of Python 3.9.*
        del python-3.9.*-*.exe
        del python-3.9.*.exe
        echo. Deleting existing version of Python
        echo.
    ) else (
        echo. No existing version of python 3.9 Found.
        echo.
    )
    echo. 15%% Completed.

:time_pause2
    echo.
    timeout /t 2 > nul

:section_3_3
    if exist "python-3.8.*.<" (
        echo. Found existing version of Python 3.8.*
        del python-3.8.*-*.exe
        del python-3.8.*.exe
        echo. Deleting existing version of Python
        echo.
    ) else (
        echo. No existing version of python 3.8 Found.
        echo.
    )
    echo. 20%% Completed.

:section_3_4
    setlocal
    rem You may need to press ENTER, If the wait time is more than 10 seconds.
    echo.
    echo. You may need to press ENTER, 
    echo. If the wait time is more than 10 seconds.
    echo. if it crashed, Press CTRL-C or something.
    echo. Continuing...................
    echo.

:time_pause2
    echo.
    timeout /t 2 > nul

:: Section 4: Bitsadmin Download.
:section_4
    setlocal
    echo.
    echo. ============================
    echo. Checking Bitsadmin
    echo. ============================
    echo.

    REM forgot that 32bit Windows has a different location for bitsadmin
    if /i "%processor_architecture%"=="x86" (
        rem check 32bit FTP downloader
        if exist C:\Windows\System32\bitsadmin.exe (
            echo. Bitsadmin 32bit is installed on your Windows 7/8/9/10/11 system.
            echo. Will download Python 3 software.
            echo.
            goto section_5
        ) else (
            echo. We dont know where bitsadmin 32bit is located.
            echo. line 173
            goto end
        )
    ) else (
        rem check 64bit FTP downloader
        if exist C:\Windows\SysWOW64\bitsadmin.exe (
            echo. Bitsadmin 64bit is installed on your Windows 7/8/9/10/11 system.
            echo. Will download Python 3 software.
            echo.
            goto section_5
        ) else (
            echo. We dont know where bitsadmin 64bit is located.
            echo. line 185
            goto end
        )
    )           
    echo. 30%% Completed.

:time_pause2
    echo.
    timeout /t 2 > nul

:: Section 5: Python Download.
:section_5
    echo.
    echo. ============================
    echo. Downloading Python
    echo. ============================
    echo.

:: Section 5: Python Download.
:check_arch
    echo.
    if /i "%processor_architecture%"=="x86" (
            rem Run 32bit downloader
            C:\Windows\System32\bitsadmin.exe /transfer PythonDownload /download /priority normal https://www.python.org/ftp/python/%major%.%minor%.%patch%/python-%major%.%minor%.%patch%.exe C:\Users\%USERNAME%\Downloads\python-%major%.%minor%.%patch%.exe
        ) else (
            rem Run 64bit downloader
            C:\Windows\SysWOW64\bitsadmin.exe /transfer PythonDownload /download /priority normal https://www.python.org/ftp/python/%major%.%minor%.%patch%/python-%major%.%minor%.%patch%-amd64.exe C:\Users\%USERNAME%\Downloads\python-%major%.%minor%.%patch%-amd64.exe
        )           
    echo. 40%% Completed.
    echo.

:time_pause4
    echo.
    timeout /t 4 > nul

:: Checking to see if this python file has been downloaded.
:section_6
    echo.
    echo. Checking to see if this python file has been downloaded.
    rem Kept forgetting that there are two architectures
    if /i "%processor_architecture%"=="x86" (
        if exist python-%major%.%minor%.%patch%.exe (
            echo. Python executable has been Found.
            echo. Will now Install this Software.
            echo.
            goto section_7
        ) else (
            echo. Software not found.
            echo. Perhaps, try to run this file again.
            echo. line 234
            echo.
            goto end
        )
    ) else (
        if exist python-%major%.%minor%.%patch%-amd64.exe (
            echo. Python executable has been Found.
            echo. Will now Install this Software.
            echo.
            goto section_7
        ) else (
            echo. Software not found.
            echo. Perhaps, try to run this file again.
            echo. line 247
            echo.
            goto end
        )
    )
    echo. 50%% Completed.
    echo.

:: Finish downloading the Python Software
:section_7
    echo.
    rem nothing here to see
    timeout /t 4 > nul

:: Installing Python
:section_8
    echo.
    echo. ============================
    echo. Installing Python
    echo. ============================
    echo.
    echo. Go grab Koffie or something, installion will take sometime since we had configured it to compile quite a few items.
    if /i "%processor_architecture%"=="x86" (
        C:\Users\%USERNAME%\Downloads\python-%major%.%minor%.%patch%.exe /quiet /passive InstallAllUsers=0 TargetDir=C:\Python%major%%minor%%patch% AssociateFiles=1 CompileAll=1 PrependPath=0 Shortcuts=0 Include_doc=1 Include_debug=0 Include_dev=1 Include_exe=1 Include_launcher=1 InstallLauncherAllUsers=1 Include_lib=1 Include_pip=1 Include_symbol=0 Include_tcltk=1 Include_test=1 Include_tools=1
        timeout /t 4 > nul
    ) else (
        C:\Users\%USERNAME%\Downloads\python-%major%.%minor%.%patch%-amd64.exe /quiet /passive InstallAllUsers=0 TargetDir=C:\Python%major%%minor%%patch% AssociateFiles=1 CompileAll=1 PrependPath=0 Shortcuts=0 Include_doc=1 Include_debug=0 Include_dev=1 Include_exe=1 Include_launcher=1 InstallLauncherAllUsers=1 Include_lib=1 Include_pip=1 Include_symbol=0 Include_tcltk=1 Include_test=1 Include_tools=1
        timeout /t 4 > nul
    )
    echo. 60%% Completed.

:time_pause4
    echo.
    timeout /t 2 > nul

:: Compiling and Installing Python Modules
:section_9
    setlocal
    echo.
    echo. =======================================
    echo. Compiling and Installing Python Modules
    echo. =======================================
    echo.
    set num=12
    for /L %%I IN (1, 1, %num%) do (
        echo. | set /p="%%I " 
        timeout /t 1 > nul
    )
    echo. 65%% Completed.

:: Check to see if Python was installed 
:section_10
    echo.
    if exist C:\Python%major%%minor%%patch%\Tools\pynche\Main.py (
        echo.
        echo. Checking whether Python has been installed...
        echo.
        echo. Python Software has been Installed.
        echo.
    ) else (
        echo.
        echo. Python has not been installed.
        echo.
        echo. Problem with installation. 
        echo. line 311
        echo.
        goto end
    )
    echo. 70%% Completed.
    echo.

:: Check to see if Python was installed 
:section_11
    echo.
    echo. ========================
    echo. Updating pip the modules
    echo. ========================
    echo.
    rem Updating pip on Windows
    C:\Python%major%%minor%%patch%\python.exe -m pip install --upgrade pip
    echo. 75%% Completed.
    echo.

:: Finished Updating pip
:section_12
    echo.
    echo. ======================
    echo. Finished Updating pip
    echo. ======================
    echo.
    echo. 80%% Completed.
    echo.

:time_pause2
    echo.
    timeout /t 2 > nul

:: Installing Additional Modules
:section_13
    echo. =============================
    echo. Installing Additional Modules
    echo. =============================
    echo.
    echo. Press ENTER in this section if and when it seem to be pausing too long.
    timeout /t 2 > nul
    C:\Python%major%%minor%%patch%\Scripts\pip.exe install --user wheel scrapy
    timeout /t 2 > nul
    C:\Python%major%%minor%%patch%\Scripts\pip.exe install --user pandas_datareader requests ta scipy numpy plotly
    timeout /t 2 > nul
    C:\Python%major%%minor%%patch%\Scripts\pip.exe install --user pandas matplotlib
    timeout /t 2 > nul
    C:\Python%major%%minor%%patch%\Scripts\pip.exe install --user BeautifulSoup4 wikipedia wordcloud
    timeout /t 2 > nul
    echo. 85%% Completed.
    echo.

:time_pause2
    echo.
    timeout /t 2 > nul

:: Finished installing Modules
:section_14
    echo.
    echo. ===========================
    echo. Finished installing Modules
    echo. ===========================
    echo.
    echo. 90%% Completed.
    echo.

:: Execute runme.bat.
:section_15
    echo.
    echo. ============================
    echo. Execute runme.bat
    echo. ============================
    echo set PATH=C:\Python%major%%minor%%patch%;%PATH% > C:\Users\%USERNAME%\runme.bat

    if exist C:\Users\%USERNAME%\Downloads\python-%major%.%minor%.%patch%-amd64.exe (
        echo. deleting installation file
        del /s C:\Users\%USERNAME%\Downloads\python-%major%.%minor%.%patch%-amd64.exe >nul 2>&1
    ) else (
        if exist C:\Users\%USERNAME%\Downloads\python-%major%.%minor%.%patch%.exe (
            echo. deleting installation file
            del /s C:\Users\%USERNAME%\Downloads\python-%major%.%minor%.%patch%.exe >nul 2>&1
        )
    )
    call C:\Users\%USERNAME%\runme.bat
    echo.

:: Create Directories for HW and Labs
:section_16
    echo.
    echo.============================
    echo. Creating Directories
    echo.============================
    echo.
    mkdir C:\Users\%USERNAME%\itec109
    mkdir C:\Users\%USERNAME%\itec109\hws
    mkdir C:\Users\%USERNAME%\itec109\labs
    echo. Directories were Created
    echo.

:: Run Python
:section_17
    echo.
    echo.
    python -c "print(\"Welcome, Python installation Success.\")"
    echo.
    echo.

:section_18
    echo.
    echo. 100%% Completed !
    echo.
:end
