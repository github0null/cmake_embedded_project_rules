
#
# use_repath_for_macro__FILE__
#
# @brief Use relative path to override __FILE__ C macro for source files.
#
# @param[in] target. target name 
#
function(use_repath_for_macro__FILE__ target)
    get_target_property(sources_list "${target}" SOURCES)
    message(STATUS "override source macro '__FILE__' for target '${target}':")
    foreach(src_file ${sources_list})
        get_property(all_defs SOURCE "${src_file}" PROPERTY COMPILE_DEFINITIONS)
        string(REPLACE "${PROJECT_SOURCE_DIR}/" "" repath ${src_file})
        set(macro__FILE__ "__FILE__=\"${repath}\"")
        message(STATUS " - for source: '${src_file}' -> '${macro__FILE__}'")
        list(APPEND all_defs ${macro__FILE__})
        set_property(SOURCE "${src_file}" PROPERTY COMPILE_DEFINITIONS ${all_defs})
    endforeach()
endfunction()
