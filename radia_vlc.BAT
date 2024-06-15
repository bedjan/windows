@ECHO OFF
echo radia_online
GOTO %PROCESSOR_ARCHITECTURE%

:AMD64
"%ProgramFiles%\VideoLAN\VLC\vlc.exe" "https://github.com/bedjan/mm/raw/master/radia_online.m3u"

EXIT

:X86
"%ProgramFiles%\VideoLAN\VLC\vlc.exe" "https://github.com/bedjan/mm/raw/master/radia_online.m3u"

EXIT
