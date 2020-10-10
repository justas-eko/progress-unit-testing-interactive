REM @ECHO OFF

echo Starting tests...

C:\Progress\OpenEdge\bin\prowin.exe -b -basekey "INI" -ininame config/propath.ini -p ABLUnitCore.p -param "CFG=./config/ablunit.json" -pf config/sports2000.pf

findstr /m "</failure>" results.xml > nul
if %errorlevel%==0 (
echo Seems there are failing tests...
)

echo Finished! Check 'results.xml'

pause
