IF EXIST "%SRC_DIR%\dom\external-libs" (
    rmdir /s /q "%SRC_DIR%\dom\external-libs"
)

mkdir build
cd build

:: Ensure MiniZip headers are in the include path as the cmake's 
:: imported target are not correctly used
set "INCLUDE=%PREFIX%\Library\include\minizip;%INCLUDE%"

cmake ^
    -G "Ninja" ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DCMAKE_BUILD_TYPE=Release ^
    %SRC_DIR%
if errorlevel 1 exit 1

:: Build.
cmake --build . --config Release
if errorlevel 1 exit 1

:: Install.
cmake --build . --config Release --target install
if errorlevel 1 exit 1
