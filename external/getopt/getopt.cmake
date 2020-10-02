get_filename_component(install_prefix "${CMAKE_CURRENT_LIST_DIR}" ABSOLUTE)

if(WIN32)
    add_library(ext::getopt SHARED IMPORTED)
    set_target_properties(ext::getopt PROPERTIES 
        IMPORTED_LOCATION "${install_prefix}/dll/getopt.dll"
        IMPORTED_IMPLIB "${install_prefix}/dll/getopt.lib"
        INTERFACE_INCLUDE_DIRECTORIES "${install_prefix}/include")
endif()