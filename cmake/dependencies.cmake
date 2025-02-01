file(
  DOWNLOAD
  https://github.com/cpm-cmake/CPM.cmake/releases/download/v0.40.2/CPM.cmake
  ${CMAKE_CURRENT_BINARY_DIR}/cmake/CPM.cmake
  EXPECTED_HASH SHA256=c8cdc32c03816538ce22781ed72964dc864b2a34a310d3b7104812a5ca2d835d
)
include(${CMAKE_CURRENT_BINARY_DIR}/cmake/CPM.cmake)

CPMAddPackage("gh:buildingcpp/include#main")

set(WORK_CONTRACT_DEPENDENCIES include)

if (WORK_CONTRACT_BUILD_BENCHMARK)
  CPMAddPackage("gh:fmtlib/fmt#master")
  CPMAddPackage("gh:cameron314/concurrentqueue#master")
  CPMAddPackage("gh:erez-strauss/lockfree_mpmc_queue#master")
  CPMAddPackage("gh:google/googletest#main")

  set(CMAKE_POLICY_DEFAULT_CMP0077 NEW)
  set(TBB_BUILD_TESTS OFF)
  set(TBB_BUILD_SHARED OFF)
  set(TBB_BUILD_STATIC ON)

  CPMAddPackage("gh:wjakob/tbb#master")
endif(WORK_CONTRACT_BUILD_BENCHMARK)

if (WORK_CONTRACT_BUILD_TESTS)
endif()

