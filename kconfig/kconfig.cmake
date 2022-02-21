
function(kconfig_include file_path)

    set(options)
    set(oneValueArgs CONFIG_FILE DIRECTORY)
    set(multiValueArgs)
    cmake_parse_arguments(_ "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

    if("${__CONFIG_FILE}_" STREQUAL "_")
        file(READ "${CMAKE_CURRENT_LIST_DIR}/.config" _kconfig_cont)
    else()
        file(READ "${__CONFIG_FILE}" _kconfig_cont)
    endif()

    

endfunction()
