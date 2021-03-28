

include_guard()

set(glad_DIR "${CMAKE_SOURCE_DIR}/lib/glad")

set(glad_SRC_FILES "${glad_DIR}/src/gl.c")
set(glad_INC_DIRS "${glad_DIR}/include")

list(APPEND
     ${PROJECT_NAME}_SRC_FILES ${glad_SRC_FILES})
list(APPEND
     ${PROJECT_NAME}_INC_DIRS ${glad_INC_DIRS})
