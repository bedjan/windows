@ECHO OFF
echo winget upgrade
winget upgrade
echo "zadej pripadne winget upgrade /prislusna aplikace/"

winget install -e --id Notepad++.Notepad++
winget install -e --id SublimeHQ.SublimeText.4
winget install -e --id Microsoft.VisualStudioCode
winget install -e --id Adobe.Acrobat.Reader.64-bit
winget install -e --id JetBrains.IntelliJIDEA.Community

EXIT
