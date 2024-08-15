@ECHO OFF
echo radia_online_se_stahnou_do_Downloads
curl.exe  --output "C:\Users\Lenovo\Downloads\radia_online.m3u" --url "https://github.com/bedjan/mm/raw/master/radia_online.m3u"

GOTO %PROCESSOR_ARCHITECTURE%

:AMD64
"%ProgramFiles%\foobar2000\foobar2000.exe" "https://github.com/bedjan/mm/raw/master/radia_online.m3u"

EXIT

:X86
"%ProgramFiles%\foobar2000\foobar2000.exe" "https://github.com/bedjan/mm/raw/master/radia_online.m3u"


EXIT
