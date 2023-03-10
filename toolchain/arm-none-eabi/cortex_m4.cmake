# Name of the target
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR cortex-m4)

if("${MCU_MFPU_TYPE}" STREQUAL "none")
    set(VFPU_FLAGS "-mfloat-abi=soft")
elseif("${MCU_MFPU_TYPE}" STREQUAL "sp")
    set(VFPU_FLAGS "-mfpu=fpv4-sp-d16 -mfloat-abi=hard")
else()
    set(VFPU_FLAGS "-mfpu=fpv4-sp-d16 -mfloat-abi=softfp")
endif()

message(STATUS "MCU VFP Mode: ${VFPU_FLAGS}")

set(MCPU_FLAGS "-mthumb -mcpu=cortex-m4")

if(NOT NO_SPEC_FLAGS)
    set(SPEC_FLAGS "--specs=nano.specs --specs=nosys.specs")
endif()

include(${CMAKE_CURRENT_LIST_DIR}/toolchain.cmake)
