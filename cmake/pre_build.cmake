

include_guard()
include("cmake/macros/get_xxd.cmake")

foreach(_shader ${${PROJECT_NAME}_GLSL_FILES})
  cmake_path(GET _shader STEM LAST_ONLY _shader_NAME)
  cmake_path(GET _shader EXTENSION LAST_ONLY _shader_EXT)
  string(REPLACE "." "" _shader_EXT ${_shader_EXT})

  cmake_path(GET _shader PARENT_PATH _shader_XXD_WDIR)
  cmake_path(GET _shader_XXD_WDIR PARENT_PATH _shader_XXD_WDIR)

  cmake_path(SET _shader_XXD_INPUT
             "shaders/${_shader_NAME}.${_shader_EXT}")
  cmake_path(SET _shader_XXD_OUTPUT
             "${PROJECT_SOURCE_DIR}/include/shaders_${_shader_NAME}_${_shader_EXT}.h")

  add_custom_command(
    TARGET ${PROJECT_NAME} PRE_BUILD
    COMMAND ${XXD} -i
    ${_shader_XXD_INPUT}
    ${_shader_XXD_OUTPUT}
    WORKING_DIRECTORY
    ${_shader_XXD_WDIR}
    COMMENT
    "Binary <- GLSL (xxd): include/${_shader_NAME}.h <- ${_shader_XXD_INPUT}"
  )
endforeach()

# foreach(_image ${${PROJECT_NAME}_IMAGE_FILES})
#   cmake_path(GET _image STEM LAST_ONLY _image_NAME)
#   cmake_path(GET _image EXTENSION LAST_ONLY _image_EXT)
#   string(REPLACE "." "" _image_EXT ${_image_EXT})

#   cmake_path(GET _image PARENT_PATH _image_XXD_WDIR)
#   cmake_path(GET _image_XXD_WDIR PARENT_PATH _image_XXD_WDIR)

#   cmake_path(SET _image_XXD_INPUT
#              "images/${_image_NAME}.${_image_EXT}")
#   cmake_path(SET _image_XXD_OUTPUT
#              "${PROJECT_SOURCE_DIR}/include/images_${_image_NAME}_${_image_EXT}.h")

#   message(STATUS "${_image_XXD_INPUT} <- ${_image_XXD_OUTPUT}")

#   add_custom_command(
#     TARGET ${PROJECT_NAME} PRE_BUILD
#     COMMAND ${XXD} -i
#     ${_image_XXD_INPUT}
#     ${_image_XXD_OUTPUT}
#     WORKING_DIRECTORY
#     ${_image_XXD_WDIR}
#     COMMENT
#     "Binary <- Image (xxd): include/${_image_NAME}.h <- ${_image_XXD_INPUT}"
#   )
# endforeach()
