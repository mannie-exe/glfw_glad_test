

include_guard()
include("cmake/macros/get_down.cmake")

get_down("c_vector"
         "https://github.com/eteran/c-vector.git"
         "origin/master"
         ON)

set(c_vector_INC_DIRS ${c_vector_SOURCE_DIR})
set(c_vector_LNK_LIBS "c-vector")

list(APPEND
     ${PROJECT_NAME}_INC_DIRS ${c_vector_INC_DIRS})
list(APPEND
     ${PROJECT_NAME}_LNK_LIBS ${c_vector_LNK_LIBS})
