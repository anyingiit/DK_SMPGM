#cmake_minimum_required(VERSION 3.17)
#project(V4_DK_SMPGM)
#
#set(CMAKE_CXX_STANDARD 20)
#
#add_executable(V4_DK_SMPGM src/main/main.cpp)

cmake_minimum_required(VERSION 3.17)
project(V4_DK_SMPGM)
set(CMAKE_CXX_STANDARD 20)
add_subdirectory(src)
link_libraries(V4_DK_SMPGM src)