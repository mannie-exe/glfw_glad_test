

foreach(_artifact ${${PROJECT_NAME}_CPY_ARTIFACTS})
  add_custom_command(
    TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
    ${_artifact}
    "${PROJECT_BINARY_DIR}/${BUILD_POSTFIX}"
  )
endforeach()
