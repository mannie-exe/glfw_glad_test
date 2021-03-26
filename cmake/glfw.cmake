

include_guard()
include("cmake/macros/get_down.cmake")

set(GLFW_BUILD_DOCS     OFF CACHE BOOL
    "Build the GLFW documentation"    FORCE)

set(GLFW_BUILD_EXAMPLES OFF CACHE BOOL
    "Build the GLFW example programs" FORCE)

set(GLFW_BUILD_TESTS    OFF CACHE BOOL
    "Build the GLFW test programs"    FORCE)

set(GLFW_INSTALL        OFF CACHE BOOL
    "Generate installation target"    FORCE)

set(BUILD_SHARED_LIBS   ON  CACHE BOOL
    "Build shared libraries"          FORCE)

get_down("glfw"
         "https://github.com/glfw/glfw.git"
         "3.3.3"
         ON)

set(glfw_INC_DIRS "${glfw_SOURCE_DIR}/include")
set(glfw_CMPL_DEFS "GLFW_INCLUDE_NONE")
set(glfw_LNK_DIRS
    "${glfw_BINARY_DIR}/${BUILD_POSTFIX}/src")
set(glfw_LNK_LIBS "glfw3dll")
set(glfw_ARTIFACTS "${glfw_LNK_DIRS}/glfw3.dll")

list(APPEND
     ${PROJECT_NAME}_INC_DIRS ${glfw_INC_DIRS})
list(APPEND
     ${PROJECT_NAME}_CMPL_DEFS ${glfw_CMPL_DEFS})
list(APPEND
     ${PROJECT_NAME}_LNK_DIRS ${glfw_LNK_DIRS})
list(APPEND
     ${PROJECT_NAME}_LNK_LIBS ${glfw_LNK_LIBS})
list(APPEND
     ${PROJECT_NAME}_CPY_ARTIFACTS ${glfw_ARTIFACTS})
