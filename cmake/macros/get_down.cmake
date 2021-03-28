

include_guard(GLOBAL)
include(FetchContent)

macro(get_down)

  if (NOT ((${ARGC} EQUAL 3) OR ((${ARGC} EQUAL 4))))
    message(FATAL_ERROR
            "get_down: (name, url, tag, [auto: false]) <- parameter list (items: 3 [+1])")
  endif()

  string(TOLOWER ${ARGV0} down_NAME)
  set(down_REPO ${ARGV1})
  set(down_TAG ${ARGV2})

  if (${ARGC} EQUAL 4)
    set(down_TYPE ${ARGV3})
  else()
    set(down_TYPE OFF)
  endif()

  FetchContent_Declare(
    ${down_NAME}
    GIT_REPOSITORY  ${down_REPO}
    GIT_TAG         ${down_TAG}
  )

  if (${ARGC} EQUAL 3 OR (NOT ${ARGV3}))

    FetchContent_GetProperties(${down_NAME})
    if (NOT ${${down_NAME}_POPULATED})
      FetchContent_Populate(${down_NAME})
    endif()

  else()

    FetchContent_MakeAvailable(${down_NAME})

  endif()

endmacro()
