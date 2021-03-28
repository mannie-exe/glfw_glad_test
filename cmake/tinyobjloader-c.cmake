

include_guard()
include("cmake/macros/get_down.cmake")

get_down("tinyobjloader_c"
         "https://github.com/syoyo/tinyobjloader-c.git"
         "origin/master")

set(tinyobjloader_c_INC_DIRS ${tinyobjloader_c_SOURCE_DIR})

list(APPEND
     ${PROJECT_NAME}_INC_DIRS ${tinyobjloader_c_INC_DIRS})
