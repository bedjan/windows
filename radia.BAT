@ECHO OFF
echo radia_online
GOTO %PROCESSOR_ARCHITECTURE%

:AMD64
"%ProgramFiles%\VideoLAN\VLC\vlc.exe" "https://gist.githubusercontent.com/bedjan/4ce6c5f78e7d780e94d7d6dedfd66337/raw/b293c8866329666115e5c80f51c6287eb3b9f61c/radia_online.m3u"

EXIT

:X86
"%ProgramFiles%\VideoLAN\VLC\vlc.exe" "https://gist.githubusercontent.com/bedjan/4ce6c5f78e7d780e94d7d6dedfd66337/raw/b293c8866329666115e5c80f51c6287eb3b9f61c/radia_online.m3u"

EXIT
