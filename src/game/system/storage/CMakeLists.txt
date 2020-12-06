include_directories(include)
aux_source_directory(./src DIR_STORAGE_SRCS)
add_library(storage ${DIR_STORAGE_SRCS})