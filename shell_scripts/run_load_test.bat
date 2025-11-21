@echo off
set JMETER_BIN=jmeter
set SCRIPT=..\scripts\reqres_api_test.jmx
set TIMESTAMP=%date:~-4,4%%date:~-7,2%%date:~-10,2%_%time:~0,2%%time:~3,2%%time:~6,2%
set TIMESTAMP=%TIMESTAMP: =0%
set LOG_FILE=..\results\load_%TIMESTAMP%.jtl
set REPORT_FOLDER=..\results\report_load_%TIMESTAMP%

echo --- Iniciando LOAD TEST ---

call %JMETER_BIN% -n -t %SCRIPT% ^
    -l %LOG_FILE% ^
    -e -o %REPORT_FOLDER% ^
    -Jthreads=20 ^
    -Jrampup=30 ^
    -Jduration=300 ^
    -Jloops=-1

echo --- Test Finalizado. Reporte generado en %REPORT_FOLDER% ---
pause