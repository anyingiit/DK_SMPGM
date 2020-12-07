message(STATUS "in root CMakeLists.txt")

cmake_minimum_required(VERSION 3.16)

project(V4_DK_SMPGM)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/Lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/Lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/Bin)
add_subdirectory(src)
#LINK_DIRECTORIES("${PROJECT_BINARY_DIR}/mylib")
#set(CMAKE_LIBRARY_PATH "${PROJECT_BINARY_DIR}/mylib")#添加FIND_LIBRARY默认搜索库位置
#FIND_LIBRARY(CMAKE_LIBRARY_PATH
#        libmodule1.a
#        )#在所有搜索路径下搜索N个库,并且将其绝对路径添加至LIBS变量
#message(STATUS "LIBS:" ${LIBS})
add_dependencies(#按照由依赖和被依赖的关系构造, 可以解决依赖关系
        V4_DK_SMPGM
        game
#        module1_static
#        module2_static
)
TARGET_LINK_LIBRARIES(V4_DK_SMPGM game)