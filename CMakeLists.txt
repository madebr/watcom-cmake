cmake_minimum_required(VERSION 3.18)
project(watcom-cmake LANGUAGES C CXX VERSION 0.0.1)

add_executable(hello main.c)
install(TARGETS hello DESTINATION ".")

set(CPACK_PACKAGE_NAME "${PROJECT_NAME}-${CMAKE_SYSTEM_NAME}-${CMAKE_SYSTEM_PROCESSOR}")
set(CPACK_GENERATOR ZIP)
include(CPack)

# set(CMAKE_INSTALL_SYSTEM_RUNTIME_DESTINATION ".")
# include(InstallRequiredSystemLibraries)
