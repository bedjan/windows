@ECHO OFF
echo radia_online
GOTO %PROCESSOR_ARCHITECTURE%

:AMD64
"%ProgramFiles%\VideoLAN\VLC\vlc.exe" https://gist.githubusercontent.com/bedjan/c3332ced0d80bed12a0d01cc068ab07e/raw/a8292c93760e662420ea0ed62825584b249594a7/radia_online.m3u

EXIT

:X86
"%ProgramFiles%\VideoLAN\VLC\vlc.exe" https://gist.githubusercontent.com/bedjan/c3332ced0d80bed12a0d01cc068ab07e/raw/a8292c93760e662420ea0ed62825584b249594a7/radia_online.m3u

EXIT
