

include_guard(GLOBAL)

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
