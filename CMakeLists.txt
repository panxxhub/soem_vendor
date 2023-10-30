cmake_minimum_required(VERSION 3.20)

project(soem_vendor)

find_package(ament_cmake REQUIRED)

include(ExternalProject)

ExternalProject_Add(soem
  PREFIX soem
  GIT_REPOSITORY  https://github.com/OpenEtherCATsociety/SOEM.git
  GIT_TAG 1.4.0
  CMAKE_ARGS
   -DBUILD_TESTS=OFF
  INSTALL_COMMAND cmake -E echo "Skipping install step."
)

install (
  DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/soem/src/soem/soem
  DESTINATION lib
)

ament_export_include_directories(include)

ament_package()