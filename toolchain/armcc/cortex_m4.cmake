# Name of the target
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR cortex-m4)

if("${MCU_MFPU_TYPE}" STREQUAL "none")
    set(MCPU_FLAGS "--cpu Cortex-M4 --fpu=SoftVFP")
elseif("${MCU_MFPU_TYPE}" STREQUAL "sp")
    set(MCPU_FLAGS "--cpu Cortex-M4.fp")
else()
    set(MCPU_FLAGS "--cpu Cortex-M4.fp")
endif()

message(STATUS "MCU VFP Mode: ${MCPU_FLAGS}")

include(${CMAKE_CURRENT_LIST_DIR}/toolchain.cmake)
