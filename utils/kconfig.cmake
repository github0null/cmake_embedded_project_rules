#
# kconfig_include
#
# @brief include kconfig's '.config' file
#
# @param[in, optional] OUTPUT_DIRECTORY (single value) config.cmake output folder.
# @param[in, optional] NOT_INCLUDE (options) only generate config.cmake, not include it.
#
function(kconfig_include CONFIG_FILE)

    set(options NOT_INCLUDE)
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
    string(REPLACE "\n" ";" _kconfig_list ${_kconfig_cont})

    set(_cmake_cfg_li)

    foreach(_cfg_expr ${_kconfig_list})
        if(${_cfg_expr} MATCHES "^[ ]*#")
            continue()
        endif()
        string(REGEX REPLACE "([A-Za-z0-9_]+)=(.*)" "set(\\1 \\2)" _cmake_cfg_val ${_cfg_expr})
        list(APPEND _cmake_cfg_li ${_cmake_cfg_val})
    endforeach()

    file(WRITE "${__OUTPUT_DIRECTORY}/config.cmake" "#\n# generated from '${CONFIG_FILE}'\n#\n")

    string(REPLACE ";" "\n" _cmake_cfg_cont "${_cmake_cfg_li}")
    file(APPEND "${__OUTPUT_DIRECTORY}/config.cmake" ${_cmake_cfg_cont})

    if(NOT __NOT_INCLUDE)
        message(STATUS "Include kconfig: '${__OUTPUT_DIRECTORY}/config.cmake'")
        include("${__OUTPUT_DIRECTORY}/config.cmake")
    endif()

endfunction()
