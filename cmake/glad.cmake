

include_guard()

set(glad_DIR "${CMAKE_SOURCE_DIR}/lib/glad")

cmake_path(SET glad_SRC_FILES NORMALIZE
           "${glad_DIR}/src/gl.c")
cmake_path(SET glad_INC_DIRS NORMALIZE
           "${glad_DIR}/include")

list(APPEND
     ${PROJECT_NAME}_SRC_FILES ${glad_SRC_FILES})
list(APPEND
     ${PROJECT_NAME}_INC_DIRS ${glad_INC_DIRS})
