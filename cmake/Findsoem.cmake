find_package(PkgConfig REQUIRED)
pkg_check_modules(SOEM QUIET soem)

find_library(SOEM_LIBRARIES NAMES soem HINTS ${SOEM_LIBRARY_DIRS})

if (SOEM_FOUND)
    message(STATUS "Found SOEM: ${SOEM_LIBRARIES}")
else()
    message(FATAL_ERROR "SOEM not found")
endif()

find_path(SOEM_INCLUDE_DIRS NAMES soem/ethercat.h HINTS ${SOEM_LIBRARY_DIRS})