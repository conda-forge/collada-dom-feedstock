set PKG_CONFIG_PATH=%LIBRARY_PREFIX%\share\pkgconfig

IF EXIST "%SRC_DIR%\dom\external-libs" (
    rmdir /s /q "%SRC_DIR%\dom\external-libs"
)

mkdir build
cd build

cmake ^
    -G "NMake Makefiles" -DCMAKE_POLICY_VERSION_MINIMUM=3.5 ^
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
