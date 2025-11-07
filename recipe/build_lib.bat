@echo on

mkdir build_lib
cd build_lib

cmake -G "Ninja" ^
    %CMAKE_ARGS ^
    -DZ3_BUILD_LIBZ3_SHARED=TRUE ^
    -DZ3_INCLUDE_GIT_DESCRIBE=FALSE ^
    -DZ3_INCLUDE_GIT_HASH=FALSE ^
    -DZ3_BUILD_DOCUMENTATION=FALSE ^
    ..
if %ERRORLEVEL% neq 0 exit 1

cmake --build .
if %ERRORLEVEL% neq 0 exit 1

cmake --install .
if %ERRORLEVEL% neq 0 exit 1
