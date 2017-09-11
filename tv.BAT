@ECHO OFF
echo tv_online
GOTO %PROCESSOR_ARCHITECTURE%

:AMD64
"%ProgramFiles%\VideoLAN\VLC\vlc.exe" "https://gist.githubusercontent.com/bedjan/92f06608c30099c8215e7ce58db204d0/raw/037f26c1c2fbc44399055a22e4d50f41abc8bff8/tv_online.m3u"

EXIT

:X86
"%ProgramFiles%\VideoLAN\VLC\vlc.exe" "https://gist.githubusercontent.com/bedjan/92f06608c30099c8215e7ce58db204d0/raw/037f26c1c2fbc44399055a22e4d50f41abc8bff8/tv_online.m3u"

EXIT