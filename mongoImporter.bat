@echo off
title = Mongo Data Base importing tool
goto :main

:import_collection
	echo importing %~2
	set file_name=%~2
	set removed_json=%file_name:.json=%
	mongoimport --db %~1 --collection %removed_json% --file %~2
goto :eof

:loop_over_files_in_current_dir
	for /f %%c in ('dir /b *.json') do call :import_collection %~1 %%c
goto :eof

:main
	IF [%1]==[] (
	ECHO FATLA ERROR: Please specify a data base name
	goto :eof
	) ELSE (
	echo starting import...
	call :loop_over_files_in_current_dir %~1
	echo import done...
	echo hope you enjoyed me
	)
goto :eof
       
