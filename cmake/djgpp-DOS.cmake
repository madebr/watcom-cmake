# From @system_v from support channel of Open Watcom discord

set(CMAKE_SYSTEM_NAME DOS)

set(DJGPP ON)
set(MSDOS ON)

set(CMAKE_C_COMPILER "i586-pc-msdosdjgpp-gcc")
set(CMAKE_CXX_COMPILER "i586-pc-msdosdjgpp-g++")
set(CMAKE_Fortran_COMPILER "i586-pc-msdosdjgpp-gfortran")

execute_process(COMMAND "${CMAKE_C_COMPILER}" -print-search-dirs
	RESULT_VARIABLE CC_SEARCH_DIRS_RESULT
	OUTPUT_VARIABLE CC_SEARCH_DIRS_OUTPUT)

if(CC_SEARCH_DIRS_RESULT)
	message(FATAL_ERROR "Could not determine search dirs")
endif()

string(REGEX MATCH ".*libraries: (.*).*" CC_SD_LIBS "${CC_SEARCH_DIRS_OUTPUT}")
string(STRIP "${CMAKE_MATCH_1}" CC_SEARCH_DIRS)
string(REPLACE ":" ";" CC_SEARCH_DIRS "${CC_SEARCH_DIRS}")

foreach(CC_SEARCH_DIR ${CC_SEARCH_DIRS})
	if(CC_SEARCH_DIR MATCHES "=.*")
		string(REGEX MATCH "=(.*)" CC_LIB "${CC_SEARCH_DIR}")
		set(CC_SEARCH_DIR "${CMAKE_MATCH_1}")
	endif()
	if(IS_DIRECTORY "${CC_SEARCH_DIR}")
		if(IS_DIRECTORY "${CC_SEARCH_DIR}/../include" OR IS_DIRECTORY "${CC_SEARCH_DIR}/../lib" OR IS_DIRECTORY "${CC_SEARCH_DIR}/../bin")
			list(APPEND CC_ROOTS "${CC_SEARCH_DIR}/..")
		else()
			list(APPEND CC_ROOTS "${CC_SEARCH_DIR}")
		endif()
	endif()
endforeach()

list(APPEND CMAKE_FIND_ROOT_PATH ${CC_ROOTS})
list(REMOVE_DUPLICATES CMAKE_FIND_ROOT_PATH)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)

set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
