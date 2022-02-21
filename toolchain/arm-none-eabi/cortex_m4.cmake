# Name of the target
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR cortex-m4)

if("${MCU_MFPU_TYPE}" STREQUAL "none")
    set(VFP_FLAGS "-mfloat-abi=soft")
elseif("${MCU_MFPU_TYPE}" STREQUAL "sp")
    set(VFP_FLAGS "-mfpu=fpv4-sp-d16 -mfloat-abi=hard")
else()
    set(VFP_FLAGS "-mfpu=fpv4-sp-d16 -mfloat-abi=softfp")
endif()

message(STATUS "MCU VFP Mode: ${VFP_FLAGS}")

set(MCPU_FLAGS "-mthumb -mcpu=cortex-m4")
set(SPEC_FLAGS "--specs=nano.specs --specs=nosys.specs")
# set(LD_FLAGS "-nostartfiles")

include(${CMAKE_CURRENT_LIST_DIR}/toolchain.cmake)
