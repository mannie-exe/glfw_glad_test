

include_guard()
include("cmake/macros/get_xxd.cmake")

cmake_path(SET ${PROJECT_NAME}_GENERATED_INCLUDES_DIR NORMALIZE
           "${PROJECT_BINARY_DIR}/gen_include")

foreach(_shader ${${PROJECT_NAME}_GLSL_FILES})
  cmake_path(GET _shader STEM LAST_ONLY _shader_NAME)
  cmake_path(GET _shader EXTENSION LAST_ONLY _shader_EXT)
  string(REPLACE "." "" _shader_EXT ${_shader_EXT})

  cmake_path(GET _shader PARENT_PATH _shader_XXD_WORKING_DIR)
  cmake_path(GET _shader_XXD_WORKING_DIR PARENT_PATH _shader_XXD_WORKING_DIR)
  set(_shader_OUTPUT_FILENAME "shader_${_shader_NAME}_${_shader_EXT}.h")

  cmake_path(SET _shader_XXD_INPUT NORMALIZE
             "shader/${_shader_NAME}.${_shader_EXT}")
  cmake_path(SET _shader_XXD_OUTPUT NORMALIZE
             "${${PROJECT_NAME}_GENERATED_INCLUDES_DIR}/${_shader_OUTPUT_FILENAME}")

  add_custom_command(
    OUTPUT ${_shader_XXD_OUTPUT}
    COMMAND ${XXD} -i
    ${_shader_XXD_INPUT} ${_shader_XXD_OUTPUT}
    WORKING_DIRECTORY ${_shader_XXD_WORKING_DIR}
    COMMENT
    "Binary <- GLSL (xxd): ${_shader_NAME}.h <- ${_shader_XXD_INPUT}"
  )

  list(APPEND ${PROJECT_NAME}_GENERATED_SHADER_HEADERS
       ${_shader_XXD_OUTPUT})
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


add_custom_target(${PROJECT_NAME}_GENERATE_SHADERS_TARGET
                  COMMENT "Generating C headers from GLSL shaders"
                  DEPENDS ${${PROJECT_NAME}_GENERATED_SHADER_HEADERS})

list(APPEND ${PROJECT_NAME}_PRE_BUILD_TARGETS
     ${PROJECT_NAME}_GENERATE_SHADERS_TARGET)
