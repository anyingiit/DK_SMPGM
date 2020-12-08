message(STATUS "in Game CMakeLists.txt")
add_subdirectory(module1)
add_subdirectory(module2)
add_subdirectory(System)
#add_subdirectory(../Main)

include_directories(./)
#include_directories(./System)
aux_source_directory(./ DIR_GAME_SRCS)
add_library(game_static STATIC ${DIR_GAME_SRCS})
#add_library(game_package STATIC ${DIR_GAME_SRCS} module1_static module2_static)
add_dependencies(
        game_static
        system_static
        module1_static
        module2_static
)
#link_libraries(Game STATIC module1_static module2_static)
TARGET_LINK_LIBRARIES(game_static module1_static module2_static system_static)
set_target_properties(game_static PROPERTIES OUTPUT_NAME "game")