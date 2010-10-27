@echo off
echo preparing...
for /r . %%f in (*.exe) do	echo @upx -9 %%f  >> compress.cmd
for /r . %%f in (*.dll) do	echo @upx -9 %%f  >> compress.cmd
echo compressing...
call compress.cmd
del compress.cmd
echo cleaning...
del /f /s /q *.~*
del /f /s /q ~*
del /f /s /q *~
del /f /s /q *.autosave