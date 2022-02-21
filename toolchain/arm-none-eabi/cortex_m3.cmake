# Name of the target
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR cortex-m3)

set(MCPU_FLAGS "-mthumb -mcpu=cortex-m3")
set(VFP_FLAGS "")
set(SPEC_FLAGS "--specs=nano.specs --specs=nosys.specs")
# set(LD_FLAGS "-nostartfiles")

include(${CMAKE_CURRENT_LIST_DIR}/toolchain.cmake)
