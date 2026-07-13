Set WshShell = CreateObject("WScript.Shell")
WshShell.Run "cmd /c cd /d " & Chr(34) & "C:\Users\��Ϊ����\Documents\Codex\2026-07-12\d-d\XianyuAutoAgent" & Chr(34) & " && " & Chr(34) & "C:\Users\��Ϊ����\Documents\Codex\2026-07-12\d-d\XianyuAutoAgent\venv\Scripts\python.exe" & Chr(34) & " " & Chr(34) & "C:\Users\��Ϊ����\Documents\Codex\2026-07-12\d-d\XianyuAutoAgent\main.py" & Chr(34), 1, False
Set WshShell = Nothing
