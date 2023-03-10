# Name of the target
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR ck804ef)

set(MCPU_FLAGS "-mcpu=ck804ef")
set(VFPU_FLAGS "-mhard-float")

include(${CMAKE_CURRENT_LIST_DIR}/toolchain.cmake)
