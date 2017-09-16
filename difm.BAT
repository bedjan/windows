@ECHO OFF
"%ProgramFiles%\VideoLAN\VLC\vlc.exe" "https://raw.githubusercontent.com/bedjan/difm/master/difm.m3u"

@ECHO OFF
echo tv_online
GOTO %PROCESSOR_ARCHITECTURE%

:AMD64
"%ProgramFiles%\VideoLAN\VLC\vlc.exe" "https://gist.githubusercontent.com/bedjan/11917d14b9209035c1aa21815c959837/raw/fd21daa89c2784404d465b2da8435f807142c4ad/difm.m3u"

EXIT

:X86
"%ProgramFiles%\VideoLAN\VLC\vlc.exe" "https://gist.githubusercontent.com/bedjan/11917d14b9209035c1aa21815c959837/raw/fd21daa89c2784404d465b2da8435f807142c4ad/difm.m3u"

EXIT