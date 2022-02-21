
get_filename_component(FLASHER_NAME ${CMAKE_CURRENT_LIST_FILE} NAME_WE)
set(CONFIG_TEMPLATE_PATH "${CMAKE_CURRENT_LIST_DIR}/jlink.cmds.in")

function(output_flash_command target_name)

    set(HEX_FILE_PATH "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${target_name}.hex")
    set(CMD_FILE_PATH "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/jlink.cmds")
    configure_file("${CONFIG_TEMPLATE_PATH}" "${CMD_FILE_PATH}")
    
    if(CMAKE_HOST_WIN32)
        add_custom_command(TARGET "${target_name}" POST_BUILD
            COMMAND ${CMAKE_COMMAND} -E echo "output '${FLASHER_NAME}' flasher command for '${FLASHER_MCPU_NAME}' ..."
            COMMAND ${CMAKE_COMMAND} -E echo "@echo off" > flash.bat
            COMMAND ${CMAKE_COMMAND} -E echo "jlink -ExitOnError 1 -AutoConnect 1 -Device ${FLASHER_MCPU_NAME} -If SWD -Speed 8000 -CommandFile \"${CMD_FILE_PATH}\"" >> flash.bat
            WORKING_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}
            VERBATIM)
    else()
        add_custom_command(TARGET "${target_name}" POST_BUILD
            COMMAND ${CMAKE_COMMAND} -E echo "output '${FLASHER_NAME}' flasher command for '${FLASHER_MCPU_NAME}' ..."
            COMMAND ${CMAKE_COMMAND} -E echo "jlink -ExitOnError 1 -AutoConnect 1 -Device ${FLASHER_MCPU_NAME} -If SWD -Speed 8000 -CommandFile \"${CMD_FILE_PATH}\"" > flash.sh
            WORKING_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}
            VERBATIM)
    endif()
endfunction()
