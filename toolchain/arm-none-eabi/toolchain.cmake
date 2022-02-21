# Toolchain settings
set(CMAKE_C_COMPILER    arm-none-eabi-gcc)
set(CMAKE_CXX_COMPILER  arm-none-eabi-g++)
set(CMAKE_ASM_COMPILER  arm-none-eabi-gcc)
set(CMAKE_LINKER        arm-none-eabi-gcc)
set(CMAKE_AR            arm-none-eabi-ar)
set(CMAKE_OBJCOPY       arm-none-eabi-objcopy)
set(CMAKE_OBJDUMP       arm-none-eabi-objdump)

set(CMAKE_C_COMPILER_WORKS TRUE)
set(CMAKE_CXX_COMPILER_WORKS TRUE)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

set(CMAKE_EXECUTABLE_SUFFIX     .elf)
set(CMAKE_EXECUTABLE_SUFFIX_C   .elf)
set(CMAKE_EXECUTABLE_SUFFIX_CXX .elf)
set(CMAKE_EXECUTABLE_SUFFIX_ASM .elf)

# this makes the test compiles use static library option so that we don't need to pre-set linker flags and scripts
#set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

set(CMAKE_C_FLAGS   "${MCPU_FLAGS} ${VFP_FLAGS} -fdata-sections -ffunction-sections" CACHE INTERNAL "c compiler flags")
set(CMAKE_CXX_FLAGS "${MCPU_FLAGS} ${VFP_FLAGS} -fdata-sections -ffunction-sections -fno-rtti -fno-exceptions" CACHE INTERNAL "cxx compiler flags")
set(CMAKE_ASM_FLAGS "${MCPU_FLAGS} ${VFP_FLAGS} -x assembler-with-cpp" CACHE INTERNAL "asm compiler flags")
set(CMAKE_EXE_LINKER_FLAGS "${MCPU_FLAGS} ${LD_FLAGS} ${SPEC_FLAGS} -Wl,--print-memory-usage -Wl,--gc-sections" CACHE INTERNAL "exe link flags")

SET(CMAKE_C_FLAGS_DEBUG "-Og -g -ggdb3" CACHE INTERNAL "c debug compiler flags")
SET(CMAKE_CXX_FLAGS_DEBUG "-Og -g -ggdb3" CACHE INTERNAL "cxx debug compiler flags")
SET(CMAKE_ASM_FLAGS_DEBUG "-g -ggdb3" CACHE INTERNAL "asm debug compiler flags")

SET(CMAKE_C_FLAGS_RELEASE "-O3" CACHE INTERNAL "c release compiler flags")
SET(CMAKE_CXX_FLAGS_RELEASE "-O3" CACHE INTERNAL "cxx release compiler flags")
SET(CMAKE_ASM_FLAGS_RELEASE "" CACHE INTERNAL "asm release compiler flags")

#
# some utility functions
#
function(output_binary_files target_name)
    add_custom_command(TARGET "${target_name}" POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E echo "output hex, bin ..."
        COMMAND ${CMAKE_OBJCOPY} -O ihex   "${target_name}.elf" "${target_name}.hex"
        COMMAND ${CMAKE_OBJCOPY} -O binary "${target_name}.elf" "${target_name}.bin"
        WORKING_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}
        VERBATIM)
endfunction()
