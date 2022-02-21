# Name of the target
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR cortex-m7)

if("${MCU_MFPU_TYPE}" STREQUAL "none")
    set(MCPU_FLAGS "--cpu Cortex-M7 --fpu=SoftVFP")
elseif("${MCU_MFPU_TYPE}" STREQUAL "sp")
    set(MCPU_FLAGS "--cpu Cortex-M7.fp.sp")
elseif("${MCU_MFPU_TYPE}" STREQUAL "dp")
    set(MCPU_FLAGS "--cpu Cortex-M7.fp.dp")
else()
    set(MCPU_FLAGS "--cpu Cortex-M7.fp.dp")
endif()

message(STATUS "MCU VFP Mode: ${MCPU_FLAGS}")

include(${CMAKE_CURRENT_LIST_DIR}/toolchain.cmake)
