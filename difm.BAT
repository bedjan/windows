@ECHO OFF
"%ProgramFiles%\VideoLAN\VLC\vlc.exe" "https://raw.githubusercontent.com/bedjan/difm/master/difm.m3u"

@ECHO OFF
echo tv_online
GOTO %PROCESSOR_ARCHITECTURE%

:AMD64
"%ProgramFiles%\VideoLAN\VLC\vlc.exe" "https://raw.githubusercontent.com/bedjan/difm/master/difm.m3u"

EXIT

:X86
"%ProgramFiles%\VideoLAN\VLC\vlc.exe" "https://raw.githubusercontent.com/bedjan/difm/master/difm.m3u"

EXIT