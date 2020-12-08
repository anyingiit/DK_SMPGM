add_subdirectory(SayHello)
include_directories(./)
#include_directories(SayHello/include)
#include_directories(F:/project/V4_DK_SMPGM/src/Game/)
get_property(dirs DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY INCLUDE_DIRECTORIES)
foreach(dir ${dirs})
    message(STATUS "dir='${dir}'")
endforeach()
aux_source_directory(./ DIR_SYSTEM_SRCS)
add_library(system_static STATIC ${DIR_SYSTEM_SRCS})
set_target_properties(system_static PROPERTIES OUTPUT_NAME "system")
add_dependencies(
        system_static
        sayHello_static
)
TARGET_LINK_LIBRARIES(system_static sayHello_static)