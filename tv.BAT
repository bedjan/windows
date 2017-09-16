@ECHO OFF
echo tv_online
GOTO %PROCESSOR_ARCHITECTURE%

:AMD64
"%ProgramFiles%\VideoLAN\VLC\vlc.exe" "https://gist.githubusercontent.com/bedjan/7bf41966fa76595ff625c1bee863e574/raw/011011db7bfad156d4d0931e47d4fc20cc01b680/tv_online.m3u"

EXIT

:X86
"%ProgramFiles%\VideoLAN\VLC\vlc.exe" "https://gist.githubusercontent.com/bedjan/7bf41966fa76595ff625c1bee863e574/raw/011011db7bfad156d4d0931e47d4fc20cc01b680/tv_online.m3u"

EXIT