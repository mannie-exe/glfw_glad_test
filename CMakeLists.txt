cmake_minimum_required(VERSION 3.14)
include("cmake/macros/get_build_postfix.cmake")
include("cmake/macros/print_all.cmake")



project(glfw_glad_test VERSION 0.1 LANGUAGES C)
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED True)



file(GLOB_RECURSE
     ${PROJECT_NAME}_GLSL_FILES "src/shader/**.glsl")

# file(GLOB_RECURSE
#      ${PROJECT_NAME}_IMAGE_FILES_BUFF "src/image/**.jpg")
# list(APPEND ${PROJECT_NAME}_IMAGE_FILES
#      ${${PROJECT_NAME}_IMAGE_FILES_BUFF})
# file(GLOB_RECURSE
#      ${PROJECT_NAME}_IMAGE_FILES_BUFF "src/image/**.jpeg")
# list(APPEND ${PROJECT_NAME}_IMAGE_FILES
#      ${${PROJECT_NAME}_IMAGE_FILES_BUFF})
# file(GLOB_RECURSE
#      ${PROJECT_NAME}_IMAGE_FILES_BUFF "src/image/**.png")
# list(APPEND ${PROJECT_NAME}_IMAGE_FILES
#      ${${PROJECT_NAME}_IMAGE_FILES_BUFF})

include("cmake/pre_build.cmake")



include("cmake/c-vector.cmake")
include("cmake/mathc.cmake")
include("cmake/tinyobjloader-c.cmake")
include("cmake/glad.cmake")
include("cmake/glfw.cmake")

list(APPEND
     ${PROJECT_NAME}_SRC_FILES "src/main.c")
list(APPEND ${PROJECT_NAME}_INC_DIRS
     ${${PROJECT_NAME}_GENERATED_INCLUDES_DIR}
     "include")
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

add_dependencies(${PROJECT_NAME}
                 ${${PROJECT_NAME}_PRE_BUILD_TARGETS})



include("cmake/post_build.cmake")
