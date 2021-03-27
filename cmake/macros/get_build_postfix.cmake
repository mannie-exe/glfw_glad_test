

include_guard()

string(FIND ${CMAKE_GENERATOR} "Visual Studio" GEN_FOR_MSVC)
if (NOT (GEN_FOR_MSVC EQUAL -1))
  if (NOT ${CMAKE_BUILD_TYPE})
    set(CMAKE_BUILD_TYPE Debug)
  endif()

  set(BUILD_POSTFIX ${CMAKE_BUILD_TYPE})
endif()
