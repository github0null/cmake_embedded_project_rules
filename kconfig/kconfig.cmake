
function(kconfig_include CONFIG_FILE)

    set(options)
    set(oneValueArgs OUTPUT_DIRECTORY)
    set(multiValueArgs)
    cmake_parse_arguments(_ "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    if("${CONFIG_FILE}_" STREQUAL "_")
        set(CONFIG_FILE "${CMAKE_CURRENT_LIST_DIR}/.config")
    endif()

    if("${__OUTPUT_DIRECTORY}_" STREQUAL "_")
        set(__OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR})
    endif()

    file(READ "${CONFIG_FILE}" _kconfig_cont)
    

endfunction()
