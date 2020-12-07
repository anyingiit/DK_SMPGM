message(STATUS "in game CMakeLists.txt")
add_subdirectory(module1)
add_subdirectory(module2)
#add_subdirectory(../main)

aux_source_directory(./ DIR_GAME_SRCS)
add_library(game_static STATIC ${DIR_GAME_SRCS})
add_dependencies(
        game_static
        module1_static
        module2_static
)
#link_libraries(game STATIC module1_static module2_static)
TARGET_LINK_LIBRARIES(game_static module1_static module2_static)
set_target_properties(game_static PROPERTIES OUTPUT_NAME "game")