cmake_minimum_required(VERSION 3.14)
include("cmake/build_postfix.cmake")
include("cmake/macros/print_all.cmake")



project(glfw_glad_test VERSION 0.1 LANGUAGES C)
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED True)

include("cmake/mathc.cmake")
include("cmake/tinyobjloader-c.cmake")
include("cmake/glad.cmake")
include("cmake/glfw.cmake")

list(APPEND
     ${PROJECT_NAME}_SRC_FILES
     "./src/main.c")
list(APPEND ${PROJECT_NAME}_INC_DIRS "./include")
list(APPEND ${PROJECT_NAME}_LNK_DIRS
     ${PROJECT_BINARY_DIR})

# print_all(VARIABLES DIRECTORY)

add_executable(${PROJECT_NAME}
               ${${PROJECT_NAME}_SRC_FILES})
target_include_directories(${PROJECT_NAME} PRIVATE
                           ${${PROJECT_NAME}_INC_DIRS})
target_compile_definitions(${PROJECT_NAME} PRIVATE
                           ${${PROJECT_NAME}_CMPL_DEFS})
target_link_directories(${PROJECT_NAME} PRIVATE
                        ${${PROJECT_NAME}_LNK_DIRS})
target_link_libraries(${PROJECT_NAME} PRIVATE
                      ${${PROJECT_NAME}_LNK_LIBS})

include("cmake/post_build.cmake")
