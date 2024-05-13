@echo off
chcp 65001
setlocal enabledelayedexpansion

if "%~1"=="/help" (
    echo Підказка
    echo Довідка по використанню скрипту:
    echo Скрипт cинхронізує цифрові в двох каталогах за датою.
    echo Передавайте довільну кількість параметрів джерел, вказуючи шлях до них.
    echo Приклад: "E:\аня\АК\синхронизація"
    exit /b 0
)

if "%~1"=="" (
    echo Потрібно вказати принаймні один каталог як параметр утиліти.
    exit /b 1
)

set "source_dirs="
:next_dir
if "%~1"=="" goto end_loop
set "source_dirs=%source_dirs% "%~1""
shift
goto next_dir
:end_loop

set "destination_dir=C:\Users\Admin\Лабораторні\ПЗ-23-3\Черкаська Анна Олександрівна\Командна строка\Не прихована папка\синхронизація"

echo Синхронізація файлів між вказаними каталогами та %destination_dir%...

for %%d in (%source_dirs%) do (
    xcopy /D /Y /E "%%~d" "%destination_dir%"
)

for %%d in (%source_dirs%) do (
    xcopy /U /Y /E "%destination_dir%" "%%~d"
)

echo Синхронізація завершена
pause

endlocal