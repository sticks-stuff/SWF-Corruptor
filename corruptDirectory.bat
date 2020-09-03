@echo off
echo !!!THIS WILL OVERWRITE ANY SWF FILES IN THIS DIRECTORY AND ANY SUBDIRECTORIES!!!
echo !!!PLEASE MAKE A BACKUP!!!
set /p UserInputPath=What directory would you like to corrupt? 
for /R "%UserInputPath%" %%I in (*.swf) do swfCorruptor.vbs "%%I" --overwrite
