cmake_minimum_required(VERSION 3.18)
project(watcom-cmake C CXX)

message("before: ${CMAKE_C_FLAGS}")

#string(REGEX REPLACE "([ ]|^)\\-br([ ]|$)" "\\1\\2" CMAKE_C_FLAGS "${CMAKE_C_FLAGS}")
string(REGEX REPLACE "([ ]|^)\\-br([ ]|$)" "\\1\\2" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")

message("after: ${CMAKE_C_FLAGS}")

add_executable(hello main.c)
