# Name of the target
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR cortex-m0plus)

set(MCPU_FLAGS "--cpu Cortex-M0+")
set(VFP_FLAGS "")

include(${CMAKE_CURRENT_LIST_DIR}/toolchain.cmake)
