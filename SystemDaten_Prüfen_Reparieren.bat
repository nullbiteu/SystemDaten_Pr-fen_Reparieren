@if (@a)==(@b) @end /* :: Gültige Zeile in Batch und JScript, um einen mehrzeiligen JScript-Kommentar zu beginnen.

@echo off &setlocal EnableExtensions DisableDelayedExpansion

:: Die Dateireparatur wird abgebrochen, wenn Windows-Updates ausstehen. Fordert den Benutzer auf, zuerst Updates zu installieren.
if exist "%windir%\winsxs\pending.xml" (
  echo A Windows update is pending.
  echo Please install it first and reboot your computer.
  pause
  exit /b
)
:: Prüfung auf Administrator-Rechte
>nul 2>&1 net session || (
  if "%~1"=="" cscript //nologo //e:jscript "%~fs0" "%~f0"
  exit /b
)
:: Führt System File Checker aus.
sfc /scannow
:: Filtert die CBS.log-Datei und speichern die Ergebnisse auf dem Desktop.
findstr /c:"[SR]" "%windir%\Logs\CBS\CBS.log" >"%userprofile%\Desktop\Ergebnisse.txt"
:: Schließen die Eingabeaufforderung und öffnen die Datei Ergebnisse.txt im Editor.
start Notepad "%userprofile%\Desktop\Ergebnisse.txt"
exit /b

*/ WScript.CreateObject('Shell.Application').ShellExecute('cmd.exe', '/c ""' + WScript.Arguments(0) + '" X"', '', 'runas', 1);