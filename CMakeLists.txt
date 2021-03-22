cmake_minimum_required(VERSION 3.14)
include(FetchContent)



project(glfw_glad_test VERSION 0.1 LANGUAGES C)
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED True)



FetchContent_Declare(
  glfw
  GIT_REPOSITORY https://github.com/glfw/glfw.git
  GIT_TAG        3.3.3
)

set(GLFW_BUILD_DOCS     OFF CACHE BOOL "" FORCE)
set(GLFW_BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)
set(GLFW_BUILD_TESTS    OFF CACHE BOOL "" FORCE)
set(GLFW_INSTALL        OFF CACHE BOOL "" FORCE)
set(BUILD_SHARED_LIBS   ON  CACHE BOOL "" FORCE)

FetchContent_MakeAvailable(glfw)



add_executable(${PROJECT_NAME} ./src/main.c)
target_include_directories(${PROJECT_NAME} PRIVATE ${glfw_SOURCE_DIR}/include)
target_link_directories(${PROJECT_NAME} PRIVATE ${glfw_BINARY_DIR}/src)
target_link_libraries(${PROJECT_NAME} PRIVATE glfw3dll)



if(${WIN32})

  set(glfw3_DLL ${glfw_BINARY_DIR})

  string(FIND ${CMAKE_GENERATOR} "Visual Studio" GEN_IS_VS)
  if (NOT ${GEN_IS_VS} EQUAL -1)
    string(CONCAT glfw3_DLL ${glfw3_DLL} "/" ${CMAKE_BUILD_TYPE})
  endif()

  string(CONCAT glfw3_DLL ${glfw3_DLL} "/src/glfw3.dll")

  add_custom_command(
    TARGET ${PROJECT_NAME}
    POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
    ${glfw3_DLL} $<TARGET_FILE_DIR:${PROJECT_NAME}>)

endif()



macro(print_all)
  if (${ARGC} GREATER 1 AND ${ARGC} LESS 4)
    message(STATUS "print_all(${ARGV0})----------")

    if (${ARGC} EQUAL 3)
      get_property(_vars ${ARGV1} ${ARGV2} PROPERTY ${ARGV0})
    else()
      get_property(_vars ${ARGV1} PROPERTY ${ARGV0})
    endif()

    foreach (_var ${_vars})
      message(STATUS "${_var}=${${_var}}")
    endforeach()

    message(STATUS "print_all(${ARGV0})----------")
  else()
  endif()
endmacro()

# print_all(VARIABLES DIRECTORY)
