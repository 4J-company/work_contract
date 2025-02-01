cmake_minimum_required(VERSION 3.5)
set(CMAKE_CXX_STANDARD 20)

project(work_contract)

option(WORK_CONTRACT_BUILD_BENCHMARK "build work contract benchmarks" OFF)
option(WORK_CONTRACT_BUILD_EXAMPLES  "build work contract examples"   OFF)
option(WORK_CONTRACT_BUILD_TESTS     "build work contract tests"      OFF)

# NOTE: replace this with CMakePresets
set(WORK_CONTRACT_CXX_FLAGS ${CMAKE_CXX_FLAGS} -g -Wall -march=native)

if (CMAKE_BUILD_TYPE STREQUAL "Debug")
  set(WORK_CONTRACT_CXX_FLAGS ${WORK_CONTRACT_CXX_FLAGS} -O0)
else()
  set(WORK_CONTRACT_CXX_FLAGS ${WORK_CONTRACT_CXX_FLAGS} -O3)
endif()

include(cmake/dependencies.cmake)

add_library(work_contract src/work_contract_group.cpp)
target_link_libraries(work_contract PUBLIC ${WORK_CONTRACT_DEPENDENCIES})
target_include_directories(work_contract PUBLIC ./include)

if (WORK_CONTRACT_BUILD_EXAMPLES)
  add_subdirectory(examples)
endif()

if (WORK_CONTRACT_BUILD_TESTS)
  add_subdirectory(tests)
endif()
