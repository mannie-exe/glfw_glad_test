

include_guard()
include("cmake/macros/get_down.cmake")

get_down("mathc"
         "https://github.com/felselva/mathc.git"
         "v2019.02.16.0")

cmake_path(SET mathc_SRC_FILES NORMALIZE
           "${mathc_SOURCE_DIR}/mathc.c")
cmake_path(SET mathc_INC_DIRS NORMALIZE
           ${mathc_SOURCE_DIR})

list(APPEND
     ${PROJECT_NAME}_SRC_FILES ${mathc_SRC_FILES})
list(APPEND
     ${PROJECT_NAME}_INC_DIRS ${mathc_INC_DIRS})
