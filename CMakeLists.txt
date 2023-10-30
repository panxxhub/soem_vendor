cmake_minimum_required(VERSION 3.20)

project(soem_vendor)

find_package(ament_cmake REQUIRED)

include(ExternalProject)

ExternalProject_Add(soem
  PREFIX soem
  GIT_REPOSITORY  https://github.com/OpenEtherCATsociety/SOEM.git
  GIT_TAG v1.4.0
  CMAKE_ARGS
   -DBUILD_TESTS=OFF
   -DCMAKE_INSTALL_PREFIX=${CMAKE_CURRENT_BINARY_DIR}/soem_install
  INSTALL_DIR "${CMAKE_CURRENT_BINARY_DIR}/soem_install"
)


install (
  DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/soem_install/
  DESTINATION ${CMAKE_INSTALL_PREFIX}
)

install (
  DIRECTORY cmake
  DESTINATION share/${PROJECT_NAME}
)

ament_export_include_directories(include/soem)
ament_export_libraries(soem)

ament_package()