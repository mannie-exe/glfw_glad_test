
include_guard()

foreach(_artifact ${${PROJECT_NAME}_ARTIFACTS})
  cmake_path(SET _artifact_CPY_OUTPUT NORMALIZE
             "${PROJECT_BINARY_DIR}/${BUILD_POSTFIX}")

  add_custom_command(
    TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
    ${_artifact} ${_artifact_CPY_OUTPUT}
    COMMENT "Copying [glfw->glfw3.dll] to build output"
  )
endforeach()
